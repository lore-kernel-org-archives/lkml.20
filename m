Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792816790;
	b=ds5Qrq+bKTaBiwNPn+8FwW7/sr3sM45AYdYVgKYv84BwQpOvkfVaex49cQyU8fI+2YF0
	 cDJUlbHwZQRCRk5wiCIzcjZVgLT4tN/ecoblesh7Php0FbBAvq3gLwuZ9oSzarsKVpmOK
	 aXM9jGUCO/+R9MeEslovUKkTZ6PClWIwHCswggPhaHtuBvKLil03qyXcwQjZk237YBdJB
	 hb77e2+1Cc3NauOt51wN4xbH88oonyZUILBg8AFldBy76YT9V0QeyC/5XT+5VzoaLNmF9
	 zUrvSFyJoAL0uDScKv01pCeqyy91xurh3kl7s5czktHAhtBZj/gCX7gfl+U/iNGbsiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792816790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3HaU3JTYEsqzcj7t+o5JM4q8kNKPVWEXADi4DwUtYP8=;
	b=TxgsIcmjCmVDfqCMgU8omm8plx4dNXDf6a+ZVXWDAR0g9Cxb/FeAuJduiv+ePJfchoDx
	 /ELW4/DFQSMErkEqRCGmb7w+ByBsMgX7zgfN8AdA8IE4CZbxreTIsxkKbEn+Q0PBW7V06
	 +c4I8oOTBWXcQwtKvT+ZJ32Rc8hZeOooJMWC0KKWlCurvV7eHslBXzWP2X7FJWZ0Z3vHA
	 qog6X4OvjrgoeX/Qc4aHO1UbzPSMixotlcHvqOw24IW68GA+6u2IqHUG3JCuk/rAppaTv
	 M07ilPqZqHv3RuDMyoY+uXGOQcwnTTfSx531LhG6805TNpWNa/Qt7vQ+a4s85k+qfyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="V/pid0Yn";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0324B606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0324B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V/pid0Yn
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so885711a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792816788; x=1793421588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3HaU3JTYEsqzcj7t+o5JM4q8kNKPVWEXADi4DwUtYP8=;
        b=V/pid0YnewNbwPiHJMqlDa4Ogbl50OrP/1+idMC8DrAEn1/BRFh/3emXbEkdU0Ci5L
         cs7omddMd+zsC3lLk7ylF6mw2zjOpxme4mz1qlUu0M4l8d5EOJcof6b0pobH3EcrYpUP
         arKJVbXB0reHjXbLcNgrObK9x2c6iEG/8FJf0Tdx1bgz93PpxhKUg/W2aM0aC6ri/6S/
         DqPPvMvonoPJIwPlRakUZb2ivoeWR4nyoNHG84AvlwJobrdiTOLueLMjVNwNTtDdgt4k
         L7F7v4jMunxhm9D334gDGdE3UlHeLlSDtXY4WOky5QP/0U0ansSmrkzqy2IRaGLQ/gov
         H56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792816788; x=1793421588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HaU3JTYEsqzcj7t+o5JM4q8kNKPVWEXADi4DwUtYP8=;
        b=NDDWZ8S/MHRmXDNEt+YK8lvZ+4cdc0TJHjowk6T4TsOffTNHUFgX7HBA1jDujdLvmW
         XjLO44IkE6zVNNBxRkZGXfvcRl8Cy7c3whZeW4UeE3UCkBeNznDNww6fB6jpni0wNmx0
         y1w2zPqdX4cGTi7vEJHdFBeqmUP21Aqz60rgFXUq0B50lBU/2saWciICNheUm/r+kqWw
         QqnyDkfHY9W1PbnolTMDfbufRGaM66owU67G8PzIpLuW38fLfB8w627Puu9//ZcyYlh4
         t91jMuGKQgrZHsrfpA8TDS0F4hOJyaTVqU0RgnzvtaHb1LAB77URTAkJvlUFHn3Cn6mV
         34Wg==
X-Forwarded-Encrypted: i=1; AKwUvBzX+pL16Gkqs8ReDOF05fGWdFleIfwQFkiDfX8ipiYrAx4cR6Pyke1nA8UAgiV836LnbI7IYvBWdwtGcCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJDJZejUksNEqMk1EIfOCiKJUazghnJWyE0VizILYbpFHj9qbx
	Ud4VYb/YbLxo1tkKbXhGCTfdu62X9fimM7hgJ+CP9lET4C+Lu7+S28rvopcdKg==
X-Gm-Gg: AYBFou1vbRuNMYcwpty4dnfCKMAYBIfipx8zjJes+U1JFsnFROsH4l3D+4XOx07tM5N
	bvMvZD35PisMiKF7Ov86Gcm73uzpYhKfMbWLtsUR6q07B8+gYeKLDtakHQeHiBxiTJD3cO6lazx
	fhW7Z1t3QbDhXI34YIZpZzYc9xGu42z3wuH8B+1crKag4zdpewgo0Ahod/U9NZwvsYmV9tFK04w
	GokqLFDyb7rXGoi+eej18sexNrDHiCRbXet02T5ORTp/C3W2XrYl9v9WFGts75VxjaB9288wf+b
	mhTCpGIgTpyOTuNHYrOQgHk07cFiTRlY5HVMdf0OUXDgjGn6W9WouMD+vPRo+5eW6K3Sjjrviy+
	vuXu+RR9O5Blm4MduVFLlrdFLW/FCf/BywBn7jeUWrDLDflSXFHGtWFWCNKXnaKMWjqWi55hHfg
	I6E0tomob42Ha/I7GZCBiMi9y6EuVv30ymdoNQ0M8I8ZSjPvgKfyQt5k+l58M0BUbQjgTDmW3yU
	1ZizHq4zkn96X4XnIc8bdbxR4KIDJS9yBcQRXFCdxT62SQ3wves7CmU1U+5HUwcVm9ngrShqmoP
	ezSflQxvadAjX38Y0AC2pY56nFJdpMdRSXo3Hx+ILRMxhpj+RA9XfGC6QE0jok+ZvwW/DLITGzV
	zP2tRyP7BhHNfmbqnSuHxOvH5iccz
X-Received: by 2002:a17:90b:3c06:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3adeabe0ccdmr1080585a91.35.1792816788146;
        Fri, 23 Oct 2026 21:39:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm768481a91.4.2026.10.23.21.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:39:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath9k: use page_pool for RX buffers
Date: Fri, 23 Oct 2026 21:39:44 -0700
Message-ID: <20261024043944.3221303-1-rosenp@gmail.com>
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

Allocate RX buffers from a page_pool instead of allocating a new skb
and mapping it for every received frame. The pool keeps its pages
mapped, so refilling a descriptor only needs a sync for the device,
and buffers are recycled once the stack is done with them.

The pool uses the smallest page order that fits at least two buffers
and is sized for the number of pages the RX ring needs. With 4 KiB
pages a buffer plus skb_shared_info does not fit into half a page, so
this means order-1 pages split into three fragments.

Buffers are now aligned to the page_pool fragment alignment (at least
the DMA cache alignment) plus NET_SKB_PAD instead of to the PCI cache
line size reported in common->cachelsz. This keeps them cache line
aligned, which is what the hardware needs.

On a Meraki MX60 (APM82181, 3x3 AR9300-family PCIe card, 5 GHz HT40)
forwarding 90 Mbit/s of UDP from a wireless client to the WAN port,
the CPU load drops from 56.2% to 54.8% (mean of 12 runs each, in-boot
A/B), and the share of ath9k itself drops from 14.1% to 11.9% of the
samples. TCP throughput is unchanged (air time bound).

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/Kconfig |   1 +
 drivers/net/wireless/ath/ath9k/ath9k.h |   2 +
 drivers/net/wireless/ath/ath9k/recv.c  | 167 ++++++++++++++++---------
 3 files changed, 109 insertions(+), 61 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/Kconfig b/drivers/net/wireless/ath/ath9k/Kconfig
index 47d570a5ca6a..d674d19210b5 100644
--- a/drivers/net/wireless/ath/ath9k/Kconfig
+++ b/drivers/net/wireless/ath/ath9k/Kconfig
@@ -22,6 +22,7 @@ config ATH9K
 	tristate "Atheros 802.11n wireless cards support"
 	depends on MAC80211 && HAS_DMA
 	select MAC80211_LEDS if LEDS_CLASS=y || LEDS_CLASS=MAC80211
+	select PAGE_POOL
 	select ATH9K_HW
 	select ATH9K_COMMON
 	help
diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
index e8635bf81f9d..a3b94a99b321 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k.h
+++ b/drivers/net/wireless/ath/ath9k/ath9k.h
@@ -33,6 +33,7 @@
 
 struct ath_node;
 struct ath_vif;
+struct page_pool;
 
 extern struct ieee80211_ops ath9k_ops;
 extern int ath9k_modparam_nohwcrypt;
@@ -312,6 +313,7 @@ struct ath_rx {
 
 	struct ath_rxbuf *buf_hold;
 	struct sk_buff *frag;
+	struct page_pool *page_pool;
 
 	u32 ampdu_ref;
 };
diff --git a/drivers/net/wireless/ath/ath9k/recv.c b/drivers/net/wireless/ath/ath9k/recv.c
index 93b41a1bb2af..4bff0f74dba1 100644
--- a/drivers/net/wireless/ath/ath9k/recv.c
+++ b/drivers/net/wireless/ath/ath9k/recv.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <net/page_pool/helpers.h>
 #include "ath9k.h"
 #include "ar9003_mac.h"
 
@@ -107,6 +108,77 @@ static void ath_opmode_init(struct ath_softc *sc)
 	ath9k_hw_setmcastfilter(ah, mfilt[0], mfilt[1]);
 }
 
+static unsigned int ath_rx_buf_size(struct ath_common *common)
+{
+	return SKB_DATA_ALIGN(NET_SKB_PAD + common->rx_bufsize) +
+	       SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+}
+
+static int ath_rx_page_pool_create(struct ath_softc *sc, int nbufs)
+{
+	struct ath_common *common = ath9k_hw_common(sc->sc_ah);
+	unsigned int size = ath_rx_buf_size(common);
+	struct page_pool_params pp_params = {};
+	struct page_pool *pp;
+	unsigned int order;
+
+	/*
+	 * Use pages that hold at least two buffers. With 4 KiB pages a
+	 * buffer does not fit into half a page, so this ends up as
+	 * order-1 pages shared by three buffers.
+	 */
+	order = get_order(2 * size);
+
+	pp_params.order = order;
+	pp_params.pool_size = DIV_ROUND_UP(nbufs, (PAGE_SIZE << order) / size);
+	pp_params.nid = NUMA_NO_NODE;
+	pp_params.dev = sc->dev;
+	pp_params.flags = PP_FLAG_DMA_MAP;
+
+	/* EDMA chips clear the RX status from the CPU side */
+	if (sc->sc_ah->caps.hw_caps & ATH9K_HW_CAP_EDMA)
+		pp_params.dma_dir = DMA_BIDIRECTIONAL;
+	else
+		pp_params.dma_dir = DMA_FROM_DEVICE;
+
+	pp = page_pool_create(&pp_params);
+	if (IS_ERR(pp)) {
+		ath_err(common, "failed to create rx page pool\n");
+		return PTR_ERR(pp);
+	}
+
+	sc->rx.page_pool = pp;
+	return 0;
+}
+
+static struct sk_buff *ath_rx_buf_alloc(struct ath_softc *sc,
+					dma_addr_t *addr, gfp_t gfp)
+{
+	struct ath_common *common = ath9k_hw_common(sc->sc_ah);
+	struct page_pool *pp = sc->rx.page_pool;
+	unsigned int size = ath_rx_buf_size(common);
+	unsigned int offset;
+	struct sk_buff *skb;
+	struct page *page;
+
+	page = page_pool_alloc(pp, &offset, &size, gfp);
+	if (!page)
+		return NULL;
+
+	skb = build_skb(page_address(page) + offset, size);
+	if (!skb) {
+		page_pool_put_page(pp, page, -1, false);
+		return NULL;
+	}
+
+	skb_mark_for_recycle(skb);
+	skb_reserve(skb, NET_SKB_PAD);
+
+	*addr = page_pool_get_dma_addr(page) + offset + NET_SKB_PAD;
+
+	return skb;
+}
+
 static bool ath_rx_edma_buf_link(struct ath_softc *sc,
 				 enum ath9k_rx_qtype qtype)
 {
@@ -170,8 +242,6 @@ static void ath_rx_remove_buffer(struct ath_softc *sc,
 
 static void ath_rx_edma_cleanup(struct ath_softc *sc)
 {
-	struct ath_hw *ah = sc->sc_ah;
-	struct ath_common *common = ath9k_hw_common(ah);
 	struct ath_rxbuf *bf;
 
 	ath_rx_remove_buffer(sc, ATH9K_RX_QUEUE_LP);
@@ -179,9 +249,6 @@ static void ath_rx_edma_cleanup(struct ath_softc *sc)
 
 	list_for_each_entry(bf, &sc->rx.rxbuf, list) {
 		if (bf->bf_mpdu) {
-			dma_unmap_single(sc->dev, bf->bf_buf_addr,
-					common->rx_bufsize,
-					DMA_BIDIRECTIONAL);
 			dev_kfree_skb_any(bf->bf_mpdu);
 			bf->bf_buf_addr = 0;
 			bf->bf_mpdu = NULL;
@@ -218,7 +285,7 @@ static int ath_rx_edma_init(struct ath_softc *sc, int nbufs)
 	INIT_LIST_HEAD(&sc->rx.rxbuf);
 
 	for (i = 0; i < nbufs; i++, bf++) {
-		skb = ath_rxbuf_alloc(common, common->rx_bufsize, GFP_KERNEL);
+		skb = ath_rx_buf_alloc(sc, &bf->bf_buf_addr, GFP_KERNEL);
 		if (!skb) {
 			error = -ENOMEM;
 			goto rx_init_fail;
@@ -227,19 +294,9 @@ static int ath_rx_edma_init(struct ath_softc *sc, int nbufs)
 		memset(skb->data, 0, common->rx_bufsize);
 		bf->bf_mpdu = skb;
 
-		bf->bf_buf_addr = dma_map_single(sc->dev, skb->data,
-						 common->rx_bufsize,
-						 DMA_BIDIRECTIONAL);
-		if (unlikely(dma_mapping_error(sc->dev,
-						bf->bf_buf_addr))) {
-				dev_kfree_skb_any(skb);
-				bf->bf_mpdu = NULL;
-				bf->bf_buf_addr = 0;
-				ath_err(common,
-					"dma_mapping_error() on RX init\n");
-				error = -ENOMEM;
-				goto rx_init_fail;
-		}
+		dma_sync_single_for_device(sc->dev, bf->bf_buf_addr,
+					   common->rx_bufsize,
+					   DMA_BIDIRECTIONAL);
 
 		list_add_tail(&bf->list, &sc->rx.rxbuf);
 	}
@@ -278,8 +335,18 @@ int ath_rx_init(struct ath_softc *sc, int nbufs)
 	common->rx_bufsize = IEEE80211_MAX_MPDU_LEN / 2 +
 			     sc->sc_ah->caps.rx_status_len;
 
-	if (sc->sc_ah->caps.hw_caps & ATH9K_HW_CAP_EDMA)
-		return ath_rx_edma_init(sc, nbufs);
+	error = ath_rx_page_pool_create(sc, nbufs);
+	if (error)
+		return error;
+
+	if (sc->sc_ah->caps.hw_caps & ATH9K_HW_CAP_EDMA) {
+		error = ath_rx_edma_init(sc, nbufs);
+		if (error) {
+			page_pool_destroy(sc->rx.page_pool);
+			sc->rx.page_pool = NULL;
+		}
+		return error;
+	}
 
 	ath_dbg(common, CONFIG, "cachelsz %u rxbufsize %u\n",
 		common->cachelsz, common->rx_bufsize);
@@ -296,27 +363,16 @@ int ath_rx_init(struct ath_softc *sc, int nbufs)
 	}
 
 	list_for_each_entry(bf, &sc->rx.rxbuf, list) {
-		skb = ath_rxbuf_alloc(common, common->rx_bufsize,
-				      GFP_KERNEL);
+		skb = ath_rx_buf_alloc(sc, &bf->bf_buf_addr, GFP_KERNEL);
 		if (skb == NULL) {
 			error = -ENOMEM;
 			goto err;
 		}
 
 		bf->bf_mpdu = skb;
-		bf->bf_buf_addr = dma_map_single(sc->dev, skb->data,
-						 common->rx_bufsize,
-						 DMA_FROM_DEVICE);
-		if (unlikely(dma_mapping_error(sc->dev,
-					       bf->bf_buf_addr))) {
-			dev_kfree_skb_any(skb);
-			bf->bf_mpdu = NULL;
-			bf->bf_buf_addr = 0;
-			ath_err(common,
-				"dma_mapping_error() on RX init\n");
-			error = -ENOMEM;
-			goto err;
-		}
+		dma_sync_single_for_device(sc->dev, bf->bf_buf_addr,
+					   common->rx_bufsize,
+					   DMA_FROM_DEVICE);
 	}
 	sc->rx.rxlink = NULL;
 err:
@@ -328,27 +384,24 @@ int ath_rx_init(struct ath_softc *sc, int nbufs)
 
 void ath_rx_cleanup(struct ath_softc *sc)
 {
-	struct ath_hw *ah = sc->sc_ah;
-	struct ath_common *common = ath9k_hw_common(ah);
 	struct sk_buff *skb;
 	struct ath_rxbuf *bf;
 
 	if (sc->sc_ah->caps.hw_caps & ATH9K_HW_CAP_EDMA) {
 		ath_rx_edma_cleanup(sc);
-		return;
-	}
-
-	list_for_each_entry(bf, &sc->rx.rxbuf, list) {
-		skb = bf->bf_mpdu;
-		if (skb) {
-			dma_unmap_single(sc->dev, bf->bf_buf_addr,
-					 common->rx_bufsize,
-					 DMA_FROM_DEVICE);
-			dev_kfree_skb(skb);
-			bf->bf_buf_addr = 0;
-			bf->bf_mpdu = NULL;
+	} else {
+		list_for_each_entry(bf, &sc->rx.rxbuf, list) {
+			skb = bf->bf_mpdu;
+			if (skb) {
+				dev_kfree_skb(skb);
+				bf->bf_buf_addr = 0;
+				bf->bf_mpdu = NULL;
+			}
 		}
 	}
+
+	page_pool_destroy(sc->rx.page_pool);
+	sc->rx.page_pool = NULL;
 }
 
 /*
@@ -1118,7 +1171,7 @@ int ath_rx_tasklet(struct ath_softc *sc, int flush, bool hp)
 
 		/* Ensure we always have an skb to requeue once we are done
 		 * processing the current buffer's skb */
-		requeue_skb = ath_rxbuf_alloc(common, common->rx_bufsize, GFP_ATOMIC);
+		requeue_skb = ath_rx_buf_alloc(sc, &new_buf_addr, GFP_ATOMIC);
 
 		/* If there is no memory we ignore the current RX'd frame,
 		 * tell hardware it can give us a new frame using the old
@@ -1130,16 +1183,8 @@ int ath_rx_tasklet(struct ath_softc *sc, int flush, bool hp)
 		}
 
 		/* We will now give hardware our shiny new allocated skb */
-		new_buf_addr = dma_map_single(sc->dev, requeue_skb->data,
-					      common->rx_bufsize, dma_type);
-		if (unlikely(dma_mapping_error(sc->dev, new_buf_addr))) {
-			dev_kfree_skb_any(requeue_skb);
-			goto requeue_drop_frag;
-		}
-
-		/* Unmap the frame */
-		dma_unmap_single(sc->dev, bf->bf_buf_addr,
-				 common->rx_bufsize, dma_type);
+		dma_sync_single_for_device(sc->dev, new_buf_addr,
+					   common->rx_bufsize, dma_type);
 
 		bf->bf_mpdu = requeue_skb;
 		bf->bf_buf_addr = new_buf_addr;
-- 
2.56.0

