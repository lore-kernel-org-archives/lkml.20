Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565214;
	b=F5ELx1sTN5q1lyM17DtpTbFtqvFff8aMJOz6rvMRoH6pHgSWWFoVUYUysCBzUc+8NCC3
	 IgdhozB4Nh5fyurhvvNNkqLPseYdtEHwfFyCg4URyMafaiIixi8KHC6gzgsjeZcIj1Vey
	 pNfKYerHumXfAiSpNrmbFAq2xq6pXH5SaCbUW7DYVi1SyiAHJWuN+zEhH0FSkiLKH2c9u
	 Y0W7qqQbL9W3iEjoRLbf72lQf5JW0qz7WyPij9fuorvoxDpG00+Dta8rv+7C+ukb4Oee4
	 e4ylj3YGKRxE3ollor/N67eEvg7gg3BUEQhhRyQDD8L1msRaeb4dSNfTHSd5ceqSE3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=2dTv+40A8MU9jbQstiny/cxNJ+aTnQerlecbgJEPaYA=;
	b=w5c1U/536M7hAfkDWQEpcf6EijLwFYUtY1Ycee5BFJ3XvOobzxm8Xd9fuYwxNg9Kkizn
	 M0oX+cELVjfoln6n16JNjoDX6JJDg2YJau7qm+d8tfB2T+Q35uiRhvGzne3eZLcxrex5C
	 cPfcnk8dMlIyExtuHJuPGf1p3yPpTJJJdfQvVjMMfiFlRbgg/3miIOUHRiYyfW9hBTDRo
	 2CcuG+LGiCy0sUsJvaU/v3Rz8tg/yTXYdwKksLEU3JwTzyIYk7X7QUkwiMqnlLx71zbUW
	 4vH18al8ZjkwmNkzWxiLT+2A2qbewROPGV3vyB3Ga4mmVEw32AQ7KQEpuUFYXqmfXDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7420606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7420606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ea2c058e67so3679124b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565213; x=1794170013;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dTv+40A8MU9jbQstiny/cxNJ+aTnQerlecbgJEPaYA=;
        b=soEzfRfuA3YgKoS8p4wrFU5ArrhQ0paJ1IXhz+AA13kMdWLNHXvwt2xnbU4FJp2FCv
         idX7DM+8PKw6t0OVX//mbSzZiGW84T6YaIuKZEJIuyHZ12HLAPT7bJOp4H2xuaRwQGv4
         x4hlyVir2Z66evkmaWvyy5P4UE4MaCfbfsL/tEgYig9SxATwhBl7VpRzDX5+iGcmGJ6t
         LXvVEcn26K9VCJ7UAcmqajwYsoHxgAKsrLcIOEG30Pm4ddWBz+OK6eeXBrgj7hOBNod3
         LRwvmwa6PKahcMsXU/EqH++cUsn1td9Pm2JtVqTQ0OglgX0nxKKQ4zjx037AO0GSeiRD
         3rFg==
X-Forwarded-Encrypted: i=1; AKwUvBz+3v6IMn4VLtGS6ozBeZWBgf67Qlp/7jUBmWKHepQHIM7ZjBcatY1IO2BItYvCuil8eUubSDpkRz7x/UY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpPgNN+8KpXi4ByzlLnsq2psfteJBImOccR5fu4R5iFVPKpWOf
	78k82Kf8VtLJS2HIpkQB+B6MWZFZmCE0Eo4d+G8DqHddSaEfcz8i23VSMx4NpysgK5FUaprz4qW
	+5yq+Svz+jj58W8Y91TQb6SkEWEuweTFGF58eiiyktLEZlWt0rFbMrVPXNGI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:181d:b0:523:dee6:7ae0 with SMTP id
 5614622812f47-5640de07f62mr5409409b6e.58.1793565213054; Sun, 01 Nov 2026
 12:33:33 -0800 (PST)
Date: Sun, 01 Nov 2026 12:33:33 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7a21d.7fe51036.1ecf7.002d.GAE@google.com>
Subject: [syzbot] Monthly xfs report (Nov 2026)
From: syzbot <syzbot+list16a9fddd1bb92a94c686@syzkaller.appspotmail.com>
To: cem@kernel.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello xfs maintainers/developers,

This is a 31-day syzbot report for the xfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/xfs

During the period, 0 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 35 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 910     Yes   possible deadlock in xfs_icwalk_ag (3)
                  https://syzkaller.appspot.com/bug?extid=789028412a4af61a2b61
<2> 27      Yes   KASAN: slab-use-after-free Read in xfs_defer_item_unpause
                  https://syzkaller.appspot.com/bug?extid=e7f24354da9f7915bc54
<3> 6       Yes   KASAN: slab-use-after-free Write in xlog_cil_push_work
                  https://syzkaller.appspot.com/bug?extid=c32ff62cf4913d345d0c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
