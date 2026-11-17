Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899783;
	b=3neL4XTSql74oFoqXiv2ecXClVWEdUqUuczikatGiacox8d8nJNia5gcyum+OnLrj0Wg
	 qx1YDpInr8Q0XlZbnYaps/h7XA5hDRBPWm95dCQb5u0Dm8CSKWD4i1c9PbM6i3gaK5j9Z
	 WqHe2bNWc3+aRk6kHCrYQ4gr1nlr3R1mj5fqMKvkMUKTQyo4E6PRiywCWhrUGpi0HO7oK
	 zgKf+T2mQGHedRc9EwVu89EpO1vDf8D0FC5Pc1jvj34M4kTS+JfH7tgRa62woCJfv483X
	 ppSO84pSlyFM0PqjhqSSBnHWshsbQwXiNRq5tu2qYwkJiMX4aW6sntrzpD3T4tDt8lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iPbykAjM2KihUa5Sh4xoXK3GH9BaSLsm1lCB+iKFMRU=;
	b=5Iqc8aQDUYYYb4loDmd3ECXFHhU0PZWkqy36KDyOkVKHM+c4Pyb2REXykvJstv2wpb/E
	 ggrtDIjfVcnfQFE7FLaRi6fEcPc/LEdqiRntpGpXEqHqs1nnN61qVFo6Ltrnn/XnnLXLv
	 IGTQplAfkex/XnfDopyn+Mr/kfenuAW3YF/wcGTLj3fF92ScE27YEe60cyuQTFzIVl2Ww
	 b1+6tBbW5u+jPtVGQeHOp5HT/iS3eCmEFbc0nglM4MdxGf4STBFon2aGsLbejfdbohxUG
	 rzGf4+ZBUWTYDaba8wusuFsAhDlg7FqcVI+KnpRTNVHP2gF4O8azA5hAI0yiCueEwjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPFZdccK;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479EE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPFZdccK
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a42b34e930so207213f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899782; x=1795504582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPbykAjM2KihUa5Sh4xoXK3GH9BaSLsm1lCB+iKFMRU=;
        b=CPFZdccKdScZ/P5CkW5xdiXDwi8haBYzGVqQmHgTUTtsHXhXkiXkC4exXm9/+bfVqW
         1d7yZPNg7rETf6bH0y11Jv0euftyRe9Wmli8+6rgXtH5Hf9U+qo4sT6ELpLB9j4EDrXg
         9cDQVXetebzYefy7NtAyaNyGTpGm3pzNpzRtMrwP3Wba/WdjMuT1G0FSnzhzVKn5GzNU
         fYHIhOJDWC5FXtHJB1CVyuPTVAcY2WIcO9PQri1duRpZCAvVfWKlmuBU3zXXs+QSsCWU
         74BVbvYSpzLd65F7QryB8c7GkqRNKvkMzHfNg9F8TfOdhqoct45a1oNBoRMY9VewxvHd
         uNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899782; x=1795504582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPbykAjM2KihUa5Sh4xoXK3GH9BaSLsm1lCB+iKFMRU=;
        b=mBUL4Lj10kpGU/6FNicj0nMNA1MPW41XC1PDtseVxmiqsgeOT12REfuOOOQOHsR5+K
         WVutUKXQdAEnpAiaEsxcqnh4FKJMZUDJOMCJfQtgoJXxYTQsgRbNOzg5E8liHbLI7yJ+
         w2/pIN1awA28xfyO8oAma7SPfs84ZkVp+C+nPynBpmxsSG+Y/Z+1Ku5JYXqOi5LbWQ1N
         u3FZTeQm2yEghGRbwKx+T+YR5xH73zigSnhPaYUhtLmIW678Jok1M8tOHVtNIzZvIZsS
         XP30yz3qY4BtsnwpYEa+OBCGgGLNPiEVMsuKgQGYPzNqJTvfwQNDtar9YLGwlaB5sntE
         +Ziw==
X-Forwarded-Encrypted: i=1; AL+hErHZVG+8ZjogW0dxNMbX5HMJQl+/wWNJXvNC1bnP3O1d7zUYsrKdnfmIoHsg25djSJdOrhxSVaKUczDphek=@vger.kernel.org
X-Gm-Message-State: APuU4Z80VkZzznbqxb8De+aMeyc6HLp04Pp8bzyD+OoWfENbwOK4cMqN
	AA06PYiVstvOiN935DUEaM2/G2rMCDCu1Bt1mweFwjX5Fqs92/ob9khLxn71k5EM
X-Gm-Gg: AZFdTZeSh+rfwGnmeTX5NHmR/EPePf6+M1eZiXs178+LtZmvdHtzBTWrV0hqPeq9O4H
	JhDltgw8Hu57sfjT+c6uCI/l26eb3rEYrgyUiexy920VVfNqq0fWWKqan0slebki7qjf4Ut061h
	DnZbughvRVHjbuCuJV7DmXdGUEHxz5RhWlGX3xpMuad8gADt7+IW/jaY0SN4IGnWjVodS2coMpx
	5vx2D5xpZR/e9e3u5pawS6lc/xJ/USC22vqAq6j5fEhI9j/dh7Nx6yaqI+UWqKFfLYsxZR3YwUo
	V3vdzwZ09Mwqdtxt9V8RwhZmUmEfzaAofyYpO37xFC546agy7NjoVL2tGstfOqvLew8R1fOAO53
	MUr7ABBSztgD/fyuvwndu3o6MFQ78Y+mBmbyd0K0LnRy5umKGzdCZYyigTNOre0RPA1MgByB2nm
	hmCk1hvxedSF60oHZZBuUSpU7sZD/t0BJv+s9zvj1HvygbECcR3ECfuhhiuqHZ331+4nRgOAv3G
	qX8I5Hrik5iLxCsMv/H6Kofacgvvgxgw+T4t1MHnAv+5/hKWOwCWNZwlGQ1rMXPWOGfFWJBsKnm
	JyCp7kgyRLH5YQGusdbbgoyEjMl6f6oo3zxq
X-Received: by 2002:a05:6000:4a08:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-49c6d63fbc3mr25184259f8f.1.1794899781483;
        Mon, 16 Nov 2026 23:16:21 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a43d41ec38sm1826552f8f.19.2026.11.16.23.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:16:21 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next v2] wifi: ath9k_htc: count a frame as queued before it is sent
Date: Tue, 17 Nov 2026 08:16:20 +0100
Message-ID: <20261117071620.1650281-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

ath9k_htc_tx() hands the frame to the device and counts it in
tx.queued_cnt afterwards. The TX status of the frame is handled in the
WMI event tasklet, which can run before the sender gets to the counter.
ath9k_htc_tx_process() then takes the counter below zero, warns and
sets it to zero, and the sender's increment leaves it one too high for
good:

WARNING: CPU: 0 PID: 348 at drivers/net/wireless/ath/ath9k/htc_drv_txrx.c:510 ath9k_htc_tx_process+0x400/0x558 [ath9k_htc]
Call trace:
 ath9k_htc_tx_process+0x400/0x558 [ath9k_htc]
 ath9k_htc_txstatus+0x58/0x140 [ath9k_htc]
 ath9k_wmi_event_tasklet+0x16c/0x17c [ath9k_htc]
 tasklet_action_common+0x108/0x150

Count the frame before it is sent. If the send fails, take the count
back and wake the queues it may have stopped, under one lock.

Fixes: 8e86a54715c4 ("ath9k_htc: Fix TX queue management")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
- the count is taken back and the queues woken under one lock, in
  __ath9k_htc_check_wake_queues() (Toke)
- rebased on ath9k-pending main

v1: https://lore.kernel.org/r/20261111215902.574916-1-mehmet.fide@gmail.com/

 drivers/net/wireless/ath/ath9k/htc.h          | 1 +
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 5 +++--
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 9 ++++++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc.h b/drivers/net/wireless/ath/ath9k/htc.h
index 59e0b3cf7f0f..0aaa6a96b86e 100644
--- a/drivers/net/wireless/ath/ath9k/htc.h
+++ b/drivers/net/wireless/ath/ath9k/htc.h
@@ -581,6 +581,7 @@ int get_hw_qnum(u16 queue, int *hwq_map);
 int ath_htc_txq_update(struct ath9k_htc_priv *priv, int qnum,
 		       struct ath9k_tx_queue_info *qinfo);
 void ath9k_htc_check_stop_queues(struct ath9k_htc_priv *priv);
+void __ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv, bool decrement);
 void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv);
 int ath9k_htc_tx_get_slot(struct ath9k_htc_priv *priv);
 void ath9k_htc_tx_clear_slot(struct ath9k_htc_priv *priv, int slot);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index b46be3682f21..3c52e66c79f4 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -888,17 +888,18 @@ static void ath9k_htc_tx(struct ieee80211_hw *hw,
 		goto fail_tx;
 	}
 
+	ath9k_htc_check_stop_queues(priv);
+
 	ret = ath9k_htc_tx_start(priv, control->sta, skb, slot, false);
 	if (ret != 0) {
 		ath_dbg(common, XMIT, "Tx failed\n");
 		goto clear_slot;
 	}
 
-	ath9k_htc_check_stop_queues(priv);
-
 	return;
 
 clear_slot:
+	__ath9k_htc_check_wake_queues(priv, true);
 	ath9k_htc_tx_clear_slot(priv, slot);
 fail_tx:
 	dev_kfree_skb_any(skb);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index 95f48c7dca15..4369a17fb4d4 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -65,9 +65,11 @@ void ath9k_htc_check_stop_queues(struct ath9k_htc_priv *priv)
 	spin_unlock_bh(&priv->tx.tx_lock);
 }
 
-void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv)
+void __ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv, bool decrement)
 {
 	spin_lock_bh(&priv->tx.tx_lock);
+	if (decrement)
+		priv->tx.queued_cnt--;
 	if ((priv->tx.queued_cnt < ATH9K_HTC_TX_THRESHOLD) &&
 	    (priv->tx.flags & ATH9K_HTC_OP_TX_QUEUES_STOP)) {
 		priv->tx.flags &= ~ATH9K_HTC_OP_TX_QUEUES_STOP;
@@ -76,6 +78,11 @@ void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv)
 	spin_unlock_bh(&priv->tx.tx_lock);
 }
 
+void ath9k_htc_check_wake_queues(struct ath9k_htc_priv *priv)
+{
+	__ath9k_htc_check_wake_queues(priv, false);
+}
+
 int ath9k_htc_tx_get_slot(struct ath9k_htc_priv *priv)
 {
 	int slot;

base-commit: 465fcc982a221f774594aa7d7351fde8c03a3deb
-- 
2.56.0

