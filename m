Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD470524AED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859931; cv=none; b=R8ewg4hqjkK6lmf1NSW312HcdP+Gkr/KiKoXiUBppjXRXBgvp/RoyuSIDqgxD1DJyP8k/vk8lW7ZTY1zZEWjKdCXhBbKdDedjbvIzrE8zX3KFr1e5Xert0Q6ZSDl76nAjY2T5FrNDkOrp8uZ4fYYPVEyAjudfvT00/N0hHe5rog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859931; c=relaxed/simple;
	bh=GDKfc/zjWWC+z6N8KuyLUCLfEsc44hSVRx4rQ6PlKwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sD2u6DMxUOC6MR1Ix783EGO9bjHd+mR2btNXUrAeh46blcpkRs4hg+WVBZ5WMbPGjhCpOfIeMevFEKAN8lOtOBBgsZFdiR06paVKOTHs0KLq7Ih1nrbkygdiHj4WiEq/UTATJ/1Pj5ZscPD8NQj0cvCa9GRIrftRf6IJpBmb6y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RFmwfcLX; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RFmwfcLX"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2325877a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859929; x=1789464729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kcB9vejUprGBpAfoEHkBCB0tYI99C7oJHd92n3cBcA=;
        b=qmXD3yhuvp1kIUGaejEERAo8KjsK75Nb0/1br0xD0H/kADtZ1Tn24D3r+Ah1YX6MnF
         wQf24xLcV7X9zssBUS24AIlaS4bTbSehozgQWGXw16k0krA5epuFwUTJP1B5YAXoO4ha
         qw671EQTslkYRaSTGnqgy1NgQvz5iw/AXQxWAAY9u9OgOUI/HEmGTQtVhkUunwqDRUqp
         3y7jlAdaJbOFWXhe4lcHkzuF2uQHJlK9f0tAFIlpkER09hASxw70pXnHpWq7cIFYCDh8
         hmyLJekgtNUeaTiP+4vdO/5FeLsoqIiNM6iGsLsKfvHkJ3CCj1N0PZ5uOExlGAtVctjs
         jGlg==
X-Forwarded-Encrypted: i=1; AKwUvBx+2RBzq6iM9kGq9vGGBXHlgDLhYOyQW7asap7Po96lRjyVrFTod/odqvi28nJ3xijwdCCr+qtXAJbKpQA=@vger.kernel.org
X-Gm-Message-State: AFuF++ngevrKu60MKa5/Ew9Lyllrf9pOA4BcrTfsbSaUxb+KTdewbY1c
	En95y7qG6KGMZi4b2moML23fyYk2rmhNROzsneHtdnj8rHvX+U0Wj+sxdn7gClO6TCeSyw3P2vy
	H7cR1ZRcIyE+/C1Nzfes4+F/AYfauwM8NfhqlGe99x78HwV0V3MqA89Zavxsc2VQXoWkXiHYdMh
	7l3JYaBsGJAIEEyhKmYLi25EGqtmsm6dWedO1z8ibQRQH4CzfyFweE4NXKheQKkJGhbMZ+25Neq
	KUew+6UKCikwXWhXA==
X-Gm-Gg: AYBFou0UsUXH58uNiCjPbxz3HznMtJlNrXA6PBQkYfzt0elySh2o1RBLcM2Zy8uiNDA
	tcaLfMFgzPlh9w2/4QpMa8Zw8TeybfQBha5M9zf9sZlF4xtkxwrFNy9H/q0HP6mvrLvtEAuM52z
	T3+qBRTNvSM6oWXUBcZ6OkZnkJMi36RMtcnhdD0PoiNnRx7eAErdi7n3e5VldxKL/8+Uk/6EF7y
	3bffhAlBmOo7s9dvNlyRc1AN6h5tZXeNARJxBcqCq0LOIK9s8UoPJaH/LcatdXUV0zwoWjYZgxO
	N4VN0srCl7HwOSbvnN7kCHExaFtrj6WjuvYzOJcGAAY5UJnjrOpyd8tfMLvvTmUuz62bQm+j1DZ
	Mf37beEPZ4E6Cs7TTco9QJQyX3zUxLFFSBNYQDtIeq5M13kBpQXg1miMNYqy9GHY8bKfg8OT5CW
	ngGlEO2hX05AcjyovBCtVxF9U3cCRYD3Sr5Krz
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr43503553a91.15.1788859929121;
        Tue, 08 Sep 2026 02:32:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b28c68f8csm7900331a91.5.2026.09.08.02.32.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:32:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so5520855a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788859927; x=1789464727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kcB9vejUprGBpAfoEHkBCB0tYI99C7oJHd92n3cBcA=;
        b=RFmwfcLXeOGkdTEonWQUTErDEn0rN5VbqiYnGXOpf4lBZb8huz0B5p/swBqvGmqOG8
         Dixmz6yMzpTm1zybDv7N66+WNSobLHx1KJmvC51S9OEfwu6O0g5gvzLqlLibDtlvAdqy
         DDTf2JdAh/ZW1pWlJLa4eYlUGPbUQXMyHX/I0=
X-Forwarded-Encrypted: i=1; AKwUvBw5575fqXoqD0zgRyGmpsS/q1mQz6dFtP6KRbTeTCHVIaF0LWxPtY/SgxMwjDhT5Etfkvr3WfZP714UqHc=@vger.kernel.org
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr43580503a91.17.1788859927295;
        Tue, 08 Sep 2026 02:32:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr43580444a91.17.1788859926797;
        Tue, 08 Sep 2026 02:32:06 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm31493316a91.11.2026.09.08.02.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:32:06 -0700 (PDT)
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
Subject: [net-next, v2 10/11] bnge: add aRFS flow steering ndo support
Date: Tue,  8 Sep 2026 15:00:52 +0530
Message-ID: <20260908093053.2596020-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
References: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  45 ++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |   1 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 102 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   1 +
 4 files changed, 149 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index 9da3c976cf3a..a7844f364994 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -621,3 +621,48 @@ void bnge_clear_usr_fltrs(struct bnge_net *bn)
 		}
 	}
 }
+
+void bnge_cfg_ntp_filters(struct bnge_net *bn)
+{
+#ifdef CONFIG_RFS_ACCEL
+	struct bnge_ntuple_filter *fltr, *tmp;
+	LIST_HEAD(install_list);
+	LIST_HEAD(expire_list);
+	int i, rc;
+
+	rcu_read_lock();
+	for (i = 0; i < BNGE_NTP_FLTR_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(fltr, &bn->ntp_fltr_hash_tbl[i],
+					 base.hlist) {
+			if (test_bit(BNGE_FLTR_VALID, &fltr->base.state)) {
+				if (fltr->base.flags & BNGE_ACT_NO_AGING)
+					continue;
+				if (rps_may_expire_flow(bn->netdev,
+							fltr->base.rxq,
+							fltr->flow_id,
+							fltr->base.sw_id))
+					list_add(&fltr->base.list_node,
+						 &expire_list);
+			} else {
+				list_add(&fltr->base.list_node, &install_list);
+			}
+		}
+	}
+	rcu_read_unlock();
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
+		bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr);
+		bnge_del_ntp_filter_rcu(bn, fltr);
+	}
+#endif
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index 4e9a4e661017..e4447af7be69 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -119,4 +119,5 @@ void bnge_del_ntp_filter_rcu(struct bnge_net *bn,
 			     struct bnge_ntuple_filter *fltr);
 void bnge_cfg_usr_fltrs(struct bnge_net *bn);
 void bnge_clear_usr_fltrs(struct bnge_net *bn);
+void bnge_cfg_ntp_filters(struct bnge_net *bn);
 #endif /* _BNGE_FILTER_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 3ecbc95772cb..4354fbf438f7 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -303,6 +303,11 @@ static void bnge_timer(struct timer_list *t)
 	if (BNGE_LINK_IS_UP(bd) && bn->stats_coal_ticks)
 		bnge_queue_sp_work(bn, BNGE_PERIODIC_STATS_SP_EVENT);
 
+#ifdef CONFIG_RFS_ACCEL
+	if ((bn->priv_flags & BNGE_NET_EN_NTUPLE) && bn->ntp_fltr_count)
+		bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
+#endif
+
 	mod_timer(&bn->timer, jiffies + bn->current_interval);
 }
 
@@ -444,6 +449,9 @@ static void bnge_sp_task(struct work_struct *work)
 			bnge_init_ethtool_link_settings(bn);
 	}
 
+	if (test_and_clear_bit(BNGE_RX_NTP_FLTR_SP_EVENT, &bn->sp_event))
+		bnge_cfg_ntp_filters(bn);
+
 	netdev_unlock(bn->netdev);
 }
 
@@ -3165,6 +3173,97 @@ static int bnge_set_features(struct net_device *dev, netdev_features_t features)
 	return 0;
 }
 
+#ifdef CONFIG_RFS_ACCEL
+static u64 bnge_lookup_l2_filter_from_key(struct bnge_net *bn,
+					  struct bnge_l2_key *key)
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
+	if (ether_addr_equal(dev->dev_addr, eth->h_dest)) {
+		struct bnge_l2_filter *l2_filter;
+
+		l2_filter = bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0];
+		filter_id = l2_filter->base.filter_id;
+
+	} else {
+		struct bnge_l2_key key;
+
+		ether_addr_copy(key.dst_mac_addr, eth->h_dest);
+		key.vlan = 0;
+
+		filter_id = bnge_lookup_l2_filter_from_key(bn, &key);
+		if (filter_id == BNGE_FLTR_ID_INVALID)
+			return -EINVAL;
+	}
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
+	    ((fkeys->basic.ip_proto != IPPROTO_TCP) &&
+	     (fkeys->basic.ip_proto != IPPROTO_UDP))) {
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
+	if (fltr) {
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
@@ -3174,6 +3273,9 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_features_check	= bnge_features_check,
 	.ndo_fix_features	= bnge_fix_features,
 	.ndo_set_features	= bnge_set_features,
+#ifdef CONFIG_RFS_ACCEL
+	.ndo_rx_flow_steer	= bnge_rx_flow_steer,
+#endif
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index bfd0d9cb871f..3146023621a6 100644
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
2.47.1

