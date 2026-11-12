Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446972;
	b=KKGhw1SOSb8KsNCN/cXUA2h0wb9W87OsFeWUVpd0SbSBCsdAWL7I+hkztwvR50/I2nFk
	 QwOvM44xl0ODqS2OFmYB7QtBKZRytL2LjChcLBO6qwqwFjwYmi5oUgC5HgSIdvbl6/LUG
	 cyM0m0HsDhaXKfRkZYMqM8rl2TWGcKAMGuRnwpXEVkqX3yo9CIpeHi6vlxovwpgFCREIB
	 f5BHwI0dALIMTd8bnSkmEcV7Wu7u0rDLOiEuKPH5bTuYcUjBDg/8MaB32A+BwMCLh5weA
	 Btj/8WQ3y3F31Ya1dlj+4hW5BP6L7AhnrcvHT6qUFPM4mat2p2KpGZ3qJ2qA6o37mJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
	b=UO+LV765YR6jUX7m/V+ooi0UtD4jPCJGIyyMETTK/mLRg90x1R7oWWa6T6RgJebDkc0N
	 iZsKgob8JuOGoBGsmysYxmvWNbgtzC03mIqWU/4sHhJ1g+N1cOtHqTeVVnRe2IUBM4VWH
	 XRVY1Vk4pKf4InpXvBs3zmiMVtKuAuISc3RTgGQIBrVumHozrKIU1h3wxZoXSCTsVOvep
	 OxJItt6Nh45EORFyDluUbBXRgIZQOaH3vgVYLqpYe3T+5i9BJl420327A6eVX7pcFTfXx
	 zG7VWhLs5ke67YrpgtcMCF7mKxa0bXibkDkN4tlP68Kxme9Ulqj8IXgnoNHDM9hGOJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgfGuEHf;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172E6070DD8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1172E6070DD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgfGuEHf
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-843b6f8e2c7so3946218a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446971; x=1795051771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=DgfGuEHfy/sLI2iYIl928gs9AeqxaNAuGzKr8oGYABsIjKX0uPOYCJKKUcXiHRRfCs
         SjVXwJpUuo4huq7Zfu+zjR7WUQ5hZx2n7BymWUQp5eNsI1naokXio2SiRcZfiPirnAxk
         h1UKGrR+RN7Io3+fx1EkfRtp0+vKn266JzUuoWPSAOACDoIY1r5bCkaskOagpUZE1VGc
         Vb+2ox3w/a6A4NZeaMsQ78VLx/1YYZ183b479Le4TOcVlsVAnk5Y30ow7HUuSejf2q18
         YlDd+oEb/pYO2gdjJ7rqFY8ZD7RiVvIZ9FQesKCEycCtl0OxJCPuIflXJ6TOmZ/Hp/Lw
         9VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446971; x=1795051771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=VS0vYXRKJmGyMQ4UWdWGMcNj7r3So1K/6TIWnm0IIoTz2C9OCLlTkT7ycfaxsHN/zT
         N20xGSltU93cLIPt1tCrjxS7sRKRsycfsQm/y3qiDH4YhG7pIdnLJKe2vaxtjtJBOMMi
         MxysyqgMAhS/ITeGflwvaf2Ovh2vFDhulxniCD2T/nnpXj3UYzEqQNLYbwdbZDSqZdub
         t2723H+K3AU/d04QpQM7gmziK+hI3bUJ6j6w0b7gHDNdNqQ+KrdDNGGOYYBnptnUQkC1
         My8Eurs3DNPqaRotaWE6Le+H8GPJAi06nNIlRArfIdj6047WHhEkmy188HDTCx3j4N04
         idTA==
X-Forwarded-Encrypted: i=1; AL+hErEIvnsGz8hsWyKx33QfjZx/mw5J/1CjzbvChEOaKsKwCgXTwqp23v7pUb0oBEJztMm7cvTMIAHy/2L9NPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jp3oZKLJ0Vlm11Kn7FUAgdZ3Epos9EM5QRaMAs/YPernRfO0p
	+zeoyJXHdw0wLkQLUGXrvFVLbnCZxTLBKhsKHVvwP32hFxh0+jLRmRNb
X-Gm-Gg: AYBFou1L7z9DR8l4awJAPUpQr27dGJAuQvWyIzft3HaIvaza4OWSQ6rvAZO6SGX5vlc
	qtYtMTTWHOlhUZ0XUcbKvqkf0qussVBjh+uwZlEpjRKvwMb5Sxbiybbcr3fDa3aOTUZPN/Hop3u
	FbwinqfV14bhHUyD9Wm5UrlKytrLLKaX6mBh0vTmgnnwr6+TI/+m3HushhVChQPsNw141NBJE/d
	6Rhw8B/W+4zuNfdpku6PxJ/+gxEazn/aBxCWsA0EsCxujLSfvIg4ZZUsgnYASXH6eW9VBgo8LId
	42kfr3WDgGTvkJv4I83MHlNi/iBGBjmVC8tFWSz3QrNlrJxBv0kUmQUKYxZhTpPpCyR8fm+Qzz3
	F5MJBVHjgc69rD1FcfWl7zN9n5Ui18N8Kg4QAE5tUn4SHI3nql2qwQRn8R1xF56wnqRffx3pKbL
	wy+qWNSSVDM7teZ+RLSSu51AVWI6iIg1gvZ3tqRnaTIda6jDGuijGiQ4VojqJrpSloooag02wUq
	IXs4RYlKTg4Su2IJM2DyX9c8tFbf7neoWGWwMtyescjr1EcJK6fuDJ4wI+meXjGPVqYBpuw1Zb3
	ihpGpF7NHWwdsfdBGAoTpe6bh3lV7+QDNgq0k9PZkeV4JthP1ysSUfGL9SiuCQk57fd4LMa0dWL
	kSOFwHboIe3qi2OBiVTuvC2sHeSvxLiFqKp2vXgOle9zETnwQk4AFw7OneHHk+WSEniFrIQpCzJ
	F40ku/m01muGDsl2J5haGQ70KWk8gXIIEVGW+bn21RHVOtrak+642h
X-Received: by 2002:a05:6808:15aa:b0:4e8:e73e:e945 with SMTP id 5614622812f47-56b9872af1dmr4381563b6e.63.1794446970972;
        Wed, 11 Nov 2026 17:29:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:36 -0700
Subject: [PATCH v3 57/58] mtd: rawnand: cs553x: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-57-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

