Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502015;
	b=xIjJZuxZl+JqAK3UpVEbQFpEy6LoA4QQtX+K4yjMpk0GjhF1nUw28qt/jZ+cKcWfjGD6
	 j63ufBQf4rUoY/jxpQwGhTBTycjzG6Q48bYN+q++isWzy+M10SIBEu8X4fFdKZbC07Amv
	 h9gxsqWcaQ6BiT5+D4/tkjE/KLKIQjW7RX5B3avso/uJgMu8gEEmAnbJLpb2fg12bnp5v
	 /U+LEtPJEwdr8Wb/mghsqBbTqYL3WPP3Pj54rQ7viK4kjLw87hB7Xr4NMJEUn70rngidI
	 BGbXG7S29sbDypNXne4EsSvR1mvgRVuRNKLcmCYSSkZQJkCMUipFVXs4dl+bJgMDDUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S8wdNbtrbubg70W0ODPEMV8st9QdJj+0fwZLV1CeKUo=;
	b=0vPG4I9+KM6mmvhoDLS+iRRhh62/k/UA2g7LdCSkGkub9iOkSYlMU2hxsNPi5Jv/m39M
	 YrWwBoxZBZ2ig7YVBHU7fEOy0fAdpE1vWP96mfbp4iKFBtWpTgkfDUoQ3L5ZxJM8/uStz
	 w2jhuMuYhMW6uEUDOhoJSkGSbWr1/8nmkg/qV2B7rSZqPJLklmtl8lgcyZ25TLlzpntcg
	 7oIQQy1DImWMC85weiMZ5T8rE1A5rYKVUn8tx/jTZfELU8eiJa/xpDSNfWQt+BPbNFtFn
	 K33jrguRfiqIXTH3HGNgr3Kg8htX1t/B0witFxFdAhgjNf7gh1NiNMnNe6zphxModNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KFb/SmIA";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51AC606A8B3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51AC606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KFb/SmIA
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18818daa3e7so521658c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502014; x=1795106814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8wdNbtrbubg70W0ODPEMV8st9QdJj+0fwZLV1CeKUo=;
        b=KFb/SmIAv9EBqYiQRHEZ9ZmYR7/oE1c09ISsP0C2VEmnObyQ75cu77pASajrz4vYZ+
         DANGyxrkk2milY8otQd1Uf4YDlhgioa11U+vZ9X2xsuHcRFndzTj9xDfTEseUgROlb3O
         8w+ERKl5eou0EfPXz7/6tIbIL/bsBcdImk/SwC+IqBvHXKCFlU28WBMAAnfuy5cGlBB8
         UEmPRPILBNcFNes4j3hGboeM8BHM7Ou1h8AO9OEAHapcjzznSKmCSYa1jez1P79qFiK8
         qJvhwWOYaScsxNfAXmKsZ4rRbXGsp6G4yIAWzfmOv0AzURiDrYPQMw03Ve/lUH+5u6xg
         MHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502014; x=1795106814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8wdNbtrbubg70W0ODPEMV8st9QdJj+0fwZLV1CeKUo=;
        b=PcwCCLZJ8HLs98/ltpaltCTUtg/vUfixo9TGGug7ExiHdDZSJhJHeR3il+GWvYYgHO
         JqszzLCakBfCMpayMZ+2ekiaRE3JeQFvDKOVSv6Wxw4MM9s1FsvCSnTLcOFEJX4Zfvte
         Sd5D+xbVINpl5UjIYlrMOobjkP30C6JkkZVZhFZeUu/RHi/G7oHStzw/o6aN1l4u2QpM
         pXRsQM2uEuu2z5YNaICx+8HGFpRjZq3DCPfUd5cj7BAh30bhuASTCBA4q0HXUUYWzWn5
         siXCqInsBcoeSGJt+T5BWyE3PB/PSBzNu/S/7/eYbosA9eWaeEloREfuCUP7LCDrBas/
         jqrg==
X-Forwarded-Encrypted: i=1; AL+hErFoEjrACYrKToNPrI4mL2wC0UBbHwYYMsn29JtX/rXx1zsHqhruuF6s/KyKWA0ro0F5rRHGnsBNHs/8H3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5TCMZJUyQC2+gRE1yHXa2ij5k+hnOTx8QwEgJaXEkFJWOBSOH
	mo1UTq1cO+RP75SvZHfzh4ih7hCB8HjWb93XKdJAEstPvwYbp3C55xCB
X-Gm-Gg: AYBFou2Ruqe/qufy4fbDTbEvg/LMV1EZCSXRb6Z/QrNex3EIdI7NzPee82gBI4mOpfZ
	+MaM1LET9X6usCzZz5WNcIrgQ6hlwVqggVRgnOwYzJF3rApt+j1GnzFwp7On1mkAR9CQlE6yAX6
	nZ670m3LL2+oseSoK22pZX+y+cx6qPH+YBXdm0b8QkyoTA9ZKKce11Ha1fuWZWau3yJTfCYCzdA
	RbhkJo3sbq+iZa5fnHvol5cbkjmULIrOMnIRY6UJ5pncpae2fjOKFCsY+StZID5WuoinAZISp4J
	susm436u6g/ydGLMdBs01q31G0NSaVQOUWF01ypwlocFftVzRDsHDbH+Hhj4hKEGYPyjTzyLTIJ
	CWQ5q9cvPV8kZz4sXZT2xN3j7jrAl5Lqfan4pndgyv3SY6ejEQ90RRZCKvldSFRlks2jlmpOYcJ
	lfstz1BRjlE0HZlTuR5Q7NQAGkqw3EUpXhKTVCoufuo5T+pmXCupjMbTB2jUR2x/jHc2kUQ3P6A
	M2FP8owziE7VMxaw09KT5Eu+zD/rc7vnFAtW72UXwa0ByW9RSMH8KZMF3re+OMUDk5u/iJV/Yry
	ZkARce+ajv9AFnDW4wO427sRaK5niymIsfJNp5ROpy2bDS6dYzlaU005RkpFfGGrhan3jdxbfKX
	dYHzB+QJN26a4p9zKgVYWQtvYplVtSdCmefnMwNISOcGW
X-Received: by 2002:a05:701b:4648:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1b502f8a3femr141571c88.0.1794502013924;
        Thu, 12 Nov 2026 08:46:53 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:53 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 7/7] wifi: rt2x00usb: use a threaded NAPI with GRO for RX
Date: Fri, 13 Nov 2026 00:45:41 +0800
Message-ID: <20261112164544.3176458-8-hjf3108@gmail.com>
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

GRO makes sense now that RX aggregation is enabled, since multiple
frames arrive at once.

This code is referenced from commit 5323d3e50c20
("wifi: mt76: mt76u: use a threaded NAPI for the RX path")

The RX locking is referenced from commit 3298b1f866fb ("mt76: use
ieee80211_rx_list to pass frames to the network stack as a batch") and
commit 5b8ccdfb943f ("wifi: mt76: add missing locking to protect
against concurrent rx/status calls")

Test results:
   before after
TX 30.5   30.5
RX 80.9   161.7

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   | 16 ++++-
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 28 ++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00usb.c    | 59 +++++++++++++++----
 3 files changed, 89 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00.h b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
index 7b1a32d3e1..7d10bbe3ba 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
@@ -960,11 +960,22 @@ struct rt2x00_dev {
 	struct work_struct intf_work;
 
 	/**
-	 * Scheduled work for TX/RX done handling (USB devices)
+	 * Scheduled work for TX done handling (USB devices)
 	 */
-	struct work_struct rxdone_work;
 	struct work_struct txdone_work;
 
+	/*
+	 * NAPI context for RX done handling (USB devices).
+	 */
+	struct net_device *napi_dev;
+	struct napi_struct napi;
+	struct sk_buff_head rx_skb;
+
+	/*
+	 * Serialize the RX in NAPI with the TX status reports to mac80211.
+	 */
+	spinlock_t rx_lock;
+
 	/*
 	 * Powersaving work
 	 */
@@ -1462,6 +1473,7 @@ void rt2x00lib_txdone_nomatch(struct queue_entry *entry,
 			      struct txdone_entry_desc *txdesc);
 void rt2x00lib_txdone_noinfo(struct queue_entry *entry, u32 status);
 void rt2x00lib_rxdone(struct queue_entry *entry, unsigned int len, gfp_t gfp);
+void rt2x00lib_rx_complete(struct rt2x00_dev *rt2x00dev);
 
 /*
  * mac80211 handlers.
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index dc6a7d12b2..aae96d082a 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -461,7 +461,9 @@ void rt2x00lib_txdone_nomatch(struct queue_entry *entry,
 
 		rt2x00lib_fill_tx_status(rt2x00dev, &txinfo, skbdesc, txdesc,
 					 success);
+		spin_lock_bh(&rt2x00dev->rx_lock);
 		ieee80211_tx_status_noskb(rt2x00dev->hw, skbdesc->sta, &txinfo);
+		spin_unlock_bh(&rt2x00dev->rx_lock);
 	}
 
 	dev_kfree_skb_any(entry->skb);
@@ -545,10 +547,12 @@ void rt2x00lib_txdone(struct queue_entry *entry,
 	 * send the status report back.
 	 */
 	if (!(skbdesc_flags & SKBDESC_NOT_MAC80211)) {
+		spin_lock_bh(&rt2x00dev->rx_lock);
 		if (rt2x00_has_cap_flag(rt2x00dev, REQUIRE_TASKLET_CONTEXT))
 			ieee80211_tx_status_skb(rt2x00dev->hw, entry->skb);
 		else
 			ieee80211_tx_status_ni(rt2x00dev->hw, entry->skb);
+		spin_unlock_bh(&rt2x00dev->rx_lock);
 	} else {
 		dev_kfree_skb_any(entry->skb);
 	}
@@ -871,7 +875,10 @@ static void rt2x00lib_rxdone_skb(struct queue_entry *entry)
 	rx_status->bw = rxdesc.bw;
 	rx_status->antenna = rt2x00dev->link.ant.active.rx;
 
-	ieee80211_rx_ni(rt2x00dev->hw, entry->skb);
+	if (rt2x00dev->napi_dev)
+		__skb_queue_tail(&rt2x00dev->rx_skb, entry->skb);
+	else
+		ieee80211_rx_ni(rt2x00dev->hw, entry->skb);
 }
 
 void rt2x00lib_rxdone(struct queue_entry *entry, unsigned int len, gfp_t gfp)
@@ -945,6 +952,23 @@ void rt2x00lib_rxdone(struct queue_entry *entry, unsigned int len, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(rt2x00lib_rxdone);
 
+void rt2x00lib_rx_complete(struct rt2x00_dev *rt2x00dev)
+{
+	struct sk_buff *skb, *tmp;
+	LIST_HEAD(list);
+
+	spin_lock(&rt2x00dev->rx_lock);
+	while ((skb = __skb_dequeue(&rt2x00dev->rx_skb)) != NULL)
+		ieee80211_rx_list(rt2x00dev->hw, NULL, skb, &list);
+	spin_unlock(&rt2x00dev->rx_lock);
+
+	list_for_each_entry_safe(skb, tmp, &list, list) {
+		skb_list_del_init(skb);
+		napi_gro_receive(&rt2x00dev->napi, skb);
+	}
+}
+EXPORT_SYMBOL_GPL(rt2x00lib_rx_complete);
+
 /*
  * Driver initialization handlers.
  */
@@ -1469,6 +1493,8 @@ int rt2x00lib_probe_dev(struct rt2x00_dev *rt2x00dev)
 	mutex_init(&rt2x00dev->conf_mutex);
 	INIT_LIST_HEAD(&rt2x00dev->bar_list);
 	spin_lock_init(&rt2x00dev->bar_list_lock);
+	spin_lock_init(&rt2x00dev->rx_lock);
+	skb_queue_head_init(&rt2x00dev->rx_skb);
 	hrtimer_setup(&rt2x00dev->txstatus_timer, hrtimer_dummy_timeout, CLOCK_MONOTONIC,
 		      HRTIMER_MODE_REL);
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index 4519a20a7f..4fe0d6f836 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -341,15 +341,16 @@ static bool rt2x00usb_kick_tx_entry(struct queue_entry *entry, void *data)
 /*
  * RX data handlers.
  */
-static void rt2x00usb_work_rxdone(struct work_struct *work)
+static int rt2x00usb_poll_rxdone(struct napi_struct *napi, int budget)
 {
 	struct rt2x00_dev *rt2x00dev =
-	    container_of(work, struct rt2x00_dev, rxdone_work);
+	    container_of(napi, struct rt2x00_dev, napi);
 	struct queue_entry_priv_usb *entry_priv;
 	struct queue_entry *entry;
 	struct skb_frame_desc *skbdesc;
 	u8 rxd[32];
 
+	rcu_read_lock();
 	while (!rt2x00queue_empty(rt2x00dev->rx)) {
 		entry = rt2x00queue_get_entry(rt2x00dev->rx, Q_INDEX_DONE);
 
@@ -368,8 +369,14 @@ static void rt2x00usb_work_rxdone(struct work_struct *work)
 		 */
 		entry_priv = entry->priv_data;
 		rt2x00lib_rxdone(entry, entry_priv->urb->actual_length,
-				 GFP_KERNEL);
+				 GFP_ATOMIC);
 	}
+	rt2x00lib_rx_complete(rt2x00dev);
+	rcu_read_unlock();
+
+	napi_complete(napi);
+
+	return 0;
 }
 
 static void rt2x00usb_interrupt_rxdone(struct urb *urb)
@@ -396,7 +403,7 @@ static void rt2x00usb_interrupt_rxdone(struct urb *urb)
 	/*
 	 * Schedule the delayed work for processing RX data
 	 */
-	queue_work(rt2x00dev->workqueue, &rt2x00dev->rxdone_work);
+	napi_schedule(&rt2x00dev->napi);
 }
 
 static bool rt2x00usb_kick_rx_entry(struct queue_entry *entry, void *data)
@@ -478,7 +485,7 @@ static bool rt2x00usb_flush_entry(struct queue_entry *entry, void *data)
 
 void rt2x00usb_flush_queue(struct data_queue *queue, bool drop)
 {
-	struct work_struct *completion;
+	bool is_tx;
 	unsigned int i;
 
 	if (drop)
@@ -486,17 +493,17 @@ void rt2x00usb_flush_queue(struct data_queue *queue, bool drop)
 					   rt2x00usb_flush_entry);
 
 	/*
-	 * Obtain the queue completion handler
+	 * Obtain the queue type
 	 */
 	switch (queue->qid) {
 	case QID_AC_VO:
 	case QID_AC_VI:
 	case QID_AC_BE:
 	case QID_AC_BK:
-		completion = &queue->rt2x00dev->txdone_work;
+		is_tx = true;
 		break;
 	case QID_RX:
-		completion = &queue->rt2x00dev->rxdone_work;
+		is_tx = false;
 		break;
 	default:
 		return;
@@ -515,7 +522,14 @@ void rt2x00usb_flush_queue(struct data_queue *queue, bool drop)
 		 * Schedule the completion handler manually, when this
 		 * worker function runs, it should cleanup the queue.
 		 */
-		queue_work(queue->rt2x00dev->workqueue, completion);
+		if (is_tx) {
+			queue_work(queue->rt2x00dev->workqueue,
+				   &queue->rt2x00dev->txdone_work);
+		} else {
+			local_bh_disable();
+			napi_schedule(&queue->rt2x00dev->napi);
+			local_bh_enable();
+		}
 
 		/*
 		 * Wait for a little while to give the driver
@@ -750,7 +764,7 @@ void rt2x00usb_uninitialize(struct rt2x00_dev *rt2x00dev)
 
 	usb_kill_anchored_urbs(rt2x00dev->anchor);
 	hrtimer_cancel(&rt2x00dev->txstatus_timer);
-	cancel_work_sync(&rt2x00dev->rxdone_work);
+	napi_synchronize(&rt2x00dev->napi);
 	cancel_work_sync(&rt2x00dev->txdone_work);
 
 	queue_for_each(rt2x00dev, queue)
@@ -758,6 +772,14 @@ void rt2x00usb_uninitialize(struct rt2x00_dev *rt2x00dev)
 }
 EXPORT_SYMBOL_GPL(rt2x00usb_uninitialize);
 
+static void rt2x00usb_free_napi(struct rt2x00_dev *rt2x00dev)
+{
+	napi_disable(&rt2x00dev->napi);
+	netif_napi_del(&rt2x00dev->napi);
+	free_netdev(rt2x00dev->napi_dev);
+	rt2x00dev->napi_dev = NULL;
+}
+
 int rt2x00usb_probe(struct usb_interface *usb_intf,
 		    const struct rt2x00_ops *ops)
 {
@@ -801,9 +823,21 @@ int rt2x00usb_probe(struct usb_interface *usb_intf,
 
 	rt2x00_set_chip_intf(rt2x00dev, RT2X00_CHIP_INTF_USB);
 
-	INIT_WORK(&rt2x00dev->rxdone_work, rt2x00usb_work_rxdone);
 	INIT_WORK(&rt2x00dev->txdone_work, rt2x00usb_work_txdone);
 
+	rt2x00dev->napi_dev = alloc_netdev_dummy(0);
+	if (!rt2x00dev->napi_dev) {
+		retval = -ENOMEM;
+		goto exit_free_hw;
+	}
+
+	strscpy(rt2x00dev->napi_dev->name, wiphy_name(hw->wiphy),
+		sizeof(rt2x00dev->napi_dev->name));
+	netif_napi_add(rt2x00dev->napi_dev, &rt2x00dev->napi,
+		       rt2x00usb_poll_rxdone);
+	netif_threaded_enable(rt2x00dev->napi_dev);
+	napi_enable(&rt2x00dev->napi);
+
 	init_usb_anchor(rt2x00dev->anchor);
 
 	retval = rt2x00lib_probe_dev(rt2x00dev);
@@ -814,6 +848,8 @@ int rt2x00usb_probe(struct usb_interface *usb_intf,
 
 exit_free_anchor:
 	usb_kill_anchored_urbs(rt2x00dev->anchor);
+	rt2x00usb_free_napi(rt2x00dev);
+exit_free_hw:
 	ieee80211_free_hw(hw);
 	usb_set_intfdata(usb_intf, NULL);
 
@@ -830,6 +866,7 @@ void rt2x00usb_disconnect(struct usb_interface *usb_intf)
 	 * Free all allocated data.
 	 */
 	rt2x00lib_remove_dev(rt2x00dev);
+	rt2x00usb_free_napi(rt2x00dev);
 	ieee80211_free_hw(hw);
 
 	usb_set_intfdata(usb_intf, NULL);
-- 
2.53.0

