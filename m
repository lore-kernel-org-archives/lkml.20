Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838112;
	b=H6OPfdv1Rl/uUH93euf5FQq3FrP5ZZRklewDk9J8VmvJctxYTdvBRwM/yB3acAGzaNEY
	 6/tJlIJ4WZ7T68aghxynO0pi30z+cUCjWy0XcfVQFygziN0Ji2y0cPSzSjYDiUjFkxzMb
	 E8BfCLejfzo6SV77gG0dlfnJORV3JGcqXZdz5fz2bjcpEIvdkL4dvv4w7yZAnnH9NCHjd
	 y/TtDf5ZZ4vvtCINqiTnZLq9JFz2CB2tpP6bJGQmz0CGx0IRnJ2l2PclD3ow2Kks0Ic5Y
	 VyrpZpUruR76HSRw2BhUkz3IfmpypwOaIkFZvC77i+JnLxquxy7fNIseHa6seo2CsEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838112;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=u6tAjeicRjg+pINJ1QgTJwdeDiT+4L9eUa9vBu1MdZncxszk9CxoPelPWv2uChB/T1ZE
	 hyT2UsknOecYQzU0XttZlh3hXawiUztUOifvm/mZNBbIccJJvqXGUEBvobP0i/JuddNMP
	 TJo/rTWvfnP5rGsVWy077GYcs8EHyh+b5oXoOU4jV1ZHb33oZmS6lK93dscGLFUloAo+L
	 0WmxsDVBtxR0Z0+NicxD5YKJDvF97nw1ONF1QEdivnxPTxzsUOhs87jJ6u4P0MvC5L3+a
	 v23Ka3ychN7nnwdR/JveOzdGTni4jGesJLGhpoKyN0meMVB65L+FOHEY+MBaQkzfyJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Ri/Td3sa";
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC439606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC439606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ri/Td3sa
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4546182eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838109; x=1795442909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=Z9L9QglQUXKhTTdsLeYyIi13z9xDvOOCbrrRxEw7lDcYcDAPkXneAjXApzxIVOH+ml
         8yUoD19LBn1vgUzLQENRmmtp/srGkTiMxOvqYa7urss7k77FQkYRW4WGHlnSW/Fusrbc
         tOFZcGtVgncFACkwDWZhxEujD0h6ECGUyXUZNPfxMTgopgXQN48cnbV/mmRo9i9CIv0S
         qc1CLDXmBWEocuT9UWLT0x+RJJhGlx8MQoPYSWCEZuZjzV5XUBjlybFtthvXJa2HetOk
         ltKOx0Ua2VYWwIOM1RsQDjZKnp+iEvMfhVJFmQxV7K9map4BxxDmTuweUH9hbNWnAUjs
         q9fQ==
X-Forwarded-Encrypted: i=1; AL+hErG4X558cJl5Dn9AopZDj4JmBJBcc4wqRvGJCYTtg+TxbTRycaZBRm2++W2yiEk288f2onDkuulIW8YSFPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T9oulYiniwJ0UyYQBxfWxQxoiSXT+XtgbQl8GTiSWzIIz88dE
	jDTTftOwXNmwBLNRbDtLxa1CCL7Etrypy4okk1OO41SfKPrhKz81BIPdSuAaPSXzXn0gXwimmca
	qGCDQxOycyQfvZ3lBPN8GpuEA3/Zkw6crLX5mYBbKCdkL8F0AK1k4PnrB6nd3TcW4UuQdjADVHi
	lsq4mcELH0/cEXIMIX2i4qHy9lpovuCb8n4ZitTpUCnCQDSaD67uGDbIwyTbW89DH9ZeQzRaz6e
	kax7CSawhKMHkwQWQ==
X-Gm-Gg: AYBFou29gWeBSDE4DW4befL93fp1lyT9LtMQu/r4BhqkslKajWZ2/dI8DPGgBBCUymG
	yAqqaIbCNFonmUqBw6jcpsAqfr0v4Q33JeqXU7o5WZnYsMfGD8HQapxQC+5KQ2ihNhAA1otORX+
	O4J07Tvd4wZJqDcG3LUiB1VHIkEyZSYtL9U3wYmyRv6D2RU+PNxkdg4kRWXLmmPCfP0fZFH9rkQ
	yz6tKS2pZdq2H/Sh6gsRWTjl5YeuZfy+E+Jw0bIkWSKAw1gGGdVnGTc94xemEbY7f40GVDRc4WO
	0Cag6uevqb5OGDWr2iwL4pdtUjeSGdAU2vfT0JTKCX9f5jNz4TFW3kB7dsDgSVdf2u/XeuIxSq+
	QlORPvPYiY3fYqw283pSsejHNenAqQvr3yDbjaD2spk5LjA821sT1ORH9slixqFli0r2rQoKGrj
	4vPXPMzevpIp668VlyvKBH02JQ/KoI4c10bg==
X-Received: by 2002:a05:7300:cc9c:b0:371:5cb0:4929 with SMTP id 5a478bee46e88-37967dd4c20mr10508424eec.25.1794838108473;
        Mon, 16 Nov 2026 06:08:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3795ad66d83sm283934eec.29.2026.11.16.06.08.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:08:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so4768684eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838101; x=1795442901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=Ri/Td3sasYfpiEQK15iA2TU3pgLv1OF7Sq4E+VGPUcCiuuOkX1aMNgXG/oCK/6G8LB
         TIcaEBkgUflGcxsW5MQRwfP1Ar9estREpau5mNSRzv0kWBkmpRqKL0yzmVPvSw2aCw4x
         sgJwhhOb+H5gSQPWk4PNvehWnq8LzGT1FxKeE=
X-Forwarded-Encrypted: i=1; AL+hErFh0oYirZ4+mKWNiwcrOzGfsDvT0RNR/6fXxEXfcag789MuyQRFTFms35F1/syP8dJSTpBBVXab4PHKIC0=@vger.kernel.org
X-Received: by 2002:a05:701b:4507:20b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b53490db69mr1561650c88.34.1794838101188;
        Mon, 16 Nov 2026 06:08:21 -0800 (PST)
X-Received: by 2002:a05:701b:4507:20b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b53490db69mr1561599c88.34.1794838100486;
        Mon, 16 Nov 2026 06:08:20 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:08:19 -0800 (PST)
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
Subject: [PATCH net-next v8 06/10] bnge: remove refcount from L2 filter
Date: Mon, 16 Nov 2026 19:36:49 +0530
Message-ID: <20261116140653.1685797-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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

