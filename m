Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883596;
	b=GAq2Y4hKG2LHyz+y4GCV21l7tbBt+BRCEFnILMMsEjx3KHOyFmBL7Z6JJdLEdmCMP19P
	 /bfWE5aY8Z/k5pxpAgfEzI/eoxlqvaZd+xtGb0YYoJD69o2rDQXJA1P5E5oirNDx8rgA6
	 Xjbr3oxn8SH5OAA1M2JSIkKzL5cVvF0NKtvC2BG/yfhvzi/Ee7eDxUhCWm/Yh3QElDoXY
	 zPPUGxzSi5GQlGUyqNdYB3j7F23UN9/BvOH7kSF2j0SsFSXYtUJMLAeONjmuUm+hCna7e
	 Cr7QEbTt8OqJWiivpnlYldn6UvxkidF7ab46DYLnYVDDmeTzc3XW3MjTN1OyuLhY6aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883596;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=iC3+i6vMytzd1uFKSOxPthkdQRb7qDiSqhiPlgYqFAA=;
	b=sU/d4c3ge1+yKz2y5l/qA79MqH1wvCsWM+Ao5QtlmQhqYSK0GJbq5xHSnI7TsBDmIqSQ
	 Bc4EFHQZzHW+MTHiKUqCmUGi+koSlqyCrg/nS8xkyjbxOSy0LzNljbaPoBoO3qYXK7SDg
	 f3XfOmN4fJklhEwl3PFftNxoDICL3HkcH55CN7HObZnJGkw90Es2L70P5ESvoYyZ276Uu
	 CT0Oev9Mjn7p1Sud+jVkTULIgXRd5qzqQfG8N1ogJj74H013inR7lhWoh+4QQ+5tcETvB
	 Fjcc9UhjNbSk7KIImFDhI/JE6PqnYRLowpx0BKOQKdh0CWhIlaoLo4whkWR8B6v8bVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AC3606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7AC3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-540537f959fso2349167b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883595; x=1794488395;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iC3+i6vMytzd1uFKSOxPthkdQRb7qDiSqhiPlgYqFAA=;
        b=AjxZfv2RNeemjkutZ+rn4TuLmb2/yR3mRii1Rp8TSOY42Xnqlq8ijYaIKe9ZweFRMm
         GF1p4xMstFJcCPX1BQb9i4+dg8FxQxMuycnMJSSDu7T/58ZhZSNBMZglvsJEyo4l0T1d
         zGN/K0rBST7fKEaYafo6tPrpXLHHB5I1IcTU4T3z4tFAqfRZKm5fQRSWka3TRBpLjOAb
         D+nIXaNm+YYxirz0y0ny6F+tfu3Of6F3y2iPlZq5hxTf1OIaY+W9GqOP1uq3LZLDB5ji
         KCMAdlpN7h36Qaq11VKbQ+PT/FaK8NnmMZWq/u5Tw+1nUYhg7231RuL52COYlKhl5ipd
         Wkgg==
X-Gm-Message-State: APuU4Z+GZELGW8PAiBW5hnlFkYRQjHJnlwobjeE8eu8XLwCttdpjOrrE
	KPJ34/pyzKllq73hOcC0utfoL2rufa0O88Th4nx15prXzTRH/0zEwOo6q1g/QetbW075e4T5ySi
	5SUOGeKuNDuizYRLghoY/GrwL5P+h2jnP/5jLz7JxmemjKDUken9YJYlzx7g=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1512:b0:539:ad19:d0af with SMTP id
 5614622812f47-5640dc1e093mr14421953b6e.11.1793883594833; Thu, 05 Nov 2026
 04:59:54 -0800 (PST)
Date: Thu, 05 Nov 2026 04:59:54 -0800
In-Reply-To: <6aebbd06.21d05368.325ed5.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec7dca.77d491d2.267b55.000b.GAE@google.com>
Subject: Forwarded: [PATCH] mm/slub: fix kmemleak false positive in RCU sheaves
From: syzbot <syzbot+4d078516add5f4f12cea@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] mm/slub: fix kmemleak false positive in RCU sheaves
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

The SLUB allocator's sheaf caching layer allocates `struct slab_sheaf`
objects via `kmalloc_flags()`, which registers them with kmemleak
for leak tracking. When full RCU sheaves are retired in
`__kfree_rcu_sheaf()`, they are queued into RCU via
`call_rcu(&rcu_sheaf->rcu_head, rcu_free_sheaf)`.

While pending in RCU's singly-linked callback list, if any preceding
callback resides in memory untracked or ignored by kmemleak
(such as `struct slab` from `call_rcu(&slab->rcu_head, rcu_free_slab)`),
kmemleak cannot traverse the chain to reach subsequent callbacks.
Because `__alloc_empty_sheaf()` does not mark the sheaf with
`kmemleak_not_leak()`,kmemleak falsely flags pending RCU sheaves
as unreferenced memory leaks.

Applying `kmemleak_not_leak()` marks the sheaf metadata as grey,
preventing the false leak report while ensuring kmemleak still scans the
cached objects within `sheaf->objects[]`, whose freeing hooks
are deferred until `rcu_free_sheaf()` runs.

Reported-by: syzbot+4d078516add5f4f12cea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4d078516add5f4f12cea
Fixes: 36aad21d50d1 ("mm/slub: add RCU sheaf caching")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 mm/slub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/slub.c b/mm/slub.c
index 45e077c7526c..61cd77644c3b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2856,6 +2856,8 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
 	if (unlikely(!sheaf))
 		return NULL;
 
+	kmemleak_not_leak(sheaf);
+
 	sheaf->cache = s;
 
 	stat(s, SHEAF_ALLOC);
-- 
2.56.0

