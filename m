Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296688;
	b=26ab+txUL4NsLZhyi58lI3mORNPUWzwKJ8+S8ljaP8QhTPWOqIC4YibpAZayBS69K/Wh
	 hSj/ryvRb4nxDiaeQh4P+wNhl/Q83EoUr6sNBDko6AUM5uLCwCteEMvTEQaxn/jlOJ8tN
	 8n9cz7j70hO/k4SpU3pWrAsGkCrsF7DBuJ8ayHU5Zx5mvThDCpvxD8yKqBU2+Tydv657V
	 IEZT7Ty+IC58hHreevZ+Lzg0lgTy1O8A+YX+1eq5dhHjoEzsiDGRFvbpqVo9B9SmGXD6y
	 faLV+pNd12yYC/azsWniEnP5EwF3d+G46SZfPt1+V62FHFjkjPp77x0k6xDn4/7tfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yGlHUg0UMoYr0Un/Fr2eiWkgM9WVt51jHWV32KTPv0Y=;
	b=ysKOElTZo5+wZqXEavUDeGj7hkohdqCIOsVeEG7nL0BiVETbaMOe2z0CwkSdZPszDZgQ
	 hutV2/wMYVeHfh72Y1eUvXEDDTjDjvYND7OR8CeO3SlUq4bhNjqIhsSKOp4E8SwxdtBMg
	 z9F+ZbZp2EwCEKwbejO8KdRGMqK6zTcYiXXJ7wBhpTrOWCsG7e5dUQzUwBN5NUUOfjjft
	 zWzEfedF+TSe2RYeWrIkCnQzlfLyBG+MwYHaG3r/a/miIK4GC9Je3IJla/slRqE8BSz5i
	 deSm4hZZHHdzCRilW959lIwjW042WNJEUvYnBOHar7TjjXvBpwXJBGXElJC+CGXDccA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxP4PsnL;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB22606A968
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB22606A968
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxP4PsnL
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4f55a53898cso800674b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296687; x=1794901487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGlHUg0UMoYr0Un/Fr2eiWkgM9WVt51jHWV32KTPv0Y=;
        b=bxP4PsnLvEs9Ogth3zlUFIsIRLx2E0G0mYDaNk2w0ZKVhAPtMe3Ez+bsIbRnJ+mwUA
         WMMyzg7Mqq7Gp/hCAxwOckn1jsuNxovpix7yAihBVTgksYYoSwHgOYeWqhj+z9w3TIlz
         WK3vbpz04YxAd5xjWb0CnRNcnb+p4QuxRUYA0JYQY9AS3Ho6qMMHBeH8uDuELjtetoJF
         sYwC6I3BWEA+M79JvYuuC4ThaeimFDEuZorQNRMd8y3cP533vdm+D3j9fypLK2aolWWm
         yLjhLZEm4hKEYDfQIRt9Lkxt9q0S+D1W1HGgV2A8fbFMtj02bNf5yui1/3cdRlqGkf64
         r8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296687; x=1794901487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGlHUg0UMoYr0Un/Fr2eiWkgM9WVt51jHWV32KTPv0Y=;
        b=FbKWoP6bx9yyCkmIpDI3v/KfmtfRd4e7/APDJ00JirfkkAZ3JkZ+AuD+pKX5cP4nZR
         ozrzBx9IEIN7p8eEqZhV6SgmdWayxM8ITvcbVNJvBkUj7nFbgSDL9n0A4B/MeAhK8tNA
         tJ3le1M7wqGUFvJvBsXNQFSxraK82ZY5/1F2nIT84CetXFMhSRcqAzKPESDpPQc328l7
         N1GcgYQjFNqmiC8A0tGjlws3aeVkNkHGIGpbHN21+i26a46FVSO3QUokZR8EZO8+ik0G
         IZLm3a6jjEr7n5+7R7DDDTF0j0Nv3KKXI+X8GBbhbkW71rE+gKKkt2373ot724x2p9TC
         nCFA==
X-Forwarded-Encrypted: i=1; AL+hErErS9huxo/y4LuLYqm2godlKQCZha4/odt0Ehch5jwrItCT1XscnC8rxGvHpRupYZKioQpQa3kiMJ/0xPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eP3R3ozsdnDhcBL6KnV0gNbFu3wNhsoNu9kywTR2yBEJ83crC
	SHWH8rBmMyzx5ufIHunwSPEHUoU1Zs/U2B/6XFciVwSm+dh3P2P7y/xtCZnCclY/
X-Gm-Gg: AYBFou364ccuYUohl6tT4vfPIrU3XMbtofKH7KGshtow0l00yUF/Xme/4gwmvKNcmI6
	rWedAWVF40HbpirHy2Xc8QeE7CdxESAbl6fboc0nH95PgGi/UdnUbNYxgZPTWweLR7fET+5MYIP
	xLsRZ8F6EKfo1cQSBb9XG+2BLiQVxEBZ/I1DUEjw1o74AqshmLsenF82IJoXOHAhVQJvMaqjfpc
	LT6Pr/ljm1jyOQP/C6MVpGJGezaFeURq7ddZD7+Kyd0XLURc/BlxnOK8BVv0iOdFj191/odsGdN
	TTZCwktzyBv4L1RJVdfvGwd+jjw/WTJJa2mf16OBtwijzzBiyYzxWvZqiSZx6Z951Bdfx2XVmUU
	7Hy7qN8UJicA3rroVI3H0cG2z5S8qZl3/4/aGJpOvNS1vlgfMYwiMSMiaBk6Ha6n4LVzqzQ3umV
	lNiNAnhpPBKIBCoex9tV+g15eCvhnNqyCLwwh/ETDpM8KkJHP35MshExbi+1Iy5sOM5e+dxZhxA
	rApkeS6qxef0gOIYMlHKfBCM3meSZfsNk+VU7qseJkrH1PA4vFoSqDnCLosAP8wCL/nHByMY4oU
	6Ld60EFcVl8C8ahdGebuHO1ni0M7p1vzVSpj8ZzpjWse86HSVXkMwdOCQ8WavKyZLbcg5QhynL4
	Z+UAB/BMUDeHy/snghhHJGRnKELuSTGwp+T+H5mFb97Qtu6g1up+W+csnXrs8p68s2gQM+pcrvd
	eLKc1+fVLK1kZ8rHHjmDcxn/oAvY5jgJjbWH2AEyPhEY6egWDpujOU8mdMlhOYmXecpHeZkgey
X-Received: by 2002:a05:6808:c3ea:b0:4f4:73a9:f831 with SMTP id 5614622812f47-5683ccd5f77mr1328903b6e.19.1794296686871;
        Mon, 09 Nov 2026 23:44:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:27 -0700
Subject: [PATCH v2 24/58] mtd: rawnand: xway: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-24-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded controller and chip across platform-device removal.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index af84395dc66e..1e330aa5d56b 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -8,6 +8,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include <lantiq_soc.h>
 
@@ -159,6 +160,11 @@ static const struct nand_controller_ops xway_nand_ops = {
 	.attach_chip = xway_attach_chip,
 };
 
+static void xway_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct xway_nand_data, controller));
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -171,10 +177,12 @@ static int xway_nand_probe(struct platform_device *pdev)
 	u32 cs_flag = 0;
 
 	/* Allocate memory for the device structure (and zero it) */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct xway_nand_data),
-			    GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, xway_nand_release);
+	if (err)
+		return err;
 
 	data->nandaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->nandaddr))
@@ -192,7 +200,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	nand_controller_init(&data->controller);
 	data->controller.ops = &xway_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -228,9 +235,16 @@ static int xway_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	err = nand_set_release(&data->chip, NULL);
+	if (err) {
 		nand_cleanup(&data->chip);
+		return err;
+	}
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+	}
 
 	return err;
 }
@@ -246,7 +260,8 @@ static void xway_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id xway_nand_match[] = {

-- 
2.53.0

