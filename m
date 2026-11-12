Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446965;
	b=3cHMQm7xwMVIr/sBzFrYWOYs7xdIs3I6fiIuNhYfJDZ5PXXIpiqakBSMaTzHVcBealKJ
	 zWGha1jmT2FE1Zr3oj+fHlFr5W3Ei2KWgnCs7Gamo9cJjUa5o58zsDjumyWE2vbdASwFX
	 bIxcUfMYJwdWijiSaGWc5zxkCwr9TDj6sLhQoszhfRRuLs8qM/Qhx4g5DinFngVHL1ywi
	 A+BN9q4awl/Ijj7aGQ8rEp3Wi3sOIyq5N+dzP9Mo2qBfLXa6K5kHyM0QPgnFLugt9uInZ
	 X7kQbcEPsPU+V/Y9EFuEJzFyphNE5Yp+AWhatm/1D8YUP56P5FlGrWWzwuMn1q/ZiVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
	b=pb6uRJgGVUbpKSzP5VTyMiZRRysyFyQyYGmRI05VaMxIG8NZ/6fo/r0SGDJZC/TGib8U
	 2fOEGqvu2pKj835uc5zvsTOWr8BntwXvtTZeWWRUGM9ikGKU2V6XIz0E/D6G7ucA/Px//
	 AdMVFFYMWe3+dT5UAyM2VpnhtvTb2+RG6xPQYN3Rf34xqfCRt35JbXAEx2Wdhm8tZAzP1
	 rx3yi3yvAEltH15X9lMbNhCyZP51VZoNf6cXEXevpVhE+B25PHh70WkuZnn//bCLEaaz7
	 CUuAuTX57ZCJg3ll2nDz0HFpx7jlRwX+K64VEsfRMnGv7ZWOo25QNz9Gb+VhamLBeog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKTtXJi6;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB560725CD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADB560725CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKTtXJi6
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84d5e56f876so2488031a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446964; x=1795051764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=HKTtXJi6nVX3D+v+TZ5yISMxMSPJkk64JxOLB6pjnqNUVo/miApjXxGmC/6iS0zFC9
         2uLL7nOrBOI2X2l+CeqpgG4R5R5L/8tBKT/ebNTkYoSrsYKw2wC/LSzhtBhsZCJEboAr
         sCMUGMOhKTAr7WqHOGJpNaO444N6VUdtE0WtPlBYsap3SboazKVzTIHx16qJAIaX0tRY
         HJDaI2PDQyIFmFCv9uipvm/jo6WQ1ibGSyCIwQFTQUBMjLIXGJU7LsTbmKkVNJ4emjzH
         0prSvAzITuf1aECJDjTIpu3fYQIbQciWb3QHTRql8k3Q1/36f6xa5RbllZbic3RuVBet
         KOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446964; x=1795051764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHK5IlRceC0uwPwNH8P6BMu8ODgdw/BdFt3DrIJLXE=;
        b=Zorur0MngfDiGueUQzV9fGvBFGA50P11wGWqB9aH82ktOMeJzLDG4CY/5H4CLJjw37
         kLCPCrKm2qg5l+i7NIUtbBEOiHUFE5HEg8jVr1fqOGNfNZ9fZyVLxiX3KAR751aRbp65
         XlxNgP5irEx261OSM9lKq1EZKtOAmD+0SoonpLN7Oss3HxC3EFF6MTbPSMbywrlVAsPn
         +Nt4RomaifhwRB8Kp+2136E12mxxfKm8O1/gwcr37Wl31nhPBdOYxgdWpgPzDwwFJK5D
         eyFEpGI+Gp2TTbGXZ0LAmUnArLgfgY/Jb0B3w3isgVBuRwCdhj4iOvHpUHNMBx+UeAAl
         aVtg==
X-Forwarded-Encrypted: i=1; AL+hErG4ZSoCLWWX8vWz5fW5w2XZHHjkQqc65ikufnzIKcufTViysV+SGOy3kG1EY86GAZPA9BJwGtR6/NU6eeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4kEvJuKQcFmlLNt7hOxpKO1fTk6GL3qBHtl5xZKYcsczI727b
	ZTaDLu/wzukBd3k8Rq8bPSip8Z6rFZrfwPOlfFRw2od1opBRcInT4iaJ
X-Gm-Gg: AYBFou15Yq6VQCb6z72AO8IvwhvRWutyF9fk8rvyKtKj/FE3IAIxn1A07TyCewsPC/v
	ShSYwbS60J/A2oUtPv33suVeUBZw9/vTXdCxf2JUxcimn8xA+vYAW8//kHbtiKHh1zvS0YUbVK8
	46HuUJAa0bv/ihKtxXKTMuJ8BgDHZQNUvCP79fwLDb4Kl4Wb5bTBXjyRaTjCDI8T3NRvZp9Ax6K
	Tt6oMVzNbO1JNqlBw96gsmHAk/fES5M44Enkk6TsIPNXkVFYZG9ystJtqdkOXJQ9ZkQuCO7jY4R
	ZQH8nLVn26aJIGmp1VF3oMfXUiuZafi/v4QdftuMdzPFc+5f/qb/3Cz412trCyDkLKpd3gNNcwH
	p7F8vh91PQ6+bQ18iA6wQCWqYHUfP1vJ4zuiiPbtIM0K5OV9qgdELIhqQj8qkc+39IkhoEGixOd
	DITZbKixOEs753Hz0G4g3BWGaj8IHkbLHJ4/NPgoaj4a5ZbqdJfAYEtSwcXX3mFnYeALu5m2eYX
	9FkTy9DoCHN/rsbjlA5FxTQCHDcrUQvZ/lsBJLrAqUIliqQh26Whxm1ZhzxLOJvxe7TckuaJsSo
	7z+WWp8MCwhHKyvTaE0FPi4DH5VTDAWNVdu7IXNjKLhxpSuCJE3FWtmyxU8iCybU3a0oVYggawF
	A36P2YeUjHFzMz5Pedc7GRZtwtR7FiZmFA5QrDUKdqxr5CVQwtSahUKgzpjYgkMYyVkEBeJG91F
	yOoHODVv9JHKAdK3Na9oaWxKY4iYMZi9j2bmQFBi8+dnRLx/22yuOj
X-Received: by 2002:a05:6808:5198:b0:4f4:9314:af39 with SMTP id 5614622812f47-56b96bd3b81mr3330935b6e.28.1794446964497;
        Wed, 11 Nov 2026 17:29:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:30 -0700
Subject: [PATCH v3 51/58] mtd: rawnand: mpc5121: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-51-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: bb315f749f8c ("mtd: nand: Add MPC5121 NAND Flash Controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 0aeeb6327472..42e167e1db7e 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -636,6 +636,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, prv);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +651,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +784,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_lifetime(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +817,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0

