Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292864;
	b=kdYpmqhUgB6BH5zjAa4ThyDWk2gg4K9reUm6BiypfPvOn1P2YBb7oMgOLI/unNW0+JSk
	 cUbo+RD8k1VHSN/x/p12ZnKM4i68rGaXoYf8wgY7F5xsLWt0AtH7qw25gFW5b9oGkD1W+
	 1gPyKbLTefV7yHCEPfX/Xnlkc4XUAmXDjBdebpC3D6uSbbIpXiwMslwrirgwuvY0/Lbrt
	 Xx71beUZSc6S96+OOq4Nv4UKIVVPhe4Yd6S59JEv55aOOivfOAVMjooSraW0KYH1rLs7p
	 mHQRkfLwFKGCgJP53fEVH8kBuFf54gVL0LzvDHr6niaiFCq8m3rr2dAZ87r+SOBiT2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FEv+lu0boJwsTO7lwbFALojqeOyVhSp+CzP+r21LEGI=;
	b=OsbYkKL4oGuL2qzaAu3FreKqWZsZ0KwY54Y+kDfbESH/eaqId/i6Oc8HQFduHmozDzhY
	 /t9SU86g3A34/purhXeS9XCM+LTJQFpfG1ag+qBrMA+ZerPOkUFmwiK+2X1E3WNzINWdX
	 FSPMUROu4iDwhrTDuAHHMRBCrSllhlQzfUnBiWulzBusdFaD8FgSfe1Q40Ja/t958kx4+
	 LeEK6gR8O/S6bzJNMJikXJhOi1OgyR4UbzqZ1WzRTFexlYDOXVHtZrfyGf1V4Ujtq/yV0
	 gFl+Jw3Q37Y4AkyTAgyOLYduMa4XO/1DsRRsG8leg81z6TIGlaYQuuvP+1agvbraBWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Xv6oG+ST;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E260A2616
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 740E260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Xv6oG+ST
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20edd106so1885469f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292863; x=1793897663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEv+lu0boJwsTO7lwbFALojqeOyVhSp+CzP+r21LEGI=;
        b=Xv6oG+STQY5JMNnAztkr2Ok9tyKlWF9sZsHyMVE0L+gHr1vtrCwJn/lPebOd1lHWko
         gmlE3CSdn5eHUZ+et+YpEDyijb4bGVGT+m1HWldNSgdmv6ziPy3ruHWu04gCUZAMqtnE
         VymGBD8Ry77g/2SVep47YvGSQqsOu+2vl9jxOSQ/4LYrG2gjmboEN6kPG3gtegT2ZLH0
         RfFvnt90wVB6dVnARHDXDseevrhB+XRc1OyuHIEoSEUKIpIjBjTmAMyAncnh9zT9XA7p
         B3vQ8AKIv4FH97CDz8s3sEYmZNcOv9Iq3Z6Yhz1j1u6FDWBXTx7nzNJQUqjc8XsG55kS
         ojjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292863; x=1793897663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEv+lu0boJwsTO7lwbFALojqeOyVhSp+CzP+r21LEGI=;
        b=kcXSVZca/Xp1qqCg1maXUcgwU2tfrw9uABLF09OkiUeGahbSqMC9AB5/4ZmQ9c7GUA
         dQQPtKeIgiUv4sRkYuIhAjgvexjvklVMFvFyT5LmpT1T6hTtGT2pFoQRTmuDJ6UMZkZe
         UEqtftA8YxRX0ZeuuXiu4fEehd4hGAK/CwKQxwF9Smm38d5XTochLX8WHjDU6v+npUZr
         2QJa3OMrQvjHAsztPBQsof24mU6Pajb6h0N8++vdD0epnzUsSEMGcLNa9T8/My6XStb/
         ZQ2W0i8ezzAssVYDApDHrgUBSz+WbwxK21TKOz8noyJmICAU4w/C2rWrrrYADhHR2yaJ
         cNFg==
X-Forwarded-Encrypted: i=1; AKwUvBwaD1jqoLxeG43GaH96VPEPP4JVI/f4m/9OIi0CHeydQJyB6aaW9uJ1G/sgiDTXZ7Nr7yupAIOsSnhy2xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsFQvQd67pFJT+C2T++tBm9M9J1HdbwjF4mETifquHfek4Krnv
	9FMNGHm827qA8R8LZgINrWgRCD4tJXWml4oxzh4At+IE9mQcV6aGYuiVmdAMHacR+fc=
X-Gm-Gg: AYBFou2wG06PC/t1WeV8ppsbtF20Tgs6c1/HAaqOUi0eJ/xJwW3KMb2/zYPiX9BcXui
	vBHZczmClXyVHq7accaEN7Ri0zDp68ByeQSgmMQ3m0AeWSq6pwhbTOlTojjSmOBMbQTDxLzpqAV
	JSAk+RLBjzNp/g1dZFqbQe0z7CxF9IeBoHKkJJYHgU54wDXmaBuwN8b3QH61JzWO31N5W085u90
	H3Y79IG1QUx7vgfACtxegHPmB80/utTC40ekDOSj/mV+98OTV5bbBtECMsMESDOym1L1l7usrAM
	BYmdPT2R4zia8+tW4PhQPZf5mOCSk1mVe6B1KgAMrL7YlJeW30iBe0QNlLHxcj02++AEhg1zvnU
	yaX1PyNNhKhnuYy+QHTdKX0RiMZzbuvgKoV8YBoX1aCZ+3Uq8S2H2Xnzc+rxKuhpOpISb96TmcG
	NgqiG5YrFy6CKMGp/DUxI1MdvLh4q4JtFzf3MVtLB8uqNwB0ERAIwCHlEwo9lcvz+9skcZzflJl
	vMpeZs8kbKn9eAY2GLN5GS1VaM423kSyalNQYtw7eyX2jskGohjRQxoOv8w5WCVr4ht/HI1S/H3
	8V7+DKG+iyv7HIFZHY0oo/z/tXEWh/tebNhm6V3AF0I=
X-Received: by 2002:a5d:5889:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48e5d5b8768mr14655156f8f.54.1793292862863;
        Thu, 29 Oct 2026 09:54:22 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:21 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:16 +0000
Subject: [PATCH 4/5] media: i2c: Use named initializers for acpi_device_id
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
Message-Id: <20261029-acpi-media-v1-4-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=13426;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=vr5XlwSiWPDykWKMXg+/MohMR77rOUg7vNBUckQI/Q0=;
 b=HSiDZEANSpetcUWLldWpgmYgpB9KNOU8dxtxtSlksb1gU6ewXaZljhz4vHHDaavzxdmGQxATk
 WcyU5BNMl06B/iwU5WdVHMfGGTBVX4HyyoPro8giBReCV2ePCbddNFM
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/i2c/gc0310.c    | 4 ++--
 drivers/media/i2c/hi556.c     | 4 ++--
 drivers/media/i2c/hi847.c     | 4 ++--
 drivers/media/i2c/imx208.c    | 4 ++--
 drivers/media/i2c/imx258.c    | 4 ++--
 drivers/media/i2c/lt6911uxe.c | 4 ++--
 drivers/media/i2c/mt9m114.c   | 4 ++--
 drivers/media/i2c/og01a1b.c   | 4 ++--
 drivers/media/i2c/ov01a10.c   | 4 ++--
 drivers/media/i2c/ov02c10.c   | 4 ++--
 drivers/media/i2c/ov02e10.c   | 4 ++--
 drivers/media/i2c/ov08d10.c   | 4 ++--
 drivers/media/i2c/ov08x40.c   | 4 ++--
 drivers/media/i2c/ov13858.c   | 4 ++--
 drivers/media/i2c/ov13b10.c   | 8 ++++----
 drivers/media/i2c/ov2680.c    | 4 ++--
 drivers/media/i2c/ov2740.c    | 4 ++--
 drivers/media/i2c/ov5670.c    | 4 ++--
 drivers/media/i2c/ov5675.c    | 4 ++--
 drivers/media/i2c/ov5693.c    | 6 +++---
 drivers/media/i2c/ov7251.c    | 2 +-
 drivers/media/i2c/ov8856.c    | 4 ++--
 drivers/media/i2c/ov8865.c    | 2 +-
 drivers/media/i2c/ov9734.c    | 4 ++--
 drivers/media/i2c/t4ka3.c     | 4 ++--
 25 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 5e941291dbf7..f822fe3fe200 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -759,8 +759,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops,
 				 gc0310_power_off, gc0310_power_on, NULL);
 
 static const struct acpi_device_id gc0310_acpi_match[] = {
-	{"INT0310"},
-	{},
+	{ .id = "INT0310" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gc0310_acpi_match);
 
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 4c13adf4a900..55c2a59bee07 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1432,8 +1432,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(hi556_pm_ops, hi556_suspend, hi556_resume,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hi556_acpi_ids[] = {
-	{"INT3537"},
-	{}
+	{ .id = "INT3537" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, hi556_acpi_ids);
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 41b8cac6a5e3..7af74b41786b 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2934,8 +2934,8 @@ static int hi847_probe(struct i2c_client *client)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hi847_acpi_ids[] = {
-	{"HYV0847"},
-	{}
+	{ .id = "HYV0847" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, hi847_acpi_ids);
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 3a899b41a9d2..ea7d102c7383 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -1044,8 +1044,8 @@ static void imx208_remove(struct i2c_client *client)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id imx208_acpi_ids[] = {
-	{ "INT3478" },
-	{ /* sentinel */ }
+	{ .id = "INT3478" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, imx208_acpi_ids);
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 065c33380f60..51982645ae55 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1536,8 +1536,8 @@ static const struct dev_pm_ops imx258_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id imx258_acpi_ids[] = {
-	{ "SONY258A" },
-	{ /* sentinel */ }
+	{ .id = "SONY258A" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, imx258_acpi_ids);
diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
index c9da174dbfa6..8d97d0000ae8 100644
--- a/drivers/media/i2c/lt6911uxe.c
+++ b/drivers/media/i2c/lt6911uxe.c
@@ -687,8 +687,8 @@ static int lt6911uxe_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
-	{ "INTC10C5" },
-	{}
+	{ .id = "INTC10C5" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, lt6911uxe_acpi_ids);
 
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c6c950d5c8f3..f9dc4f6b83d9 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2679,8 +2679,8 @@ static const struct of_device_id mt9m114_of_ids[] = {
 MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
 
 static const struct acpi_device_id mt9m114_acpi_ids[] = {
-	{ "INT33F0", (kernel_ulong_t)&mt9m114_models_default },
-	{ /* sentinel */ }
+	{ .id = "INT33F0", .driver_data = (kernel_ulong_t)&mt9m114_models_default },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
 
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index b207b1d853a4..41f00f3b94f3 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1117,8 +1117,8 @@ static const struct dev_pm_ops og01a1b_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id og01a1b_acpi_ids[] = {
-	{"OVTI01AC"},
-	{}
+	{ .id = "OVTI01AC" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, og01a1b_acpi_ids);
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index b9a7dacd603e..932254f2fbe1 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -1114,8 +1114,8 @@ static const struct ov01a10_sensor_cfg ov01a1b_cfg = {
 };
 
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
-	{ "OVTI01A0", (uintptr_t)&ov01a10_cfg },
-	{ "OVTI01AB", (uintptr_t)&ov01a1b_cfg },
+	{ .id = "OVTI01A0", .driver_data = (uintptr_t)&ov01a10_cfg },
+	{ .id = "OVTI01AB", .driver_data = (uintptr_t)&ov01a1b_cfg },
 	{ }
 };
 
diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 8ffe0a07ef85..f915a64f8e47 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -984,8 +984,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov02c10_pm_ops, ov02c10_power_off,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov02c10_acpi_ids[] = {
-	{ "OVTI02C1" },
-	{ /* sentinel */ }
+	{ .id = "OVTI02C1" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 5c1e7013f559..8e2d3dc5888b 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -924,8 +924,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov02e10_pm_ops, ov02e10_power_off,
 				 ov02e10_power_on, NULL);
 
 static const struct acpi_device_id ov02e10_acpi_ids[] = {
-	{ "OVTI02E1" },
-	{ /* sentinel */ }
+	{ .id = "OVTI02E1" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov02e10_acpi_ids);
diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 0710d2243cc0..67f167a7f77c 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1596,8 +1596,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov08d10_pm_ops,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08d10_acpi_ids[] = {
-	{ "OVTI08D1" },
-	{ /* sentinel */ }
+	{ .id = "OVTI08D1" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov08d10_acpi_ids);
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 6de0c17e633d..df2c63d64e62 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2372,8 +2372,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_off,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08x40_acpi_ids[] = {
-	{"OVTI08F4"},
-	{ /* sentinel */ }
+	{ .id = "OVTI08F4" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov08x40_acpi_ids);
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 5a49fa0ec026..c086d5292537 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1806,8 +1806,8 @@ MODULE_DEVICE_TABLE(i2c, ov13858_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov13858_acpi_ids[] = {
-	{"OVTID858"},
-	{ /* sentinel */ }
+	{ .id = "OVTID858" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov13858_acpi_ids);
diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 242a95834126..59e94b2f661d 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1697,10 +1697,10 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov13b10_acpi_ids[] = {
-	{"OVTIDB10"},
-	{"OVTI13B1"},
-	{"OMNI13B1"},   /* ASUS ROG Flow Z13 (GZ302) uses this ACPI ID */
-	{ /* sentinel */ }
+	{ .id = "OVTIDB10" },
+	{ .id = "OVTI13B1" },
+	{ .id = "OMNI13B1" },   /* ASUS ROG Flow Z13 (GZ302) uses this ACPI ID */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 147862a813c5..8bfcd8bd3ae4 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1304,8 +1304,8 @@ static const struct of_device_id ov2680_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ov2680_dt_ids);
 
 static const struct acpi_device_id ov2680_acpi_ids[] = {
-	{ "OVTI2680" },
-	{ /* sentinel */ }
+	{ .id = "OVTI2680" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2680_acpi_ids);
 
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 536325bb7b92..fbba9e5a5fba 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,8 +1462,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 940f21fe0dd3..84d209955385 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2797,8 +2797,8 @@ static const struct dev_pm_ops ov5670_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5670_acpi_ids[] = {
-	{ "INT3479" },
-	{ /* sentinel */ }
+	{ .id = "INT3479" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index c5eb07576129..47837d13c1f2 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1355,8 +1355,8 @@ static const struct dev_pm_ops ov5675_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5675_acpi_ids[] = {
-	{"OVTI5675"},
-	{}
+	{ .id = "OVTI5675" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov5675_acpi_ids);
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca74b..d2eff7422194 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1422,9 +1422,9 @@ static const struct dev_pm_ops ov5693_pm_ops = {
 };
 
 static const struct acpi_device_id ov5693_acpi_match[] = {
-	{"INT33BE"},
-	{"OVTI5693"},
-	{},
+	{ .id = "INT33BE" },
+	{ .id = "OVTI5693" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
 
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b5120..5b03343a0350 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1802,7 +1802,7 @@ static const struct of_device_id ov7251_of_match[] = {
 MODULE_DEVICE_TABLE(of, ov7251_of_match);
 
 static const struct acpi_device_id ov7251_acpi_match[] = {
-	{ "INT347E" },
+	{ .id = "INT347E" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov7251_acpi_match);
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 42c4b9c4e380..7a825738777c 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2457,8 +2457,8 @@ static const struct dev_pm_ops ov8856_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov8856_acpi_ids[] = {
-	{"OVTI8856"},
-	{}
+	{ .id = "OVTI8856" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 5a59cca8eeae..a28ee2cd2232 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3130,7 +3130,7 @@ static const struct dev_pm_ops ov8865_pm_ops = {
 };
 
 static const struct acpi_device_id ov8865_acpi_match[] = {
-	{"INT347A"},
+	{ .id = "INT347A" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 8f39609ad1b6..31d22de7efd3 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -972,8 +972,8 @@ static int ov9734_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov9734_acpi_ids[] = {
-	{ "OVTI9734", },
-	{}
+	{ .id = "OVTI9734" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov9734_acpi_ids);
diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
index 6506225683bb..187206178854 100644
--- a/drivers/media/i2c/t4ka3.c
+++ b/drivers/media/i2c/t4ka3.c
@@ -1043,8 +1043,8 @@ static int t4ka3_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id t4ka3_acpi_match[] = {
-	{ "XMCC0003" },
-	{}
+	{ .id = "XMCC0003" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
 

-- 
2.53.0

