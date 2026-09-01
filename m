Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F038D415
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276242; cv=none; b=j/gxdiEO+dxV6Z0Y4ZHe/FFKTyT2K8dyZs5hMT0+3Hra/kqkg+Djx1SzmLgmfbRCZHOQQVpzdtvp+82hUfjurFHOyE4S00QkevFblr6Y/8n0gPpwGo7ncRbh69qW/SGN1eS/rbF88/2fAXS7vKGTOZJ7P9Wp5V7Bij14IbFzWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276242; c=relaxed/simple;
	bh=R3J7SqC7fHCmGp67WqxxTHHLBefiBq7BVcaPvaEvpd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHErdCGk7sPzohK9Q+K16UVK87DZOCg7gZBH4q98sSh7QGw1fR5L0ss038MOUUuJVOkeDHW4lbDNaryR7xWyb6BpFyqo4IfeGeNwy9GGiOFy13Hc04D5PwSzM2XhbGKQVDpGN5yTi575K2S+61ufG+56q38K+6DedLqqDG6Bhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wjs2XlEl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wjs2XlEl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc891373e0so45118305ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788276239; x=1788881039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDQ/gaRAZ3HKhb9H+2sGnvihrzB7ojkgVvH0+sfX66k=;
        b=Wjs2XlEleyQ1tFn6ujSzoBcwG5HWpkW11gnX7sqcwCNHoSFUPeYBDQjWGpVfFaSj7k
         0JApffFBqFb1LN1NdiBC98/xIx9zeRV36Y4k0p5/Z6q9UXQQQngYweXFn1+T28+HkTa1
         3xgB2ccIIiWP5hyFl8K8xqNV7Sc/l8n1UUPUV5v9TKEDmos1WWZ/Gp0KN5U8aqFiF20+
         OmHxDUe4oDoMJu83Yg1cjE0jBYsC9F+CaYnRYliuiI2o+BIRmUk5Jn46HgAe1w103ejz
         eKOSBFMwwZVYxEnAkD93XEQ7Lv2Vk+PBwS9XEzhEAavKOohUt34xtB8FEMFQo2+Cm4AI
         ciCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276239; x=1788881039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDQ/gaRAZ3HKhb9H+2sGnvihrzB7ojkgVvH0+sfX66k=;
        b=o92tXVQLPR7LGnrOpyPYapsAXUn17TcO6cItzHRFT11qK5NXJpD9ahfEErFqQm0BL8
         PQGfjxRd6Q05K4k9EbG6Twdq0NKYIFYHXUvSQXby/lWfjl90TbsoljUtbzJ49FULeB6q
         YCG0fUzruBh+3YwgS7W9Ph0NQhtIACQEKsreINBZw4aBIDC5I8zEHXdiIF2MzWFc6WAm
         v0KEjPAl6yHCD6FU6Z8lQVVs4p/viVMsKuX551p8VFsvdY3Syn6fFILN+MPOjdSOOT8j
         I8NsnLP6NGnvQRow+2m+tR0/lGHOP6uHeuTOGJ2o5WKosB9uPNLYH5sj5wKc2WxbIbSQ
         09xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMeONNmzKyvRPVlgYsqV7OUzTr0hagXImvuX68ICsAVPSGvGhKLdjeFAXIs3+uNvbBRj1KN+uNdtk2fyw=@vger.kernel.org
X-Gm-Message-State: AFuF++kap3hbb66VBdm+EAQk6Inm3Uh2AP8uem6t7qmw1Tcu8a+WZB0m
	VVYAqcrFtrqyGcjt2mLFqqbxrvE+1MODF3pgWuKUJHSLyRPMDg/obvU7
X-Gm-Gg: AYBFou37ZY+7Uuoc+HSqREfwCid73kAhc2ZFvIVXI7y2/spcckDF9YpB41eBDKmEHGD
	WVEtcRkrmigKmPoOlkxP+xGV50HwukPfSZePhm3ZxzUFaFYy3auMfxuQc2e7Pql7foCV3vq4Lka
	ZXJPCy+SU2FmgCLM0Bo009KHBrQbeH5i0IoL+Ekm6HJ4XPlKPn8L8XDuk5qh3F9jUhZH1J66BDA
	H2hol6Wvdobp43t960Uwxx4RV1zIItpK1xCbhYOg7BlKbPvDlA59+zSX2N02/+7Rw9/cer4qafR
	9Shh1mfcp1No6LObZOu6XX6ZytJOH9IS4wQOMQ0RDj3Vx5ZpJM6JjfFxO/NjJ2RGrveTpFt/f8v
	R/je2g6BW7YT4DhubSWiCnsPqR6rq5dBpNkslLqRsiQax2lHmy7orzOUuyEQWXl8Pk0K+gh12qj
	JspGq+PGaAEBM+ljoWYfnpMbxJLAqCZB8diFo2NvYNqpcHowjvmg1Ga4z4uEz7s912+oYAFauQu
	aebxj8a
X-Received: by 2002:a17:902:f549:b0:2d3:6fac:d67c with SMTP id d9443c01a7336-2d74dde1b5cmr436910015ad.10.1788276239275;
        Tue, 01 Sep 2026 08:23:59 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:b0da:acd8:9bc9:d346])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd386eefsm736365ad.28.2026.09.01.08.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:23:58 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: core: fix slab-use-after-free in i2c_adapter_depth()
Date: Tue,  1 Sep 2026 22:23:53 +0700
Message-ID: <20260901152353.104578-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_adapter_depth() walks adapter->dev.parent assuming every
ancestor in the chain stays alive as long as the adapter does. That
is only true while each ancestor stays registered: device_add()
pins dev->parent, but device_del() unpins it regardless of whether
the child device's own memory is still kept alive by someone else.

This breaks for a USB-backed i2c adapter (e.g. radio-usb-si4713)
parented to its usb_device. If the host controller is unbound while
a userspace fd for the adapter is still open, the adapter's own
reference keeps the leaf usb_device alive, but that usb_device's
device_del() has already dropped its pin on its own parent (the
root hub), which then gets freed. A later i2c_transfer() walks into
that freed root hub and KASAN reports a use-after-free read.

Fix it by stopping the walk as soon as we reach a device that is no
longer registered, instead of trusting the rest of the chain.

Reported-by: syzbot+450abcfc7906fe1a1e16@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=450abcfc7906fe1a1e16
Signed-off-by: ThangNN99 <ngocthang2710.1999@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index fb25704219c7..8c64a27eef5f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1240,7 +1240,12 @@ unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
 	unsigned int depth = 0;
 	struct device *parent;
 
-	for (parent = adapter->dev.parent; parent; parent = parent->parent)
+	/* An unregistered device may already be freed; stop there. */
+	if (!device_is_registered(&adapter->dev))
+		return depth;
+
+	for (parent = adapter->dev.parent; parent && device_is_registered(parent);
+	     parent = parent->parent)
 		if (parent->type == &i2c_adapter_type)
 			depth++;
 
-- 
2.43.0

base-commit: 786262be6048deab760f68c8acc2c85607165894
