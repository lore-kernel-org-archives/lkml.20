Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9414449B34
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627603; cv=none; b=AaQcQFMJcnfvBCxaCVxPW6fmqNWkO5dwnVH9jOQGVA5qelM2yCX3sP4lUa3HtxWB2+wqiD6VXpQnsalmgT1kcdGPRSelcGCfsTCpC//0CMM/g4HFO9bULLZ8DmO6XqmeJTjyR39pD0EVD0UIq076OlzMH3mCcWNLb3qHynUKWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627603; c=relaxed/simple;
	bh=FJzSCfR4ZaCg30MFvONEMoFWjabSAHjeo4uJ9KGpewI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQfYNjc2LPk/pjwbaNSUPowqxL73JgJnKii5LgFBX6739+U+3oxZJXjbbufqm0abGTnXG4Z77fB7jCz9vWL69E0KVsoG56tL5rrDC1cGz9Ui03yfpVZ1sd0Ut6nIQhnBQGHwIo1c7hDrUmCNHAot7rBJ1JMFK2NUfoIBgJmuq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=b7Yt6167; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="b7Yt6167"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so170074a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627601; x=1790232401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1uINDFjo2ML6R3SHyow6jDUjhiv3et72Nqn9GZ5YjY=;
        b=zgSLyi/8r3aYkK6mxYH4j6a2cLFAWXRlc1/Ge0OKs/OE2BnkJu0N8MOZ8U6NsACkwx
         eYAeWZ2+ha/wJtYf3kMBVD6hYvg2/StnKSi4CkMbd5A9yF7bwFLIQnYHOboSoG82hHDR
         pw0DKs8+oLmweqiytdJSPFPq63pva0SmCMmucBGyB6sPB7H181x7VApwIWrF82E//Dw4
         XW7G+XYsyN2mANrGWBaWRX+V1U9tkRKpDF3doZ+xTxAkhs86mA5leX6WUqLXOzP47aPc
         /Q+jst7A7BslEDCXVmgzM2fkiD6CdWTiePR0yKOJ7SyQ4sx167H+y79hGvMN0SMio6Fx
         6Lqw==
X-Forwarded-Encrypted: i=1; AKwUvBxYrl6ITC+zISh2wTQsIeA4fHzyofMvmyzGwh2l6JkAiL8RbwqIK4c5g5VC62iSHsyHMS2znrAP0ILn3A4=@vger.kernel.org
X-Gm-Message-State: AFuF++kN1MQRSQdzJbxmd1pAutKg+ALKHoKheaKSOzYLNbRd4wN0yi9e
	5JHJ+HMEJQC4MGmqbWDTnaD3OcqLc+YbyrcfZ+oxavav3LIPbOWAkmlSJC1leV/9AVJ/G2Bn2BR
	KiwmVLW7hVgjrlCJO9UcqAfSEYklCffs2fYBJzui+vU+nWn7AXvRWs0ImiiuH4HHp46NuLcLzWx
	ezzIXDRpicRx559v3f8y0li6trrsXSkMCWWo8jVw8fdxf0RyuE/rKIF4o0vpxiumWA4Y5GQX0DE
	+5PyFZZ7QxjH44HpA==
X-Gm-Gg: AYBFou1+BTTUYOMxvXx/uNOLw6wQL7HHzNBGblRM7ZpEVr59li2OtAC2yiO5CjvODmx
	oYP9e9KdDCdVMhUSbWRTgh3n/lolrhxVYUkv6yg51FvpTcQQj//P91SF+kbklfEelcjr3mrThq6
	+IGG5qa9AMw0Vy2L9B3DLPVd6KmsdQu9zzimR69t7XvZ08jXnbT+Ghdbr4sER+wyCpy8WVolE95
	qRf8e7TYaQSfFDSTt+f+OVMuPZ5+bXSOrYI3qBN/5FuAwl5JbNMco42D7MkkW8km/DSvlwzqeid
	ztsmwDWerwF1YGaOTh1WAqLKDgm8awJnvpUl1Vkcn7WzPjnv9hBcJX7qj8N+Yuax1PaCI+doTXM
	IzOApyIShVZtdzUaFMfY1glleP2F6ZS6e0ID+vDTF0utyiRd8sCcDQGpldjnyR2k/praujmOEck
	bJKdlYBtiMEXnExHGiwYDl6PFJqUPyyFoR+Q==
X-Received: by 2002:a05:6a00:408e:b0:869:2b72:525d with SMTP id d2e1a72fcca58-87238d832eamr13526051b3a.7.1789627601108;
        Wed, 16 Sep 2026 23:46:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-871fc14237fsm1427920b3a.0.2026.09.16.23.46.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:46:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so666802a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789627599; x=1790232399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1uINDFjo2ML6R3SHyow6jDUjhiv3et72Nqn9GZ5YjY=;
        b=b7Yt6167rAOEENqILy5prH6WZedz7a0rcn3T2NXc8VLASv6syKF7FsXymxt73c77OU
         EREuevfAu7ZOGZykau2RZkhRvJRnXlhL8jwsu8EelE2j3VRfmwkuvr39PugKU+wz4wC5
         AYftQ/WYrsaebAsIGzLHcEvTu4pECtoHDsOi8=
X-Forwarded-Encrypted: i=1; AKwUvBwAMbQoAthT2KEokl5opJp7cwB6pOMElwhPHQY5dJGwS+E/Ub4oz+aMCaKuXXGBfieTQESTGViqrKTBrBY=@vger.kernel.org
X-Received: by 2002:a05:6a20:9150:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3dd5f451226mr13814450637.10.1789627599188;
        Wed, 16 Sep 2026 23:46:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:9150:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3dd5f451226mr13814398637.10.1789627598733;
        Wed, 16 Sep 2026 23:46:38 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm2754293a12.20.2026.09.16.23.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:46:38 -0700 (PDT)
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
Subject: [net-next, v3 07/11] bnge: remove refcount from L2 filter
Date: Thu, 17 Sep 2026 12:15:44 +0530
Message-ID: <20260917064548.773334-8-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260917064548.773334-1-vikas.gupta@broadcom.com>
References: <20260917064548.773334-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A reference count was previously used under the assumption that any
context holding the last reference could delete the L2 filter.

However, going forward, the filter will only be removed by the same
context that created it, making refcount unnecessary.

The primary and secondary MAC addresses passed by the kernel are
guaranteed to be distinct, so each results in a filter being created
exactly once.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 28 ++++---------------
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  1 -
 2 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index d1279a4babcd..e10a774c3033 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -13,8 +13,6 @@
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
 {
-	if (!refcount_dec_and_test(&fltr->refcnt))
-		return;
 	hlist_del_rcu(&fltr->base.hlist);
 	kfree_rcu(fltr, base.rcu);
 }
@@ -31,18 +29,17 @@ static void bnge_init_l2_filter(struct bnge_net *bn,
 
 	head = &bn->l2_fltr_hash_tbl[idx];
 	hlist_add_head_rcu(&fltr->base.hlist, head);
-	refcount_set(&fltr->refcnt, 1);
 }
 
-static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
-						      struct bnge_l2_key *key,
-						      u32 idx)
+struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
+					     struct bnge_l2_key *key,
+					     u32 idx)
 {
 	struct bnge_l2_filter *fltr;
 	struct hlist_head *head;
 
 	head = &bn->l2_fltr_hash_tbl[idx];
-	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
+	hlist_for_each_entry(fltr, head, base.hlist) {
 		struct bnge_l2_key *l2_key = &fltr->l2_key;
 
 		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
@@ -52,20 +49,6 @@ static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
 	return NULL;
 }
 
-struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
-					     struct bnge_l2_key *key,
-					     u32 idx)
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
@@ -75,9 +58,10 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 
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
index 44ee1357a0ff..16a5d91517c9 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -42,7 +42,6 @@ struct bnge_l2_filter {
 	/* base filter must be the first member */
 	struct bnge_filter_base	base;
 	struct bnge_l2_key	l2_key;
-	refcount_t		refcnt;
 };
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
-- 
2.52.0

