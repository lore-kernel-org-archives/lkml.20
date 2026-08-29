Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1741F2EEE83
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787977359; cv=none; b=sSQzvcfq99Xq7GmaSv7+TBpw0V+VME3YdVFlLWZVxF8CIx3BwrKrk0RxCyh3u9nkAdPJKI7o6v4O3XFfZEcjLnUgaEMNfX3GTXt2G3yM/EigljHJLbFAdSJhyTntEswuygVuBHbqa6KYoUNhxPximujNKw9fYujyHvWmvt0TUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787977359; c=relaxed/simple;
	bh=AwOUkUcDpHDo5ZDzj3i/viDVju6Fox7LlmZcp7Ebp+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hok3PFuJOpk6273UCdw/KJhVF9sLYNu7UhifCKuLAH/apH6ZsmBhgPfEpJobxGBUii9Au6FDjOGRPTT8W71kGuZvXlVwKfqFxpGjSkD9KMNG91urCZ9SmdUJvwDri3DhMCZ6uinpwrxUvix/z1qneELuwfBR2/v7+V0TRrF9mw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8M6Z849; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8M6Z849"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6d28aa26cso12624325ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787977357; x=1788582157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVZiLDeRwsupettcPIKD0pcIzIKNg0UVhzocRgCkSCA=;
        b=G8M6Z849XbvSWm0PmxKra7oVe4tWoR0vHtl7DHi2HlPE3e3uFPbPNb4X4M3e1tqUKV
         cfTHkGd6wm984qbguQJENlb+CeRJ43TiIkNpLOcBnkxPJsTWq5LZu2oA+BL0EfSlwZzS
         2blx+TNxwqusvGBBZU24lNOncnfesF/nu0HlYLl9WoSPmWdBfycvwpFxgRAvODBXOW7u
         dek0VNW3fbcQ1lK/jra/XSvkdQpmiVX5HiSEll16efjdu5RI9maLRvkcfisRjXyROttM
         iFUmppr7Z6mnfs0giQEWbY289yC7zrxty5Th7sQEhJRh04cd00i++NQeTxgnuxCUj0YH
         NXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787977357; x=1788582157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVZiLDeRwsupettcPIKD0pcIzIKNg0UVhzocRgCkSCA=;
        b=TsQ8m4xByd7sILn0/e4ZPnP7+gTkQT1PjQRtJ708DwsZdn0P1Y2iZ1OE+XIOm3Uzp5
         O1oL3rK7T1zVxjbeCNiE+zlKrgNUhXsexQGhZuLdmYoI0rCT9HJG83MUSsw2VlDboB9W
         Ai52NzKBp1yjxwSwXRhUvOe2YF6ekm4tLdbJXm1hjLBEhWr4yhO1tiZkkK9h7/5f1W28
         8/+CtvXJggQcr60dhZiJDn71ztHXmz+TDa+sZtDqmunr+VQ8F5+NIo0+vR3p2elJUe9M
         piJaYkJ2u7jhOM2U1yzDXrhgdR3yL2Samx3iFYEUA+1AVkxcukWtWfmtEp6sdVjrPrY1
         rwKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBoxcHpkZ+it7Pr+khyMJq2LE+P4ezs7yoBYfzTeoBKQ+xGI/hbYuPLNQENLGms02ldxjeMCpX++qNJOs=@vger.kernel.org
X-Gm-Message-State: AFuF++mIPHHLKe2KFgoOaqlKEiDmeq9F8T9iLHW6FCJAA0VO9QEDRmY1
	Y4GsY78vTen45bhMLPpZ4nUSCOySLvcauLIeHgx44UE7N1FyTp5Oguk=
X-Gm-Gg: AYBFou27RgB01f+HBHG7tqfBXZxk4cQhEqdClOUsoJ7DySFcCUoQ1DCHxZThuvLx+IC
	dSith1b3lfgxMcpwwMCZ2HReIs+fnXdHt/Oh6JaeW7EMdpAsf2jLOqgMJgnH+aVa/Kqmss7wzJS
	tmk85r4Q/xHgqrvTjiSm8sJ274i4zOd0zWCUcNX7u3gG5u2MUN6DRSu0rwac2fImwSrVVHdBzDY
	26lDoSglXFCnjzjTkBjmrvp5KNaBDt+mVt6ZPQrva+UtEQCO9ADOERIeOUHAUYjtpb6uZMW3/KS
	KTu8bz5NPVw21SYzSg/7ch2V8wW/GZKjq/IM9H2i2zzcTFLhnSRwp/hCq3mLabLfl7nxe5FU0F/
	KNU7jZi0f1ZXbe28QBiw1drUPWHqN3+ncXQPdFAUGe1qlS1k6LaYTqlX7ypS/PiXyXSjMDF5WkM
	Bqdw8sNQR+69X/rLnFOqZ2qoIBrQrS9xJnavA8mpFZmeUCOM+nEihWK/AxwNNfILe9irxT+RzoB
	w==
X-Received: by 2002:a17:903:1a30:b0:2d8:d4ce:9f32 with SMTP id d9443c01a7336-2d8d4cea3demr62880705ad.16.1787977357271;
        Fri, 28 Aug 2026 21:22:37 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([113.185.106.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598b98cbsm11139845ad.76.2026.08.28.21.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 21:22:36 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: andi.shyti@kernel.org
Cc: bence98@sch.bme.hu,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v3] i2c: cp2615: handle allocation failure
Date: Sat, 29 Aug 2026 11:22:07 +0700
Message-ID: <20260829042207.27323-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the result of kzalloc_obj() and return -ENOMEM
when the allocation fails instead of passing a NULL pointer
to the message initialization helpers, which would return -EINVAL.

Also separate kzalloc_obj() calls from variable declarations.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Clarify the commit message to describe the actual behavior change.
- Fix coding style regression
Changes in v3:
- Separate kzalloc_obj() calls from variable declarations.
---
 drivers/i2c/busses/i2c-cp2615.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index 951de6249834..62192e919744 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -124,10 +124,15 @@ static int cp2615_check_status(enum cp2615_i2c_status status)
 static int
 cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer *i2c_w)
 {
-	struct cp2615_iop_msg *msg = kzalloc_obj(*msg);
 	struct usb_device *usbdev = interface_to_usbdev(usbif);
-	int res = cp2615_init_i2c_msg(msg, i2c_w);
+	struct cp2615_iop_msg *msg;
+	int res;
+
+	msg = kzalloc_obj(*msg);
+	if (!msg)
+		return -ENOMEM;
 
+	res = cp2615_init_i2c_msg(msg, i2c_w);
 	if (!res)
 		res = usb_bulk_msg(usbdev, usb_sndbulkpipe(usbdev, IOP_EP_OUT),
 				   msg, ntohs(msg->length), NULL, 0);
@@ -171,11 +176,16 @@ cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
 /* Checks if the IOP is functional by querying the part's ID */
 static int cp2615_check_iop(struct usb_interface *usbif)
 {
-	struct cp2615_iop_msg *msg = kzalloc_obj(*msg);
-	struct cp2615_iop_accessory_info *info = (struct cp2615_iop_accessory_info *)&msg->data;
 	struct usb_device *usbdev = interface_to_usbdev(usbif);
-	int res = cp2615_init_iop_msg(msg, iop_GetAccessoryInfo, NULL, 0);
+	struct cp2615_iop_msg *msg;
+	struct cp2615_iop_accessory_info *info;
+	int res;
+
+	msg = kzalloc_obj(*msg);
+	if (!msg)
+		return -ENOMEM;
 
+	res = cp2615_init_iop_msg(msg, iop_GetAccessoryInfo, NULL, 0);
 	if (res)
 		goto out;
 
@@ -194,6 +204,7 @@ static int cp2615_check_iop(struct usb_interface *usbif)
 		goto out;
 	}
 
+	info = (struct cp2615_iop_accessory_info *)&msg->data;
 	switch (ntohs(info->part_id)) {
 	case PART_ID_A01:
 		dev_dbg(&usbif->dev, "Found A01 part. (WARNING: errata exists!)\n");
-- 
2.53.0

