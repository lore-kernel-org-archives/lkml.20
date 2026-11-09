Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187770;
	b=3M5nmVPqUv0bZaToFJm8+tasazZp9JgJjFY9QojtVwHetKXFjwOQIrmreIqAaUmkudyz
	 dTNZRzEwsXWe5Y+L1vc+p/dUo4RRJWCGTNd218SZa/he8kgQKaIpJwZ27yMJjo3jIl2vs
	 +TlE5hUujtcnYPW8V3gofiQ4JdudKvvtGq+XSUAsXbN9cSa/0fEn1ZrOmIZ2qnyTIvYrA
	 /oMiZoT5KscKt1A5Nun8lh318jO7KIq+nKUWdkjYeDHZFFq+IoIOsoByoZuWgalQ4jNrD
	 2NvtEey5SxUycK49v0xRdKD0CkwF+n+HSvidIxaSqOVXLVprDJWKCYFvQgmosSSeATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tHxPvkIQbIOFnf0PNycsyarZgqZPtDrXH02YRkVpewI=;
	b=sFZW8m1pAm5cmrk86l1vZ3bhMekxzOJHNrM2KRqFk53/siwMBwMDBnOPfaG9ac8Wn8+F
	 wy74VLOEyVz29P1b68fSObZMJzqDKt93KB8OQBnF9y3Xh0O/2uqCPMqnrHImpkk926jhZ
	 vMT+icvk75xtFRkN5sRo7Ch1rkcpGJpap/ryC41fDwvY5BE1I75YNBxLIwgXvrwOyIKGc
	 +0EzIz+irH/TT7BN00Dg7NWj2rOcC15U4yLtexYs++/jf71+QdyHAEZ/tGqOLakZNC95x
	 nNJc0t869+UUZWj40lWZbUQR1u0aLr6Fvtpjqr/P0UgRHbrgtQULz+LOhkzIKwaxxyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5lteWku;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC6F606A789
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC6F606A789
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5lteWku
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43bf9548df4so538726fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187769; x=1794792569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHxPvkIQbIOFnf0PNycsyarZgqZPtDrXH02YRkVpewI=;
        b=g5lteWkumMsr/8XsXavjTdQzmzgC5aS1al4O8shgS7/SYpYcLeGONud4P5rJGDkpfr
         KdiBiLgo/fmyLZC5XkGfvG97iRgJTnLeyJ+F8vzO9A0yQOcWQby81jFjQPE7ROv9xIQe
         scPpmdhIDTqyt3wB3TJFcyQ5QWA+GTK8yrPIP0xSfoGq6F51v4GmxRKxeRZjdohCAb8o
         ycDs/GlmiteaIr+YegKNB/dnMrXtyIKmQcoQDEkmOIgLCvF6sGyEY6lIO6uBg2Ce0rSU
         f/JfdZOhkgGG+FQG9eiFz4v+qfz9kRhnRy/d2D5W5+m1u6HOgq8ZsvVQgwIplFRXYT7D
         wgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187769; x=1794792569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHxPvkIQbIOFnf0PNycsyarZgqZPtDrXH02YRkVpewI=;
        b=ISTiTPML85eL9hD681hy3dgYcqDMSgskAnJA+UaAeEVHS2GoabDyBgei6WPP4LJCjr
         x7Vjfwfz1IoAoVvP5VPqQU9Z9UdZk3S/+2dW5/gm90nsH5f5xt5UpqbNV/Ha5fw94aCJ
         uVhi4/TFEQ7A6FrT02ulweLNFDmyqqoQ9+8/ryx4gsl/0gG/qRHPHYbqnxpo+6Vxws1O
         gOZOdlUvmSEVVl8cNgE8ZdtnZDDJpgdJk3G43A09gRBbluTrodDhw8kwR6FOtE0Tmdxb
         aF7uPgRZnjZf7p7kX+Es5JNiyUKPgxJmlHBSu2FAANCJZ0Su9DM73v33gXNN58z1+9Uy
         fy1w==
X-Forwarded-Encrypted: i=1; AL+hErHzyIEJlPrBHrP5bjc+clyD7vbBAu6kvu8EU57DREffdXKhwQeBaIiwjhWgBW3y879G1PDhsqLXSg9krW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YE2mQTEayG5i/p+RI9IG9dGswS8RJonpdCw5mWhNi9RIxPY/Z
	9GZ6Xqb5TfVmDp6jqGfRTuXz5AD1FMMT9e+SAwFoE5lTI7DQdya0vHKC
X-Gm-Gg: AYBFou3Z4+FGTuccM8h3g48GcQS/6PN7vORe7u0FmnmHegSU4d2TVFLtoawHViYXZ9F
	OcwhVfscboQGpzzjH4YVMcCPiKTJdvtJcEvq5H5gXc1+zYg4MQ7rJZES6ZbzNhomCJQHETV+Z9H
	r4FEvER9EHCt7hai+/u6GuOHv+aihHG9BLwKE+GRQGTNlp6rLjdYiCgkO1a41+DiG3iPe8jS1Z1
	7i6pkiWDmNlTuG6ZhtT61az1KwFs7L00cQT4XAwLBdkgRHWHhOxAeVmcqwZP90LDHJNXGaqBKOV
	AP/CrVG6ZBCuT4alO+T76L2nUYRuiC989Li20wd6nCG/t8M9+XjXT3pvbBJf4A//7getsjbBuDJ
	MbUtkjeSltN+BxuaPq6XhBsiWKBaqqJO8kJ4pUUyFqxZw497/M+GoGLM8KvoCShBbGzKud3xuU3
	pv0MeG6RwTIaGjjxZuSU4AmbWEodxt7fBMMc+I01xGCaoF2+UROkkJSKhJyEvIHmTqQvizxSLGi
	SMuayWk6LbRORHihhtSxYcKGALqEy8kl+4M9PTCeSDit3d4dhAG2bCpw/ThK1hdI3plQxL+4XzS
	FRddQpoeg3duhToFK681hqcNRVpEtrR/yQWVEtNXWKg+3kb82jzP7nfHzlwkOuczRAgDl/okRiA
	UcXVFT871pp5tdD4MUZOxVj/6awTYcLZH6sc8B2Rx19osWwsMYtlkHX7BAuDPnUHlFBJg3ejRok
	tXztVpD7cRixNuPPKPKTa1GLuSl8DGbblmrv8f3QvyhfVCfEpq+M4YYXw6W5J8M+u8n7AwdtuN3
	g==
X-Received: by 2002:a05:6808:538a:b0:4bc:cf33:7024 with SMTP id 5614622812f47-568143c75b4mr1962246b6e.42.1794187769024;
        Sun, 08 Nov 2026 17:29:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:21 -0700
Subject: [PATCH 2/4] mtd: rawnand: sm_common: avoid recursive locking when
 marking bad blocks
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
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-2-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

nand_block_markbad_lowlevel() holds the NAND chip and controller locks
when it invokes the legacy block_markbad callback. sm_block_markbad()
calls mtd_write_oob(), which re-enters nand_write_oob() and waits for the
same locks, deadlocking the bad-block marking operation.

Write the marker through the chip's OOB callback under the existing locks.
Keep the reset, target selection, write-protection check and page-cache
invalidation performed by the OOB write path, including the broken-xD
write-protection exception. Preserve the 0x0f marker and fill the rest of
the OOB with 0xff.

Use the OOB callback's return value directly. This also avoids comparing
an 8-byte OOB write on 256-byte-page cards against the 16-byte sector OOB
size and incorrectly reporting a successful write as an error.

Fixes: 5a0edb251ae9 ("mtd: nand: refactor chip->block_markbad interface")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sm_common.c | 44 ++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index a3a3a05cc5a4..a6387111d271 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -100,30 +100,38 @@ static const struct mtd_ooblayout_ops oob_sm_small_ops = {
 static int sm_block_markbad(struct nand_chip *chip, loff_t ofs)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct mtd_oob_ops ops = { };
-	struct sm_oob oob;
+	int chipnr = ofs >> chip->chip_shift;
+	int page = ofs >> chip->page_shift;
+	u8 status;
 	int ret;
 
-	memset(&oob, -1, SM_OOB_SIZE);
-	oob.block_status = 0x0F;
+	ret = nand_reset(chip, chipnr);
+	if (ret)
+		return ret;
 
-	/* As long as this function is called on erase block boundaries
-		it will work correctly for 256 byte nand */
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ops.ooboffs = 0;
-	ops.ooblen = mtd->oobsize;
-	ops.oobbuf = (void *)&oob;
-	ops.datbuf = NULL;
+	nand_select_target(chip, chipnr);
+	if (!(chip->options & NAND_BROKEN_XD) &&
+	    !chip->controller->controller_wp) {
+		ret = nand_status_op(chip, &status);
+		if (ret)
+			goto out;
+		if (!(status & NAND_STATUS_WP)) {
+			ret = -EROFS;
+			goto out;
+		}
+	}
 
+	if (page == chip->pagecache.page)
+		chip->pagecache.page = -1;
 
-	ret = mtd_write_oob(mtd, ofs, &ops);
-	if (ret < 0 || ops.oobretlen != SM_OOB_SIZE) {
-		pr_notice("sm_common: can't mark sector at %i as bad\n",
-			  (int)ofs);
-		return -EIO;
-	}
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
+	chip->oob_poi[chip->badblockpos] = 0x0f;
 
-	return 0;
+	/* The NAND core already holds the chip and controller locks. */
+	ret = chip->ecc.write_oob(chip, page & chip->pagemask);
+out:
+	nand_deselect_target(chip);
+	return ret;
 }
 
 static struct nand_flash_dev nand_smartmedia_flash_ids[] = {

-- 
2.53.0

