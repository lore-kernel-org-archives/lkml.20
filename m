Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810634;
	b=oQqEpFrZlfcmXl16tIp5V7o5sUm+iREyHxMSdeiGUnnb1KmuZSBm8t0ns1hHgiBMRw+5
	 s7CI2k4tW9R0nE4cNFt34Hi24dk+vnJjz7h+rupCoDUsFl1+c48sHzefknmmjYM80wUv2
	 GZ3v0U4lL48nXb8jmwA1h32Qv/PnmPb81V6a6bTgHhYqJbZB+RY++s8r0gFH2WGdpDmvu
	 EAX5GfYnPr5kAOTfSgnRsFpii4zsDoQ0b+x3ls72yNiSnPcJI/eopjUxIj3UTkDAuaUXl
	 11mGRc8o3ThOe3BaPG6zjOYsKbU/r2byeRgXtTwVWaSAJu16wKES+5HDPVPMRBgcjzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
	b=GBs/bwpiXNBznpttgIrAZ2h0bl0NlKW31vteiOJNa/SZwUn5JaDT/XYF1+NR+p4QoHq8
	 vP/TAKgHqkpE0+erbj18OBePF9nWaEWBNSWpJqqkbCnXVYNDtewg5rfYixWPKzWB4PFE0
	 Dj1mKkljE1mZpRZ6u/FjVCRQT6fco1TAkzehCljl03gtRqoL5QIbV8PgK9l3b47RvemQK
	 swhOnxVnqWUfilfXpDCfQelPA6ZMaE8cNDonHcXprW1xD+xTStWD+Are6oe4wyCu8BQ7b
	 R8fCZi1tQr0QpuxbEM8Qh8gKTaG1IUv/sBQt39p8q5Dzwb8+Mxz//0mgAOjPKcKGFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFXI705S;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89485606A89F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89485606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFXI705S
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6aa9606ddadso2737796eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810633; x=1795415433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=PFXI705SGC37+hek6XQ+e54Y+FmE61eEBcqSxdQNqczOlHqaWTquCcVTZ9mi92fSMy
         XY5rEb6Cecizl3XbYiMYprY2IPq9txcBTTkr7gsm5djCZcNNZjJZ90uoFpNZTC8ClcY1
         T6W7gK/+3h604nMG0S/U6V35J6g4x4b+qRfTi6ZKQBcahJZ1rTO1rKBshGETTAkCoUc/
         IFhe+uJYE72qP+rkpvYeAnT/zHw/ydzb6TvNx9XdlvJ+dwTL7OGi05gEH4cFSoEPXcL4
         vFAPSFEsgngFWj/fudruHzjCeE0iA1yZUt0t4WyEfX+Guit8n6fJoMUD4rUnazQVJmrz
         5bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810633; x=1795415433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=c1sEt8I+8ZNI7/fJiPr1LYc68n+yMDbGVL0+rgWuCrDAaZleyY7ZevVF6/d/KXPzc0
         1CD0mhAjeOcuqicKI1+DlhP5x1F6DKSXfZ/ZoqTVWpyyyBtlCras1O91s9o8oDF+ld7y
         U6tYPqvgWzl9YPms0sD1txuljH0xjNbgYkTU8zyRiY1Ra2ZpxVms5a2akX+3GNuoEGHM
         yXY2shNs63brjINgm9Iq/vw1SaKyUFiTEsIIlNrhoN6RGQPXOwxWteQTO8kjCMmjEqHW
         dUxfAPVOH5jnBW2BjdZuf/y/8CbyzgXrphHBTtBk1M7zXWjd0irJ+T+dJlu7NMHK4nO1
         iWpA==
X-Forwarded-Encrypted: i=1; AL+hErE4sDNgE3blx8DTx6DzOKlX/ie16FaOwKsoCxB1zpiZwG/AQYliKy5QHZ4c+szvCFyS3QmDW2RHXmfseI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nrZsdaSydaqNxjVGmBAN8hi53bYL+YmgsDERFe7FiJLoIw9Ji
	iCw9/G9vE6qJDtBbEStmtkY3RykPyXst2uAob3T2SKBNwignwom99Hmy
X-Gm-Gg: AYBFou3pF6Iu7MdPi7Ds/wcscgr35Y3cZ5t3o4/6YPraYDXt2MwZ9BAtvyArfLmXlCM
	n2HySQDGv81JmZa/5uWvShuOsvDpPXqKULaQ6QnUgmA2Sd+mVrdsa91CvJT1h5dJ+0aWK7oCWvl
	cxUZcjjnWRe0hhudYYdO+T50lxMSHRWrCuyocODi/miA5jmxGqMo+/UWULq6A9aGxrO0cqT1jJu
	A5qi6ADE0ih+8+98k/8BJnDezsVFSzK+tkoOVMo0BCE3WG0t6meSqgeEowncMeCzH4+qG7cwEn9
	3yzo2n1sKpZmY53OqV/XiWKURXW870eXThQT8CymW+tdqGtfvotFBX2qpXjsrSOTTLylCU3zccb
	MtayeD0gMS0kfXjcE+5Q+s5/U3qyBmO6lTJh0v30qaVA0su2NC/JyJ3/+jSuYnYyqcRHPSQb23V
	TfTrelPJ4U9c5DF+ifwnu73RIu3UOC8ntpnZ2tyE0zt6ElLUpciYmdc9An9JPSLZ5nGdNzEJzG7
	uZUCNQCZlP2RedKHFNbB+m7DqBxSwQqHggmgDPjMkRKWBrX3+sUvko19Xr/a761eg/NBO+9EEhp
	OcdnsFn329VyQ+d8SYZfwxyrLfMUmijJ9Z//10ABfvWdegyfNmASP25zRN2sO6flm+2pIj17Tc3
	q2a9sCA4CtOSJ4lDxgWednCSwnUobF7OiwmEM4KihhmiO0y6QzOgV2bj5xynHTR/CB58p4gXX8u
	S07sFJuqzEkbfikhBflc4Z7DCyVxw1o3NN2aMo7bFIeSgCEgelvGsuxxdKig1YIjdqOQVvcU3Q
X-Received: by 2002:a05:6820:1396:b0:71a:e21b:8213 with SMTP id 006d021491bc7-71ae688ed43mr2480312eaf.13.1794810633535;
        Sun, 15 Nov 2026 22:30:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:54 -0700
Subject: [PATCH v5 39/58] mtd: rawnand: qcom: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-39-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Install lifetime ownership after scanning each chip and before any MTD
device is published. On a partial probe failure, unregister only the
published chips, then disconnect and release every initialized chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c2ccb999ad8d..3451687a2bf4 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1903,7 +1903,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2022,15 +2021,17 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = dev;
 
 	/*
@@ -2053,7 +2054,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2061,10 +2062,15 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_lifetime(chip, to_qcom_nand_host(chip));
+	if (ret)
+		goto err;
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2076,15 +2082,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			return ret;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2106,12 +2110,16 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
 		if (host->registered) {
-			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			ret = mtd_device_unregister(mtd);
 			WARN_ON(ret);
 		}
-		nand_cleanup(&host->chip);
+		nand_disconnect(chip);
 		list_del(&host->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -2149,9 +2157,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, nandc);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;

-- 
2.53.0

