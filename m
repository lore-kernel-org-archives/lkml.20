Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723013;
	b=M7ZT/w2iu8GqZd7JSb74LTIHxaeasPTMkKAQa0bHigB7+RtQWNbEk9Eo+aiv7M95UqZM
	 mk6wlIXgsy7V9blmk2OV0UIa1yuegYnMdwGYjBn29kjFTNplqVmlRMpPKGle1u8m15M0i
	 VHL63JUWIfyWZwWD7NgEdf9gUC0z0rWyXlaxVcS9PNyE5Qwsj/vHxw7gsaAxvVBfX7brT
	 JGS3BY3cbQt06QTzeE5fs6cFL2JlWpWkrZ1IqnD5P2Uf0xwBJCOw755jy2sQ9Td5QaK8G
	 DpwArepfwr/82mo52taR7lGO5k9ganoP8MaVoBJoC4phUU6lw/wotBejXk2aahqpBxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wEvpZVnmD8tz2rAl92pJSmTNVQbWDPHgUyrWXimakhw=;
	b=dRZWmIgqPpj0BEDEJ0zzbgfNjzV24tcaD9s4tBN1p1/Di6BeRq3JwEht1Y7nT36H6kbN
	 CyhxwnQW8Tpz3loRmw5zhaqXtpDG+aSd2vwoVaCIfs4yXubB03jq0CXqrljymRoY6xynP
	 c4ZqT6dM7eFx18YF6ZYBduJP5/UZE/LrcMdMCd+xo0IB4+mKJ1XF2TUUl9XBmdDcJ60nf
	 RLsLTV2h3bvRO4/nEnW03Gj9EIZnUY0/fKxd1/FC8VT64LeeRNFLdz/Y3QM/oNVd1tCIl
	 Z86d06d1soXxFWwMxH94y3feOBqB5+bNL+gG7JzpaftGrvUrCZbxTCzA5xuJNdFt4/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mMlgwDBa;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB3606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDB3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mMlgwDBa
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4322d31021so330995966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723011; x=1794327811; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEvpZVnmD8tz2rAl92pJSmTNVQbWDPHgUyrWXimakhw=;
        b=mMlgwDBamiVt3pYhjiQ8b/Cew8LjYxIVhRlKpd7mycCYSwoJQuAt0alVs1fZ/esrgY
         sykX9BD+Xmr56tk3u3lsoO8vbxfMF1NAJMuooAYu2tYH0ySNRBvZq3+KuEospzDb+I4U
         5stSa7u5qUTpvLYCX5N9JYYkt4Jse3fjtBQMPwZyNvEk0AwdTLtMUlSSbBXEwNrVyczI
         /M9OwfT1EUYPw9/qcnx3zmsPvtcELML0DBdsQMuuKQnC/lAw6SHLA7K8zQu+StA2ZUwv
         TSS/q+HKDf7cZjIZtJR/Wt5Q6c4N/2JolOCkmf/9E45E01LYUbmpihxS46Nt8FWuGCHF
         ij/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723011; x=1794327811;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEvpZVnmD8tz2rAl92pJSmTNVQbWDPHgUyrWXimakhw=;
        b=xnkH/54NljPUtHdF6yDjJqg5HQe++HH9FGNI1JAg2CXhepoz9ItiMaw4yqc+2j8g+6
         TlE6qWB5bTPW1bUlNs0+vjQLsNg+Ax0ufQWA3P1ZpluxXPRP2PwumHgm6uCY8FpxevH+
         1iQJoblYTJ9Cxt4aC3YV9yKSEW0SUxBLe2DUE3MB47XH3EdwtAQhaRnWTN3ZuldW2EjP
         Bfndhu7TwC3fSjWcjcnisuIXepviDj9Q6ajEfJnEgbGWSIx3By/BX6NmQXsZIue40T5B
         HuewX+dbYI269FTeUvOKTjA7Oyd9ZxIQ18fewbIFyjLGb0ibN2zKE7+LWepOwNQ3BtLx
         PsHg==
X-Forwarded-Encrypted: i=1; AKwUvBzoS+nVB9wG29ZKEzCbWbpVrveG7qzeF/P1FQGqTzAI1JUqKcG9arsNaBajYD5xA92aMoHIaV2GGnuTT+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EFINhXuSS30/oKRSlLyhPagBH7MofKDIXJaeOBCEJqmmVxb7x
	Y6d2zH+XuSCDdDV2d0Xu70CptpKtEVCWKmTZjeRp/u/jUvqZ6LAVirbzvfuf8dILP4jD5Y5XX6+
	/NBrqqw==
X-Received: from ejbxj21.prod.google.com ([2002:a17:906:d335:b0:c31:9985:b124])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:7951:b0:c29:22cf:b0f5
 with SMTP id a640c23a62f3a-c4ca7ab1133mr1128153266b.33.1793723011159; Tue, 03
 Nov 2026 08:23:31 -0800 (PST)
Date: Tue,  3 Nov 2026 16:23:25 +0000
In-Reply-To: <20261103162326.3615979-1-lrizzo@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103162326.3615979-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103162326.3615979-3-lrizzo@google.com>
Subject: [PATCH iwl-next v3 2/2] idpf: use GFP_KERNEL for the initial Rx ring fill
From: Luigi Rizzo <lrizzo@google.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Luigi Rizzo <rizzo.unipi@gmail.com>, Brian Vazquez <brianvv@google.com>, 
	Joshua Hay <joshua.a.hay@intel.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

When idpf fills its Rx rings at open or on queue reconfiguration, the
allocation runs in process context, right after page_pool_create() and
before the queues' NAPI is enabled. Allocating tens of thousands of
buffers across all queues with GFP_ATOMIC is needlessly restrictive
when the caller may sleep.

In splitq mode, idpf_rx_post_buf_desc() is only used for this initial
fill, so switch its header and payload allocations to
__libeth_rx_alloc(..., GFP_KERNEL).

In singleq mode, add a gfp_t parameter to
idpf_rx_singleq_buf_hw_alloc_all() and pass GFP_KERNEL from
idpf_rx_buf_alloc_singleq() and GFP_ATOMIC from idpf_rx_singleq_clean().

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c | 7 ++++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c         | 9 ++++++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.h         | 2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c
index e3ddf18dcbf51..ab5a1e20a37ce 100644
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
+		addr = __libeth_rx_alloc(&fq, nta, gfp);
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
index 885df6294ad94..0da095738d8d8 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -599,6 +599,9 @@ static void idpf_post_buf_refill(struct idpf_sw_queue *refillq, u16 buf_id)
  * @bufq: buffer queue to post to
  * @buf_id: buffer id to post
  *
+ * Only used for the initial fill, from process context, so it allocates
+ * with GFP_KERNEL.
+ *
  * Return: %false if buffer could not be allocated, %true otherwise.
  */
 static bool idpf_rx_post_buf_desc(struct idpf_buf_queue *bufq, u16 buf_id)
@@ -617,7 +620,7 @@ static bool idpf_rx_post_buf_desc(struct idpf_buf_queue *bufq, u16 buf_id)
 		fq.fqes = bufq->hdr_buf;
 		fq.truesize = bufq->hdr_truesize;
 
-		addr = libeth_rx_alloc(&fq, buf_id);
+		addr = __libeth_rx_alloc(&fq, buf_id, GFP_KERNEL);
 		if (addr == DMA_MAPPING_ERROR)
 			return false;
 
@@ -628,7 +631,7 @@ static bool idpf_rx_post_buf_desc(struct idpf_buf_queue *bufq, u16 buf_id)
 	fq.fqes = bufq->buf;
 	fq.truesize = bufq->truesize;
 
-	addr = libeth_rx_alloc(&fq, buf_id);
+	addr = __libeth_rx_alloc(&fq, buf_id, GFP_KERNEL);
 	if (addr == DMA_MAPPING_ERROR)
 		return false;
 
@@ -674,7 +677,7 @@ static bool idpf_rx_post_init_bufs(struct idpf_buf_queue *bufq,
  */
 static int idpf_rx_buf_alloc_singleq(struct idpf_rx_queue *rxq)
 {
-	if (idpf_rx_singleq_buf_hw_alloc_all(rxq, rxq->desc_count - 1))
+	if (idpf_rx_singleq_buf_hw_alloc_all(rxq, rxq->desc_count - 1, GFP_KERNEL))
 		goto err;
 
 	return 0;
diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.h b/drivers/net/ethernet/intel/idpf/idpf_txrx.h
index fe0c913f9bb95..82f0a63f23c34 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.h
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.h
@@ -1129,7 +1129,7 @@ netdev_tx_t idpf_tx_singleq_frame(struct sk_buff *skb,
 				  struct idpf_tx_queue *tx_q);
 netdev_tx_t idpf_tx_start(struct sk_buff *skb, struct net_device *netdev);
 bool idpf_rx_singleq_buf_hw_alloc_all(struct idpf_rx_queue *rxq,
-				      u16 cleaned_count);
+				      u16 cleaned_count, gfp_t gfp);
 bool idpf_rx_process_skb_fields(struct sk_buff *skb,
 				const struct libeth_xdp_buff *xdp,
 				struct libeth_rq_napi_stats *rs);
-- 
2.56.0.385.gac671c819a-goog

