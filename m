Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5844C4EA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369141; cv=none; b=PnxSl3vMtQV3jUIC4YP2hsvwGFvNzg66hMHw0OzT77V7fu/Zlsx5Z+pBgN0/a+7TnMpFGi4NUpd2aeePhtloaOPx3a7qeWMcui8YLn0MYACNsp8OnCJMOXL0V2tS2ZZUcCjaZrD8ilgsLHKsxgkNgKwzLq6hmvYa/FkgVvXVuj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369141; c=relaxed/simple;
	bh=C9Wk62pJBXEx27wZN7UDhpZWa7Y9qZSKBCXv3NHzM8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CtBtcXoAfwdRhpvAsnhcLl4VqBO4qfJFlszwNi75TElcon/djtG3smTL9MF9qaU3Ibu8f0lK2tGH+V+F/kxoXQxV6N1oALBXk7uZfmAFPLOFHKz3t/1Yo2Fo7sff2xiaineh4UC/E3FWUj5+geFqD7IaGtikCA+l8IBHctCKyNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdSzuZBk; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdSzuZBk"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe57a3aso13008496d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369139; x=1790973939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AP5S6TmUpYxXbP0ZPL/AqCAE3OTJR9LcuiFAhggbsis=;
        b=qdSzuZBkOCHQ/fVHubV6HsFeeYJdzstngMnaR0b/b2/NmEBrsEfRYGnAA7GEfg6D2w
         TI1GyqAVFQeAmqNr5mAh/elA8PbVQa9WfLQH3LXHqJj9gMl/bi06QcT1A013NoPDvcHv
         nS/Boyw/ysFB4YwSYgJtZs52Y2WOToeE/XdGOc36U9B108fDXNabV1toevOM3GtFmCaF
         0zOfbOwuYHquw5pO/A/wBUFY0/o+G0Mu/WL4NE5Dk3FvuXpxvU96YdId+24ZT8kNtkGs
         CtUdj0EbAdq5+KPUAquNPzxUAtjKXvpr+AO/wPbE9SRqLthbCev7UQvBHjv2B+rv5LaU
         9Jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369139; x=1790973939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP5S6TmUpYxXbP0ZPL/AqCAE3OTJR9LcuiFAhggbsis=;
        b=ZRW+agqSDPvwAmWLoAAsInVZeqpIs7hCHpEgroRo9rj7cXr1pbFylI9eyQ1WUrWv01
         KYlO0mEbMYx+TXxYO6U38NixMLXVAm1HDiaGL7sNYhTShZ0pwB6IUim8C6W0cOozaQQL
         uYpIyZgCkfomb7oEDDEdjRXVdgPnUWCCPWCnGIqN8MLu+qwYpBbgY8N0GBhiiB/KwFPh
         FFm4o/FbAfYbfYgFRagdUTmllvyLxIvRtSy/Dqbat+RjmuQQT0XZ+ie/VdtRpQ8quAFI
         AHXUqu0LHlQg5cqc9ZSTwKev2cpQIEFhk/y7gt+XaI0bWTQB8N2P8ypHE9YOT2j8aXR0
         Vipg==
X-Forwarded-Encrypted: i=1; AKwUvByQcByp84GixSMwTL5L4iTD8yEoD34xFLB09TnbO1nU6puF5J6ec2nNaOICvjU1i8DfJQPZyiQnyZMQGoc=@vger.kernel.org
X-Gm-Message-State: AFuF++ka/Eg7ACRv06p33tCp7e6uwFpD1vNtp8Uw6vDNCRwurL53ruNU
	tPd90PqS9p8K6S+69JXyIiA2rvJMNzj4tasKn3s3Yhnx4RQ2/xDxXrd7D5waYoTP6MY=
X-Gm-Gg: AYBFou2qVtJhJV5TppQ3Ppo0LemMLzZRLEoq5xSMnr6q8W3awah8A8G5cWPsORH4nP8
	CM+Eo4xKZz9Z8Xvh/L2eLaSFm0dAUV1IdwJ3vkO0znad2tSdoIQWFofWY5IK8K6OK+AmKTLMRko
	mf8m/uVS4lUwHYlZJX1jXuJGxjsvl+Gi/vdeObrmPTiRTm+KP0eC67wZ59SvU4AUd/IkCqR9Rlb
	dLgJqf5DppO6ZjZ8wBvl+c9C7c+a9pgewAgvoNNYNnSBpy2xi+8v0fM7rC696Y7ecjfqubKlgTC
	WgsJtdklB6AyzybX+ezSzZ5zvqZ/oilKEPIhdq8fX3svRnjiRGoWrLqYSbLzJG+COBxnjylA47v
	2OtuzOITJbYSZ1LwO/upekztAureULDrjemFXzFcqRUhqjdqsSYhYsWIW6xLYJdsMqHkxvC3Mio
	4LDvmk7eOfkxpvf//w0c2BqmT8EboPAZRHgU1hFNvfakfw5GgtVW/uBd9Zthz+jiWyrTnM78SEe
	U3Wgb5pbX/G0Rd5PF2323HFNYygSAXMn9g6I+Dz1fEY5+Ds08LOvSnbBUT4K3jS9Oh53QV+gKW/
	2mAZGhztpCiEBUR706UtNfHW+GMNACpymXZ/zL534bbU6mleeQ854/i1zmx/n6U/al8AOLCOkyq
	mUd7QqwOQlgo9NBzS0vT4pdJi9Nmsl6mFvQWX4QfpNizFWmAk+upTJwQ=
X-Received: by 2002:a0c:e091:0:b0:914:33ad:5ba8 with SMTP id 6a1803df08f44-91433ad5e8dmr45171076d6.23.1790369138599;
        Fri, 25 Sep 2026 13:45:38 -0700 (PDT)
Received: from edhar.longhair-great.ts.net (pool-173-48-206-252.bstnma.fios.verizon.net. [173.48.206.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9143d30b437sm12854876d6.38.2026.09.25.13.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:45:38 -0700 (PDT)
From: Zack Gomez <zack.gomez@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	leitao@debian.org,
	stephen@networkplumber.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zack Gomez <zack.gomez@gmail.com>
Subject: [PATCH net-next v4] netpoll: bound the deferred transmit queue
Date: Fri, 25 Sep 2026 16:45:37 -0400
Message-ID: <20260925204537.2664119-1-zack.gomez@gmail.com>
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
grew unreclaimable slab by 173 MiB, about 188k skbs, draining at
~8-10k packets/s. With prompt completions the same burst drains at line
rate; a stall on the link while lines keep arriving faster than the
drain reproduces the growth.

Until the 2006 netpoll rework [1] the deferred path drained through
dev_queue_xmit(), with the stack's own backpressure, and was capped at
16 skbs (MAX_QUEUE_DEPTH). That series moved it to a direct
hard_start_xmit() with the HZ/10 back-off and made the queue
per-device, dropping the cap on the way.

Cap it at 1024 skbs per device and drop new skbs beyond that. The drop
is counted in tx_dropped of the device whose queue is full and freed
with SKB_DROP_REASON_FULL_RING. A netconsole target bound directly to
that device also gets NET_XMIT_DROP and, with CONFIG_NETCONSOLE_DYNAMIC,
counts it in xmit_drop_count. When a stacked device (bond, bridge,
team, vlan, macvlan) passes the skb down and the lower device's queue
is the one that fills, the return value does not reach netconsole and
the lower device's tx_dropped is the record. The bound holds either
way. Nothing is logged on the drop path because that would recurse
into the console being drained.

[1] https://lore.kernel.org/netdev/20061026225645.482978803@osdl.org/

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Zack Gomez <zack.gomez@gmail.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
v4:
 - no code change; target net-next and drop the Fixes tag (Breno)
 - collect Breno's Reviewed-by
 - v3: https://lore.kernel.org/netdev/20260923181111.1182838-1-zack.gomez@gmail.com/
v3:
 - no code change; the v2 mail was line-wrapped and whitespace-stripped
   in transit and did not apply
   https://lore.kernel.org/netdev/CAErB-w3Or6jkhsy9phjf5uo1O-T_hHQLx-XBFZeHX_8tqN38mw@mail.gmail.com/
v2:
 - count the drop in tx_dropped of the device whose queue is full, so
   it is visible when the sender ignores the return value or sits
   above a stacked device (Breno, Sashiko)
 - free with SKB_DROP_REASON_FULL_RING (Breno)
 - skb_queue_len_lockless() for the unlocked length check; the cap is
   a soft bound and the comment says so (Sashiko)
 - commit message: xmit_drop_count only covers a directly bound
   target; slab figures described as what they are; dropped the
   sentence about the 2006 list discussion
v1: https://lore.kernel.org/netdev/20260914041221.1028092-1-zack.gomez@gmail.com/

Tested on 7.2.5 with this patch applied, same host and reproducer as
v1. Under the slow-completion condition the 200k-line burst that grew
unreclaimable slab by 173 MiB on the unpatched kernel grows it by
2 MiB, with 187229 drops counted in the target's transmit_errors and
the same number in the device's tx_dropped; with prompt completions
it drains at line rate with no drops and a sampled peak of ~1.1k
skbs. Slab figures are deltas sampled at 4 Hz. W=1 build of
netpoll.o and netconsole.o on this base is clean, checkpatch --strict
clean.

The first tx_dropped increment on a device allocates its core stats
with GFP_ATOMIC, the same class of allocation find_skb() already does
on this path; they could be allocated at netpoll setup instead if
preferred.

Still open from v1: tail drop keeps the oldest messages and loses the
newest, which for a console are usually the ones wanted, so dropping
from the head is a few more lines; and 1024 is arbitrary, about 1 MiB
of skbs.

 net/core/netpoll.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index fe1e0cda5d6..aafbb19a288 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -38,6 +38,15 @@
 
 #define USEC_PER_POLL	50
 
+/*
+ * Cap on skbs parked in npinfo->txq while the device is busy. The queue
+ * exists to ride out a transient stall; a producer that outruns the
+ * device for longer than that must lose packets, not grow it without
+ * bound. Checked without the queue lock, so the queue can overshoot
+ * slightly.
+ */
+#define NETPOLL_TXQ_MAX	1024
+
 /*
  * carrier_timeout is netconsole-specific and only kept here to preserve the
  * netpoll.carrier_timeout module-parameter ABI. Its value is exposed to
@@ -314,6 +323,12 @@ static netdev_tx_t __netpoll_send_skb(struct netpoll *np, struct sk_buff *skb)
 	}
 
 	if (!dev_xmit_complete(status)) {
+		if (skb_queue_len_lockless(&npinfo->txq) >= NETPOLL_TXQ_MAX) {
+			dev_core_stats_tx_dropped_inc(dev);
+			dev_kfree_skb_irq_reason(skb,
+						 SKB_DROP_REASON_FULL_RING);
+			goto out;
+		}
 		skb_queue_tail(&npinfo->txq, skb);
 		schedule_delayed_work(&npinfo->tx_work,0);
 	}

base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
-- 
2.55.0

