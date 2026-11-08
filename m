Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139085;
	b=caXDXR6vDO5BPzG8mbJCt3YKO+roBLpkLrdsCsOdI86RuKurQFwrK6tItzku7XLhNmXb
	 qpXXGKRIjnvi+p15/gYfAIlxvNr+gsePY7zXvzW5GM7+3FyAqaci6mshsS7p3DoByZ+b2
	 HsW84JVzpR8yVx77OUMowriWW1+jp0zUIZVgpKbE6tutcVeCBPkTPZ47Kpt/WxEjjMJPP
	 rk8iOIXkqEjgc5WjWxJOz0ut7U2NmYMuZwaJzZwMXtylCu9G7K32K8wWORC/JfrXx7FPG
	 I/ha49uHK96rwKlfCmxxgKhqUbC990Sh4SNko/150c0UQtBFsziZf8MjWEyFXG0jOLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139085;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=PIHzciLut7f/OWUeWoiHN0fBKQFh4nXnmN3403w5Yps=;
	b=J4KeFuQqO/Gokatm4eQMEcO6YD72XjiHJlmnP+8Q/FQxQjxv0wjlqVYRYn01SUvqh9AK
	 wlRHwelmtJ4xMybK9yOLv7ippV0i9xF5flk9a9V3YOsy4PWws4N/eGE6ueJTKrijMkRhl
	 CDpRk8/3QAizC6y20qTuKW1YcvnaiRNvHuLwgiDXAFf1KeuJbTk+nzHaJo4UBJHm3I86e
	 3AI9bh/ZmeviP17HmGYesn5cqTsCbhQkuM/pH1EIcIWcRhHAp8Cd2aRgqQDNhGmp5RUx/
	 eaDZ3BtQ+nlAAzLYuO4BD6SurWHAXWnHpCCMaR4r2Jid9lUqYccpvam6dbgKRUkAsog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDB0606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFDB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5640a2d9708so47320b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794139083; x=1794743883;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PIHzciLut7f/OWUeWoiHN0fBKQFh4nXnmN3403w5Yps=;
        b=iwEblpm7C14SKW6VsoX7p+4e9t7Ie+0CNAJpVBpMzdNud0Egt6E0HMxqrdhTTRNPBf
         2szq0P4f0t6PmVt0Qhx2OBx1exU+qoL3uc1c6hToKwJsBnwNj8GxDYwH2QNXMhE/gB7g
         T2IPaYON27TnK2OPToyjH6nEgfof/LnI28ZHeoehLzyHNkfxQgtWvwCz+EOTD5cm0l5z
         BHGx+gXEJtPaN110zYuooJEl0S5iQj559xr4FzmAsUvYmDbknSIh4qTP3KAHYbIxDfXN
         CkS0U3c9bvSeB4YvUNr3VAgNKHGbfRwUEfIXTK/gfYgOdOdE5HZ/FGAewLMuwCzniVWh
         qTbw==
X-Forwarded-Encrypted: i=1; AL+hErEuT7STjcEJFMrVY7KCbulocYOZR8QO1/GAnzF9BV8g6TnvtEnoLCd4DO6QTgo+E9jIvxkUVVWI5F5wCsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IMBdTLUzrXdIYiq+cSV/Xo2L7bTApadnDQIq8dGwf6DTGCZlG
	JhwaGbeA+VD6rQxvxOMCcCzKKbObP9Ar9p4PQzE0dspUjHW7OMaitvMkWUBdgSLgUaohjFwJBt0
	MgHCkZK6vawsMHnKUFQjl307wpkTC+gTifZsGeduUUrYzwLIcvrd2261nR0Y=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:318a:b0:4c4:5f5b:6918 with SMTP id
 5614622812f47-568146ecc67mr781688b6e.16.1794139083782; Sun, 08 Nov 2026
 03:58:03 -0800 (PST)
Date: Sun, 08 Nov 2026 03:58:03 -0800
In-Reply-To: <CACbwGuQZTsKQ3YmujEBg6Fu7X9QGXmbZPHZfq49+=YOHRZhPtQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af063cb.4dd4714a.f8d02.0015.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_ROOT_RCE_1108_6d3f91a7


Tested on:

commit:         9d03a380 add deterministic signed object oracle
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-9d03a38 main
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
