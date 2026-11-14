Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648177;
	b=bgXdqBmHV3QmK48dmKCgR1rE4bQ7HaARHKWm5VI8Zc8ZdND7VIip2TlxMw9/QVEKzRaM
	 4+15WppDQFxySHqRBr0kXKReErU8nWOXQNUgXVhaLCIscgxQJ2wmTna8AEnGWkJaac+dZ
	 IP4+fVwnEdH5j31H6bX0T2s8nyxJzaPAewIDfHWF4IKOzATtf0Eo6t9qsbVOYYSw4pq+k
	 bKdCVPAaXg2bY+/SIQb5clGbNL1G3v1XBK9J4im0wcXENRMqHQTNoCjLT1Ejjo6jMSlo6
	 tuGAJXWKDVX691nJDp0CLpJCFDve397F5ENGEzKwohmsAWSTPJEhvtk/FyBma6cE4GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648177;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=P7RJ4ENzyw4AZHEmireO1YPhwe902JN+gKFUcZ8nVo4=;
	b=J7abWnObCjhkmZaZyKNGGiIWyjy891lLoTccqo57jyNSsKDUKTnnVF+BEZahp49s0E0V
	 QbFcYkRB6197kkdXvc/Cx57sgiTFql0FCGzRyrln9YhD8rRvcqTScHFLxbyNE0vsM2VG0
	 klMSBfthsf5B9SHDATP224aAzTkifdztaaG/tbObqkVfK7BX5DkxfdV177O+YiTTTClf6
	 8Fbs+1R4xGejvJRas9aPrtOMvvhnRRnZeAvnhvJt0nyGn4a2wwCTb8CEtA0lcsFGaYOG8
	 Z+3f9qtcfUwbe5vgNeZY7NlMTLGI4Nlvx4Svcki7DRFx1p4QUpF7xZnq8qdPgrTS8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KkaYtidi;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC42606A32E;
	Sat, 14 Nov 2026 09:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC42606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KkaYtidi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=P7
	RJ4ENzyw4AZHEmireO1YPhwe902JN+gKFUcZ8nVo4=; b=KkaYtidiEykt86e4Bg
	R2nxjk9Pf1DvbjjwhQQCGZm+uOfQC7Sk/1DbGzlqP52cmK32rmRCbykEUM+PdW+x
	xPAeQFY7NRGgI40MYQiiegl3DFmwNgekracLYx0D0CEZfX9Q5aqucltrvpM8FnoQ
	2rrBXMExwPMQ7ookKcCuB/ayE=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3r6IRKPhqiIvzHA--.51340S4;
	Sat, 14 Nov 2026 17:21:35 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: tommaso.merciai.xr@bp.renesas.com,
	dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH net v7 2/4] net: stmmac: track unfilled XSK RX descriptors explicitly
Date: Sat, 14 Nov 2026 17:21:14 +0800
Message-Id: <92136a2c509f26f7a02053380a0b3c0fa426df48.1794646293.git.dinghui@lixiang.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794646293.git.dinghui@lixiang.com>
References: <cover.1794646293.git.dinghui@lixiang.com>
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
X-CM-TRANSID:_____wA3r6IRKPhqiIvzHA--.51340S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3Kr1DGryrKryfXrW5Cr4kZwb_yoW8Jw4DCo
	Z7AFn8ta13Kr18Ar1kXr48Gry3Xanxuw1fJrZ8CrZ5uayI9a1aq343u3y5Jr13Ar15Kay7
	Z3W8JFsFvFW7try5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaJKsUUUUU
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8x-pFmr4KB+i9gAA3i

From: Ding Hui <dinghui@lixiang.com>

An XSK fill ring may supply fewer buffers than the RX ring needs. Those
unfilled descriptors must remain CPU-owned, including on legacy cores
whose clear callback only clears the buffer address. Add an ownership
operation that preserves descriptor size and ring/chain control fields.

Track the number of descriptors awaiting refill independently of the
ring indices, so an entirely empty ring can be distinguished from one
with no pending refills. Initialize the pending region after the allocated
prefix and stop consumption before entering it. Retry pending refills
on each poll, including userspace wakeups with fewer than a batch of
buffers, and retain batching during packet processing.

Update the tail after successful refills and kick legacy RX DMA. Use the
end-of-ring tail address for a refill ending at index zero, including a
completely empty ring populated before DMA has advanced from the base.
Select the receive buffer size from the XSK pool even if no buffers were
available at initialization.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  6 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |  6 +++
 .../net/ethernet/stmicro/stmmac/enh_desc.c    |  6 +++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |  6 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 49 +++++++++++++------
 7 files changed, 63 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index c6a8f8d73501..307bbd63dbcb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -176,6 +176,11 @@ static void dwmac4_set_tx_owner(struct dma_desc *p)
 	p->des3 |= cpu_to_le32(TDES3_OWN);
 }
 
+static void dwmac4_clear_rx_owner(struct dma_desc *p)
+{
+	p->des3 &= cpu_to_le32(~RDES3_OWN);
+}
+
 static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
 	u32 flags = (RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
@@ -539,6 +544,7 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.rx_status = dwmac4_wrback_get_rx_status,
 	.set_tx_owner = dwmac4_set_tx_owner,
 	.set_rx_owner = dwmac4_set_rx_owner,
+	.clear_rx_owner = dwmac4_clear_rx_owner,
 	.get_rx_vlan_tci = dwmac4_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwmac4_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwmac4_wrback_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..ad377c76ed4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -51,6 +51,11 @@ static void dwxgmac2_set_tx_owner(struct dma_desc *p)
 	p->des3 |= cpu_to_le32(XGMAC_TDES3_OWN);
 }
 
+static void dwxgmac2_clear_rx_owner(struct dma_desc *p)
+{
+	p->des3 &= cpu_to_le32(~XGMAC_RDES3_OWN);
+}
+
 static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
 	u32 flags = XGMAC_RDES3_OWN;
@@ -350,6 +355,7 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.rx_status = dwxgmac2_get_rx_status,
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
+	.clear_rx_owner = dwxgmac2_clear_rx_owner,
 	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwxgmac2_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwxgmac2_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 7ece8d4157a8..57909a9ba70d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -299,6 +299,11 @@ static void enh_desc_set_tx_owner(struct dma_desc *p)
 	p->des0 |= cpu_to_le32(ETDES0_OWN);
 }
 
+static void enh_desc_clear_rx_owner(struct dma_desc *p)
+{
+	p->des0 &= cpu_to_le32(~RDES0_OWN);
+}
+
 static void enh_desc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
 	p->des0 |= cpu_to_le32(RDES0_OWN);
@@ -460,6 +465,7 @@ const struct stmmac_desc_ops enh_desc_ops = {
 	.set_tx_ic = enh_desc_set_tx_ic,
 	.set_tx_owner = enh_desc_set_tx_owner,
 	.set_rx_owner = enh_desc_set_rx_owner,
+	.clear_rx_owner = enh_desc_clear_rx_owner,
 	.get_rx_frame_len = enh_desc_get_rx_frame_len,
 	.rx_extended_status = enh_desc_get_ext_status,
 	.enable_tx_timestamp = enh_desc_enable_tx_timestamp,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..05edec258a8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -65,6 +65,7 @@ struct stmmac_desc_ops {
 			 struct dma_desc *p, void __iomem *ioaddr);
 	/* Handle extra events on specific interrupts hw dependent */
 	void (*set_rx_owner)(struct dma_desc *p, int disable_rx_ic);
+	void (*clear_rx_owner)(struct dma_desc *p);
 	/* Get the receive frame size */
 	int (*get_rx_frame_len)(struct dma_desc *p, int rx_coe_type);
 	/* Return the reception status looking at the RDES1 */
@@ -121,6 +122,8 @@ struct stmmac_desc_ops {
 	stmmac_do_callback(__priv, desc, get_rx_vlan_valid, __args)
 #define stmmac_tx_status(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, tx_status, __args)
+#define stmmac_clear_rx_owner(__priv, __args...) \
+	stmmac_do_void_callback(__priv, desc, clear_rx_owner, __args)
 #define stmmac_set_rx_owner(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
 #define stmmac_get_rx_frame_len(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index d19bf7ca4db3..473d53c31072 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -141,6 +141,11 @@ static void ndesc_set_tx_owner(struct dma_desc *p)
 	p->des0 |= cpu_to_le32(TDES0_OWN);
 }
 
+static void ndesc_clear_rx_owner(struct dma_desc *p)
+{
+	p->des0 &= cpu_to_le32(~RDES0_OWN);
+}
+
 static void ndesc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 {
 	p->des0 |= cpu_to_le32(RDES0_OWN);
@@ -284,6 +289,7 @@ const struct stmmac_desc_ops ndesc_ops = {
 	.set_tx_ic = ndesc_set_tx_ic,
 	.set_tx_owner = ndesc_set_tx_owner,
 	.set_rx_owner = ndesc_set_rx_owner,
+	.clear_rx_owner = ndesc_clear_rx_owner,
 	.get_rx_frame_len = ndesc_get_rx_frame_len,
 	.enable_tx_timestamp = ndesc_enable_tx_timestamp,
 	.get_tx_timestamp_status = ndesc_get_tx_timestamp_status,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b76acfe0d958..b81695453cc6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -128,6 +128,8 @@ struct stmmac_rx_queue {
 	unsigned int cur_rx;
 	unsigned int dirty_rx;
 	unsigned int buf_alloc_num;
+	/* XSK descriptors waiting for refill, including a completely empty ring. */
+	unsigned int xsk_rx_pending;
 	unsigned int napi_skb_frag_size;
 	dma_addr_t dma_rx_phy;
 	unsigned int state_saved;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8bd244046195..f9ac82d2e726 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -436,7 +436,7 @@ static void stmmac_set_queue_rx_buf_size(struct stmmac_priv *priv,
 {
 	u32 buf_size;
 
-	if (rx_q->xsk_pool && rx_q->buf_alloc_num)
+	if (rx_q->xsk_pool)
 		buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
 	else
 		buf_size = priv->dma_conf.dma_buf_sz;
@@ -453,6 +453,9 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 
+	if (rx_q->xsk_pool)
+		return rx_q->xsk_rx_pending;
+
 	return CIRC_CNT(rx_q->cur_rx, rx_q->dirty_rx,
 			priv->dma_conf.dma_rx_size);
 }
@@ -1610,6 +1613,9 @@ static void stmmac_clear_rx_descriptors(struct stmmac_priv *priv,
 				    priv->descriptor_mode,
 				    (i == dma_conf->dma_rx_size - 1),
 				    dma_conf->dma_buf_sz);
+		/* Only the allocated prefix may be handed to RX DMA. */
+		if (rx_q->xsk_pool && i >= rx_q->buf_alloc_num)
+			stmmac_clear_rx_owner(priv, desc);
 	}
 }
 
@@ -5601,7 +5607,7 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 	budget = min(budget, stmmac_rx_dirty(priv, queue));
 
-	while (budget-- > 0 && entry != rx_q->cur_rx) {
+	while (budget-- > 0) {
 		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[entry];
 		dma_addr_t dma_addr;
 		bool use_rx_wd;
@@ -5626,12 +5632,18 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		dma_wmb();
 		stmmac_set_rx_owner(priv, rx_desc, use_rx_wd);
 
+		rx_q->xsk_rx_pending--;
 		entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_rx_size);
 	}
 
 	if (rx_desc) {
 		rx_q->dirty_rx = entry;
-		stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->dirty_rx);
+		/* Use the end-of-ring address when filling an initially empty
+		 * ring completely, so the tail differs from its initial base.
+		 */
+		stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue,
+					     entry ?: priv->dma_conf.dma_rx_size);
+		stmmac_enable_dma_reception(priv, priv->ioaddr, queue);
 	}
 
 	return ret;
@@ -5652,7 +5664,6 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 	unsigned int count = 0, error = 0, len = 0;
-	int dirty = stmmac_rx_dirty(priv, queue);
 	unsigned int next_entry = rx_q->cur_rx;
 	bool in_progress = rx_q->state_saved;
 	u32 rx_errors = 0, rx_dropped = 0;
@@ -5661,6 +5672,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	bool failure = false;
 	int xdp_status = 0;
 
+	if (rx_q->xsk_rx_pending)
+		failure = !stmmac_rx_refill_zc(priv, queue, rx_q->xsk_rx_pending);
+
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
 
@@ -5697,11 +5711,13 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
 
-		if (dirty >= STMMAC_RX_FILL_BATCH) {
-			failure = failure ||
-				  !stmmac_rx_refill_zc(priv, queue, dirty);
-			dirty = 0;
-		}
+		if (!failure && rx_q->xsk_rx_pending >= STMMAC_RX_FILL_BATCH)
+			failure = !stmmac_rx_refill_zc(priv, queue,
+						     rx_q->xsk_rx_pending);
+
+		/* A CPU-owned slot in the refill region is not a packet. */
+		if (rx_q->xsk_rx_pending == priv->dma_conf.dma_rx_size)
+			break;
 
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
@@ -5714,10 +5730,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		/* Prefetch the next RX descriptor */
 		next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
 					       priv->dma_conf.dma_rx_size);
-		if (unlikely(next_entry == rx_q->dirty_rx))
-			break;
-
 		rx_q->cur_rx = next_entry;
+		rx_q->xsk_rx_pending++;
 
 		np = stmmac_get_rx_desc(priv, rx_q, next_entry);
 
@@ -5746,7 +5760,6 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (unlikely(error)) {
 			xsk_buff_free(buf->xdp);
 			buf->xdp = NULL;
-			dirty++;
 
 			if (status & rx_not_ls)
 				goto read_again;
@@ -5761,7 +5774,6 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			buf->xdp = NULL;
 			rx_dropped++;
 			error = 1;
-			dirty++;
 			goto read_again;
 		}
 
@@ -5805,7 +5817,6 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		}
 
 		buf->xdp = NULL;
-		dirty++;
 		count++;
 	}
 
@@ -5817,6 +5828,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 	stmmac_finalize_xdp_rx(priv, xdp_status);
 
+	if (!failure && rx_q->xsk_rx_pending)
+		failure = !stmmac_rx_refill_zc(priv, queue, rx_q->xsk_rx_pending);
+
 	u64_stats_update_begin(&rxq_stats->napi_syncp);
 	u64_stats_add(&rxq_stats->napi.rx_pkt_n, count);
 	u64_stats_update_end(&rxq_stats->napi_syncp);
@@ -8460,6 +8474,11 @@ static void stmmac_reset_rx_queue(struct stmmac_priv *priv, u32 queue)
 	rx_q->state_saved = false;
 	rx_q->cur_rx = 0;
 	rx_q->dirty_rx = 0;
+	if (rx_q->xsk_pool) {
+		rx_q->dirty_rx = rx_q->buf_alloc_num % priv->dma_conf.dma_rx_size;
+		rx_q->xsk_rx_pending = priv->dma_conf.dma_rx_size -
+				       rx_q->buf_alloc_num;
+	}
 }
 
 static void stmmac_reset_tx_queue(struct stmmac_priv *priv, u32 queue)
-- 
2.34.1

