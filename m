Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296689;
	b=TnszdN9YnLK7ZXBm9P45/FYty7iT4YNigwrA1aE8ixU6hMc4eq7jpyUYJGeCrafa1H9U
	 WvuA9X5d707XhE4VBDFtitoo3TGbfu0F8w3NdHvO6CRbHNvDnLwkDgnQXfSf2RXZDyVqi
	 nFoY+Sapymoz/evg0asNZ9c3ADpD/jZJS3r0AwrzsDXPK4UdD6JaqydUUIxSWueYOqGTv
	 GTHW7DnkEiwdkib+FHi1uj/Oon9czUE/vSEyetyP33Na+no+fdfd29QyPdX9+gcDwQqGm
	 ldovUbgOH5FYbrnh6mw6wUU3h1WWNv96wN00QmbaU67aqj4LX79JV+82wVe+o3IqFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
	b=USPIOJlJMbbdsPyEzRuz6jTrFDQvmvOvUVlooF76DD+GzZw9znuXZjSxYbJ3eglUdN1q
	 2q4CLYE5/W7paXW3Yy4ZOcrmvLgCYyLLMq6pgw7MR87eEylVYZ9M9rXxj6YM1sVYqQSi+
	 smKP+KAajjwGb+UTLYNCmuGiKI3O9YxrJFBrt+DfpBh5j+MXKJdRv25xiGogA3F0IpY/q
	 GUj9blUQrzF9XDwQt1XvZzuc6IYL8KbpMp+erBa85ePIjuRfyFz2hoiOn/hjH6RywoRhJ
	 TIrUmjyPtVAjTScQlH2tqphp30oV42Kix/ESZIZNiOH+0+3wnwDHr4WctlbAr+0OrEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIRO+7wl;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC5606B501
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47BC5606B501
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIRO+7wl
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-51f2e9e6987so1035550b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296688; x=1794901488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=SIRO+7wlGPqi5odk+/Z+wtxsNbSb6svoDu+RhBCqDtoHsAQfe19u+kGQR3zq6F9jYW
         biyU28vpPQt+7ex4uBkdX925+D450sQ0KS813ossikVDiiBA+G98UlQgF2nHyoa/R/l5
         VBsStZwe8rXj9HrKb0jHwORTL4ifu4QiKbdFb/09MSKknt0OlAHINJEf4kfry4J4Swat
         FS93SAQnKjtjVUMRCG6h+I8GNDNTjDSEYapQmGBX53R8dX+VZ/FefcSTyzQsQRKU7sKD
         SVExDMIlS1rJC/QQFb+hlAeQjBEB6VMmYX7eTKry+QXxeMH8j/KQOttD3uEv+ILxTjjC
         8lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296688; x=1794901488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BAmvwUewoGLOJLuXxq6dZ5RycZKZl8yqwoNBMJWREA=;
        b=DC3W9VCl/kmmpw42Q31SJxX60M9+d3oCvjAIi9qupDghIFi4mSYEOCVd+ltRSmz3hu
         VU8dIujYb1XmyAUDB9LQpuXsMVFKO/UCLv7JU8GLOjc4WAXdBo72LStInLGk6zYedVCM
         sypNRw24wmQABIz1z4OJ3Yd3kYT5gHltkffjT3ubqEwTghyAwQIc3SJ7w1YRk7aGiazI
         3JmiSF7+liVzy2eIsv7MlfFn+O21wFdk+w3pznInE9GgjMPM6QSyvDUtcRxM6fXjbwHx
         9sp1XDrr1mOigp/o1apNeCjmhDqavxXrkWXTyG+Nw+fpmZdIfPFkbdR1MYHE226EounJ
         uHQw==
X-Forwarded-Encrypted: i=1; AL+hErFGoB2H4zBJHFmu+Q1AUntuPDdYXPfvHwT4/9vALa/+mayjmJ7Seq/g9a6QuPLDszBqacT/JC0DQ5Eq91o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9O2IUCG6K4uOLlzmraRSIxcwa71txRVhpehNJnz55w+z7hrW9
	Pmh0RfHOxIuJvAAfWI8DPDhQK7VCDbQX4vzmhVPgmneui3aem6QM41/nTgAuYGaL
X-Gm-Gg: AYBFou2oQvJlaDZDcUiGNfESxTHLigFmLQf5Zj1bjb0KfwLMnevrQ77zvfC8SJ7fTDa
	sVzGUAoPOPu6sLQMuQ6dgX9nPpSbxIpOhVAsIClCBrpIXmoJj/IKbFOWemIuhlB0EXVecZfkSZM
	KNMyLVrT+0xvejy3iG8UbA6grwXp+v6pDpAh8jIoCA8NT8b3BuZFtbvQnGaGPg6n+QQBuNACrjA
	/lWUI6iYOjbrqRvj4lrWFfv86M3TUWNV7V4lkH8wwSPZvOeECgkRwwWQGNTr5GJAf0bzKsJZhGO
	vUvDuX2N3MJPNg/tW0qA+wdvtZ8izTPk/MNR7kbiIDNXx9Sbufu6B0zQ9QkGjMxQ56hSeyMa3gj
	8H16FpMl6uzsb+ZwOKAbWZ+AKWNoIyeWj/Hvt/YDg8uuYU8O9pMixXoLpis2/7b936WzuQU967O
	XUY1AUFZ6S5riIWbco+NWP2dzE9VmEzTPlnlohSr25DXRjbVCC/qWOMeGyb5QLO4SjsdZZS/O4U
	UAbUR+MnSlHFrTq/z3/xi4ywTQhGnloTlj8gvhzwMW5En6k9sbc1QFjC9VnxM+IMyq5Km8N333+
	99Ws1Gq2lqMctQIzkHIKsOQOJTNpIRTaDYCwotWiGyPbzj43Qs9dlEnH8CajF69OSzY6YCF44sP
	m5mohYRq8tEISFZPF+OgRvtHiD600kzUQCmquRebt/A3lnSG7rw769NJnYbainkGrApLxwKc1ey
	u1u6dsG2Xa70vcALBVuwxhDWuCxXYE5nX1iY/oSZsrZEC87aA+D90=
X-Received: by 2002:a05:6808:4f21:b0:4c5:38f1:80cf with SMTP id 5614622812f47-568812cf121mr778987b6e.21.1794296688140;
        Mon, 09 Nov 2026 23:44:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:28 -0700
Subject: [PATCH v2 25/58] mtd: rawnand: hisi504: retain open-handle state
 on removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-25-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the host through its embedded legacy controller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..36427a242c2b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -731,6 +731,11 @@ static const struct nand_controller_ops hisi_nfc_controller_ops = {
 	.attach_chip = hisi_nfc_attach_chip,
 };
 
+static void hisi_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct hinfc_host, chip.legacy.dummy_controller));
+}
+
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
 	int ret = 0, irq, max_chips = HINFC504_MAX_CHIP;
@@ -740,9 +745,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, hisi_nfc_release);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +798,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +822,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

