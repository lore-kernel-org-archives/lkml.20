Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161763;
	b=bKpP8TrLYaG+cTg7MgH/w+BmdsLOx5UZQa0GU82XGAFEftZ7ub+BXCDghRx+t9UWRkg1
	 4UPBU5GSjxutUpcMhAtFJObmMRAJ7nb6W07QCQe4mmhK6e4bsu93SAF40zxvLIWqQMD3U
	 zGhmCE4Aa9rLO6mAI58OVGuk3ppcXX5Ryu2VNe4cI1xWsykqPkaf0QQheYv+bgpGdeixV
	 XOmv9DowI2oj7Iurr1BfWf9ZJ2cicekDV07UTlJNyR4JleWzD27+4BZjQ6OfHk+koO6nN
	 999pN6kPoe+jFteGcw5ZzfT2xARp674v8Yots0hM58+Gfqs/59wzQ7St930x1u9AfqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161763;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=GUFk98TMKKPDdEafxwRQ9vChNe9Wtu9NCqjC9pH+E74=;
	b=yG+eklOxXfkQyZEKVhveJnxrH+59KKyvQshN9ZsTVdFl4yyZO2zcqlX+LTLpZiTXJlO6
	 V0WURNQ2lLcLLOyszIFZX4qsF/jG6EJa1ut+TZP+mytqEt7V4vw0KaPh8vcHNP3bgynPJ
	 ax3dk5QJS62tOsXnDjU/V9VTWzWVCgJHNe22cIFkPLP9nkRgGIChwb+fTVtxaUIdAbmZn
	 JL1Sj46odwe1IzdAtWtTL1du17Sq2OFck+IDs0J+0XSa/BfwG+pawRH4HHZOgjMB+5WsP
	 2Kla6Gpz8ez5aWhp6CfViRN6yc3y2BSbdENfgT4OvZ63oqPpfpVtF2CqtL9XG4gq8Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F02606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45ecb9dd589so130660fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161761; x=1794766561;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GUFk98TMKKPDdEafxwRQ9vChNe9Wtu9NCqjC9pH+E74=;
        b=goi02lQXqST4e0ricxHJ8m3fZxknHHjcEBuSFw3CiYfjKnYoBX097MEwsI+99s5YTl
         oRtFhlNpOheYDkJmBpy71jumTy+6XThujtqY1wnlpf09BOmNrTR+jeq0fYfm0RjZV+Lz
         uUIdJvt6xiWRWN9LZs85EgbukEsWmTh0HhCHAUdImLYi0Yqixi++YKaH8OljXWaUnvgo
         JWplQezwAxfsy5VOO2+AGlyTaHwHpqkYi6kh2lHRuBU8JVf0U2tZOFdJB870WRvB9n7i
         +bjyWYPTh/XRvU+cl1nMDQslsl4JZgLLpDM+lhGFth4v/8Bj3v1sVTxnfsYyK0z2nopX
         MrZQ==
X-Forwarded-Encrypted: i=1; AL+hErHtJDSZHldsopFWkxdfH5XFwRswDpRxG0/Lr8FYmIFcgBdm4pjRCWyJ9YsXYDY+Z/gb9yMfGOJro2v8PxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZRhMiB7mdERwMuHg5BJJcYX5qWTtotSZEjztwikode/uGLzVz
	/7gH4OstJ61elsF/eG/8l1JWZfspsHsx29b0Rv9Gur7Vl+7IAdCHeL5otTFwo84OreHrypzhLau
	0/Mhczm139GOaC9RJEJTzSZYGyfGuzw6qrVHcCvP5d+Bn7vHkWyh/nxnxLTs=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23c7:b0:4e4:86b1:f7a0 with SMTP id
 5614622812f47-568147212e5mr1152091b6e.53.1794161761733; Sun, 08 Nov 2026
 10:16:01 -0800 (PST)
Date: Sun, 08 Nov 2026 10:16:01 -0800
In-Reply-To: <6a56fb92.c90005c7.37d349.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af0bc61.5a668245.1aceb6.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] INFO: trying to register non-static key
 in __vb2_queue_cancel
From: syzbot <syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com>
To: gautambhadori9@gmail.com, hokage.newbie@gmail.com, 
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab+huawei@kernel.org, mchehab@kernel.org, 
	michail.tatas@gmail.com, pimyn@google.com, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 288254383674be25b26cf137bc12bfe38fefbad6
Author: Hans Verkuil <hverkuil+cisco@kernel.org>
Date:   Tue May 19 10:07:59 2026 +0000

    media: em28xx: use v4l2_device release callback

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11227f8d580000
start commit:   f909e534f5e3 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13227f8d580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15227f8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=170e74e1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c43da9580000

Reported-by: syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com
Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
