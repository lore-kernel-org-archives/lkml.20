Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855724;
	b=tun4bTL/vHUdbCVAnJJ2a/l6XXVa6nXCoRsjTZxs8YbD6Pzgb0fWmHZcldNqnYUXT39v
	 mttZxpvN0ZwfitgTv7XmFtwdUmnXRwngweLUB6s8jNiKcd4jZ4F6HnYyBmf6FYCyXjAXW
	 pSCWPLUTzb66Od0Y9pOBMiQO+UqipISeyAHBqhQ6/tkChg7L1QZrsVsKK3TDzjhgYUZ9R
	 OvagTVrDZSDg8wg5gpy3lwVbvK/JnSd7akoHxQ1qNpf2LSsVPMRL0dasw76Opi8LVj97B
	 s68fKCvaTA/loXBdWKE7rpD2AcHl6UqbPqcXI5PYX0qs4h5QfObr73+4T3lyNydTQeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855724;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vaWafyUkOS/8YTt9cOHijjPOAd9VaKJvFlrm0CGGQzo=;
	b=1pR17WTvNm/QjtUDCH+rRzH25Vf28owmeAI8sp/J2yvkZiHxZ+Mr4vfi+gRPpBQeefmh
	 xAtl1uOZIbWzIxYf408Py6EwR7bm7rNxKnPEK/cKsGpUAKWOjBrspmXNjfzqQcDJaBrKa
	 ZbXy5WzSubYoww5Jsz8XGrIPDzQtVLKVpbqNBrFiwNB6qlXUmwNGCxIlz2HjpOtfgM3vu
	 9VqzHsYVNkIkmfCrJzZi5/Nnh+cooMCrF2YFhznVg+b04Zwpg3/YpFUhNN+H/A1VRC5UP
	 OS4ciK7M+61bmc6ZaGRlc0woivAq8Y1hPqvqNp30D2SQM6DrTApCEOlD7CtVDbTf/5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ED9606A323;
	Mon, 16 Nov 2026 19:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75ED9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jSy076GnPzFpkF;
	Mon, 16 Nov 2026 20:01:59 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794855720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaWafyUkOS/8YTt9cOHijjPOAd9VaKJvFlrm0CGGQzo=;
	b=BeDZ9cbM22udIDEJ+12YLoYEL7nsOGcO0+sK32EI+mKuAAhoBLilNAQ76T3dUJBVydoDq4
	HMyED7IHy8XKUuAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794855720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vaWafyUkOS/8YTt9cOHijjPOAd9VaKJvFlrm0CGGQzo=;
	b=FTs3Npgj0DBWDzwCIM4LjmNESvvkbAqAH0N+zBSU20KPOhIcU7jEIgvoXpkphCwVW9Hidt
	DRcUmnd86G9YWgpCrnQp7QufUbL6DIiFAV9lhrihqCwlWTAwo8N/tqBf3d5rGKn8GR2c2o
	WEvdD/06dFZMvpXXuJSyEweUGYU4sp/htgvU0+wA4qysqV3ldyylEHW9fCbF3jpwjjVFDv
	MsRyu+FL/dWNDNSNYnX58N0TqdFtR4wqN/qjxA+0Lpca2+aaou1VMAVNbKqfOXB7IdWxjr
	qx+J5ggNh1gFl3I4C2nYYWQzaLEU2eRp+6MZRgo86ERMV1gEYE2v7ginBSI7SA==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id DGOGMidT+2rw8ygAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Mon, 16 Nov 2026 20:01:59 +0100
Received: (nullmailer pid 2736567 invoked by uid 2002000001);
	Mon, 16 Nov 2026 19:01:58 -0000
From: =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
Subject: [PATCH rtw-next 2/5] wifi: rtw88: sdio: aggregate TX frames of the 88xx chips
Date: Mon, 16 Nov 2026 20:01:42 +0100
Message-ID: <20261116190145.2736364-3-david@hardeman.nu>
In-Reply-To: <20261116190145.2736364-1-david@hardeman.nu>
References: <20261116190145.2736364-1-david@hardeman.nu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 88xx chips accept several frames in one transfer: the first TX
descriptor carries the number of frames in DMA_TXAGG_NUM and every frame
starts 8 byte aligned, as for USB TX aggregation. Realtek's driver sends
up to about 32 KiB per transfer this way. rtw88 sends one frame per
transfer, so a full sized frame costs a CMD53 and its interrupts, and
the RTL8822CS cannot get near its PHY rate.

When an AC queue holds more than one frame, copy up to 32 frames or
20 KiB of the same access category into a buffer and send them with one
transfer. The chip rejects aggregates that mix access categories; an AC
queue only holds one, but the queue select of each frame is checked to
be sure. Every frame is charged its own pages and output queue entry,
so the aggregate is shrunk until it fits what is free. A frame too big
for the buffer is sent on its own, as before.

The RTL8723BS and the other chips with an 8051 MCU keep sending one
frame per transfer.

On a NanoPi R76S (RTL8822CS, SDR104) acting as an AP, TCP throughput to
a client goes from about 100 to about 220 Mbit/s, and from the client
from about 185 to about 245 Mbit/s. Realtek's driver reaches about 183
and 265 Mbit/s on the same setup.

Signed-off-by: David Härdeman <david@hardeman.nu>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 181 +++++++++++++++++++++-
 drivers/net/wireless/realtek/rtw88/sdio.h |   6 +
 2 files changed, 180 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index 49d733a5104..17a4c3037d7 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -919,16 +919,16 @@ static void rtw_sdio_8723bs_consume_txpg(struct rtw_dev *rtwdev, u8 queue,
 		atomic_set(&rtwsdio->free_pg_pub, 0);
 }
 
-static int rtw_sdio_write_to_port(struct rtw_dev *rtwdev, struct sk_buff *skb,
-				  enum rtw_tx_queue_type queue, u32 txaddr,
-				  size_t write_size)
+static int rtw_sdio_write_buf_to_port(struct rtw_dev *rtwdev, void *buf,
+				      enum rtw_tx_queue_type queue, u32 txaddr,
+				      size_t write_size)
 {
 	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
 	bool bus_claim;
 	int ret;
 
-	if (!IS_ALIGNED((unsigned long)skb->data, RTW_SDIO_DATA_PTR_ALIGN))
-		rtw_warn(rtwdev, "Got unaligned SKB in %s() for queue %u\n",
+	if (!IS_ALIGNED((unsigned long)buf, RTW_SDIO_DATA_PTR_ALIGN))
+		rtw_warn(rtwdev, "Got unaligned buffer in %s() for queue %u\n",
 			 __func__, queue);
 
 	bus_claim = rtw_sdio_bus_claim_needed(rtwsdio);
@@ -936,8 +936,7 @@ static int rtw_sdio_write_to_port(struct rtw_dev *rtwdev, struct sk_buff *skb,
 	if (bus_claim)
 		sdio_claim_host(rtwsdio->sdio_func);
 
-	ret = sdio_memcpy_toio(rtwsdio->sdio_func, txaddr, skb->data,
-			       write_size);
+	ret = sdio_memcpy_toio(rtwsdio->sdio_func, txaddr, buf, write_size);
 
 	if (bus_claim)
 		sdio_release_host(rtwsdio->sdio_func);
@@ -950,6 +949,14 @@ static int rtw_sdio_write_to_port(struct rtw_dev *rtwdev, struct sk_buff *skb,
 	return ret;
 }
 
+static int rtw_sdio_write_to_port(struct rtw_dev *rtwdev, struct sk_buff *skb,
+				  enum rtw_tx_queue_type queue, u32 txaddr,
+				  size_t write_size)
+{
+	return rtw_sdio_write_buf_to_port(rtwdev, skb->data, queue, txaddr,
+					  write_size);
+}
+
 static int rtw_sdio_write_port_8723bs(struct rtw_dev *rtwdev,
 				      struct sk_buff *skb,
 				      enum rtw_tx_queue_type queue, u32 txaddr,
@@ -1760,6 +1767,148 @@ static void rtw_sdio_indicate_tx_status(struct rtw_dev *rtwdev,
 	ieee80211_tx_status_irqsafe(hw, skb);
 }
 
+/* the access category of a data frame's TX descriptor queue select (TID) */
+static u8 rtw_sdio_skb_qsel_ac(struct sk_buff *skb)
+{
+	static const u8 tid_to_ac[] = {
+		IEEE80211_AC_BE, IEEE80211_AC_BK, IEEE80211_AC_BK,
+		IEEE80211_AC_BE, IEEE80211_AC_VI, IEEE80211_AC_VI,
+		IEEE80211_AC_VO, IEEE80211_AC_VO,
+	};
+	struct rtw_tx_desc *tx_desc = (struct rtw_tx_desc *)skb->data;
+	u8 qsel = le32_get_bits(tx_desc->w1, RTW_TX_DESC_W1_QSEL);
+
+	return qsel < ARRAY_SIZE(tid_to_ac) ? tid_to_ac[qsel] : U8_MAX;
+}
+
+static unsigned int rtw_sdio_agg_pages(struct rtw_dev *rtwdev,
+				       struct sk_buff_head *agg)
+{
+	unsigned int pages = 0;
+	struct sk_buff *skb;
+
+	/* the chip charges every frame of an aggregate its own pages */
+	skb_queue_walk(agg, skb)
+		pages += DIV_ROUND_UP(skb->len, rtwdev->chip->page_size);
+
+	return pages;
+}
+
+/*
+ * Send several frames of an AC queue with one transfer, for the 88xx chips:
+ * each frame, TX descriptor and payload, starts 8 byte aligned and the first
+ * descriptor carries the number of frames, as for USB TX aggregation. This
+ * saves a transfer, and its interrupts, per frame. The chip takes the frames
+ * of one access category only, which an AC queue holds anyway, but check the
+ * queue select of every frame to be sure.
+ *
+ * Returns 0 when frames were written, 1 when the queue was empty, -E2BIG when
+ * the first frame does not fit the buffer and another negative errno when
+ * the write failed. In both error cases the frames are back in the queue.
+ */
+static int rtw_sdio_process_tx_agg(struct rtw_dev *rtwdev,
+				   enum rtw_tx_queue_type queue)
+{
+	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
+	struct sk_buff_head *list = &rtwsdio->tx_queue[queue];
+	struct rtw_tx_pkt_info pkt_info = {};
+	u8 *buf = rtwsdio->tx_agg_buf;
+	struct rtw_tx_desc *tx_desc;
+	size_t len = 0, write_size;
+	struct sk_buff_head agg;
+	unsigned int num = 0;
+	struct sk_buff *skb;
+	u8 ac = U8_MAX;
+	u32 txaddr;
+	int ret;
+
+	__skb_queue_head_init(&agg);
+
+	while (num < RTW_SDIO_TX_AGG_MAX_NUM) {
+		skb = skb_dequeue(list);
+		if (!skb)
+			break;
+
+		if (!num) {
+			if (skb->len > RTW_SDIO_TX_AGG_MAX_SIZE) {
+				skb_queue_head(list, skb);
+				return -E2BIG;
+			}
+			ac = rtw_sdio_skb_qsel_ac(skb);
+		} else if (ALIGN(len, 8) + skb->len > RTW_SDIO_TX_AGG_MAX_SIZE ||
+			   rtw_sdio_skb_qsel_ac(skb) != ac) {
+			skb_queue_head(list, skb);
+			break;
+		}
+
+		len = (num ? ALIGN(len, 8) : 0) + skb->len;
+		__skb_queue_tail(&agg, skb);
+		num++;
+	}
+
+	if (!num)
+		return 1;
+
+	mutex_lock(&rtwsdio->tx_credit_lock);
+
+	/* shrink the aggregate until it fits the free pages and entries */
+	for (;;) {
+		ret = rtw_sdio_88xx_reserve_txpg(rtwdev, queue,
+						 rtw_sdio_agg_pages(rtwdev, &agg),
+						 num);
+		if (!ret)
+			break;
+		if (ret != -EBUSY || num == 1)
+			goto err_requeue;
+
+		skb_queue_head(list, __skb_dequeue_tail(&agg));
+		num--;
+	}
+
+	len = 0;
+	skb_queue_walk(&agg, skb) {
+		len = ALIGN(len, 8);
+		memcpy(buf + len, skb->data, skb->len);
+		len += skb->len;
+	}
+
+	if (num > 1) {
+		tx_desc = (struct rtw_tx_desc *)buf;
+		le32p_replace_bits(&tx_desc->w7, num,
+				   RTW_TX_DESC_W7_DMA_TXAGG_NUM);
+		pkt_info.pkt_offset = le32_get_bits(tx_desc->w1,
+						    RTW_TX_DESC_W1_PKT_OFFSET);
+		rtw_tx_fill_txdesc_checksum(rtwdev, &pkt_info, buf);
+	}
+
+	txaddr = rtw_sdio_get_tx_addr(rtwdev, len, queue);
+	write_size = sdio_align_size(rtwsdio->sdio_func, len);
+	memset(buf + len, 0, write_size - len);
+
+	ret = rtw_sdio_write_buf_to_port(rtwdev, buf, queue, txaddr,
+					 write_size);
+	if (ret) {
+		/* the pages may or may not have been used, read them again */
+		rtwsdio->free_txpg_valid = false;
+		goto err_requeue;
+	}
+
+	mutex_unlock(&rtwsdio->tx_credit_lock);
+
+	while ((skb = __skb_dequeue(&agg)))
+		rtw_sdio_indicate_tx_status(rtwdev, skb);
+
+	return 0;
+
+err_requeue:
+	mutex_unlock(&rtwsdio->tx_credit_lock);
+
+	while ((skb = __skb_dequeue_tail(&agg)))
+		skb_queue_head(list, skb);
+
+	return ret;
+}
+
 /*
  * Send one frame from @queue. Returns 0 when a frame was written, 1 when the
  * queue was empty and a negative errno when the write failed, in which case
@@ -1773,6 +1922,13 @@ static int rtw_sdio_process_tx_queue(struct rtw_dev *rtwdev,
 	u16 q_map;
 	int ret;
 
+	if (rtwsdio->tx_agg_buf && rtw_sdio_queue_is_ac(queue) &&
+	    skb_queue_len(&rtwsdio->tx_queue[queue]) > 1) {
+		ret = rtw_sdio_process_tx_agg(rtwdev, queue);
+		if (ret != -E2BIG)
+			return ret;
+	}
+
 	skb = skb_dequeue(&rtwsdio->tx_queue[queue]);
 	if (!skb)
 		return 1;
@@ -1878,6 +2034,15 @@ static int rtw_sdio_init_tx(struct rtw_dev *rtwdev)
 
 	mutex_init(&rtwsdio->tx_credit_lock);
 
+	/*
+	 * TX aggregation relies on the free page and output queue counts
+	 * that only the non-8051 chips keep; without the buffer, frames are
+	 * sent one by one.
+	 */
+	if (!rtw_chip_wcpu_8051(rtwdev))
+		rtwsdio->tx_agg_buf = kmalloc(RTW_SDIO_TX_AGG_MAX_SIZE +
+					      RTW_SDIO_BLOCK_SIZE, GFP_KERNEL);
+
 	for (i = 0; i < RTK_MAX_TX_QUEUE_NUM; i++) {
 		skb_queue_head_init(&rtwsdio->tx_queue[i]);
 		rtwsdio->tx_queue_stopped[i] = false;
@@ -1892,6 +2057,7 @@ static int rtw_sdio_init_tx(struct rtw_dev *rtwdev)
 	return 0;
 
 err_destroy_wq:
+	kfree(rtwsdio->tx_agg_buf);
 	mutex_destroy(&rtwsdio->tx_credit_lock);
 	destroy_workqueue(rtwsdio->txwq);
 	return -ENOMEM;
@@ -1909,6 +2075,7 @@ static void rtw_sdio_deinit_tx(struct rtw_dev *rtwdev)
 	for (i = 0; i < RTK_MAX_TX_QUEUE_NUM; i++)
 		ieee80211_purge_tx_queue(rtwdev->hw, &rtwsdio->tx_queue[i]);
 
+	kfree(rtwsdio->tx_agg_buf);
 	mutex_destroy(&rtwsdio->tx_credit_lock);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
index 57890533eec..ab366f82d92 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.h
+++ b/drivers/net/wireless/realtek/rtw88/sdio.h
@@ -148,6 +148,10 @@
 
 #define RTW_SDIO_DATA_PTR_ALIGN			8
 
+/* TX aggregation of the 88xx chips: at most this much per transfer */
+#define RTW_SDIO_TX_AGG_MAX_SIZE		(20 * 1024)
+#define RTW_SDIO_TX_AGG_MAX_NUM			32
+
 struct sdio_func;
 struct sdio_device_id;
 
@@ -182,6 +186,8 @@ struct rtw_sdio {
 	atomic_t tx_oqt_free;
 	/* the non-8051 chips' counters hold what the chip last reported */
 	bool free_txpg_valid;
+	/* TX aggregation buffer of the non-8051 chips, under tx_credit_lock */
+	u8 *tx_agg_buf;
 	/* one writer at a time between the credit check and the accounting */
 	struct mutex tx_credit_lock;
 };
-- 
2.47.3

