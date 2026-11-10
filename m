Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330877;
	b=goGQeqVqnwDCk5xWHMMN+cdOyCPNTt0Zr7+5PEViBBfbyrZmEIlXL880iJgF8ItqpIAI
	 vQRXNxc6btQjdr5Dj0cQ7hQyj5bsQwFoODEpKkRcAWie96SK3XXh69hSWyc6/Ofs1fI+r
	 J2TLqQ3UXEemSVxhfJpMqXK182x/DzBtqpz3574H5cv0hmguHjkoWqdMigHdjoHLPp4pX
	 Nnn1qn0WOkHDi1bOWQn3WlebldAnV9osf8cCKYp94pZaRK5NetX7P9keGDAMyaMyPz890
	 vH0kwo6eYDLIbOGTFGs+LH3Kdu9VJUKKD1aWnm1zpJHyvbOjweugFmdaSIQ63FNRFKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330877;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=LTWBfg8jrmgB53gmwy0LmPiU2h8gohFwr8Vgfp8rLdE=;
	b=4zaBtFvfB2yLrR9ELPjCKW5hLTmHQNS9nArVLiv/JEYzNCJr2xmXgLu1kFPcPwEtFf9N
	 63ECtaV48C9FzStDfra/a6iBud0VMvPgZdkSxir26SqGP+udt+FHpF7KWBy/LmDp43VYH
	 UV0t5QW/D2aE/wfWtirNc9RebRQtYzyo5+iF0EkvbJvhszDovmA9vhxKJBxJDi/xWNODw
	 ubG/XxcV7vmsbrVezh1l13J7G9kXNsMB/bmn1WkJtvwDXkvxaBOJMMto9IhGvdeZURewE
	 8DStNJDGKVTuBc3A4/tpMAMJzjbcm6gOnnfbLhxaQ+Lkfw5XfRUim1pMX2hfX/U8Asw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D679A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D679A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so3241788b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330876; x=1794935676;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LTWBfg8jrmgB53gmwy0LmPiU2h8gohFwr8Vgfp8rLdE=;
        b=crT82B24nwkvIZGzkyh6nctUaAL7h2s002bMPm5K2og5lSWICP8+jV8x/2Iuz/8fA6
         9/+fXD8v2VE7p0sQMm4mVsvg+nHOhyeoNqVGvhlLGqp2u0jQEBtkzX5eNJJ+tOn2IrNs
         YL2sb00TtGXW78Tf9TdiwhBGdXd0a/BoYrsPn3hlPHMzdoSpnyeUdcnuL7TQiK5AoEHn
         tgpLynIn7rgEkX9nOA8JQZkKI2ERFY8J5CQP4HQ4Vf67SwYwbrvJqLM8vQWSSg61BShh
         4moZzgZ94IFRpBiKyPRMTPY7eO87NZiRbn64cUNNg1Tl8Kw3EO7B4Duev1Shpc2yxx0G
         cDaA==
X-Gm-Message-State: APuU4Z/mI3rx1dgYhp4MCvYjESzbsm+5wZEpHrZU/apWaK5j1U9s+r51
	2FPl0fZoDTmYCZvYcx36oaxX67DJyINAYHQxfpBVOf+XuUZhms5NpJ99KqW7bTo4DtUEdwPsYkO
	44TleiR2P8A2w9+79Iz2Sindd1F99O/LIwvRb2glfWbv15lCm/bA7jx+259U=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15aa:b0:55b:fcf7:61f8 with SMTP id
 5614622812f47-5683ce04279mr2466274b6e.40.1794330875780; Tue, 10 Nov 2026
 09:14:35 -0800 (PST)
Date: Tue, 10 Nov 2026 09:14:35 -0800
In-Reply-To: <6aece79e.382bd2ce.33e041.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af350fb.6ea51c61.3838e6.000d.GAE@google.com>
Subject: Forwarded: [PATCH] nbd: move sk_set_memalloc out of tx_lock critical section
From: syzbot <syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] nbd: move sk_set_memalloc out of tx_lock critical section
Author: timo.joannin@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ffce519bf008..5112e3a03027 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1369,12 +1369,12 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
 		if (!nsock->dead)
 			continue;
 
+		sk_set_memalloc(sock->sk);
 		mutex_lock(&nsock->tx_lock);
 		if (!nsock->dead) {
 			mutex_unlock(&nsock->tx_lock);
 			continue;
 		}
-		sk_set_memalloc(sock->sk);
 		if (nbd->tag_set.timeout)
 			sock->sk->sk_sndtimeo = nbd->tag_set.timeout;
 		atomic_inc(&config->recv_threads);
-- 
2.56.0

