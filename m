Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810655;
	b=kUDAXkrcYog8KVMhuGwf+MENnjirs85L1kYxXDgA0UbAM+KLRNL5rOLx5c2riWH4KYdw
	 u0MedGCXqWInVu3uk59XXEzwKt8Frfv7PykEF0Zkj9HYgFAzqJkv2ULLoFUOF6LzBJLzM
	 rpsmsAqq/2S81heB3BmhGheEM2EAVIeqr5kuhxXGSMVDBBKW2vnH1HXnE5hX7s8bsgFZI
	 Ttzw58XCKmYezRzTq7CaqfpOeVFfqTaFxTKlijjbYJY11oIMYAJNZFUYV1TZVJtfBw17p
	 hwpZBqg4Y/X6PIDkfChGT4KKBZ8rYW6tlrKZUyftspsk2liwkAdzpf+RbiuN3HKk2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
	b=1Vs6G25zyjZHxloAQeRUCRG5jXYNXiKBjYgDG++mubGQmCO0hWUkVXFXUFWcIn3A1WOq
	 ThxoywgtwYjt5TqzOwInTGgzR4YJJq6th9J9OButDHI0QtrxldsMOroYMtEuZ6FlEZtc6
	 gvoWcQC7Bed19ApnVS142vB2mx95xpJJ+mjKbq/gpnEebZhBVQpXj8t5f9PnwvEjTQU0x
	 ztOobWHZ+BtTTEzoQQ7ppaDZYEI/FMUzxObvB6mekQs24RbnmS6Dd6FykhYk5V3Oh8gS4
	 7lAdYCrDQog0A9jIm1paqf4xPnodEssyEgXAoJjldQsg3nBJPtE8kcUqI4Dg3pS/oJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXq6hZfV;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE68606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE68606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXq6hZfV
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b19e291cc6so3903240eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810654; x=1795415454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=YXq6hZfVLcNu88Heha3UfJkCTSbJ+i/YELMF7Mr9+k9+fIzu889O8MYXyhL4RSSHiO
         x07rsKv09WfGcH/q7QdX18rS1qCpNsk3GlwmBWE17kUeHmNswtZQ944PVT5WN8ldHThm
         ZL+dsijtb/4feIMXfZCqEvZb7cUCV/RXoOu4dx82t8fKTx8iaGnkQT57Fo2SlPGVYA12
         S9+hGhMAjiJ41NUPqhvGg2U/VdVfCNl2mfUOspOGzjPKA8APz2uVlVtU3a6cMHbezBvx
         R4ZL73/ACJdu830vZXDrhZ4VNPkbO3pXPW74bkiPcvhIBCFHo2KOph1hGP7yZsP48yoE
         TXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810654; x=1795415454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/Nci4ktbTPxprvc8HZEEfP8HI+RCw3HClXWoZFfOg=;
        b=iBu3TDD0w558baW+qwV43e2SMWGEqddSd2jvyUzdwZuSvqRuXzN7NmwpJgSXIr8FaM
         kfP5DnrBDBcyuahJMq7XxOZvNqwMSICyFqtdSazIzK1EP9rpJpMgs+3Y0kSjbw9YBfh3
         LVfiXmGND8PWQ1ZdFXmTnk4sp/rPs6Z3VvoCUI5xqlBTv0GHSsNP9aDwTrGI/4mU2TzU
         xvbu6y6u83SUV5xbU66Ro1Q2ReXMNnZTmP6m4pUtAEbRA3YhD0MiD8MXqUZ11PZj0a7r
         J+idQ6S0KL4X4pmiSBWUP2l/5DTcx2ez0zceTf6Pf+1uLI45T9gWY6590hXbheA8h/2I
         8O/w==
X-Forwarded-Encrypted: i=1; AL+hErGaqvVbdX+ahMLr7mUlhw45vxO7xFBIZTaMx2DUO8hv+dS+nxAARdztzPN5AqzylfeIkiLQt9bht+8tS2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZHKQpPow9hwVsIbHWx0GDvs6vqVW2nWCTtLPqWAEIO4Y4no53
	8rYQuEKpG5shFuFtCEHJFHKV9zEYEQn0wn6dulN3y1jJoxATsTJY4n9o
X-Gm-Gg: AYBFou2Y2o7ml5XE2hidlwlfcKeH7hKKbWY/VfE1P8NAgPe7gn4890IMvKMzKFuxKUJ
	yJkk+5hFovejL9dL8suXsAFvrGkFBhyNI9SLtMdJdhae54u41ya+EW/jUGScTuULf+k+nNrFm1R
	RTOjUZt4TBhFU3FIi7pRqU3YiaWWsZWmzR6Xvfk4Wmwj9858UcP6UGREN2pn5oM2KjjiuER9+XD
	2BOgrnQQxWImIHso+SLjcUQOjue9W2jLtv0PX1wUCOkdifs46gwTvVRzdW+zNos0fSBge7qfJpn
	yAD42El8sDmUlIKYLTVIAh7x3wOZC8OGyYhogo1rJf0jXON421q6azIgwg6hLRu+RTH3dUvwfnq
	gndS+h/ITfUK7AxSIkCVA/1SHvq7zCvmdgzNXpQZiUn4GziT92mBKA0mfbMMNAmcgTtBb4yrua3
	ezsR9jcE49oUxMvRDUlK40dLjl9/s8OF0S028X1y2RWvTcLapEQCfUe0DiBq+3WMdZgQhAiBcGK
	aU1HcAWcdM/g/VuqfBN7i4T0Hh5MZCExDGrr39YJGO2vWC+OklMIiY4Q7iN2X3NzK/5PJqg+1SP
	zmP/H9KMFsGwgJ9UjwGcdW3ur/PY6PlFr5uLX6HOk5NiNUji6cG5kJv6TYwZB1TZdU5SR05g+Ju
	puOJ8dlg8nTnGKP0NJLYfCXLHsDQavtHIRY/OKfxK5q2VMEpfnVkMzAhwqf35AanDbQi5gVtaMQ
	ZFpsNQydxZimJscsK0jquGshb4ruhfAQ6PFMnDm3JdFJO+YlSPmeM=
X-Received: by 2002:a05:6820:607:b0:71a:f0dc:ed6 with SMTP id 006d021491bc7-71af0dc11f1mr1538395eaf.5.1794810654136;
        Sun, 15 Nov 2026 22:30:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:12 -0700
Subject: [PATCH v5 57/58] mtd: rawnand: cs553x: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-57-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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

