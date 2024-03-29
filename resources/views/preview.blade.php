<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" id="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $scene['name'] }}</title>
    <meta name="keywords" content="微喜帖,微信喜帖,电子喜帖,电子请柬,电子邀请函,电子请帖">
    <meta name="description" content="大喜帖微信电子喜帖让您的邀请更轻松、与从不同。" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/5.8.1/css/all.min.css">
    <link href="{{asset('static/css/preview.css')}}" rel="stylesheet">
</head>
<body>

<div id="app" style='height: 100%;'></div>
<script>var scene = {!! json_encode($scene) !!};</script>

<!-- <script src="//res.wx.qq.com/open/js/jweixin-1.3.2.js"></script> -->
<script src="https://cdn.staticfile.org/jquery/3.3.1/jquery.min.js"></script>
<script src="https://res.wx.qq.com/open/js/jweixin-1.6.0.js"></script>

<script type="text/javascript" src="{{asset('static/js/preview.js')}}"></script>

<script>
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }

    function share_link(link) {
        if (link.indexOf('b=') !== -1) {
            return link.split('?')[0] + '?b=1' + '&bkid=' + getQueryString('bkid');
        }
        else {
            return link.split('?')[0] + '?bkid=' + getQueryString('bkid');
        }
    }

    @if(isWeixin())
        wx.config({!! json_encode(getWXConfig()) !!});
        wx.ready(function () {
            var shareData64 = {
                title: "{{ $scene['name'] }}",
                desc: "{{ $scene['description'] }}",
                imgUrl: "{{ $scene['cover'] }}",
                link: share_link(window.location.href),
            };
            shareData64.title = shareData64.title.replace(/&amp;/ig, "&");
            shareData64.desc = shareData64.desc.replace(/&amp;/ig, "&");
            wx.updateTimelineShareData(shareData64);
            wx.updateAppMessageShareData(shareData64);
        });

        wx.error(function (res) {

        });

        document.addEventListener("WeixinJSBridgeReady", function () {
            var music = document.getElementById('bg_music');
            if (music.paused) {
                music.play();
            }
        }, false);
    @endif

    // document.addEventListener("WeixinJSBridgeReady", function () {
    // 	var music = $(".bgm_btn audio").get(0);
    // 	if (music.paused) {
    // 		music.play();
    // 	}
    // }, false);

    // $(document).one('touchstart', function (e) {
    // 	var music = $(".bgm_btn audio").get(0);
    // 	if (music.paused) {
    // 		music.play();
    // 	}
    // });

</script>


{{--<script>--}}
{{--    var _hmt = _hmt || [];--}}
{{--    (function() {--}}
{{--        var hm = document.createElement("script");--}}
{{--        hm.src = "https://hm.baidu.com/hm.js?6dc89c17eec7efcabfe4bd7aafb5f7c0";--}}
{{--        var s = document.getElementsByTagName("script")[0];--}}
{{--        s.parentNode.insertBefore(hm, s);--}}
{{--    })();--}}
{{--</script>--}}

</body>
</html>
