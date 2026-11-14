Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672971;
	b=MvTtb1ONz4RDSK4tvEGUGgF26q91TKT0wwfZaIyhIjyE/hwrZ1PyrqbZMccF8awViJY8
	 VW2Eb7rYfI5CU8a8jvpC3m4CH2C1DrSYBNC9zI6TFvDZ+6CLAPJlX3AQR9nZfM6EuIfzc
	 Itw2iiYjUNT+GGCD8be2bK5qJXl+EiKoIbQkqgbdhlYAGWmN5706OcqPN8BgHnhD6jaDj
	 Y7r4dn9e1KVbmUnzd/kqGtUfQQPno9B2itWt7nXVzoo/Y9R9EwqcimIKhjEtAO7ugTUV1
	 6rVciyuqaK8tdXfafq2AjCM5FroY0r4yuX0Lv6SDFtUdoDxTNCLQNtRcZZwibILmsjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672971;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ApmNo1VyKCyxdEAUvkrRU2wuXDxWxgVe5Q7ZRn02jfY=;
	b=v034V4y/tkfPgXYFycYb8hI/GVEnVkjg1jdmWNVnKRgRWQzj3ZV7Il3X6ApI/RlrtH/P
	 OGchobol9yJPQviVgUdrnY4F4AQK3ixRmdc5m5CLhIiLUdgc+ofD4ekMUC4NIDA30adLw
	 kb8M/z6bwThteGGLCbz8fA7Mc3+PF8akv3a350+7ioZYDZv+RD17aJVdd04d3X2irUZq2
	 KVKtln6SA0wwhu50KSuv35WLifL7ql3LobjJnKhAcazcEnnARVClGotGVsY79kaCnguf7
	 ZfsSP/VTxjeCTLDBTfSsq6bvRqjQqeQ2i5K9XlKrUZHQH1pSLbtvOKGRvH48u/KlZMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=LN4dySTH;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B9A606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B9A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=LN4dySTH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794672968; x=1794932168;
	bh=ApmNo1VyKCyxdEAUvkrRU2wuXDxWxgVe5Q7ZRn02jfY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LN4dySTHaRijHL91eaR7cDLl8RLg2YMfXB2cO+sPtPajBR4SKBp2fRs00u8Sd4UdJ
	 z1W5XRTxMi9vnPOBbdMBXCoyKGt6RRH5wJhCdRonIUbBUEBWWK5fSgD6QqC0xXlmSy
	 6sBFpeWd1Thq6gkrTSG+r8L9vK/BRP97i+VckTWbal9Zqj/iTMSOx+lKhZWiSMTm+S
	 Jh8vMx1oZBsQu/ElGoBLjg7TfsvFvLj3GWpX15p7uCWZfMBFY2YEHoIMAN1PcmodRn
	 DGm57TbzTieO0ryntqrxYizLOEI+Q8gEO2lU7dcSmSVlVcHQWKs0ZWmXw2G9tNEGF9
	 PqBloHMn8/FXg==
X-Pm-Submission-Id: 4jRfPf4Ckvz2ScmC
From: Michael McAllister <me@michaelmcallister.org>
To: markus.probst@posteo.de, luiz.dentz@gmail.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 14 Nov 2026 16:15:55 +0000
Subject:
 [PATCH 1/1] Bluetooth: hci_mrvl: Leave the serdev port lifetime to hci_serdev
Message-ID: <179467295519.97469.5747232754111917783.marvell-serdev-v1-1@michaelmcallister.org>
In-Reply-To: <179467295518.97469.12346516231160594592.marvell-serdev-v1-0@michaelmcallister.org>
References: <341e56b1ff7d8a5b109e26e30dfed61faa54d603.camel@posteo.de> <179467295518.97469.12346516231160594592.marvell-serdev-v1-0@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

hci_uart_register_device_priv() opens the port before calling mrvl_open(),
so Marvell opens it twice. Likewise, mrvl_close() closes it before the
transport closes it again during unregister or registration error cleanup.

Remove the extra calls and let hci_serdev own the port lifetime. This also
avoids failing probe when serdev rejects a second open with -EALREADY.

Fixes: be70e5e774a6 ("Bluetooth: hci_mrvl: Add serdev support")
Reported-by: Markus Probst <markus.probst@posteo.de>
Closes: https://lore.kernel.org/341e56b1ff7d8a5b109e26e30dfed61faa54d603.camel@posteo.de/
Assisted-by: LLM
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_mrvl.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/bluetooth/hci_mrvl.c b/drivers/bluetooth/hci_mrvl.c
index 5798a8db0..def19907c 100644
--- a/drivers/bluetooth/hci_mrvl.c
+++ b/drivers/bluetooth/hci_mrvl.c
@@ -57,7 +57,6 @@ struct hci_mrvl_pkt {
 static int mrvl_open(struct hci_uart *hu)
 {
 	struct mrvl_data *mrvl;
-	int ret;
 
 	BT_DBG("hu %p", hu);
 
@@ -75,17 +74,7 @@ static int mrvl_open(struct hci_uart *hu)
 
 	hu->priv = mrvl;
 
-	if (hu->serdev) {
-		ret = serdev_device_open(hu->serdev);
-		if (ret)
-			goto err;
-	}
-
 	return 0;
-err:
-	kfree(mrvl);
-
-	return ret;
 }
 
 static int mrvl_close(struct hci_uart *hu)
@@ -94,9 +83,6 @@ static int mrvl_close(struct hci_uart *hu)
 
 	BT_DBG("hu %p", hu);
 
-	if (hu->serdev)
-		serdev_device_close(hu->serdev);
-
 	skb_queue_purge(&mrvl->txq);
 	skb_queue_purge(&mrvl->rawq);
 	kfree_skb(mrvl->rx_skb);
-- 
2.39.5

