Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793523123;
	b=c/kn2Q9mtPCLgpaRURHpStYhl0PDx16w1qHCyfTy+Ixa2BXQFH2hIndCW2bf1wAMAo/y
	 P/VD932jVX6csvxHPpaSIyiVVCnYSdICK3kWC0HvC2Ggi3up6X6S0QC1rBZMLCWRHqt50
	 GKp+geJRc3WDgtjCDLYMhfOZDvSY52ylNnsrJpTbsn8KtfEgA0c/ZMMROHV6sHvkMGf/h
	 LtfmlWDGCmypgvGZTQG4wGdALUtF1SbEYT8HVk0hBwH0NI7Ce7ko0bP3/JdMeNxyWtJsK
	 DdGbJFRR9auAGhzdQzMf3GFtYalR4m40ArZqlgnv8y92RpgYd15Q4tZgPA7XCRyYMBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523123;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=nkThGeIo/7jEtdUtpDk14Ce9JFe6Dx3bh7Lnx+1w1wQ=;
	b=oq+/uhtOtvyyT/S8rbJi5iomeGmgLxMehBC4pKctzIg/wnoEng8oJpayILikT99H+V7z
	 R9Stk3VAKOWLyHJF0zmDmJkDbiW2dfXXbCXLjHNTSLvTB8GJyibnhiWZiJpCYQN4imLEz
	 fu4d1wsC6gZ8RZBUjmENTDoJ0RxOBYAep4orjFNIWONHWAbGH8UfeS1FioUnA0FYnDE4m
	 S7Ae6JWBSJI4LtWAiJZGnKwg+wsKzWT1mH8UwRPImzJnzO8LwNGBtvz188tbtzXnMmBfm
	 PgK8eHr8BFxvIDMo2/kfbmq1JY2sjSLIHdsdyfohOLgJB1N5sAztFNZ4MFAgqCJMtuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9A606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF9A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83c2311eb1dso3717791a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523122; x=1794127922;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkThGeIo/7jEtdUtpDk14Ce9JFe6Dx3bh7Lnx+1w1wQ=;
        b=dJl9ufQ6YYTlEq6PM8HptONjs+BZMkv2AaXIQk+GBbYOuX++kvVXhAk9ckDjsxW4DH
         ztQxg5EgCZDh9yzWyzT+x97bthIb/aCxAxIdsUCyHoSRFTj79nm7BlRKhiED0QCJFQdY
         M7wV5kGk9tbPtgNq129piZaUo1q6T8f35c84199vpSq3giIgWXriwRTVmFXJwOsnanom
         Zwyoq2lp++RuqWUBBel+kMR+eIurp9FXDx0UkDEzBtvqA/Iil7Udp8az7F06NEcA4BF2
         5O/CuY+7bv/PkBxgdSt+sCv/xgAGMTphamyk727xk+xzzyOcnszZlhMtuXYqJT9517XU
         tCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSWKFBeQ/Q6CsWyT/yGtvE5l2+zPrx151xkyEWkOHNrlImpspzouT+WeQoeY+SFMVmmv74dlcw5vAqUUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRMWgd+lXYlMOinRSRVdWKLMSUuxTnr8efs3wkMrHwFoXxKePy
	CBORL2x5v0tC+rXik7WoHylw8eUnev5Eai+dnG0DLGqxoriZfIBrc4WGUPBHOdFgCTExc24FG/8
	sjRqqO0JIKjY7xjksiR5nF0chCaBfkqTKlhUf9KbMvKFHeSfn3ND1wsvttII=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2396:b0:53f:3c0e:c74b with SMTP id
 5614622812f47-5640d91a298mr5116120b6e.9.1793523122167; Sun, 01 Nov 2026
 01:52:02 -0700 (PDT)
Date: Sun, 01 Nov 2026 01:52:02 -0700
In-Reply-To: <20261101081710.19095-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6fdb2.7fe51036.1ecf7.001e.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in rdma_resolve_addr
From: syzbot <syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com
Tested-by: syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com

Tested on:

commit:         cbbddb6b Merge tag 'power-utilities-2026.10.31' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1688cbe0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=37ec6334ca3b8e94
dashboard link: https://syzkaller.appspot.com/bug?extid=6699995b421c8ec7d2fe
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=134b662d580000

Note: testing is done by a robot and is best-effort only.
