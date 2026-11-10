Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309018;
	b=Vh3SDjCrrhKTjQiMRqNpWclgS8Ao03MexIzTyjL402eCuD+GK5rPNp14BHEdZwA5PYv0
	 cYDxslLOANtT1ow6c4snnuVr1fBTyj+aOujkK3lMQrmEiClbizJn8lG9xWuAurvdhQG7D
	 kb4cSXHl3HYX0Ox8Oh0IjF/K6xvTJktUW3wjiqznENNtR5ZlIhCpa/QHCg0a3N/74Kwzk
	 n68Z/fR+cYDlR+DPkmWPytAtsKGKwFUGrJie4QEOOSB4pfidlmsrQPhP44u4EJq4uQ9XX
	 cJC7XGO3+4OPOR+mNHELhI4vfruBmieNNquwmqKjF0Yyj7NVV41VX7/gYBAVQ6+YWxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309018;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=t3AJqMEWHhpx+AMF+R+Ii3Bnk4zDc/WZ1pmsb7VjQiw=;
	b=o7oFyQh0QNAi0GeMPNZcMEtKEXkrDMWQLg9QZHJ38YKyWgAP8RnLKEaXISuYKA+VlF3C
	 Anj61F4PYqG8US+fO2YAJX2MbG55MDLBojkRsTCvNo+p0LBBeonz9h/7Xp7Z4+VKF2i/g
	 edhaquep9sFICGcXBcRKxkFHHVddacZAN08bvvtaOTTT7QVBE/lwERjrv7aOKulctpZnK
	 8NzMou/3lIpStQYqaVwn3+pTyiMnhp+wHvD6vj4qQgxG/oSkad8nXVoRpMDGsDJCgJSdY
	 BjL5HNFpNWUUVH/Qcp4nsnv4jCbRP9wAzer4WJcCNr0LRiEJ9dFwgcyXcjghTbUQlcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3F606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA3F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso2423906b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309017; x=1794913817;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t3AJqMEWHhpx+AMF+R+Ii3Bnk4zDc/WZ1pmsb7VjQiw=;
        b=esuEqPH4beJe/me/OlRbQE0as9WE016s5njl2EIFK/1rPsJJj31+X0JL0rpzBZ0BxS
         UtiqVnXfs8psOi9Ogmh+QQeTgo89vFhUbyuXedC7sXA+jJ/R9ycETluSQZBFj+zjAQc4
         bycTF7HBqP56ObOqnEDOxZH6mxgbc2h3RlHOIKjBJ0Km7OjdC0ORtQUgZiBPs6xruYOC
         FSXJCPnlqa16qQp9ciP5w912ZAZfdq/gINlp09fN3RbEUNddpe7AxTZy31ykMNN90khJ
         34T7f+DLK23WyXQRj/u7SzgB4VJNv8nSBPH65yYMUZSAIZ9HOMitQlQi1A2w0LNRDFJd
         tXpQ==
X-Gm-Message-State: APuU4Z9dvpOOa0pgsIhlWtCG7vBIOT1TwNXMTyl/ZEF1VjT8IMOUmgt1
	yTxKWsjucIxr0qms359mh9mnn3shjNPZpXCjVDNgAaxFAUmleWM2TYL8HZETlvBsqWbU/pJOt9k
	2xEMamptto11B31AAqKCtbBhoGbTWl+X/cRL0WjmR+0UeGRKzuFmDxdlGtls=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c12a:b0:545:d05c:7cf8 with SMTP id
 5614622812f47-5683cc93a12mr1541891b6e.34.1794309017469; Tue, 10 Nov 2026
 03:10:17 -0800 (PST)
Date: Tue, 10 Nov 2026 03:10:17 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af2fb99.6fb51460.206670.000c.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
Author: vrpcloudbughunter@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-nfs-1110-b8ee9ef
b8ee9ef99102e2f37d85f07400b555035f7adf82
