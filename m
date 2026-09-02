Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2514412C08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340685; cv=none; b=owX2jWmgSg4LhgyDr6nocTDoLcvHbtB6v5juDPQ2J4K1xafkWDOlPdKfa3xQUxs4kqIsL+bGtJgBTQKVYCauJ8527J8E7AfczPTd5W2YT19jO0D05PVB/1swfzCJPzKDtCN+xytSoMJyS7WBIjdWvtYXI/hlRZFCI+Q5Z2Yd7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340685; c=relaxed/simple;
	bh=t5mc7Iy72dZq7auPe/M2Xw2rR1TuRKDieLQr1HiSUu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIMtdqmhbHFYZ2O2Xxt15gOrd1NSEd+s/i1XON99PsxwEU7vTXeKDYU8GY8SsGxd89iZCTt08/LIQiWLr2fKrtPLxCU2KqJvF27yi+Jb4/uYuIoHUF8BoNLDLjDCrFGobs0CaWEoPZ1e916YwUKrO+Sdc/AgAgIF/+7TOWfbkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBkB8KSe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBkB8KSe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f96c5b722so569970f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788340682; x=1788945482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWqhYlwMMZfZJlJiukq5ToNi5coCyWE1dtIlSJKTkr8=;
        b=eBkB8KSeRzAl6EWD5cJD1c9w2WnENHyOXfVYRtDT1miCt0PIEn+nxzk1jGpHHbYXfj
         5xE64KigTiN4BG5tIOHIfXOTi1A0dv08jLB2htVw0hsyIehL9yXszQeeA9+cD5yOzih1
         BDThRwSL0JQTT7H5w0wl7/iGLp1dZxqNz5rI2fXj+DKnif5WQXZzd4uQmeMFX+/GTjC9
         6fHPpX8WY615r9P/K3p5+2FHKycYEcn4fkvNoEsZU9d2ZQVj97ucfXY8GAqqT49H0hr9
         igh1nffqV1VcGgqYHjyJzGggQgXLpb7Oa5bdFrH2+c+dwQB+lbpNNA5ksG7ODY0FKO5s
         PBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340682; x=1788945482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWqhYlwMMZfZJlJiukq5ToNi5coCyWE1dtIlSJKTkr8=;
        b=OyniuqgcGgElb1ubcETzaYUBX419R1d8sgKrqCyOsL47jlPjifbCbiOb9SH+eBBBxd
         rSTxcziepPyvTxcpUaGJ6/lNyGC6WoSc60bdTQkLzC5hneZghlf+QjoewQnwwHZHzH23
         xBbssgdNF6LOT5YtbSeMdOLTWggExneVYp/39StKaFJ7kPx/+lOFGXi3slct+Sp15YaH
         Q0KCa39xworSCP/wedFiE0hZ8v7y99NN3TZZ5U06NHLMkvg6rRrFvV+l5JTfLFMqKRik
         65Ir6TQgcWOJbeKLEoBwJRnP/Jz1ig7T9SpHoh+oEQJ6aZyNvR5J8rflshCpAcEkoqah
         cSCw==
X-Forwarded-Encrypted: i=1; AKwUvByQmr+AGfYrL5SDfnEp5BC2o7Z2lRte3ZrfS/069DWHJL+avqwjcsCYg3ugqS894oaWoyhe59+SmraX378=@vger.kernel.org
X-Gm-Message-State: AFuF++k65EKPsYZugDEezgoe13zo0YkCx11k/ZEvos3Jm5WC6b6DFCu4
	6bPWJIZ1v2pZoFQfCd1xsymvVUeERyGGkuODOgdRRh/OSLm0n5m5oXXZ
X-Gm-Gg: AYBFou2PBRfjjY1OcemWeJ2W/QbjiNREsDBxZ9eWFxrtvKRTWT2XIKY8Ke/2TiXvuQq
	S5LxbKz8ESvp/Mo/8AWYzUyJn88mAQ0QlLkC/SMKH+EmakUgtafQ9uNgdrT5hkWt62Gm+GecNRH
	Gkz/QWsc25/9likIoAV74AHcCQDOk88JWK8DBZFWBlJd+D5CrxYXY7RNgQfeCC81m7EEJGIASDS
	Edp1eld8zGMhIE1awnuu+0qzRzk+FjHdNszSSZ/vb9wnwgiTdhEXbHqKQI4rwLHtFd0KFwZoVBw
	mdGR27U+HSjt4F4OtjnNGJeohSdbd/RzP3SrwEGA6KSx67i8tJrMV6YX+VPfZxZwsRbx6cNILYz
	gpRo/+z6DhGuhSHk79G48fYB2AqpnqR34LhM9p26W3MovalMldck/UuC0ADf8oBw+G9u/a1jdG9
	Qw9/1EV0MlFzDLeq+oKceTw9rfgBgwqZ2sqV4th93zeqbBGRCOF9kPB41LXOPZ8bcz6YnXc/Vjx
	vd8WfHMz/deiaJ4hxOt9mXh4B917ddZ9sHPscT5uhDDto1UgZ52P70qmUQHxvb2wsP2NthbqE3/
	qTWIqBTfXw==
X-Received: by 2002:a05:6000:460f:b0:482:fd9c:5d25 with SMTP id ffacd0b85a97d-484913ba763mr6419167f8f.16.1788340681504;
        Wed, 02 Sep 2026 02:18:01 -0700 (PDT)
Received: from omarchy ([151.135.13.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4730701f8f.36.2026.09.02.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:18:01 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	briannorris@chromium.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
Subject: [PATCH rtw-next] wifi: rtw88: pci: recover from a stalled TX ring
Date: Wed,  2 Sep 2026 12:17:38 +0300
Message-ID: <20260902091738.41047-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hardware read pointer of a PCIe TX ring can stop advancing while the
driver keeps queueing descriptors. Once the ring fills up,
rtw_pci_tx_write() stops the corresponding mac80211 queue, and the only
ieee80211_wake_queue() for that ring lives inside the completion loop of
rtw_pci_tx_isr():

	count = cur_rp - ring->r.rp;
	while (count--) {
		...
		if (ring->queue_stopped && avail_desc(...) > 4)
			ieee80211_wake_queue(hw, q_map);
		...
	}

When the read pointer is frozen, count is zero, the loop body never runs
and the queue is never woken again. The interface stays associated, RX
keeps working, and TX is silently dead until the interface is taken down
and up again or the machine is rebooted. Nothing is logged and no
counter reflects it.

This was observed several times on an RTL8821CE. Dumps taken at the
moment of the failure, before touching the interface, show the BE queue
stopped with reason IEEE80211_QUEUE_STOP_REASON_DRIVER, a per-TID
backlog that keeps growing, a TXBD read index that is identical in
samples two seconds and two minutes apart, and a frozen tx packet
counter while beacon and other RX counters keep increasing.

Detect the condition from rtw_watch_dog_work(): for every TX ring that
has something in flight, remember the hardware read pointer and, if it
has not advanced for three consecutive rounds (about six seconds), run
the kick-off for that queue again. Once the hardware resumes consuming
descriptors, rtw_pci_tx_isr() runs with a non-zero count and wakes the
queue through the existing path.

Rings with nothing in flight are skipped before the register read, so an
idle device is not touched, and the beacon and H2C rings are left alone
because they are not flow controlled through mac80211. The warning is
printed once per stall, while the kick-off is retried as long as the
ring does not drain.

This does not address why the hardware stops consuming descriptors; it
turns an unrecoverable state into a recoverable one and makes it visible
in the log.

Tested on an RTL8821CE by stalling the BE ring on purpose (skipping the
doorbell write until the ring filled up). Without this change the queue
stayed stopped for as long as it was observed; with it the ring drained
and traffic resumed within one watchdog round.

Link: https://lore.kernel.org/linux-wireless/20260826162514.80580-1-abdurrahmankaradag19@gmail.com/
Signed-off-by: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/hci.h  |  7 +++
 drivers/net/wireless/realtek/rtw88/main.c |  2 +
 drivers/net/wireless/realtek/rtw88/pci.c  | 67 +++++++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/pci.h  |  3 +
 4 files changed, 79 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/hci.h b/drivers/net/wireless/realtek/rtw88/hci.h
index d4bee9c3e..42e6cefa3 100644
--- a/drivers/net/wireless/realtek/rtw88/hci.h
+++ b/drivers/net/wireless/realtek/rtw88/hci.h
@@ -11,6 +11,7 @@ struct rtw_hci_ops {
 			struct rtw_tx_pkt_info *pkt_info,
 			struct sk_buff *skb);
 	void (*tx_kick_off)(struct rtw_dev *rtwdev);
+	void (*tx_stall_check)(struct rtw_dev *rtwdev);
 	void (*flush_queues)(struct rtw_dev *rtwdev, u32 queues, bool drop);
 	int (*setup)(struct rtw_dev *rtwdev);
 	int (*start)(struct rtw_dev *rtwdev);
@@ -45,6 +46,12 @@ static inline void rtw_hci_tx_kick_off(struct rtw_dev *rtwdev)
 	return rtwdev->hci.ops->tx_kick_off(rtwdev);
 }
 
+static inline void rtw_hci_tx_stall_check(struct rtw_dev *rtwdev)
+{
+	if (rtwdev->hci.ops->tx_stall_check)
+		rtwdev->hci.ops->tx_stall_check(rtwdev);
+}
+
 static inline int rtw_hci_setup(struct rtw_dev *rtwdev)
 {
 	return rtwdev->hci.ops->setup(rtwdev);
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index cd9254370..35b3682e2 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -273,6 +273,8 @@ static void rtw_watch_dog_work(struct work_struct *work)
 
 	/* make sure BB/RF is working for dynamic mech */
 	rtw_leave_lps(rtwdev);
+
+	rtw_hci_tx_stall_check(rtwdev);
 	rtw_coex_wl_status_check(rtwdev);
 	rtw_coex_query_bt_hid_list(rtwdev);
 	rtw_coex_active_query_bt_info(rtwdev);
diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f51..f9875cb07 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -787,6 +787,72 @@ static void rtw_pci_tx_kick_off_queue(struct rtw_dev *rtwdev,
 	spin_unlock_bh(&rtwpci->irq_lock);
 }
 
+/* The hardware read pointer of a TX ring can stop advancing while the driver
+ * keeps queueing descriptors. Once the ring is full, rtw_pci_tx_write() stops
+ * the mac80211 queue, and because the only wake up is inside the completion
+ * loop of rtw_pci_tx_isr(), which does not run while the read pointer is
+ * frozen, the queue would stay stopped forever. Detect a ring that is not
+ * draining and kick it off again.
+ */
+#define RTW_PCI_TX_STALL_LIMIT 3
+
+static void rtw_pci_tx_stall_check(struct rtw_dev *rtwdev)
+{
+	struct rtw_pci *rtwpci = (struct rtw_pci *)rtwdev->priv;
+	struct rtw_pci_tx_ring *ring;
+	enum rtw_tx_queue_type queue;
+	u32 bd_idx, cur_rp, wp;
+	bool pending, kick, warn, stopped;
+
+	for (queue = 0; queue < RTK_MAX_TX_QUEUE_NUM; queue++) {
+		/* BCN is the reserved page and H2C is managed by the
+		 * firmware, neither is flow controlled through mac80211
+		 */
+		if (queue == RTW_TX_QUEUE_BCN || queue == RTW_TX_QUEUE_H2C)
+			continue;
+
+		ring = &rtwpci->tx_rings[queue];
+		kick = false;
+		warn = false;
+
+		spin_lock_bh(&rtwpci->irq_lock);
+
+		/* nothing in flight, do not touch the device */
+		if (skb_queue_empty(&ring->queue) && !ring->queue_stopped) {
+			ring->stall_cnt = 0;
+			ring->stall_warned = false;
+			spin_unlock_bh(&rtwpci->irq_lock);
+			continue;
+		}
+
+		bd_idx = rtw_read32(rtwdev, rtw_pci_tx_queue_idx_addr[queue]);
+		cur_rp = (bd_idx >> 16) & TRX_BD_IDX_MASK;
+		wp = ring->r.wp;
+		pending = ring->queue_stopped || cur_rp != wp;
+
+		if (pending && cur_rp == ring->last_rp) {
+			if (++ring->stall_cnt >= RTW_PCI_TX_STALL_LIMIT) {
+				ring->stall_cnt = 0;
+				kick = true;
+				warn = !ring->stall_warned;
+				ring->stall_warned = true;
+			}
+		} else {
+			ring->stall_cnt = 0;
+			ring->stall_warned = false;
+		}
+		stopped = ring->queue_stopped;
+		ring->last_rp = cur_rp;
+		spin_unlock_bh(&rtwpci->irq_lock);
+
+		if (warn)
+			rtw_warn(rtwdev, "TX queue %d stalled (rp %u wp %u%s), kicking\n",
+				 queue, cur_rp, wp, stopped ? ", stopped" : "");
+		if (kick)
+			rtw_pci_tx_kick_off_queue(rtwdev, queue);
+	}
+}
+
 static void rtw_pci_tx_kick_off(struct rtw_dev *rtwdev)
 {
 	struct rtw_pci *rtwpci = (struct rtw_pci *)rtwdev->priv;
@@ -1605,6 +1671,7 @@ static void rtw_pci_destroy(struct rtw_dev *rtwdev, struct pci_dev *pdev)
 static const struct rtw_hci_ops rtw_pci_ops = {
 	.tx_write = rtw_pci_tx_write,
 	.tx_kick_off = rtw_pci_tx_kick_off,
+	.tx_stall_check = rtw_pci_tx_stall_check,
 	.flush_queues = rtw_pci_flush_queues,
 	.setup = rtw_pci_setup,
 	.start = rtw_pci_start,
diff --git a/drivers/net/wireless/realtek/rtw88/pci.h b/drivers/net/wireless/realtek/rtw88/pci.h
index 8ffdea113..ddeefa220 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.h
+++ b/drivers/net/wireless/realtek/rtw88/pci.h
@@ -188,6 +188,9 @@ struct rtw_pci_tx_ring {
 	struct rtw_pci_ring r;
 	struct sk_buff_head queue;
 	bool queue_stopped;
+	u32 last_rp;
+	u8 stall_cnt;
+	bool stall_warned;
 };
 
 struct rtw_pci_rx_buffer_desc {
-- 
2.55.0

