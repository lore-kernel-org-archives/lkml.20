Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446942;
	b=YrucapD1J5jsC1T8YSqfYjINS16l9ojgEspTgWwrptkF90DS6j6UvRJgA1BCGpS2zZTa
	 4Hp37Yz9rXjS+NxQzigKR1Msf9jVq5R/0k6avXSdOJowLfcDNKjlhdB7miEgxMdVWpeSj
	 MiT+H+WOBqIaD5MWJyV1Ts4xV+C/7hPoNHcf69jFuQ98yKlAbMWxcgWHtakSu0veLV8nR
	 WvOsW7hDxtiLkwzO55gKJNPFLZThhVvfsMvbPdryL6/zexhYVFsAvSB0yRHw+NUvrqUc8
	 6PUiJwFgVHtWuEom/BCBuFaQvWsOyOeLYxexLX58uWI/PjGUzxWa0/SnU1mV0FHRuhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
	b=2QtW7OkMJbfSzv9sgyvIjc6WrQOshu6ILL/dPTsQDKoZxZ0aCz83jC28/gPWhThJpeOa
	 U9BT3UfmDJ7NUoG7n+ef84jzD7+WJZNTRz3J12ICWgfWl6BSG/4slBxvoYAIp9j/VrGZQ
	 hhKvf9NPIC341Ynph2fGJdpT+jk937smdgm9nC5H8Wh9H1em7FB1b3eRj9to+48rZnY03
	 SDP4LTo/Gjxp2+645p5EUChAvn0eU3+ChJ0RbCldXxOeAazpJKLqKS5hIN8L8e4dabiIU
	 dU88CX/AGWa20kxIEIt3XlM/OrNe9gr1b79liTntu0lGYrscZgMjnNYW8baqeQtaSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ak3t5qkp;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8AB606C19A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8AB606C19A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ak3t5qkp
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so2384605fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446941; x=1795051741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=Ak3t5qkpNJHdCanWi4lJ7/2bQGUQUrsNIuMlfM32a2Z1FJJ+73hkZg7qEn7Ub0cBnw
         EqdPpC+PBUVKzhyKP0orPu+KEs8feN4+2ArOiMRt0W6Us4MoMX+4fJoeZAZg0LNSrs2y
         2NXL67rnsFVuTvhmWFb1U4noJ4h9Zb7CR4mABIY2dXfOdilyYp2NsVMtY3VJhxIgNLw8
         LQD/NxagOqBhTNDGBNSpi23vDzwrpARXMMXmXwlz2pk7mfiF7Xg/3MvQwCLFiGm4KuxG
         +PKdU/whgZyYoQyRXiJ/ie46T9uKwDH1Ch0dIPnBcbkAW0wubAlj3Mhuj6HKenRgnxi7
         Psrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446941; x=1795051741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBBIqqST/B4LGwd5lYgXNpMhb7oFrQCuuXyfivmYnWg=;
        b=c9uP9H5u9/fRZO+FtkrvMkTy8xYpoKQsB2YUq6h+2gNgcPKHMh38PH+4/QZPpnngu6
         TpEX5sdAXBMNBN+1vt7o6CxE6yEeqJ+sAdyritD6inlDBcYDUshQ9y7VFlkbuGfJ8L0V
         QngQ2Mbe/uTyecLBCAv1dsF3BBP4khFpsGN9BzPaUhyt28oyyL+2eQopGJ81w75PjzA9
         0jeXdGreuS1rvLvAiKzlyMxFwdu4P2oLtS28Qx/6dxGuUxD7kOAk1OnKcBCGswinuKNI
         xFxOZJqxH3CNmmrWL+nm4WAxVOm+0YCf8sOsheMwDU71S0trGD2OqjfybwX7fBgs8fES
         JRaQ==
X-Forwarded-Encrypted: i=1; AL+hErH6PxmQX/S/hAQmqOypAzv/6FJtbMPRt62oPS1W2sqeWpydrShiPR/cbABjZtnYOjJ8iPRSRd6TXHjVQUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UKjLLO8O4CTofFEErRPydNu0Mr+nlDLQemW6z0ASYH+GhXKEH
	ewR/xU1dPJcfYtD6h9M2YVLFJtNiIkWMq0n2gnDArwWvGxBJbxqMadIn
X-Gm-Gg: AYBFou2d2yzvr3E5CSYeo97+5Okbxw8hyKIEq00flqijfKjQIn5WkfqRJnU3pEDDm35
	eiDYGIytT1qpmm97JQlGtyK30pX7goFq+Vx7yTMuXhkJml5nOz4BNBSPJVOc6VpV4Kftc32MWn6
	tcXvChY+mpSczRc87ncIT0h/R1+FrjmLNgmhFR8Q6p4OscK2jOezmxOZ67QhGuqQW93saw30eaL
	ym//4gQpLj0dLS0cntMQ2dnugZGithROtwMIQ1QJZLK0Pc8vry2E+Fo7x9duTm4sUkc/06j+U9V
	pigpxCcF5n8VErSH36oPf8Trd9xBqLrCnTOCLr8nPHHT9TVTXh7OGFU4KemkqXLhGGHWqefnYGv
	9LpYCTdASLR+h5MzP5ZTmkL/rxEyTau9EOreFAi7Bg1cncpoRFx5iYw+0JEWBczcSeeAhl9dVW3
	//RDAKvjsZl576lndZ59bsddSr2NcuFqKlVM4nuiDAmIM5FxIvrdcFaCDQNrvjkOz+xC3Pk981K
	sGZd1jW0ENivV/tkBe1Po3kRlA2XwIv6bR4wW8H/Jc4+Bup8MUHgN6psbw9XB59O8DrJohYx33D
	FsprvkLem9CDEDA5AX3hA3iQCSHjf7m71tFmPv0hk1PQw2XRVtMomBvSiN2EMtSJw/xCmKMmrao
	VB2lR8C8i8RRn7unWkTNG8taFC0YIAjtKh/CFTO44+6yLJbH/NbbLDK0IvmCkrILkFlosZCI97p
	eUQEzJZ7DHPJbaaZ3MAc2qr2m9B10Ovvw1pjLtDkTQDOkGZ7hswLjvCA==
X-Received: by 2002:a05:6808:318e:b0:4cb:f21c:a794 with SMTP id 5614622812f47-56b95b7b26cmr3796157b6e.28.1794446940953;
        Wed, 11 Nov 2026 17:29:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:08 -0700
Subject: [PATCH v3 29/58] mtd: rawnand: ma35d1: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-29-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Shan-Chun Hung <schung@nuvoton.com>, 
 Jacky Huang <ychuang3@nuvoton.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unlink each chip before dropping its initial lifetime reference.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Shan-Chun Hung <schung@nuvoton.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../mtd/nand/raw/nuvoton-ma35d1-nand-controller.c  | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
index 23db2f4fefbb..9d89263ac09c 100644
--- a/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
+++ b/drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c
@@ -866,8 +866,7 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		return -EINVAL;
 	}
 
-	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
-			       GFP_KERNEL);
+	nvtnand = kzalloc(struct_size(nvtnand, sels, nsels), GFP_KERNEL);
 	if (!nvtnand)
 		return -ENOMEM;
 
@@ -876,17 +875,19 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 		ret = of_property_read_u32_index(np, "reg", i, &cs);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= MA35_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nand->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		nvtnand->sels[i] = cs;
@@ -899,23 +900,33 @@ static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
 	nand_set_controller_data(chip, nand);
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	mtd_set_ooblayout(mtd, &ma35_ooblayout_ops);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, container_of(chip, struct ma35_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nvtnand->node, &nand->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nvtnand);
+	return ret;
 }
 
 static void ma35_chips_cleanup(struct ma35_nand_info *nand)
@@ -928,8 +939,9 @@ static void ma35_chips_cleanup(struct ma35_nand_info *nand)
 		chip = &nvtnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&nvtnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -953,11 +965,13 @@ static int ma35_nand_probe(struct platform_device *pdev)
 	struct ma35_nand_info *nand;
 	int ret = 0;
 
-	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
-	nand_controller_init(&nand->controller);
+	ret = devm_nand_controller_init(&pdev->dev, &nand->controller, nand);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nand->chips);
 	nand->controller.ops = &ma35_nfc_ops;
 

-- 
2.53.0

