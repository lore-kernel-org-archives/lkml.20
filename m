Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446969;
	b=P24Hww/cIpyIsRYjN4JTPjCR93xngyAQ8jVQOua2s/g4IHIf8Xokxm8H/Hn/Rl+YtKAP
	 s5bPsT8W2itOpJ/Sx5bY4249jIiTdYh203I069RX1fG/Ix9JlI6QPfa0KmkfJrdYjnwBd
	 hdmbhL/NrIpt2AeLmYleS9QbHjV0zA9UPM2sZOxSgCCAbZdY5bYY15Kpb9zGtpzCGuZIA
	 TTW8iOYSOjRc9+oN8Qq4co7nbf5WlKYFAQYetlpZ9bb6NiL7bs9ABvqPIM16XUFaCVsqN
	 t8Ly9GSzOyLRHOCBo9V5q/wHB7d1GUFPDjvBgx6OiB4YIgkiuKhbAtwdjAKwn6ge03Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
	b=ugHT9Pjs6k5z29E3Eet7pJGraPgbrYZ34mdXBjiBB1qAjtXrjRaK6TDRS6cQmX1OXHTx
	 ICeX6Jb3KRDCPBpzg7Z2FeDdH8KXHhFIHDKnh/i29YFjtPZ6larLKfARCbKVs64LO70Yf
	 UH65cgqAhH0wu4Pqw4/Y2WwMW0x8+yVllRwudMfTCwcEgYYkIfUsBqJB/8fqUjc8E0zof
	 xQiuGPInJe/WgmGxhsKfaIK1ECATvF4lznzFiNGXRJ6eNu+pZDF1ixBfDNB0G0xU2CxZX
	 45PB6j2gy9Df1M3K0pHN0b4FgvYprM+X9jvNdbpOK8EACM8FvK8e6jwEtkDWYUovW7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePswrXmr;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C003606A98D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C003606A98D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePswrXmr
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53dbe9b8d6eso322562b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446968; x=1795051768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=ePswrXmrqY74VuUNi1gfTCIMrE5QoOOccd0EiC2rm2EpWOZA9hiaTI7neyjPLmfgsq
         BLfkf7mgk0AhcT2lWBcI04N3GIvVzFC27jvBx2C5/KheACnMd1bNQSfuy3mb1Kxhtpo8
         IWHGx0zavIypRpdI9PfZQYOp4cdTKWVvQz7RXuyKacm0dmKdtT0F7rGpNM3tG0QNpf7R
         6c0QS1deqNr6eEZgyorLzS1rwPls6auuWaX9d0vPG1zsl2uGNJ8CHRDGJbrx+CCgMjns
         oC3wCVX4zcF//lZrZT8ioXdhi47sfsG4SFRk0AV+D72y57+3FfspcPzN5ZrlqxRkDWaU
         FpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446968; x=1795051768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZxy7Yx5F8CCUEM8n5KMaftz8PulPwrUSyE4Y9PNbKc=;
        b=f7PsTMqgrkujL6PA1pADekvTVtb3trqEjmdf4Aqx436DqNVaZFcqDJyjagWywNuAoo
         laICU24e4MYigU8SDpmxOAs/BIG1lyE9G+bZZthlFPv0q/xznIssfZFFEH2jFYT48oo0
         Q0EoPGW9XYPE2ceiJENvQMiA/f8tryvLgY6n+0uXVpQTJr1BErL+9ZxPHX8AKc1aqyn+
         jLaurQyc1+QEPneEV6Wuy1SpQLykqABpDDsEoC+JmOMaMUsv7iX0Mzw7iRyupbNXAV8M
         o4AiYvepZ5lXNtOeGLUQc4LAZSJ5NEvYJeCzHGJXH7VBIRM7WieAl+HkoINb4lh0kNCy
         xDpQ==
X-Forwarded-Encrypted: i=1; AL+hErFBw30reNQlDWbqP/KJfUguVKMT7iX9skydrHQ2oQRYbBwMqY8JYG+EoE1UM1Qq53t2SUzH7V0JxkL0hOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qimhipm4WrHoxs3iVxYmxROTcF6xR3teHm5gfmUBdpH/tXb/A
	h04jREtD0EI2TGtHO3CAR7GeBZ2/kf7L8UK+hf/yuGL/8CpD6ZzGymuz
X-Gm-Gg: AYBFou2zYMDmG5P+jePPXXuHup3/g1PR8iMoeQrz1MJ/wBylK+Tj0W8aCtIPdutB7wy
	WpO6Ih1JkfvHF/cHuDVi7wFf8W3gCE7+w9BU34hk1iSEOFNoilkiSFVWeH5zAMMjcbE7/nDgH29
	Tpv9/D5FAvM7Y6kUlKvVgHAHDguvJXVpCI1/D8ZF10i9kRjH+tTs0E9xtpc7YbR3OI0SlEawriT
	rANwtRCV7B1KyPPFTuLGKFYZ4EScptIxC7p+qEanyM5vFdBkij47Uuuy6htJm9Gx3r/FYb4lpRN
	8EWTW/YZaQ21R5XryvJ0P2ZVQSqoH6+CY/yl31vrQBJSQ/gwCYu13S+9lYxPQJoP+ZfVFd6HWk7
	XZmiEEbVsrx/NOvP/AdfZL9Q0sn4y0tqVd4trBV2vm19oKGjgxbsGb3G0AgaLdGkEhFgIQ6YhtD
	gIsYRvX2l1qG4WBV6p2P2XL3gMreWDlDsdqlYgapXXjF6nPUqOJrGVCC+P58sa/9Bn8Xcb4Ga0D
	s++bxfOIvjFs6vUy1KHtYdt6ljdzNovcgDB9FTK+6tlkisohqsRlZXe8S6ttCX0I/heIu5ZbK+8
	dbZNdL8PBfzBcCkIYzAlHanZVS0rW4ATNn3H1RCEyNOp27/ueXmm5oxYJFjhAKx3Z2cQ9lYfOFP
	HeVs8Z2Qp4VOTy2b8rqLBdcCg0LJQtRU9oa9ENzfZmCRMXmwf4qATm0pcn7Hn8sgzwDzQ1kpN7G
	MLYaUVPZm0lXpHV526FMPns5TWTxOjl550awvaiF3GIoOAJ1zhj/8Yftak6uuYzrjaLNGsCjd9w
	Ak=
X-Received: by 2002:a05:6808:c2f5:b0:540:8ca:36e3 with SMTP id 5614622812f47-56cd7d08af0mr1074469b6e.19.1794446967621;
        Wed, 11 Nov 2026 17:29:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:33 -0700
Subject: [PATCH v3 54/58] mtd: rawnand: fsl_ifc: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-54-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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

