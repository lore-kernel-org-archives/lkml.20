Received: from mail-ua1-f99.google.com (mail-ua1-f99.google.com [209.85.222.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8054457AC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627572; cv=none; b=m8psM0XhS/40+O7HTvrwFes64l0PecHWEfbtzaqmJyHYEh+usx8lJRSNC7IjUC2LE6lGpHFxinK/vBfmfw5BOb9NELi3Rqu1YOP6BPAA/VZnFIVZUvuQVICgOIXpP2RkI8IrV/RAPYQN4BnAJwpDOWl49OjJh8lQEIGwnoatCcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627572; c=relaxed/simple;
	bh=7CTJlmlkpUV75kzLCWq5iYzg6XYHKDImSoSt4OPBDWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1py7k79J1ZXVNMpgtPwXMcXfYZVdpKzR9SO0XvNQe36+adWqdolQeA8AP9yA6gAZlLHUH8E8POzw3bLETAA254kdKnQRtaPYuxsMdGSDEkagtN4stgaiQvQ3fx29lCydlmge+eFMH8raU5yIEY47orrQllOsIJSIgIdCuSfJxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=a9d6kqpW; arc=none smtp.client-ip=209.85.222.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="a9d6kqpW"
Received: by mail-ua1-f99.google.com with SMTP id a1e0cc1a2514c-9809ce25a29so339375241.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627566; x=1790232366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMSuN4WTt6I7qMCgUb4Qu38XrQnC03P67hyi5FUJGKw=;
        b=WFCyKW3L9GqCsKo1lZzXMSm6dcOAzLB/d1VBV0HNpPtFL5kUR+F9kJoYp4FJhtv2u7
         7TnFIMePVIXOkYhp2zVIWCvlt/M20S+GUQqA/eR0uYEmrdtNjVsZ9kJHWQv0flW+VcPY
         78Dx4/KOkrrUGxN58qfE8TPUfVQJJpNFART2un0Lk22aS2rxXWDNnaYckVqM2eARnBMc
         fIuR2UVeMDhkqyQ2Kvg/CyMhMirBBTzzBwUJ7vmSJpreG8Xn58kncWgtq/sK6cFthghx
         942WPCYJ1HjmZYESe39YuLRHlfgXJG0Qq/gOEckmqcPuQDtZ0+qKu0FW/B3fuqPSBRWb
         M3dA==
X-Forwarded-Encrypted: i=1; AKwUvBxbvX4yk5TORam9SbQhKiDHGnkw42OXCJQRG3Dl3+pieHozBBbVdQr4rt5HB+XTfoCxmy87w271+k+cJr4=@vger.kernel.org
X-Gm-Message-State: AFuF++nVarymUUyQi5ATr2c26X/9DlTOSN8o1koCpVXR+8BVdfmh/chU
	STp6m6JVE53+r453qLUBsy/qMQRqJ6xi9ApArQ8mnvkrkcQU87mG2QLb2zquqPODqBQwebBQDJw
	edOxP8m7yG1+wUWZRzbt0klYwUqpdz+MTzTGfLQOA2zBCfLGAQcLxM4n3UPWIJImHdPeBY2H80C
	ksgc4dVTj+ZSYqlEQIdcWHh0MIgF+En0KVlRIajwSelh4lIbMJhUZEEnEErQw18tdGLX+S0lWrO
	5Aw6GD+wYatrfbENA==
X-Gm-Gg: AYBFou020Gql1cAPr+Wi8btSsIgk3FdsBkTsVVtxurhN38onofV+7RuL9Jd9UNUXwHm
	DMtVoVCKcEqJaa/UNsKFOPZbcboZdTWiOGrVhfmbDNQzY0SuvZaxftKEIL1/cVGA9AHiazAlChD
	omFC2j22hmjuLCPKrcxuiklojAybtmFP+V/XHXKmrJo53c3O98xN2SW89AvHL+POpFQNLnCE5xq
	nxWB328jaiTqp3O1q1eIwSb3460Tw/0MUKZQZrePBGDJMR7HVprJFNxNGo5ZUOWel4cJL4Rh4Mv
	bPEHB+oCSu4CM5JYC1Mc2LN2V5nYpIhrS+9WVQ0PLdqGaBxVrHSrQFLMoEwupn/Q5kB9xPE54Ko
	wL3w0BghbNTO7rLiMclcbXDEtBWyk4vdqeToXO5w1UIWDYMEO39bxdSBkSvtugaURwi8GeRoFqv
	Y3sK7DoDBi0RG2p9jMzFr0nZDLh2Fy0TFB5w==
X-Received: by 2002:a05:6102:631a:20b0:7a1:f2b5:6462 with SMTP id ada2fe7eead31-7a1f2b5658dmr466501137.31.1789627565747;
        Wed, 16 Sep 2026 23:46:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-983233e9fc2sm675735241.2.2026.09.16.23.46.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:46:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso451569a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789627564; x=1790232364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMSuN4WTt6I7qMCgUb4Qu38XrQnC03P67hyi5FUJGKw=;
        b=a9d6kqpWtL8f3xL+pcNvBpp/Weaiqlufri4Yy8whZ6Nd2YUWHRkFDAYOtCs2zktuu6
         ub20IFHF7NNTWK3sgoLoM7E9zVjbAB+oc2UUM9igWP9nlWsPLCbSU1vXJk1wIpdJcrlR
         WQJqQDwOWUo8W/dLmi3sNZUzwilnFizQPbqkQ=
X-Forwarded-Encrypted: i=1; AKwUvBzyEwPwxEaTId3Rg5DXkWS6TchTg1kbGcL6kfRdxqO9cQDHkA8cocJMo7n9LVtx1uCQoyHhpE8I+geExRs=@vger.kernel.org
X-Received: by 2002:a05:6a21:e8a:b0:3dd:65a5:a33 with SMTP id adf61e73a8af0-3dd725dca83mr3849714637.10.1789627564504;
        Wed, 16 Sep 2026 23:46:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8a:b0:3dd:65a5:a33 with SMTP id adf61e73a8af0-3dd725dca83mr3849663637.10.1789627563900;
        Wed, 16 Sep 2026 23:46:03 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm2754293a12.20.2026.09.16.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:46:03 -0700 (PDT)
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
Subject: [net-next, v3 01/11] bnge: update HSI
Date: Thu, 17 Sep 2026 12:15:38 +0530
Message-ID: <20260917064548.773334-2-vikas.gupta@broadcom.com>
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

Update HSI to support future patches implementing multi-RSS and
NTUPLE-related features.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 include/linux/bnge/hsi.h | 136 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 135 insertions(+), 1 deletion(-)

diff --git a/include/linux/bnge/hsi.h b/include/linux/bnge/hsi.h
index 1f7bd96415a5..d4fe662d60b1 100644
--- a/include/linux/bnge/hsi.h
+++ b/include/linux/bnge/hsi.h
@@ -8607,6 +8607,7 @@ struct hwrm_cfa_l2_filter_alloc_input {
 	#define CFA_L2_FILTER_ALLOC_REQ_ENABLES_MIRROR_VNIC_ID      0x10000UL
 	#define CFA_L2_FILTER_ALLOC_REQ_ENABLES_NUM_VLANS           0x20000UL
 	#define CFA_L2_FILTER_ALLOC_REQ_ENABLES_T_NUM_VLANS         0x40000UL
+	#define CFA_L2_FILTER_ALLOC_REQ_ENABLES_RFS_RING_TBL_IDX    0x80000UL
 	u8	l2_addr[6];
 	u8	num_vlans;
 	u8	t_num_vlans;
@@ -8663,7 +8664,8 @@ struct hwrm_cfa_l2_filter_alloc_input {
 	#define CFA_L2_FILTER_ALLOC_REQ_PRI_HINT_MIN          0x4UL
 	#define CFA_L2_FILTER_ALLOC_REQ_PRI_HINT_LAST        CFA_L2_FILTER_ALLOC_REQ_PRI_HINT_MIN
 	u8	unused_5;
-	__le32	unused_6;
+	__le16	rfs_ring_tbl_idx;
+	__le16	unused_6;
 	__le64	l2_filter_id_hint;
 };
 
@@ -8900,6 +8902,95 @@ struct hwrm_cfa_tunnel_filter_free_output {
 	u8	valid;
 };
 
+/* hwrm_cfa_ntuple_filter_alloc_input (size:1024b/128B) */
+struct hwrm_cfa_ntuple_filter_alloc_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le32	flags;
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_LOOPBACK              0x1UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_DROP                  0x2UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_METER                 0x4UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_DEST_FID              0x8UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_ARP_REPLY             0x10UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_DEST_RFS_RING_IDX     0x20UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_FLAGS_NO_L2_CONTEXT         0x40UL
+	__le32	enables;
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_L2_FILTER_ID         0x1UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_ETHERTYPE            0x2UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_TUNNEL_TYPE          0x4UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_MACADDR          0x8UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_IPADDR_TYPE          0x10UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_IPADDR           0x20UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_IPADDR_MASK      0x40UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_IPADDR           0x80UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_IPADDR_MASK      0x100UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_IP_PROTOCOL          0x200UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_PORT             0x400UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_SRC_PORT_MASK        0x800UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_PORT             0x1000UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_PORT_MASK        0x2000UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_PRI_HINT             0x4000UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_NTUPLE_FILTER_ID     0x8000UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_ID               0x10000UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_MIRROR_VNIC_ID       0x20000UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_DST_MACADDR          0x40000UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_ENABLES_RFS_RING_TBL_IDX     0x80000UL
+	__le64	l2_filter_id;
+	u8	src_macaddr[6];
+	__be16	ethertype;
+	u8	ip_addr_type;
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_ADDR_TYPE_UNKNOWN 0x0UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_ADDR_TYPE_IPV4    0x4UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_ADDR_TYPE_IPV6    0x6UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_ADDR_TYPE_LAST   CFA_NTUPLE_FILTER_ALLOC_REQ_IP_ADDR_TYPE_IPV6
+	u8	ip_protocol;
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_UNKNOWN 0x0UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_TCP     0x6UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_UDP     0x11UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_ICMP    0x1UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_ICMPV6  0x3aUL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_RSVD    0xffUL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_LAST   CFA_NTUPLE_FILTER_ALLOC_REQ_IP_PROTOCOL_RSVD
+	__le16	dst_id;
+	__le16	rfs_ring_tbl_idx;
+	u8	tunnel_type;
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_NONTUNNEL    0x0UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_VXLAN        0x1UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_NVGRE        0x2UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_L2GRE        0x3UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_IPIP         0x4UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_GENEVE       0x5UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_MPLS         0x6UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_STT          0x7UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_IPGRE        0x8UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_VXLAN_V4     0x9UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_IPGRE_V1     0xaUL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_L2_ETYPE     0xbUL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_VXLAN_GPE_V6 0xcUL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_VXLAN_GPE    0x10UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_ANYTUNNEL    0xffUL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_LAST        CFA_NTUPLE_FILTER_ALLOC_REQ_TUNNEL_TYPE_ANYTUNNEL
+	u8	pri_hint;
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_PRI_HINT_NO_PREFER 0x0UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_PRI_HINT_ABOVE     0x1UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_PRI_HINT_BELOW     0x2UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_PRI_HINT_HIGHEST   0x3UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_PRI_HINT_LOWEST    0x4UL
+	#define CFA_NTUPLE_FILTER_ALLOC_REQ_PRI_HINT_LAST     CFA_NTUPLE_FILTER_ALLOC_REQ_PRI_HINT_LOWEST
+	__be32	src_ipaddr[4];
+	__be32	src_ipaddr_mask[4];
+	__be32	dst_ipaddr[4];
+	__be32	dst_ipaddr_mask[4];
+	__be16	src_port;
+	__be16	src_port_mask;
+	__be16	dst_port;
+	__be16	dst_port_mask;
+	__le64	ntuple_filter_id_hint;
+};
+
 /* hwrm_cfa_ntuple_filter_alloc_output (size:192b/24B) */
 struct hwrm_cfa_ntuple_filter_alloc_output {
 	__le16	error_code;
@@ -9014,6 +9105,49 @@ struct hwrm_cfa_ntuple_filter_cfg_output {
 	u8	valid;
 };
 
+/* hwrm_cfa_adv_flow_mgnt_qcaps_input (size:256b/32B) */
+struct hwrm_cfa_adv_flow_mgnt_qcaps_input {
+	__le16	req_type;
+	__le16	cmpl_ring;
+	__le16	seq_id;
+	__le16	target_id;
+	__le64	resp_addr;
+	__le32	unused_0[4];
+};
+
+/* hwrm_cfa_adv_flow_mgnt_qcaps_output (size:128b/16B) */
+struct hwrm_cfa_adv_flow_mgnt_qcaps_output {
+	__le16	error_code;
+	__le16	req_type;
+	__le16	seq_id;
+	__le16	resp_len;
+	__le32	flags;
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_FLOW_HND_16BIT_SUPPORTED                     0x1UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_FLOW_HND_64BIT_SUPPORTED                     0x2UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_FLOW_BATCH_DELETE_SUPPORTED                  0x4UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_FLOW_RESET_ALL_SUPPORTED                     0x8UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_NTUPLE_FLOW_DEST_FUNC_SUPPORTED              0x10UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_TX_EEM_FLOW_SUPPORTED                        0x20UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_RX_EEM_FLOW_SUPPORTED                        0x40UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_FLOW_COUNTER_ALLOC_SUPPORTED                 0x80UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_RFS_RING_TBL_IDX_SUPPORTED                   0x100UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_UNTAGGED_VLAN_SUPPORTED                      0x200UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_XDP_SUPPORTED                                0x400UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_L2_HEADER_SOURCE_FIELDS_SUPPORTED            0x800UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_NTUPLE_FLOW_RX_ARP_SUPPORTED                 0x1000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_RFS_RING_TBL_IDX_V2_SUPPORTED                0x2000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_NTUPLE_FLOW_RX_ETHERTYPE_IP_SUPPORTED        0x4000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_TRUFLOW_CAPABLE                              0x8000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_L2_FILTER_TRAFFIC_TYPE_L2_ROCE_SUPPORTED     0x10000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_LAG_SUPPORTED                                0x20000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_NTUPLE_FLOW_NO_L2CTX_SUPPORTED               0x40000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_NIC_FLOW_STATS_SUPPORTED                     0x80000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_NTUPLE_FLOW_RX_EXT_IP_PROTO_SUPPORTED        0x100000UL
+	#define CFA_ADV_FLOW_MGNT_QCAPS_RESP_FLAGS_RFS_RING_TBL_IDX_V3_SUPPORTED                0x200000UL
+	u8	unused_0[3];
+	u8	valid;
+};
+
 /* hwrm_tunnel_dst_port_alloc_input (size:192b/24B) */
 struct hwrm_tunnel_dst_port_alloc_input {
 	__le16	req_type;
-- 
2.52.0

