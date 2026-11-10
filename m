Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332777;
	b=2nLBk/YOAFS/5t0lPWZD7d0Bk+Mox1jiHuY/i2plfif3VgY/+XReZJNdt+6niKHBNZ3k
	 +bpY9ZGQCqna2fRlchZNlPi9yBIz2tS6OLnIFsgYlSU5sCUUbwad4+Yhii6EgBjVzvhzY
	 pVWNejlbVc/zVI3AAauf05i4kWWE00FqxV/FGfHmvvWm+nmJRy8KVj/jVyfAM82xs7Xy0
	 Bx9J6stQ7Evr0Eh5P+bCQL6PAta6dKeLsvqPzIFLbAsGyNn/FufpfnipNRQqQkqx3wIyX
	 QDFRRRiYBkYesuz0CHfJaLGjWgcDIbCMJTSuubLMd3fcnw1kmfKQD+9wpfJVDuj8eLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332777;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=DM4h2lDzZp3tp/QUxgywp2f4AF19bVDY9ONj3eT09Po=;
	b=lxGV82fglPHFGcYQoiAP5futTWFuQ2LUjqI2eBaAgTXONOnKSoVQYyXVb0s1ollHSZrY
	 v5w0veelQUgXQE1EnH8jU+h9c2pROvmhdCMZA3/ub/4ZE2rbFG7bmQorUs8+0A+9kVCmT
	 8VIebj5zu/0NhdHfkfEZmpmVZpWY4o1dQwNGDb3YQNy6T5SIDs46W58f7UEKSk/cUdLSu
	 VGEElKIvm5xVxB0w9ltA5/elpXPD3WVWZNcJAlaxuGdcB0KoASo8yAAOUy3vO23XZ60Y0
	 5k2oFvEcZcDQUmuKYFJgrmoTWrlWxu1JzdAYNC6jcl9XPum2S53dLn1H9GHs1wAzWsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDDD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDDD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5641cd2cc13so2592798b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332776; x=1794937576;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DM4h2lDzZp3tp/QUxgywp2f4AF19bVDY9ONj3eT09Po=;
        b=rsd8dAH8DXcKn5YHGdpZotCB7tRY85ckQItG8e89KVGvT4fw8+2qQfHUAztp1VJD6n
         48HaDPiiY/bIbC3b6c2vYuOo9Y5SWsbRdTW4TJJU4KF3FDxzkg5VM/3+3bp2pemsSG2n
         VhTGXA60yVSrouQ35N6ZZotw3RC6GihyH3fE+6ordOqp0AAYj6EUiZc93+/6JixpMkdO
         bEHCfNYBDr+8OH9X+BAnSLC18gGXX1IwjfBWRF6cU8QA76J+VSH58rNZoGG2s7WHo3rm
         3D1vn/YDJGpw4sEntMKF7oGG7YoI7nQ/IP8/gMx/tmi1ETpIRR9mwC1v/sEmnHjlemTc
         k0Qw==
X-Forwarded-Encrypted: i=1; AL+hErHRONPFeRAkKiP60mod2DsJXxuFTabjGA9dnHUddO71WbninlJ6+qTNzuZeckplzZUFjmWPcMrovf5VuCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kDyIPfN/429FA+1qXFtoxH8IOWC6/pLXq3rPJ0Q85XtWMR1U3
	7m4BVWsSyfOgslG+AZMY01S4MixLw+Zitov+evGcpNlsn/YmAtTcy/Bit1N3iXUE8Ig5LrsxMaL
	KeHwuCh/Dn6QEAuOsaGgVQjrmeQL+x7LeDtCLOsFheCa7+Z1ZOzCMOUDRncw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc6:b0:563:e8b6:c5d5 with SMTP id
 5614622812f47-5683cd199f5mr2833462b6e.44.1794332775774; Tue, 10 Nov 2026
 09:46:15 -0800 (PST)
Date: Tue, 10 Nov 2026 09:46:15 -0800
In-Reply-To: <CAO7_G+z5ZbJHY2aySMSo7qoKyQXEe-cAxPixK-=fbxRrR6zU8Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af35867.17ff5aea.1b027f.0197.GAE@google.com>
Subject: Re: [syzbot] [dm?] WARNING in raid_resume
From: syzbot <syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com>
To: nenkov2004@gmail.com
Cc: nenkov2004@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

This crash does not have a reproducer. I cannot test it.

> master
