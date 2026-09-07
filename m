Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A3B3AFD0D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808147; cv=none; b=rdhyH13KF1qWR/gvbF68TkbJJpca+137ARfxYE6UFy5quDagKIPYgTbBuJmeIT0LEaKSBhoimxRi3J1PVnz/o3F9JvSRTiQpgF/+xlV2FmIEy3CClyX5PJlI38hBUOPEysgvTRcCqDYoXim4bzj+Lbwe/2krr9aXvmO4ziHbNcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808147; c=relaxed/simple;
	bh=ztWP+24QaHA6Xw67hhL9tmJxZPi3tbSdQjf6uZ9EM6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/4uZFoppibuX2Zu0wIa76aZ/eF3dbqPpoDsXLwPRUmkNyJUc3SFIwtWjVN66mf2xatqtCUilai/189MVwvdp80BA1pbwsBYkN83iYaUTLCGd/+3HWGNakFEUpHaoh5XyFhlmJqpbEA/Q6VXUPKqWcoHOIiY7t3QHYD/7cqZ+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Btwu77J7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Btwu77J7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-485888b3c3dso3974983f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808144; x=1789412944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWWUTNxueDekJa6qk76yBRcI4kBuGeARV4/mQXdjmJg=;
        b=Btwu77J7bhZktSG10DgtFxKA/3g75DMy+S6vuOEDfknsLovw/BrwZqZflwD+957zso
         P4VOk+II/qPV23AcU6LQlmruvX7Ts/nVDeKyZ+JCx2unASCybivqXit1qJhiHHM1UCe5
         eF1aAEW6S3DS1VSF/0Sj+tP/LCkRKTd/jykDO0D2b+JaTPLWHY08ZYCXIxefI/pldSH8
         VxaVCzDFenZMPcF2hOO9GmIWLXTbNQmzuCR4Udm1NgAHHheoQyYz135e1Y+t2wX+WQPc
         4otDeLngINXV/dU9EnQKLTE4gA+2N5E1kf4CcHRpeK6bKckFuiDP8QgMS680MO8O8dSC
         1FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808144; x=1789412944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWWUTNxueDekJa6qk76yBRcI4kBuGeARV4/mQXdjmJg=;
        b=P/+wi0cyOF736S09XOF/L1es5MPLtNoCu3U9Hc78xOFc4dY0vCBQ/Nizvik2A7JQSu
         dwFimvRoPa7F2iKDXkyMVEjN15aSohoN4khq1/RNATFAXeuyO/xccm7PbgUul74shdeQ
         YKSp5Ygqz7C45AXlifRPrmGlUS4Jc9Be4GSaTSWo1LZ8OrDstd+AYvbJoTlRUKFDTXZX
         8P3SdeN4ZFvQN3xZD2s+pFBv2VCZh9+xG13lgYQ4kHV87VGRCva0FL4XPnXmbL5cICx8
         jgTdWrwi4nkzGkJ6govKmyw2fpJTejn0BscVc3gLEA9+8u4oZkQm8pH9FeyFDb+wMUbD
         eYsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQKUUYIQk6CXeQHE2GsMYK7bsOczGcn9FmeSZ8HZCqpOkqdhjQNoWTof+thb5wbRKCRC8Jacoc46dZzVM=@vger.kernel.org
X-Gm-Message-State: AFuF++mtbwU+uFbmpcphpGAI9fZt22ExCxVSnZY2/itVEdW8oFaMvSvI
	jkb5iHKYhSzwMHPHvsHSmdD75gXeni+zo77U6U7TiuGD0wwMV3KiXbfH
X-Gm-Gg: AYBFou34gX3t/L8I2gymHLGr8IP9owo6KeO2xLuFkh3qVXo189siE7WrWciTPzfZiiX
	v+Zexb4pZsdOLgOObfyDXqUJXEkL/wLPLzHpPN6b2N0K3w+he01T4NwNaIUL8rhe5VG1OroUFsY
	qEXqe9iw9HS2QB+JgTqb0D4LRmBWPbET1Q38gttH4f+1fI1PlWIeI4hfKFdFpes26FctFkfkTjK
	x9GvuNehSYN5bcAaPwO20xbob15OOvXNQaimDpYtn/LK+ISnR6SwQsGjdom/H4YEXa1AtDDa94C
	I0n3eIHVdlfJWhdYQbsNgxIlCKQeDK4uUQbwrzJakTJnePjKo+R1ponAMSrRmOPcpCvSL6H+5TJ
	WpXeY2jek2yAazE4Id2x6PyEFXIgeoIUf4u83Fqghfe5rhvNzS6rprIsf1jwOkv/hKFtWGSEtcJ
	fxhhaxswCP0ANlsfPCRrGeumtJkjqJsKNZfyNYS3QhTp2pJ8FjYl5eFN0/Fx6UWggcIKyWJ21PH
	Xwu
X-Received: by 2002:a05:6000:2001:b0:47f:96e3:530e with SMTP id ffacd0b85a97d-48587285526mr24874171f8f.8.1788808144235;
        Mon, 07 Sep 2026 12:09:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm33365544f8f.33.2026.09.07.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:09:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 1/3] wifi: rtw88: usb: bound what the driver feeds the after-DTIM queue
Date: Mon,  7 Sep 2026 21:08:59 +0200
Message-ID: <20260907190901.1056945-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907190901.1056945-1-mehmet.fide@gmail.com>
References: <20260907190901.1056945-1-mehmet.fide@gmail.com>
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
---
v2:
- macro RTW_USB_HIQ_REFILL_INTERVAL for HZ / 10, RTW_USB_HIQ_BUDGET_MAX (Ping-Ke)
- 'budget' instead of 'token': hiq_budget, rtw_usb_hiq_take_budget() (Ping-Ke)
- refill bookkeeping rewritten as elapsed / interval and
  hiq_refill = jiffies - elapsed % interval, with a comment (Ping-Ke)
- blank lines after spin_lock_irqsave() and before spin_unlock_irqrestore() (Ping-Ke)

 drivers/net/wireless/realtek/rtw88/usb.c | 41 ++++++++++++++++++++++--
 drivers/net/wireless/realtek/rtw88/usb.h |  5 +++
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index c90802919473..5482e44f4a88 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -562,7 +562,37 @@ static int rtw_usb_write_data_h2c(struct rtw_dev *rtwdev, u8 *buf, u32 size)
 	return rtw_usb_write_data(rtwdev, &pkt_info, buf);
 }
 
-static u8 rtw_usb_tx_queue_mapping_to_qsel(struct sk_buff *skb)
+#define RTW_USB_HIQ_REFILL_INTERVAL	(HZ / 10)	/* jiffies per unit of budget */
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
+		/* The part of the current interval that has not completed yet
+		 * keeps counting toward the next unit
+		 */
+		rtwusb->hiq_refill = jiffies - elapsed % RTW_USB_HIQ_REFILL_INTERVAL;
+	}
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

