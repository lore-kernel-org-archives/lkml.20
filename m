Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799432;
	b=Saxeij4iVVe45zt/cZNqzr29Jj/3TmXf3oD2iiuwAjR4gJa5pRx+q7sZAmMhDhXQwUgB
	 ap6VVmXixFGC3yGONCb8N0mBpjN4P302i4XPTk7qhW/0IQpux8NPqRYIFEAB3galf8f+X
	 NHg6W6h050t8AHE3YkO5nLuFtYlhhq5L/NMYgR5NePW5bBhAFJ/Fqrm7sBcWlx7G8GFf6
	 UotareMB2kibzH6VQImVwY/WgWb8MJRKCva5W8ZM/olqDIFXj9CA4Yby/Ng+su1zzeonw
	 XwwYMdAh5lC+R91bk//6tR5ZhFPB4cwPiuYJ1TtGVRtNTDgi7GRusNvEBtdWEmCTk/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799432;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=JnnEbjF+7yfxmsE+vgaIs2Qxck7Azxicf5RN5E9ZjeA=;
	b=oxjZ0Q4JB5rkdWTwQ9Mv52A+Le5wW6UcRhDoPcZifW++IbdZIJHNVniUQOikjw31bNuG
	 FLz5/CtcInx/7+BoEt01LFiOcWxDNHZcvdQ7IvZI44EFXKN659+4nPzoWBrYdFzr7RuJr
	 gwI/sf3r544gbQYVbYjAizV20SK+QZAVYZVScMB0zwLX9Z/oPvcxuJ30rWlkTgCgq0FZH
	 3kU7HFlsLEwOgVhMoPcLAtgdpETmYMsnzoAgRvR5zXIa5mE/NnBGRssco5EshJ2SELz+6
	 PMiPtiWXETUIDDiq6uF9VIzW93L2hmEoT3v7A0Ziv8j7Iw4D2sKXxG7zn6KjJXvhjjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30032606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30032606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cbf700ddccso1950407b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799428; x=1795404228;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JnnEbjF+7yfxmsE+vgaIs2Qxck7Azxicf5RN5E9ZjeA=;
        b=i1CPaeLa33nkyUiI71JynjakP+zxwZ7tGIoIA2zcgQ7M6hyvG1/SNQUCt7y8nxlG5h
         5ewQqFJaS1Y7KHv73vvrzxIYzymB2Ca+e7PRnrH1+UIbBYS/9RpH12ODUxOi3c+quH/J
         8uE++7OZPMVtbwvmACun/JqWJs/lnRzm9BjDVdL3P93vHXcLHXkEWNewRf9x1ErUN0Iw
         v8wSAPpKqZD8TiD/v064qJQ3nyaGHdPxVCeY334ngINNsIRRdtYldC7qNiExeXPpKeDz
         WJQie5fEfhdcr2QJ/6kvsNQgi6OkeYutmjIZcJM6FIKEsWUxB09vL+w6GkC15vEQSg5k
         TaEw==
X-Forwarded-Encrypted: i=1; AL+hErE3QxUjpNhd07Wz3wAbK9OgHw6wSZQr6CGN+0UgvUsmGhNd3DOYzt5pqxl1CtQBNTuIR3C370ZA1no8Szk=@vger.kernel.org
X-Gm-Message-State: APuU4Z98t3+LqgBNev0BKnKf2qpVnCSiFxgBO4ilp4umuD0TZ8xHxhrN
	tEj83WXe/FhqpdytyzBpj5pi7ueQANci75RD1wHpbdgEP/NUg1ZhLPP+aG/FLcB7H9gWtlGVLhb
	liTJpz7v5z5cEG+Feeqk+p3dwzlr8QVnmaFA5LJ20N9LguHKnpciHr6U5vpk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6605:b0:4f5:98d:d1ae with SMTP id
 5614622812f47-56e6530d470mr7568271b6e.55.1794799428295; Sun, 15 Nov 2026
 19:23:48 -0800 (PST)
Date: Sun, 15 Nov 2026 19:23:48 -0800
In-Reply-To: <20261116032342.38850-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afa7744.f271670c.155442.0127.GAE@google.com>
Subject: Re: [syzbot] [fs?] [driver-core?] KASAN: slab-use-after-free Read in cdev_put
From: syzbot <syzbot+667788430769ef9ddf25@syzkaller.appspotmail.com>
To: eadavis@sina.com
Cc: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> From: Edward Aadm Davis <eadavis@sina.com>
>
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2800868f6322

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> diff --git a/kernel/time/posix-clock.c b/kernel/time/posix-clock.c
> index dab37295c8c2..37cc015cd8b0 100644
> --- a/kernel/time/posix-clock.c
> +++ b/kernel/time/posix-clock.c
> @@ -99,7 +99,7 @@ static int posix_clock_open(struct inode *inode, struct file *fp)
>  
>  	down_read(&clk->rwsem);
>  
> -	if (clk->zombie) {
> +	if (clk->zombie || !clk->dev) {
>  		err = -ENODEV;
>  		goto out;
>  	}
