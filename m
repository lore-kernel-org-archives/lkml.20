Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197262;
	b=cWfUFFvyoEVyhiQgIQDl4uXrflZukTRdWAn53XtCRA1OI5HaF91BRkXhnmJEw4U+n0+Z
	 u6qYT4dzka55DqyQKrDgTXfjsttp5gBCxDy/VaOFYnss50XepQUmqwOXiLHt1T+zRSf4q
	 MKdCJT2SjJ8F4cECV1V2+cMcWBGqGRlNG/VVh2/kZyIKk4UkxvAlQtutelSbx0iazWlM4
	 7RYJBWezDtzlNaJ64tY3lUru80i5hHznfrCLlSKtVNaA1ZUoBErFYIqSTbU8siwqwd2BH
	 GbhGDZ3uZfwmEAVRbNjINbvUGfARhRHA4vhmcvSEyjGWHAov5scMaEM7XL3htBx2cSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qwRMYLppqpZ4JvHW9o9Mj3PLiFTrNWGk39CZa3Pb7gs=;
	b=t0ePN2Itg+ZdXn00LqZIbDluE/JEIxyoJOsTAChOJsGNuEVWCYsqVLwh0h7cdcqY2g3q
	 bc+Gyqc2xgMXdenhDq2g07a4hnBEp1yZM7GA9nLmIjiFSBm8xPZJUeINGcxU9uZds/S88
	 fk37R6IG+tKhdKFQzAanGRTBRVCqcqCWm8UYt14/4EQ8JBXvkyPJIhO92g8a32EBMfXi+
	 nnChDDS/osc6YYMQRXCa3GQN8JpfkzIWRaK5gzVNGECgQrGLjjJygqFnR9Fnihs1Lm1tb
	 m30pANfiiDTx/qITyOiP0rwSZ5wWrqIlzByHykeUbDKeYwRshSi3BZqw+RBOuC8z4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1mg7UO0;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA0606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EA0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1mg7UO0
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso629937a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197261; x=1793802061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwRMYLppqpZ4JvHW9o9Mj3PLiFTrNWGk39CZa3Pb7gs=;
        b=k1mg7UO0O2KR5JkYyKQFxUPs5xS+KdpIt/bw8zhkPJY6wyXXch/BqY7ozlkBOmGasR
         RQD5NeiKBPGYHz0XHnSxdh31gVpzRtXmR3OivKFZZluuq/Jj8dokLIQADH8U2AjYG9P8
         1mxy46QI6WptBzkrKjkOB9kE/KIYOEL28mkfxCEk4cu1KLsR6Q2c8mg5H8jELOWxpH5I
         RE/0idxG9UKk34+fsXVIMAcD5Ynv8UaFO9KPawtWWDgqmaJDr7vZ00yaeDM5pcgQ6PdU
         gSqhUyrIsSd3KXLujbotu8wsXwveiZWloOzrIbnxCRHqv4oJy8zpQrgg6myxzTjrfcDZ
         diOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197261; x=1793802061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwRMYLppqpZ4JvHW9o9Mj3PLiFTrNWGk39CZa3Pb7gs=;
        b=KZ4tnDVkFtqFzoNhh9E+FB40pMV2Gq2RYKvQwqE+kXbZN5hNv3CzrYrwkLExUNbMMT
         6n5q4aj041PSvDo2wSuv8E3ckIXE2BDYqgmNv9R/kh6pWanI4PyhBngZ73/aToC52KdI
         jU9Hlk6B7pSRrwrusZdz6f2Ml5GwK7p5Ppozn8iNvgGcPViAP9B3nCaOOdJyrJhnDuXT
         BLwHl4o2FqKS+v1gEnJtw2s+NFL/ZpKH8XITRhDlF2luZ3nO5nTZ+UOlJcd3UiCVts+q
         FhJChnrlIwVpB7F0goS/Tqm/h7zT5Uo01M+mCIOsev9u+IAde6MYsSW0yBxNsf0/s5mP
         tuUA==
X-Forwarded-Encrypted: i=1; AKwUvBz1wcsHIfMoT6onR88gnKNY0vLJK8gH1nKKrpx3DvR/Xp4JoeEFOSKTKbIGXuAnSEcRtbXP1TNiE42Kh94=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfgQg4AQtIJyh1UG6Jsv1xxhkyK/bav2h6mJr+y8nDLasISn2o
	PciL6GaFZAS1bxgdaqJVTanX4om9kZvb0tXKl1+ceje29o4aT+b2yL/D
X-Gm-Gg: AYBFou3hdgGQBXgR+fP/sEnJT/pTg1KjeWhyi0NDmGygA7fN8NHsSBMRUepVncEa6o3
	KjrbuENVyFaJfKqcYCs7KBGKwQpexnnywWMRayurlYuQfy2NZbR5vrj7s0e6r8ktd/BBP6ov8NU
	hYPi8Azq2Yo4cB3SbXwy2DBn27cly8+i8GYPRGSGU0rcQij83lXbleHqVwOoatgbgadlycc8ExX
	PLNIRKEF95GpG+xbDsscctUeD5O6ZdmvhT2Sl+H1/zNrQKGclU07oVJ9c68oLZ2HCfnaRAdCZnk
	HpBvlhlp20pbEFE+EWSobvWmqA0TZRAng3smNXG/aW8SzjY9BBHsbpAleWTTm/zB9Qah0uQPZhU
	sRXPfUtr1kIACf0QTJdjmZ/9WoRnmirm7Xuy9JtUsCtvro1c4r1U8hXLksSdRxkTth/PRJrxZ1H
	s5CHhUh4N0Jb/5mocz2mYOxLhXUyp8fsvJT35Rm8yOwRCYZlsYMPU7mkZAwWPkw1R7OjrC1953+
	hVQRtjIWfWJdHTiiOjy6TGFhPWLswVVsFYhFOpokIUglFPpsMYqk3K6FFVHs91Px2jFt+FwqRuQ
	nGQl342kVpCYXwIIQE1OWQyvXxTRMxoG2XkmGDkAtKavV2/3VJ302j7jVfoU9wzRqL9b
X-Received: by 2002:a17:90b:4c49:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3ae580cd137mr1917344a91.26.1793197261055;
        Wed, 28 Oct 2026 07:21:01 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm3765987a91.8.2026.10.28.07.20.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:21:00 -0700 (PDT)
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
Subject: [PATCH 2/2] wifi: rsi: stop coexistence TX before bus teardown
Date: Wed, 28 Oct 2026 22:20:15 +0800
Message-ID: <20261028142015.10717-3-enderaoelyther@gmail.com>
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

The coexistence TX thread can continue using an RSI bus after disconnect
resets or disables it. On USB, interface cleanup can also free the shared
TX buffer before the final core cleanup stops the thread.

rsi_coex_detach() only stops the thread from rsi_91x_deinit(), after the
bus has been reset or disabled. Its stop wakeup first drains any queued
Bluetooth packets through that unavailable bus.

Check the stop request before each queued packet. Stop coexistence TX
once HCI unregister has completed and before USB reset. Also stop it in
interface cleanup before freeing the TX buffer so probe unwind is
covered. On SDIO, stop it before chip reset and function disable on
disconnect, and before function disable during probe unwind.

rsi_coex_detach() still purges and frees the queues. The repeated stops
are harmless after the previous patch.

LLM assistance was used to find the bug and review.

Fixes: 716b840c7641 ("rsi: handle BT traffic in driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: W=1 module builds with MODPOST passed for every prefix with
CONFIG_RSI_COEX enabled and disabled. The series applies to v7.3.
Not reproduced; RS9113/RS9116 hardware was unavailable.
Sparse C=2 passed. Smatch across all configured translation units under
drivers/net/wireless/rsi introduced no new diagnostics.

 drivers/net/wireless/rsi/rsi_91x_coex.c |  3 +++
 drivers/net/wireless/rsi/rsi_91x_sdio.c |  3 +++
 drivers/net/wireless/rsi/rsi_91x_usb.c  |  2 ++
 drivers/net/wireless/rsi/rsi_coex.h     | 12 ++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/rsi/rsi_91x_coex.c b/drivers/net/wireless/rsi/rsi_91x_coex.c
index 023c539fc384..de2a973873ef 100644
--- a/drivers/net/wireless/rsi/rsi_91x_coex.c
+++ b/drivers/net/wireless/rsi/rsi_91x_coex.c
@@ -40,6 +40,9 @@ static void rsi_coex_sched_tx_pkts(struct rsi_coex_ctrl_block *coex_cb)
 	struct sk_buff *skb;
 
 	do {
+		if (atomic_read(&coex_cb->coex_tx_thread.thread_done))
+			break;
+
 		coex_q = rsi_coex_determine_coex_q(coex_cb);
 		rsi_dbg(INFO_ZONE, "queue = %d\n", coex_q);
 
diff --git a/drivers/net/wireless/rsi/rsi_91x_sdio.c b/drivers/net/wireless/rsi/rsi_91x_sdio.c
index c5619a34940d..87108f4a4326 100644
--- a/drivers/net/wireless/rsi/rsi_91x_sdio.c
+++ b/drivers/net/wireless/rsi/rsi_91x_sdio.c
@@ -1080,6 +1080,7 @@ static int rsi_probe(struct sdio_func *pfunction,
 	rsi_kill_thread(&sdev->rx_thread);
 fail_kill_thread:
 	rsi_kill_thread(&adapter->priv->tx_thread);
+	rsi_coex_stop_thread(adapter->priv);
 	sdio_claim_host(pfunction);
 	sdio_disable_func(pfunction);
 	sdio_release_host(pfunction);
@@ -1231,6 +1232,8 @@ static void rsi_disconnect(struct sdio_func *pfunction)
 		adapter->priv->bt_adapter = NULL;
 	}
 
+	rsi_coex_stop_thread(adapter->priv);
+
 	/* Reset Chip */
 	rsi_reset_chip(adapter);
 
diff --git a/drivers/net/wireless/rsi/rsi_91x_usb.c b/drivers/net/wireless/rsi/rsi_91x_usb.c
index 99e029e66407..f8b5c264a8a9 100644
--- a/drivers/net/wireless/rsi/rsi_91x_usb.c
+++ b/drivers/net/wireless/rsi/rsi_91x_usb.c
@@ -563,6 +563,7 @@ static void rsi_deinit_usb_interface(struct rsi_hw *adapter)
 
 	rsi_kill_thread(&dev->rx_thread);
 	rsi_kill_thread(&adapter->priv->tx_thread);
+	rsi_coex_stop_thread(adapter->priv);
 
 	usb_free_urb(dev->rx_cb[0].rx_urb);
 	if (adapter->priv->coex_mode > 1)
@@ -896,6 +897,7 @@ static void rsi_disconnect(struct usb_interface *pfunction)
 		adapter->priv->bt_adapter = NULL;
 	}
 
+	rsi_coex_stop_thread(adapter->priv);
 	rsi_reset_card(adapter);
 	rsi_deinit_usb_interface(adapter);
 	rsi_91x_deinit(adapter);
diff --git a/drivers/net/wireless/rsi/rsi_coex.h b/drivers/net/wireless/rsi/rsi_coex.h
index 2c14e4c651b9..cdd83650c5f1 100644
--- a/drivers/net/wireless/rsi/rsi_coex.h
+++ b/drivers/net/wireless/rsi/rsi_coex.h
@@ -29,9 +29,21 @@ struct rsi_coex_ctrl_block {
 	struct rsi_thread coex_tx_thread;
 };
 
+static inline void rsi_coex_stop_thread(struct rsi_common *common)
+{
+	struct rsi_coex_ctrl_block *coex_cb = common->coex_cb;
+
+	if (common->coex_mode > 1)
+		rsi_kill_thread(&coex_cb->coex_tx_thread);
+}
+
 int rsi_coex_attach(struct rsi_common *common);
 void rsi_coex_detach(struct rsi_common *common);
 int rsi_coex_send_pkt(void *priv, struct sk_buff *skb, u8 proto_type);
 int rsi_coex_recv_pkt(struct rsi_common *common, u8 *msg);
+#else
+static inline void rsi_coex_stop_thread(struct rsi_common *common)
+{
+}
 #endif
 #endif
-- 
2.56.0

