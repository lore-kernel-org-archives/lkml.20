Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594398;
	b=AlGFWLRUEdQbznT28mBZGTlTWYCg5FKbCtvzVsPXCJgvOKrld+3EDEKjx/4YKecomrRG
	 UzNUjnapedEf1cUfRmk+m51nhyCvNF0pcgSRAgamaAFAR1i0BS2XSyXAJovJBzeLtjy7Z
	 JK1GmRhrxWXh6ONqUnnjBPDTHsLGrq3CjGjWL68yUSGEbBpIh2a8WRan4EugyJL6hnuYC
	 9iGC2+KptGv1S+QD+hFSzHeZugYB7GIpGyOfFnhoCRWReGTC4Nlq6ziqJFjDoknJpoYAT
	 Jc2mEKuy7Jj76l1oWiqWi0+edn6F3hQiffX1Zf3Qrxv2mduD8lbam9ROExQXKuwY03w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
	b=mtJfMw+uqvy4Apsks27HrzqH6AHFPK3Z0VxHGPPriKMntuqk8BImnJZESSpdtFMcj+hb
	 yu+/0N5o4nA0PQ8g9XIchuAB5tUaJR2yXHHf4YRMubXYX4i654EzA+LtBay1r8yh2jjEX
	 glnaGkPP2ZEc+JnJdjLNSItpbNFal2xv6rKmRaxy8IReFiqIYfsxeo0IAJ+RWkIhEOfzc
	 r4HoTD4ia/qPcC641kacWDK14Fm3b0Q4OnVBkeu1Wt/cQp+qeJVEDzXZQz4LkuXePZEwh
	 JU78smOUP+/GCvD3IhEI6D5r1AufKFnfGIH9hWU93927YNFZyHqxe0S7IQFinMh6x4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zd0y/uyH";
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA07F606C14D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA07F606C14D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zd0y/uyH
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-717034b331dso1462765eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594396; x=1795199196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=zd0y/uyH8VHumLtC2B3NGB7Beq/Jl7uHF09PM69S0rl4kT2/Vo649ROm1BVaK/FMwl
         0Kq43t4uPfSYs4RqPrfzIQ5ZyGMK7SY8l7xNQ1ghBXRxLDSB2QntC93oNDdDma8La2J/
         uCq63uiShqTNLVn9voS/EIgKe3rvWSIXHj4tuN7/v6e88xlwzGbZPjEsVMfg51XafUds
         9OHBc0Q7+r7QYGMd/LKlIozXGXM6LaGJlg6LcYtuJkTzcx2HWmUasfwJUd4oN8zlZvwN
         W+QAS5oU4QCzdhtRYhhYUimeT9etdc9betdpYi0sLhJXNCbP4j8Zlfm9qSHcrEc1FoVS
         Z62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594396; x=1795199196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=YrT9BzWloOUNNE9Qm5U2wpFmADIp5ZEOM5TTrSEatjPsHDb3TZutmRMRLf1JfIbrYS
         K4n2v9ZT2gGfwfIq2k4bzx4iv9K5qYmfxb79EvHDVGLsZqt6D2jDIn1CaslnVS1y4GAm
         dYavXjwLa9f9OZUwlARVkAfeOp3a6pTo0LB6jBuina0XjYbHGnURSnFRFo3iogt8h7nL
         wx3UccxluZvpliPkm0ONL6uvrY4O5xSXGVafzaD2pDjKNw5kypjqa2gi9kHTWo58lEf4
         bzGBMq46G9A3yVhJMUE6D/II3AQFmr2nOUsYLk7+U3Xo9GmqCXpWqIE0A72B87guts6t
         j0MA==
X-Forwarded-Encrypted: i=1; AL+hErH2hCNovTo/csDy7YhxYi2JR9mQvwG6RnIl38H/fgF0yjcD//aSEeF0VBt4VpR0MYayVwB9oUh4G7SSVkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fyPjgJomp8HzQZ4H/d3X95Te2yf+iCIS/UXU/CK6lqwvTr0iW
	RCJtCG6YmrcEFwoBJ+kAWqkMmLsoHjhgMvNE5uA0O37mG1TAhVFX/XPB
X-Gm-Gg: AYBFou0WIwIijEPOsfOZmcPx56+LMJUZoIRoi+W/qgDxw35DTKNdma+Stt53QfjSnTL
	IU3yo3hcuKx0rskl3FeWmzQiHp5XFqLlebJMfHgD5LPoBfm93fnJCGkG8iPqBZ45je7haVWqxoq
	oe5pOXw6hLR07tsDrfcm0AVpFmej8JAyyQ+CeV8qRD+ZZ8EnwIOo7XaMHEH6POMBadU4UtM8CUj
	XGrAiYs6PKRa0OMv/LSxPu8Lfhdej+z1DMLgj5RW/RKjazZ3eJfdteWDJcZJlCNHknelUuJp5oJ
	DbuOENTdI0+c3alggX3e42KnJqMtjEZxx1E2pjv8xrMwxlBgHvblpfOCPm9HpRc2SJMxvE4l8ko
	1CbnlG6jUSR6uFk97XZKcMIWJTcGysFtLzGV1mgntL+RBXZXf+kSAcKRApsuEwRiZbGvhz1wJrm
	uktS+aukR4jKAvoPi+otFVAjN73rybih7dVyi5QuNECv8NnQAW8AAhn1IjF431HTk5LGzdBNAAd
	puU/NTeMYuYeEKzCte+Tc7eaVjaFFXKliXqkZMAhW9QN9KK7+Q/lNSwti6l5Am/ewzrINjV1OAa
	v2B4ATlvC73+5JeZZ57Y9sX2uZfHzqYcJhUNgiHnP6ot7hhS4RaJMUxk/pmyW3990wxWsQ+nBqR
	riosvP9IJmVp5gi8sseBGnrgWS+0nVkrfn1NovlJfuTuyegljdj2j5yn95iIoqHx6tHAi9tKgsd
	lg1KpxZX8aVE+ONEjm3MpPauCRzAHCpy30JfJizRbxLpdK4vIiZpg=
X-Received: by 2002:a05:6820:c449:20b0:70a:598b:12a9 with SMTP id 006d021491bc7-71ab50bcda7mr1553769eaf.53.1794594396542;
        Fri, 13 Nov 2026 10:26:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:13 -0700
Subject: [PATCH v4 57/58] mtd: rawnand: cs553x: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-57-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata alive while MTD references remain after a partial
registration is unwound. Disconnect before unmapping the
controller, and release the backing allocation at the final MTD put.

Check registration failures and release the corresponding controller
without leaving it in the registered-device array.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 44 +++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 0b872b1e3b04..4a43f5e542ca 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -263,6 +263,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	int err = 0;
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
+	const char *name;
 
 	pr_notice("Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n",
 		  cs, mmio ? "MM" : "P", adr);
@@ -285,9 +286,6 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	this->controller = &controller->base;
 	new_mtd = nand_to_mtd(this);
 
-	/* Link the private data with the MTD structure */
-	new_mtd->owner = THIS_MODULE;
-
 	/* map physical address */
 	controller->mmio = ioremap(adr, 4096);
 	if (!controller->mmio) {
@@ -309,6 +307,13 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	err = nand_scan(this, 1);
 	if (err)
 		goto out_free;
+	name = new_mtd->name;
+	err = nand_set_lifetime(this, container_of(this, struct cs553x_nand_controller, chip));
+	if (err) {
+		nand_cleanup(this);
+		goto out_free;
+	}
+	kfree(name);
 
 	controllers[cs] = controller;
 	goto out;
@@ -344,6 +349,7 @@ static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
+	int registered = 0;
 	uint64_t val;
 
 	/* If the CPU isn't a Geode GX or LX, abort */
@@ -374,14 +380,22 @@ static int __init cs553x_init(void)
 	   do mtdconcat etc. if we want to. */
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		if (controllers[i]) {
-			/* If any devices registered, return success. Else the last error. */
-			mtd_device_register(nand_to_mtd(&controllers[i]->chip),
-					    NULL, 0);
-			err = 0;
+			struct cs553x_nand_controller *controller = controllers[i];
+			struct mtd_info *mtd = nand_to_mtd(&controller->chip);
+
+			err = mtd_device_register(mtd, NULL, 0);
+			if (err) {
+				nand_disconnect(&controller->chip);
+				iounmap(controller->mmio);
+				controllers[i] = NULL;
+				mtd_put_master(mtd);
+			} else {
+				registered++;
+			}
 		}
 	}
 
-	return err;
+	return registered ? 0 : err;
 }
 
 module_init(cs553x_init);
@@ -392,25 +406,25 @@ static void __exit cs553x_cleanup(void)
 
 	for (i = 0; i < NR_CS553X_CONTROLLERS; i++) {
 		struct cs553x_nand_controller *controller = controllers[i];
-		struct nand_chip *this = &controller->chip;
-		struct mtd_info *mtd = nand_to_mtd(this);
+		struct nand_chip *this;
+		struct mtd_info *mtd;
 		int ret;
 
-		if (!mtd)
+		if (!controller)
 			continue;
+		this = &controller->chip;
+		mtd = nand_to_mtd(this);
 
 		/* Release resources, unregister device */
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(this);
-		kfree(mtd->name);
+		nand_disconnect(this);
 		controllers[i] = NULL;
 
 		/* unmap physical address */
 		iounmap(controller->mmio);
 
-		/* Free the MTD device structure */
-		kfree(controller);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

