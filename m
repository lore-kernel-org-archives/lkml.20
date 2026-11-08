Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132726;
	b=ODdY4OM8GCU2aUfHT8/SNmcFqI64K3F4aF+YjWyuCEoCIbxHEIyCh63+O11M526Fl9Or
	 WxRi7WIMCLdyMDSbbGfbhv9MXR0mRWertfcQIdx8yRYwAbKuapFIhtfgl9tvRvaJ3gM8I
	 Y87EJi3Oeo5DDbGjogdqpOSskQtOCvB7ddzKn2Fi4/vm01UaLVYAP1Up89Y2Gs9xbFywx
	 ljKXN+3cD2wrqmjWgS30pX6mQ3AzV8WqW/He3BHxvIGm34SGbFyo4e11k+L4uDW4g3JLT
	 b38IsyofQZQduRPZY263Vnnj2N/5AIbJcj4/1B/bzp/11Bf8eSE2kF/Qit8f+yQBnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132726;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=W5NQGrA0gJ8/eyENL1AYdcOnvyEM05hLqgqdM1WGyOs=;
	b=0+WVBNe9JmdWbHqlYi8ZVoooqsmaFHRtA3hABQoh/d+L2dLtAnLm2+N/z9gdGqOIEsbT
	 6K2yBGiICrnYF/P93I4G/yiHBWqfGbXnsu/mfbJZW06DAsz6228ctgCkIfvAdTcIoyNz8
	 ynS3XpgdxRFjcfUSKu0r0YSseb+f4XACzaTFZJwYxzqiAbV4cuIMarzb2ZW0798h46Nsv
	 a63kFlvgbcj7Ucukue4JfJ1/ZPlvbNC976O3wx+D9STHZvqH4BQ/gwXvqjadIdnEZOdO9
	 X9zHI9aTPpP8h3if3WZ6O7KV6HO6r36uTJV6iwduR2p5OoQxoKW0D2WlhGSe5d5XK2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE98606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4eb0b989f0eso99606b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794132725; x=1794737525;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W5NQGrA0gJ8/eyENL1AYdcOnvyEM05hLqgqdM1WGyOs=;
        b=xj56QJsecZtFCaT057cGqxt+6e3brT9ycx/DBJy5BneARCfRX2zDYq9NBt4YfKd4NS
         A2x0iAwiO5c/gclG50Grj0perWwgBNCY3Bdrn/Bw65Vt1+UbfM1EGwchrCPz39KrnjKv
         HLkg47LzVIslncoAFKDmlAEuvn7c++KViTW4PIqmkqCk7QkgaM9mrrUrtVgcm4TVIya5
         Xpio/V4ZtP0w2W7s8Yn4D5gtW7UyNmObjx1L9ALG2d4ZNZ9zXHJ1klaFPfpRzz0zmbev
         O4G+aw7001A/KIvSZTcEhrQYWO1dIAewRyM43YhdF09qfV06teGTa7YOpAO77GpZBvtP
         fX9A==
X-Gm-Message-State: APuU4Z8kSg0+Pv+ZOS7gv6dEVbqqgbIf2NbZYAR2gTC2bJXBGbIDDmh6
	hZZbKxZTu4jeHKc1MZF51wXjO6PqDgZs2OlUjgTkifGYaxU4kD0XOD9XPCZC8PpUSkRHYUX6aHZ
	e4SADTGBTIrLX/AfVzHxmUWv/o4HJr5j01XuCBZilmbuI2ro3M4MpiyiNoSc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1304:b0:495:ca1b:7865 with SMTP id
 5614622812f47-567fd42cd45mr1837507b6e.11.1794132725363; Sun, 08 Nov 2026
 02:12:05 -0800 (PST)
Date: Sun, 08 Nov 2026 02:12:05 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af04af5.4dd4714a.f8d02.0011.GAE@google.com>
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
https://storage.googleapis.com/vrp-syzbot-owned-fixture-811055272945-1108/bare-repo-9b1d4b8
main
