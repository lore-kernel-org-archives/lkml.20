Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296725;
	b=iCTTPAkPQy75gFikHHVtQDExqurPYm04rS0fx9PZ5KBgD3TlCf2W+ORNqkD1p0uE5ot5
	 tVoags6APrSa8JC71EY4Sm+WA8/71shJNrV+Gq03xHIySWGTArPZcSemeU4UZrzNkcB3D
	 XHCyihZE4W71vMDMQ49rKuCl/jLVmHVkQsyvKhLHxS5Rf9rd+zbtaCfjwn31v69iso/dp
	 esI0/g/sm9OY9GRVN5EwAxgCz9yqx66l+dDPQgCWCqi3IDf97C3EIic/DgJTD+rs5G5wH
	 U6Zsi3oMjJiyzAiTbwy98t2MeYm+K4nB+9Sv7DaDoF0ATFPKu6k1CZHw6RNXcgmAoUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
	b=wDb2ZLK4hOM4s79jOI4hYb/g4TA9d1+KEydwscNYkfGi0QA02F9jQvefVHbHue5iODGq
	 qLqNonSTo8nln4303fgiIf8snnkYsKHbP/kIoQArUfarmafEU06N4mTf5rF20gYNRQcEc
	 jryYeQ1ljk3mYJISDzSQI8+0Q9nRpxKe+p4VaU0iCECVOzyXLhqOKu5m8AvYxVNVCrsIP
	 8mx0G7ahn1vuqhRDrqqvc/0PpnCftWu696CzsmHMroRE3otWFCnQ64azXe8wbP1rtrwOk
	 v1yL7yr4Swm+u1L4kJZGEIsKALf/MNBRkUWqmlZ6JHtL/SuwbxUKmPSRBP7zHJ3qwdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+QWvTE2;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7546076211
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7546076211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+QWvTE2
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84a248254f4so930131a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296724; x=1794901524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
        b=x+QWvTE2qBbbgGHPDmRDYJtwFevniv5XFrrYlqiXDh1Rabl6Kmf5KaCVJTHnLaW+Rv
         E7Vtq6bGtCP7bIufqTCh6naV2C0dc/yOLQZYi2jtoOPUcnqgzbAuEke3mzA6MMvIeo+Q
         LcK4h5awIeYz9hBTcH0bM3II8NJ8KSKkwU+E/Ipn52Y9F4emADjBS0J4k8kPqbkBgE3C
         fzSSxQ1JI2qXBeIwEQgLeQzQiUaOzp6jItXaHlbrUKz6pjEI5ywrzLm6bn6x9JlrWYpq
         PC0TG7NqaKMjLhUUh3ONGqTlYZph9FScMX+nsZt1FzrVGvFLer+7pLYwvcUHKlN8mME0
         J94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296724; x=1794901524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxY1HbO6C2RfpZ036fxI7eWu/qhT1X06/xSohH0ZsQg=;
        b=PQ4pSN3/Qcc6JUboz6N4ghgwdeh29HQAJg3iQwgU5qoew73QKZb5Dvu0j7ip9zbmnF
         JPqFl1MpPQ2X4Do5CeOYVYtDXFYngAnE4itjrr0x3XqM3cBrsghICscMfW9MsMopcLN4
         pTp6cVmCcZfBwBP8ChEpSjj8eEBsbiPk0pJtfTiqSOLEvDuvfNY+b4IPVYPkmcyCbJlA
         Vclda8aOwddqZHszsisvHBoUv72h84F22dgQwUgxj3oMNFZIQ1nBZDv9ikzjIQmv+H/J
         MByIXqIGIQ/b+/tcPsS/4sl6X0nO4AzXqunjSHJiobRWKik2/kogrmTC3h6TmU6tqaoX
         /vJw==
X-Forwarded-Encrypted: i=1; AL+hErG0/q4gNF6ed0PhPr3Hebrbe6vbTwhyTYrefj/ur7dwY2d5NqY2sYhEcBeqb+NCo8V3VgP1oQWjNMyRegQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Youxivx88OzuvaMN2kgMW8OIxUwLLhvi88d3UQjdxITLqBB6p
	73lSRkUM0zqEJ5XGoHCL9UPsJ/XnSlHd88WPoMIt80KjkhM3otVckpdciYFxJm02
X-Gm-Gg: AYBFou0FOYIKZli1yfueGTr81cANvPmcmbyKY3mbapLN68X7gw9xOQvjF3Gb/YqPKJ5
	Cpfp1jIrFxDRtHexcdYEon3HiWzhzI1Nqb+S0gyxMTXr4LJcMujiR+pAL3bqEAgFQr0zqWZ7CIe
	0PgwV5rv7U2eM+PqXhp8asWVjZn7vh0pBvyAFCxyrn3Gr14jceCawxyx+A7FBUeSiAmgX5Ae/3Z
	tu99O7H3ZMTmgKqTPJ/PjBxszonc/Kr1kY0nI5WHOobo/SgvaDSIjf0E2t3jSQafD0hj2dpUD0E
	pW9zblt4yZWwHQvIZqeCz7l00M4I7He04Kuj2/wJlosNbEPVKDpSGhyJTPQ04HoGxJPolm6Heo3
	iqf4KeAlBNKpHMygysbagcE2I5vUpSSUR9FiH37IfU2qOIBI6w+4ve02OtDTvWBCzhCM3ujP+hl
	1rPlQpR8ylWbs44fNhvftHRrcTfaCu3S3YP4KqikSZzwqBto1Um4El0yneVEoLXkGWqa7u2MwSF
	RElQEa8DIhNnst+9sTSEaIgl98RJ0zqujCG4iWUzzAy+ycB3xGvnxgP+7fmderjQn2a+nWOFG7P
	T/BxpzEbT1FtKI9fFpyAPD8qfcV7X5iGW9JSQ/ghlp2MBbPvJ1CZKM//blJUpETeg58H3mrDSiV
	yYY2KU1WucLjn1L4BxZ8M5hojIq0KFJ0PbDez1QiCgkOfNdy8UF5Ajk9MCc6SHjBoLs3wRzos/G
	WKr6+XXaxCSmyc8/5f2wtX6PClFc/198rPPZY/jUGbSccSD6fBvL8=
X-Received: by 2002:a05:6808:f13:b0:4fa:8d48:3a5a with SMTP id 5614622812f47-5683c9f0ab0mr1473563b6e.38.1794296724363;
        Mon, 09 Nov 2026 23:45:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:45:00 -0700
Subject: [PATCH v2 57/58] mtd: rawnand: cs553x: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-57-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata alive while MTD device references remain after module
removal unregisters the device. Disconnect before unmapping the
controller, and release the backing allocation at the final MTD put.

Check registration failures and release the corresponding controller
without leaving it in the registered-device array.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 46 ++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 0b872b1e3b04..7419308a740d 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -257,12 +257,18 @@ static const struct nand_controller_ops cs553x_nand_controller_ops = {
 	.attach_chip = cs553x_attach_chip,
 };
 
+static void cs553x_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct cs553x_nand_controller, chip));
+}
+
 static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 {
 	struct cs553x_nand_controller *controller;
 	int err = 0;
 	struct nand_chip *this;
 	struct mtd_info *new_mtd;
+	const char *name;
 
 	pr_notice("Probing CS553x NAND controller CS#%d at %sIO 0x%08lx\n",
 		  cs, mmio ? "MM" : "P", adr);
@@ -309,6 +315,13 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	err = nand_scan(this, 1);
 	if (err)
 		goto out_free;
+	name = new_mtd->name;
+	err = nand_set_release(this, cs553x_chip_release);
+	if (err) {
+		nand_cleanup(this);
+		goto out_free;
+	}
+	kfree(name);
 
 	controllers[cs] = controller;
 	goto out;
@@ -344,6 +357,7 @@ static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
 	int i;
+	int registered = 0;
 	uint64_t val;
 
 	/* If the CPU isn't a Geode GX or LX, abort */
@@ -374,14 +388,22 @@ static int __init cs553x_init(void)
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
@@ -392,25 +414,25 @@ static void __exit cs553x_cleanup(void)
 
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

