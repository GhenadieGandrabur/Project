<?php
class EntryPoint
{
    private $route;
    private $routes;

    public function __construct($route, $routes)
    {
        $this->route = $route;
        $this->routes = $routes;
        $this->chekUrl();
    }

    private function chekUrl()
    {
        if($this->route !== strtolower($this->route))
        {
            http_response_code(301);
            header('location:' . strtolower($this->route));
        }
    }
    private function loadtemplate($templateFileName, $variables=[])
    {
        extract($variables);
        ob_start();
        include __DIR__ . '/../templates/' . $templateFileName;
        return ob_get_clean();
    }

  

    public function run()
    {
        $page = $this->routes->callAction($this->route);
        $title = $page['title'];
        if(isset($page['variables'])){
            $output = $this->loadtemplate($page['template'], $page['variables']);            
        }else{
            $output = $this->loadtemplate($page['template']);
        }
        include __DIR__ . '/../templates/layout.html.php';
    }

}