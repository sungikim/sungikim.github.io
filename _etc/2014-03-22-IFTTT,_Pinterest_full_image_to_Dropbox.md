---
title: "IFTTT, Pinterest full image to Dropbox"
date: "2014-03-22"
---

IFTTT 서비스를 이용해 핀터레스트의 이미지를 다른 곳으로 보내는 방법을 적어본다.

일반적으로 핀터레스트의 이미지를 가져올 수 있는 방법은 feed.rss를 이용하는 것이다. 사용자별 주소는 http://www.pinterest.com/username/feed.rss 이다. 하지만 이 rss 피드에서는 썸네일 이미지만 표시해준다. 그래서 가져올 수 있는 이미지는 썸네일 이미지밖에 없다.

# 1\. 인터넷에서 해결방법 찾아보기

여기저기 인터넷을 뒤져서 그 방법을 찾았다. 하지만 예전 자료라 지금은 실행되지 않는다.  
[http://stackoverflow.com/questions/13441661/rewrite-image-url-in-the-rss-feed-using-yahoo-pipes](http://stackoverflow.com/questions/13441661/rewrite-image-url-in-the-rss-feed-using-yahoo-pipes)  
예전에는 핀터레스트의 썸네일-풀이미지가 끝에 \_b, \_c 등이 붙는 것으로 되어있었나보다. 그래서 yahoo pipe를 이용해 \_b를 \_c로 바꾸는 방법을 알려주고 있다. 그래서, 지금은 어떻게 되어 있을까 찾아봤다.

# 2\. 썸네일 이미지, 풀 이미지의 차이점 찾기

사파리에서 핀터레스트를 열고, 썸네일 이미지의 주소를 찾아보았다.  
`<img src="http://media-cache-ak0.pinimg.com/236x/5f/f3/56/5ff3566d7eed8f6e622a4707d5d41116.jpg" class="pinImg fullBleed loaded" style="height:355px;width:236px;" onload="P.lazy.onImageLoad(this)" alt=" ">`

마찬가지로 같은 이미지의 풀 이미지의 주소를 찾아보았다.  
`<img src="http://media-cache-ak0.pinimg.com/736x/5f/f3/56/5ff3566d7eed8f6e622a4707d5d41116.jpg" class="pinImage" style="height:904px;width:600px;margin:0 auto;padding:40px 0px;" alt=" ">`

두 개의 다른 점. 하위폴더 주소가 236x, 736x 로 되어있는 것을 알 수 있었다. 좋아, 지금은 썸네일과 풀 이미지의 차이가 저 하위폴더 주소다.

# 3\. feed.rss에서 이미지의 주소 찾기

그리고 나서 feed.rss를 들여다보았다.  
`<description>&lt;p&gt;&lt;a href="/pin/186969822004490777/"&gt;&lt;img src="http://media-cache-ak0.pinimg.com/192x/5f/f3/56/5ff3566d7eed8f6e622a4707d5d41116.jpg"&gt;&lt;/a&gt;&lt;/p&gt;&lt;p&gt; &lt;/p&gt;</description>`

feed.rss에서는 192x다. 그럼 최종적으로, feed.rss의 192x 부분을 736x로 변경하면 된다.

# 4\. yahoo pipe를 이용해 feed.rss의 썸네일 주소를 풀 이미지 주소로 변경하기

pipe가 뭐하는 건지는 잘 모르지만, 아까 인터넷에서 찾은 방법을 통해, 똑같이 해보기로 했다. 글에서는 \_b를 \_c로 바꿨지만, 나는 192x를 736x로 바꾸면 된다.

[![pinterest-full-image-pipe](http://sungikim.com/wp-content/uploads/2014/03/pinterest-full-image-pipe.jpg)](http://sungikim.com/wp-content/uploads/2014/03/pinterest-full-image-pipe.jpg)

# 5\. pipe를 IFTTT에 등록해 dropbox에 연동하기

그럼 이제 feed.rss 대신 pipe를 IFTTT에 등록하면 된다. 와! 그리고 조금 응용하면, 핀터레스트의 특정 board도 연동할 수 있다.

[![pipe-IFTTT](http://sungikim.com/wp-content/uploads/2014/03/pipe-IFTTT.jpg)](http://sungikim.com/wp-content/uploads/2014/03/pipe-IFTTT.jpg)
