Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138635;
	b=QNlC0FL2P1WLMSiL8/LurlLFZNQKdO/d3ZnnQtyagFO3T6xNxnSJi8a6+H/G/Qo6F731
	 g25vCTvmf/Fg/OueOc73XsYwrIy6id1OIcjZQM53z4Jb2x4ge79y5becM0whUmTerLWHX
	 BV+SODBAwUqbgRfeJQAlja6L7Weis07DmCW2APXPWcv2NWRWL9ReWryGI04TZOgm+X5IJ
	 1atmGA4aN79TAvt4/YLLjMZ8DvVlcsR27YN1xPiEWWD/4ulPeX7wLpjAnhqx+UPv+/X4P
	 nF+XcoTqJmgSStYGpyDoxcGHAe8pnuvDD+PrYSVdfez0QlgAhLL35ITgRzeUlLKfYBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138635;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=QsX4cEgL0vM5IeJjL19Wcy4cA6JEToF59I6Tpp0Rya4=;
	b=E/9K0DHgcUMgp+lx0UHGvEOwksq30vzWbIxQzalEFx9c2a9HUDjKh4TrZaFSHyGGSof+
	 LeUspjAV3HGr+pN85mpalBsC/jVbYHyvNrz8mZINjLToEpVSrc0SKuDqQJsX9SdRxGqJU
	 zQrerCtVx4tPCXmM4L7OnsClFV5/iQgL5XU00qdqj5e93sYKaWzu6cce08YAULcHA1nF0
	 OeSg+M6WK6dtsLm+fcIT/jG8smWzhcvOKzjzkqfeZhCfjyHgejYcsvTS8zcJXb95m45J1
	 YjnsINBjh4xZJ/370X9pQKsvHp+EU8zz+KxKiHqn0GX7LaWidaqg6xuGeL6sCdgQVZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FCF606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FCF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso28463b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138634; x=1794743434;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QsX4cEgL0vM5IeJjL19Wcy4cA6JEToF59I6Tpp0Rya4=;
        b=iwQqj87fQLkZ5+aO0e1MPVVNyMQK2Te3XglxPiI69FrY/fYpkrSzFTYyq++uagwt1M
         F1Pvf2n6+Kf7EdYhEQddlZWeNdWRCXye8f6T6bFX0SCPBHfaQRfmPKjYLp7AU2kk6DM/
         MPDNM7WUFprMZP/acvq8Q+AWM2lhMwmU19yM26BreW6lGLu4+0xJjpH198H8VHzX1OTa
         OQK/TGFhKZfowB+GDdvxKuFJDhHsGmlJOzNvrEPM0/l6I/RTpuoEj15f55ekxGvpt3nJ
         BvnSE5PXVHWvX5Ihvvk4m4bjVsuhevsMguvXGAXY1SnvAZbaDnfODUvNVPvxi1xeKKTo
         NsOA==
X-Gm-Message-State: APuU4Z8Dj9QA9zsy0Juj/jbuaF7XiJvIsfhDJevS64tj1sp7QoI1Q3Q6
	12poyTV5QfwLLnrstTVE5KV+EjEgoK8Yd6z4yZqZCqmiBkl7p3N+uzbo0BKYAmSM2hdxPL9lJvQ
	eZb7gLPY1EaHFx5zLyyLBmKA1cx8l8+qIWPbj/pXbeiuuDGKb19fPvHndQH4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe6:b0:4d5:295c:a82f with SMTP id
 5614622812f47-5681441d236mr921614b6e.60.1794138634288; Sun, 08 Nov 2026
 03:50:34 -0800 (PST)
Date: Sun, 08 Nov 2026 03:50:34 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af0620a.4dd4714a.f8d02.0014.GAE@google.com>
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
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-9d03a38
main
