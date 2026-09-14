Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6755372ECD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359145; cv=none; b=Xgc5ahk4iMsPBsK8kDfZCivQpe6p41tiu65JwA4HeghU3UE3SM+UKaXRIaklejYkmPMRUnM0SBcTIkY70QMFjWapsIVz0AnJ6uH5+j/Y0jJ/320PSskzQV4RmSj3TwQ6oYu93+VJ12Mx+VdBJ+BFNZPWV9TiGM48yuxYufcdL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359145; c=relaxed/simple;
	bh=ESNZSr3AXK9HlMk/gFGcAXiW9NstBhL9DjBXliLakIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=he0tUgFlmPxWihY1+FkGS7QebQk1cbMaIsXrKvB7n/Utf9FMVD0JAPMeg7c/u1PfhhIgc0HhjfOw2hquANANhsTWZkPpuJETzgVUilqb3KP2IQsGrJD3ckRF/jRqH4uxmqhEarhEn8apEKQdjXj/uNpQw3KRmqIEgy6CL17Hhxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fB+tv/Kw; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fB+tv/Kw"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90cc64570deso31077016d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789359143; x=1789963943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGnLBFbtVuYmY0fd2Ltr4LaVEVXK5J1EaYUMo1O47F0=;
        b=fB+tv/KwTmFXB/enKWm4S1sA4MTjcid0HueI/hQHFDh9lmyIoMAXQ9a31tTqNKUd9q
         DrZ9UhiqSzpMW09mcSjEg+3RqTJQeidqcbVnFQlh0iX59QOqw13+gSy5jge6F+pYW3sm
         eKxk1XW4aP6Ftf/xtKEWU3UwPK+9+1ZMSmHlwp56k71z49fPfYYOD1x/+oofxXsrXsC4
         3s/DcVNR2IUvT/6cbKgE/6i7g3VJhNRH8an+xPA9mPQZv1eyak2f7sSGSiZDdpy9xHsB
         zBZBtqB890rpDFPIyURatDG1rgCXvxtsSWhKSxK3EcsmynxD8GajbCLaMBmaWO9DiZS8
         MXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359143; x=1789963943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGnLBFbtVuYmY0fd2Ltr4LaVEVXK5J1EaYUMo1O47F0=;
        b=sLLwbjgDn8OgShqxPV1hoEWrOtqjNEdph3XTgy/mPtCYt1e2q/N1jWEatcrBxXslHo
         TiKsGt1EkQL6lSI2qe0EtKiZdUv29Qs77hHhSyTSW8b/r90tjz1diUC6/leU+4kth3s2
         n4wN9XMrmW1+4syv6W+cKbPsFLpzkfOrS2uGLYA67XIyZUrYatLOnmCj/Jjep85Ab3qZ
         8Qzbp+KRDklXR/Df68Dn3k/ELXFzzuiRh7bVb9jE8muXWbFKMgYMm5cDJWQENpRB2TJ6
         cn56dLG5Q3UKWobwiWTeowjy1qBz9JtFvRkcYYhQigJQQFsjm6J4wTqxHsgiytAunl+H
         WoKw==
X-Forwarded-Encrypted: i=1; AKwUvByc3lBMGcrZEUaK0PQbaD41nv2c/q/K6NYVgpqSP9dM2eheV22+RE0k+jsIL/trM45kJGtDHcBzaShcBaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kqa1ls4Zb9UY+hl4jrauG5oz1kPQq5SNQCmebB5oxYOUCXG8As
	pzBB5H18a/FigSWmM2WSuxWzqw/UkXggCdGUlttJSP8MDkhM7yhNRv3j
X-Gm-Gg: AYBFou3HSRTmARcZUqcdW3WgQliTY7rYA7YCmC6tVdaal8aWI8JSIIu1Xn07yZYkzoP
	eMmT++tgukWnbvyIEgR21qpWLJvKGqBbSUx3Hmnqd0q+lGmizn+49rAu/1qaaWNaJDqyPfwP2NF
	auc5IK/cdgfkX2boI9UTZKpykaKyhtzRwoO6dEf+zsEkz56VfCJB0GYY+y58TXmujBrmAINTsMk
	PRILKcPO7N/cw1Jh3r5oKjr3aemzd4ynqXE0Vaq63BzttfzTQvjRCvlbycYqWaR/YxA1ZJx/Oim
	JNw+1PVdc2lCrDWs754kt6/SHHyNww5tKr3WiWPY3iJqC7NxIx2PxsbuQwDcve8XXudxn0THYKT
	XPT7uov6Nv+b4Uqyb1R+BFi369hsV5qD12NCy8lRyxS/Sv41cSHKoLP4Vr846VLbV5IFsOraxrf
	lShEuth8kt8xkODP3OIEnib3GSmEPfvZuzGgwVmHslG6o6aq8IzudHizMzl2aL27/39fhksu07M
	2z4J91TFARlEX8MkuYGfFeoIa8HO+u9Z4KrKGGpagW/y0pllwTqDXp/hrwmmPA9wyJBj175khhB
	wOyL6fn0lR3DXGMx27JHq4F6zS8TS+KxzjpaaLlzMejCuO8gkqWQSj/askq+p6TT5xsQ/G6Ko5O
	Kpk4lnmwh3BCA2oEjiVzabol8oyCSDK7Dr+Y=
X-Received: by 2002:a05:6214:8613:b0:911:2a7c:65b9 with SMTP id 6a1803df08f44-91226be65b9mr53306246d6.30.1789359142637;
        Sun, 13 Sep 2026 21:12:22 -0700 (PDT)
Received: from edhar.longhair-great.ts.net (pool-173-48-206-252.bstnma.fios.verizon.net. [173.48.206.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d35a9sm85215836d6.41.2026.09.13.21.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:12:22 -0700 (PDT)
From: Zack Gomez <zack.gomez@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	leitao@debian.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zack Gomez <zack.gomez@gmail.com>
Subject: [PATCH net] netpoll: bound the deferred transmit queue
Date: Mon, 14 Sep 2026 00:12:21 -0400
Message-ID: <20260914041221.1028092-1-zack.gomez@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__netpoll_send_skb() parks an skb on npinfo->txq whenever the device
cannot take it at once, and once the queue is non-empty every later skb
goes straight there to keep ordering. queue_process() drains it from a
workqueue and, unlike the direct path, never polls the device for
completions: when the ring is stopped it backs off HZ/10. Nothing limits
the queue length.

A producer that outruns that drain therefore grows the queue until the
host is out of memory. Observed with netconsole forwarding a GPU driver
that logged one line at ~1e5/s after a firmware hang. The NIC was
moving ~17k packets/s: completions for each burst surfaced tens of ms
later, outside the one-tick window, so queue_process() slept HZ/10 per
ring while ~1e5 lines/s kept arriving. The queue grew at ~170 MB/s,
unreclaimable slab reached 51 GiB in five minutes and the OOM killer
ran from kswapd with 341 MiB of anonymous memory on the whole box. What
the queue held was the flood itself; the OOM report never left the
host.

Reproduced on the same host (netconsole over a 10G ConnectX-4 Lx) under
the same slow-completion condition: 200k lines to /dev/kmsg in 0.12 s
left 188k skbs and 173 MiB of unreclaimable slab parked, draining at
~8-10k packets/s. With prompt completions the same burst drains at line
rate; any stall on the link reproduces the growth.

Until the 2006 netpoll rework [1] the deferred path drained through
dev_queue_xmit(), with the stack's own backpressure, and was capped at
16 skbs (MAX_QUEUE_DEPTH). That series moved it to a direct
hard_start_xmit() with the HZ/10 back-off and made the queue
per-device, dropping the cap on the way. Neither change was discussed
on the list.

Cap it at 1024 skbs and drop new skbs beyond that. netconsole already
counts NET_XMIT_DROP in its per-target xmit_drop_count, so the loss is
visible in configfs. Nothing is logged on the drop path because that
would recurse into the console being drained.

[1] https://lore.kernel.org/netdev/20061026225645.482978803@osdl.org/

Fixes: b6cd27ed3388 ("netpoll per device txq")
Signed-off-by: Zack Gomez <zack.gomez@gmail.com>
---
Tested on 7.2.5 with this patch applied: the 200k-line burst that parked
188k skbs / 173 MiB on the unpatched kernel parks at most ~2k skbs and
+4 MiB, with 182k drops counted in the target's transmit_errors; with
prompt completions the same burst drains at line rate with a peak
backlog of ~180 skbs and no drops. Built with LLVM=1 W=1, checkpatch
--strict clean.

Two choices I would take direction on: tail drop keeps the oldest
messages and loses the newest, which for a console are usually the
ones wanted, so dropping from the head is a few more lines; and 1024
is arbitrary, about 1 MiB of skbs.

queue_process()'s HZ/10 back-off is why slow completions turn into a
~10k packet/s trickle; a shorter retry is a separate change I have
not measured yet.

 net/core/netpoll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index fe1e0cda5d6..8fd640955e4 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -38,6 +38,14 @@
 
 #define USEC_PER_POLL	50
 
+/*
+ * Cap on skbs parked in npinfo->txq while the device is busy. The queue
+ * exists to ride out a transient stall; a producer that outruns the
+ * device for longer than that must lose packets, not grow it without
+ * bound.
+ */
+#define NETPOLL_TXQ_MAX	1024
+
 /*
  * carrier_timeout is netconsole-specific and only kept here to preserve the
  * netpoll.carrier_timeout module-parameter ABI. Its value is exposed to
@@ -314,6 +322,10 @@ static netdev_tx_t __netpoll_send_skb(struct netpoll *np, struct sk_buff *skb)
 	}
 
 	if (!dev_xmit_complete(status)) {
+		if (skb_queue_len(&npinfo->txq) >= NETPOLL_TXQ_MAX) {
+			dev_kfree_skb_irq(skb);
+			goto out;
+		}
 		skb_queue_tail(&npinfo->txq, skb);
 		schedule_delayed_work(&npinfo->tx_work,0);
 	}

base-commit: e6b6078ea1731b05b3b552497b3bce4bf8b014ae
-- 
2.55.0

