Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941054A5EA3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360843; cv=none; b=JbmDC4soSRMeFdbzS+fb7JBRh7FL7av41cYF/wB79sqSgfL4oOXUTMZ4lDXBcIlFXgnD+coVPBVzCNrrQ+EdxSXoF1gzEI40JDjM95UyCEOXwKDUaoNmyXSM2CSlDFpcdZXnTkHewM7Lh65SnWbCVSQHWTD2vhH6GUl9yfh8gHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360843; c=relaxed/simple;
	bh=TXh1grcukppVIGRq/jtRuAjsCenqoiHsQqtjG9cBjkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQH3VEeq5CDNo0GkRNGwKK+ZQqkn2he5Mvgb6u896EW7ijHWIEer+8MtnKmuGru05owltr4+ykHGFYdF0IAASQfpL3uvrfNGNAlB4tGmGSjkMhOQ3X7nvPQVHW9njLyET94N/9wV5tkgVMAi8K/P7UpVjEUgHNrP3MZEbu/z9F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4elF1GU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4elF1GU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e257a23aso874664f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360838; x=1788965638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2f+YxbIheZwHZGTF63Z6dyP3lfK44zOBXHl5f5gYzlI=;
        b=K4elF1GU4qjkw5SwWRXZTUqmwpMvZn0PDgxNLuLA8oGShzP9kBwK2sTmVAJd8o1ira
         uqXnzs1hme/RvaWuObqjIP65X+ieK1cTR5ORw7hy+P17F9mS2I/OW6QBK3zxJaju3x0v
         dV5qRK3ebPQpGgUWm+6jBEkw1jdPiEJzvAYvtLPL8zgKBLJ0b0p+phXJ7LJ0uQUBNlH4
         ++V/KkxLHpzthAQYrDIYuWzSFBdJ6JJJt8vRKKvXbvOP11OTlFr6cQqNG4eZrDs8ngiY
         y/pgYMYtuM11AaQ+yGllFMdYXzz1uMAd3atNoCkGFQSrCpRKb0huuz6pCB3RGUrHPUvr
         eyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360838; x=1788965638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2f+YxbIheZwHZGTF63Z6dyP3lfK44zOBXHl5f5gYzlI=;
        b=fJj8u/lVYeI4hUlqLgPIkILDNAKzln/5fGZTmlx040PoY0PC+AQL9ojRcQ6gWFEEYm
         bsCs82J4uFrh3g2g3yzAPnUA0w2PZUXQEcP5d/BmLKjT/KIB8I8C8DavHGNN1L11Vgav
         tnHL3zA5kS/la/cLa/luNkbd2qf3ucLCjGKDs2ZPvh9CnR1sEohDkrr8g4eT0tzsc6UO
         b6pY8HN8IMGje+N2Ik8XT08JNhLhg2V4qi6s+1xpAUl7Qe79sw78lEcwCFm1GQi6ZQeZ
         5wnabqWR7UhJ6tnVlj8PV5nW1hfesqRHXGG1g4zy7KFTUzFDFrEGrXJFFeTL+RjhH4pO
         PTew==
X-Forwarded-Encrypted: i=1; AKwUvBx++0K/RuMwcd+wlcOLT9K+/GC4AmoRc7sADWWgKVP0yy8tKHzXLrCn7mNdfWSZCuwBBFnP4N7i15scJoU=@vger.kernel.org
X-Gm-Message-State: AFuF++mbpLe9n6O2Nf/eA8rh2jv77VU6ZC2kKIvqAOJoiCGfzO5jAse7
	UaqncGZ5X1KeRrZ2A2Vm3SgNVCGK1LXQm9XshWbdUbrHxaYGkkF/MJjt
X-Gm-Gg: AYBFou36gIKipTL9wop7qTjatyyek+7bIjdUfkpXOVXpDos1Ngs3CExkKbRnPVgeehj
	nae27WsURwkGNWs1lWQfbLRAizpu1uOjgadGuUvCZcO2Pz0MrqlGkOiFM7a2ClIusVjNmRyc28R
	l/PSWHB0zq0kp7ray1F0J0qxCBGQCd70txhnxQesZMxvJ6PflC8XCQA9DqdaDQTmQ8IuWEFK6kV
	SmGPGMtyf7NqEr+BkFVyzbtkUrk1JN3uaJSf2rTJ3pjQsYl0kqhu/zxeKKHI/IyKHIQgCtoycTu
	FmDU/idV1we/1/XGYsPTh9IT0xbw/iollA69abwzJr0QA+iq5CgWRjWNC+zHyygEDUaFaiD9ent
	sQIg2fYELyfYeW5RiRustgr3RQgzr0TOtsiIOyitwbu6ESFwYGZ+27dy2dudtwjf7424lefxs8L
	yLxF7aA7IX2JoxNWtcQ4TgkZSe/Wl6cdUoza8tQBoV3El8z1YBgYqyYrYRo8qlTh9ctbHgvSEHs
	NlS2quDIAsSYpslBZtIJmMXBp1yMH2tW25ka44ByrFg
X-Received: by 2002:a05:6000:288b:b0:482:f09f:b262 with SMTP id ffacd0b85a97d-484913b88a9mr8501885f8f.20.1788360838300;
        Wed, 02 Sep 2026 07:53:58 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:57 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Wed,  2 Sep 2026 16:53:34 +0200
Message-ID: <3cd0749fa48afa1aa89781867bef49d3e6dd4e30.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index e040c1fa0a94..f639d2664d81 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2091,6 +2092,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2101,6 +2108,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

