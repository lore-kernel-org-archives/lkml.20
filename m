Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DDC3955C0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028244; cv=none; b=trWHSKNWwCU22K6chKlTR6pZtzpW4CUvVuOel0bpqSmY498OjA9fzekzVA3FGJvjv4NXdNBGUldFlnEjQj2z+ZjxlFQXOLTQ5sf1A/LMTP6keJsgAJYN00C7+aCH4p7Qw2geaGY6OrPgzYDMNvpwVT2Qj+zGqt0Peg+VC/E1TWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028244; c=relaxed/simple;
	bh=gDFyzNvBDNjI/mr8CUb+d2A4IpdA26e6ynTV9GMGTDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mz3Ps3hbgtzMovtXl4+CRfxp0k6Gc+vcvJwvfmVt9VoxTRIA0TIWKs6ZwSFBBg5LSfCMu0TBKzPWgwd5aa6IdJSIX/Vn0jP8oZJoqLAVAoGgdrhLXXGlqqtDaPL1nu7AxkyU3VlGLjn41oCjRuBMyK9vALzD8O2qAF54J+zktkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXGZvURK; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXGZvURK"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c3d02aso121014585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789028241; x=1789633041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWzmAdRLUf0g2QMy6rAYQTOxI2sFMD4mgsTYky0eQmc=;
        b=oXGZvURKvetqQT1Cz/+PQ+Ud3Nb4vNCXQROX9s/lNN55CJzBHT48dV9WWjcI2Kayrn
         zr0oJG7jnkSdVIK/bcnf6VtnBzFGd0IYjzo6GHPF7BGYxGJ5ar4c2hnRWIBCQzjVIXhl
         Xs0OZxc0m55EJe6MFrdZ2SBTAntQjZoPX2nugdIc6iZdGE7JlobeafdzLcZ5kGA4TvZl
         jt+0+a+BzwIQoUqF4j+1TA0o15fHwgXEu7lR05clERxtlJuCAT6L9LzLs8PLM8xo8G2b
         RXRsZXnxpfl/6Tp7VvrTYrIgAzqDrrbkPpH6vkbNKwz/DWYu6D9p4WvNShIm7mASMaYW
         Ls0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028241; x=1789633041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWzmAdRLUf0g2QMy6rAYQTOxI2sFMD4mgsTYky0eQmc=;
        b=VwuZmRjX44CRgwFeXN5TSKH8bhroW2V7fQtvCViR7Ye5mufP5I3K5WK/1dIAZyKnjh
         AjWP9twN9/DlkHZwQF2q5z+ftsFDnU0MM4h+1NoLTzIKoPvHJAqOk28NLa5mAyI2a38S
         jdsuRHfonyasupeh5kpJzZn2VK8Bq8UIGVsCjypWEFy20EFE4K/26UNvH+TVk8DZcA6D
         tMOXozg+hzWFR4lnmIkruc++3D7rZgCds/eCm7A8O17mkqxBo0c2rsS/XCQWiyrDDCTk
         c51tkODjzRS5oRQEOPF+N5mqLcZzbCpDWLjXNgQNuINkpS6BBMwS1NywdYdrifAWryYP
         r9lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsymMECkbpdEZ2YtK50SFyETAPbsMpWPf4MELT6epeE80NdCeSKF+hwJH1f6khAcq5XVol1kONFTkNWuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l8g44um9SXW3wIXLu1IUpz/VdDY5oli7lO8l3FiMNV0sOZmvKe
	Nfh9jw6rIJUmBqQ4TCe9C1GTMTn1Aih0qHcTJPiq8NO6o/T576B7DhNl
X-Gm-Gg: AYBFou0ssvoZFJqfcUGhcBwMkTGOqLXVXFZjaLUsO3v43DGTT9EiAzj+X63dpeFwJ35
	3ZEkU6gWjVLFW2x5E8RtextbzImMXZxR5JXZ8wNFJMNpjFM4/Evwoxgej5dquNKaMPA/owcKnJc
	03na+7t2j8+LM0nvZS45YivRDVCkPj8sRnc+sbg8ndZClqqe9k2j5XiGL765lXAUw0jH8PQiOgO
	susnNVqI3LNy8kIVI1Cm6r1eX5JqMybMhOLOtFZvlZ8qnkcdHmWf0hDNKOGXL4WMxb/GYi0Zz+T
	Kb69fUDKxZ50XQxNPskEenhooPHA1lHtfi53Edh4cADekkmCFf5KJslJMqltR3MoFQLbWFPI54x
	kOJ8J1LBxGjs81gxyX0p4Wb7haRDHG4jhxeGg2S04Xki0TcfBcstHhqpGJzCI2WAzNScd7R48hz
	hMRgPtKr+VWs/5FFfFc3XwK1Z9hp08alsbLnP4Ga8ZPKOCBjBw80CMsNZN6hSOssXmQQDOpZspq
	MqS
X-Received: by 2002:a05:620a:4620:b0:939:6de7:238d with SMTP id af79cd13be357-939d7fb6f5cmr412443285a.23.1789028240873;
        Thu, 10 Sep 2026 01:17:20 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939a57535a1sm1087723885a.0.2026.09.10.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:17:20 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v3 1/3] wifi: rtw88: usb: bound what the driver feeds the after-DTIM queue
Date: Thu, 10 Sep 2026 10:17:14 +0200
Message-ID: <20260910081716.769081-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910081716.769081-1-mehmet.fide@gmail.com>
References: <20260910081716.769081-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Frames routed to the high queue are transmitted right after DTIM beacons
only, inside the ATIM window, while they wait in the shared TX page pool.
The driver puts no limit on how many it hands over, so as long as one
station dozes, any sustained broadcast or multicast traffic outruns the
drain and empties the pool: measured on an RTL8822BU AP with a single
client in power save and ~40 frames/s of mDNS chatter, the free page
count at 0x240 goes from 1803 to 16 in about 100 seconds and stays there
for as long as the traffic lasts. From that point every other transmit
queues behind the backlog, authentication responses arrive too late for
anyone to join, and the reserved page download fails ("error beacon
valid"). The AP keeps beaconing and only a reboot recovers.

Feed the high queue through a small budget that refills below the
measured drain rate (about 3 frames per DTIM, ~15/s at dtim_period 2 on
the default 2 TU ATIM window); whatever exceeds the budget leaves on its
access category queue right away. The high queue backlog is now bounded
by the burst size under any load, so the page pool cannot run dry, at
the price that a dozing station may miss part of a broadcast storm.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
v3:
- the refill macro comment says what one interval buys (Ping-Ke)
- the bookkeeping comment is a single line, blank lines around the
  refill block (Ping-Ke)

 drivers/net/wireless/realtek/rtw88/usb.c | 41 ++++++++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/usb.h |  5 +++
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index c90802919473..a03896260f1a 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -562,7 +562,37 @@ static int rtw_usb_write_data_h2c(struct rtw_dev *rtwdev, u8 *buf, u32 size)
 	return rtw_usb_write_data(rtwdev, &pkt_info, buf);
 }
 
-static u8 rtw_usb_tx_queue_mapping_to_qsel(struct sk_buff *skb)
+#define RTW_USB_HIQ_REFILL_INTERVAL	(HZ / 10)	/* one unit of budget per 100 ms */
+#define RTW_USB_HIQ_BUDGET_MAX		16
+
+static bool rtw_usb_hiq_take_budget(struct rtw_usb *rtwusb)
+{
+	unsigned long flags, elapsed, add;
+	bool ok;
+
+	spin_lock_irqsave(&rtwusb->hiq_lock, flags);
+
+	elapsed = jiffies - rtwusb->hiq_refill;
+	add = elapsed / RTW_USB_HIQ_REFILL_INTERVAL;
+	if (add) {
+		rtwusb->hiq_budget = min_t(unsigned long, rtwusb->hiq_budget + add,
+					   RTW_USB_HIQ_BUDGET_MAX);
+
+		/* keep the unfinished part of the interval for the next unit */
+		rtwusb->hiq_refill = jiffies - elapsed % RTW_USB_HIQ_REFILL_INTERVAL;
+	}
+
+	ok = rtwusb->hiq_budget > 0;
+	if (ok)
+		rtwusb->hiq_budget--;
+
+	spin_unlock_irqrestore(&rtwusb->hiq_lock, flags);
+
+	return ok;
+}
+
+static u8 rtw_usb_tx_queue_mapping_to_qsel(struct rtw_usb *rtwusb,
+					   struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
@@ -573,7 +603,8 @@ static u8 rtw_usb_tx_queue_mapping_to_qsel(struct sk_buff *skb)
 		qsel = TX_DESC_QSEL_MGMT;
 	else if (is_broadcast_ether_addr(hdr->addr1) ||
 		 is_multicast_ether_addr(hdr->addr1))
-		qsel = (info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM) ?
+		qsel = (info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM) &&
+		       rtw_usb_hiq_take_budget(rtwusb) ?
 		       TX_DESC_QSEL_HIGH : skb->priority;
 	else if (skb_get_queue_mapping(skb) <= IEEE80211_AC_BK)
 		qsel = skb->priority;
@@ -593,7 +624,7 @@ static int rtw_usb_tx_write(struct rtw_dev *rtwdev,
 	u8 *pkt_desc;
 	int ep;
 
-	pkt_info->qsel = rtw_usb_tx_queue_mapping_to_qsel(skb);
+	pkt_info->qsel = rtw_usb_tx_queue_mapping_to_qsel(rtwusb, skb);
 	pkt_desc = skb_push(skb, chip->tx_pkt_desc_sz);
 	memset(pkt_desc, 0, chip->tx_pkt_desc_sz);
 	ep = qsel_to_ep(rtwusb, pkt_info->qsel);
@@ -1034,6 +1065,10 @@ static int rtw_usb_init_tx(struct rtw_dev *rtwdev)
 	struct rtw_usb *rtwusb = rtw_get_usb_priv(rtwdev);
 	int i;
 
+	spin_lock_init(&rtwusb->hiq_lock);
+	rtwusb->hiq_budget = RTW_USB_HIQ_BUDGET_MAX;
+	rtwusb->hiq_refill = jiffies;
+
 	rtwusb->txwq = create_singlethread_workqueue("rtw88_usb: tx wq");
 	if (!rtwusb->txwq) {
 		rtw_err(rtwdev, "failed to create TX work queue\n");
diff --git a/drivers/net/wireless/realtek/rtw88/usb.h b/drivers/net/wireless/realtek/rtw88/usb.h
index 9b695b688b24..94ff21dd0846 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.h
+++ b/drivers/net/wireless/realtek/rtw88/usb.h
@@ -75,6 +75,11 @@ struct rtw_usb {
 	u8 out_ep[RTW_USB_EP_MAX];
 	int qsel_to_ep[TX_DESC_QSEL_MAX];
 
+	/* protects hiq_budget and hiq_refill */
+	spinlock_t hiq_lock;
+	u32 hiq_budget;
+	unsigned long hiq_refill;
+
 	struct workqueue_struct *txwq, *rxwq;
 
 	struct sk_buff_head tx_queue[RTW_USB_EP_MAX];
-- 
2.55.0

