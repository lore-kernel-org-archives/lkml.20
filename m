Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140026;
	b=dQibbtOFOcw4LnsJEVCLRaY6Uq01Di95ivLuqOFaLKlSx+37sxs7rLt4c8aHk6+3uUOv
	 QQDZsEnNl6ysL9ylL8WaQRsKRfnSg5CcATl/1FMOcFr7Qv6xsfwMTZ41qd1yTI6/5UDrf
	 agM35dANfzLSVafRj2s2Z2bo87AHJkSe+9cm9Fw7yxgVp/eRfzHmgEH/rG4IMf1E928dW
	 BOJM/gcLMFGTp0wmA7eGNF6blW0U8rVz0mPXgY2BrsglEImEaaRD/zOJm03xq6uhrwQ0R
	 O+AvHnP+pl5477EdKaF++ymamR09p56J7R9p/oaxzURYWKZMAiPGocdL/9cSuWMvLgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140026;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=ZdJYOYkJkwTpZxRHajnU4xN3yXaL5bBz9qEtAOxm0Ik=;
	b=S94qpgeIDqju/v34uDxYlFoF3ScdJ73RtwKyX5PuVyfBKfD61QqK1IcCChr5yt1XwcnI
	 W56axOQMHbZwJ4fOSKcdKusiW3gUCnwdMnshGRhTa1T73qrelb2u+tJk00V+GhWUaBoJp
	 fBJfN9qeJrdFMtE7E4hoS/GpjtwVUmMqLqmZZUM+TVRkHulXBBcLrhtJmga4FS+9/xtfi
	 HaOqKd737RQq9c+3Vu4UedLA/5247lEKQkssoZoiq67uK86VDQ+Wc3oIPccb6yPshsoHZ
	 L2N0kyw02INZN9Pbv5efPm2QNriIuVfWqdcXpoF4k98I5T9bUrGncsBY/ZEVetF//4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FDC606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FDC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f4612a1a5cso129106b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794140025; x=1794744825;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZdJYOYkJkwTpZxRHajnU4xN3yXaL5bBz9qEtAOxm0Ik=;
        b=CaGWPYRwMCjC2MRLHW51wquTOFl613UdmqZHb/oJ/Abg8WkcZl/WsgO2isXs22QKjV
         cEDU/RWxPnbROkWPguOLNFldgB9GuR9+DxKj7N9FvohNFIKILWfToVPsJUYvsiDdSpOl
         MgytwJBe8P388edR4hGf4JILtVNVMEIlaEfGnPdpqOIqKo9xbdK67qhL/NMk0m8ZVKCT
         CxrN1StpBIM18rWpIBIc1ic4GG5N1BbHVFNNZ+upLjaMQaviDl2xcw74iaX7Uxelo9U0
         TCj2798XQ3Zq1cZKosrJwp+JGRljOr8Hj0iE+HtJQUjhtTOzWW1MA6hKFXHNSgJXX5qN
         r5Bw==
X-Gm-Message-State: APuU4Z8dVAgpJMCAZe89LQyUkksOxxMLvYA8yzAa3LRaeP7LCS/o/gIC
	KSL/m4lG0zqO1bhcC+wJXXPU5DbL2UKWTQh9loclMbmVvx9xEUZgu3bCX7/2BV5aKgvF07kQmF2
	Unq9biAAnrPC9oUUqzOyrS6ksBc4LG+dtbcXfPe3/czRtvm7WJf1Bfgf9/qI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:508e:b0:4b8:4703:db90 with SMTP id
 5614622812f47-567fd4c954fmr2387991b6e.25.1794140024916; Sun, 08 Nov 2026
 04:13:44 -0800 (PST)
Date: Sun, 08 Nov 2026 04:13:44 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af06778.3e87765f.91969.0004.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
Author: gbughunter8@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-09321e9
main
