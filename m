Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446943;
	b=eMVWje3Uu7flbS/BzysmF1SYOcAblsRml/l1l/t9BP+j2NbxmAm3NM5fJcASx/NOY7K9
	 ZXU8wooi+gZFIy6Av8DPZMb+Vg7mRWbN+xS5ICUrndmqtbQCn1y4x10/EbV+Eyu9x8a3b
	 KU4/4fM2GwfCjaSEAvuEYVHoP517lVmYlAo1+VQW1evu/c/xZ5MsGu91vdh+cJEBJv0Ue
	 L+P+py6mvbkY+tGclOUGHKEEoPtU+j/JYD7YUkAkYDnpKaqPNs+/rAR71qaCDKAeDelUq
	 TTGX3nxPrj1OfGvTvdLC+7hZ+jKRN+J9lEvd/FVV/p6Zqbwe+qVwxU6/761yAssVwow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
	b=ZsQCjXhjFxm2Ma0+V+ubVC7UpYk4em3T0DKq/YaOUzJs2bPXbKetd8bgMCBJ0B7+jURf
	 RDvfYpEWx+ZEs+wR8UJIpCfg8F3+Di/znw7JmfLs8AuzKlEDmJFLXFaIGq2HzC6GBiHbX
	 s1tOzSZsT+9yH342GYJQjLPXDUkB8hUyi3oQlUwzwRnY0pKsX8H/rKJHs4CieofrfvC0f
	 vmJFRZ1W34jy4rdAqfaP4z+1djhPnGX3EI6N73hB/7UpJuSVevUwwy7gQKdDgyuyYtSnI
	 UNXKqTPAVKU3MM8jvCB2QvSH6pK+IVjWWr9k3/lD07YpFu2tq+RhgSJp6WDL7xzJKhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJCZg4GQ;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44C606C1AB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A44C606C1AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJCZg4GQ
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4d7034a99a9so2225876b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446942; x=1795051742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=IJCZg4GQygPnbNKzcYmkmAEuT4CFEtZD10l1A+B1wo9W1zvCcpcE5Z0LhfQ+Zi9ZZE
         03aNUsj7O16drmYF3S5fWg4jP2mnwSotOHzsF75Man7VgXyRb3pWL5A4VoryQNwaUHLd
         nSABtAX5Mmbd0hvpvIf2Eb2JvrYP0fzH0dY6w4IYC0I1CaTX9Y2ZOBJMEX26MxFkrWvm
         8O5iHL3GWUFu2SAPDJJaEtVRM50O91waJ4C+QCd8LQ5Ftk5ktyKU6SZ2sGJFqqEIvIzw
         pLDQlVj9ByvVepdXlgYCOvIMk2V1WOsqxCsazjiiX3TNIHWcZ3zHrCOJ5VRYvnso5yFm
         /rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446942; x=1795051742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUF+yT0AtjJjyJAPAQ/XnxMMvvBmRCaUT+DgkHs882I=;
        b=WiA7cxAWdkSAvjvOmtSgsmsA4Fi8gcE73gC9OhxvXKEwBAuYjPHWk5XlbyjM18Yi1Q
         hgLgkeyE1jbvsPk6+SuwJuB/lmrP56c/LgXVK4k6ybxWmQ8Y1gSX2gI/FwQaY6v2958Y
         Kz9rP1tVkKQLDih9VfW134odiz9WSf4X+NdQ0fQkzjNfyTZAFV/kXkmpdaB7LOlMTqir
         haQcRHNzi6jYiTmLHRKbdNuycbUpPsju37X8Fg+8ecFZghW1H7K720Z7BU/ncZTlaR02
         J8YSrSZ9L8lzbxE19wKCjhbK022dFdQ4SoNmi/POyHZdW50W9AsEELsjeylHl+84bu0w
         1HAg==
X-Forwarded-Encrypted: i=1; AL+hErEksZJ0LlsaakJvYFkONrb0pY2ufsVVmYfV+P9JnpZT5X5PJaw0cKGFsoL8F5rNSjBsJ5nD41qXmXCgWck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pierruMZiJ95y9NyR7DMdSRTbQ1u8XbQLie2TIdE/96fh5aLd
	XPlk5P4uBcOfXyrh6SA0za+vnstqp3aMy8VpUmOaIPyWDcQwJnzk8xVT
X-Gm-Gg: AYBFou3LyakKd+VjUlrgRqfwlNqMwKABUtlAA6ns/qE4147p8/CTxUlAnSxfelZwGpH
	rwtDPr4j5CNweOpv8dXLONBKlybSG42smXg9UfepMv3DQRd1tRvV3pC/4hRHazVtJm3QHwFjxNj
	NIDITmw8uK0HcO1p+yHKI5Q32LWBXf9dCgrZYVtZXu5gZd3zLYQD8XsSxDlsnHyOjuu1p55SH/5
	juxWC3YzK8g+q+gRV13wB9feVKNg9Pa4oow2QZUmYkz4qsw8oP1zwXbFgELMtILJefH09pMd7cz
	WXkaJhQekzLJU7zqnVG2q6cYFUMSeLMVzPA7okPeLrFQFke91d1r91NipBBmfQuHkNFPHW9hopn
	UQqPTKCfL8l8InY0BVpBkYPpBfK46d2y7KpYvFw3vIhiD6i7ow14OzGDJ0yfwHSrPCLtjVq2Szz
	qFVWIcT6WzicKB9wKmg5rh1NwW3EHrz/FcnHs9K1g/0dqKUVPVcZc36xrpdFnpFq/3YeIyyNDna
	imw+mQKl/ToLOU5XTYVO+e2EAiNcAk0ypjU85kKXqDYVVeedCf3VK0MW6mxSVr2JXNlvO/JTiQq
	d1I8F/52WEHTBySiV3/erjWnM43Em+MYgCau1OJC0m41ckVsYdvM0TUYDbYv6lAKhvmZ8icv93Q
	NKj9PCoOSo+oJICxEg/dpZ060ylB4xH9HagnyCqSSn/BEFoG4h7AxeKYpGuBuNkDSMSXnR1WtFw
	hLirzAJFqEdO/1Em2DtmvP7GU6hNyAUZwMqZP4QYjIkIkGET6CLsun7RA1Ax42QZ9rZt4Y5l17y
	Q==
X-Received: by 2002:a05:6808:6614:b0:4d6:90d3:e189 with SMTP id 5614622812f47-56b97e1f3f3mr3600497b6e.50.1794446942113;
        Wed, 11 Nov 2026 17:29:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:09 -0700
Subject: [PATCH v3 30/58] mtd: rawnand: pl35x: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-30-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind chip ownership on registration failures as well as removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 36 ++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 537387014e2a..e5d86d72faf3 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1057,22 +1057,24 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	struct mtd_info *mtd;
 	int cs, ret;
 
-	plnand = devm_kzalloc(nfc->dev, sizeof(*plnand), GFP_KERNEL);
+	plnand = kzalloc_obj(*plnand);
 	if (!plnand)
 		return -ENOMEM;
 
 	ret = of_property_read_u32(np, "reg", &cs);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (cs >= PL35X_NAND_MAX_CS) {
 		dev_err(nfc->dev, "Wrong CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	plnand->cs = cs;
@@ -1089,23 +1091,34 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
 		if (!mtd->name) {
 			dev_err(nfc->dev, "Failed to allocate mtd->name\n");
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free_chip;
 		}
 	}
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, plnand);
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
 
 	list_add_tail(&plnand->node, &nfc->chips);
 
 	return ret;
+
+free_chip:
+	kfree(plnand);
+	return ret;
 }
 
 static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
@@ -1118,8 +1131,9 @@ static void pl35x_nand_chips_cleanup(struct pl35x_nandc *nfc)
 		chip = &plnand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&plnand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1153,12 +1167,14 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	struct pl35x_nandc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0

