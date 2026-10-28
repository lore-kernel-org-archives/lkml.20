Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180648;
	b=2M8X01O3imv3/BN/XkH8wmGcOUnMt947GI1YDKh12WOip7ny1rA8x4lKQOEFL4/U02/X
	 Uukfil2i8xHRNTuetBZ89QiXtaBWGGrs64PoQ4yUYP0S6a8b4ECtlT7ARfrRdpkp8WeN/
	 C1z1q84bFcE8li5dYtfvjPv/ZJaybHR14TUDkIZzBlulrRc+VeLK+MeA/2Wu5fBvaKbpN
	 QgJjsxo9tIVLPC5iX3vBHDzsRtqVGiTPQDZzj5g0UmaNJsh5zGaY2m5k+YRsni2VWwC9Z
	 kE7gXk9Pr0kL5Kkj5MvWTtYeZuSE5aCrGSkmNP+ztHwvb45bxqXzz2Xh1usM6cE3BYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BZ1KJWzBPUbk3tJbiYcox2qZA+SWKs+VXWNl/tiELj0=;
	b=jHCCPy9RAxYW0dGnA1+NgisTz5Q5WnU/1NNTEoHzH1uvRstoFT+ScgGO2GLDtHKUVNoF
	 V5DUiVv33oNvAgyC69F3oEe38JiHVuKv6sOjRYA81hi+5HNuXNgvBlcNu7td44pcjLKJR
	 oihVptJGhK6Ac8cXyogjBfDUno8eRw3hyWLd5tJXG8ziX7mjVekjtNL0CCO2sJYXLNcz2
	 8hzqNO3NrgG5iK2p/nLtAABxu1+RryVT5ISHeGdk7/7B+W0zk870zsHFzguweuji4ihKt
	 Jo09oAyj/ryhWXARpeYhgCZIKRntJJLE+yN4DZ8GvQU7n9k9Ze8n5FwVI1R6pd4jkhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=spPX3Bi7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24096606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24096606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=spPX3Bi7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso6233865e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180645; x=1793785445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZ1KJWzBPUbk3tJbiYcox2qZA+SWKs+VXWNl/tiELj0=;
        b=spPX3Bi7M/os/ds1fp8JLng6eheaRNH8fXJpLWEfAjhGc1oif1TENPL4+UvlTFVlzL
         PlAr6mtQqNQC5/zhH1SHA9BsGy8lGc0hZRXLhe4JJZ1qdjIBIgM2mbd9IWDm7Nknr1DS
         lSTKWGNsc8Y9+FVgIgO8d9qDIz3HI3hv679pDNkw5FOW4rPlNG6VCU0862qiUSpi43NK
         Txbj8jmXnx9v9WPf/6hLVck/52lTEJN6IC/sGrkmBzz6mIznwi+6S8uHHPL3CECBKU7c
         /eeEOnCExBCFKNLSdNDCY+J4pUdgJ3y7HbpwhfKa++sZ7cTV2CCfwbzqjd5bhnimZTux
         75mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180645; x=1793785445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZ1KJWzBPUbk3tJbiYcox2qZA+SWKs+VXWNl/tiELj0=;
        b=ohahrVOYpVdqENozsSyM9bWKoVA7yeFEwNRphBJkIviZxquL7CTasLN4z4X3UBYu9z
         UVBy5LhrakyXkhNldOAUqK4IDx0hqgam2KR46jQUL71JILZJ8bPtyCWPFE4GBQA2dMti
         kb3HvARSIprwXHCD3qkPiu1jItOd7NS+8RKMXuSDOxc+EWC5vPeHqZy8YxRHPLiZilCO
         P3jU0ewWWm/IEOzM5R2yLvY0Xcwp5mdjJPCjYbutJRfFu1YSlE1TV6oaivyf6jFSv69G
         lkO7YZQexu6/iBLzSMKzWJjFgGB4KBuPxz9q0kKCmAoWuHV7ioSMafxRWbe6TT+rkWD1
         kjuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQHF3TyZGDb6ZBJVDNlHf3VHtRRznYRlQL+11Hm4A+xtGGu3hT1mck3KtuPUlNDZVtwy8ukCqkKU0+RWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpP0zG1hDFbe/uL1HwVEGICdnX/CPzmSpoelMgLNFYCnfV0Ulv
	bRjXy63ZxDHAT4redZd2pkuiPyR3HoEEn7OOUO8/hO5DGSzYj3BmFe5K
X-Gm-Gg: AYBFou2VSn5cBOGkXyu/N3PMwWZlCDnwY8byNqiz49LvCdT5FkksM2roNc4mABfb8VA
	gErV95ZfopuuajTCW8wIOIZ8Xsymmjd15CK5vkksSKuRsC/rXtCLHHO7Ho9zWYuG82UtXP7Emqe
	V9T00RRAvqbCOUbDn5fhcu/0d2/PkCyDxEzk3UCLigi05f2e+1EQz0pctYntxfhw86f20VQUgZT
	CfA1HEh9A49y0RKLjn3YUBOlIbPKzD6jIyfcPMW603w06MBbfMH3NnvE4S1FCH2Q1DnIir8Ozyc
	OuUherm/DosvIpDhS8lvtceuY/VnPNmCx/0c0VaZDrMh5wZMN/wv5OxuEjN33QHm7HbPxW4tjYZ
	Da81V/PUX8KJV6fsaS14mY4SmWeT+aKeS+tNK54Ty6Ngjcbyxnm7fIH2WFiRnHFSjftBOaOr3z2
	PReHn4uC3zmuQz0sR2uw11cbwvZI37JJHnbKn0lvwP1lyuPRhZtuoDJ6pzkqq7CFhH1+3MJ1Utj
	aMohgrJj4Au9mmUICn96rNtDx8xoaFHtAa2Mh2AJsimz+scCVIrS05bjvtfBGNNiX6gNCbVPoEC
	SXAdZXzoZ0dqB0hHGGqEGEr0+1tj+rQR0k27EeqT0jPAde6nUsq8JB0zwuzq
X-Received: by 2002:a05:600c:37c3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a96701830cmr35730755e9.25.1793180645227;
        Wed, 28 Oct 2026 02:44:05 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97bf5d6besm31962265e9.4.2026.10.28.02.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:44:04 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH] staging: iio: addac: adt7316: clean up and sort headers
Date: Wed, 28 Oct 2026 12:43:07 +0300
Message-ID: <20261028094308.27811-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused header files and
add linux/pm.h and linux/string.h and
sort the remaining include directives alphabetically.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..e30d978fea56 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,22 +5,20 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0


