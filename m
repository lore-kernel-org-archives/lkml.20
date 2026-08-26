Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B1421259
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750591; cv=none; b=e/oasjtrJ7zR+IIGT2Cc7BL0W5pv1wQXHkif0GyrGXR5FoWjwH8BlK0LdcozNWzobmCdlcfa6Evzm7G4Xqc8J+2Wc5BLKOv4UnC2l27dF9NCCq65bbDFv5eA7mU5BobtWL8gXSSK1Ffy33e9fZLT4W9HMSJLdGOdqZWmFFsElnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750591; c=relaxed/simple;
	bh=Oi/dCIRA/+pshEFx53wMZKN+XEMFr0GqM+M0K4ABDm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eWw4w4jvTqF9TzaQgAq7aXpAccyoi9s3qEzpWCz7DxXLg4NroW9OY+tmDjsOSwaQC47ikKzLkJ5dxJbz5OvgFYPPlJe4vYuHRYrh18wuPZSGrOCqXj/eqWyT8wVHf8u+49nw1+WHDL7hUFtIhTMuGISgLS/6l2y5sqwIME/M6q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKgtHnh0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKgtHnh0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c197e7e4e94so139886666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750588; x=1788355388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMc5Fvp4Rfyxekd9+9mnrTAhpeQULh9Pwl9GwGfns1I=;
        b=EKgtHnh0BVhJ+oMPaqbtHQzAmzK1O8H7bvBh1TdU4ttKkr74v0zRxQ3RZ8hSEhEByE
         6O3EK1uSa9K3n/r7+cYfOrcAcgxw2/N7URAZdWz5UJiTlUf/8kjzm6KpUPd40R0gOl3v
         q0Ig1jtvUHvGqoEB38c57S5LaOEcG6MwSWXJB6XTtPNCbZVLbkbbY9+uLyTEtnsw1JK3
         7Fgpu9La3m0GE2i5ip+FbVJFdh58TzuDEJIq8mv06OOAgy6nrnm2RoyM5uKESvyapFy2
         GYvZbHM0wzbh9Ok52CYoqOTO1fzajVtfKX9M7/pSDospMGxacZV1IpRcjlQKs5pekZuS
         u1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750588; x=1788355388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMc5Fvp4Rfyxekd9+9mnrTAhpeQULh9Pwl9GwGfns1I=;
        b=DoXWrQn32+XcloS6g9VoyLfEoDVk5FrPodvo5E3sJMQcOGF0pszN0CeJp1ltRkiCSV
         dOsdFsR3RmJ+td8DX7ans+tyV6ADXRLXkC3HFMcv7f0f9rRVnpl/FJElouChpVsivbKy
         hfuP0VAhdy7YRQvdlwuJmRSVT8yIEIHRlV72ZUfS5KPNFEgjlwhalaedEC4y4ul4bWQC
         kyEeYey5Z6Zy6HQSV15PH2vh1Dm3iO8DGX9VGMiQHeZHVPzs+6p4SkxwCVrZGCehfhj/
         0d4Dx/20zpDfwSvlI7KIj3a1p5Sm5uUeiy/6qn+LOTc/FNDlrFhXmJgEAbWjEKoCTeM/
         qSKA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9ckeP7c+JnqWU2isz1GB0njssFHNO2G7O3aDXNvEBTsMf9ecfGigdp6fZXk58iOFbQvJLWrRf/5Mh230=@vger.kernel.org
X-Gm-Message-State: AFuF++km+rFkum5fcRXacRzsDOV5YUYxhAgs4MI2j6PZr8sV7u8fZ448
	7C9FPyTo0RwC/49v3148RpqZyI+hq0FuYqcoAVh9AHQoTV90cLOzBtgE
X-Gm-Gg: AR+sD10AyvnDlxVbHD6S0s9bk6WfXSysgMxodynIdSuSBViHtQ6fNhbLZyexP1787UO
	TYCFBRnaZkBUcWAJ9ES1n0tM29jNky/wu5f0/PJ6caQktM6FcHBCcA/bJWQ84UE15Rx/a+oqfNp
	0hx75DlR5yxTmhb9d0IGhSY5beoJjgEPjpz64PS0SWn4eGxLAnwut+tBs8Q5+MRqVlxLML104Wh
	MqCGgH+6qnvgSGE3tnJl3dXbUq+MZ+LTIbiMzR9lidGmUTPz2j9NgqKTPSfqE8h0+mcts+sMK+V
	fthzJTvlGYRXvGfVsZzg6EVHzlhGnazOuZqE1X6LknId4qp2eM5JtzMo/2Fr4jlCyYMwDrTcRlH
	NzFo+ybrmF9ejJmdyn4crzRoeQt8o5ILP7PGzvHAt9jJVqojQHlF+LtdKAAQ4QZbYsHyRitTCjO
	E8bPq7R6by3hn7ef35K8Hwy2VjHvMCKSdTJhcaQEuDQzerPi3C8RQ57bsT1S6FW7Du4UiQNF8JE
	vEAHRuzgWceNMeeTV5+rQ1M3DFPdWLKZiSurNhJV+c=
X-Received: by 2002:a17:907:6088:b0:c21:35d0:f435 with SMTP id a640c23a62f3a-c250bc0f8f0mr856005166b.10.1787750588312;
        Wed, 26 Aug 2026 06:23:08 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Wed, 26 Aug 2026 15:22:50 +0200
Message-ID: <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 firmware enumerates the front OV2740 as
OVTI2740 and the rear OV8858 as INT3477. Neither ID currently matches
its sensor driver, so both I2C devices remain unbound.

Add the IDs to the corresponding ACPI match tables. Sensor
configuration and CSI lane quirks are kept in later patches.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 1 +
 drivers/media/i2c/ov8858.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..d85d83bdd203 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{"INT3474"},
+	{"OVTI2740"},
 	{}
 };
 
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index f2bed3e88382..5a97f21ab89d 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2061,10 +2062,17 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

