Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296710;
	b=zDr2mKC3yd5oLO3aBaTY+LSmThPCi59WnQQFD4mEZHyafIBXYmAEfJ0KAwGwbg5/1FQg
	 fJhMaIrGlcTFbPizeGWbwEXmTETGP/Ouc2OkQfJFXtUJZ6stLBTfnA85YiRZPknae8XzU
	 GpabDaJC+asF+8uj7QIjbjWsSzxCd+INrx/nuu7+D4FNp7l2t0p9H4ggz8tZQJ6xeZk8j
	 b/PqNO10HKLzReWBKjQ8/VSj0PoikCLJsscXJxKCALxBmIUxAe0exhRwUSXT2+toNUzJF
	 chkMUMKcepvYeSUlhiCcAtzC8a9IdGse9tEpk0PvrveIXyuu/lEvstmtaqcN+m9E+mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
	b=sfHmbQoIGMgYu1z1aorUmO5iVqOSM4IRK89lvZT1JRa8b5FyZbVHqcsEWphG7LrlkAFt
	 Z0w1vP9J+FxaQTpRDSRMaxDzzxxEsrAIaKIKMQzua3RqSi9ddJmf7doq0wVvAC0+uQBUb
	 tAPjCRonLlBpY7uCOvfZA9ROMKefTWY+Pbnl9isPLqKLPRLmHVrnQLPI/TKmryUox1aee
	 7uXYP7FcSQTtnEl8YQigtzfcqeZgy7/KKa8j4oUwBodqTY5gE2tpDsb7sz6j3hmbYsUCt
	 e698YET0s9f7HSNjO7dDqBKUlKb9F9GyPZ6H6CMLZuGN1erlGeHTzKhwPaM1x/o2PAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0mdlY3C;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B460711EA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217B460711EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0mdlY3C
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-486f013db83so608998fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296709; x=1794901509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
        b=t0mdlY3C/DPotq6jigPjZq7L3uaPlZQ3G1MwHRKLWvHpUWANmTsIL+Lm12KzHNEoRx
         UpsYPywj+k7bUxYNuRC2UbCTGr+sJX6bMo8SXcxYSU0UdUJUgZH9a+fp7qRPvlOyvlci
         WskF0BwzEWfNUERZYbBEC4kXPtH1JPhquAhjGoLjT8ulbnJp3qe6S8bNwSYRzJmnLlyN
         Ms2p5+OMmSvKyN2rGNxIReuf3NYgQif+cebtWCEMMFLfXzeq+DvsJjVIkLdS5TX1zJYi
         KO69fOvX3LFgprwS/LzE4z8FlD/V/jsmiBE7fpCRo+isEUWjY79WW/2v+Zrxdw9rcXKK
         GnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296709; x=1794901509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oX/04PSyv+m9ZWIAwPwysaJo9a7lukovrgxtc3xymbg=;
        b=ut15zTrxshZD91KaOWnAbIBmsFQV1QvT9EubQKobmdxAdQ5vfmgcLDRVIZOM7Y7/86
         6fS+8RYKqCofcq8KN2/dpDmHlmvBoLWfSeR9oOIPy20H/Dih/pCnrTORgvPyYdTNrt3N
         SPpDZKadKAY79hJn8LqUz/UDgSRFaiAxgsjjtA5R+qtfmLH4NEwBMq48KYW8OtyWiy4B
         AhNoisIUd/+njA3tQs/h9Pp6MT90bcusAdz8GZsJh3FOHjzpfaF518l0sr+37F9ol7Ko
         O/1ykDUnk4qBI95QhZBuL0unoeh0S4tObMDJpifBOemYjEcK3OoWIPl28OvGlV22y96q
         edzQ==
X-Forwarded-Encrypted: i=1; AL+hErHzQNmzdpQeJDl4Ohqp26sNxfotYH9R22BvPOfzyv1V4rhoG+TBU9kyxOUOVftGzvMhyG6ii6IrvMcEGOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z99DyM1DYjTP/JQw39oV1yTQgHHrSWgFZvpd0X6XfLlCwWgkg9p
	zyeufLAn12y+Fa2GDBhp2DzSLgpgj1NNYyTxBOG05B+mXoBTdP1kxb8ym1Rl3iiQ
X-Gm-Gg: AYBFou2cAp483L9ejonz4NXcXlmKfQtkGdWjwEfEGm0AWvezpDyqSouNQnrJo2remW8
	Ch8kW5VfJ4+QH8eQqamrMAAO8FqougD1Qloy6UJYb5SjVd1CVKqN91hDwYOOVU18Tz3QSdIPVGj
	U5NMF48HwxfILELtxcA3e8lhTZtLEXCOLF9pplAW3+zSaRGMx0YoTHGFaQx9nymDuTjWG84ONTW
	7kf3SRpOyz5UDlKg1tICnrv9PFjRY2LgVSzBkHaRgJ5bZJWucSGOfGJJn1iv61AVH94v0eHMNx/
	c1hMVfFfjl4q07uCySLNWO/X0VWA02djs9nrG908DISuUddh41Ki0mboUVTV2vXwUkA4RGCIoYn
	C1rmSEwLVBjdNq7p9hZq+G6xPmjma6Ny6QrKcpBXj5CfYJvM4RcDLmz46VWRXF6sAJkOxWsFYS6
	r7Ha4xdLRByzmeNWZ1d6eQ9PQUNiYgEk1xs10razLH2AgwaS0xZx4U75nIHxGuBcaZ19ycXS9TU
	Z5TASkmiMEIEo1KMxzj5yTCUyrLFKNyD/+3D9oO+ILCKlxbUQTpExfP0UmN9ZuHWnroLmzeFfTb
	EcFj6L4zCMkZ2irOCV+1rj8jbZm74q0b6gbW8YjuKUkDA42q36Ht4kP0gigCw27TQe9UYk4JpAb
	ovUJPwmq25UULpFYCqEM8hJPdz/bej33cPW7PIxQqnXtT0kYhVL3UL/cjnC7HyDEgJvomX/QIIl
	mUC3OEHvY94/6oigWQwHxI1dyDi8ko8RKB1QtPm8RRtcgMKF8lcT1s
X-Received: by 2002:a05:6808:1a0a:b0:53b:9d67:60bf with SMTP id 5614622812f47-5683c999877mr1345321b6e.9.1794296709015;
        Mon, 09 Nov 2026 23:45:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:46 -0700
Subject: [PATCH v2 43/58] mtd: rawnand: sharpsl: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-43-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Separate chip-select unmapping from chip storage reclamation.
Outstanding MTD references retain the scanned chip and layout metadata
after removal; new hardware operations fail once the chip is
disconnected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 4154ab74f169..1ffd2b210d20 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -114,6 +114,11 @@ static const struct nand_controller_ops sharpsl_ops = {
 	.attach_chip = sharpsl_attach_chip,
 };
 
+static void sharpsl_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct sharpsl_nand, controller));
+}
+
 /*
  * Main initialization routine
  */
@@ -135,6 +140,9 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	sharpsl = kzalloc_obj(struct sharpsl_nand);
 	if (!sharpsl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &sharpsl->controller, sharpsl_nand_release);
+	if (err)
+		return err;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -154,7 +162,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&sharpsl->chip);
 
-	nand_controller_init(&sharpsl->controller);
 	sharpsl->controller.ops = &sharpsl_ops;
 	this->controller = &sharpsl->controller;
 
@@ -188,10 +195,16 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
-					data->partitions, data->nr_partitions);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto err_add;
+	err = mtd_device_parse_register(mtd, data->part_parsers, NULL,
+					data->partitions, data->nr_partitions);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto err_scan;
+	}
 
 	/* Return happy */
 	return 0;
@@ -203,7 +216,6 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	iounmap(sharpsl->io);
 err_ioremap:
 err_get_res:
-	kfree(sharpsl);
 	return err;
 }
 
@@ -221,12 +233,11 @@ static void sharpsl_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	/* Release resources */
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(sharpsl->io);
 
-	/* Free the driver's structure */
-	kfree(sharpsl);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver sharpsl_nand_driver = {

-- 
2.53.0

