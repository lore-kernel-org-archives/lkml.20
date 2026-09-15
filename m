Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB6531353C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434419; cv=none; b=SAGPKqW/gAndJ1MQrmxN+Lb2rIPe2VMQwRHMBvptivhOuFVAOeUvTRb4fMAZSR2X7gPBxVWTnnH+cWZ/rPluM/Vn+mwEsJUx7XyXO0iw/yWbUEG6Hv44IKpKnFspMltakmNfRoNHx/qtQkaTr6VOgFLXdvio0AIxCTT7JqKHo7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434419; c=relaxed/simple;
	bh=ar5w2bICKs61a2oJgBZNjiCTwG1evAr0pHP0ww9A13o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bEnYl6BleHEUss9jddvDHsMAKRI8lcOUgcaf+TXI9SgsbCDb3cQ4kIIoQtBxG2JPecNq5xCMVV4ri27753r8cgBaan+KxH4N+nK9HopYmEr1+G808uEhWrilk3MlYQudPa26M5L4e9gtg7eSrJvwC6Ie4L1SS5ToLEbsJpRJqx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlYwXN5h; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlYwXN5h"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76bcb09so32876651cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434415; x=1790039215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0NSuQEoXQJcg9ajYYVwURRCgxkdaWdgI2zUIGcducQ=;
        b=KlYwXN5h/ueuJCe0W/L1xI4Mg1RVzDLxQc9Au3r0JszeA04SZ9QAGTUX++V0Etqz//
         jmjW7kKou9dZD/ERsaWnFtCZhQ+YPVOtAPqlpTu7hK1FoDPYDFKUPMUNOTTvKCfFTYk4
         NOI2/8NAX59gxy96JlYq8QkPh01fkuCrJKTQYCbbUbqZbpSsff+tJPunfXq7CqGm3Wkz
         d5h/BEvq1ogOnBeqXUQ5hoN8vmQhh7W7Xu/yo5L+uusQVES7OFeCa8vi1aLfGzxaCcJs
         j1Bdx4thdTD2oBo/ubHiCqvzuFQOkJ32qhONLY8yxSCbyB8nFI9NLUnQJYQdOZzUtRxz
         uMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434415; x=1790039215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0NSuQEoXQJcg9ajYYVwURRCgxkdaWdgI2zUIGcducQ=;
        b=HxWZXbeb/YF2dftyNpDSIt/WQShv5vK296LrR+6KlSTuLh3hIf+sEuH6PlbH28WX8w
         xOWScUrLJKpBSM3Hp2W0qivi0tvKH6gPeWTREWYJ/Av6lXkLINQQmoeBzfqD5k9ZfCxg
         XH9SeQIhD7kGyNWZgJ4bn7qdpOIeL0PAHleZbmnis8uXw774hy41eHPRn6eknCeOQ68b
         FJJ9P9LOTXvNB1IlhdOQkFHll8tiDWl7EuG+ByhfWx7TvkCMBxwWBWbjJAKdpt943i1Q
         qG+tfJWleerZMaWB8sKDQm9QsVeYnbODwQnPczzCVZxhi12BtCXhv7ytXHGN8RxD3KpW
         BXvA==
X-Forwarded-Encrypted: i=1; AKwUvByAfZsv/YH0Wmjl36ajrCzxGgA1bZ0LIy4v6oA611iWKsw+R7lw5vxIOKPatSc8Ugo7kEY0F/XodCwXS9U=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Fu5xp85kmP9V/sLc2qH5EMnxVlNAYVIUHklpGMWy7rWc0MGG
	ByrSo3lTLB7DNoCYWPGM3TD7s/VIUpYBq/LOq70gtyWMxXMI4fBc4Gg=
X-Gm-Gg: AYBFou0iChJkRFPo73qUad2LioI22FbuXGvQJkw/AaNeTIkqSa+Xuaz4DVlIr5guEoZ
	3QZqk+u2KFoZ2tp8LjObxFmTIlAVFLKWKfmW05qnrd+1vZ51spUe/YgoZpYwa7rkusTuZhJZ7zk
	cA4L2u5jghiimTWUgmyTHHeVGurUoPMaOkfZ5zn8l+wYMJBCLt2VGyvbPDX2IOTvRBMJ6EJLbWy
	hqROCpEcw8nvqpELM2/dGl7zq1aUn1eQRT5+XtFFBcvjcoEf7CYTXRVZUAkLBxmECc6EWBvicZo
	LSj7ja2MMpC2wVykegVnI/KKr/Ivr/y/AIoc5dD3zIzd9hhZ6TR0V9gsqyz/1uchQGmdAwGgbt9
	4sOanvfB4ZNEJdxYt59LDe1K4psoTXAXxW06u53KzFgHvcWDVgTI3VRM39MjR8lTXxvhFxpEGff
	158RWvh3UV+DYVUNnWdTmpghSasR21RHsmL1R0P0dPni9D0CzAMuLVWT0thfhgA6CvsdH2LtuFB
	ZlvjPAYz133vHhIcLIl2oUQFF+4lSOrxzxUx1rRzfgaKR+t4XH6BwJajhazFmx+5HZstIA5qBnL
	+CS3rwrUVCUroOo0HRY4APMc5dmVfl/nwXjMxYIDudtOYjIbe4aXEhbnKNcLDeJEunFoB/4exjK
	atdW0
X-Received: by 2002:a05:622a:4c8:b0:530:8853:1be5 with SMTP id d75a77b69052e-5310cf0d3fbmr79307801cf.10.1789434415206;
        Mon, 14 Sep 2026 18:06:55 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a5e5sm108327076d6.19.2026.09.14.18.06.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:06:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: maps: pci: balance PCI enable on cleanup
Date: Mon, 14 Sep 2026 21:06:47 -0400
Message-ID: <20260915010647.54099-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtd_pci_probe() leaves the PCI device enabled on later probe failure and
mtd_pci_remove() does not disable it either. Use pcim_enable_device() to
release the enable reference after the existing map and region cleanup.

The imbalance is already present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mtd/maps/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -250,7 +250,7 @@
 	struct mtd_info *mtd = NULL;
 	int err;
 
-	err = pci_enable_device(dev);
+	err = pcim_enable_device(dev);
 	if (err)
 		goto out;
 
