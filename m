Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861722;
	b=OoOR2kRDmEboIvGPvPzti4nasJTnHHBcsniT/0izq+YM2rYvWacudn6vc6SL1heEI3ek
	 22d9yO4ys8BL7T0P4QFT8kUoblWzY3yBdYfH/6TtQizCIBZljthLT50PqAZOe/abmfta/
	 pyhwvzszL2FopEMq9G0HiXO0g97cuSLJ6uNf4tpGyPY6XJBI8ssYrVLCTBxMzcn20AHN8
	 1bhFBxMTciXZls5Q90pTJAXMzWllHNtmYicyH/ztPZ3M9dIQBJRJBE4H0wlHH984Ju6OU
	 c9rjAqwGoVzYirW/NyLHE3pkZ2uja1XDHn6NeqqIlut1q4I7vBt9UHL+o1x3mKcmjPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LQW85bAVVPCdOOgk1XApSwydrJwSt71hzV9a95J//68=;
	b=WTm4gmKBgcuqC+0ZEjQuEBdUpPl6XjRCsKl2Vor/IOcwCm9zuMHVXvWRiNXv7aAZS7uR
	 3R0+y/4KV28edM/C+tEarDi77ULrrIN3aIzut4KAEOF6gOTvIk3zVq11e0g3vVldOgMBl
	 lFgDk6KC55C+C3SPwRFzzJatwB62ZOIvwiJH+rn7iNA8DHTYgiTlygniy7xZMt6PcV83W
	 0CP0RxpjL2YRyZPztSNF4O68F2JFLwMYx9xgvDEUs9iT5j+Xf0Kc8Ko6Y41pgZ8qX9ES+
	 fbUixxad5KNK89ar0aiTjPW2vSdee/rK6gNP3wg2zR0lhlmoFQs0KJkXIK+3Dw4/hpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CYBJgBxn;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E317606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E317606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CYBJgBxn
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so131619a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793861721; x=1794466521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LQW85bAVVPCdOOgk1XApSwydrJwSt71hzV9a95J//68=;
        b=CYBJgBxn0EY06zA58v4VQ98AJISJdeEknofMoU64gnuZ15tc2TFF0OTo5Fzl4zSzo3
         mhT/LynFJYsIEns4tggxcXTPmQ6Nko6WFvaXl1W5UYcc3UQAqg7Ok89mjPM/SpJGH4pu
         kDXTZACy8zKkPTzkF6NKDIH3ZYiPaudqcLKV3owpnK1JRphfrneXYqliOtGINHTe4Feb
         0W/PVlOo7wC5BAJu6Hy+fxqRp8o3nwllJeRPj+UoR+fkte0KcDaGc00yPbv8DFzf/fly
         ZzL6qAJ7t9FEgjteU9nqFtJ+uoBKYhCEK7WlVmAZIfx2g9V5tLcbAtWOVAI1E3GwB+sP
         8J1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861721; x=1794466521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQW85bAVVPCdOOgk1XApSwydrJwSt71hzV9a95J//68=;
        b=L5C/rK9DJXV1NX8Br+hFElZEnym4i11E+5DYz//C69q0SCLGUi23IIgM8g9b/zn4T0
         kqrsClLVXHGeqmOre9h7KWMyZkb2QGnI60IcfrnV/W2o47TNdPhp5klTxiyC2E9tdGLd
         iIDtQ8OrV1I0ARyt2oSV9CVcjL3eMvhh/Oq76xrNLTj4LFtW7Olen31gdGVzRIkqSA3w
         jLreP6gWg7+b9hghAEvGAVTVt1Ku8buSgiKsCX4OtWdizsGMHsA7Znr5JdzqSR5YGysb
         Ogzj4UkrszhAQ1RX81c1IDaKNSxJZ0BTvh1IIkYzL4CCYZIETFLA3QAcU/IIOEtxnErg
         4Y3w==
X-Forwarded-Encrypted: i=1; AKwUvBw/2YTFpuFY+A9wOWxQjNIcoIFBaHTMBLP6iTZSPDY78khyOTWahvOsx77DEI9L81mphl+D2PCTk6/GBs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nyoAgB+vDF64b3kTMwq9xMTGPyQRFEvxDBcIhT/57gyJoZMjG
	b1XaeVLPJ8zWcqKLgTCJJ7MmbQm+WjWOg0js332p3Qhy4B95zMDeHqEV
X-Gm-Gg: AYBFou12+dzT4JrvsnhNldk6+ddv7xEmuqeTFzRHJyyI9+nWdkvSWGgj5MxzyqQ0vsf
	4YvcEycuIuDwC7S1qlaHkYYw700nqrYV9sH0Fl76X52m3h3fesTniJDxXQIS/xICzSoxMQEiOoL
	I21pEuvO3+JX8R84m3eotwrwt76LC0/5XfLkJ3d1sMilvG/1u2XLpC1cmJiIwzeojasCAWqO64S
	/R4sn9tWhxcwtaisCqrPqrURfUKAREkSrEs8mTDH0BvDuGbqmru4FlVp0YTrqnGZYCxk1J8d7dF
	vwGqjYBzSG5n1v2f+iGtQEfRPDG2kDt1d6k7rdXP9u5Ywnar+PQEUrNacFZcidpSb0qn7oM2Z0q
	crVcAXT9a3Tgxf9VkPEXIX5iELSaiVY0l/7LLXD7ycDAaZXqRvudP1KFbqGhC23uoBmMtxQQis3
	RxAasKrks3Vb6P+uwd107pJPAEPSjCfxxWvHnzTYFPxQFwukdyRlcrQykKy1rHtrvdly/PsGHWU
	cKALbCxiThdBRB3OpbUmTECB4K6p3QjrJVvDgYY2sxGPZ9QVyCAT5AoJRIwlmVCcB26iVhQimna
	Ib5Ig8Shahpw7AZva4ePS70ZXN3Zv7YpCEUSr6B5aY6PRJqyj+nwRGBFrMyFXmQGU2Vx6fLXjy+
	O30GIyaTukSt/4O0c
X-Received: by 2002:a17:90b:2e51:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3ae89282cf6mr26913916a91.0.1793861720549;
        Wed, 04 Nov 2026 22:55:20 -0800 (PST)
Received: from localhost.localdomain ([139.159.170.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31f8804sm2322929a91.17.2026.11.04.22.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:55:20 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	vladbu@nvidia.com,
	ozsh@nvidia.com,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qihang <q.h.hack.winter@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] netfilter: nf_flow_table: defer pernet stats release to last flowtable teardown
Date: Thu,  5 Nov 2026 14:55:09 +0800
Message-ID: <20261105065509.94627-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pernet flowtable statistics (net->ft.stat) are released when the
netns exits, but the flowtables attached to a dying netns are torn down
asynchronously afterwards: the tc conntrack action frees its flowtable
from an RCU-delayed workqueue item (tcf_ct_flow_table_cleanup_work()),
and nf_tables releases flowtables from the transaction release work.

nf_flow_table_free() ends with a garbage-collection pass that queues
offload works; flow_offload_queue_work() increments the pernet counters
when scheduling them and the handlers decrement the counters again once
they complete.  The flushes in nf_flow_table_free() only drain those
workqueues when hardware offload is in use, so after free_percpu() the
stray workers still this_cpu_inc()/this_cpu_dec() into freed percpu
memory.

Account flowtables at init time and defer the release of the statistics
to the last nf_flow_table_free() of a dismantled netns, after draining
the offload workqueues.  A netns without flowtables keeps the
synchronous release.

Fixes: b038177636f8 ("netfilter: nf_flow_table: count pending offload workqueue tasks")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 include/net/netfilter/nf_flow_table.h |  1 +
 include/net/netns/flow_table.h        | 11 +++++++
 net/netfilter/nf_flow_table_core.c    | 44 ++++++++++++++++++++++++++-
 net/netfilter/nf_flow_table_offload.c |  7 +++++
 4 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 5b22d31cb1407..91ffa3072a0cc 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -376,6 +376,7 @@ void nf_flow_offload_stats(struct nf_flowtable *flowtable,
 
 void nf_flow_table_offload_flush(struct nf_flowtable *flowtable);
 void nf_flow_table_offload_flush_cleanup(struct nf_flowtable *flowtable);
+void nf_flow_table_offload_drain(void);
 
 int nf_flow_table_offload_setup(struct nf_flowtable *flowtable,
 				struct net_device *dev,
diff --git a/include/net/netns/flow_table.h b/include/net/netns/flow_table.h
index 1c5fc657e2675..6d2dc0d1f06c7 100644
--- a/include/net/netns/flow_table.h
+++ b/include/net/netns/flow_table.h
@@ -2,6 +2,9 @@
 #ifndef __NETNS_FLOW_TABLE_H
 #define __NETNS_FLOW_TABLE_H
 
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
 struct nf_flow_table_stat {
 	unsigned int count_wq_add;
 	unsigned int count_wq_del;
@@ -9,6 +12,14 @@ struct nf_flow_table_stat {
 };
 
 struct netns_ft {
+	/* Protects nr_ft and exiting. */
+	spinlock_t		lock;
+	/* Number of flowtables attached to this netns. */
+	int			nr_ft;
+	/* Set at netns exit; the statistics are then released by the
+	 * last flowtable teardown.
+	 */
+	bool			exiting;
 	struct nf_flow_table_stat __percpu *stat;
 };
 #endif
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 0d72dc8ae47a1..de0a9f0e4f7b9 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -715,6 +715,7 @@ EXPORT_SYMBOL_GPL(nf_flow_dnat_port);
 
 int nf_flow_table_init(struct nf_flowtable *flowtable)
 {
+	struct net *net;
 	int err;
 
 	INIT_DELAYED_WORK(&flowtable->gc_work, nf_flow_offload_work_gc);
@@ -733,6 +734,13 @@ int nf_flow_table_init(struct nf_flowtable *flowtable)
 	list_add(&flowtable->list, &flowtables);
 	mutex_unlock(&flowtable_lock);
 
+	net = read_pnet(&flowtable->net);
+	if (net) {
+		spin_lock(&net->ft.lock);
+		net->ft.nr_ft++;
+		spin_unlock(&net->ft.lock);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(nf_flow_table_init);
@@ -771,6 +779,8 @@ EXPORT_SYMBOL_GPL(nf_flow_table_cleanup);
 
 void nf_flow_table_free(struct nf_flowtable *flow_table)
 {
+	struct net *net;
+
 	mutex_lock(&flowtable_lock);
 	list_del(&flow_table->list);
 	mutex_unlock(&flowtable_lock);
@@ -781,19 +791,51 @@ void nf_flow_table_free(struct nf_flowtable *flow_table)
 	nf_flow_table_iterate(flow_table, nf_flow_table_do_cleanup, NULL);
 	nf_flow_table_gc_run(flow_table);
 	nf_flow_table_offload_flush_cleanup(flow_table);
+
+	/* The gc pass above can still queue offload works whose handlers
+	 * decrement the pernet statistics.  Drain them all.
+	 */
+	nf_flow_table_offload_drain();
 	rhashtable_destroy(&flow_table->rhashtable);
+
+	net = read_pnet(&flow_table->net);
+	if (net) {
+		bool release;
+
+		spin_lock(&net->ft.lock);
+		release = net->ft.exiting && !--net->ft.nr_ft;
+		spin_unlock(&net->ft.lock);
+
+		/* Released by the last flowtable teardown, see
+		 * nf_flow_table_fini_net().
+		 */
+		if (release)
+			free_percpu(net->ft.stat);
+	}
 }
 EXPORT_SYMBOL_GPL(nf_flow_table_free);
 
 static int nf_flow_table_init_net(struct net *net)
 {
+	spin_lock_init(&net->ft.lock);
 	net->ft.stat = alloc_percpu(struct nf_flow_table_stat);
 	return net->ft.stat ? 0 : -ENOMEM;
 }
 
 static void nf_flow_table_fini_net(struct net *net)
 {
-	free_percpu(net->ft.stat);
+	bool release;
+
+	spin_lock(&net->ft.lock);
+	net->ft.exiting = true;
+	release = !net->ft.nr_ft;
+	spin_unlock(&net->ft.lock);
+
+	/* Pending flowtables still update the statistics from workqueue
+	 * context; the last one releases them, see nf_flow_table_free().
+	 */
+	if (release)
+		free_percpu(net->ft.stat);
 }
 
 static int nf_flow_table_pernet_init(struct net *net)
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e6a..6ac28802ef632 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -1180,6 +1180,13 @@ void nf_flow_table_offload_flush(struct nf_flowtable *flowtable)
 	}
 }
 
+void nf_flow_table_offload_drain(void)
+{
+	flush_workqueue(nf_flow_offload_add_wq);
+	flush_workqueue(nf_flow_offload_del_wq);
+	flush_workqueue(nf_flow_offload_stats_wq);
+}
+
 static int nf_flow_table_block_setup(struct nf_flowtable *flowtable,
 				     struct flow_block_offload *bo,
 				     enum flow_block_command cmd)
-- 
2.54.0 (Apple Git-157)

