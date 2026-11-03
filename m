Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709494;
	b=RKAeyhD3P29b8dr6kKnIgV4OpGDmCuAid/Ph7y97amNv/JJi93VdQjC31JaIesNhZb13
	 NlTAD6UAh5i4KbiSc3lzSyj4hSwRQ7z6RbJOC/sY4WuSsgP13LjH0q5mKyhWGzRdzBgH9
	 A1xY6lY4d+gD2pNlPpZ79meTgSfH+xKfTUZlPmSbLX2mqaB12/PTdo1aU208r+7Ho4HG6
	 1mqwDuPTnBAPif+1fm4gWHExaW8/9VUKJWzdNgZ3Uq7459YeUXx0wvyuxE1+A9MPiKhr/
	 FKq3nmxHAt+6LdK6CNS1BKCdQKFjrtekr8tZqiq05mf3bXy7FcLxMjLgn6+doWk6Edw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709494;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=siTq8OoH5n0mo/tq5Vtpz/8z1KIfKKuScn7VoFX68jA=;
	b=5NF3V4wGLSUrAyrfjwI5iOt3D3lNCghbwzxkedLj5JgJBHW4H6Uy0HDBGqgYSS3WN/hk
	 zSDTD+WFcPtMmi4mQ95TSXLtbrOIRqC9RgHnt349xd1uWlNZ86S7z7i/HGU0wupkbUIMV
	 BpjbNkughIuiLI5wKZEykoNBBasw0upZcZP2nro5hEMh1ZOJjloWXfQY1E7Q75teyEVWQ
	 Po0SQKuXfCu6i3TMnL77grtdhc8IKwo4/yVXrHWQ0dE1YTMfIXkNPUnYz4iv6QxkP3wXS
	 162WaWprZFumYsAElLNmANHMQOVhahBJwR2FRLR2TVXCJeiGSLFM+tcF+IKFfWNBh4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aqJPEInS;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C065606D832
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C065606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aqJPEInS
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1711964a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709493; x=1794314293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siTq8OoH5n0mo/tq5Vtpz/8z1KIfKKuScn7VoFX68jA=;
        b=A//1YnD6HT8dV2cDLFGa+rdZGb79PLmBkN5G6DrEHMlt2PkJ2+6d5XjJU3AXCKL5F4
         YD32Ct8QjmtuAok1OsmNvaqZ6AhhYKZH5f+Mv8AlEq4FFD69r6v8ZoOKzfgQHOem3Cg5
         XGkXcDd5fMO0JG/kUhlEvvZUtb3PB3yBxe2qwuJ3nA96LRt1FDV7Qxl/coMEfWL9OqPo
         hZ4zj4ACnFf5PL05Zcy6nXdg69bT3K/fqHaf3azazFmuiR3vdQX8J5dc3xSx89nLjXOd
         IqNW7Dq3rNihyvVoKcYjeFmFVVuvKRtpUItfUtkQdYeZFN8PhHYX+3cyVytppOLVpVy1
         LKww==
X-Forwarded-Encrypted: i=1; AKwUvBws2Yq8z1MWzQSo2CcwGA30eR4hmiOOoz5B+EWbnSq3RtKF5Im3jxoATAn+MkPSsctxulIVZMBkdUUpX/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h+LOK9dbSFRAHV5j/adncs4bYqqftxkShLXIikXKep9s1S/yE
	dlJQKJgRmZ29TSGOpWiz+stgo6N90m2ifhWqDEqUlfkJoH6bcsgC/eR1awE/wodZaGyhdPFs9R9
	N9PjRhDuWpKFV3SzWaIZRzKnhjHyB126xOIET7JJBxwpoeT7EG3AtX1SoUeM8vNr6a2BOEqB31B
	A7riUa/GEupxogOWZz32elDOCSAbdtjXi8NM1+C3833y3sYtebmddopUvLwfZn1aOmGhuoCbZ+n
	ikRM3Mkfz4wODJyDA==
X-Gm-Gg: AYBFou2qyMLEXBzBymyukVWRaaYlN3yOTIutSxlePPvvYykODz+4epS52fQYv3+wEAG
	vwvLK5952U6wyXXZ+biUlYqxEpVFi3+PdwkbmKsJBpiWf1s0CNxdBQTMuPxQlJnIj7HyWmNjYOm
	flzImhYF8nPHoSj+jfxE/VxvBmbChOeeA33tAPJcC9CrXpSN1xQCcKYRrpTvIxeEx3SWSZYCXai
	SHof5UPLTJA60fQ/H45fRNzwB4XNiB9ofESe1dYujDB2/y5Ae0jRDRpOPBukN9ESnp5k9IS9S8W
	GqGMebEpJPBdM2n3tMDATM7Cr6Xg1gajWt6Q0UYcOEaagAFIZ395RQIkAeZAZGIF/yLD0gqlwvt
	y/HsvET5bw3xCz4LcqB8OBC3rr8mYuXHCrNa0XQzK4u6My0BhMQ2LZ+H1FRVhHieJXUh5AMzn4L
	Mji4QN9jljM3JN9HqxWM8gUwTdjOFXfyeQQg==
X-Received: by 2002:a17:90a:5d17:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr7883090a91.14.1793709493272;
        Tue, 03 Nov 2026 04:38:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b08e8418easm186540a91.1.2026.11.03.04.38.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:38:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so3582636a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793709491; x=1794314291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siTq8OoH5n0mo/tq5Vtpz/8z1KIfKKuScn7VoFX68jA=;
        b=aqJPEInSxa5+m5gegpY692SJb8F/XuZZ9fZvh5tPvzvOEPSfdpP/9SvDVJ2rmdxAMv
         ftH04RiQfBKdfJdj6wAYGBTauaF2RdTQ1mTAkpOW5rI4XCGKEw1xLllucIGIgpjtB3nh
         4i9ywgLSKIkjA5iFCyYwpPaI7iL2HExn+4OUE=
X-Forwarded-Encrypted: i=1; AKwUvBwbDQXNXpXJtEFXzZ/DH8/FrvoDxX9T3l3/VoteWoayMTFa5thD5Gt0+9s+HrdM8bYhDRpqepviV5V946s=@vger.kernel.org
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr9995985a91.40.1793709491336;
        Tue, 03 Nov 2026 04:38:11 -0800 (PST)
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr9995951a91.40.1793709490734;
        Tue, 03 Nov 2026 04:38:10 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm2131567a91.13.2026.11.03.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:38:10 -0800 (PST)
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
Subject: [PATCH net-next v5 09/10] bnge: add aRFS flow steering ndo support
Date: Tue,  3 Nov 2026 18:06:49 +0530
Message-ID: <20261103123651.442893-10-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261103123651.442893-1-vikas.gupta@broadcom.com>
References: <20261103123651.442893-1-vikas.gupta@broadcom.com>
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

Introduce the ndo_rx_flow_steer callback (bnge_rx_flow_steer) to
support aRFS.

This callback creates an NTUPLE filter that steers matching packets
to the appropriate RX queue. The implementation dissects flow keys
from the SKB, creates an NTUPLE filter with the associated L2 filter,
inserts it into the NTUPLE hash table, and schedules the sp_task
workqueue via BNGE_RX_NTP_FLTR_SP_EVENT to program the filter
in the firmware.

Add bnge_cfg_ntp_filters() called from the periodic timer via sp_task
to handle deferred filter programming and expiration via
rps_may_expire_flow().

bnge_timer() queues aRFS aging only while NTUPLE is enabled. NTUPLE
can only be turned off with the interface closed, and
bnge_close_core() then deletes the timer and purges dynamic
aRFS filters.

Note that, if the L2 filter is freed before sp_task programs the rule,
the captured firmware id is stale. The NTUPLE alloc either fails (id
gone) or binds to a recycled id for a different filter. The rule is
then dropped, or it stays until it ages out.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c |   5 +-
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  85 ++++++++++-
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |   5 +-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   2 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 138 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   1 +
 6 files changed, 228 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index dfffb3efc333..b4c0db43adf4 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -1261,7 +1261,7 @@ static int bnge_get_all_fltr_ids_rcu(struct bnge_net *bn,
 
 		head = &tbl[i];
 		hlist_for_each_entry_rcu(fltr, head, hlist) {
-			if (!fltr->flags ||
+			if (!bnge_is_usr_fltr(fltr) ||
 			    test_bit(BNGE_FLTR_FW_DELETED, &fltr->state))
 				continue;
 			if (j == id_cnt)
@@ -1285,7 +1285,8 @@ static struct bnge_filter_base *bnge_get_one_fltr_rcu(struct bnge_net *bn,
 
 		head = &tbl[i];
 		hlist_for_each_entry_rcu(fltr, head, hlist) {
-			if (fltr->flags && fltr->sw_id + offset == id)
+			if (bnge_is_usr_fltr(fltr) &&
+			    fltr->sw_id + offset == id)
 				return fltr;
 		}
 	}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index 9b3ed0733623..8309f6d57bc6 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -56,7 +56,7 @@ const struct bnge_flow_masks BNGE_FLOW_IPV4_MASK_ALL = {
 	},
 };
 
-static bool bnge_is_usr_fltr(struct bnge_filter_base *fltr)
+bool bnge_is_usr_fltr(struct bnge_filter_base *fltr)
 {
 	return (fltr->type == BNGE_FLTR_TYPE_L2 &&
 		fltr->flags & BNGE_ACT_RING_DST) ||
@@ -116,7 +116,7 @@ void bnge_del_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *nfltr)
 	hlist_del(&fltr->hlist);
 	bnge_del_usr_fltr_node(bn, fltr);
 	clear_bit(fltr->sw_id, bn->ntp_fltr_bmap);
-	bn->ntp_fltr_count--;
+	WRITE_ONCE(bn->ntp_fltr_count, bn->ntp_fltr_count - 1);
 	kfree(fltr);
 }
 
@@ -127,7 +127,7 @@ void bnge_del_ntp_filter_rcu(struct bnge_net *bn,
 	hlist_del_rcu(&fltr->base.hlist);
 	bnge_del_usr_fltr_node(bn, &fltr->base);
 	clear_bit(fltr->base.sw_id, bn->ntp_fltr_bmap);
-	bn->ntp_fltr_count--;
+	WRITE_ONCE(bn->ntp_fltr_count, bn->ntp_fltr_count - 1);
 	spin_unlock_bh(&bn->ntp_fltr_lock);
 
 	kfree_rcu(fltr, base.rcu);
@@ -538,7 +538,7 @@ int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
 	hlist_add_head_rcu(&fltr->base.hlist, head);
 
 	bnge_insert_usr_fltr(bn, &fltr->base);
-	bn->ntp_fltr_count++;
+	WRITE_ONCE(bn->ntp_fltr_count, bn->ntp_fltr_count + 1);
 
 	spin_unlock_bh(&bn->ntp_fltr_lock);
 
@@ -696,3 +696,80 @@ void bnge_clear_usr_fltrs(struct bnge_net *bn)
 		}
 	}
 }
+
+void bnge_cfg_ntp_filters(struct bnge_net *bn)
+{
+#ifdef CONFIG_RFS_ACCEL
+	struct bnge_ntuple_filter *fltr, *tmp;
+	LIST_HEAD(install_list);
+	LIST_HEAD(update_list);
+	LIST_HEAD(expire_list);
+	u32 flow_id;
+	int i, rc;
+	u16 rxq;
+
+	rcu_read_lock();
+	for (i = 0; i < BNGE_NTP_FLTR_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(fltr, &bn->ntp_fltr_hash_tbl[i],
+					 base.hlist) {
+			if (test_bit(BNGE_FLTR_VALID, &fltr->base.state)) {
+				if (fltr->base.flags & BNGE_ACT_NO_AGING)
+					continue;
+				if (test_and_clear_bit(BNGE_FLTR_RXQ_UPDATE,
+						       &fltr->base.state)) {
+					list_add(&fltr->base.list_node,
+						 &update_list);
+					continue;
+				}
+				rxq = READ_ONCE(fltr->base.rxq);
+				flow_id = READ_ONCE(fltr->flow_id);
+				if (rps_may_expire_flow(bn->netdev, rxq,
+							flow_id,
+							fltr->base.sw_id))
+					list_add(&fltr->base.list_node,
+						 &expire_list);
+			} else {
+				/* The install below reads the current rxq; order the
+				 * clear before that read.
+				 */
+				clear_bit(BNGE_FLTR_RXQ_UPDATE,
+					  &fltr->base.state);
+				smp_mb__after_atomic();
+				list_add(&fltr->base.list_node, &install_list);
+			}
+		}
+	}
+	rcu_read_unlock();
+
+	/* Free the old HW rule; reinstall it below on the new queue. */
+	list_for_each_entry_safe(fltr, tmp, &update_list, base.list_node) {
+		list_del_init(&fltr->base.list_node);
+		/* If the free fails the rule stays on the old queue. It is not
+		 * retried, so a firmware that keeps failing is not hit on every
+		 * tick.
+		 */
+		if (bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr))
+			continue;
+		clear_bit(BNGE_FLTR_FW_DELETED, &fltr->base.state);
+		list_add(&fltr->base.list_node, &install_list);
+	}
+
+	list_for_each_entry_safe(fltr, tmp, &install_list, base.list_node) {
+		list_del_init(&fltr->base.list_node);
+		rc = bnge_hwrm_cfa_ntuple_filter_alloc(bn->bd, fltr);
+		if (rc)
+			bnge_del_ntp_filter_rcu(bn, fltr);
+		else
+			set_bit(BNGE_FLTR_VALID, &fltr->base.state);
+	}
+
+	list_for_each_entry_safe(fltr, tmp, &expire_list, base.list_node) {
+		list_del_init(&fltr->base.list_node);
+		/* Retargeted by bnge_rx_flow_steer() after the scan */
+		if (test_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state))
+			continue;
+		bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr);
+		bnge_del_ntp_filter_rcu(bn, fltr);
+	}
+#endif
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index 9c5453d5b50a..a7d2983bc25e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -19,7 +19,8 @@ enum {
 
 enum {
 	BNGE_FLTR_VALID,
-	BNGE_FLTR_FW_DELETED
+	BNGE_FLTR_FW_DELETED,
+	BNGE_FLTR_RXQ_UPDATE
 };
 
 enum {
@@ -97,6 +98,7 @@ struct bnge_ntuple_filter {
 #define BNGE_FLTR_ID_INVALID	cpu_to_le64(0xffffffffffffffffULL)
 
 void bnge_free_ntp_fltrs(struct bnge_net *bn, bool skip_user_filters);
+bool bnge_is_usr_fltr(struct bnge_filter_base *fltr);
 u32 bnge_get_ntp_filter_idx(struct bnge_net *bn, struct flow_keys *fkeys,
 			    const struct sk_buff *skb);
 int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
@@ -123,4 +125,5 @@ void bnge_del_ntp_filter_rcu(struct bnge_net *bn,
 			     struct bnge_ntuple_filter *fltr);
 void bnge_cfg_usr_fltrs(struct bnge_net *bn);
 void bnge_clear_usr_fltrs(struct bnge_net *bn);
+void bnge_cfg_ntp_filters(struct bnge_net *bn);
 #endif /* _BNGE_FILTER_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index bb6233351484..ce41d94838e6 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -1007,8 +1007,8 @@ bnge_cfg_rfs_ring_tbl_idx(struct bnge_dev *bd,
 			  struct bnge_ntuple_filter *fltr)
 {
 	struct bnge_net *bn = netdev_priv(bd->netdev);
+	u32 rxq = READ_ONCE(fltr->base.rxq);
 	struct bnge_vnic_info *def_vnic;
-	u32 rxq = fltr->base.rxq;
 	u32 enables;
 
 	if (fltr->base.flags & BNGE_ACT_RSS_CTX) {
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index f72b912d52f6..835619604dc2 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -303,6 +303,12 @@ static void bnge_timer(struct timer_list *t)
 	if (BNGE_LINK_IS_UP(bd) && bn->stats_coal_ticks)
 		bnge_queue_sp_work(bn, BNGE_PERIODIC_STATS_SP_EVENT);
 
+#ifdef CONFIG_RFS_ACCEL
+	if ((bn->priv_flags & BNGE_NET_EN_NTUPLE) &&
+	    READ_ONCE(bn->ntp_fltr_count))
+		bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
+#endif
+
 	mod_timer(&bn->timer, jiffies + bn->current_interval);
 }
 
@@ -444,6 +450,9 @@ static void bnge_sp_task(struct work_struct *work)
 			bnge_init_ethtool_link_settings(bn);
 	}
 
+	if (test_and_clear_bit(BNGE_RX_NTP_FLTR_SP_EVENT, &bn->sp_event))
+		bnge_cfg_ntp_filters(bn);
+
 	netdev_unlock(bn->netdev);
 }
 
@@ -3201,6 +3210,132 @@ static int bnge_set_features(struct net_device *dev, netdev_features_t features)
 	return 0;
 }
 
+#ifdef CONFIG_RFS_ACCEL
+static __le64 bnge_lookup_l2_filter_from_key(struct bnge_net *bn,
+					     struct bnge_l2_key *key)
+{
+	u32 idx;
+
+	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
+	      BNGE_L2_FLTR_HASH_MASK;
+	return bnge_lookup_l2_filter_rcu(bn, key, idx);
+}
+
+static int bnge_rx_flow_steer(struct net_device *dev, const struct sk_buff *skb,
+			      u16 rxq_index, u32 flow_id)
+{
+	struct ethhdr *eth = (struct ethhdr *)skb_mac_header(skb);
+	struct bnge_ntuple_filter *fltr, *new_fltr;
+	struct bnge_net *bn = netdev_priv(dev);
+	struct flow_keys *fkeys;
+	__le64 filter_id;
+	u32 flags, idx;
+	int rc = 0;
+
+	/* Hold rcu_read_lock() across the L2 filter lookup and check
+	 * BNGE_STATE_OPEN inside it. bnge_close_core() clears the
+	 * flag before bnge_shutdown_nic() frees the L2 filters via
+	 * kfree_rcu(), so if we observe the device open here the
+	 * filter cannot be freed under us for the duration of
+	 * this critical section.
+	 */
+	rcu_read_lock();
+	if (!test_bit(BNGE_STATE_OPEN, &bn->bd->state)) {
+		rcu_read_unlock();
+		return -EINVAL;
+	}
+
+	if (ether_addr_equal(dev->dev_addr, eth->h_dest)) {
+		struct bnge_vnic_info *vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
+		struct bnge_l2_filter *l2_filter;
+
+		if (!vnic->uc_filter_count) {
+			rcu_read_unlock();
+			return -EINVAL;
+		}
+		l2_filter = vnic->l2_filters[0];
+		filter_id = l2_filter->base.filter_id;
+	} else {
+		struct bnge_l2_key key;
+
+		ether_addr_copy(key.dst_mac_addr, eth->h_dest);
+		key.vlan = 0;
+
+		filter_id = bnge_lookup_l2_filter_from_key(bn, &key);
+		if (filter_id == BNGE_FLTR_ID_INVALID) {
+			rcu_read_unlock();
+			return -EINVAL;
+		}
+	}
+	rcu_read_unlock();
+
+	new_fltr = kzalloc_obj(*new_fltr, GFP_ATOMIC);
+	if (!new_fltr)
+		return -ENOMEM;
+
+	fkeys = &new_fltr->fkeys;
+	if (!skb_flow_dissect_flow_keys(skb, fkeys, 0)) {
+		rc = -EPROTONOSUPPORT;
+		goto err_free;
+	}
+
+	if ((fkeys->basic.n_proto != htons(ETH_P_IP) &&
+	     fkeys->basic.n_proto != htons(ETH_P_IPV6)) ||
+	    (fkeys->basic.ip_proto != IPPROTO_TCP &&
+	     fkeys->basic.ip_proto != IPPROTO_UDP)) {
+		rc = -EPROTONOSUPPORT;
+		goto err_free;
+	}
+	new_fltr->fmasks = BNGE_FLOW_IPV4_MASK_ALL;
+	if (fkeys->basic.n_proto == htons(ETH_P_IPV6))
+		new_fltr->fmasks = BNGE_FLOW_IPV6_MASK_ALL;
+
+	flags = fkeys->control.flags;
+	if (flags & FLOW_DIS_IS_FRAGMENT) {
+		rc = -EPROTONOSUPPORT;
+		goto err_free;
+	}
+
+	new_fltr->l2_filter_id = filter_id;
+
+	idx = bnge_get_ntp_filter_idx(bn, fkeys, skb);
+	rcu_read_lock();
+	fltr = bnge_lookup_ntp_filter_from_idx(bn, new_fltr, idx);
+	/* Filter already exists. If the flow moved to another queue,
+	 * retarget it, sp_task reprograms it in hardware.
+	 */
+	if (fltr) {
+		if (!(fltr->base.flags & BNGE_ACT_NO_AGING) &&
+		    READ_ONCE(fltr->base.rxq) != rxq_index) {
+			spin_lock_bh(&bn->ntp_fltr_lock);
+			WRITE_ONCE(fltr->base.rxq, rxq_index);
+			WRITE_ONCE(fltr->flow_id, flow_id);
+			/* Pairs with test_and_clear_bit() in sp_task */
+			smp_mb__before_atomic();
+			set_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state);
+			spin_unlock_bh(&bn->ntp_fltr_lock);
+			bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
+		}
+		rc = fltr->base.sw_id;
+		rcu_read_unlock();
+		goto err_free;
+	}
+	rcu_read_unlock();
+
+	new_fltr->flow_id = flow_id;
+	new_fltr->base.rxq = rxq_index;
+	rc = bnge_insert_ntp_filter(bn, new_fltr, idx);
+	if (!rc) {
+		bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
+		return new_fltr->base.sw_id;
+	}
+
+err_free:
+	kfree(new_fltr);
+	return rc;
+}
+#endif
+
 static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_open		= bnge_open,
 	.ndo_stop		= bnge_close,
@@ -3210,6 +3345,9 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_features_check	= bnge_features_check,
 	.ndo_fix_features	= bnge_fix_features,
 	.ndo_set_features	= bnge_set_features,
+#ifdef CONFIG_RFS_ACCEL
+	.ndo_rx_flow_steer	= bnge_rx_flow_steer,
+#endif
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 2a1ec811de01..74dbca600cbe 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -282,6 +282,7 @@ enum bnge_sp_event {
 	BNGE_LINK_CFG_CHANGE_SP_EVENT,
 	BNGE_UPDATE_PHY_SP_EVENT,
 	BNGE_PERIODIC_STATS_SP_EVENT,
+	BNGE_RX_NTP_FLTR_SP_EVENT,
 };
 
 #define BNGE_NTP_FLTR_HASH_SIZE	512
-- 
2.52.0

