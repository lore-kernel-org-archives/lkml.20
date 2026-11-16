Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810602;
	b=Qm9xHouzeYR5fK+BjtsXAt09miipj1Z2P7uWrl+DmXF4mbmfGbKuFwmM7oS0zQoD8Foq
	 PoyBbLE6NT3kov5zzG0he/9Hozp0hsV86smBa9FQraG2jhzNHEA16Kl/YFfbqGOXQRdxN
	 kcu77sO5tGtE1o6iNumlzbuzVCt9VF9FXTn8z957W0v220YtNjjgw44do0/+QJEGxs8Ui
	 AOxDwZkJNpa+Koj/4Tzx27PSZ3TI8UoG84elaK8Fkcalf+ao/zULWJIQYNVwFxCuXqazm
	 wUMjSAvwDk+BcquiUQhlEui/AtDILIxEy0d1yzNwsROMoRP/GxFPSBktzDShMtwwlFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
	b=etLb4VOj6Qv5icspTCqHttMrvMaIYMaG4bFwUc/4rJip2mQQXnmpv90YxHMhNG2uPd4R
	 mjeV/ufqW9aunhXiIhNsgebakeNZ89JsbvocKrTdFPG6zxC4S1YMETsqHNAuktUXnpqGU
	 x2ELjA3fFJG73A/fazLgPNmX9KMQnLmMay5MV6ENyhn6Ekzh7Z+rBrA8IODK4w9EUJ+N3
	 lBo+UZmZrHbjOWt+TNppX5ApEUObDvspRovK0O33IUSmzIVbVEvZoOWoWu/D1XmSJarOb
	 I/TIPnGOP1ve84sVpwEhe6sDQ1ZQAOfjQmXr8Bl+2iLt/MyqzALaP+mWaxc73IHO0ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMoeNZEv;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1854E606A8A9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1854E606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NMoeNZEv
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71aed54d4c5so464376eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810601; x=1795415401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=NMoeNZEv73YY6hhlCD/9AaLO5UbFsJ2tkhOcuEl79nRZuIljpLbUYrsjnGN2HeuVll
         3dP1oik9H5GZkLSkAh/xWlcI5xuQ1BYWLnkikLWXHfntBZDTCeLv2iQrCUsun9AnlVyt
         dsGc3tjOPCRfMt00FYbPdvyyJQkCNp4zSGZtbQ+JABZ65afs/0WmaeAl8iZra+4KpCeG
         cEovYd0eLVRCi1iwAvk3O8HVXhuOC8Rwo6/mXoVPYWAL2kbdp4aQ4x5eBzkXgtHlNOsd
         P4updbbXCESnSMhOd/awrS2Ek0RyYvjDluZzb1CmoJFbmJk5BU5GKcLBCdnJZf1g38sJ
         Pc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810601; x=1795415401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=yq9HgnlT+arHS3i9PAT0e8OIhQPVxqfN2mOAzRlxeYwjYlxNnkJwpMii/btwvdYCel
         jzPoTMdmhzRD7+/1jVFMHWelCBCWIh4pO3KgvFaEBMYOkxUTZfgPqXkyA4hr3KU0aIWR
         +uVymsnD4gLHb2uODlFy8/wXcnF+UjSc5WweznnjlUHz14yVdqX/YwyhSGpLBNluOmrC
         miyoaUaLZPl8k5jzfrncfn8tEIn74nqgCHTmVfqIdy7K/dSHvouvT/LgJtXTARUUqKvC
         1CpFdx+LoFeSwBBT9Q9wfUEE0WWZfRq9+GCrVp2QtLzIztvb0IZWOoUu7g0NXeyOqulX
         NKkw==
X-Forwarded-Encrypted: i=1; AL+hErEtQ8FQCb05fM8uWPWwSRpm7H4dcDLb1b+mgvcc2W1s7+H8vHQIF2usSq1X938gQca/+hPfZFBmPXnC3W4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+feC5+En1cp/eyGiEq28pQlHXsivHiVnWOtLfjUtVi1saAwk1l
	oyIVV5+dXDGOpzHZooT0xC/+1qfF9cTtnRFilayEmY5p+rJEN2nNWR6ELpYwfCHe
X-Gm-Gg: AYBFou13OsKMMn/60iVij2ogSz20+RgSEnfg+ckxVwiK693h5fkiCDc+cRQI93Yvlbo
	27oIuWL1C82IBzEyR6HfZWSk4US8UravqqEJxP8iZKtX8p572oTnuYHS1bc7h1ZYWi7GRBJXaZ9
	HhKox1KA6ZzIbPwCAw13yVKF+zdz7LwXuAq04ERGtm+L+zPI5wm/F8bSBWYUlLGwkYqH5k3T/FX
	pfcg/diD0TODdOhkVs9LPpO8ibYlBb+TVo9zi7dnwenmy3ny5pgE83WWEm5KjnDRua5APvC8oCl
	IVYbyRrvoAYZTx5IT++9ZAMG5UGvKU5zRxWqyLp/a8TruKhUCbLMXU2rw0NWNp/fVEqIRcTVhf/
	jiBQ7EA6/VZnT085+hCI+7tsdE9GC6dXZVPJvG5GtZvQMc1ZT17X2YkBHj1zTCZqQkCTdj12brJ
	SlxkZAPBvux6ztMaxOcfr0tgFm/KiR348rWYIw688EZPpmOKukWuCh6J6bsQsnY1HTsKx3CXZNC
	1GaDXUEiEH73pKlQ9lzjjJf8enSnIQdtkYnYEOvG4/BGrTHnpAUhSW/CmfG4Ytx2mTbWzh8M2Dh
	dNf+Xy6EzZdTH8mnrlwNBHnUAED0VnuvFLPuD1vn7KKxhKTutatC911fDsLIVvyqO49lzfx7yqz
	3r5Bpn4ua4yfsWjDYxwuaIE9vkaTk0syJV4ujOj3mqiXO4n8XI+fzgrsLjpn5W4GTP5yHIP79/+
	2L2rCtw3T/yXkXK6euqtAr8VJ/32UhHWvOrzFXAc9bBfT6SFYw4uQ=
X-Received: by 2002:a05:6820:3383:20b0:703:8835:5fd5 with SMTP id 006d021491bc7-71ab4f55eb4mr3884991eaf.25.1794810601026;
        Sun, 15 Nov 2026 22:30:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:28 -0700
Subject: [PATCH v5 13/58] mtd: rawnand: mxic: retain open-handle state on
 removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-13-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.17-dev

A retained MTD handle must not access controller storage freed by
unbind. Disconnect and clean up NAND operations before disabling clocks.
Retain the copied layout and controller storage until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Cc: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index ce9fe27fb4ac..9b666a2c0a8d 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -492,10 +493,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +526,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +543,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_lifetime(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +571,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0

