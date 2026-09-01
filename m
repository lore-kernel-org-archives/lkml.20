Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104394A1DE5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289493; cv=none; b=O/ALGkYEwII7VDGRaezITQebcJZV3kpMkF+9e3N/bGxu7CYTYTV55+LeZSs8TAc+mcrfb/JnGDb+/iAvhdfGBp+MKSpVSqS8/t4Z8wEGhZsSepSkIfwBw/jE14/61G7VwE0PLIgb8FUYRGTlHu18iYX3Z5szAzp5XhZvsp/TeSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289493; c=relaxed/simple;
	bh=EXysUx/Mi2yYPLl4+sT6qBbUBxeUlVBGr4WTyCR2voY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnDZkZorfK4OlNC/LWTcxLkIC06sK/eNGyd9EfJPZVv3nUZ8ro+GljkQIngXetDKAS+Q5UvPsAAKOWTkpNP18TZkbZV580OyGNHUOm2eawuGb+2VM098HSt0ZuoMBiz7ADyIgaa22SFRXm4VsnyNU48AEm9SOdaIXgRg3XQii/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdKLqWs+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdKLqWs+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso1996745e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289490; x=1788894290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ognZlCZdfi4SFVd7C7og5EeWiW2/+2tCLUN3iR2p3A=;
        b=KdKLqWs+ZVgJ3nRwGRimUfcIM2L/nzPSMgmz9eM0iu89Y9RX0gqQQDjr+mZj9ZSZeC
         jQZYd86GJEvbO/rAl9xSNk57g6H2l/zX9po+b33rwqzMWgZUp6gpqKgtcMul1LJWMkjk
         sE2nJRG5IWi278UV08TVJj0prvj3kApn7KDlBCh8eGC0JidU7XEtZeQPpYswegAF5HL8
         tBhfx6KqeakPPgHaL5Tt3L2cCDbAEl32seNHQ6MdzWgYnGeXFt03iMP6Xx6yQhYKFWpX
         2vSY0HHAo1Vmwe1HMskFuy8vj0LTL7qKatEmQt2uOfDd66yRi3W+prPudRSfVontDxzt
         vENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289490; x=1788894290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ognZlCZdfi4SFVd7C7og5EeWiW2/+2tCLUN3iR2p3A=;
        b=HV5dMAbB5tkWiSueuvgxliJ2+Slnc32S89RPXWR9vAco3ECdS1p7o7fE/FpTRLp2QY
         komyp8tCkdf+laWBiT/KD2l+CAOp1XpOa0lNqm8bsf45OQLjN/aexsthHUUL887Gq4AB
         khuYm8YdHwf/p7S2LU9Rrgi3t0lpq4mFMG1/8OvBlcVl1iOPPoxPBP16ExfXGtjg40Zy
         o2d4GoiyAEGGfVgclElDDrAssCvQRt9yK35HiWyhIWtAP3e5G6g/kN5Mwdk8V6UompEp
         t7pWQnnd0mMMOVkBXlgBn69NJtv/a+tThcHuIGryDiiX7NKZF7Nsy9zYKALsd56OF3b3
         xnug==
X-Forwarded-Encrypted: i=1; AHgh+Rq5Lj4+jWPOojL6eT38o8DcO/DhfyYpt2NbrAtNXRBmjWYcaWYDCKxCCgUspC7ZYNfOY/LKyIMX+8X1w4E=@vger.kernel.org
X-Gm-Message-State: AFuF++nVpZ1MDCjquJOIXulHlGZHTX6k3WSKzpyiObv9cLuprDW17DMj
	x+CNltG4VH1NrYAfj8rJ1ena/91hNjyC5y3g8+Y8FgnjroSaDxQfVW+W
X-Gm-Gg: AR+sD11Bl41qiWptoropZ01bXWwHu4ogJwfumjjklgFsh26VW9SrtNigCKLBaV4LSQi
	EX8SyMfnQwnFat9fenR6AwS66m7XdpMCNzsFb3pN/lS+QVkGEtIFUf/Tt2GkwgCK5U30Yi3kqPD
	TMFqhAl8lVAh9jas3tzriMf38ojZMfOZ28U0xPtZkzlIyyAc3lo7PrlYm6+9fjjqywtgC0aeN1l
	WdPKgs2H7hmvxPIXfjkZ7aSynhI5fTvo1RKFBwwt8WLSKBpZIHVRgZ9R/SsajH9OFHuws2y3o1k
	5+WD2XXDqMwUAfiIRBjw06vWq2xBWGv3HZZtVQl9k4e9WcTOanmxbHMZW/k2WS1crXdcg65iluw
	ESFfsgha016q1FOI0puSzP8tkn8t2pwAlXM26iObnftlHQUuQ7eEB8XcROb7QGSA1WF+Pq8OdBx
	T7A7nHpZFhEt2dsD0kGWdtEuiHTyWlS7KehGvDOONq0RqmZfvV398m8AvjCTi1XdEpiuo8X5gip
	FR3dsN9WXY11H+Q7RS9deFGEo+I7ypR4ctcCPJcrJg=
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr367033135e9.16.1788289490263;
        Tue, 01 Sep 2026 12:04:50 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:49 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Tue,  1 Sep 2026 21:04:27 +0200
Message-ID: <1c2ae26f61ce9bd9e6689c58df7b17e9980fdcf3.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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
index 8d697b8d11c6..76769da94f80 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2087,6 +2088,12 @@ static void ov8858_remove(struct i2c_client *client)
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
@@ -2097,6 +2104,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

