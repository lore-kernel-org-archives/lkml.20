Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642505;
	b=yyqqsjpJxLBhSOAlQgi2LBBKePxpS6aVmoh+Lgha53Bjkh9HEa8p1rRk/wkSPfLRz6xZ
	 AwZMoP9p2ST+Qr7swBUP7HPzdhgb7D4IobIIMxQAFrhMhs/m4W7piBETwmXvyQg4dhrih
	 9yMdXdTu1BXsB+fn/nOcX7Z3yl6Snj/F5s7vmz549veLgucaJySuBD8pLFKIH6fl4jfG3
	 +DqtCWiwNYk0op7YHw3bfJG52tMjfxpJcV2n1pJ64WJ+UJSAFMjSg60Az8no30YwLOqrz
	 6KoE2BDZyEdeq5rJYPc/I6hEGQkPHIApojzX5+e8gaPEoYj2cRPcjy8czG5KH1XsdVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642505;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=n6pcF6rmR37Ad2Fm4UK4blFgh5uY44yqEr5f03WIru+9LNHaLI33lqCMM3mpJY25aPTO
	 meNpxEiMgKFDLszgsAVeZzcsfDNhdAD6bPOFGqVVkBQWy5KTTNZE+ZCHJtWHqfOdmdKki
	 QEWkC2fD1NkGSV8Vrbn+OldGkc780068z8xT1XFnynrQFLOB0qqdX8h6G2I16inV9hU1D
	 rY2UmtzT+y9G4QHrfqMkqIKDhS4HuvIOb8CPNg/hgO9BLBy1JAVMymo6zbnyJbu/HDLB/
	 oReznsbrtdTc8co/A5kRNjZiAkvKqpT8NfhB1o+ZKc2h4kQr5yO7MNnnph1boHHAe5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T8WTb2JF;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AB606A335
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5AB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T8WTb2JF
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso910794a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642504; x=1795247304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=ZfIxLS/s0kSFz6oqzD3Bu4uRywcEbTOOrUgZxlmxzAghszIFrch8YV/hPpGCqTs2GO
         +7rEllsJOrxalpqweNe7jPB4Fsotx7irKuHrWSsFF5fMsHwRZjZIjWgo6qQxZv6QhXSV
         OGRvwDesdkN6A1UUgG9SypkT/5Sa6Mm5jMN2OKdnR/q3/KFmHkRs22TkofU2Rancjn/D
         0Et13Tlq5Aco8l0MQ7MSeuFPNyio/0BkqijsF46NmvouKggN27toU5DiAyjZvVjMrQDy
         QKV9dhMxBNimtd9s5xqK2G9lECptczA2LSv4Zz5ARNS/+J6FiY9g93441FUMkB4oAde3
         yCgg==
X-Forwarded-Encrypted: i=1; AL+hErFk371bAi6KrOxutBxz2jnUtrroeZ2KvC8uHNPWAPa41bSuSfqk4mD0SXailxw/2dfbbzGo6kGQWJtdix8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/73YiMZQ1ot2QxTvGH3u/GOMRM5JTxOz6GaHbXA8REkv/cjJyD
	U4kUC91MC+jUgKcDkrEZChxbytY/MvzZIxhdv0HqR+DCoTeRYEjqmYzddHccLKsVmBvwMWRg9U7
	iG9x5L2psSF+mvKyD1ok28rgJLP6+aA+Ec8GdyqGr2q3C7nf8Fl+AiP5SFrQsA+6jL18ewVEPyT
	jcLCmbCz3NEi3zYMOCaUoZ94jCyoaHlHxsdGb6anYYXFgiCKhMmvgwyK+X28Yj7GSCzAtBgO2we
	nVWnLRdZuYsroYNuw==
X-Gm-Gg: AYBFou00PhORdGDAnsy35/iE+o+Wm5+Zd91SzZMyl5oeMw2K9C15pCWtIhcqpNo7vfn
	F2pvCkhePEv/5lKTT7l+vkRt6C5rTtJ9YJJss8n5XZP7mYSapthdRwwYCpZq7HAHSNLR/MWTc4P
	z6FrmcZmtqtnZrbz2l9Z1CHWKl+z5BgiHyCxAKijLZDexZDsFc8WNxIvbLmp9qP9BnvhL+RdyHK
	fTvh7nzTST3TzN6mwKOhl0l6ODxjIEffN81fHzb/9wBk92AM9+WqbVxbvDgRi0cImPprOU9eCRo
	CF0dWsAsiqNIXVR6U2yAT+IYRk+qtlu6XpVtS+R37ltj44T9C4mM1JFlQwLYLSc7Cj/rhcpIcLV
	6W5NFedU3qhsvnF/FLnkvVUimWIKVh6DhNq0Al0u5yddoPPX/vPxrq3Uz4gjHVeqYLuyNACjUQB
	TU3eAEO4srfkfglg2PPL+SOQ8scBYdkpAHng2F
X-Received: by 2002:a17:90b:570f:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b1b0815b4amr4703137a91.3.1794642503703;
        Fri, 13 Nov 2026 23:48:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdc76asm9604598a91.7.2026.11.13.23.48.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:48:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so1794132eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642501; x=1795247301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=T8WTb2JF1SGh/abGgK6f08W+6Q3nQ0XGXIHbQm+/SGIUskUwH4RCFXhZy7iXJyjPlT
         S5VQx9NsG/rZWRya0d59EBCHYu24N/zTr3VvCNX2FqMxXW9B6TBtUJduv3kN4VlGq8c2
         TDaUn2SeRkfZPC+8D+cB5RINQ3QnLNiYzxsY4=
X-Forwarded-Encrypted: i=1; AL+hErEex6eUl0h2odKpIw1XNegQG6OuO4nuaWSouft5NeUxcBthqv9bwykJy3VwlhU2a4HEOYmBKPRxaI2wWqI=@vger.kernel.org
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr6522242eec.25.1794642501291;
        Fri, 13 Nov 2026 23:48:21 -0800 (PST)
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr6522204eec.25.1794642500655;
        Fri, 13 Nov 2026 23:48:20 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:48:20 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v7 06/10] bnge: remove refcount from L2 filter
Date: Sat, 14 Nov 2026 13:17:38 +0530
Message-ID: <20261114074742.1484603-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
References: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A reference count was previously used under the assumption that any
context holding the last reference could delete the L2 filter.

However, going forward, the filter will only be removed by the same
context that created it, making refcount unnecessary.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 33 +++++++------------
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  2 --
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index a8bb441ebef9..6316f75ca36e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -4,6 +4,7 @@
 #include <linux/kernel.h>
 #include <linux/dma-mapping.h>
 #include <linux/jhash.h>
+#include <net/netdev_lock.h>
 
 #include "bnge.h"
 #include "bnge_netdev.h"
@@ -13,8 +14,8 @@
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
 {
-	if (!refcount_dec_and_test(&fltr->refcnt))
-		return;
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	hlist_del_rcu(&fltr->base.hlist);
 	kfree_rcu(fltr, base.rcu);
 }
@@ -31,18 +32,19 @@ static void bnge_init_l2_filter(struct bnge_net *bn,
 
 	head = &bn->l2_fltr_hash_tbl[idx];
 	hlist_add_head_rcu(&fltr->base.hlist, head);
-	refcount_set(&fltr->refcnt, 1);
 }
 
-static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
-						      struct bnge_l2_key *key,
-						      u32 idx)
+static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
+						    struct bnge_l2_key *key,
+						    u32 idx)
 {
 	struct bnge_l2_filter *fltr;
 	struct hlist_head *head;
 
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	head = &bn->l2_fltr_hash_tbl[idx];
-	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
+	hlist_for_each_entry(fltr, head, base.hlist) {
 		struct bnge_l2_key *l2_key = &fltr->l2_key;
 
 		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
@@ -52,20 +54,6 @@ static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
 	return NULL;
 }
 
-static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
-						    struct bnge_l2_key *key,
-						    u32 idx)
-{
-	struct bnge_l2_filter *fltr;
-
-	rcu_read_lock();
-	fltr = __bnge_lookup_l2_filter(bn, key, idx);
-	if (fltr)
-		refcount_inc(&fltr->refcnt);
-	rcu_read_unlock();
-	return fltr;
-}
-
 static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 						   struct bnge_l2_key *key,
 						   gfp_t gfp)
@@ -75,9 +63,10 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 
 	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
 	      BNGE_L2_FLTR_HASH_MASK;
+
 	fltr = bnge_lookup_l2_filter(bn, key, idx);
 	if (fltr)
-		return fltr;
+		return ERR_PTR(-EEXIST);
 
 	fltr = kzalloc_obj(*fltr, gfp);
 	if (!fltr)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index ea1acefd70b4..372657cba43c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -6,7 +6,6 @@
 
 #include <linux/types.h>
 #include <linux/if_ether.h>
-#include <linux/refcount.h>
 #include <linux/jhash.h>
 
 struct bnge_net;
@@ -49,7 +48,6 @@ struct bnge_l2_filter {
 	/* base filter must be the first member */
 	struct bnge_filter_base	base;
 	struct bnge_l2_key	l2_key;
-	refcount_t		refcnt;
 };
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
-- 
2.52.0

