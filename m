Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D5F36F901
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884083; cv=none; b=aSzDXgeTi9aLtOAAfVCKVUQb2ghrdYiRoB5m+PGuwv1py3gaBnHUsMiAZCWiD1JBlVwQ+KFWjVJGUh3FfsT9heRreTHYIYuaqSeVXbMJhLeWIFZxiWVpJHOmWMfub+YmRWJjVucBqvYPivnAgTEUK01caHyUNFAYcqvAIWRkFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884083; c=relaxed/simple;
	bh=QLy9D33gx3rxFxSNIHfeF3FJcR5f6YTHRxMgJCM2dyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TI0e3nk+oj9jCFSAGeFwaEIhDwv22Lka70jL2nE8XFo4Q4TXZaW2GkOnFoBKiIVoBbxoebgQIZ41Lr2FwivZveFipw6XiiGwcEC2IDdzfQn6n6y+DD0uPbXSsgKs+fH24DZlJRPBGx57cW27DabIp7UCvKfhHScghF2NkJ+MryI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWdDhpl+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWdDhpl+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso52339395e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884079; x=1789488879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfvgduGaY/V3KBXYd67nwwljCt2z7CswJ9hAh0BTkIw=;
        b=hWdDhpl+V0A37W0sr2J4l91fajnxSG9VwxUNfY7VpqQP2txpo3cfoqa9yXRqzdh/ri
         wv195JO/GQjtMbqaARwkh9jRyuxjTAECQ/Z8x1WHy082zs07Df6j1ifvhL/lYPdsFLVw
         eBYf8tGNzFjqLOi6iH7n1EWZawSDxT8GfIS+RyBMFexxgTy0W7He4R42eORt1W4yqMI+
         APzPBySaV1t6iPWJHQ6fIALN4vIV2HiuOtvLWQRThrZ6MBPaEeUQpVBBFrnfAmjBUFaS
         vQ8gCBIAYN9xUcdRKsu5pj9H40TWybdhn20uubcCW/LSR0MJKTdjgJzecXIEw/tp+Xzm
         DAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884079; x=1789488879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfvgduGaY/V3KBXYd67nwwljCt2z7CswJ9hAh0BTkIw=;
        b=gSdMtUz9yC5+o8i29pFYFGp+Ep9Cn78nwwVJTJIFJmv3cdycZsA8Q0Fk2uiKtuBnHk
         BDsLhGlHRWvNdCnlC54dPeFPTA+8DLxT8gx5p4HrKkjFXMYatOzlqrZTOWwI6gY0h5QR
         s7xid/A5G1gBMvEcUvqiO3dgXXECZRG5CnSwRCmk6e0VNlg9Brphw6GzbUeMwEN41tb4
         g4WwaqAYIeSRiteh3JzRx8DCCaLzXnUESmH/g8TwyCNAatGjELQDAK4vP0dallwqFGEz
         0+8f+AhyiNBY2xKUHIh35x3cmGWo3xPuklGF0HrS8bPHawzQyBngB1UUsLkkYujHj6q/
         xX0w==
X-Forwarded-Encrypted: i=1; AKwUvBxOGF4KiMS4oFZJEm4kDaP+FMdxGzyk4ZupnyBIsN+ZXZoiMV1TWz+i+ZLnDbqO0KRv7kpzxMbiCrar38U=@vger.kernel.org
X-Gm-Message-State: AFuF++nPMeojNQM79SzfmXvCIzE/b1m+TivYFNbBo4LDJCu4J0SwAY8h
	dz8zAoAZbw581lP+XmNhguk0WdspYx4AZZXF1U6txMj39nKxEtL2qL4=
X-Gm-Gg: AYBFou1qZG/eZG+YRitpR2UdoK86EWLSVDkgnkG9MovGo6uDzclIQC782iyBz2G1mXx
	6fu8Ztir2/C7C8NR6NvvO7YA6xI7tabAzKDX+X4bssVenyK+nxBnldV3pHkePKlME3Jq0qXRjVz
	sgliJTk9RoO1+v60d80UlLRpdZQRJNp119yg15uMC8q6b4PjmVGOcjE+bd6wLsvbyHymG+V0k03
	uQzEW+/tvoZRbqIe0+4RebbNqcH+nRkbUlfQesJ8hjBJdt/R/EDOK2FLwpWzmCirri4TnHYg74r
	BEkemMhkZB76Oh1kV73tgbmjoCP9YT7wt30bQ4Wf4CeIQARPQMcPnYs0ZYm2STmzccq1DrC2ofE
	gEUyFsd37NxmeyGAi438Fxs5nM1ae4TnbtcujfZtXoGRLxzse7mWJPAmf3LjWykNwVQkdEVe1o5
	3U415YJDbRx8e34Hjv2bb12SeiaW6U+crJ5pcos1Df6rjZYOq7dmzq1nfgkL8OJTobT13zETvMw
	TWQUgM0vgRJbTJ9LjxjmXDXWgwOR0TBtsi47N+6BIuAwzyT
X-Received: by 2002:a05:600c:4e94:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cf81e368emr517102915e9.6.1788884078339;
        Tue, 08 Sep 2026 09:14:38 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm353464655e9.3.2026.09.08.09.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:14:37 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thierry Chatard <tchatard@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: int3472: Add TPS68470 board data for Dell Latitude 7275
Date: Tue,  8 Sep 2026 18:14:45 +0200
Message-ID: <20260908161445.334910-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904062006.39209-1-dmanresa@gmail.com>
References: <20260904062006.39209-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 7275 2-in-1 has the same camera design as the Latitude
7212 Rugged Extreme Tablet: an OmniVision OV5670 front sensor (ACPI
INT3479) powered by a TI TPS68470 PMIC, with GPIO 3 as reset and GPIO 4 as
powerdown and the same regulator voltages. The only difference is that the
PMIC ACPI node enumerates as INT3472:04 instead of INT3472:05, so the
existing board data is not matched and the driver fails with "No
board-data found for this model".

Add a board data entry for the Latitude 7275 reusing the 7212 regulator
and GPIO tables with the right device name.

Assisted-by: Claude Code:claude-fable-5-1
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
Tested on a Latitude 7275 (BIOS 1.18.0): the PMIC probes, the OV5670
binds and libcamera streams from the IPU3.

The sensor sits on the I2C4 controller (INT3446), whose MMIO region
overlaps the ACPI OperationRegion \_SB.PCI0.GEXP.BAR0 (both use the
GNVS variable SB04), so intel_lpss_acpi only binds with
acpi_enforce_resources=lax. This is the same BIOS bug as on the Latitude
5285, fixed by Thierry Chatard's "mfd: intel-lpss: add resource conflict
quirk for Dell Latitude 5285" [1]; a follow-up patch adds the 7275 to
that quirk's DMI table.

[1] https://lore.kernel.org/linux-media/20260831160754.9857-2-tchatard@gmail.com/

Changes in v2:
- Move the test notes and the I2C4/GEXP remark below the '---' line
  (Sakari).
- Point at the Latitude 5285 intel-lpss quirk for the resource conflict.
- Add an Assisted-by tag.

--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -449,6 +449,15 @@
 	},
 };
 
+static const struct int3472_tps68470_board_data dell_7275_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &dell_7212_tps68470_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&dell_7212_int3479_gpios,
+	},
+};
+
 static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:06",
 	.tps68470_regulator_pdata = &msi_prestige_ai_evo_tps68470_pdata,
@@ -500,6 +509,13 @@
 	},
 	{
 		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+		.driver_data = (void *)&dell_7275_tps68470_board_data,
+	},
+	{
+		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Evo A2VMG"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),
