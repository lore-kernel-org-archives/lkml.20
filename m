Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D33A5448
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576082; cv=none; b=M7e/Im8jIRKTxWePmQ36WMbD9jjJp5q2i2dDZki+VISGbAJNCEqWIELQ0Of9mTQZH89yOI3Yzsm15ddtm40UxHi6xGi0k/NnUxUJluNhwBR8ivF6/WlekOS/e/EyqgATV4adQqO8/4bfXy4f91mfo6Pw9i5R0aYPXJwyuAIfGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576082; c=relaxed/simple;
	bh=UYchbdXK3Jpn8CtsTYPj3Lhmu0L5+chHl0dP6/ApjiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZs7Ydkf5/FpkIpt0q3+iclSKPhK7icfokHNMEOFtbcFYCk+ZHtop3Boy5O2ZAuZOYRffMjKK+79aTUfJuHXd2DWW5chpt+VS/7tKWawUxrTjGPvvgstRrMEhwflQBjh+z05d3xnA7DH6tsjSHJtFc+7w5+ga1ZD9/3oe+w+wzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iFZN+YQx; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iFZN+YQx"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1909116a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576033; x=1791180833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5Jyiu4cCDaLEMuXSi0yqzNnVkBmDH4wHEot6cHUGGU=;
        b=qP2aX3gFhW9wqW5w8B/4qh9v7DTA/7r/No+il3Hzbt3UiAZwVPQYRMZyOyXTbpH52F
         1sdQXmubU3gQFg7yW/fmLTEySq8gNuUazdFsOO9oqPY9M0gNEw/B1RNKJ/RMCm14fFxD
         mXLH7kFLsZzXbqIYRYPgio73sPXWOos9mrIYapuXypwXxKr386f9ovhRjjV6nmNnTUjg
         PmgqAJA0Z3ZIqiO9QHPqW8Dvr5zRQ0gwB33fswdxrVVqVxno8w4zvNAy+O5Ozg70xPwE
         tDhBepIHmLERdFwBJl0YBugwzjwTNLpuYUEAmEorlSH29XIk0pzq8A+MjOERl4/ntikz
         /blg==
X-Forwarded-Encrypted: i=1; AKwUvBxPVt1FCbiTe5iwAwDVVLe/K9MBY+aUC9UINMpx0kWU9ooSxARJgV6hZ2q89xPUl3kezatIdGoJ+gu3l5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDxwAoUgOLA5KL39kSuhE6pv1AGFYTDfvBnJ5Px1WWW7ojGEgS
	8nMclrQDhuRzMhFAtANZALuou5aU7ILm/vc/2iecEC0PYXhbeMT6gctuclfzSLNx7ou6EIAMy4O
	FtyQQGI20VZjzKllrwcMxJ3ej6cSdmFRUS6rF/of85G2P+3R1ZMCeFpchcSinOh7E9WZ/HC0XCU
	XroV0grfk7MKqX/+vO0I5+LhwQc8WXRMdq+q63CMoxMySDu2PHs6t2C4fC8AwyGUq3L8b/glqQF
	eKMHh+as9sMon8pXg==
X-Gm-Gg: AYBFou0rbkKd5uXf1Wk5dyZWkwEneiAmJsDEN4q8ADBXbrCNqHGCLBp7Cv/Dj4of6Tl
	hvqqLAQ9VoHzoHM/JmbE9CWGOBdaFBUfhZdWH1SuRZfckrR1YI7ywpSvLmHd0fPgJj/gsy4mX8w
	Ao50SheLfRJ9WnTrjiIUW51irtOuXCJg2651Uv9VzQXo+UUob2CdCjhKki/21ISZU+gn+RqFIDe
	YBucsAmzjyDv9AjUDWdQAodbVr7EquBXBVJBxsgB+FbMIakWHpP76oni2GJouCj/IFmdOGE7aLY
	IIeUmTOIgpbsME1IK1UjDSVifW7OBkzBvsy6aUr+cSoREQaZNx/CZjNCwAWpqgWv188bugwh30p
	0zR0ZB+IKFU6vyZ0ZJmRVu1gZQh1itvGQNyaMO7Dtj3LF7LcXZuILfe9F9yEEGFADaCmOwlcSPX
	Pgc/ZoLx5B2vYiHsVvPNmijNXRxv+YZZ1hEw==
X-Received: by 2002:a17:90b:528e:b0:3a0:cc72:8d7 with SMTP id 98e67ed59e1d1-3a0cc720ebemr4699663a91.50.1790576033217;
        Sun, 27 Sep 2026 23:13:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc787795663sm5917422a12.8.2026.09.27.23.13.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:13:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342b66c0b06so2531623eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790576032; x=1791180832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5Jyiu4cCDaLEMuXSi0yqzNnVkBmDH4wHEot6cHUGGU=;
        b=iFZN+YQxPQHUp8vDI9Unk+QG4kqBtBAWnPpGrzKpHSseH3hxoC+lxlTYQuctuSd3jU
         LkEyLs4/f1mEX0s8ljDaNxDcqJw+xGlkDcOYaqQFCLC/8TpVrGHpwlGSporhAw+/uWHx
         UUMyf35u5exdwdrM/e+VqObqQvNAkppNyMUWc=
X-Forwarded-Encrypted: i=1; AKwUvBxBDKNo+FKjpnRHKpqL5Xo9QMAw5xFVCDg16o5bp9wh/ZRuxSINRgtPmWH9T4hd7J4G+fL3zR16NpRkQTA=@vger.kernel.org
X-Received: by 2002:a05:701b:4354:b0:143:1bb1:b3c3 with SMTP id a92af1059eb24-146cfdd2a6bmr8678026c88.14.1790576031563;
        Sun, 27 Sep 2026 23:13:51 -0700 (PDT)
X-Received: by 2002:a05:701b:4354:b0:143:1bb1:b3c3 with SMTP id a92af1059eb24-146cfdd2a6bmr8677957c88.14.1790576030050;
        Sun, 27 Sep 2026 23:13:50 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm17355561c88.17.2026.09.27.23.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:13:49 -0700 (PDT)
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
Subject: [net-next, v4 06/10] bnge: remove refcount from L2 filter
Date: Mon, 28 Sep 2026 11:43:03 +0530
Message-ID: <20260928061307.1172344-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260928061307.1172344-1-vikas.gupta@broadcom.com>
References: <20260928061307.1172344-1-vikas.gupta@broadcom.com>
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

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 28 ++++---------------
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  1 -
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 23 +++++++++++----
 3 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index a8bb441ebef9..3b26939b0457 100644
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
+static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
+						    struct bnge_l2_key *key,
+						    u32 idx)
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
index ea1acefd70b4..a4a386202ac3 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -49,7 +49,6 @@ struct bnge_l2_filter {
 	/* base filter must be the first member */
 	struct bnge_filter_base	base;
 	struct bnge_l2_key	l2_key;
-	refcount_t		refcnt;
 };
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index ac77ba813f01..29a271f50e04 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -2011,19 +2011,24 @@ static bool bnge_uc_list_updated(struct bnge_net *bn,
 				 const struct netdev_hw_addr_list *uc)
 {
 	struct bnge_vnic_info *vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
+	struct net_device *dev = bn->netdev;
 	struct netdev_hw_addr *ha;
-	int off = 0;
-
-	if (netdev_hw_addr_list_count(uc) != (vnic->uc_filter_count - 1))
-		return true;
+	int off = 0, count = 0;
 
+	/* dev_addr is installed as L2 filter 0 and skipped when building
+	 * uc_list, so compare only the unicast entries that differ from it.
+	 */
 	netdev_hw_addr_list_for_each(ha, uc) {
+		if (ether_addr_equal(ha->addr, dev->dev_addr))
+			continue;
+		if (count >= vnic->uc_filter_count - 1)
+			return true;
 		if (!ether_addr_equal(ha->addr, vnic->uc_list + off))
 			return true;
-
 		off += ETH_ALEN;
+		count++;
 	}
-	return false;
+	return count != vnic->uc_filter_count - 1;
 }
 
 static bool bnge_promisc_ok(struct bnge_net *bn)
@@ -2058,6 +2063,12 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,
 		vnic->rx_mask |= CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
 	} else {
 		netdev_hw_addr_list_for_each(ha, uc) {
+			/* dev_addr is already installed as L2 filter 0; a uc
+			 * entry equal to it hashes to the same key and would be
+			 * rejected as a duplicate, so skip it here.
+			 */
+			if (ether_addr_equal(ha->addr, dev->dev_addr))
+				continue;
 			memcpy(vnic->uc_list + off, ha->addr, ETH_ALEN);
 			off += ETH_ALEN;
 			vnic->uc_filter_count++;
-- 
2.52.0

