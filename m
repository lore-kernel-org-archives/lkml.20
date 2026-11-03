Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750318;
	b=fndKb2jMcxbstHdHMI1a+kcdz8U24Hf+frP+NNAm8fiSYKlJkLK3uWWxLszS3z9dMb/M
	 0eEU4ysChZCAtMqaQGyuhyJJLdQ5N6je31PCmWHJeNTHlRR1L/q111i/u/7dS69XoRILB
	 SFlBh1VSRLFhAXibndO8aeyqqxH0oCbhoItTsu+kMb1CpLvkYkpIhucJxepfrzhD9gKZ2
	 7fsKJiGHasurNZ/D9FA2ehu5jiG+lBim7V25g2Zd0IsV5E1cXN7331D2mMOdnMhmNoCO7
	 DKzFIqGmPuCpkw4pMvgvzyyVkFymuBHIi01/qBZvHn9lE/YKKEF7cVpLxbLfWueZSxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PX/xDrM0QsmqxurY9bnXyVhX0Z4Wa38RkkCfEUjRRBg=;
	b=HMQ5N0UYwvy6fe2MC0Sjm6mdGIi745bnIqWf4NbtRbvXMeV/PrwLbFZ5JPtkf3AaaiCt
	 Y3M43xU7KZmn7OKjKogr78BdV51aWxTvWGgCN5G/JZstXnoZ/5Pq8p4syPQx8nzy8bfy6
	 5zGJML31WV4k2NketVLcbCIi7doFmulhM+6dzouCUdG/NNPHdpaGyF3zDXhYR4cYEcpPU
	 VTJLOfLgq86tCpPFVN6ixVGTOSA3E3rTpY4C1sAQL1tRVU3Zulp0fsWuK7QlLVLmdudip
	 mhLl48Q+noE8csUGe0zl+9AuXOTjt40V4XqYPIenk+9wayxQQjGF9FyNmsYn6N5PUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=WXZgEgHQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD43606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD43606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=WXZgEgHQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so476365e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1793750315; x=1794355115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PX/xDrM0QsmqxurY9bnXyVhX0Z4Wa38RkkCfEUjRRBg=;
        b=WXZgEgHQe5iPhuKqbRtB+gZGMJXvj7i8GJKAA/5bKpTZolV3btL2h1QNfbyr6McuUv
         fuO2gk6Y+ABg+HSWI2vbB3PCR+UdtDgbB7vTdMzvvZvy2qw11JzZhudBDC8dLOQwpXGo
         cWblrmBlRl4l+3rfa7b1ZDKk3mTwK41MoKskTib9QHid1PMa1kPlh8ZQQRWgwV7w29PF
         evoG4rmLsDp7ZXyebDAySdxHObU8rN65OD4Jwo/Cwc/Qn/2EuiRxMSLRw6Epl8DyRwxP
         iaA9PH38UoDpS6LW0emILYizATtHP7A3rtzcBEREWW52EjIaYFVlCxJ+9GDPRLnGERCn
         813A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750315; x=1794355115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PX/xDrM0QsmqxurY9bnXyVhX0Z4Wa38RkkCfEUjRRBg=;
        b=uTVCNpMzyNwr2XRXSRcJ0ltxErDYLuTENt7FIIuAYLDr/f8Q5wYzkCBstRVRRsuH8f
         sO96aopFm5d8UlGp77sPBf7OK/3sTIrJdVmKe6TMUasu6lpyRCAWQB+iZi5I/aXssy27
         DkME9wKYFhBkxuKamVi2MUeR1p5pHcSWAA2rW1am7BvXPlLOjF3jtfpQq5w93IPqHzjh
         KtrEOynBhDVk7YY9dyGTDFLynSCmAnTWGsK1gkfDeZIwWVcW4fKrpB0/7gL64SqD/uA1
         Ianf06Luwu5Fy1iYp1xMkpn0WoWNAmK/L94zjKGv02wdqSaJpkykD1XOcmoAO4xvWmQP
         X+tQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhnsQPwGL9hyl2drTllYWSI4QIAB9w1xVk8QAdSiK6BwrpCYf+zccNVc/fkQwiZRB6Qt0I601tfHz8F0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XMaDNo7mfXTZ+tW1eSQfaK1f0jYGqXknwgo86R2/n+z/KmIIP
	/E1z+YLpoIjLPMcjXTyXsjy4+PAM89muA3UTFew9ji76CBiGquCZ+MYytTJuzM74Lb7oOegE2LE
	FcjihNozHTBE4zSvcwgK5amSa7ypx93bZ51aqON/Tsmz+Rv4G6CtP9zt/ePM=
X-Gm-Gg: AYBFou2dPjl/TLzO6ZFHTCVHY9lx9MuFYulKZBjiEWf3vNF3fRmq9p3aN1DAR4DLhC6
	vcGF2ZVDtku67mVFux07RERxiiBC7M8CjPv0iBWjL5F3tTKsYc2D/EXORXI28da4pzT2iq2IRZ0
	4O9zwz5o2bW1mVFjZPcLHMkhDA1/wcJ2kUNC5W6rf2B9SQrqnRMth3JV4SaQ8ThwK9MjagA5Mdx
	usjweLZTNA6fSszqM63/qcl405QPxap952IPJDLHopxKmR+vwgWpQdw20ttfT/CnyRrdXeVIir/
	dmhacNpqmvP/ru53oyC9iH1NB6w7iDwNEpUp2Lqi99cjnghH2G5U5I5ZXZrUJNleGI444P49J9h
	cDIMEeeaByBb3Juaul4eb6tf5bgvImBrGf+u2xL3YV9l5Z/HgitAcuk+TyocjCyYKASmiJJFOWb
	LMiey/PSTmtQDwuv9OULHEZZZ9VS/xu19g3dMrf77A6Do+z61vHRoGllTQINP52VwZSyuelN8sv
	+XV2WfueyAgrQ1Twz/tKhD6M/4X8tbyTcEtIs3PmkRWhMqB7kd2PazaCHPRxqO/ZMxXtptiRl4u
	DlpJIMH4iQ3Dnl9pDwoswenvpqSngAb67MAoqECxR60l9e4bDAk=
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr352800595e9.2.1793750315231;
        Tue, 03 Nov 2026 15:58:35 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5298:4b33:93cf:63b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm16341815e9.0.2026.11.03.15.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:58:34 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	dtatulea@nvidia.com,
	cratiu@nvidia.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH net-next] net/mlx5e: Prefetch packets of upcoming CQEs in the linear MPWQE path
Date: Wed,  4 Nov 2026 00:58:23 +0100
Message-ID: <20261103235823.536706-1-antonio@openvpn.net>
X-Mailer: git-send-email 2.56.0
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

From: Antonio Quartulli <antonio@mandelbit.com>

Without cache injection (DDIO/SDCI), the first access to a received
packet's headers and skb_shared_info is a DRAM miss, and the net_prefetch()
in mlx5e_skb_from_cqe_mpwrq_linear() is too late to hide it. This caps the
packet rate of a queue.

While processing a CQE, look at the CQE MLX5E_RX_PREFETCH_DIST (4) entries
ahead and, if it is completed, prefetch its packet headers, skb_shared_info
and page. Also prefetch the CQE twice as far ahead.

Looking ahead requires uncompressed CQEs, so this is enabled only for
linear striding RQs without CQE compression.

AMD Ryzen 9 9950X, ConnectX-5 Ex, one RX queue on a dedicated CPU,
MTU 1500:

                       before       after
  UDP 64B, pktgen    2.77 Mpps    3.60 Mpps   +30%
  UDP 512B, pktgen   2.68 Mpps    3.57 Mpps   +33%
  TCP, 1 stream      45.8 Gb/s    48.1 Gb/s    +5%
  TCP, 4 streams     49.4 Gb/s    67.5 Gb/s   +37%

The NAPI CPU cycles per packet drop by 23-47%.

Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
measured on one system only (Zen 5 desktop, no cache injection,
CX-5 Ex). Numbers from DDIO/SDCI systems and CX-6/CX-7 would be welcome,
to check that the extra CQE read and prefetches cost nothing there.

Notes:
- With CQE compression (default on slow PCIe links) nothing changes.
- With XDP, skb_shared_info is not prefetched. XDP_DROP rate, low-rate
  traffic and multiple queues were not measured.
- The prefetches are issued before the DMA sync; the packet is only read
  after it.
- Distance: 4, 6 and 8 were within 3% of each other; gains flatten above 2.
- Measured with an equivalent build (CQE peek as a local helper, no XDP
  gate); NAPI CPU DRAM demand fills went from ~0.8 to ~0.15 per packet.
- pktgen floods a port without a listener, saturating the queue. Interleaved
  off/on runs (UDP 3, TCP 2; TCP 4 streams "after" is 1 run, the other was
  disturbed). With MTU 9000 (non-linear path, unaffected) runs differ by
  up to 3%.

 drivers/net/ethernet/mellanox/mlx5/core/en.h  |  1 +
 .../mellanox/mlx5/core/en/reporter_rx.c       |  1 +
 .../net/ethernet/mellanox/mlx5/core/en_rx.c   | 58 ++++++++++++++++++-
 drivers/net/ethernet/mellanox/mlx5/core/wq.h  | 16 +++--
 4 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en.h b/drivers/net/ethernet/mellanox/mlx5/core/en.h
index a3945195f454..4ba61150ea1c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en.h
@@ -341,6 +341,7 @@ enum {
 	MLX5E_RQ_STATE_SHAMPO, /* set when SHAMPO cap is used */
 	MLX5E_RQ_STATE_MINI_CQE_ENHANCED,  /* set when enhanced mini_cqe_cap is used */
 	MLX5E_RQ_STATE_XSK, /* set to indicate an xsk rq */
+	MLX5E_RQ_STATE_PREFETCH_NEXT, /* prefetch the packets of next CQEs */
 	MLX5E_NUM_RQ_STATES, /* Must be kept last */
 };
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c
index 6efb626b5506..137db88da42f 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c
@@ -21,6 +21,7 @@ static const char * const rq_sw_state_type_name[] = {
 	[MLX5E_RQ_STATE_SHAMPO] = "shampo",
 	[MLX5E_RQ_STATE_MINI_CQE_ENHANCED] = "mini_cqe_enhanced",
 	[MLX5E_RQ_STATE_XSK] = "xsk",
+	[MLX5E_RQ_STATE_PREFETCH_NEXT] = "prefetch_next",
 };
 
 static int mlx5e_query_rq_state(struct mlx5_core_dev *dev, u32 rqn, u8 *state)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index 22fea4739a2c..b9eacd6bb5be 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -2457,10 +2457,55 @@ static int mlx5e_rx_cq_process_enhanced_cqe_comp(struct mlx5e_rq *rq,
 	return work_done;
 }
 
+/* Prefetch the headers, skb_shared_info and page of the packet
+ * MLX5E_RX_PREFETCH_DIST CQEs ahead, and the CQE twice as far ahead.
+ * Requires uncompressed CQEs.
+ */
+#define MLX5E_RX_PREFETCH_DIST	4
+
+/* called after popping the current CQE */
+static void mlx5e_mpwrq_linear_prefetch(struct mlx5e_rq *rq,
+					struct mlx5_cqwq *cqwq)
+{
+	u32 wqe_offset, head_offset, page_idx;
+	struct mlx5e_frag_page *frag_page;
+	struct mlx5e_mpw_info *wi;
+	struct mlx5_cqe64 *cqe;
+	u16 cqe_bcnt;
+	void *va;
+
+	prefetch(mlx5_cqwq_get_wqe(cqwq,
+				   mlx5_cqwq_ctr2ix(cqwq, cqwq->cc +
+						    2 * MLX5E_RX_PREFETCH_DIST - 1)));
+
+	cqe = mlx5_cqwq_get_cqe_ctr(cqwq, cqwq->cc + MLX5E_RX_PREFETCH_DIST - 1);
+	if (!cqe || MLX5E_RX_ERR_CQE(cqe) || mpwrq_is_filler_cqe(cqe))
+		return;
+
+	/* oversized packets are dropped by the linear path */
+	cqe_bcnt = mpwrq_get_cqe_byte_cnt(cqe);
+	if (unlikely(cqe_bcnt > rq->hw_mtu))
+		return;
+
+	wi = mlx5e_get_mpw_info(rq, be16_to_cpu(cqe->wqe_id));
+	wqe_offset = mpwrq_get_cqe_stride_index(cqe) << rq->mpwqe.log_stride_sz;
+	head_offset = wqe_offset & ((1 << rq->mpwqe.page_shift) - 1);
+	page_idx = wqe_offset >> rq->mpwqe.page_shift;
+	frag_page = &wi->alloc_units.frag_pages[page_idx];
+	va = netmem_address(frag_page->netmem) + head_offset;
+
+	net_prefetch(va + rq->buff.headroom);
+	/* with XDP the packet may not become an skb */
+	if (!rcu_access_pointer(rq->xdp_prog))
+		prefetchw(va + SKB_DATA_ALIGN(rq->buff.headroom + cqe_bcnt));
+	prefetch(netmem_to_page(frag_page->netmem));
+}
+
 static int mlx5e_rx_cq_process_basic_cqe_comp(struct mlx5e_rq *rq,
 					      struct mlx5_cqwq *cqwq,
 					      int budget_rem)
 {
+	bool prefetch_next = test_bit(MLX5E_RQ_STATE_PREFETCH_NEXT, &rq->state);
 	struct mlx5_cqe64 *cqe;
 	int work_done = 0;
 
@@ -2476,6 +2521,8 @@ static int mlx5e_rx_cq_process_basic_cqe_comp(struct mlx5e_rq *rq,
 		}
 
 		mlx5_cqwq_pop(cqwq);
+		if (prefetch_next)
+			mlx5e_mpwrq_linear_prefetch(rq, cqwq);
 		INDIRECT_CALL_3(rq->handle_rx_cqe, mlx5e_handle_rx_cqe_mpwrq,
 				mlx5e_handle_rx_cqe, mlx5e_handle_rx_cqe_mpwrq_shampo,
 				rq, cqe);
@@ -2653,17 +2700,22 @@ int mlx5e_rq_set_handlers(struct mlx5e_rq *rq, struct mlx5e_params *params, bool
 	struct net_device *netdev = rq->netdev;
 	struct mlx5_core_dev *mdev = rq->mdev;
 	struct mlx5e_priv *priv = rq->priv;
+	bool linear;
 
 	switch (rq->wq_type) {
 	case MLX5_WQ_TYPE_LINKED_LIST_STRIDING_RQ:
+		linear = !xsk && mlx5e_rx_mpwqe_is_linear_skb(mdev, params, NULL);
 		rq->mpwqe.skb_from_cqe_mpwrq = xsk ?
 			mlx5e_xsk_skb_from_cqe_mpwrq_linear :
-			mlx5e_rx_mpwqe_is_linear_skb(mdev, params, NULL) ?
-				mlx5e_skb_from_cqe_mpwrq_linear :
-				mlx5e_skb_from_cqe_mpwrq_nonlinear;
+			linear ? mlx5e_skb_from_cqe_mpwrq_linear :
+				 mlx5e_skb_from_cqe_mpwrq_nonlinear;
 		rq->post_wqes = mlx5e_post_rx_mpwqes;
 		rq->dealloc_wqe = mlx5e_dealloc_rx_mpwqe;
 
+		/* looking at the CQEs ahead requires plain CQEs */
+		if (linear && !MLX5E_GET_PFLAG(params, MLX5E_PFLAG_RX_CQE_COMPRESS))
+			__set_bit(MLX5E_RQ_STATE_PREFETCH_NEXT, &rq->state);
+
 		if (params->packet_merge.type == MLX5E_PACKET_MERGE_SHAMPO) {
 			rq->handle_rx_cqe = priv->profile->rx_handlers->handle_rx_cqe_mpwqe_shampo;
 			if (!rq->handle_rx_cqe) {
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/wq.h b/drivers/net/ethernet/mellanox/mlx5/core/wq.h
index 6debb8fd33ff..5e3d4a85c343 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/wq.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/wq.h
@@ -227,12 +227,15 @@ static inline void mlx5_cqwq_update_db_record(struct mlx5_cqwq *wq)
 	*wq->db = cpu_to_be32(wq->cc & 0xffffff);
 }
 
-static inline struct mlx5_cqe64 *mlx5_cqwq_get_cqe(struct mlx5_cqwq *wq)
+/* CQE at @ctr, if owned by SW. @ctr may be ahead of the consumer counter
+ * only without CQE compression.
+ */
+static inline struct mlx5_cqe64 *
+mlx5_cqwq_get_cqe_ctr(struct mlx5_cqwq *wq, u32 ctr)
 {
-	u32 ci = mlx5_cqwq_get_ci(wq);
-	struct mlx5_cqe64 *cqe = mlx5_cqwq_get_wqe(wq, ci);
+	struct mlx5_cqe64 *cqe = mlx5_cqwq_get_wqe(wq, mlx5_cqwq_ctr2ix(wq, ctr));
 	u8 cqe_ownership_bit = cqe->op_own & MLX5_CQE_OWNER_MASK;
-	u8 sw_ownership_val = mlx5_cqwq_get_wrap_cnt(wq) & 1;
+	u8 sw_ownership_val = mlx5_cqwq_get_ctr_wrap_cnt(wq, ctr) & 1;
 
 	if (cqe_ownership_bit != sw_ownership_val)
 		return NULL;
@@ -243,6 +246,11 @@ static inline struct mlx5_cqe64 *mlx5_cqwq_get_cqe(struct mlx5_cqwq *wq)
 	return cqe;
 }
 
+static inline struct mlx5_cqe64 *mlx5_cqwq_get_cqe(struct mlx5_cqwq *wq)
+{
+	return mlx5_cqwq_get_cqe_ctr(wq, wq->cc);
+}
+
 static inline
 struct mlx5_cqe64 *mlx5_cqwq_get_cqe_enhanced_comp(struct mlx5_cqwq *wq)
 {
-- 
2.56.0

