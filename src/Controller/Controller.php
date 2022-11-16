<?php

namespace App\Controller;

use App\Entity\Article;
use App\Form\ArticleType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/')]
class Controller extends AbstractController
{
    public function __construct(protected ManagerRegistry $registry)
    {
    }

    #[Route('', name: 'home')]
    public function index(): Response
    {
        $articles = $this->registry->getRepository(Article::class)->findA();
        return $this->render('articles/index.html.twig', [
            'articles' => $articles
        ]);
    }

    #[Route('/article/{id}', name: 'article')]
    public function getArticle($id)
    {
        $article = $this->registry->getRepository(Article::class)->find($id);

        return $this->render('articles/article.html.twig', [
            'article' => $article
        ]);
    }

    #[Route('/new', name: 'new')]
    public function newArticle(Request $request)
    {
        $article = new Article();

        $form = $this->createForm(ArticleType::class, $article);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $article = $form->getData();

            $a = $this->registry->getManager();
            $a->persist($article);
            $a->flush();

            return $this->redirectToRoute('home');
        }

        return $this->renderForm('articles/new.html.twig', [
            'form' => $form
        ]);
    }
}
