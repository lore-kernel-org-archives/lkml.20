Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642510;
	b=1in/vVXdYq+om/Vr/Wpa/O+lLN8T6ovTW7mQjX8Iwf/wXxu9S5ua5ZHGYEBdV6At0RDd
	 qXPnBSdUy/G7uR0Zeb2h9UkSCHFqfqxv7sg8RVO/sfpfbX2cQPVuqs9IPei4sUjxpN87G
	 mK1PC/9Y+LK2oWEVezeoEBZ5G57BYDTI6l1M4CSjFOTgAjp5AoFzv0x0E4zkLnFxxlwtC
	 UB8JA826mcfSlqIYdZoRM0IFlWgrSY+N76urgucv7EIA+1cVRXc1gt4RZQ+jHBv3BzLYx
	 DTejD9kCzLcZtCkyfRf3N+r/CaIEr3lzRexhtFrkCEGn/DX04ZuSO1n/XJ3dxJz660A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642510;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=DflMKJlDcT8zk1kVsJMMTDpE6Y1J4P/gZkqCOmzU7bA=;
	b=d5ADg35JjQUaNRdLZ46SQULt+u2pyRS95rM0tzzw7vZEQ515GUFOthrws3AkrB/8m2nN
	 MDCYgW3o6r8w5nxHNPt3BbOy6tvHOpTkr9qV9VFSMFD9c/vNtnEMF+JR8Evnwg9z5etwy
	 aaxLtcaXhUNdbpqJ3CV1PoP9RKX7BtKXvgpQwTSncdqTN1TsOIGyv79CG2bhrZWAsMNaZ
	 LxCxGW/7QfJ/TmSnYEyU65LEwT6lfwHuPKIuvPxE34/O7K8BiGitm5YLVsf//frnYk6Vb
	 6PdO5TgrZZhp/AT0cMo2RUjRrsDtPShQCM25dzIMLEU5FwNSSw/Xi4CZyVaYypgvqLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QMpxMm8z;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE662606A894
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE662606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QMpxMm8z
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b1535be329so1561627a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642509; x=1795247309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DflMKJlDcT8zk1kVsJMMTDpE6Y1J4P/gZkqCOmzU7bA=;
        b=xDyK9DJGlZ4lHa8u5irJ6oVoWiJRFhO03uVGd5aPITTppXqZU6VGktah10MJn7S8rO
         W7rGWEy4rdpYnXh1RkvFqS3TJ/KBGlDV3GSjSmU865eqlAnBX1yVmpXNIy2AJUE5+TL+
         GsTqMu9MAM/MkVLCgCgKpChQZoykYDEN/7ZKIyEVgKvLha8Xn1n0eiaPj2YP6+97kiDV
         tP5H8WLoNzrQk1rTXX9Dxcn6FwSNwmkNoEfmtENTjJhqEtksfu25qqG+K0TRtXpLjSci
         F+XwfASsZS1WlIPfvzJ0MbFovr2Tv9T+MI/GI60BLo28WcDQ3ykBEWk+7a7kEBpHOV3W
         WRjw==
X-Forwarded-Encrypted: i=1; AL+hErFn4Xge3NIMoSTGGCaaca+FoEJWYeyY7z8RnPoW/M6QRqD/5rF1WEx8LoKHqH2+ZKqU77bi3dV9m6buF58=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xOa/dL2kbhhim4VBiA6V+X/f+E8oeW8NkMUdOYDoZyBSxUFkh
	p6kYfkfaCUKTlxGoASSaL/CBOheo5XdocbHV2BSlirbUJmqdpcS/gwNB7oJjfxTylCRd4tBVfHS
	Px7Q9i+3maj7AcvKiibU2iH/gKNqPdLkKlxyHU92ar+leFZ2ufFvsHEjvdlm697sQT/djYctx2G
	IufBPO9rgYYvGs57qbuFubdGwCCbZLlZsaTE0dlAnHEs+GNrArmLT0bVtvACp0bQOY1bdHLUaQD
	Xx4YfGUy9G4+DRU4g==
X-Gm-Gg: AYBFou2cLQMy7f1AQBt4kdd2uZTc7s+RO7dRDRGqvUeBYfv7YKsKFW4fyZtdWryxPE6
	aI903xaZTBK39BWlbtPpTmSkqhk+T1Y05k5wtUfKOXYuQB7OWHRsrLe0klTdbWV2658Zzcz8ux1
	kT2EjjSUOf9CbjUsgALpPPfxO7JFTWkmwGmDYJDYhB5pIHgirkkp+3kJrR4++packfBIsKU2e/A
	u98JvtscHh1GCmKOxlQ06+ro7FGRx76OikoM1jnFZWcG5zny03P740E3iAiQAy4eVZUBcbLjFb4
	ajCsinkDWduPF0zqLmjZRMvM8mbqw86faeHP8oOJKEwSNhp/tG2M4ubpevLry3OScXPFUI0v7AI
	NhoWwlV8XrsBV6RQUhsglpNhhaScNU2FDo4Nxcp/0XdOfvOxiMdykQaU7UAkbwxW5Ok0jRN+UU1
	bNjUYSoF1kUjdl4Bb9I56Oa7bpyEGSGEmxvg==
X-Received: by 2002:a17:90b:1cce:b0:3b1:64d3:f308 with SMTP id 98e67ed59e1d1-3b1b0a3c0f6mr4934270a91.43.1794642509072;
        Fri, 13 Nov 2026 23:48:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c1a3e7sm9352575a91.2.2026.11.13.23.48.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:48:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so2767839eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642507; x=1795247307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DflMKJlDcT8zk1kVsJMMTDpE6Y1J4P/gZkqCOmzU7bA=;
        b=QMpxMm8z2II6/eSYcY61Zns5ORrVGJ2r7Gj/iZsFtneFPQv5gd7BTxgG5RJ+ILN904
         a2ftlP2Rp24fUC9thg5v0onJxoSr7jsg3SZdoQD9rc+hgY7vE4AR3NE7SUo/YWZl1jHQ
         U+S6jHNt8zFKs+rwyouBijf7Pcn+T8nwJtvdc=
X-Forwarded-Encrypted: i=1; AL+hErGERBZLpXIlTKNf80IeQhAP4dngUhbjDFQa+vamfed2C1HT6twk2lYO9DyCYNQa3zE4aoG8hcJJ0qGvfHU=@vger.kernel.org
X-Received: by 2002:a05:701a:844d:20b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b50312ef36mr5047977c88.19.1794642506686;
        Fri, 13 Nov 2026 23:48:26 -0800 (PST)
X-Received: by 2002:a05:701a:844d:20b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b50312ef36mr5047935c88.19.1794642505801;
        Fri, 13 Nov 2026 23:48:25 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:48:25 -0800 (PST)
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
Subject: [PATCH net-next v7 07/10] bnge: add NTUPLE filter infrastructure
Date: Sat, 14 Nov 2026 13:17:39 +0530
Message-ID: <20261114074742.1484603-8-vikas.gupta@broadcom.com>
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

Add the core NTUPLE filter data structures and firmware command
wrappers needed for flow rule management.

This helps further patches implement user-created NTUPLE rules
as well as rules via kernel flow steering.

bd->max_fltr is the fixed BNGE_MAX_NTUPLE_FLTRS (8192). It is no
longer the sum of the firmware EM and WM flow counts and the L2 filter
count. It sizes ntp_fltr_bmap, limits bnge_insert_ntp_filter() and,
with the 128 L2 rules, is the rule count that ethtool reports.

Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   1 -
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 498 +++++++++++++++++-
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  69 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 157 +++++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   6 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  33 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |  17 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |   6 +-
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  20 +
 9 files changed, 791 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index f8ee95d21d8c..8d514ba1dbcc 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -158,7 +158,6 @@ struct bnge_dev {
 	u16			tso_max_segs;
 
 	int			max_fltr;
-#define BNGE_L2_FLTR_MAX_FLTR	1024
 
 	u32			*rss_indir_tbl;
 	u16			rss_indir_tbl_entries;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index 6316f75ca36e..3ebb3cae4829 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -5,6 +5,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/jhash.h>
 #include <net/netdev_lock.h>
+#include <net/ipv6.h>
 
 #include "bnge.h"
 #include "bnge_netdev.h"
@@ -12,26 +13,150 @@
 #include "bnge_hwrm_lib.h"
 #include "bnge_filter.h"
 
-void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
+#define BNGE_IPV6_MASK_ALL {{{ 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, \
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff }}}
+#define BNGE_IPV6_MASK_NONE {{{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }}}
+
+const struct bnge_flow_masks BNGE_FLOW_MASK_NONE = {
+	.ports = {
+		.src = 0,
+		.dst = 0,
+	},
+	.addrs = {
+		.v6addrs = {
+			.src = BNGE_IPV6_MASK_NONE,
+			.dst = BNGE_IPV6_MASK_NONE,
+		},
+	},
+};
+
+const struct bnge_flow_masks BNGE_FLOW_IPV6_MASK_ALL = {
+	.ports = {
+		.src = cpu_to_be16(0xffff),
+		.dst = cpu_to_be16(0xffff),
+	},
+	.addrs = {
+		.v6addrs = {
+			.src = BNGE_IPV6_MASK_ALL,
+			.dst = BNGE_IPV6_MASK_ALL,
+		},
+	},
+};
+
+const struct bnge_flow_masks BNGE_FLOW_IPV4_MASK_ALL = {
+	.ports = {
+		.src = cpu_to_be16(0xffff),
+		.dst = cpu_to_be16(0xffff),
+	},
+	.addrs = {
+		.v4addrs = {
+			.src = cpu_to_be32(0xffffffff),
+			.dst = cpu_to_be32(0xffffffff),
+		},
+	},
+};
+
+static bool bnge_is_usr_fltr(struct bnge_filter_base *fltr)
 {
-	netdev_assert_locked_or_invisible(bn->netdev);
+	return (fltr->type == BNGE_FLTR_TYPE_L2 &&
+		fltr->flags & BNGE_ACT_RING_DST) ||
+	       (fltr->type == BNGE_FLTR_TYPE_NTUPLE &&
+		fltr->flags & BNGE_ACT_NO_AGING);
+}
+
+static void bnge_insert_usr_fltr(struct bnge_net *bn,
+				 struct bnge_filter_base *fltr)
+{
+	if (!bnge_is_usr_fltr(fltr))
+		return;
+
+	INIT_LIST_HEAD(&fltr->list_node);
+	list_add_tail(&fltr->list_node, &bn->usr_fltr_list);
+	bn->user_fltr_count++;
+}
+
+static void bnge_del_usr_fltr_node(struct bnge_net *bn,
+				   struct bnge_filter_base *fltr)
+{
+	if (!bnge_is_usr_fltr(fltr))
+		return;
+
+	if (!list_empty(&fltr->list_node)) {
+		list_del_init(&fltr->list_node);
+		bn->user_fltr_count--;
+	}
+}
+
+void bnge_del_l2_filter_rcu(struct bnge_net *bn, struct bnge_l2_filter *lfltr)
+{
+	struct bnge_filter_base *fltr = &lfltr->base;
+
+	hlist_del_rcu(&fltr->hlist);
+	bnge_del_usr_fltr_node(bn, fltr);
+	clear_bit(fltr->sw_id, bn->l2_fltr_bmap);
+	bn->l2_fltr_count--;
+	kfree_rcu(lfltr, base.rcu);
+}
+
+void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *lfltr)
+{
+	struct bnge_filter_base *fltr = &lfltr->base;
 
+	hlist_del(&fltr->hlist);
+	bnge_del_usr_fltr_node(bn, fltr);
+	clear_bit(fltr->sw_id, bn->l2_fltr_bmap);
+	bn->l2_fltr_count--;
+	kfree(fltr);
+}
+
+void bnge_del_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *nfltr)
+{
+	struct bnge_filter_base *fltr = &nfltr->base;
+
+	hlist_del(&fltr->hlist);
+	bnge_del_usr_fltr_node(bn, fltr);
+	clear_bit(fltr->sw_id, bn->ntp_fltr_bmap);
+	bn->ntp_fltr_count--;
+	kfree(fltr);
+}
+
+void bnge_del_ntp_filter_rcu(struct bnge_net *bn,
+			     struct bnge_ntuple_filter *fltr)
+{
+	spin_lock_bh(&bn->ntp_fltr_lock);
 	hlist_del_rcu(&fltr->base.hlist);
+	bnge_del_usr_fltr_node(bn, &fltr->base);
+	clear_bit(fltr->base.sw_id, bn->ntp_fltr_bmap);
+	bn->ntp_fltr_count--;
+	spin_unlock_bh(&bn->ntp_fltr_lock);
+
 	kfree_rcu(fltr, base.rcu);
 }
 
-static void bnge_init_l2_filter(struct bnge_net *bn,
-				struct bnge_l2_filter *fltr,
-				struct bnge_l2_key *key, u32 idx)
+static int bnge_init_l2_filter(struct bnge_net *bn,
+			       struct bnge_l2_filter *fltr,
+			       struct bnge_l2_key *key, u32 idx)
 {
 	struct hlist_head *head;
+	int bit_id;
 
 	ether_addr_copy(fltr->l2_key.dst_mac_addr, key->dst_mac_addr);
 	fltr->l2_key.vlan = key->vlan;
 	fltr->base.type = BNGE_FLTR_TYPE_L2;
+	fltr->base.filter_id = BNGE_FLTR_ID_INVALID;
+
+	bit_id = bitmap_find_free_region(bn->l2_fltr_bmap,
+					 BNGE_MAX_L2_FLTRS, 0);
+	if (bit_id < 0)
+		return -ENOMEM;
+	fltr->base.sw_id = (u16)bit_id;
+
+	bn->l2_fltr_count++;
 
 	head = &bn->l2_fltr_hash_tbl[idx];
 	hlist_add_head_rcu(&fltr->base.hlist, head);
+	bnge_insert_usr_fltr(bn, &fltr->base);
+	return 0;
 }
 
 static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
@@ -54,12 +179,42 @@ static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
 	return NULL;
 }
 
+__le64 bnge_lookup_l2_filter_rcu(struct bnge_net *bn,
+				 struct bnge_l2_key *key,
+				 u32 idx)
+{
+	__le64 id = BNGE_FLTR_ID_INVALID;
+	struct bnge_l2_filter *fltr;
+	struct hlist_head *head;
+
+	rcu_read_lock();
+
+	head = &bn->l2_fltr_hash_tbl[idx];
+	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
+		struct bnge_l2_key *l2_key = &fltr->l2_key;
+
+		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
+		    l2_key->vlan == key->vlan) {
+			if (test_bit(BNGE_FLTR_VALID, &fltr->base.state)) {
+				/* Pairs with smp_wmb() in bnge_hwrm_l2_filter_alloc() */
+				smp_rmb();
+				id = fltr->base.filter_id;
+			}
+			break;
+		}
+	}
+
+	rcu_read_unlock();
+	return id;
+}
+
 static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 						   struct bnge_l2_key *key,
 						   gfp_t gfp)
 {
 	struct bnge_l2_filter *fltr;
 	u32 idx;
+	int rc;
 
 	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
 	      BNGE_L2_FLTR_HASH_MASK;
@@ -72,10 +227,339 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 	if (!fltr)
 		return ERR_PTR(-ENOMEM);
 
-	bnge_init_l2_filter(bn, fltr, key, idx);
+	rc = bnge_init_l2_filter(bn, fltr, key, idx);
+	if (rc) {
+		kfree(fltr);
+		fltr = ERR_PTR(rc);
+	}
+
 	return fltr;
 }
 
+struct bnge_l2_filter *bnge_alloc_user_l2_filter(struct bnge_net *bn,
+						 struct bnge_l2_key *key,
+						 u8 flags)
+{
+	struct bnge_l2_filter *fltr;
+	u32 idx;
+	int rc;
+
+	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
+	      BNGE_L2_FLTR_HASH_MASK;
+	fltr = bnge_lookup_l2_filter(bn, key, idx);
+	if (fltr) {
+		fltr = ERR_PTR(-EEXIST);
+		goto l2_filter_exit;
+	}
+	fltr = kzalloc_obj(*fltr, GFP_KERNEL);
+	if (!fltr) {
+		fltr = ERR_PTR(-ENOMEM);
+		goto l2_filter_exit;
+	}
+	fltr->base.flags = flags;
+	rc = bnge_init_l2_filter(bn, fltr, key, idx);
+	if (rc) {
+		kfree(fltr);
+		return ERR_PTR(rc);
+	}
+
+l2_filter_exit:
+	return fltr;
+}
+
+void bnge_free_l2_filters(struct bnge_net *bn)
+{
+	int i;
+
+	netdev_assert_locked_or_invisible(bn->netdev);
+
+	for (i = 0; i < BNGE_L2_FLTR_HASH_SIZE; i++) {
+		struct bnge_l2_filter *fltr;
+		struct hlist_head *head;
+		struct hlist_node *tmp;
+
+		head = &bn->l2_fltr_hash_tbl[i];
+		hlist_for_each_entry_safe(fltr, tmp, head, base.hlist)
+			bnge_del_l2_filter(bn, fltr);
+	}
+
+	bitmap_free(bn->l2_fltr_bmap);
+	bn->l2_fltr_bmap = NULL;
+	bn->l2_fltr_count = 0;
+}
+
+void bnge_free_ntp_fltrs(struct bnge_net *bn, bool skip_user)
+{
+	int i;
+
+	netdev_assert_locked_or_invisible(bn->netdev);
+
+	/* Under netdev instance lock and all our NAPIs have been disabled.
+	 * It's safe to delete the hash table.
+	 */
+	for (i = 0; i < BNGE_NTP_FLTR_HASH_SIZE; i++) {
+		struct bnge_ntuple_filter *fltr;
+		struct hlist_head *head;
+		struct hlist_node *tmp;
+
+		head = &bn->ntp_fltr_hash_tbl[i];
+		hlist_for_each_entry_safe(fltr, tmp, head, base.hlist) {
+			if (skip_user && bnge_is_usr_fltr(&fltr->base))
+				continue;
+			bnge_del_ntp_filter(bn, fltr);
+		}
+	}
+
+	if (skip_user)
+		return;
+
+	bitmap_free(bn->ntp_fltr_bmap);
+	bn->ntp_fltr_bmap = NULL;
+	bn->ntp_fltr_count = 0;
+}
+
+static int bnge_alloc_l2_fltrs_mem(struct bnge_net *bn)
+{
+	int i, rc = 0;
+
+	if (bn->l2_fltr_bmap)
+		return 0;
+
+	for (i = 0; i < BNGE_L2_FLTR_HASH_SIZE; i++)
+		INIT_HLIST_HEAD(&bn->l2_fltr_hash_tbl[i]);
+
+	bn->l2_fltr_count = 0;
+	bn->l2_fltr_bmap = bitmap_zalloc(BNGE_MAX_L2_FLTRS, GFP_KERNEL);
+
+	if (!bn->l2_fltr_bmap)
+		rc = -ENOMEM;
+
+	return rc;
+}
+
+static int bnge_alloc_ntp_fltrs_mem(struct bnge_net *bn)
+{
+	struct bnge_dev *bd = bn->bd;
+	int i, rc = 0;
+
+	if (!(bn->priv_flags & BNGE_NET_EN_NTUPLE) || bn->ntp_fltr_bmap)
+		return 0;
+
+	for (i = 0; i < BNGE_NTP_FLTR_HASH_SIZE; i++)
+		INIT_HLIST_HEAD(&bn->ntp_fltr_hash_tbl[i]);
+
+	bn->ntp_fltr_count = 0;
+	bn->ntp_fltr_bmap = bitmap_zalloc(bd->max_fltr, GFP_KERNEL);
+
+	if (!bn->ntp_fltr_bmap)
+		rc = -ENOMEM;
+
+	return rc;
+}
+
+int bnge_fltrs_mem(struct bnge_net *bn)
+{
+	bool ntp_alloced = !bn->ntp_fltr_bmap;
+	int rc;
+
+	rc = bnge_alloc_ntp_fltrs_mem(bn);
+	if (rc)
+		return rc;
+
+	rc = bnge_alloc_l2_fltrs_mem(bn);
+	if (rc)
+		goto err_free_ntp_mem;
+
+	return 0;
+
+err_free_ntp_mem:
+	if (ntp_alloced) {
+		bitmap_free(bn->ntp_fltr_bmap);
+		bn->ntp_fltr_bmap = NULL;
+	}
+	return rc;
+}
+
+#define BNGE_IPV4_4TUPLE(bd, fkeys)					\
+	(((fkeys)->basic.ip_proto == IPPROTO_TCP &&			\
+	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4) ||	\
+	 ((fkeys)->basic.ip_proto == IPPROTO_UDP &&			\
+	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4))
+
+#define BNGE_IPV6_4TUPLE(bd, fkeys)					\
+	(((fkeys)->basic.ip_proto == IPPROTO_TCP &&			\
+	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6) ||	\
+	 ((fkeys)->basic.ip_proto == IPPROTO_UDP &&			\
+	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6))
+
+static u32 bnge_get_rss_flow_tuple_len(struct bnge_dev *bd,
+				       struct flow_keys *fkeys)
+{
+	if (fkeys->basic.n_proto == htons(ETH_P_IP)) {
+		if (BNGE_IPV4_4TUPLE(bd, fkeys))
+			return sizeof(fkeys->addrs.v4addrs) +
+			       sizeof(fkeys->ports);
+
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4)
+			return sizeof(fkeys->addrs.v4addrs);
+	}
+
+	if (fkeys->basic.n_proto == htons(ETH_P_IPV6)) {
+		if (BNGE_IPV6_4TUPLE(bd, fkeys))
+			return sizeof(fkeys->addrs.v6addrs) +
+			       sizeof(fkeys->ports);
+
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6)
+			return sizeof(fkeys->addrs.v6addrs);
+	}
+
+	return 0;
+}
+
+static u32 bnge_toeplitz(struct bnge_net *bn, struct flow_keys *fkeys,
+			 const unsigned char *key)
+{
+	u64 prefix = bn->toeplitz_prefix, hash = 0;
+	struct bnge_ipv4_tuple tuple4;
+	struct bnge_ipv6_tuple tuple6;
+	struct bnge_dev *bd = bn->bd;
+	u8 *four_tuple;
+	int i, j, len;
+
+	len = bnge_get_rss_flow_tuple_len(bd, fkeys);
+	if (!len)
+		return 0;
+
+	if (fkeys->basic.n_proto == htons(ETH_P_IP)) {
+		tuple4.v4addrs = fkeys->addrs.v4addrs;
+		tuple4.ports = fkeys->ports;
+		four_tuple = (u8 *)&tuple4;
+	} else {
+		tuple6.v6addrs = fkeys->addrs.v6addrs;
+		tuple6.ports = fkeys->ports;
+		four_tuple = (u8 *)&tuple6;
+	}
+
+	for (i = 0, j = 8; i < len; i++, j++) {
+		u8 byte = four_tuple[i];
+		int bit;
+
+		for (bit = 0; bit < 8; bit++, prefix <<= 1, byte <<= 1) {
+			if (byte & 0x80)
+				hash ^= prefix;
+		}
+		prefix |= (j < HW_HASH_KEY_SIZE) ? key[j] : 0;
+	}
+
+	/* The valid part of the hash is in the upper 32 bits. */
+	return (hash >> 32) & BNGE_NTP_FLTR_HASH_MASK;
+}
+
+u32 bnge_get_ntp_filter_idx(struct bnge_net *bn, struct flow_keys *fkeys,
+			    const struct sk_buff *skb)
+{
+	struct bnge_vnic_info *vnic;
+
+	if (skb)
+		return skb_get_hash_raw(skb) & BNGE_NTP_FLTR_HASH_MASK;
+
+	vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
+	return bnge_toeplitz(bn, fkeys, (void *)vnic->rss_hash_key);
+}
+
+static bool bnge_fltr_match(struct bnge_ntuple_filter *f1,
+			    struct bnge_ntuple_filter *f2)
+{
+	struct bnge_flow_masks *masks1 = &f1->fmasks;
+	struct bnge_flow_masks *masks2 = &f2->fmasks;
+	struct flow_keys *keys1 = &f1->fkeys;
+	struct flow_keys *keys2 = &f2->fkeys;
+
+	if (keys1->basic.n_proto != keys2->basic.n_proto ||
+	    keys1->basic.ip_proto != keys2->basic.ip_proto)
+		return false;
+
+	if (keys1->basic.n_proto == htons(ETH_P_IP)) {
+		if (keys1->addrs.v4addrs.src != keys2->addrs.v4addrs.src ||
+		    masks1->addrs.v4addrs.src != masks2->addrs.v4addrs.src ||
+		    keys1->addrs.v4addrs.dst != keys2->addrs.v4addrs.dst ||
+		    masks1->addrs.v4addrs.dst != masks2->addrs.v4addrs.dst)
+			return false;
+	} else {
+		if (!ipv6_addr_equal(&keys1->addrs.v6addrs.src,
+				     &keys2->addrs.v6addrs.src) ||
+		    !ipv6_addr_equal(&masks1->addrs.v6addrs.src,
+				     &masks2->addrs.v6addrs.src) ||
+		    !ipv6_addr_equal(&keys1->addrs.v6addrs.dst,
+				     &keys2->addrs.v6addrs.dst) ||
+		    !ipv6_addr_equal(&masks1->addrs.v6addrs.dst,
+				     &masks2->addrs.v6addrs.dst))
+			return false;
+	}
+
+	return keys1->ports.src == keys2->ports.src &&
+	       masks1->ports.src == masks2->ports.src &&
+	       keys1->ports.dst == keys2->ports.dst &&
+	       masks1->ports.dst == masks2->ports.dst &&
+	       keys1->control.flags == keys2->control.flags &&
+	       f1->l2_filter_id == f2->l2_filter_id;
+}
+
+int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
+			   u32 idx)
+{
+	struct bnge_ntuple_filter *f;
+	struct hlist_head *head;
+	int bit_id;
+
+	spin_lock_bh(&bn->ntp_fltr_lock);
+
+	head = &bn->ntp_fltr_hash_tbl[idx];
+	hlist_for_each_entry(f, head, base.hlist) {
+		if (bnge_fltr_match(f, fltr)) {
+			spin_unlock_bh(&bn->ntp_fltr_lock);
+			return -EEXIST;
+		}
+	}
+
+	bit_id = bitmap_find_free_region(bn->ntp_fltr_bmap,
+					 bn->bd->max_fltr, 0);
+	if (bit_id < 0) {
+		spin_unlock_bh(&bn->ntp_fltr_lock);
+		return -ENOMEM;
+	}
+
+	fltr->base.sw_id = (u16)bit_id;
+	fltr->base.filter_id = BNGE_FLTR_ID_INVALID;
+	fltr->base.type = BNGE_FLTR_TYPE_NTUPLE;
+	fltr->base.flags |= BNGE_ACT_RING_DST;
+
+	head = &bn->ntp_fltr_hash_tbl[idx];
+	hlist_add_head_rcu(&fltr->base.hlist, head);
+
+	bnge_insert_usr_fltr(bn, &fltr->base);
+	bn->ntp_fltr_count++;
+
+	spin_unlock_bh(&bn->ntp_fltr_lock);
+
+	return 0;
+}
+
+struct bnge_ntuple_filter *
+bnge_lookup_ntp_filter_from_idx(struct bnge_net *bn,
+				struct bnge_ntuple_filter *fltr, u32 idx)
+{
+	struct bnge_ntuple_filter *f;
+	struct hlist_head *head;
+
+	head = &bn->ntp_fltr_hash_tbl[idx];
+	hlist_for_each_entry_rcu(f, head, base.hlist) {
+		if (bnge_fltr_match(f, fltr))
+			return f;
+	}
+	return NULL;
+}
+
 int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
 			      const u8 *mac_addr)
 {
@@ -97,6 +581,6 @@ int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
 	return rc;
 
 err_del_l2_filter:
-	bnge_del_l2_filter(bn, fltr);
+	bnge_del_l2_filter_rcu(bn, fltr);
 	return rc;
 }
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index 372657cba43c..87d66266a9f5 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -7,11 +7,14 @@
 #include <linux/types.h>
 #include <linux/if_ether.h>
 #include <linux/jhash.h>
+#include <net/flow_dissector.h>
 
 struct bnge_net;
+struct sk_buff;
 
 enum {
-	BNGE_FLTR_TYPE_L2	= 1
+	BNGE_FLTR_TYPE_L2	= 1,
+	BNGE_FLTR_TYPE_NTUPLE	= 2
 };
 
 enum {
@@ -19,12 +22,23 @@ enum {
 	BNGE_FLTR_FW_DELETED
 };
 
+enum {
+	BNGE_ACT_DROP		= 0x1,
+	BNGE_ACT_RING_DST	= 0x2,
+	BNGE_ACT_NO_AGING	= 0x4,
+	BNGE_ACT_RSS_CTX	= 0x8
+};
+
+#define BNGE_MAX_L2_FLTRS	128
+#define BNGE_MAX_NTUPLE_FLTRS	(8 << 10)
+
 struct bnge_filter_base {
 	struct hlist_node	hlist;
 	struct list_head	list_node;
 	__le64			filter_id;
 	u8			type;
 	u8			flags;
+	u16			sw_id;
 	u16			rxq;
 	u16			fw_vnic_id;
 	u16			vf_idx;
@@ -50,7 +64,60 @@ struct bnge_l2_filter {
 	struct bnge_l2_key	l2_key;
 };
 
+struct bnge_ipv4_tuple {
+	struct flow_dissector_key_ipv4_addrs v4addrs;
+	struct flow_dissector_key_ports ports;
+};
+
+struct bnge_ipv6_tuple {
+	struct flow_dissector_key_ipv6_addrs v6addrs;
+	struct flow_dissector_key_ports ports;
+};
+
+struct bnge_flow_masks {
+	struct flow_dissector_key_ports ports;
+	struct flow_dissector_key_addrs addrs;
+};
+
+extern const struct bnge_flow_masks BNGE_FLOW_MASK_NONE;
+extern const struct bnge_flow_masks BNGE_FLOW_IPV6_MASK_ALL;
+extern const struct bnge_flow_masks BNGE_FLOW_IPV4_MASK_ALL;
+
+struct bnge_ntuple_filter {
+	/* base filter must be the first member */
+	struct bnge_filter_base	base;
+	struct flow_keys	fkeys;
+	struct bnge_flow_masks	fmasks;
+	__le64			l2_filter_id;
+	u32			flow_id;
+};
+
+#define BNGE_L2_FLTR_IS_NTP_MAC(fltr)   ((fltr)->base.flags & BNGE_ACT_RING_DST)
+
+#define BNGE_FLTR_ID_INVALID	cpu_to_le64(0xffffffffffffffffULL)
+
+void bnge_free_ntp_fltrs(struct bnge_net *bn, bool skip_user_filters);
+u32 bnge_get_ntp_filter_idx(struct bnge_net *bn, struct flow_keys *fkeys,
+			    const struct sk_buff *skb);
+int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
+			   u32 idx);
+struct bnge_ntuple_filter *
+bnge_lookup_ntp_filter_from_idx(struct bnge_net *bn,
+				struct bnge_ntuple_filter *fltr, u32 idx);
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
+void bnge_del_l2_filter_rcu(struct bnge_net *bn, struct bnge_l2_filter *fltr);
+__le64 bnge_lookup_l2_filter_rcu(struct bnge_net *bn,
+				 struct bnge_l2_key *key,
+				 u32 idx);
+void bnge_free_l2_filters(struct bnge_net *bn);
 int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
 			      const u8 *mac_addr);
+struct bnge_l2_filter *bnge_alloc_user_l2_filter(struct bnge_net *bn,
+						 struct bnge_l2_key *key,
+						 u8 flags);
+int bnge_fltrs_mem(struct bnge_net *bn);
+void bnge_del_ntp_filter(struct bnge_net *bn,
+			 struct bnge_ntuple_filter *nfltr);
+void bnge_del_ntp_filter_rcu(struct bnge_net *bn,
+			     struct bnge_ntuple_filter *fltr);
 #endif /* _BNGE_FILTER_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index 783e56b798fb..76f8bb73056d 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -8,6 +8,7 @@
 #include <linux/bnge/hsi.h>
 #include <linux/if_vlan.h>
 #include <net/netdev_queues.h>
+#include <linux/ethtool.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -911,11 +912,165 @@ int bnge_hwrm_l2_filter_alloc(struct bnge_dev *bd, struct bnge_l2_filter *fltr)
 		req->l2_ivlan_mask = cpu_to_le16(0xfff);
 	}
 
+	if (BNGE_L2_FLTR_IS_NTP_MAC(fltr)) {
+		req->enables |= cpu_to_le32(CFA_L2_FILTER_ALLOC_REQ_ENABLES_RFS_RING_TBL_IDX);
+		req->rfs_ring_tbl_idx = cpu_to_le16(fltr->base.rxq);
+	}
+
 	resp = bnge_hwrm_req_hold(bd, req);
 	rc = bnge_hwrm_req_send(bd, req);
-	if (!rc)
+	if (!rc) {
 		fltr->base.filter_id = resp->l2_filter_id;
+		/* Pairs with smp_rmb() in bnge_lookup_l2_filter_rcu() */
+		smp_wmb();
+		set_bit(BNGE_FLTR_VALID, &fltr->base.state);
+	}
+
+	bnge_hwrm_req_drop(bd, req);
+	return rc;
+}
+
+int bnge_hwrm_cfa_ntuple_filter_free(struct bnge_dev *bd,
+				     struct bnge_ntuple_filter *fltr)
+{
+	struct hwrm_cfa_ntuple_filter_free_input *req;
+	int rc;
+
+	set_bit(BNGE_FLTR_FW_DELETED, &fltr->base.state);
+	if (!test_bit(BNGE_STATE_OPEN, &bd->state))
+		return 0;
+
+	/* Not programmed in firmware in this session, nothing to free */
+	if (fltr->base.filter_id == BNGE_FLTR_ID_INVALID)
+		return 0;
+
+	rc = bnge_hwrm_req_init(bd, req, HWRM_CFA_NTUPLE_FILTER_FREE);
+	if (rc)
+		return rc;
+
+	req->ntuple_filter_id = fltr->base.filter_id;
+	rc = bnge_hwrm_req_send(bd, req);
+	if (!rc)
+		fltr->base.filter_id = BNGE_FLTR_ID_INVALID;
+	return rc;
+}
+
+/* L4 port matching flags are unconditionally enabled here. For non-TCP/UDP
+ * flows (e.g. ICMP or wildcards), the port masks in fmasks are zeroed, which
+ * instructs firmware CFA to treat L4 ports as wildcards.
+ */
+#define BNGE_NTP_FLTR_FLAGS					\
+	(CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_L2_FILTER_ID |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_ETHERTYPE |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_IPADDR_TYPE |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_IPADDR |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_IPADDR_MASK |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_IPADDR |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_IPADDR_MASK |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_IP_PROTOCOL |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_PORT |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_PORT_MASK |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_PORT |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_PORT_MASK |	\
+	 CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_ID)
+
+#define BNGE_NTP_TUNNEL_FLTR_FLAG				\
+		CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_TUNNEL_TYPE
 
+static void
+bnge_cfg_rfs_ring_tbl_idx(struct bnge_dev *bd,
+			  struct hwrm_cfa_ntuple_filter_alloc_input *req,
+			  struct bnge_ntuple_filter *fltr)
+{
+	struct bnge_net *bn = netdev_priv(bd->netdev);
+	struct bnge_vnic_info *def_vnic;
+	u32 rxq = fltr->base.rxq;
+	u32 enables;
+
+	if (fltr->base.flags & BNGE_ACT_RSS_CTX) {
+		struct ethtool_rxfh_context *ctx;
+		struct bnge_rss_ctx *rss_ctx;
+		struct bnge_vnic_info *vnic;
+
+		/* The RSS context was already validated via xa_load() when the
+		 * filter was added (bnge_ethtool.c) under netdev instance lock,
+		 * so it is always present here.
+		 */
+		ctx = xa_load(&bd->netdev->ethtool->rss_ctx,
+			      fltr->base.fw_vnic_id);
+		rss_ctx = ethtool_rxfh_context_priv(ctx);
+		vnic = &rss_ctx->vnic;
+		req->dst_id = cpu_to_le16(vnic->fw_vnic_id);
+		return;
+	}
+
+	def_vnic = &bn->vnic_info[BNGE_VNIC_NTUPLE];
+	req->dst_id = cpu_to_le16(def_vnic->fw_vnic_id);
+	enables = CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_RFS_RING_TBL_IDX;
+	req->enables |= cpu_to_le32(enables);
+	req->rfs_ring_tbl_idx = cpu_to_le16(rxq);
+}
+
+int bnge_hwrm_cfa_ntuple_filter_alloc(struct bnge_dev *bd,
+				      struct bnge_ntuple_filter *fltr)
+{
+	struct hwrm_cfa_ntuple_filter_alloc_output *resp;
+	struct hwrm_cfa_ntuple_filter_alloc_input *req;
+	struct bnge_flow_masks *masks = &fltr->fmasks;
+	struct flow_keys *keys = &fltr->fkeys;
+	int rc;
+
+	rc = bnge_hwrm_req_init(bd, req, HWRM_CFA_NTUPLE_FILTER_ALLOC);
+	if (rc)
+		return rc;
+
+	req->l2_filter_id = fltr->l2_filter_id;
+
+	if (fltr->base.flags & BNGE_ACT_DROP)
+		req->flags =
+			cpu_to_le32(CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_DROP);
+	else
+		bnge_cfg_rfs_ring_tbl_idx(bd, req, fltr);
+
+	req->enables |= cpu_to_le32(BNGE_NTP_FLTR_FLAGS);
+
+	req->ethertype = htons(ETH_P_IP);
+	req->ip_addr_type = CFA_NTUPLE_FILTER_ALLOC_REQ_IP_ADDR_TYPE_IPV4;
+	req->ip_protocol = keys->basic.ip_proto;
+
+	if (keys->basic.n_proto == htons(ETH_P_IPV6)) {
+		req->ethertype = htons(ETH_P_IPV6);
+		req->ip_addr_type =
+			CFA_NTUPLE_FILTER_ALLOC_REQ_IP_ADDR_TYPE_IPV6;
+		memcpy(&req->src_ipaddr, &keys->addrs.v6addrs.src,
+		       sizeof(struct in6_addr));
+		memcpy(&req->src_ipaddr_mask, &masks->addrs.v6addrs.src,
+		       sizeof(struct in6_addr));
+		memcpy(&req->dst_ipaddr, &keys->addrs.v6addrs.dst,
+		       sizeof(struct in6_addr));
+		memcpy(&req->dst_ipaddr_mask, &masks->addrs.v6addrs.dst,
+		       sizeof(struct in6_addr));
+	} else {
+		req->src_ipaddr[0] = keys->addrs.v4addrs.src;
+		req->src_ipaddr_mask[0] = masks->addrs.v4addrs.src;
+		req->dst_ipaddr[0] = keys->addrs.v4addrs.dst;
+		req->dst_ipaddr_mask[0] = masks->addrs.v4addrs.dst;
+	}
+	if (keys->control.flags & FLOW_DIS_ENCAPSULATION) {
+		req->enables |= cpu_to_le32(BNGE_NTP_TUNNEL_FLTR_FLAG);
+		req->tunnel_type =
+			CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_ANYTUNNEL;
+	}
+
+	req->src_port = keys->ports.src;
+	req->src_port_mask = masks->ports.src;
+	req->dst_port = keys->ports.dst;
+	req->dst_port_mask = masks->ports.dst;
+
+	resp = bnge_hwrm_req_hold(bd, req);
+	rc = bnge_hwrm_req_send(bd, req);
+	if (!rc)
+		fltr->base.filter_id = resp->ntuple_filter_id;
 	bnge_hwrm_req_drop(bd, req);
 	return rc;
 }
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
index 578575b0896a..596064d3bb05 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.h
@@ -13,6 +13,8 @@ struct bnge_l2_filter;
 #define BNGE_VNIC_CFG_ROCE_DUAL_MODE		\
 	VNIC_CFG_REQ_FLAGS_ROCE_DUAL_VNIC_MODE
 
+struct bnge_ntuple_filter;
+
 int bnge_hwrm_ver_get(struct bnge_dev *bd);
 int bnge_hwrm_func_reset(struct bnge_dev *bd);
 int bnge_hwrm_fw_set_time(struct bnge_dev *bd);
@@ -66,4 +68,8 @@ int bnge_hwrm_shutdown_link(struct bnge_dev *bd);
 int bnge_hwrm_port_qstats(struct bnge_dev *bd, u8 flags);
 int bnge_hwrm_port_qstats_ext(struct bnge_dev *bd, u8 flags);
 int bnge_hwrm_func_qstat_ext(struct bnge_dev *bd, struct bnge_stats_mem *stats);
+int bnge_hwrm_cfa_ntuple_filter_alloc(struct bnge_dev *bd,
+				      struct bnge_ntuple_filter *fltr);
+int bnge_hwrm_cfa_ntuple_filter_free(struct bnge_dev *bd,
+				     struct bnge_ntuple_filter *fltr);
 #endif /* _BNGE_HWRM_LIB_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 8c65eaad2655..664ff89cae3f 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1192,6 +1192,10 @@ static void bnge_free_core(struct bnge_net *bn)
 	bnge_free_ring_stats(bn);
 	bnge_free_ring_grps(bn);
 	bnge_free_vnics(bn);
+
+	/* Free non-user filters only */
+	bnge_free_ntp_fltrs(bn, true);
+
 	kfree(bn->tx_ring_map);
 	bn->tx_ring_map = NULL;
 	kfree(bn->tx_ring);
@@ -1280,6 +1284,10 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
 	bnge_init_stats(bn);
 
+	rc = bnge_fltrs_mem(bn);
+	if (rc)
+		goto err_free_ring_stats;
+
 	rc = bnge_alloc_vnics(bn);
 	if (rc)
 		goto err_free_ring_stats;
@@ -2056,7 +2064,7 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,
 		struct bnge_l2_filter *fltr = vnic->l2_filters[i];
 
 		bnge_hwrm_l2_filter_free(bd, fltr);
-		bnge_del_l2_filter(bn, fltr);
+		bnge_del_l2_filter_rcu(bn, fltr);
 	}
 
 	vnic->uc_filter_count = 1;
@@ -2274,7 +2282,7 @@ static void bnge_hwrm_clear_vnic_filter(struct bnge_net *bn)
 		struct bnge_l2_filter *fltr = vnic->l2_filters[i];
 
 		bnge_hwrm_l2_filter_free(bn->bd, fltr);
-		bnge_del_l2_filter(bn, fltr);
+		bnge_del_l2_filter_rcu(bn, fltr);
 	}
 
 	vnic->uc_filter_count = 0;
@@ -3005,6 +3013,7 @@ static void bnge_save_ring_stats(struct bnge_net *bn)
 
 static void bnge_close_core(struct bnge_net *bn)
 {
+	struct bnge_filter_base *fltr;
 	struct bnge_dev *bd = bn->bd;
 
 	bnge_tx_disable(bn);
@@ -3018,6 +3027,20 @@ static void bnge_close_core(struct bnge_net *bn)
 
 	bnge_disable_napi(bn);
 
+	/* Invalidate user L2 filters now that NAPI is disabled so that
+	 * subsequent re-enabling during open cannot read a stale or torn
+	 * filter_id before bnge_cfg_usr_fltrs() completes reallocation.
+	 */
+	/* Only the driver's tracking is reset here. The user filters are
+	 * programmed again by bnge_cfg_usr_fltrs() on the next open.
+	 */
+	list_for_each_entry(fltr, &bn->usr_fltr_list, list_node) {
+		if (fltr->type == BNGE_FLTR_TYPE_L2)
+			clear_bit(BNGE_FLTR_VALID, &fltr->state);
+		else
+			fltr->filter_id = BNGE_FLTR_ID_INVALID;
+	}
+
 	/* Save ring stats before shutdown */
 	spin_lock_bh(&bn->stats_lock);
 	bnge_save_ring_stats(bn);
@@ -3419,6 +3442,9 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 		goto err_free_workq;
 	spin_lock_init(&bn->stats_lock);
 
+	spin_lock_init(&bn->ntp_fltr_lock);
+	INIT_LIST_HEAD(&bn->usr_fltr_list);
+
 	netdev->request_ops_lock = true;
 	rc = register_netdev(netdev);
 	if (rc) {
@@ -3447,6 +3473,9 @@ void bnge_netdev_free(struct bnge_dev *bd)
 
 	unregister_netdev(netdev);
 
+	bnge_free_ntp_fltrs(bn, false);
+	bnge_free_l2_filters(bn);
+
 	timer_shutdown_sync(&bn->timer);
 	cancel_work_sync(&bn->sp_task);
 	bn->sp_event = 0;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 0512d983519e..2a1ec811de01 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -284,6 +284,9 @@ enum bnge_sp_event {
 	BNGE_PERIODIC_STATS_SP_EVENT,
 };
 
+#define BNGE_NTP_FLTR_HASH_SIZE	512
+#define BNGE_NTP_FLTR_HASH_MASK	(BNGE_NTP_FLTR_HASH_SIZE - 1)
+
 struct bnge_net {
 	struct bnge_dev		*bd;
 	struct net_device	*netdev;
@@ -372,6 +375,20 @@ struct bnge_net {
 	bool			pri2cos_valid;
 
 	u16			num_rss_ctx;
+
+	struct list_head	usr_fltr_list;
+	unsigned long		*ntp_fltr_bmap;
+	unsigned long		*l2_fltr_bmap;
+	int			ntp_fltr_count;
+	int			l2_fltr_count;
+	int			user_fltr_count;
+
+	struct hlist_head	ntp_fltr_hash_tbl[BNGE_NTP_FLTR_HASH_SIZE];
+	/* Protects the aRFS/ntuple hash table add and delete. usr_fltr_list,
+	 * l2_fltr_hash_tbl and l2_fltr_bmap are covered by the netdev instance
+	 * lock instead.
+	 */
+	spinlock_t		ntp_fltr_lock;
 };
 
 #define BNGE_DEFAULT_RX_RING_SIZE	511
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index c4ad8ddab214..bed9619ed830 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -12,6 +12,7 @@
 #include "bnge_hwrm_lib.h"
 #include "bnge_resc.h"
 #include "bnge_vnic.h"
+#include "bnge_filter.h"
 
 static u16 bnge_num_tx_to_cp(struct bnge_dev *bd, u16 tx)
 {
@@ -715,7 +716,6 @@ bool bnge_rss_ctx_capable(struct bnge_dev *bd)
 
 int bnge_net_init_dflt_config(struct bnge_dev *bd)
 {
-	struct bnge_hw_resc *hw_resc;
 	int rc;
 
 	rc = bnge_alloc_rss_indir_tbl(bd);
@@ -727,9 +727,7 @@ int bnge_net_init_dflt_config(struct bnge_dev *bd)
 		goto err_free_tbl;
 
 	bnge_set_dflt_rss_indir_tbl(bd, NULL);
-	hw_resc = &bd->hw_resc;
-	bd->max_fltr = hw_resc->max_rx_em_flows + hw_resc->max_rx_wm_flows +
-		       BNGE_L2_FLTR_MAX_FLTR;
+	bd->max_fltr = BNGE_MAX_NTUPLE_FLTRS;
 
 	return 0;
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index 7d587290c33a..a18a2be118cd 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -178,8 +178,15 @@ void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
 			  bool all)
 {
 	struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+	struct bnge_filter_base *usr_fltr, *tmp;
+	struct bnge_ntuple_filter *ntp_fltr;
 	int i;
 
+	/* The kernel ethtool core prevents deleting a busy RSS context via
+	 * ethtool_check_rss_ctx_busy().
+	 * When all == false (interface down), software filters are deliberately
+	 * preserved so they can be restored when the interface is brought up.
+	 */
 	bnge_hwrm_vnic_free_one(bn->bd, &rss_ctx->vnic);
 	for (i = 0; i < BNGE_MAX_CTX_PER_VNIC; i++) {
 		if (vnic->fw_rss_cos_lb_ctx[i] != INVALID_HW_RING_ID) {
@@ -192,6 +199,19 @@ void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
 	if (!all)
 		return;
 
+	/* Delete all filters associated with this user RSS context */
+	list_for_each_entry_safe(usr_fltr, tmp, &bn->usr_fltr_list, list_node) {
+		if (usr_fltr->type == BNGE_FLTR_TYPE_NTUPLE &&
+		    (usr_fltr->flags & BNGE_ACT_RSS_CTX) &&
+		    usr_fltr->fw_vnic_id == rss_ctx->index) {
+			ntp_fltr = container_of(usr_fltr,
+						struct bnge_ntuple_filter,
+						base);
+			bnge_hwrm_cfa_ntuple_filter_free(bn->bd, ntp_fltr);
+			bnge_del_ntp_filter_rcu(bn, ntp_fltr);
+		}
+	}
+
 	if (vnic->rss_table)
 		dma_free_coherent(bn->bd->dev, vnic->rss_table_size,
 				  vnic->rss_table,
-- 
2.52.0

