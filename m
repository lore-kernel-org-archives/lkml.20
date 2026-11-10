Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296722;
	b=KFJDvOHsctEcHkpHNR6cczOZoKAs0H3qSb4IGiu02U3QxAXH/0KXy/ZoMi6L99z9X7+H
	 rA6Lz87ikpf9FuxuPwA+ETIX24ovF+RFQrluSwSfdmXKHXXajO2cPsYFNESCDwFJtIuHk
	 opInxuM/C7LuGgvIlqOzvglrOdk2gr+MpLG5RlM7aPLKwHSwnbsiNTo6RIlqk/MI/Ejhc
	 uGvnXO0CtMyrJRQxMeir1CQ795wetPXM7s2AdO7FctARJCOsDHqG3/XDxxMGal0qGhAbL
	 A2CzKKelwzdhCeBD6bdCCIAtSwemQySDQHKTC5fAYvC5IWKLbaMDvf0VpV0MTVEwRtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NppZ7CUb04bxQjnUofthCMie7KVnuMp1vzpPBAm263s=;
	b=hBibSjbevYFpTJZaHdktRDklh2ylG460uAs+AAuhpyy2tYDNSr01xIU1GsOMpajHPjib
	 QMXbtks2YZCx2xPfgE2JpulXFOyU+YKla26bKqQdkfA8mG35vcQdHindGbuJyQ1Q84gNP
	 EYtR3ShZqV+v/DEIQXyG2Yk9owphq891Nv6OXHT6zy01oqd6FQoEJVxlXjQmkly7jaaED
	 7xsnuXyBnph8rEeU3ub00nfKDj9qgpO/nDO+1oXW0tSGe/Cn1W1qejRB3lRp4TVJl4tQB
	 2udgkBvu/MV83Mso05Vy0mEJLNW+e1CvsUIC5NK0BwSgHhVnSP63kzTeNiAAzw7ootA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ioIr/mu2";
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D6607555A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613D6607555A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ioIr/mu2
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-85ac281604dso985185a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296721; x=1794901521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NppZ7CUb04bxQjnUofthCMie7KVnuMp1vzpPBAm263s=;
        b=ioIr/mu2SA07h7+SKM6mvk/KXy4Usg1jCepDPOCtDPLyq8hQuiSLafuA8T/49uRE8N
         UymSU5NI3lPmh/SscDcKJ3C6BjQqZzf0lu9Z1OOH15plpDTrvR9P/gc6acxN91gA/qo/
         a3h/cOAt5qlch+JVUq84CBFAV6ZhJx4nXJqxDwGnV5dYMcbHaU80GKt1zkLoSf/6DUn2
         UrNZSEVHRxtwBEE8GO8xl19S2x0le5GmeI3JLrrT2EF1ZnD0KNOHM+BucJ4jxOSDh13D
         B/johk8xqHDx4GWRfVd94SK3MVCjzOR9Sy2zL88POo1RGmKdKkiypXg37QV9ioQ3C5Ot
         trgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296721; x=1794901521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NppZ7CUb04bxQjnUofthCMie7KVnuMp1vzpPBAm263s=;
        b=Lfr9wxn3SbPzfavFEmsWkzu4Ze04Cp3tJcjFulBsyDzHnND4oQjQ7vV1r5BoRwplIb
         yW1wpuWSsFGhS5jat2lVmQ9q9dStTLdSVOHr1ZIWJZkWkvomXJ85P22OqGQ6gyZjloxb
         xCOGErkfDHCdSo/oNWalIw4uUqwjYIazPpohtEo1gK5sGeof/w9DkQo8UbvOX8SG7h6q
         sqT6ilYFz1rV0zFYPc85qKX0Qb3ZrAAYlYOPaLt3U9cXg3eMxva4lONL8FGt0liTut29
         AlbKboNQYScsY9oquLoWaRtGhKPcWYJ+rJlzC2eP4bs7NFPRsWSBpnqKQwYmjnb28dBm
         UQgw==
X-Forwarded-Encrypted: i=1; AL+hErGFjsDLm2Upw5xan0QHDlH/YxXnqpqAuUy7LBOYMEfS9G8M8qQAqtVB+lOi3x6aEVsKmrHRCTDoIvsI+e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y61tERj6hWE6LbjvAaO7IC21tM/wdJPiFvrK8gtJv+SSI+Q6+
	A8S/cgAnSyWScDFMnbURCpgB3MFvzqCgdp8hol50Oxvl/ghueku5AkhZ7yDyQgKr
X-Gm-Gg: AYBFou1tAzR60Ep6nfKK/f8K08IyHgTpoklXcIxlCUouDhHSsvu7uuHU+LxxPe8vCrL
	5v6iKQ92xkibWQWta7GqQVWmGFQ5TGYmwZshwnVpo431JjxIZSrJSs0U8zxItIWvvc4vem8GtJ6
	4k10vzVO1hRhxZwACsVXghMVyfcdO2tGxiFwdDN+R0yEnz83MniTsuU+WESHMgHF4izzjo5shyR
	bD1xoi8tctqE+Z+hD0p8BpUNjamwznlrMAO/6riGyvh1AdV7YGjVbS5Orp9PaC3ZSAXO2Ifjfu7
	mU7vlBsCKZnmmzjXNt31/6tPh/9ra0fwP3gdzRkTu57ZsPTqANumG3/k85Q3sxO7yJMPaFbGkzh
	oN0zwW4QKgKu/lGydhQA/vPyU6YMeHd6P5a8AGRz69IIl2VeLxTZiUMoXRUB8ZFMC/IO3jaYAaY
	jH51MgDnj3gxQYUayoFjjZnkm3NtlgqbwMy3rHs0QS1DZk9BW/WJkeQSUPw0z3cD96r4ab6rsxw
	wTpND0NQCynXuL/bFG3IWbn5CSis67/XiWCVw2IJdx+G/kCgTNZwO6nigkWEi0VBuFST0mo3O/k
	dvSEsXRgZYNTiPsdJBuWiRHbl08doH6ew/hRX4a4XdeN82wuLS3LIYoyM6GCM22OV0axiMxa9i+
	jp8kkw5/6zeZNuzg9Hy45Ju25BPip4mQhwqws3ELeXnSs1cnMKPlGcMzlf9+GQ5ZC/+fGdq1jxn
	NONam8wem4uQPlKgKVFamHMfKF0dHXW/FTh3sjCm6v6WlY9KKH9Iw=
X-Received: by 2002:a05:6808:250d:b0:4f2:4d2f:7ba with SMTP id 5614622812f47-5683c8d763dmr1340541b6e.8.1794296721326;
        Mon, 09 Nov 2026 23:45:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:57 -0700
Subject: [PATCH v2 54/58] mtd: rawnand: fsl_ifc: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-54-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Separate active bank membership from ownership of the shared IFC NAND
controller. Retained chip references keep the controller lock and chip
metadata alive after removal, without retaining hardware mappings.

Disconnect before device-managed resources disappear and drop the shared
controller reference from each chip's final release callback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 58 ++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index cc75b6a67e07..18b747e73c3b 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -40,6 +40,8 @@ struct fsl_ifc_mtd {
 /* overview of the fsl ifc controller */
 struct fsl_ifc_nand_ctrl {
 	struct nand_controller controller;
+	struct kref refcnt;
+	unsigned int users;
 	struct fsl_ifc_mtd *chips[FSL_IFC_BANK_COUNT];
 
 	void __iomem *addr;	/* Address of assigned IFC buffer	*/
@@ -961,11 +963,33 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	return 0;
 }
 
-static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
+static void fsl_ifc_controller_release(struct kref *ref)
 {
-	ifc_nand_ctrl->chips[priv->bank] = NULL;
+	kfree(container_of(ref, struct fsl_ifc_nand_ctrl, refcnt));
+}
 
-	return 0;
+static void fsl_ifc_chip_release(struct nand_chip *chip)
+{
+	struct fsl_ifc_nand_ctrl *ctrl;
+
+	ctrl = container_of(chip->controller, struct fsl_ifc_nand_ctrl, controller);
+	kfree(nand_get_controller_data(chip));
+	kref_put(&ctrl->refcnt, fsl_ifc_controller_release);
+}
+
+static DEFINE_MUTEX(fsl_ifc_nand_mutex);
+
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
 }
 
 static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
@@ -981,8 +1005,6 @@ static int match_bank(struct fsl_ifc_global __iomem *ifc_global, int bank,
 	return (cspr & CSPR_BA) == convert_ifc_address(addr);
 }
 
-static DEFINE_MUTEX(fsl_ifc_nand_mutex);
-
 static int fsl_ifc_nand_probe(struct platform_device *dev)
 {
 	struct fsl_ifc_runtime __iomem *ifc;
@@ -1016,30 +1038,35 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
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
+		kref_init(&ifc_nand_ctrl->refcnt);
 	} else {
 		ifc_nand_ctrl = fsl_ifc_ctrl_dev->nand;
+		kref_get(&ifc_nand_ctrl->refcnt);
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
 
@@ -1071,12 +1098,19 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	ret = nand_scan(&priv->chip, 1);
 	if (ret)
 		goto err;
+	ret = nand_set_release(&priv->chip, fsl_ifc_chip_release);
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
@@ -1087,6 +1121,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	nand_cleanup(&priv->chip);
 err:
 	fsl_ifc_chip_remove(priv);
+	fsl_ifc_chip_release(&priv->chip);
 
 	return ret;
 }
@@ -1099,9 +1134,10 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 
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

