Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12185312815
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163921; cv=none; b=bC6KlpELivg1Og8mma+WeTE2hXQMkc97+tU3qgYYQMTmBjws3o8hgTHTEHjlo/f0hKD70uamdFKZtQCzFXeIy2Ql5ji8mCq+vl0xRgvqnWwX2qDZu7KZmjWkdmJ4fWaNDzDN4rui5HRvbgDTew+Kn0NlUpW86Vcff657MqUNgkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163921; c=relaxed/simple;
	bh=RyJ5HXL3mAHT1xRWj6+mLJelygFuE8PFN4h6GZEP+2E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NC33PTnCdtx+ZOuJ6dipMTCdnZ+ACzh4VtgM1H0Qc/j26IZ7hX/DcgAy0+qHS35bmruNTPgUPINHsY6FktNCKT2RGb4uWMPRjNt7q5Pj5AuiOTesN+8BiAw5GGhZ3/g8BPY5FCtedQrGC6j9PIQ91cFgIw1oZkYd0VqYNWRy+3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eBTqhP5K; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eBTqhP5K"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c40420222a0so1270766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792163917; x=1792768717; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdrT9/bm6JcU3yKappBYHRJ/j1CG7LkhSy2cx3C2M6k=;
        b=eBTqhP5KPe28/ti2A8FC7xKjGsr3H/ALHumVl/sRKtZtFdvYGMpEuqChsAFqBYSpAh
         SVtCQ15M++DaO6jpVGnnYur6hoEF6R8Te/gZiMQFudN7BqHrFokMhGmC7wN2F+M024GE
         XCc1Y5KyiOb+Hg15cGkyP9RLR4TGQdj2OJxyXrMoAF9ZMT2NrlJtZ/YAldkzuUEamldR
         ef6WKgs8mGGpq8D2kNqJmi0wyRz7QiniXZx+y7zxTI+MqD3u3OMsaXcdCeT7IQP/5RTe
         f9v8pZ2RQUbGGys/CFOZJQ/yZf/24yLQ/JqaRIW0laBdWyI5FsjSzoEqMxPNghytTury
         F0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163917; x=1792768717;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdrT9/bm6JcU3yKappBYHRJ/j1CG7LkhSy2cx3C2M6k=;
        b=tXrxb4SfZErVPLh04dC70FsKPAfKdnsy5c5WLyHKG/uEl5Y4vaQfKPLonUBdrQ3zkQ
         ConvBx8TioCl8T/4vJ8S47ePi/UG9j3h9JAb0980BJmbF+4NoxZRuZ/vRM7kEonNgDt9
         6++XwfC6wp+e1FGxYpIorP1HECzjvcI+CNO4Vs0xqYE3l5vsB3aoRgQ/lLLnYlfn6nED
         5uKlBGMdmG+sAcbU+paqp/mQwtit7I7kpEsZViw7oajMGCK4oC9RozJOapo6QykJ2BTa
         npOlezUawBcfME8khp0GzblfOC0gkcYoepDJoQggMIJ7ETe923l2q9VFsXkQDopGtuW6
         Q2xA==
X-Forwarded-Encrypted: i=1; AKwUvBzr/16jfJfvpfPTLM2brgMfPDWR5gMPY+V2xLz6wj4+JAHuUp3DPLa4d7LcV8x9jBTDLbBn5ndc4m+lV4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY0qzRghTanreZKhSsttiVasvMz6v9+GHv9FjQOrdvgWX6SGeI
	c5zT1vS0MWw0/iRmP25XNwlJwlwnBEH4HhrDEXqqzt0vm2FWRxok7ca0zPe7vqQiXliUFURPWZR
	nRfcWzQ==
X-Received: from ejcb24.prod.google.com ([2002:a17:906:36d8:b0:c3f:7f5a:30f9])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9713:b0:c2e:856:2a08
 with SMTP id a640c23a62f3a-c419a942d66mr15910266b.1.1792163916834; Fri, 16
 Oct 2026 08:18:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:18:35 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016151835.2500807-1-lrizzo@google.com>
Subject: [PATCH iwl-next] libeth, idpf: use GFP_KERNEL for the initial Rx ring fill
From: Luigi Rizzo <lrizzo@google.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Luigi Rizzo <rizzo.unipi@gmail.com>, Brian Vazquez <brianvv@google.com>, 
	Joshua Hay <joshua.a.hay@intel.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

libeth_rx_alloc() always allocates with GFP_ATOMIC, including when idpf
fills its Rx rings at open or on queue reconfiguration. That fill runs
in process context, right after page_pool_create() and before the
queues' NAPI is enabled, so it may sleep, and GFP_ATOMIC is needlessly
restrictive there: it can neither reclaim nor compact, while the initial
fill can allocate tens of thousands of buffers across all queues.

Add libeth_rx_alloc_gfp(), which takes the allocation flags, and make
libeth_rx_alloc() its GFP_ATOMIC wrapper. Use GFP_KERNEL for the initial
fill in idpf.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 .../ethernet/intel/idpf/idpf_singleq_txrx.c   |  7 +++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   |  9 +++++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.h   |  2 +-
 include/net/libeth/rx.h                       | 23 +++++++++++++++----
 4 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c
index e3ddf18dcbf51..d623e4ab8511f 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c
@@ -885,11 +885,12 @@ static void idpf_rx_buf_hw_update(struct idpf_rx_queue *rxq, u32 val)
  * idpf_rx_singleq_buf_hw_alloc_all - Replace used receive buffers
  * @rx_q: queue for which the hw buffers are allocated
  * @cleaned_count: number of buffers to replace
+ * @gfp: GFP_KERNEL for the initial fill, GFP_ATOMIC from NAPI
  *
  * Returns false if all allocations were successful, true if any fail
  */
 bool idpf_rx_singleq_buf_hw_alloc_all(struct idpf_rx_queue *rx_q,
-				      u16 cleaned_count)
+				      u16 cleaned_count, gfp_t gfp)
 {
 	struct virtchnl2_singleq_rx_buf_desc *desc;
 	const struct libeth_fq_fp fq = {
@@ -908,7 +909,7 @@ bool idpf_rx_singleq_buf_hw_alloc_all(struct idpf_rx_queue *rx_q,
 	do {
 		dma_addr_t addr;
 
-		addr = libeth_rx_alloc(&fq, nta);
+		addr = libeth_rx_alloc_gfp(&fq, nta, gfp);
 		if (addr == DMA_MAPPING_ERROR)
 			break;
 
@@ -1095,7 +1096,7 @@ static int idpf_rx_singleq_clean(struct idpf_rx_queue *rx_q, int budget)
 
 	page_pool_nid_changed(rx_q->pp, numa_mem_id());
 	if (cleaned_count)
-		idpf_rx_singleq_buf_hw_alloc_all(rx_q, cleaned_count);
+		idpf_rx_singleq_buf_hw_alloc_all(rx_q, cleaned_count, GFP_ATOMIC);
 
 	u64_stats_update_begin(&rx_q->stats_sync);
 	u64_stats_add(&rx_q->q_stats.packets, rs.packets);
diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index 4311ffa30bb18..b1127ab48ef3f 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -600,6 +600,9 @@ static void idpf_post_buf_refill(struct idpf_sw_queue *refillq, u16 buf_id)
  * @bufq: buffer queue to post to
  * @buf_id: buffer id to post
  *
+ * Only used for the initial fill, from process context, so it allocates
+ * with GFP_KERNEL.
+ *
  * Return: %false if buffer could not be allocated, %true otherwise.
  */
 static bool idpf_rx_post_buf_desc(struct idpf_buf_queue *bufq, u16 buf_id)
@@ -618,7 +621,7 @@ static bool idpf_rx_post_buf_desc(struct idpf_buf_queue *bufq, u16 buf_id)
 		fq.fqes = bufq->hdr_buf;
 		fq.truesize = bufq->hdr_truesize;
 
-		addr = libeth_rx_alloc(&fq, buf_id);
+		addr = libeth_rx_alloc_gfp(&fq, buf_id, GFP_KERNEL);
 		if (addr == DMA_MAPPING_ERROR)
 			return false;
 
@@ -629,7 +632,7 @@ static bool idpf_rx_post_buf_desc(struct idpf_buf_queue *bufq, u16 buf_id)
 	fq.fqes = bufq->buf;
 	fq.truesize = bufq->truesize;
 
-	addr = libeth_rx_alloc(&fq, buf_id);
+	addr = libeth_rx_alloc_gfp(&fq, buf_id, GFP_KERNEL);
 	if (addr == DMA_MAPPING_ERROR)
 		return false;
 
@@ -675,7 +678,7 @@ static bool idpf_rx_post_init_bufs(struct idpf_buf_queue *bufq,
  */
 static int idpf_rx_buf_alloc_singleq(struct idpf_rx_queue *rxq)
 {
-	if (idpf_rx_singleq_buf_hw_alloc_all(rxq, rxq->desc_count - 1))
+	if (idpf_rx_singleq_buf_hw_alloc_all(rxq, rxq->desc_count - 1, GFP_KERNEL))
 		goto err;
 
 	return 0;
diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.h b/drivers/net/ethernet/intel/idpf/idpf_txrx.h
index 93547597efd2a..e27438c78ec79 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.h
@@ -1123,7 +1123,7 @@ netdev_tx_t idpf_tx_singleq_frame(struct sk_buff *skb,
 				  struct idpf_tx_queue *tx_q);
 netdev_tx_t idpf_tx_start(struct sk_buff *skb, struct net_device *netdev);
 bool idpf_rx_singleq_buf_hw_alloc_all(struct idpf_rx_queue *rxq,
-				      u16 cleaned_count);
+				      u16 cleaned_count, gfp_t gfp);
 bool idpf_rx_process_skb_fields(struct sk_buff *skb,
 				const struct libeth_xdp_buff *xdp,
 				struct libeth_rq_napi_stats *rs);
diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
index 0e736846c5e8a..14a528ea8a075 100644
--- a/include/net/libeth/rx.h
+++ b/include/net/libeth/rx.h
@@ -96,20 +96,23 @@ int libeth_rx_fq_create(struct libeth_fq *fq, void *napi_dev);
 void libeth_rx_fq_destroy(struct libeth_fq *fq);
 
 /**
- * libeth_rx_alloc - allocate a new Rx buffer
+ * libeth_rx_alloc_gfp - allocate a new Rx buffer
  * @fq: fill queue to allocate for
  * @i: index of the buffer within the queue
+ * @gfp: allocation flags: GFP_KERNEL where the caller may sleep (e.g. the
+ *	 initial fill of the ring), GFP_ATOMIC from NAPI
  *
  * Return: DMA address to be passed to HW for Rx on successful allocation,
  * ```DMA_MAPPING_ERROR``` otherwise.
  */
-static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
+static inline dma_addr_t libeth_rx_alloc_gfp(const struct libeth_fq_fp *fq,
+					     u32 i, gfp_t gfp)
 {
 	struct libeth_fqe *buf = &fq->fqes[i];
 
 	buf->truesize = fq->truesize;
-	buf->netmem = page_pool_dev_alloc_netmem(fq->pp, &buf->offset,
-						 &buf->truesize);
+	buf->netmem = page_pool_alloc_netmem(fq->pp, &buf->offset,
+					     &buf->truesize, gfp | __GFP_NOWARN);
 	if (unlikely(!buf->netmem))
 		return DMA_MAPPING_ERROR;
 
@@ -117,6 +120,18 @@ static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
 	       fq->pp->p.offset;
 }
 
+/**
+ * libeth_rx_alloc - allocate a new Rx buffer from NAPI context
+ * @fq: fill queue to allocate for
+ * @i: index of the buffer within the queue
+ *
+ * Return: as libeth_rx_alloc_gfp().
+ */
+static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
+{
+	return libeth_rx_alloc_gfp(fq, i, GFP_ATOMIC);
+}
+
 void libeth_rx_recycle_slow(netmem_ref netmem);
 
 /**
-- 
2.56.0.176.g3575e65682-goog

