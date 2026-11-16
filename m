Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810652;
	b=HWTxaY18EibhwTvdFejFyVA+hOdVvDh20DCMcEOLWS0oRCZh6FajuD+oVA1VFL5faltm
	 VUKhA77/b4uzgWQGtLz+2CWZmTVS2Ag29Q/dIEhKxM0MjhL9Xv1HC2J4jY6hpD5fhMygQ
	 OVT32t4DnOEvqb+8Tx/D/au5LDl/UJzYa4SEaS8CH0CbR2bfzwRWAJEGTsvpoM0eg8tgP
	 c47v1vul7Pri0HOgZ1MbfypAJaUDiotxTcedG8OBeEzVnHYrGUDBnVBVjRY7OmFjzA8wX
	 wvsKgSQgT0cE0tF6z6DdsInD81Qk+zNVCRSeGuGr5kZtksil/Gr4Wpk8xH103zBFf/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
	b=Lt03mNYNCSQ9DTeGeBi+dkEvwD3g0JMSbbQsbxe/gz85+YJntfb5UWSXxFOjN+WlN629
	 qEL87rA9eEwawD1swDapNhyoSE1gQeMd118blPu2NxiiYdCdAmxtcX/Cpft5wI/KveYlA
	 Yi+fReO2pVch9cCUX/SzuCx7PptDkXimiWG9uV61EFtVCg36Q5HGjzGjwCmT76H9UAjHT
	 CIpHsnx2X32SBSYRt5VIVyIjoLfwlyD36zpX3TkvOvEU8J1kf3svI6FGV8hYLlhIoDhof
	 zCCjaEQ/AfBzNHFUqaWn8+vGebQqdgjTqpi53YQ0L1szDuFEFqweroEISfGBWhM6Zmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqXfKRV2;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7F0606A8BB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7F0606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqXfKRV2
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71af0656bedso320799eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810651; x=1795415451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=wqXfKRV2PRoK6yDogm3Zgvd/OfsW/zONTUyfOBObRyPVekSCnoeIr4P0ckIW3TOmcv
         u1AkljMVxEyR9URBp+Kk9krA2IyPHnjHrMVDuiZzS5Iq+By2/a/A9PljjgVrujYOFaVx
         izsqnDCza9rtN56oQyr7U76bdli1nRVhHQoi1ui8KHxAASM7Z8p0UaLuArczdydP/fTX
         1sBoCQyrskDxgv/e1BUrPhHy//m0hO2xLeY8+zGxIdEkx7EySRM1OqgOQfHS0C3JoWPN
         f0evSqzOh5/IaRbGumaW6hj7XrCrlvopuJ69Rh8pcU4Yy1Bkhnhgk1xnuXFnzUrVvNfG
         wW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810651; x=1795415451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=lF2Cmuj8eF5R9u5VHqtxv0kaAx7SDPNdJ9Dn8sLoKz5GxzciO82DKBeo7GIFSa6JO1
         nAAiAlw1R8wfY5ops9Pl43dcOhPTUmtdgZJDaEpeSbU8+qfSIPtgX4xLhVPvWcv1t1M+
         DsXuhksz+rECLd+/T+HYqJ6mxaAUZgaGAbuSGJNk+DgN1Jzu50VHKuwgtCzl3s2/Pds7
         OW7YJc9q1xRIwAOp29IRAM+KOQcCrdQB2YblXgjfuSogeI43eyJgo9gmS3Hf7D3pKJyP
         grEjRHAa5XojIjbklEk6xzxXuIjlJE8CFnoO2fQuRBWGZX+pfqXk1jIhScVjuiBYE11J
         YULg==
X-Forwarded-Encrypted: i=1; AL+hErGkVJmjmPgz+3S7N68arDrMZFj05lvfnGPpzbtueKAbLY1ghkvEmc/ZzVu21HTMkBtwVB3kSP4MYN/Rq3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l2tvTMNzl4XnZmuBW1hKHBSVfQR0OKq1/nOVW1Q9dWAUBVa8K
	9+tFxTJ7ZZZGomor4N7plv8wIaVXI8/O1d9S8YOOMgYagTMbEEjEqLlx
X-Gm-Gg: AYBFou0IhAddsocfnEXvsmhYnN7uWSbUxkwDwKPmdJ7bJgpa0YaHmmJoFMVd8HLIA45
	DjuR3O6xZL7hv6wSdpFD5uuv7EJc8NwGXTtDz7hvo/Y1sACNeaNKCZM1y7JqW0WeM57OIsB+wYF
	hU6GI/ofBU73iYEc6iK0BWRTCgQTIYHjAeAsJTkL4aBL73dtEbYqHVEFPdCzBvNSkanYCWkqFkh
	xrbFl3TZH2FX1PTtYd2y2K7p2ESAS8Ji+dNWghIT3QyLyXnTSG+wtIvh8d/zurIY12Jj8wBe9yT
	ypOE6a5fQ/ZxlQt3dPp9G3BAsVOoGOmUzm6gF16wHjHuChvcg/wHwUB74PV0aNIUzNTwJgb3zib
	0RuyjX2gB4O5XTDAAetA7YhUnBJBDsr6OIvFUnvEmCDKt63JFscqf0rbh3Rt/Gy7mODGTY4cCva
	nzN9PR3lCayOrs68P8QQanJe72O8lWy1SfgywPJOt9Tqm9fA1TB7QRDQG7VnlNK8CK0dlDrWEzm
	mDiimE2dh8nHfhyjap2g0IPo0T7pyQ5mmbrYt0gdkgUSrAkucFIjbeuT1Oli4qu6g5AAazJlT1H
	XoK5MekpTSbaLxL1PVSsxgNeY8wC7cT9Sr1RwUk6rOSkB7npIKavzuahTbTQ64C7JJV7IDBs4gc
	vSVuPpwJunYc4+F0o7/vE6JIiCA3CAACE+Mqg7uuAGZKkb4Yk953O3ILUu3ZfpxdPZi96CE3tP/
	p7ueD7Kx5PMPVTskboC4nfCWW7ZCeeRa/Bmve/CLYlULFlMzPFry8=
X-Received: by 2002:a05:6820:8594:20b0:71a:ee95:bfcd with SMTP id 006d021491bc7-71aee95c2ddmr1216134eaf.36.1794810650798;
        Sun, 15 Nov 2026 22:30:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:09 -0700
Subject: [PATCH v5 54/58] mtd: rawnand: fsl_ifc: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-54-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Separate active bank membership from ownership of the shared IFC NAND
controller. Retained chip references keep the controller lock and chip
metadata alive after removal, without retaining hardware mappings.

Disconnect before device-managed resources disappear and drop the shared
controller reference from each chip's final release callback.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 46 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 20ae012adbaa..8b48c94ea8c5 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,6 +40,7 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
+	unsigned int users;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
@@ -961,11 +962,20 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
-{
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
+static DEFINE_MUTEX(fsl_ifc_nand_mutex);
 
-	return 0;
+static void fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
+{
+	struct fsl_ifc_nand_ctrl *ctrl;
+
+	ctrl = container_of(priv->chip.controller, struct fsl_ifc_nand_ctrl, controller);
+	guard(mutex)(&fsl_ifc_nand_mutex);
+	ctrl->chips[priv->bank] = NULL;
+	if (!--ctrl->users) {
+		priv->ctrl->nand = NULL;
+		ifc_nand_ctrl = NULL;
+	}
+	nand_storage_put(&ctrl->controller.storage);
 }
 
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
@@ -981,8 +991,6 @@ static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 	return (cspr & CSPR_BA) == convert_ifc_address(addr);
 }
 
-static DEFINE_MUTEX(fsl_ifc_nand_mutex);
-
 static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
 	struct fsl_ifc_runtime __iomem *ifc;
@@ -1016,30 +1024,35 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
-					     GFP_KERNEL);
+		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
+			kfree(priv);
 			return -ENOMEM;
 		}
 
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
+		nand_storage_init(&ifc_nand_ctrl->controller.storage, ifc_nand_ctrl);
 	} else {
 		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
+		nand_storage_get(&ifc_nand_ctrl->controller.storage);
 	}
+	ifc_nand_ctrl->users++;
 	mutex_unlock(&fsl_ifc_nand_mutex);
 
 	ifc_nand_ctrl->chips[bank] = priv;
 	priv->bank = bank;
 	priv->ctrl = fsl_ifc_ctrl_dev;
+	priv->chip.controller = &ifc_nand_ctrl->controller;
+	nand_set_controller_data(&priv->chip, priv);
 	priv->dev = &dev->dev;
 	priv->vbase = vbase;
 
@@ -1071,12 +1084,19 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
 		goto err;
+	ret = nand_set_lifetime(&priv->chip, priv);
+	if (ret)
+		goto cleanup_nand;
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
 	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
-		goto cleanup_nand;
+	if (ret) {
+		nand_disconnect(&priv->chip);
+		fsl_ifc_chip_remove(priv);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
 		 (unsigned long long)res->start, priv->bank);
@@ -1087,6 +1107,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	nand_cleanup(&priv->chip);
 err:
 	fsl_ifc_chip_remove(priv);
+	kfree(priv);
 
 	return ret;
 }
@@ -1099,9 +1120,10 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	fsl_ifc_chip_remove(priv);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {

-- 
2.53.0

