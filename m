Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16339374721
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103272; cv=none; b=FByp9ZFtOEnSffthIFe1t+Jwary2bkAcL//EokGtrKxJdVlukhoH3BAsULoAJyXQDw2rfutowJdweRXas19si98IPTAgzkBjNw5diBzK31YpH5YtWg59Ek8/bzAC7awd9wZithUrLvSJW4Jhmi5ifcWjRwJNpwlCce1CITTcJKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103272; c=relaxed/simple;
	bh=rJMZO0VgIuzF0WSOhbe5gXe0SOTu6iu5Wck6NzeudBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqeW0bDQ8cljIRy29nEc/VPTMsRZH4/bWpKKVUHS/ALXm/fDoWi2H+BRlcCyCJWa39TbBRTFJ59kmSg54OuuYVTjJZf4I9s+fatk8Ruwdh4KIo+u9275/JYVOTW16pcctJpLLOB8WQ6rqLsIi6Nihrb0tQ1vEgiByawmKFnf3JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiZYd55l; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiZYd55l"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so41136085e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792103269; x=1792708069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTeoZs89HS3SYDzrwek7OhSrNhRzVN8YqVYgGwhyqS8=;
        b=OiZYd55lnatYBbBgD1Z9zGlbHLfRJ5u7tp9fELOlmpoV1cDEI0t88/3FNNX/Q7ZVXc
         cYtS9Q7+WSjFKFHoZNXOQKyTBrKPBigPMULVGvU2WoKaNuWfw+UWeaMBV83nnB29cuJ3
         mIN7S70N5SlHNet1HId28dt2M4XxS0yzk8m/BABuJzAim249Sy6+pwqA0pf1xA5yZyvR
         P6/YZhzlthbjrrDDIRBwBrTYiCxLAsm2LBf5LjjjPPCZY7DsuXvmrACkWugN8jXcTFH0
         UBartaDyIJFIe/Jt2DHjPxSklG2Rrci5yepNkShDqvjUjxEzVKdCU8x5J1Fp65RWvSiS
         FdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103269; x=1792708069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTeoZs89HS3SYDzrwek7OhSrNhRzVN8YqVYgGwhyqS8=;
        b=GXdxOxTWTs4up1wEPtyU3VjXiR+F0GDvmV1J9YVXU1CP+OzTPlFquyXBb5jMQ3IaIF
         jZ0R6Q9LMPXWaIozDiTLz/2mP8vxX7A048DMPwdaieNDZoRAokSeKCWuyFqG0sYcGpqu
         dc5mAIBP2kBsvZ6ISy8h/RpFmFsauZGpOjwgX9JIs5+pTUqpyozLpEijIwpd4jmhT771
         B0NhniASwqWT6C/M2n6H7crloyEIT96CiiSgUXhZeDX4dJHjV1nCRQT+oSR5HPO6P0h9
         hPQ6vYigbo5IlvUHiUDpcRjVDlYsuprwhtBaWw6SCiKLnfWx2lA7yZPyc//Nio6dAwFU
         Weug==
X-Forwarded-Encrypted: i=1; AKwUvByOrGbXgV1Szyt95v79DD1C/wXuGhciH91GqlEogKr118OhVmqtiqorEPuN6sFeu2lKQhLJ5zXQl2ikXEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBg/EPZoRapRQhIAJ2S9XVcMQ3sWBqxvAXvbURaBuPgoFP2BL9
	6neJLLMkAfD1Ft/CNDQ1uTtAzuUAP0OxtOxLS6OWfyIIGrAicjVXBlBS
X-Gm-Gg: AYBFou12Aot3LvT6+faVuj/xRW+2HrHEDld9XmJGXX7P+A1PTCSergh0N0TcZma0fbT
	/aISL3fsDAS0/6/y1i3dMCfr/VZjcbf954dmuwxYPUMFBCDY/5lOHMlzWl3IIHHyzzLl1C//99k
	81Hy5BgyE7wybPLx/wX8QArT3VgYZt2m8sVP44MMt/IhPKz07a+it4mwwaZ7NHKrXegFD3SeTMH
	iJyftZObU82PGpJ2OcKjDfuUFB7v4dF2Nftl31H5UV5QEWziW0bxCm0OS87rkYVm5Xd4kHDnuGy
	9DqoB6lIrNigw8fnHCjpejIf3p2+YNjlYocISNEr3fLsIYhO+Fy8Nff5wQpfgNgzXUaq2o/W2VH
	KPWzy0giEgFx7+wB+/7XsI9YxUGsg5XjpNvlOT6HEy56YZ/blX/eaIsFZMh0UcFWJPvQNJs7ICz
	uAvOito0mWuTUVO1vuCIKqocEYD9XK1o+JyDNNh2VEcEUbA8ddmH4/9Lahd2v1ORpKG7972ijeA
	wv+a//6WkG8tegQTwscg9Yu6bvT6nvN+ebZ+NBnHBDF33mbTHgn0uiH+6WuTxT4zdVF2qq6Qvfu
	6ZFfO80tjUuk7mnTnotfxtIxla6VKgGvGaynirSzmoq0aZgZrnr+x6JnhXvQdrU/8vtcuiZiIQ=
	=
X-Received: by 2002:a05:600c:3f06:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a18e4a3bfbmr435955355e9.8.1792103269119;
        Thu, 15 Oct 2026 15:27:49 -0700 (PDT)
Received: from localhost.localdomain ([102.88.166.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ac19c9sm5917375e9.0.2026.10.15.15.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:27:48 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: greybus: add blank lines after struct definitions in gbphy.h
Date: Thu, 15 Oct 2026 23:27:35 +0100
Message-ID: <20261015222735.89251-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank lines between the structure definitions and the
to_gbphy_dev() and to_gbphy_driver() macros to improve
readability. This fixes the following checkpatch warning:

CHECK: Please use a blank line after function/struct/union/enum
declarations

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/greybus/gbphy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..1de510499480 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,6 +15,7 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
+
 #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
@@ -43,6 +44,7 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
+
 #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
-- 
2.43.0

