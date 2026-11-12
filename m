Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446962;
	b=ZLiiAoSrTSYpVG9zxzZztyMWaLVkR+SyGLFqEzmP5380Vy/WHq46S8oakN/53RqWefS6
	 OCsO166hoxhU+6A30m00NXFQU6g8MSA2ZNjgoU8WgtF4RbQDazsDyQhQslPLRHWhs5OHl
	 pwr4ywkMUjKlZW+46Zg0+/c55U3DiqXd6zZC4+FiWReTVc4kvcKO95vofW1ASAK/0Z9j2
	 WNLJglKMzk1wrCXuP24ISKBUPm6gGOU15GgkMNsS7jzI2LznTH3Bja4Yw6+XDCGpNKOLg
	 Id/neXn0CJh+n/4ND6w7j3SBuxjfCjXa8ONkMmp2RDSO+VJRBxrCqlftCAPEhGAgWJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
	b=xwibACliqTbD+By/Y+l7xmrFttK7PGCIkdapJZs0Udbzekw1prUBwsfvYJRw+4l0pH1S
	 XKzEcggldEUi2MjcRtzOp1vjHXexWPSaelNN2g40SI8rOHAIYYDpdzP5a1Fh+drrz4bsR
	 iAzTbIU1wofZv9ByxRNCd2DmCgti0pqRuYrL5JOIwMB2oZ9V98gpHseGSvIo0MAGKA4Bc
	 DnfPhXjv3/xjZ6P5pn5tkra0Pwu1ia3hLlH/883n/idJcipVs/09mMVJpJU08WG9NZHqv
	 HV/7V9qr8L4To3R2Qz7oRBrYb8fTww5db5FYl/QYz4B1xsmiKkIdU+XRWvzP2GSOxbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxrHMfpA;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43F6071AC4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C43F6071AC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vxrHMfpA
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-55e0090c580so1223231b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446961; x=1795051761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=vxrHMfpAib4Qs5hiXvMb8JT283hpidooeUt7FpJxG87gtZompAYza8u1I9sFmpYDZ3
         f5uMEVMoM5wqlnJuUY7KK5wckb+fvm4mtoJDGHlXuaWdjjyaV9RtgCmuIrr3z24U5afK
         JtELpkefdOQlnR3//nhBd/Myl7AAzWeXdYEB/DYGnETvlRhHTS/e+Ti5zJMnBF4REMs8
         xjYsGTLKxqQKUcrk+XpyeRiJHfr6kdAOU2iQ7+ZnHvn8w71e8++vnIMJDl4hAC0MVDWs
         SYznWC/9phwtMIKp0Oekglh2rTjkMgZ/cj9kf+NTCpsK6vE/dHWWrlwjVo85bFsp7uLN
         Jb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446961; x=1795051761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRb7R7UHhmIYomhPb3QhYlKJ5o5OZJVwCHgeMsn6oQs=;
        b=mhCxzlziMRiUYttbjSq62EKhCcO8yxwzKSh2EZEKrfTaHVhQ5hglz40yMsfAV251tG
         UDA/pZNZyHtddyHG1o3aaCDG/uLNI1hLkqZ2CBfNY1VKFf4eTpLJhfch9Yt+gHfz03X+
         QZip8eUQSgODAuP0rPZvFSptxulu3XpKBCbRGsWQEYEqpTOm2C9cyGEOfxtd4NiAjEei
         Vxd5LEeUJZPVuMM1moWEKB9BzBWUcwA7A7bk6YUkTbbgPP+TzPTxHmjzYQsyhbl8Uf81
         4VdKcWkMKRJyBMGIazNPv5RLmVD5a1NDSqA9Fv2M7rK1vSHmx6HEHkhCC6xFFxi+0LUY
         rOvw==
X-Forwarded-Encrypted: i=1; AL+hErFsvP0BP1v5cSjMK5ye330hovD0+q/4K/BxXx8Ke6mokYZNact8WHsLIXJsC6oUbHjEsnBq5AYu3oOWBFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6x/bOgke/wr0nvAUrlAPJUfyftKKTWcfqHxsXtUQ5FFawMGit
	WVIKbzKIThzhDZrUzrEqxCZQo3i06YC/MT4qMH/AVP4mhj4ddaguhw9YwN9MwRvP
X-Gm-Gg: AYBFou2vGaoLguWSprPLAF662GOM4lQW23ELWNAj9Xvcz6yN3xjcht31m2WGKZ3ecn8
	3m4ny3EIZrGLhbyibCuF84nfrl59Ps5BUTHBNkbpV+0BxfUqOBbHOJJjTFDg0r6xsjYp9CUlRnU
	wlvae6Tcwy1wVf+YAhNBb/rYejGbi86D5ESdk2/WofvWG4rOI+P4jbQ/krHFldiVW7Snz4knAtw
	vNiBENw5AxXi2ZEbq5StnsX9MXkjm9q3Q6IBUmj+dOlR/r6W31DfLHomode94iuB9I47/ruqZkd
	kFRDU1zjTVheM2t5KCW8KhO+o3kyouPAXrfAbY+2VTb005ntR9bPEZBcyh+/mUis/d0PH59r4ik
	1n9SVtGDWyga1Op8/mMrJ0lMCHSCubjQEL7pc/HdICFKolLjNodmZ1iCd+vbXagw2uqkymBLVXh
	8i96Daexyg9McqhavCq3lgwjWMMPSkhs5TqFeHU7dGOKTTutjqWtwqWREv0WToNzJbamTMPpoXY
	EfTL4HcPtOzj0jXkNEjaDFGWLcvDXWQS6MGfelac2+9bW1+QOeDI63xXWNQZ7rAswyn770LbDFp
	w62e9KyL3DWvq/jz0z7N/ofJC5bktvEVHTmrbWtReYPiG6bGb7aHSktEQiH90pbaViNWnIj8tmL
	XlVwuOejrqzSgcxrBXZW2HjqToDnKkrZHGw8dLSZJfGDxylxf7rvIiOwDTNB8GJ5qUzGQHJLEv+
	MgFY2q93pUuNXu6/2MkbHr0N3WymS1xjtEj/ZvHGtSm4M1ts/1D+8A
X-Received: by 2002:a05:6808:1645:b0:550:de67:2631 with SMTP id 5614622812f47-56b98032003mr3795721b6e.63.1794446961186;
        Wed, 11 Nov 2026 17:29:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:27 -0700
Subject: [PATCH v3 48/58] mtd: rawnand: ndfc: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-48-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index ce10fc6a41aa..27ab5c034e70 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,7 +171,16 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
@@ -187,11 +194,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +209,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +254,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0

