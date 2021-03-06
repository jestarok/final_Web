<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
    <title>Instaglam</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Quickly Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- //js -->
    <!-- start-smoth-scrolling -->

    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript">
        $(document).ready( function (){
            var variable = "${sesion}";
            $('.logouts').hide();
            $('.follow').hide();
            $('#post').hide();

            if(variable ==="true") {

                $('.logins').hide();
                $('.logouts').show();

            }
            else {
                $('.logins').show();
                $('.logouts').hide();
            }
        });
    </script>
</head>

<body>
<!-- banner-body -->
<div class="banner-body abt">
    <div class="container">
        <!-- header -->
        <#include "navbar.ftl">
        <!-- //header -->
        <!-- single -->
        <div class="single-page-artical">
            <#if articulo??>
                <div class="artical-content">
                    <h3>By: ${articulo.getAutor().getUsername()} | ${articulo.getAutor().getNombre()} </h3>

                    <img class="img-responsive" src="${articulo.getFoto()}" alt=" " <#--height="500" width="500"-->/>
                    <p>${articulo.getDescripcion()}</p>
                </div>
                <div class="artical-links">
                    <ul>
                        <li><small> </small><span> ${articulo.getFecha()}</span></li>
                        <#if sesion??>
                            <#if sesion != "false">
                                <#if dioLike??>
                                    <li>
                                        <a href="/articulos/${id}/dlikeA">
                                            <small class="admin"> </small>
                                            <span style="color: orangered;">Likes</span>
                                            <span style="color: orangered;" >${totalLA}</span>

                                        </a>
                                    </li>
                                <#else>
                                    <li>
                                        <a href="/articulos/${id}/likeA">
                                            <small class="admin"> </small>
                                            <span>Likes</span>
                                            <span>${totalLA}</span>
                                        </a>
                                    </li>
                                </#if>


                            <#else>
                                <li>
                                    <a>
                                        <small class="admin"> </small>
                                        <span>Likes</span>
                                        <span>${totalLA}</span>
                                    </a>
                                </li>
                            </#if>
                        </#if>
                        <li class="modificar">
                            <a href="#" data-toggle="modal" data-target="#login-modal"><span>Editar</span></a>
                        </li>
                        <li class="modificar">
                            <form action ="/" method = "post">
                                <input type = "hidden" name = "eliminarArt" value = "true">
                                <a href="#"><button class="btn btn-default" style="background: none;border: none;margin: 0;padding: 0;" name="elim" value="${articulo.getId()}">Eliminar</button></a>
                            </form>
                        </li>
                        <li><a href="#"></a></li>
                    </ul>
                </div>

                <script>
                    $(document).ready(function (d) {
                        $('.modificar').hide();
                        <#if conectado??>
                            if('${conectado.getNombre()}' === '${articulo.getAutor().getNombre()}'){
                                $('.modificar').show();
                            }
                        </#if>
                    })
                </script>

                <div class="comment-grid-top">
                    <h3>Comentarios</h3>
                    <#if comentarios??>
                        <#list comentarios as coment>
                            <div class="comments-top-top">
                                <div class="top-comment-left">
                                    <a href="#"><img class="img-responsive" src="images/co.png" alt=""></a>
                                </div>
                                <div class="top-comment-right">
                                    <ul>
                                        <li><span class="left-at"><a>${coment.getAutor().getNombre()} </a></span></li>
                                        <li><span class="right-at">---</span></li>

                                        <script type="text/javascript">
                                            $(document).ready(function (d) {
                                                $('#este').hide();
                                                <#if conectado??>
                                                    if('${conectado.getNombre()}' === '${coment.getAutor().getNombre()}' || '${conectado.getNombre()}' === '${articulo.getAutor().getNombre()}'){
                                                        $('#este').show();
                                                    }
                                                </#if>
                                            })
                                        </script>
                                        <li id="este">
                                            <form action="/articulos" method="post" >
                                                <input type ="hidden" name = "eliminarComentarioV" value = "${coment.getId()}">
                                                <input type="hidden" name="idArticulo" value="${id}">
                                                <a class="reply"><input name = "eliminarComentario" style="background: none;border: none;margin: 0;padding: 0;" type="submit" value = "Eliminar"></a>
                                            </form>
                                        </li>
                                    </ul>
                                    <p>${coment.getComentario()}</p>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </#list>
                    </#if>
                </div>
                <#if sesion??>
                    <#if sesion != "false">
                        <div class="artical-commentbox">
                            <h3>Deja un comentario:</h3>
                            <div class="table-form">
                                <form method="post" action="/articulos">
                                    <textarea name="comentario" placeholder="Comentario"></textarea>
                                    <input type="hidden" name="idArticulo" value="${id}">
                                    <input type="submit" value="Listo!">
                                </form>
                            </div>
                        </div>
                    </#if>
                </#if>
            </#if>

        </div>
        <!-- single -->
    </div>
</div>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container">
            <h1>Editando Articulo</h1><br>
            <form action="/articulos" method="post" enctype="multipart/form-data">
                <img src="${articulo.getFoto()}" height="500" width="500" class="img-responsive">
                <input type = "hidden" name = "editarArt" value = "true">
                <input type = "hidden" name = "foto" value ="${articulo.getFoto()}">
                <input type = "hidden" name = "idArticulo" value = "${articulo.getId()}">
            <#--<input type="text" name="titulo" value="${articulo.getTitulo()}">-->
                <textarea type="text-area" style="height: 150px;" class="form-control" row="4" name="area-articulo" >${articulo.getDescripcion()}</textarea>
                <br>
                <textarea type="tags-area" style="height: 50px;" class="form-control" row="4" name="area-etiqueta" ><#list etiquetas as etiqs>${etiqs.getEtiqueta()}, </#list></textarea>
                <br>
                <input type="submit" name="login" class="login loginmodal-submit" value="Aceptar">
            </form>

        </div>
    </div>
</div>


<!-- footer -->
<div class="footer">
    <div class="container">
        <div class="footer-grids">
            <div class="col-md-3 footer-grid">
                <h3>cumque nihil impedit</h3>
                <div class="footer-grd-left">
                    <img src="images/11.jpg" class="img-responsive" alt=" " />
                </div>
                <div class="footer-grd-left">
                    <p>Nam libero tempore, cum
                        soluta nobis est eligendi optio cumque nihil impedit quo minus
                        id quod maxime placeat facere possimus, omnis voluptas assumenda
                        est, omnis dolor repellendus</p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="col-md-3 footer-grid">
                <h3>voluptas assumenda</h3>
                <ul>
                    <li><a href="#">doloribus asperiores</a></li>
                    <li><a href="#">Itaque earum rerum</a></li>
                    <li><a href="#">deserunt mollitia</a></li>
                    <li><a href="#">facilis est et expedita</a></li>
                    <li><a href="#">occaecati cupiditate</a></li>
                    <li><a href="#">deserunt mollitia laborum</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grid">
                <h3>deserunt mollitia</h3>
                <ul>
                    <li><a href="#">doloribus asperiores</a></li>
                    <li><a href="#">Itaque earum rerum</a></li>
                    <li><a href="#">deserunt mollitia</a></li>
                    <li><a href="#">facilis est et expedita</a></li>
                    <li><a href="#">occaecati cupiditate</a></li>
                    <li><a href="#">deserunt mollitia laborum</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-grid">
                <h3>Flckr Posts</h3>
                <div class="footer-grd">
                    <img src="images/7.jpg" class="img-responsive" alt=" " />
                </div>
                <div class="footer-grd">
                    <img src="images/8.jpg" class="img-responsive" alt=" " />
                </div>
                <div class="footer-grd">
                    <img src="images/9.jpg" class="img-responsive" alt=" " />
                </div>
                <div class="clearfix"> </div>
                <div class="footer-grd">
                    <img src="images/10.jpg" class="img-responsive" alt=" " />
                </div>
                <div class="footer-grd">
                    <img src="images/7.jpg" class="img-responsive" alt=" " />
                </div>
                <div class="footer-grd">
                    <img src="images/8.jpg" class="img-responsive" alt=" " />
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="footer-bottom">
    <div class="container">
        <p>© 2015 Quickly. All rights reserved | Design by <a href="http://w3layouts.com/"> W3layouts</a></p>
    </div>
</div>
<!-- //footer -->
<!-- for bootstrap working -->
<script src="js/bootstrap.js"> </script>
<!-- //for bootstrap working -->
</body>
</html>