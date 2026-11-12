Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502002;
	b=aIClw4XGFgs3hijVZRfoG9IE9PIsePud0TjAFTNK51ZV5HUkLBfQyZCYhkAYmXVKY46q
	 bTHsARYeGQlYX2TBXopPAyF5gGOg3R6eSw++ebcIaUg0Q9Ihcyn0UHclfcHwdN62vzovA
	 RwdwtkidEaurH/gXJxwYuLy0eDu1fIRAZdjY60E55+a3vmEq6izP4jjixmiTMPcLai9o5
	 N7o5+YAB60ZknC1dm8dI9fJuIRJiX90tncnI8EtoO8GPOS6rEesh9yeQQQNpEhyqISlWs
	 eBUonBxT/TEGkdEXfX4cKha0t10OWnAIU8ncR6bCJWt9x3c0WjcNEpdATAW6zruBs2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8ta6z27u8peSSt/lY40ST0jGo2ndF4PI28VpJFYCRxE=;
	b=XibcMuudrnZN0Gof8QK86XFHgkhu1YIsi99EoCVGUK1RavzmWf2iSuKlsTby8nPgkqBi
	 koIgd6IeFiWr+vQR4dUQTG+G3i2Oi3EASaJsI3bdjewwO87roXJzIAx3oEsfIIKrIOAq7
	 86oxYT8qpIZw8yPIiYyS2YUumgJztrFsR+8nsIJaaAkygyHirv1JTVDXUWdwa64uwrgBQ
	 kFcnnDkOqnuTzGEIJJ/3LqGtGPvql1MYgS7XQmYl+2vInKrzKY1gCoTTCzm5uB2IXrXLR
	 6UyJ7+ELsCmWTensgjWdaYClQBihIkXJgkg1hZI+4KHV0j2l2Qu5yS/owOkKsyvI0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxD0Jq9D;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15285606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15285606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxD0Jq9D
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1aefd1bf74aso14358c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502001; x=1795106801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ta6z27u8peSSt/lY40ST0jGo2ndF4PI28VpJFYCRxE=;
        b=MxD0Jq9DO9ouHSvfsFJ7aC987hgsLKY6IoGYhYxocG3/5DJWWtzX+tSaqLcorBnVSD
         wPv2YDjYCBZlYzYtPpDXcUjbYlpK1PAmR5+5GmIDSbuRraG4U2pO0iYcJ/SdRn5aO0d7
         R1J9qS5cuxmV9Ql+L+gmszHXHtunL7xdO1/zKehLgE3QCFXlb6RSl3OOgA4kfEfSFRCW
         DLckACnA2Z7TWLvUcHJx7jiiqlX7PeEW9jRBizj6D86CKMdsSTvSYSWvQWIoPgOB1Pw8
         OF5UkTaFTfsjn89VVnpjv/NO1NHh2z/w1kbu1hCsqqPnKbDnC62ObhLeMMmnwNuPKSRe
         FtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502001; x=1795106801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ta6z27u8peSSt/lY40ST0jGo2ndF4PI28VpJFYCRxE=;
        b=f4pECYOxUj7E/2AkGcLscsU9Y9oghc2fMrcKVyy1L95bj231Ruc3bePdCi5THt3I96
         zDESkC36YGCN+Y4+07nYsF8EUQhlMAjs+9oETgctf53t0PlkV4cAfyEh9YJlUozwbAg4
         ZFxcoOpkP+vZJXouY+g9ux3AE+Amk6zk5kOrd4pXPbd/uyX1FwAktLNgDI5YUNA8XO+O
         RCHKKtcCV431eout/xCthIGpzMPNzth94QaNuEUSWr0lzagDwdjznWabL3TYhfZPohX9
         weqTnWp7Pqbe7G/1NmT8VNE4YjQ912OMXR0GovMnzFEEkcIGJzK50hrJc3r2X4DvNWmm
         wBsw==
X-Forwarded-Encrypted: i=1; AL+hErGFNMZTMAsMTcAXaBGAwy+Si8FnfuSj8djT+NppOrcCJTCV5tdXd7eoEfdi2Z0eJr/hgj48dSrJvvz+vJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L2j+PQyf8jt18ayyqflbvBRbTfm111TAnmE3E8j7xMD0+az0/
	h4dReE7RZJq5aHjY6veZWE15GymQTncNNX/RDuyjpKuiei5jwW9TPb1f
X-Gm-Gg: AYBFou0uYUrJEkFm+4AHwD4tZWxxlu+WL1CliT0KJoxIhfXMAa9BcBZcKL4LJ4uMrmC
	VvRCPPDe4Ij0PR/AyCNGxlPIBZ7402YU0DhenbcjK80Xku8k4MhJAqCCbNlz0h9Kir6itmd/RQk
	1g7tBOKAB8S+zy51xYKtCtyleXAJNjkyUlUFwjmUFAHZgeY5aV109uUJ8CfkBGUUvy4yRnO+w7Q
	h40bOckEf/fnNwfZ5WGyu36EiDaUtQD7Xh2CnObDQoIBui3aUbK2BnnLncZMYlkI+FU1l9wX03Z
	AYAkbILAiPPBWsS1GnAMEmnMq1wBbmqDSJhim0AFtr9+Ub+3cc9U40MKsHpvCqOG+g/r8/638DR
	+nH2pCp3l+fgk4npSw41QJWv5x6dL5B8dc4rdzAByzC1PLj+qZtY6Or9/rKS1DCBcH4u980haw2
	n20pu2jBVcSLfuyBXy5sh+HW3sZp42MEBbUB820Bz4TE6yxG03aB4jJ8NBxkoasrTBcQseEuIwH
	FaVFGtZB03WhP4vEUct1b5mWBvphUiqqtyn8gC1dRIaR9/ZrPY+tntEn7UZ4cBtvhql6PMtw8WP
	u80HXO1lN0tmbA9lqEFLPdeaTYMOiqEyO09vbMZKF92gdSzxx0uHRzanCB/y48hbZhi9whioIBg
	kmyPuH7aDw6tOc13G3biMpczTulE/HdE1KtJxcROy7e5XWg==
X-Received: by 2002:a05:7022:ea8d:b0:145:ac96:3917 with SMTP id a92af1059eb24-1b4f5f734bamr2615650c88.21.1794502000878;
        Thu, 12 Nov 2026 08:46:40 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:39 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 5/7] wifi: rt2800usb: enable RX bulk aggregation
Date: Fri, 13 Nov 2026 00:45:39 +0800
Message-ID: <20261112164544.3176458-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

Enable RX bulk aggregation on high speed USB, to receive more
frames per URB.

RX buffers are now 24KB, so reduce it to 16 buffers instead of 128,
so that they take 512 KB in total instead of 4 MB.

Test results:
   before after
TX 30.5   30.5
RX 67.8   80.9

This code references the mt7601u driver.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../net/wireless/ralink/rt2x00/rt2800usb.c    | 32 +++++--
 .../net/wireless/ralink/rt2x00/rt2800usb.h    |  6 ++
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   |  3 +-
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 84 +++++++++++++------
 .../net/wireless/ralink/rt2x00/rt2x00mmio.c   |  2 +-
 .../net/wireless/ralink/rt2x00/rt2x00usb.c    |  5 +-
 6 files changed, 100 insertions(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
index 387c07e225..be58d72105 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
@@ -301,15 +301,15 @@ static int rt2800usb_enable_radio(struct rt2x00_dev *rt2x00dev)
 		return -EIO;
 
 	rt2x00_set_field32(&reg, USB_DMA_CFG_PHY_CLEAR, 0);
-	rt2x00_set_field32(&reg, USB_DMA_CFG_RX_BULK_AGG_EN, 0);
+	rt2x00_set_field32(&reg, USB_DMA_CFG_RX_BULK_AGG_EN,
+			   rt2x00dev->rx->usb_maxpacket >= 512);
 	rt2x00_set_field32(&reg, USB_DMA_CFG_RX_BULK_AGG_TIMEOUT, 128);
 	/*
 	 * Total room for RX frames in kilobytes, PBF might still exceed
 	 * this limit so reduce the number to prevent errors.
 	 */
 	rt2x00_set_field32(&reg, USB_DMA_CFG_RX_BULK_AGG_LIMIT,
-			   ((rt2x00dev->rx->limit * DATA_FRAME_SIZE)
-			    / 1024) - 3);
+			   (rt2x00dev->rx->data_size / 1024) - 4);
 	rt2x00_set_field32(&reg, USB_DMA_CFG_RX_BULK_EN, 1);
 	rt2x00_set_field32(&reg, USB_DMA_CFG_TX_BULK_EN, 1);
 	rt2x00usb_register_write(rt2x00dev, USB_DMA_CFG, reg);
@@ -478,6 +478,27 @@ static void rt2800usb_work_txdone(struct work_struct *work)
 /*
  * RX control handlers
  */
+static unsigned int rt2800usb_get_rx_seg_len(void *data, unsigned int len)
+{
+	unsigned int min_seg_len = RXINFO_DESC_SIZE + RXWI_DESC_SIZE_4WORDS +
+				   RXD_DESC_SIZE;
+	unsigned int rx_pkt_len;
+	u32 word;
+
+	if (len < min_seg_len)
+		return 0;
+
+	word = rt2x00_desc_read(data, 0);
+	rx_pkt_len = rt2x00_get_field32(word, RXINFO_W0_USB_DMA_RX_PKT_LEN);
+
+	if (WARN_ON_ONCE(RXINFO_DESC_SIZE + rx_pkt_len + RXD_DESC_SIZE > len) ||
+	    WARN_ON_ONCE(rx_pkt_len & 0x3) ||
+	    WARN_ON_ONCE(rx_pkt_len < min_seg_len))
+		return 0;
+
+	return RXINFO_DESC_SIZE + rx_pkt_len + RXD_DESC_SIZE;
+}
+
 static void rt2800usb_fill_rxdone(struct queue_entry *entry,
 				  struct rxdone_entry_desc *rxdesc)
 {
@@ -706,6 +727,7 @@ static const struct rt2x00lib_ops rt2800usb_rt2x00_ops = {
 	.clear_beacon		= rt2800_clear_beacon,
 	.get_tx_data_len	= rt2800usb_get_tx_data_len,
 	.fill_rxdone		= rt2800usb_fill_rxdone,
+	.get_rx_seg_len		= rt2800usb_get_rx_seg_len,
 	.config_shared_key	= rt2800_config_shared_key,
 	.config_pairwise_key	= rt2800_config_pairwise_key,
 	.config_filter		= rt2800_config_filter,
@@ -725,8 +747,8 @@ static void rt2800usb_queue_init(struct data_queue *queue)
 
 	switch (queue->qid) {
 	case QID_RX:
-		queue->limit = 128;
-		queue->data_size = AGGREGATION_SIZE;
+		queue->limit = 16;
+		queue->data_size = MAX_RXBULK_SIZE;
 		queue->desc_size = RXINFO_DESC_SIZE;
 		queue->winfo_size = rxwi_size;
 		queue->priv_size = sizeof(struct queue_entry_priv_usb);
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800usb.h b/drivers/net/wireless/ralink/rt2x00/rt2800usb.h
index 9e180e9e41..2fae79072f 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800usb.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800usb.h
@@ -29,6 +29,12 @@
  */
 #define TXINFO_DESC_SIZE		(1 * sizeof(__le32))
 #define RXINFO_DESC_SIZE		(1 * sizeof(__le32))
+#define RXD_DESC_SIZE			(1 * sizeof(__le32))
+
+/*
+ * RX buffer size
+ */
+#define MAX_RXBULK_SIZE			24576
 
 /*
  * TX Info structure
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00.h b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
index ace06ba73d..7b1a32d3e1 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
@@ -600,6 +600,7 @@ struct rt2x00lib_ops {
 	 */
 	void (*fill_rxdone) (struct queue_entry *entry,
 			     struct rxdone_entry_desc *rxdesc);
+	unsigned int (*get_rx_seg_len) (void *data, unsigned int len);
 
 	/*
 	 * Configuration handlers.
@@ -1460,7 +1461,7 @@ void rt2x00lib_txdone(struct queue_entry *entry,
 void rt2x00lib_txdone_nomatch(struct queue_entry *entry,
 			      struct txdone_entry_desc *txdesc);
 void rt2x00lib_txdone_noinfo(struct queue_entry *entry, u32 status);
-void rt2x00lib_rxdone(struct queue_entry *entry, gfp_t gfp);
+void rt2x00lib_rxdone(struct queue_entry *entry, unsigned int len, gfp_t gfp);
 
 /*
  * mac80211 handlers.
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index baf5d039bc..dc6a7d12b2 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -765,35 +765,14 @@ static int rt2x00lib_rxdone_read_signal(struct rt2x00_dev *rt2x00dev,
 	return 0;
 }
 
-void rt2x00lib_rxdone(struct queue_entry *entry, gfp_t gfp)
+static void rt2x00lib_rxdone_skb(struct queue_entry *entry)
 {
 	struct rt2x00_dev *rt2x00dev = entry->queue->rt2x00dev;
 	struct rxdone_entry_desc rxdesc;
-	struct sk_buff *skb;
 	struct ieee80211_rx_status *rx_status;
 	unsigned int header_length;
 	int rate_idx;
 
-	if (!test_bit(DEVICE_STATE_PRESENT, &rt2x00dev->flags) ||
-	    !test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
-		goto submit_entry;
-
-	if (test_bit(ENTRY_DATA_IO_FAILED, &entry->flags))
-		goto submit_entry;
-
-	/*
-	 * Allocate a new sk_buffer. If no new buffer available, drop the
-	 * received frame and reuse the existing buffer.
-	 */
-	skb = rt2x00queue_alloc_rxskb(entry, gfp);
-	if (!skb)
-		goto submit_entry;
-
-	/*
-	 * Unmap the skb.
-	 */
-	rt2x00queue_unmap_skb(entry);
-
 	/*
 	 * Extract the RXD details.
 	 */
@@ -809,7 +788,7 @@ void rt2x00lib_rxdone(struct queue_entry *entry, gfp_t gfp)
 		rt2x00_err(rt2x00dev, "Wrong frame size %d max %d\n",
 			   rxdesc.size, entry->queue->data_size);
 		dev_kfree_skb(entry->skb);
-		goto renew_skb;
+		return;
 	}
 
 	/*
@@ -893,8 +872,65 @@ void rt2x00lib_rxdone(struct queue_entry *entry, gfp_t gfp)
 	rx_status->antenna = rt2x00dev->link.ant.active.rx;
 
 	ieee80211_rx_ni(rt2x00dev->hw, entry->skb);
+}
+
+void rt2x00lib_rxdone(struct queue_entry *entry, unsigned int len, gfp_t gfp)
+{
+	struct rt2x00_dev *rt2x00dev = entry->queue->rt2x00dev;
+	struct skb_frame_desc *skbdesc, *frame_skbdesc;
+	struct sk_buff *skb;
+	unsigned int seg_len;
+	u8 *data;
+
+	if (!test_bit(DEVICE_STATE_PRESENT, &rt2x00dev->flags) ||
+	    !test_bit(DEVICE_STATE_ENABLED_RADIO, &rt2x00dev->flags))
+		goto submit_entry;
+
+	if (test_bit(ENTRY_DATA_IO_FAILED, &entry->flags))
+		goto submit_entry;
+
+	if (rt2x00dev->ops->lib->get_rx_seg_len) {
+		skb = entry->skb;
+		skbdesc = get_skb_frame_desc(skb);
+		data = skb->data;
+
+		while ((seg_len = rt2x00dev->ops->lib->get_rx_seg_len(data, len))) {
+			entry->skb = __dev_alloc_skb(seg_len, gfp);
+			if (!entry->skb)
+				break;
+
+			skb_put_data(entry->skb, data, seg_len);
+
+			frame_skbdesc = get_skb_frame_desc(entry->skb);
+			memset(frame_skbdesc, 0, sizeof(*frame_skbdesc));
+			frame_skbdesc->desc = skbdesc->desc;
+			frame_skbdesc->desc_len = skbdesc->desc_len;
+
+			rt2x00lib_rxdone_skb(entry);
+
+			data += seg_len;
+			len -= seg_len;
+		}
+
+		entry->skb = skb;
+		goto submit_entry;
+	}
+
+	/*
+	 * Allocate a new sk_buffer. If no new buffer available, drop the
+	 * received frame and reuse the existing buffer.
+	 */
+	skb = rt2x00queue_alloc_rxskb(entry, gfp);
+	if (!skb)
+		goto submit_entry;
+
+	/*
+	 * Unmap the skb.
+	 */
+	rt2x00queue_unmap_skb(entry);
+
+	rt2x00lib_rxdone_skb(entry);
 
-renew_skb:
 	/*
 	 * Replace the skb with the freshly allocated one.
 	 */
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00mmio.c b/drivers/net/wireless/ralink/rt2x00/rt2x00mmio.c
index 93f76acf3d..a1d8b8d13d 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00mmio.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00mmio.c
@@ -78,7 +78,7 @@ bool rt2x00mmio_rxdone(struct rt2x00_dev *rt2x00dev)
 		/*
 		 * Send the frame to rt2x00lib for further processing.
 		 */
-		rt2x00lib_rxdone(entry, GFP_ATOMIC);
+		rt2x00lib_rxdone(entry, entry->skb->len, GFP_ATOMIC);
 	}
 
 	return !max_rx;
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index c9fbc3710f..4519a20a7f 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -345,6 +345,7 @@ static void rt2x00usb_work_rxdone(struct work_struct *work)
 {
 	struct rt2x00_dev *rt2x00dev =
 	    container_of(work, struct rt2x00_dev, rxdone_work);
+	struct queue_entry_priv_usb *entry_priv;
 	struct queue_entry *entry;
 	struct skb_frame_desc *skbdesc;
 	u8 rxd[32];
@@ -365,7 +366,9 @@ static void rt2x00usb_work_rxdone(struct work_struct *work)
 		/*
 		 * Send the frame to rt2x00lib for further processing.
 		 */
-		rt2x00lib_rxdone(entry, GFP_KERNEL);
+		entry_priv = entry->priv_data;
+		rt2x00lib_rxdone(entry, entry_priv->urb->actual_length,
+				 GFP_KERNEL);
 	}
 }
 
-- 
2.53.0

