Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041348;
	b=2QXAU9fsfzDkGpnBf8OUmHaZAgTTDzMQC13NVnpaHL+C5/PDgVvOIQ81/idoVVYCd6Rv
	 9RJ4Z0y6Fab100g4aWmreEXFYR3mr5h2KjPHiwGUo6o6AeC9Th14rYFwifTEMX/bSJ5cL
	 ADYQMO/W0rHWIJVZ6s218GboOBsuQ7mSagIO0N78MTtKGbZx8X4nCwBHJ5T1RkHUQAB3v
	 m/3dTrN1aRJsJ5vhuXvLFB/swTDSuLq5lPjJSSZNJcRr72sRlxykEV7zIzPHJ4czNa8G2
	 vtBfE0zeE57qYlV5ux3uG13n6W91FnGyI2vATp+VLFbm4ryHr5TIHUzlxkzvyRsaPew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=;
	b=Z76cpMF9acYBsEGVhdf1V2g6QyjC0ftewMC0nD40qZjAXOkAYagEA/SnAwHJa1aopmeQ
	 4rv9c919Am3y6eBd5bUEwpEwhKS6G9bfX+QzBP74XLFKmVAw7I1zBSpy2KLEEDO/TG/Cx
	 lBFD5VVJ59K2tNfhD51DUUxk+MLCWIFxuNzzqAo5zGlWZiwXXkmx1bb282MR/iULlF4+h
	 ZKDyfkghdaWYpqzkxRG0Xqn0xx1MwcEHkG9aM+nAQzRy0VbEOtMuW1iU5QH8ME+YB6Yp9
	 CD4I3WuWQYBOKcLeHn1SAKL84UShgrM1h0H/yJCDkTByd7mLn+JhpdV5QDp4Og+yfVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TnnenxLF;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78751606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78751606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TnnenxLF
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-53c4858eb76so1444435b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041347; x=1793646147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=;
        b=TnnenxLFhymQPrRGj/bT5b7R8zsqQEAG5VGSYdJgHuPySQq2gBq8UYjHwGpK1GjHTd
         kkBjuKqtu+SpLZkHsn3HqlbvWGcBErqMDpJEUje9BPtFnvGgg9647Q1YTrxMbGU+2gVB
         ue0v7N0u/gXJDPPrP4aPtzjkzanJ2662JzI3CV4agPqQRAqmojTkFu3/vvVYZGVJF2lU
         HicYkj6llmIDapSCRGksjP7aKI9o1f8GYWHlVyxC5kG1F3qjT4s7iXYdpKI43FCIpUeB
         VFdhcmbFol4+k3/thAo13kD/74ow0enfZX5+7ThsWcAAsTJ0q7ecV1bBaPHyRL4Lk9BP
         lN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041347; x=1793646147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07HklJOx/r3iefKPdEdock1PeAL0doe52SrNOxBdYeA=;
        b=n4Z6ikPMNp2Gx2YbnTqSLMIAERmiF2if9ktbA0bAe6Cb9NQ3Mdydlo8PERdP9Aauob
         9Zv2ik7soukraX54PzdSAfnkNNMjrXTwoPHUsZL34HZbGGcH1hJPWumz8M6n6CyiVJtS
         y0oFH5XehocDuBth9KzXezzk8TQwlH4S7FHKWcMkGkhIpGAxxRwjgesfXQQaRZpIvluq
         bYODgH7ofGyJyQlA7nFo4Te8TOWAngBXALdp1wtaPpSfoACc5/5KgligEVLIm2fvo57m
         C7rNuS5asYm8yJawfM8wCuZQAu4XZXEaLppfcWbvBsSGWj3i3znnbzcBr5q+y6z0urkV
         rDSg==
X-Forwarded-Encrypted: i=1; AKwUvBzUcTJ/5ryzHMqY2sBVOgyuD6edY0RiI9Hk1IGOS/fBniqOfZzXS9J871aUL/Dg4q2um75Y/asdxsTsiGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3wpND9n6w0TFDSrlDAHiZ4eGrnk16PEcsClxy2INO/V/NF8AC
	RtefzJWynvHimLXLtzNqzHvaGs42fNUomI4dLegYAs3OoS3cny5nXrUz
X-Gm-Gg: AYBFou29dJPSLiPA9uSGHpTp7GKhDeuC3+mXMP6YKVB/qzt4gy6G9muzW+fWzP8QYLb
	TSYRsqnn2IydJoZFXuRrexuQlGcfugN9cwXgtTlCE3Lg/6xxkUiGN6LIEhs1AuDpFXnlVA3etIn
	xJnTPns2QBjGpK/KqOPWxTh9GhWHQ19RZ9vL1av7k4ksmUKAn7rt1q1EyTAcaWa7KDn95tLvJTG
	yT5R5fv5b1t764p7hM4J1DUSqIPvI7we1D+ezWwt6yjDtZFQJ3JooXqUY44KyR8YIjXXMmkpvrZ
	451pZwyvl/4IDNPin0aT+rE9oVE3j5ygRDbxBCr1kQABffnRIf0Bf7DzJ5p13/FxUmqoIsqQj6x
	KgufmUWqQZQ9k7k5EFmY+6WqZEMYxxAbwftJmO3Vg8AGxEGWsg5LKi9vKyl/8Os3nubdGA/fLCS
	lDBcN/k9OvZnGTqG9WG+Wr3tV6Z6KzB3JJFl9CLxaaWpRG4wr1CsdFetoK3IRJi0h5ZRXNAr4J4
	DyPzj+fSN9JeLXQtwrovO/utC/7cCnPn7vWMfJTOxL3PuFxT6o1nnczw7VbuXoWSWW+V4iFvYpO
	XUcAk1h3KMUNSR15tErc8+fCanjoZFSY7ewTiG0obmlXcw==
X-Received: by 2002:a05:6808:c226:b0:4e7:851c:23f5 with SMTP id 5614622812f47-55c003fa3f9mr4544096b6e.59.1793041347210;
        Mon, 26 Oct 2026 12:02:27 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:25 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 26 Oct 2026 14:02:14 -0500
Subject: [PATCH 2/2] Bluetooth: btmtksdio: retry enabling the function on
 MT7663/MT7668
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-2-121792305f72@gmail.com>
References: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
In-Reply-To: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=2175;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=p5no/S8PpFqMwynWIKqGncsBNwjfIsmYO/W2PvcD6mQ=;
 b=IJ298NG14mxx/gBOBanVXzZJRrSHN5am2KydNnQfi4ZzU5GBakO03eJI17yPJL1Tz8N0Tb2xS
 iLeV3zN+1+pBrri+wlcCSBgNRlJh/9gFw2i6TTiZ85XBNSg0HrlsWbj
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Right after the Wi-Fi function of an MT7663 combo chip starts its
firmware, the WMT function-enable request is refused (the reply's flag
byte is 2). btmtksdio ignored the reply, so the following low power
setup command then timed out and setup failed:

  Bluetooth: hci0: command 0xfc7a tx timeout
  Bluetooth: hci0: Failed to apply low power setting (-110)

Check the result and retry every 500 ms, up to ten times, as MediaTek's
own driver retries its power-on command. With mt7663s probing first, the
function now starts on the second attempt and setup completes.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/bluetooth/btmtksdio.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index bb311986271f..239393a15e46 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -909,17 +909,33 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
 		goto ignore_func_on;
 	}
 
-	/* Enable Bluetooth protocol */
+	/*
+	 * Enable Bluetooth protocol. While the Wi-Fi function of a combo
+	 * chip is still starting its firmware, the request is refused, so
+	 * retry it.
+	 */
 	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
 	wmt_params.dlen = sizeof(param);
 	wmt_params.data = &param;
-	wmt_params.status = NULL;
+	wmt_params.status = &status;
 
-	err = mtk_hci_wmt_sync(hdev, &wmt_params);
-	if (err < 0) {
-		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
-		return err;
+	for (i = 0; i < 10; i++) {
+		err = mtk_hci_wmt_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)",
+				   err);
+			return err;
+		}
+
+		if (status == BTMTK_WMT_ON_DONE)
+			break;
+		msleep(500);
+	}
+
+	if (status != BTMTK_WMT_ON_DONE) {
+		bt_dev_err(hdev, "Bluetooth function refused to start");
+		return -EIO;
 	}
 
 	set_bit(BTMTKSDIO_PATCH_ENABLED, &bdev->tx_state);

-- 
2.55.0

