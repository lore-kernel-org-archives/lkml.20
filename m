Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855724;
	b=09hm1mw33JywYUMsiFYUl/H3KAL8xwXJs/R4PJXr6TGA95pq5W20gEFFOrtmVTnVNejm
	 7gbtRVaD5kDcn5WL3WSKfUC9hPzP6gUI2/6MK2cu4M2/0IgDW8vhbFPrvpHyqzKE4f9ed
	 LUkiP3wJbrMJkLIK+uZOZODyJNUhxAjRyPXVlt56VWJyA2jZhnyLT6/Nk4gf5RGX7raPO
	 6rocXdzmL6LZ6/tRJgzFj221kxUE3k1tyZuBXmaWefjnfWQ0zANGCASTTlza4RXucNC30
	 cKaO+IIw4rM+nwusma6R0Sw+sbdOl5KkVfIuPmIX/YXgHVFS75R+ETapDjlJPZR21WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855724;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1+7m8ua3cdXSuAoLDTAht0hPqxChRLxyoSLx51/ivpA=;
	b=J6Uo3W71jQu4lSIZkvPcLzfU9PZiIV0PrtZPlj63gWjGUCttmj1tFZpBb8zZP0V3IO7S
	 Q1hhjbAC0FACmVq1NfWUG8udXIglWektMJX8CVa8YOiTVzZh6r+kZSonhr+gOI391DEEZ
	 4h3w71D/XEwssW0cwKDw0dpPkBJh2taFglGhtVeqdTSQwdUhUOCSnonPMdKM1OsJKlZKM
	 KD55rPsLQsQ2tV+W+O3/M6WC4zAahZBCEWIdu9I9PV75kJRbsBap2ZhMnlP1F95Knv4M2
	 xzOhGpUEbEvgTA3ws0vMJXDtUESVuiDiCk0ivJ9TF9Aa7hmb0TfYWLdP/GAwHMA379g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC21606A32C;
	Mon, 16 Nov 2026 19:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC21606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jSy086DBzzFq0p;
	Mon, 16 Nov 2026 20:02:00 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794855721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+7m8ua3cdXSuAoLDTAht0hPqxChRLxyoSLx51/ivpA=;
	b=U/z5Az3q3n5DO5ZHCudFnOL/5PT23j4O/mFXtIQtbVZd4IWjqjSdbwAQGINM/u4kROrWGL
	MvCDTuSJ5jdI7WAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794855721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+7m8ua3cdXSuAoLDTAht0hPqxChRLxyoSLx51/ivpA=;
	b=UTcXzTq9woMFFsVvnuYuSaf+YSK34t2tgPWsUnQ/COXA0JWJU0r9qBKfFtsgXyyF2YQYZx
	IXzygxAnrEgJHsk3RzhRn9mEnCJsIUeokta15xjUJ1VRERXOKgqhJgK7YPsVApFk79DxGJ
	cJsjwoD4GKgPC+Ay8qP8fM00rqWGzw2A7+11CligGa1ruV6xJcometP1r/w9xfB/dEbr38
	gFuB/85n9xVfOnut2ayDLen5gMtbuPEnLvs2stUBuqYZG3FrzLf9K+o+fqvNHyeIXMQZaw
	WzMcJidMlklSVZ5TfObrhYlnhHyr/yWXnDEByDsDrlEjFW78j/24L2Qbg4pWDg==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id D2XPMChT+2oF9CgAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Mon, 16 Nov 2026 20:02:00 +0100
Received: (nullmailer pid 2736570 invoked by uid 2002000001);
	Mon, 16 Nov 2026 19:01:58 -0000
From: =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
To: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, =?UTF-8?q?David=20H=C3=A4rdeman?= <david@hardeman.nu>
Subject: [PATCH rtw-next 3/5] wifi: rtw88: sdio: limit the TX queue length of the 88xx chips
Date: Mon, 16 Nov 2026 20:01:43 +0100
Message-ID: <20261116190145.2736364-4-david@hardeman.nu>
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

The TX path pulls every frame mac80211 has queued into its own per-queue
FIFO, and only the RTL8723BS stops the mac80211 queues when that FIFO
grows. On the 88xx chips the FIFO is unbounded: the backlog builds up
there instead of in mac80211, where fq_codel would keep it short and
schedule it fairly between flows. On a NanoPi R76S (RTL8822CS) acting as
an AP, the round trip time to a client goes up to more than a second
during a single TCP download.

Stop the mac80211 queue of an access category above 64 frames in its
FIFO and wake it again below 32, as is done for the RTL8723BS with lower
watermarks. The 88xx chips send up to 32 frames per transfer and need
the deeper FIFO to keep doing that. Also wake the queue after an
aggregate is sent, which the single frame path already does.

A stopped queue is handed no further frames, so nothing would kick the
TX work again if the chip stayed full for its whole retry loop. Requeue
the work after a jiffy in that case, as the RTL8723BS path does.

With this, the round trip time during a download stays at about 12-30
ms on average (100-570 ms at most, mostly from the client), and the
download throughput is unchanged at about 190-215 Mbit/s.

Signed-off-by: David Härdeman <david@hardeman.nu>
---
 drivers/net/wireless/realtek/rtw88/sdio.c | 77 +++++++++++++++++++----
 1 file changed, 64 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index 17a4c3037d7..cced6fdfa6d 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -22,9 +22,16 @@
 #define RTW_SDIO_INDIRECT_RW_RETRIES			50
 #define RTW_SDIO_OQT_TIMEOUT_MS				1000
 
-/* Bounds the queueing latency of the unbounded per-AC software FIFO. */
+/*
+ * Bound the queueing latency of the per-AC software FIFO, so that the
+ * backlog stays in mac80211, where it is scheduled fairly between flows and
+ * stations. The 88xx chips send up to RTW_SDIO_TX_AGG_MAX_NUM frames per
+ * transfer and need a deeper FIFO to keep doing that.
+ */
 #define RTW_SDIO_TX_FIFO_HIWATER			16
 #define RTW_SDIO_TX_FIFO_LOWATER			8
+#define RTW_SDIO_88XX_TX_FIFO_HIWATER			64
+#define RTW_SDIO_88XX_TX_FIFO_LOWATER			32
 #define RTW_SDIO_TX_RETRY_DELAY			msecs_to_jiffies(1)
 
 static bool rtw_sdio_is_bus_addr(u32 addr)
@@ -1391,19 +1398,43 @@ static int rtw_sdio_write_data_h2c(struct rtw_dev *rtwdev, u8 *buf, u32 size)
 	return rtw_sdio_write_data(rtwdev, &pkt_info, skb, RTW_TX_QUEUE_H2C);
 }
 
+static bool rtw_sdio_tx_queue_limited(struct rtw_dev *rtwdev,
+				      enum rtw_tx_queue_type queue)
+{
+	if (queue >= RTW_TX_QUEUE_BCN)
+		return false;
+
+	return rtw_is_8723bs(rtwdev) || !rtw_chip_wcpu_8051(rtwdev);
+}
+
+static u32 rtw_sdio_tx_fifo_hiwater(struct rtw_dev *rtwdev)
+{
+	if (rtw_chip_wcpu_8051(rtwdev))
+		return RTW_SDIO_TX_FIFO_HIWATER;
+
+	return RTW_SDIO_88XX_TX_FIFO_HIWATER;
+}
+
+static u32 rtw_sdio_tx_fifo_lowater(struct rtw_dev *rtwdev)
+{
+	if (rtw_chip_wcpu_8051(rtwdev))
+		return RTW_SDIO_TX_FIFO_LOWATER;
+
+	return RTW_SDIO_88XX_TX_FIFO_LOWATER;
+}
+
 /*
  * Both this and the wake below hold the TX queue lock across the length check
  * and the flag update, so a queue is only ever stopped while it really is
  * above the watermark, and the drain path always sees the flag the producer
  * set.
  */
-static void rtw_sdio_8723bs_stop_tx_queue(struct rtw_dev *rtwdev,
-					  enum rtw_tx_queue_type queue,
-					  u16 q_map)
+static void rtw_sdio_stop_tx_queue(struct rtw_dev *rtwdev,
+				   enum rtw_tx_queue_type queue, u16 q_map)
 {
 	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
 
-	if (!rtw_is_8723bs(rtwdev) || queue >= RTW_TX_QUEUE_BCN)
+	if (!rtw_sdio_tx_queue_limited(rtwdev, queue))
 		return;
 
 	guard(spinlock_irqsave)(&rtwsdio->tx_queue[queue].lock);
@@ -1411,20 +1442,20 @@ static void rtw_sdio_8723bs_stop_tx_queue(struct rtw_dev *rtwdev,
 	if (rtwsdio->tx_queue_stopped[queue])
 		return;
 
-	if (skb_queue_len(&rtwsdio->tx_queue[queue]) < RTW_SDIO_TX_FIFO_HIWATER)
+	if (skb_queue_len(&rtwsdio->tx_queue[queue]) <
+	    rtw_sdio_tx_fifo_hiwater(rtwdev))
 		return;
 
 	rtwsdio->tx_queue_stopped[queue] = true;
 	ieee80211_stop_queue(rtwdev->hw, q_map);
 }
 
-static void rtw_sdio_8723bs_wake_tx_queue(struct rtw_dev *rtwdev,
-					  enum rtw_tx_queue_type queue,
-					  u16 q_map)
+static void rtw_sdio_wake_tx_queue(struct rtw_dev *rtwdev,
+				   enum rtw_tx_queue_type queue, u16 q_map)
 {
 	struct rtw_sdio *rtwsdio = (struct rtw_sdio *)rtwdev->priv;
 
-	if (!rtw_is_8723bs(rtwdev) || queue >= RTW_TX_QUEUE_BCN)
+	if (!rtw_sdio_tx_queue_limited(rtwdev, queue))
 		return;
 
 	guard(spinlock_irqsave)(&rtwsdio->tx_queue[queue].lock);
@@ -1432,7 +1463,8 @@ static void rtw_sdio_8723bs_wake_tx_queue(struct rtw_dev *rtwdev,
 	if (!rtwsdio->tx_queue_stopped[queue])
 		return;
 
-	if (skb_queue_len(&rtwsdio->tx_queue[queue]) > RTW_SDIO_TX_FIFO_LOWATER)
+	if (skb_queue_len(&rtwsdio->tx_queue[queue]) >
+	    rtw_sdio_tx_fifo_lowater(rtwdev))
 		return;
 
 	rtwsdio->tx_queue_stopped[queue] = false;
@@ -1456,7 +1488,7 @@ static int rtw_sdio_tx_write(struct rtw_dev *rtwdev,
 	/* The TX worker may already have freed the skb, so do not touch it. */
 	skb_queue_tail(&rtwsdio->tx_queue[queue], skb);
 
-	rtw_sdio_8723bs_stop_tx_queue(rtwdev, queue, q_map);
+	rtw_sdio_stop_tx_queue(rtwdev, queue, q_map);
 
 	return 0;
 }
@@ -1820,6 +1852,7 @@ static int rtw_sdio_process_tx_agg(struct rtw_dev *rtwdev,
 	struct sk_buff *skb;
 	u8 ac = U8_MAX;
 	u32 txaddr;
+	u16 q_map;
 	int ret;
 
 	__skb_queue_head_init(&agg);
@@ -1895,9 +1928,14 @@ static int rtw_sdio_process_tx_agg(struct rtw_dev *rtwdev,
 
 	mutex_unlock(&rtwsdio->tx_credit_lock);
 
+	/* all frames are of the same AC, and the skbs are consumed below */
+	q_map = skb_get_queue_mapping(skb_peek(&agg));
+
 	while ((skb = __skb_dequeue(&agg)))
 		rtw_sdio_indicate_tx_status(rtwdev, skb);
 
+	rtw_sdio_wake_tx_queue(rtwdev, queue, q_map);
+
 	return 0;
 
 err_requeue:
@@ -1944,7 +1982,7 @@ static int rtw_sdio_process_tx_queue(struct rtw_dev *rtwdev,
 
 	rtw_sdio_indicate_tx_status(rtwdev, skb);
 
-	rtw_sdio_8723bs_wake_tx_queue(rtwdev, queue, q_map);
+	rtw_sdio_wake_tx_queue(rtwdev, queue, q_map);
 
 	return 0;
 }
@@ -1990,6 +2028,7 @@ static void rtw_sdio_tx_handler(struct work_struct *work)
 	struct rtw_sdio *rtwsdio;
 	struct rtw_dev *rtwdev;
 	int limit, queue, ret;
+	bool resched = false;
 
 	rtwdev = work_data->rtwdev;
 	rtwsdio = (struct rtw_sdio *)rtwdev->priv;
@@ -2010,7 +2049,19 @@ static void rtw_sdio_tx_handler(struct work_struct *work)
 			if (skb_queue_empty(&rtwsdio->tx_queue[queue]))
 				break;
 		}
+
+		/*
+		 * A stopped queue is handed no further frames, so nothing
+		 * else would kick this work item if the chip stayed full for
+		 * the whole loop.
+		 */
+		if (ret == -EBUSY && !rtw_chip_wcpu_8051(rtwdev))
+			resched = true;
 	}
+
+	if (resched)
+		queue_delayed_work(rtwsdio->txwq, &work_data->work,
+				   RTW_SDIO_TX_RETRY_DELAY);
 }
 
 static void rtw_sdio_free_irq(struct rtw_dev *rtwdev,
-- 
2.47.3

