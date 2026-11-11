Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434346;
	b=uxNuf0FbjqyyDTjasBNJpvvMDunKAK0yLa8AcnjWZcT1Tjp1NSf/ASno9wcrAyzmesaj
	 4qMh7EfaMYAa8lZurf/Ok76rpndkO1mQxnj/MGDILcy26BsJrm6yWMsskafP0RP97fmCk
	 WO/6nvWNjkrAvC/bgHfg0U5FJcTnFS1E65e5X9EZu6N/d0E+ATww7hUhjIs62JG7SVGud
	 6aIl4jigvqNQUHrnjpGlId92uW9dJXjsTTLp4NG6wOz8RfTCkiE0YZphEHLfPMtWnVGiY
	 EheNEPMnMniJjHYy0AUgTVSR7F5MCdES1e+66pW9slNQlHoJpD8COMrQKJXPIXPPQCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gp3JDzz6fGsFqJJBxPI2Vb3ErhAuZYiFu1m0q4pFhTw=;
	b=cHsYmQnlxAPOi3+2/6sMSsU0Im/LjrIg6yktEBj8W2ZaDQ1oF3+7MvLSE+FdcbqkBuXM
	 zfW4eSA4B50ZoPppvf5oWZ4sBMKxHnOBD1qmGOJ5WYJTrSomASs4e4IUIE5yfkepuzsQK
	 BZcVhocwUPiikQnpu6ZjyD8oLDxKCTQViO/4F3Z+oYHouxdkrPu9+PJCb99Ygf3o2U//Y
	 HlkIphXuKoCodvOV4JdUTLgLvbOeLAA5hAWeYyXv4ALEfWs8u+pc+ztEjRlpJpV0i+ODw
	 93tDV0qg1QDlxkXlTJw/qdaPWT/0x0hJip4vkktwV4nC7ZOX/Satjeh0ci0p0xSm6ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljWddJXX;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63160A3824
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D63160A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ljWddJXX
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f20c3aaa5so317162785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434345; x=1795039145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gp3JDzz6fGsFqJJBxPI2Vb3ErhAuZYiFu1m0q4pFhTw=;
        b=ljWddJXXf7IkHnl5xJb3WO0J4LpldKi3Xnh4EhXaxlUFHO2ERWKLBCSVk2p4hSy4CN
         8/GQZ+pIcpeY83ng0rxo0eEqe0KAnkIrv4x7VrfJTo+0NG/lHAxSAAmRKzU0odKoMw+s
         3CsRVGsjVbFDPTO7ueud44u2e5iagk9ozpsnMxCipcUWZj6jfegEtJvulQivOCjwYDWF
         dp+4WDUTOb3VE+WpBxTUCjLjE28jqnahNM3v88Fx6L9ilMsz4MsbGR307JjXaweHGD/G
         SCi5kIdhWoA5rMNZkkVXP13LIgmls8EeZIqX4+UWaPLTwHm659PZPsKvret0JlZFgvhk
         kchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434345; x=1795039145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gp3JDzz6fGsFqJJBxPI2Vb3ErhAuZYiFu1m0q4pFhTw=;
        b=IeyFFMnedjHGpnZBYJq3O32REiLsQnWBPOFXP9BB7h8WT4dPcf/yPq/Q2XVu38Tiw5
         IB8U3RbFHtukifKX9O+PTnbhOijzPlHM34eABt/PsrsIu31Fc8SXU/BSrOWYETEBTcY+
         BQRK68K7ZDeumeXrjRqG+FgVhKtlWyuGMb/sQM0Beu3vhMXzxP4XiWCPQab3frFss6dR
         cOnYMhv6r8vsH0LKtbWWAQO4hd+iVZtcv8BUdO7cvMSKhTQ5fR3jE5B9R3bSmdgSahQU
         73EwIyR1RgDxscgKh6Qs+AQpp0CuSghXrCRqQ15wq33sT4biCW9Hllv3y0FUQG2Yersp
         yN/w==
X-Forwarded-Encrypted: i=1; AL+hErFLVWGLrl+E1GsL2swgHnIvOpcauNUybOBPexP+FIzZ+j9zQieDlu0OnC5YctEiwPbDc8WQZMhyChM9B7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ve1Gq8oJ8nPbCzUT8UQ0IHmQbZM3bcEd8EfHz5N4tnzFjNMe
	z3/pAHxrDRG23Z5caUJSoZJ1lIj1qepsdSwIcRUEfvuzJ/nq7alnO543TbIuFw==
X-Gm-Gg: AYBFou2Y63J+xdVmVmZlx8j8zGSVNa15gTmVgLzgwzaLeDqb2RZiWyfa+g/j1RuD37t
	ZhgFPuhfoks/slF96GFaQSBFC/yAeC5BOQK2QTIN5Mu154mmVOOuuDw71AMo4soZnCYBlhkK1oj
	XQBOFwF85l7X77SnzL7mDHXqmr2CBrBQyeLnHodTp8BlY12wxrvMJRm0VvStgUqYk8oh3PqCGdl
	oePi7goNfISK2Oc3Ng9RcrwCKaJYoE6jhFTEdBpNxKRTPGYc5cJBgYNYAaLX0CTIBxWjQQc/gDx
	sv8nkaD1CSY6mjIBF8BJjap2NQMRN54YMv7Bju5a6bk8BbQ6mSGlPRTO9ak51rx0JFWPvp7j/tP
	XDT+YJa3+ileqjV22Kakfpv7gbSSndx0et99oInXlE8tBoDhpf1JBgKhsJEVj65cmNtUrqf39bG
	j4GhBQekHkGfcljb30hp/pk2TBedxfHC7/nkoLeeP6oA5e4nq+FafRMpxSGhKSyo5d/Tq+Lvmfu
	zGf3mYgao+GiWvD3GAlGkO4c6qXQ/82WcqQFore9VxgJ4i35h5oSQNCv6O186ZrxvzmuDGmEKsL
	ZkrJo2twP3ToiM7u5k09DBuf42rEHMztquE=
X-Received: by 2002:a05:620a:271b:b0:93e:60e8:c9ad with SMTP id af79cd13be357-947afcd62demr595319885a.12.1794434345467;
        Wed, 11 Nov 2026 13:59:05 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947b035710bsm268231485a.42.2026.11.11.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:59:05 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next] wifi: ath9k_htc: count a frame as queued before it is sent
Date: Wed, 11 Nov 2026 22:59:02 +0100
Message-ID: <20261111215902.574916-1-mehmet.fide@gmail.com>
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

Count the frame before it is sent and take it back if the send fails.

Fixes: 8e86a54715c4 ("ath9k_htc: Fix TX queue management")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 0d6272ac0dac..ee87352d1241 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -888,17 +888,21 @@ static void ath9k_htc_tx(struct ieee80211_hw *hw,
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
+	spin_lock_bh(&priv->tx.tx_lock);
+	priv->tx.queued_cnt--;
+	spin_unlock_bh(&priv->tx.tx_lock);
+	ath9k_htc_check_wake_queues(priv);
 	ath9k_htc_tx_clear_slot(priv, slot);
 fail_tx:
 	dev_kfree_skb_any(skb);

base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.56.0

