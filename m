Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593722;
	b=RnuJLLJuUcCbM/vF/u4vtOBCDBPwC9oWkbXtLGVHstqEA2G6pQw1ttSBKVme8O3fwKsZ
	 Me+jIN7nlrbBSvIXK2owrjhJrdhmoOsMkBU35GDJE8GRHHWOrwSww9o/Gw4oJYXCXaA1y
	 Pbldxwvo+paefRSAB4lz9nxOnRXFd0u36sS8edQm0JztjPA+ejnnrGOA00ECjMCyE0Uqb
	 PZ+IAoItM+TXokpmgoOiT81zsF23NV0CCpbCBeTJ51x2wAnjnB4cOM8AWx4dxpj7LKGjk
	 Yq8fyilttNc86QrmGOMBUI/wEAMfw/3K98mfL9trj/6o49m12u32N+Cek3nD9lWPcMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
	b=BEmwnEjo0gQn17hEp9IqWIDfPal7drmvKuETy81iIHKbJHu922Yor5fHCDrH93q3ZTbf
	 5id4B/Nw9YEEM2WRjmWQilCQUa+MiRFA7NBaxfGsiL2J+6LqBTOf1OfGTkdkzvOMW66rK
	 KP8qfBn2dUXnn2H2TmRMcFAvZ3f4WtxsWB4PnvGEdPlwBLu/f8pHx6go2juREaAD4M0nh
	 Dq1ffDLhE+W5pU7yHhH35OdoKJCVR6YQdKMVGRGrkJzvaxGGrQZs6TxpnEUvRcwHu5Mfa
	 jmIcbUizqzSe2VmcK82Qsmjjnta18ta9MkpLKittvIB2FNCMPghxkUw7ZP/C6tOvqaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAIEWtz7;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8560A2607
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C8560A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAIEWtz7
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8256106635eso519000a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593721; x=1795198521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=vAIEWtz7qN6rOnUbIHbkKT7J19hn5hMcN4fhFbgIsbmzWNjBrM/WdzwcgmBx0+dRC3
         dkzTIXY7PqOU5ATbncgDB4h1EycDcxlzLNRzgkfAO0LasC+2Bbzg+dhuP2dMRc7NyQsz
         ToUjN0pOll/moXFyaCHYGOVLL9NGlRTMT5L6rwdOMtoYq725L9AYW2If44STzs3tiXY5
         CVQPakNtfbG7/sZqA6zXv1SXZJ22VFhRStCXj6OWRwAeCAQDHzSqTnBEVyY6loDWE4Br
         gI2/o1b9RIOTt7E7unqk6qaGicXOG+4+UD2Qw86bKGdSACZ39GDpJQW9nAeApnICjPHV
         h+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593721; x=1795198521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lgIgop5TBofNfvpM1CzFjl+Gwx0xbt7fpwVvQTmrww=;
        b=SIdQJ9BryJmTqHr8u8x1hDWplSX/s9bIud51Z7MyLvFO9FJOACUVKcLsQSrN8eRxNQ
         yC+59n3xq5diN2WSvdfy/ESewzr9kr+yyMTZ1ananNqa8tOWCxN2JhixtveRaOlU4633
         YN8ZGJ2e8fKBX/lK1iNXlIFMSLPq43i7Ssc37OuEdpUuJftBUJCRFziGDw31Qj5dzsE8
         4Pgq+KixRrm1AQ08pHYBBQWB9oAlseVKprL7S0XL7GqrrMXvwKtkaUpl0BlaWfI+sowC
         63oCQIOblwJ1S2+Yj4Yw0+y86YcP25JdqS38J/aru+Mw9oQUWVTGlX56fnBXFrZa733U
         SnAA==
X-Forwarded-Encrypted: i=1; AL+hErFo1wT4rSkF08a9QyI5DxUzCeTdLU1FR1dDKxY0QpWs95lbIxR3k/HOwRUDVud12Vql1oSiBR46WjqU4g4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NGOlvs8LcRwJ2GYRnZpx3FneEuZdiZxCAVIlMt8JzJJJrxkEz
	n9wLadZwWRVP5xy9h///6ZB6mB4J+GF2df1pot1Cp6bxYmWdYqA6gtjAApg5LK+j
X-Gm-Gg: AYBFou0A/3mcR9SW2WFuxcoFnaWUlypcyRcFFPMbc7Mb2cNB3Sqh1tRTX//W0T0POmQ
	ZNg+EKgPPFw3fx34msjtwN4f8UZjvGhAuYpwwY6jdNgsJI+MrHI0DqTTJ3drpoxMzOwrnAD+PrJ
	SyUB7FU7gpRHoGBLiti4sL+P+Ux/3yzflJmNRkmJaPdx17cUOk3FGtok91hXxCNmDprt6x0K0RA
	XKGyVR/8gLqmCgrs6iEv+MZnLyJCjXGScR/hb4GgvhWnvWFE396t5jwsEpR9DDhemGfUpvkOMyW
	QJG31aUkOZIXePfOQQrKnNb2R56nPASn41FZTIpstnGINWPjdl3NOrV2Fdxg+L/2VH8TqSb7QLC
	Hx1xNUxFDiXhSz+4vQPJDBzVOIPzISKXfeXZwgEXabu35O+ilveiq/t+IP3+PkWJpwcCMa6LQzh
	sCKrqOtw5vFIXZih3cXG/t9p+yrp7QWw88/uZWMsL792fbJViNWwpTqWfvhMmcCMhQPg2+sMZMp
	cAtXXkiWYMgPRezMvwOO/YSAt9cMtiuui4g2yTdJcVskWmhuSmkISUoBjVWZHKIliMfZNV0vHtK
	qoFk2xGcxv8niqhVwgCWoxiZppEWkvhwdXIuLjhzwgacNiCq2+4uD4FVvZ+/njoCF1rsiVp0tGB
	xyy1vYFzVD7WL/WLyrKeFMtBZli8121btcFFV8go4KBcBHvTUWzwRGTmdbLJG/1NE0Ahaue3Avc
	97RHMt48EZOLqnZ5DU+NjAG6U4X38jx8Hg0sXde0yz1VUefp8EDMoP
X-Received: by 2002:a05:6830:2e13:b0:81e:abb6:749f with SMTP id 46e09a7af769-862898286f4mr3720945a34.8.1794593721422;
        Fri, 13 Nov 2026 10:15:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:23 -0700
Subject: [PATCH v4 07/58] mtd: rawnand: sunxi: retain chip state until the
 final MTD put
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-7-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15.2

sunxi_nand_chips_cleanup() unregisters each MTD device and immediately
calls nand_cleanup(). Devres subsequently frees the chip and controller.
An open MTD handle can outlive this sequence: another operation or even
closing a writable handle reaches freed metadata and lock storage.

Unregister each MTD device while removal notifiers can still finish I/O,
then disconnect the chip and release the driver's initial MTD lifetime
reference. Run nand_cleanup() during disconnection, freeing the
per-sector working data while the driver is bound. Retain copied names,
OOB regions, flash-node references and chip storage until the final put.

Give the controller a reference for each retained chip and one owned by
devres. Register that devres action first so the IRQ and hardware
resources are released before the initial controller reference. The
shared lock and parent device remain valid until the last chip is
destroyed, while the disconnect gate prevents access to released
hardware resources.

Unwind heap allocations on probe failures, including attach failures for
which nand_scan() does not invoke the detach callback.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4fcb7977de02..d175dc685681 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -27,6 +27,7 @@
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
@@ -2027,9 +2028,8 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 static void sunxi_nand_detach_chip(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	devm_kfree(nfc->dev, sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand->user_data_bytes);
 	sunxi_nand->user_data_bytes = NULL;
 }
 
@@ -2045,8 +2045,7 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (nsectors <= 0)
 		return -EINVAL;
 
-	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
-						   GFP_KERNEL);
+	sunxi_nand->user_data_bytes = kzalloc(nsectors, GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
@@ -2440,8 +2439,9 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = &sunxi_nand->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&sunxi_nand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2465,8 +2465,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
-				  GFP_KERNEL);
+	sunxi_nand = kzalloc(struct_size(sunxi_nand, sels, nsels), GFP_KERNEL);
 	if (!sunxi_nand)
 		return -ENOMEM;
 
@@ -2477,19 +2476,21 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto err_free_chip;
 		}
 
 		if (tmp > NFC_MAX_CS) {
 			dev_err(dev,
 				"invalid reg value: %u (max CS = 7)\n",
 				tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_chip;
 		}
 
 		sunxi_nand->sels[i].cs = tmp;
@@ -2518,18 +2519,31 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto err_free_chip;
+
+	ret = nand_set_lifetime(nand, sunxi_nand);
+	if (ret)
+		goto err_cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
+
+err_cleanup_nand:
+	nand_cleanup(nand);
+err_free_chip:
+	/* nand_scan() does not detach a chip whose attach callback failed. */
+	kfree(sunxi_nand->user_data_bytes);
+	kfree(sunxi_nand);
+	return ret;
 }
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
@@ -2610,12 +2624,14 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 
 	nfc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &r);

-- 
2.53.0

