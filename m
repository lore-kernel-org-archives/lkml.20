Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B265221C2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904557; cv=none; b=UYIozOWFio00tH/qdHPyYLpWNfOcrrhKIvqAxiAh/3/ErFHyS6pj/NLhJTueFB/ki9D7CuIxrtiP4aoie+ZHOVXWUNpHyoDjxUFXEXiHga+AzeWYIqfFvzjWTmLLP3lH07khb1axPrF1bSSa1Q1lWdhKomc3Z1C2PrtsfskhI6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904557; c=relaxed/simple;
	bh=a9dXKClCOe+LiiOZeM6HWK4AscvAqNCyErjpZSPza2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPPC539LAX8tRIIo1sjVTLppTJgLnmTHk9Xq0h/ZjaHLNaxqgYsxmZ5ZQ+jqS+27EykFQykkc29Dmk+xFgWZ3Zlir+oDkh3nhCOFvvFslx4MJtfAhB/9ndTbRzopuBMthUsqkYb4kLph3oCFi9KNjupO7ffrIiyP0z4Lw12ZkrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=WWAOMacz; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="WWAOMacz"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1234947eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904555; x=1792509355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/IcXJlXOmj9Ix/wIXx5s3Nr6Vc+Sv+o2u0pj+GWKi4=;
        b=WWAOMaczfIDNC8TmcnyJ7x3rT3LFRoFWqynMeg14pHGUMAkmXYhVnHZ4ff5f7yxJM6
         iuWH1LBbzXKiLD70nYq3pMcxAPAs9ysSWPtf/0Uexo3f93fd3iiyIg8KnOWiLb72QaJ4
         WPkGt6f9SE+/FyjD4cn+xI1l7aMeDbP96EXZ0c/rWocaD6IukZ6fikIvckMe1xCmbPD5
         W6OTkG0WxMG0htucViotkBffMTo+Kw/ZnPwgkxvdV8rbyDs/vlop5muXUWjfWqR+yEp/
         fhAi64zIJ/tQvS7ZlOL/AKmtAUyQ9vUdlbaezYI+BSLPZ56I8JvRzGfsm72UeWp1G+Tx
         3k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904555; x=1792509355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/IcXJlXOmj9Ix/wIXx5s3Nr6Vc+Sv+o2u0pj+GWKi4=;
        b=GeAYQ1/MbjIJ2udWX2D/wUcENj3FricOqaX/Oy+c+Vi8E7ciUbFPZ7B06sCdjRwjQO
         ZFm+ynOom74JzfUVE2ea8qkXIC+PKss9IfaO72xC7+emzq5syMm+HhzribWjuuwtXOlH
         SNYbF0Th/Q1fxf5h8iJhkaXc7d7MDQwL3DCjquxxKktCgNMiSXwI60FSau0tL1YBLvy2
         vlpfUWSyxUYDfEJkEGAo7wMFkb2A3NGU2LEsag9oNuuw0KlKxVV/2CwdICMqV5lrS+w2
         u/0a4Ht28TkP+MyGM0ZlGk/AH0Hhgpq9S2n+02APK1vKaEe6uvdKtog3f4GMrEk2QFHK
         04EA==
X-Forwarded-Encrypted: i=1; AKwUvBy3fNgavnUWNcDxCPk2a1YjnZngay0NhOO3PdLPyQjVSoS1ua3lMq3srmDxZKEP3Fv4/hddD27hyQ4IM7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQv72U4pK3tnld4/uountn26otMhiIF07sE/SdtDMPb6tokuNC
	C8jWMLbvfOWhms2R66/DTKnCHKAXWsZK9RRplBpnvErygqAjodUh8n3BOflkbknUOEI=
X-Gm-Gg: AYBFou2vZ4SCKYQ4U5Q8FO+XmppaQffJA2GFR8thvF0qar/Cx72RAdTI2Dv4IxVjGl/
	s+hyAGrp5ZP1yEWOP6uyF03Gd5SZiBCFuEfAYYdn0mZJXq1+PbkUoO9tZW0d9HWFvC/apoew5bQ
	R74D10e7BEtapDCMHaKEuXw+pHM+Y7radrlbWcg+6sCZyTHYv21Ih9cUoOK0NQUyF9iqtfqs9MA
	vm14ykrbuf/Siu3UgRZfi3ukMmYdm3vjcDdw6JBeAV6bgp1PRSnT7skpG1uHmii1dyKcu2mpois
	IVG675vFx5diToZeiRhFOOafDbiJdOnztHlkf3UzpwWCN6WZHmLOdHYWU4PbT0cCHL0QHqL2MkI
	jxeeevUox1du9sM8BAcylchYkINffFidKcGd86chOhSn4lE96Zcpe630MEfq6oXP3ZmLcFFNCfA
	7/3SxKaCcONn85hcyFuxHRHQtLzZB+eso/ZT8ItsgD3OxDxGgksSXRtvxP4TYDb9v4oOlWdfs1G
	d+Iwoez45o7s4k=
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr9169382eec.22.1791904554563;
        Tue, 13 Oct 2026 08:15:54 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:52 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 13 Oct 2026 16:15:25 +0100
Subject: [PATCH 4/4] Input: touchscreen: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-acpi-input-v1-4-53ad09ba82b7@thegoodpenguin.co.uk>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=8164;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=a9dXKClCOe+LiiOZeM6HWK4AscvAqNCyErjpZSPza2w=;
 b=foK/PhAIBsUDyey2bZDr+w07Pc7DYzpmB3TtY+zOIs6J0oDqsN8meR89+lQQeo3mAqG2vz/aO
 39DQlDB0GN8BIGPWqCaLSh8x2mcKozuI4fUjBDmxk3oHCedP3FjgnTy
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
 drivers/input/touchscreen/atmel_mxt_ts.c    |  4 ++--
 drivers/input/touchscreen/chipone_icn8505.c |  2 +-
 drivers/input/touchscreen/elants_i2c.c      |  8 ++++----
 drivers/input/touchscreen/exc3000.c         |  2 +-
 drivers/input/touchscreen/goodix.c          |  8 ++++----
 drivers/input/touchscreen/hideep.c          |  2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c   |  4 ++--
 drivers/input/touchscreen/melfas_mip4.c     |  4 ++--
 drivers/input/touchscreen/raydium_i2c_ts.c  |  4 ++--
 drivers/input/touchscreen/silead.c          | 18 +++++++++---------
 drivers/input/touchscreen/surface3_spi.c    |  2 +-
 drivers/input/touchscreen/wdt87xx_i2c.c     |  2 +-
 12 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 2c0e5a67135b..522e1ea405a6 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3409,8 +3409,8 @@ MODULE_DEVICE_TABLE(of, mxt_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mxt_acpi_id[] = {
-	{ "ATML0000", 0 },	/* Touchpad */
-	{ "ATML0001", 0 },	/* Touchscreen */
+	{ .id = "ATML0000" },	/* Touchpad */
+	{ .id = "ATML0001" },	/* Touchscreen */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mxt_acpi_id);
diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
index cde0e4789503..7d0a488166bb 100644
--- a/drivers/input/touchscreen/chipone_icn8505.c
+++ b/drivers/input/touchscreen/chipone_icn8505.c
@@ -486,7 +486,7 @@ static int icn8505_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(icn8505_pm_ops, icn8505_suspend, icn8505_resume);
 
 static const struct acpi_device_id icn8505_acpi_match[] = {
-	{ "CHPN0001" },
+	{ .id = "CHPN0001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, icn8505_acpi_match);
diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 17175adcaebb..7a651899feb1 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1360,9 +1360,9 @@ static void elants_i2c_power_off(void *_data)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id i2c_hid_ids[] = {
-	{"ACPI0C50", 0 },
-	{"PNP0C50", 0 },
-	{ },
+	{ .id = "ACPI0C50" },
+	{ .id = "PNP0C50" },
+	{ }
 };
 
 static const guid_t i2c_hid_guid =
@@ -1624,7 +1624,7 @@ MODULE_DEVICE_TABLE(i2c, elants_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id elants_acpi_id[] = {
-	{ "ELAN0001", EKTH3500 },
+	{ .id = "ELAN0001", .driver_data = EKTH3500 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 037bb35238a3..d1f9b44d9d76 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -453,7 +453,7 @@ MODULE_DEVICE_TABLE(of, exc3000_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id exc3000_acpi_match[] = {
-	{ "EGA00001", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H60] },
+	{ .id = "EGA00001", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H60] },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, exc3000_acpi_match);
diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 03efc0c792c2..7609366f0b78 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1531,10 +1531,10 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id goodix_acpi_match[] = {
-	{ "GDIX1001", 0 },
-	{ "GDIX1002", 0 },
-	{ "GDIX1003", 0 },
-	{ "GDX9110", 0 },
+	{ .id = "GDIX1001" },
+	{ .id = "GDIX1002" },
+	{ .id = "GDIX1003" },
+	{ .id = "GDX9110" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, goodix_acpi_match);
diff --git a/drivers/input/touchscreen/hideep.c b/drivers/input/touchscreen/hideep.c
index 58e00c314ace..68ee61c71df6 100644
--- a/drivers/input/touchscreen/hideep.c
+++ b/drivers/input/touchscreen/hideep.c
@@ -1088,7 +1088,7 @@ MODULE_DEVICE_TABLE(i2c, hideep_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hideep_acpi_id[] = {
-	{ "HIDP0001", 0 },
+	{ .id = "HIDP0001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hideep_acpi_id);
diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index 3de0fbf8da38..cdd02b7b6f67 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -646,8 +646,8 @@ MODULE_DEVICE_TABLE(i2c, ilitek_ts_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ilitekts_acpi_id[] = {
-	{ "ILTK0001", 0 },
-	{ },
+	{ .id = "ILTK0001" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ilitekts_acpi_id);
 #endif
diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index fd6c0ac301a2..0c8a922e2f2e 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1529,8 +1529,8 @@ MODULE_DEVICE_TABLE(of, mip4_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mip4_acpi_match[] = {
-	{ "MLFS0000", 0},
-	{ },
+	{ .id = "MLFS0000" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mip4_acpi_match);
 #endif
diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 0256055abcef..d046eba4b12d 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -1227,8 +1227,8 @@ MODULE_DEVICE_TABLE(i2c, raydium_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id raydium_acpi_id[] = {
-	{ "RAYD0001", 0 },
-	{ /* sentinel */ }
+	{ .id = "RAYD0001" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, raydium_acpi_id);
 #endif
diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 44d7141103f4..6014c4e049a6 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -788,15 +788,15 @@ MODULE_DEVICE_TABLE(i2c, silead_ts_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id silead_ts_acpi_match[] = {
-	{ "GSL1680", 0 },
-	{ "GSL1688", 0 },
-	{ "GSL3670", 0 },
-	{ "GSL3675", 0 },
-	{ "GSL3692", 0 },
-	{ "MSSL1680", 0 },
-	{ "MSSL0001", 0 },
-	{ "MSSL0002", 0 },
-	{ "MSSL0017", 0 },
+	{ .id = "GSL1680" },
+	{ .id = "GSL1688" },
+	{ .id = "GSL3670" },
+	{ .id = "GSL3675" },
+	{ .id = "GSL3692" },
+	{ .id = "MSSL1680" },
+	{ .id = "MSSL0001" },
+	{ .id = "MSSL0002" },
+	{ .id = "MSSL0017" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, silead_ts_acpi_match);
diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index 6074b7730e86..9d74efc8d986 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -392,7 +392,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(surface3_spi_pm_ops,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id surface3_spi_acpi_match[] = {
-	{ "MSHW0037", 0 },
+	{ .id = "MSHW0037" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, surface3_spi_acpi_match);
diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 1af309252092..858c7efd0c29 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1147,7 +1147,7 @@ MODULE_DEVICE_TABLE(i2c, wdt87xx_dev_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id wdt87xx_acpi_id[] = {
-	{ "WDHT0001", 0 },
+	{ .id = "WDHT0001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, wdt87xx_acpi_id);

-- 
2.53.0

