Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ACA3BC68D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532262; cv=none; b=NKw3Yvb5cLIjAzIyFgp4/FiPc2bwcFDwrqSQ1zfJ1Npc4/ctZ4YQJ0F0MoPgC+Kf0btN6QvPqLxsGXB0ZegEXU1+KQEL+ojvQQHjTrpDk96X69Mc71S7w42EFB7gf58zX/68QtIdOoi9fHyjutERwWXcIoxktdGKkGzIWUi2tDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532262; c=relaxed/simple;
	bh=PaH20o9nQIM2ny2a4+7EatClBii+f4k3IegzzyjNiKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ir1I6LkWLweXBbLWPWcuJp/yfp80ceNHoGEXSqBfqFtnf4porwr/UYn4DUidL26ReJGzbZTcsSat1b6DTMi6eOIch3N5UoE4p23LDPR5ixju+U/P+mVUJLkZMAfcqpykuVq2xl6rwHJXhwSiJ981ABT2Nq5B37te4xhL+8GIzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8/GyBZE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8/GyBZE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so13796605e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532259; x=1791137059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPMqx5DJjU0b9uS8RIPTSXZoLLIVrIQblH4OXx3oAXU=;
        b=U8/GyBZE6aN9TCn91TzW0rUnalO3GyN7nUR7svqFkzWi1dZApC1w16r182KHK90vNB
         WLA04omlqJ1LgutpjYMABmP2EPILVqZ1Mm5JmxYY5vlBiuO2xLEihBH8qmWoAmID6Mg/
         y2D3K1u5gLiLEtlpI3v5JV4v777nEmoZrbCTEaHsN1jX/CiRng0/7hs42Xm7FjyJNLvB
         hRM9K0P4s26AV1Kcq9lLN4mvvjuh5poT1IzslXL8wlwnwFF0GwPJ7+UkntMOGQd8Lgtn
         gz1LtxmOSg2c5pi4YCCXyKpZwk6SpKQ6qFPadE5skF41V5iS82IbIfpAeEt7c/xq6kC6
         RGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532259; x=1791137059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPMqx5DJjU0b9uS8RIPTSXZoLLIVrIQblH4OXx3oAXU=;
        b=IcnyL5nNHfg1YBq75rkjp2n9rgfwAH4SwxDYTfO+tSY9c6Rzwwydg8N7sz3hOeUFJX
         jPSW3supizNNfis45vObZYhWT/3XWIKlk8h+VM8CAd4/Kca6RydctR+SUu20R8cqXMuu
         z5Py7Yji9G9FPMuR2M3kh2TNtZYggM9pWR57OvVZhPM8qArchm+SbHjpMOe7atY10pwy
         eJz1hsNU7z89dvZBDUeR3EF+KAqb8Sgyc4odRa03auwxrDbc0MdbtdOqEcqzj5hQA+z/
         al2bfyCw9k62A7XTx6gSYjDTuzEOnUyvxBetDbfsfQyf3e3Hsp4syHvvu9u3wbJtlK0z
         zw6A==
X-Forwarded-Encrypted: i=1; AKwUvBzgCZZ/K4RlJNoZAOips1lSKR3D2mthV72JujRycfOF/M6/ZcmX/SRhnTzCZcVbafRG9A+NFz4GVW0jELU=@vger.kernel.org
X-Gm-Message-State: AFuF++nB8z7YrwuPXDcjlwYVTOZUF4BStA/ghv0LYL+1VgFHKbvJUzIX
	nM4hFg9sVeGGBLWwrxt/RRH2NXLhPQ9HoPzWpt/oa5lSDajcnpzrLFEI
X-Gm-Gg: AYBFou2SVpspjR9ZvLV7fErNcvLhvbpe5nD/XU1ZsaaH7Dtnxg0OWmeb2FmlH1GaZsA
	VR4T6iZywaFS6y113RQtf6/nyvaHBXtljOepUeQSngh3afa3xcoQmANRqG9lD6LS35JzLN6uvIi
	zbYDyYBsvWWwp3vBOlv+NEOA61U2IOrqNy/RX6KU6+8Sr4KR7GiHwgT25o1oqEfywDj80Gpuplw
	yNxNypNuiC5Arg5vG+siI5Swp7SIFSd58zW4fm77F47EU7O53/jkeMAbie3LxoQEcf7Ev6VCN7e
	J6rJzzz20/7RvRC5m9Nas49814MS90UT44S/oNCYkO+3OsZK3tek2vnSoDefxHwt2n5anL5W/kl
	ksiHiuK7zuyLxONJGHRsd9dKxMcTQnsbGMlIH+pGlASpNS6nrGBz50UQnvjWdZi9JYMJnzUExWn
	3iaVbY0H+zirkWOmxYwyvPIqR/b7BNhsE0115qQhzXKrcuz9TMbIg1GQf1HOiBHw3kvht8EADr3
	TaWhd8/WTAiQTfrdeh+ZFZv9YTMLshTxzK/KAiq7Dhx74brNuC2H9qeNFJwnQ==
X-Received: by 2002:a05:600c:8b6e:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49fe66cccf5mr184527075e9.14.1790532258642;
        Sun, 27 Sep 2026 11:04:18 -0700 (PDT)
Received: from ubuntu-homeserver.home (83.22.35.167.ipv4.supernova.orange.pl. [83.22.35.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001904513sm108391545e9.10.2026.09.27.11.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:04:17 -0700 (PDT)
From: Viktor Pashaiev <w.paszajew@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org,
	Piotr Kalinski <callynsky.linux@proton.me>,
	Viktor Pashaiev <w.paszajew@gmail.com>
Subject: [PATCH] wifi: mt76: harden mt792x USB disconnect and prevent abort_roc deadlock
Date: Sun, 27 Sep 2026 18:04:15 +0000
Message-ID: <20260927180415.1498019-1-w.paszajew@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a MediaTek MT7921/MT7925 USB wireless device encounters
communication stalls (such as -110 ETIMEDOUT vendor requests on
MT_MIB_SDR9 during MAC watchdog survey), the USB core detects an
unresponsive bus and schedules an asynchronous device reset
(__usb_queue_reset_device -> usb_reset_device). If the reset cannot
recover the endpoint, usbcore initiates a forced interface unbind,
invoking mt792xu_disconnect().

In mt792xu_disconnect(), mt76_unregister_device() was previously
called without quiescing asynchronous workers or asserting
MT76_REMOVED:
1. mt76_unregister_device() invokes ieee80211_unregister_hw() ->
   dev_close(), which acquires rtnl_lock.
2. Under rtnl_lock, ieee80211_set_disassoc() triggers
   drv_mgd_complete_tx() -> mt7921_abort_roc(), which attempts to
   acquire dev->mt76.mutex.
3. Concurrently, mt792x_mac_work is running on the workqueue holding
   dev->mt76.mutex while looping on 3-second USB timeout requests.

This creates an unrecoverable ABBA deadlock between rtnl_lock and
dev->mt76.mutex. NetworkManager, ip link, and shutdown/reboot scripts
hang indefinitely in D state (uninterruptible sleep), requiring a
hard power-off.

Furthermore, during unbind or rmmod teardown, in-progress reset_work
(mt7921_mac_reset_work / mt7925_mac_reset_work) could race with
disconnect, waking queues or iterating active interfaces on a
removed adapter.

Fix this by:
1. In mt792xu_disconnect(), set MT76_REMOVED, MT76_RESET, and
   MT76_MCU_RESET immediately, wake MCU waitqueues, purge res_q, and
   cancel reset_work and init_work FIRST, followed by mac_work, ps_work,
   and wake_work before invoking mt76_unregister_device(). Setting
   MT76_REMOVED causes all pending and future USB register requests to
   fail immediately with -EIO. Also drop redundant mt76_worker_disable()
   to prevent WARN_ON_ONCE in kthread_park().
2. In mt7921_mac_reset_work() and mt7925_mac_reset_work(), check
   MT76_REMOVED. If set, abort reset immediately, preventing queue
   waking and interface iterations on a removed device.
3. In mt7921_abort_roc() and mt7925_abort_roc(), check MT76_REMOVED.
   If set, clear MT76_STATE_ROC and return immediately without waiting
   on dev->mt76.mutex or sending MCU commands over a disconnected bus.
4. In mt7921_mcu_parse_response() and mt7925_mcu_parse_response(),
   suppress timeout error logging and mt792x_reset() when MT76_MCU_RESET
   or MT76_REMOVED is set. This shared response parsing covers PCIe,
   SDIO, and USB buses, eliminating spurious teardown noise and
   preventing reset_work from being re-queued onto the workqueue after
   disconnect has cancelled it and shortly before mt76_free_device()
   destroys it.

Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2167595
Tested-by: Piotr Kalinski <callynsky.linux@proton.me>
Signed-off-by: Viktor Pashaiev <w.paszajew@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c  | 12 +++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7921/main.c |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  | 11 ++++++++---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 10 ++++++++--
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c  | 10 +++++-----
 7 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index e69978184f..7a43472db5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -664,6 +664,9 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	struct mt76_connac_pm *pm = &dev->pm;
 	int i, ret;
 
+	if (test_bit(MT76_REMOVED, &dev->mphy.state))
+		return;
+
 	dev_dbg(dev->mt76.dev, "chip reset\n");
 	set_bit(MT76_RESET, &dev->mphy.state);
 	dev->hw_full_reset = true;
@@ -674,6 +677,9 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	cancel_work_sync(&pm->wake_work);
 
 	for (i = 0; i < 10; i++) {
+		if (test_bit(MT76_REMOVED, &dev->mphy.state))
+			goto out;
+
 		if (atomic_read(&dev->mt76.bus_hung))
 			return;
 
@@ -700,9 +706,13 @@ void mt7921_mac_reset_work(struct work_struct *work)
 		ieee80211_scan_completed(dev->mphy.hw, &info);
 	}
 
+out:
 	dev->hw_full_reset = false;
-	clear_bit(MT76_RESET, &dev->mphy.state);
 	pm->suspended = false;
+	if (test_bit(MT76_REMOVED, &dev->mphy.state))
+		return;
+
+	clear_bit(MT76_RESET, &dev->mphy.state);
 	ieee80211_wake_queues(hw);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 68a059504e..f189a8a13b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -410,6 +410,11 @@ static int mt7921_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif)
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
+	if (test_bit(MT76_REMOVED, &phy->mt76->state)) {
+		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+		return 0;
+	}
+
 	mt792x_mutex_acquire(phy->dev);
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		err = mt7921_mcu_abort_roc(phy, vif, phy->roc_token_id);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 40546005c7..a1dd9d83fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -20,9 +20,14 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 	int ret = 0;
 
 	if (!skb) {
-		dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
-			cmd, seq);
-		mt792x_reset(mdev);
+		struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+
+		if (!test_bit(MT76_MCU_RESET, &dev->mphy.state) &&
+		    !test_bit(MT76_REMOVED, &dev->mphy.state)) {
+			dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
+				cmd, seq);
+			mt792x_reset(mdev);
+		}
 
 		return -ETIMEDOUT;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 101f571b02..a48082ac09 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1516,6 +1516,9 @@ void mt7925_mac_reset_work(struct work_struct *work)
 	struct mt76_connac_pm *pm = &dev->pm;
 	int i, ret;
 
+	if (test_bit(MT76_REMOVED, &dev->mphy.state))
+		return;
+
 	if (atomic_read(&dev->mt76.bus_hung))
 		return;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 5993b31e1a..c88219dd0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -556,6 +556,11 @@ static int mt7925_abort_roc(struct mt792x_phy *phy,
 	timer_delete_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
+	if (test_bit(MT76_REMOVED, &phy->mt76->state)) {
+		clear_bit(MT76_STATE_ROC, &phy->mt76->state);
+		return 0;
+	}
+
 	mt792x_mutex_acquire(phy->dev);
 	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
 		err = mt7925_mcu_abort_roc(phy, mconf, phy->roc_token_id);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index fa29c486a4..211118f416 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -27,8 +27,14 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 	int ret = 0;
 
 	if (!skb) {
-		dev_err(mdev->dev, "Message %08x (seq %d) timeout\n", cmd, seq);
-		mt792x_reset(mdev);
+		struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+
+		if (!test_bit(MT76_MCU_RESET, &dev->mphy.state) &&
+		    !test_bit(MT76_REMOVED, &dev->mphy.state)) {
+			dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
+				cmd, seq);
+			mt792x_reset(mdev);
+		}
 
 		return -ETIMEDOUT;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 850f6b2cfc..b41903cfec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -501,6 +501,7 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 	if (!dev)
 		return;
 
+	set_bit(MT76_REMOVED, &dev->mphy.state);
 	set_bit(MT76_RESET, &dev->mphy.state);
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
 	clear_bit(MT76_STATE_RUNNING, &dev->mphy.state);
@@ -509,16 +510,15 @@ void mt792xu_disconnect(struct usb_interface *usb_intf)
 
 	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->init_work);
-	mt76_worker_disable(&dev->mt76.tx_worker);
+	cancel_delayed_work_sync(&dev->mphy.mac_work);
+	cancel_delayed_work_sync(&dev->pm.ps_work);
+	cancel_work_sync(&dev->pm.wake_work);
 	mt792xu_reset_work_cleanup(dev);
-	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state)) {
-		set_bit(MT76_REMOVED, &dev->mphy.state);
+	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
 		return;
-	}
 
 	mt76_unregister_device(&dev->mt76);
 	mt792xu_cleanup(dev);
-	set_bit(MT76_REMOVED, &dev->mphy.state);
 
 	usb_set_intfdata(usb_intf, NULL);
 
-- 
2.43.0

