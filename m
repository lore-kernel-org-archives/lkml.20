Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197253;
	b=5YNjr+/7hqbaFpRqTC//KsI6t5VrlVU0/ce5BiBLpln+4lLt6P6bZygg/mh0qdag9C1u
	 mPdXLksdl/x5N5+gR50O7seynQJyoguz3nnw4xqRGnzsflff4nbBZ88o/Q8BxlPPXJgTM
	 bCTEV+H13+wAhx0RnmMWJrT+vlh9ZVptswrqx2beOMQjgfDQeMVgZFEWtiAyrPLJuiAYo
	 tym27wAVDBqiGikhRo8iW0mbe0qh6WFaQcLIk6y1PwCOLtHeDWIXhjxKrMCUgi36vPbW8
	 S4FMNL2S2Yv872LRe5B7MangIh00BU+msz7mug4zB/YnkP/RZI2PBi4Q2l0hbNQJRvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hW/jBrywUVcMLNkiFu8jFLQbjFXHdm+U5asdpiowAvY=;
	b=j57FXJf3AeiwiTNkLp8KN4Y7ST6ypyl5ghnKRII7GlQfwF0N0OOQKBU7C6dx6dzMaAf0
	 ya452s7rCLFtgl73mfrZPvLGJ8DTEDPiMvWPjH4rKv/XnHP9oSY41Y3Qkhq3dIulFcIQS
	 W5Yuwk0yYo9gTTi/fb1DgOcIsaQN4jmdRFEKB+86JXl4fn4Z3aediLZtqyZyZnKJ3+Ja+
	 LOlEoq/Gpj6taIK+grIywINchc+s7LqxcFVMJuV2BPiXBhCkkkES7m8/qMWI26NkCaq7o
	 SiuJC/OJGCSWJcZHIHeWxEgeUEqfIut93eoHehaZmUJi+OI8TBV0o6/6F7U53kIsxsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5CONt2K;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08328606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08328606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5CONt2K
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso598676a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197252; x=1793802052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW/jBrywUVcMLNkiFu8jFLQbjFXHdm+U5asdpiowAvY=;
        b=b5CONt2KrHnCCGOdicDIoytk7EbSYWQ3movKqD/9VWx0m+hjzpUVBFP+zWXQ8EOzlv
         6QGK775Bx7WuSrMpwMoA5KdPT/rrCRrgHFAAvEixbS7QBnjoxi0cpjY9ulS30iQ22qRU
         bEKP49JnSTRMAZv8UNyMP4L2Y0bt9YmsC/6NoK/6kv8fd1AMgXCIEjKDwYaSLr697/SR
         /tfDHaY66X8bnbjG1NCFT45eLhuK/SXYs+qy++ttbqxjoyOJuUphJYZujdrF7I0n4hWz
         np+nIBDYu/ZdSGibspgNv1PWJoZKEselm94p1IE5oBtdRtW/PfC1M6q0PAoMiDoli+cE
         HfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197252; x=1793802052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hW/jBrywUVcMLNkiFu8jFLQbjFXHdm+U5asdpiowAvY=;
        b=Ag0sRmIDRKyKGAZ+/iRAgpKGHKynLTXKJm+CPCpPaPhE5InRU5aQ02sEYbmZHBLDhE
         3ns8qpfBPnf4jViUsiq1UhjVVSpvPsQ3NEDRPxDjU5SaexMhLjvqElYLOFo4W2aGPFLc
         1zCZ+7dh59CpHBxGX8ax5WQzgLwKC11KzjVahrnSGKX4gpA9Ou9m7Mt6S1y1vmkfbUy7
         0cq5WCRUmnRUf9gB1lc+SBLv4ar5TBA8u2jqi2Ur4TNOZ+bAAYeKLACsP0w00CclwJX0
         ay+6LZkJuu1Sn8jM3Rqh/vmg0NbYO3jjlKgVO2c8B+5qOsRUal9SGXmu/AU3xKLIMMvn
         6f1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwCKg07Zxdkqiw1aLgW2H9IhneL+su+ETBe+Pwcy6FOmHMDlhAN9Q+A3jDAJoZKiWSkf4RHDQMHzBiVSQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpm7BAVHCrvEyqDHbC7MczpXVibfZX+d0EkbC6Kx55B4koaotc
	C2KDaiprm84X+r3V0hbHwcajCudyChCRDSXgiDk6Y+6uTNQfw6o0QiMu
X-Gm-Gg: AYBFou1cx1QyP1wnCGNx2MLTcv5Es5vhNslRT25Yq04Wga/cOzPaVyIRkOsKsqmBn9L
	ikt0tcu2ijfcmytUiQ0Vova9oWr8y0eBkCIbCIrjEybRjsEYGjys+slYFqvOqbpUBnfUqsu4umw
	JiYuVdne420sru5FiO+cL4bJHHxHZDiIubZIv9fSKry+YGs5Zh2EX0bcrwrjCZjA+WByhc7kayQ
	CM5ygHKOynjDf2FT/nPqYeTt8O98sO/xrl76XVSl7e2zxuSC9YM6d71hHnMw4K4fnx5ybg4tyIc
	ih+s0TBVEOrSYlwMtD++3qVO0RzeP3e+3h++DylxJvY8B+XcdPOGiuooC9Z37yPHHiKBcoYkNCI
	dV75Ivw2xKkaztJVQDN4KInmzMXbDcB/mmd0Q/Ufq5bi6RCNEldNKLSpo4LFIqK1xlRa7VFQQhR
	+QJKGdkfAjjTfBHuSJLWspQIBeJy80eFXrZVUBSUWwu7SerdwRicIKYF8emXU5pEBcQcEKYsZut
	zjsyEGlxXJzI7ZQb85U3xGkcs2bBxZn6zbpU3NmtJpxPqilSKYcldzbBvmYgs3hk/qBDh8TOdda
	CWSmQMVEgjAJUbC7+mV7totBXFxW3Us3HF0lUs7bDL3eiIU2LJP9nd0tnFCJwIhuAHEU
X-Received: by 2002:a17:90b:2ecc:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3ae57e3bc3dmr1911826a91.7.1793197252041;
        Wed, 28 Oct 2026 07:20:52 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm3765987a91.8.2026.10.28.07.20.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:20:51 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jiangshan Yi <yijiangshan@kylinos.cn>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Stefan Hansson <newbyte@postmarketos.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Jeongjun Park <aha310510@gmail.com>,
	Fariya Fatima <fariyaf@gmail.com>,
	"John W. Linville" <linville@tuxdriver.com>,
	Amitkumar Karwar <amit.karwar@redpinesignals.com>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: rsi: stop WLAN threads before teardown
Date: Wed, 28 Oct 2026 22:20:14 +0800
Message-ID: <20261028142015.10717-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028142015.10717-1-enderaoelyther@gmail.com>
References: <20261028142015.10717-1-enderaoelyther@gmail.com>
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

Disconnect and probe unwind can leave RSI packet threads using mac80211
state or a bus that teardown has already released.

The USB path unregisters mac80211 before stopping RX and can free its
shared TX buffer while the WLAN TX thread is running. The SDIO paths can
leave WLAN TX active across mac80211 detach or function disable. Waking
the TX thread to stop it can also drain queued packets because its
processing loop does not check the stop request.

Make repeated thread stops harmless, and stop the TX drain loop when
teardown requests it. On USB, stop the RX URBs and the WLAN RX and TX
threads before detaching mac80211. Leave coexistence TX and its shared
buffer available until HCI unregister completes. On SDIO, stop WLAN TX
before mac80211 detach and function disable, including probe unwind.

LLM assistance was used to find the bug and review.

Fixes: dad0d04fa7ba ("rsi: Add RS9113 wireless driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: W=1 module builds with MODPOST passed for every prefix with
CONFIG_RSI_COEX enabled and disabled. The series applies to v7.3.
Not reproduced; RS9113/RS9116 hardware was unavailable.
Sparse C=2 passed. Smatch across all configured translation units under
drivers/net/wireless/rsi introduced no new diagnostics.

 drivers/net/wireless/rsi/rsi_91x_core.c |  2 +-
 drivers/net/wireless/rsi/rsi_91x_sdio.c |  2 ++
 drivers/net/wireless/rsi/rsi_91x_usb.c  | 13 +++++++++----
 drivers/net/wireless/rsi/rsi_common.h   |  4 ++++
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_core.c b/drivers/net/wireless/rsi/rsi_91x_core.c
index 3281fc94e107..2555bb53766d 100644
--- a/drivers/net/wireless/rsi/rsi_91x_core.c
+++ b/drivers/net/wireless/rsi/rsi_91x_core.c
@@ -267,7 +267,7 @@ void rsi_core_qos_processor(struct rsi_common *common)
 	int status;
 
 	tstamp_1 = jiffies;
-	while (1) {
+	while (!atomic_read(&common->tx_thread.thread_done)) {
 		q_num = rsi_core_determine_hal_queue(common);
 		rsi_dbg(DATA_TX_ZONE,
 			"%s: Queue number = %d\n", __func__, q_num);
diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio.c b/drivers/net/wireless/rsi/rsi_91x_sdio.c
index bfa386b820d8..c5619a34940d 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio.c
@@ -1079,6 +1079,7 @@ static int rsi_probe(struct sdio_func *pfunction,
 fail_claim_irq:
 	rsi_kill_thread(&sdev->rx_thread);
 fail_kill_thread:
+	rsi_kill_thread(&adapter->priv->tx_thread);
 	sdio_claim_host(pfunction);
 	sdio_disable_func(pfunction);
 	sdio_release_host(pfunction);
@@ -1220,6 +1221,7 @@ static void rsi_disconnect(struct sdio_func *pfunction)
 	sdio_release_host(pfunction);
 	mdelay(10);
 
+	rsi_kill_thread(&adapter->priv->tx_thread);
 	rsi_mac80211_detach(adapter);
 	mdelay(10);
 
diff --git a/drivers/net/wireless/rsi/rsi_91x_usb.c b/drivers/net/wireless/rsi/rsi_91x_usb.c
index 8765cac6f875..99e029e66407 100644
--- a/drivers/net/wireless/rsi/rsi_91x_usb.c
+++ b/drivers/net/wireless/rsi/rsi_91x_usb.c
@@ -562,6 +562,7 @@ static void rsi_deinit_usb_interface(struct rsi_hw *adapter)
 	struct rsi_91x_usbdev *dev = adapter->rsi_dev;
 
 	rsi_kill_thread(&dev->rx_thread);
+	rsi_kill_thread(&adapter->priv->tx_thread);
 
 	usb_free_urb(dev->rx_cb[0].rx_urb);
 	if (adapter->priv->coex_mode > 1)
@@ -873,12 +874,20 @@ static int rsi_probe(struct usb_interface *pfunction,
 static void rsi_disconnect(struct usb_interface *pfunction)
 {
 	struct rsi_hw *adapter = usb_get_intfdata(pfunction);
+	struct rsi_91x_usbdev *dev;
 
 	if (!adapter)
 		return;
+	dev = adapter->rsi_dev;
 
 	rsi_mac80211_rfkill_exit(adapter);
 
+	if (adapter->priv->coex_mode > 1)
+		rsi_rx_urb_kill(adapter, BT_EP);
+	rsi_rx_urb_kill(adapter, WLAN_EP);
+	rsi_kill_thread(&dev->rx_thread);
+	rsi_kill_thread(&adapter->priv->tx_thread);
+
 	rsi_mac80211_detach(adapter);
 
 	if (IS_ENABLED(CONFIG_RSI_COEX) && adapter->priv->coex_mode > 1 &&
@@ -887,10 +896,6 @@ static void rsi_disconnect(struct usb_interface *pfunction)
 		adapter->priv->bt_adapter = NULL;
 	}
 
-	if (adapter->priv->coex_mode > 1)
-		rsi_rx_urb_kill(adapter, BT_EP);
-	rsi_rx_urb_kill(adapter, WLAN_EP);
-
 	rsi_reset_card(adapter);
 	rsi_deinit_usb_interface(adapter);
 	rsi_91x_deinit(adapter);
diff --git a/drivers/net/wireless/rsi/rsi_common.h b/drivers/net/wireless/rsi/rsi_common.h
index 2a33a81f71a3..2407ec61d412 100644
--- a/drivers/net/wireless/rsi/rsi_common.h
+++ b/drivers/net/wireless/rsi/rsi_common.h
@@ -72,9 +72,13 @@ static inline int rsi_create_kthread(struct rsi_common *common,
 
 static inline void rsi_kill_thread(struct rsi_thread *handle)
 {
+	if (IS_ERR_OR_NULL(handle->task))
+		return;
+
 	atomic_inc(&handle->thread_done);
 	rsi_set_event(&handle->event);
 	wait_for_completion(&handle->completion);
+	handle->task = NULL;
 }
 
 void rsi_mac80211_detach(struct rsi_hw *hw);
-- 
2.56.0

