Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A15208B7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804618; cv=none; b=TmpeLyvmIfDINhdKqYrKtqtd0WXz6u6g+HoTUWwku1FUSpav41+uFhvg5UKm4cl2Lmb1BAEeJUfjMt0ZGWKismibQhXMDqD6sOr55Xyp4wzrv/E0hbMGNW5D3ipInUqKYfzhHW6gdSxSuanD8c7EBWFeGMVGbipJYfVd4flTy94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804618; c=relaxed/simple;
	bh=7wUoamM4+c7jF5tl6thS/Yftiw42UmhP7P4CTu0M+ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOt7185Bt4zKTrwCG+y6wL0EFDjHSdg5gWYeT4lYDPOrtVJxDgm2uA2XuSB9Zcc9IjgzyioWqfAk76xyRaVuhUZpGlabEUgkZS9N5ldOfOHcALYXcQ2Tivwlp3ujHqTT9Wmm5FG5465J9huXWy8r0W+PObNzNYUyNAlBNJNa+jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6rW/G/+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6rW/G/+"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so39836445ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804616; x=1791409416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PppgYVQCH9iw7pmx72bD2vKBs7GSn3BtKiFc/nksis=;
        b=h6rW/G/+q4nszBuYAGA64z0RPROYap6yJU7l4ou0RQmiBagGd37pTUt6hzi0UGoClo
         j43K/YEGwJMLd6EjgEMygm558zfLhxjRCfoW/lTFIo0F3+lIbF2fF/qPv76SCGGasz/a
         8MLx0YHSS0wvMZzcc67JGjAvaIpDMiepf9D4tSf45jKIpQRQXJG3Vx6PeOYuHXEKsE4n
         a+TPUrZEE194LOhlqgE89+ugDoUTamM1r5Ldwtmpze/873D++Iorj7So4BF0QLpf/V9Z
         vBIjlC2rPnhGaX5tG5MhrFUXFq5B8NbOw6tuBkMJ/lm3+n746bAxzu4eCfoDbE8O3vqx
         HKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804616; x=1791409416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PppgYVQCH9iw7pmx72bD2vKBs7GSn3BtKiFc/nksis=;
        b=trs5Jwyxj8w26bKLjrkVeEaCXT9Skw6cSGEchncS3/NjeNXb2rORxW4Q4l83lDvWyN
         o/XV02PmxYCyXm8EzvK9PVemMs7X7SSIXrC89QFMn8L9iF2Z1i8Bonmp3GVmMUfIehhe
         jfBks6+9P5Ku52HfTDMSBv77/snzSx3I+NJi/dXfQ88BPD9ZNQJ8IYOaZkuY0Tlqmd02
         iDIQRxbVka53ofpzHA9ULhkic5RWFrlrhD+guz3x1Dog32sY30e3TBE/pObDhIkfJpEZ
         1SlCepb1yX9BGU/40awUmFbybX+QkekZqM90dD7qipGcP0vm0pXbpTPQ5ah77jqaPzo8
         8BSA==
X-Gm-Message-State: AFq9FYKKj7BT/+GP/+c1OHrdE11Yu8ns/9G8iaPveAkYQnooqFl44NUn
	JqZgUojVGylLxog7qb8sSAoQLEro17RRzO1emb+Iy5MnMe3yaVreld6EdwKXCGh/
X-Gm-Gg: AYBFou2fJjJFLHoJ+evHp3gqx916vTfv5AdP8Bvq1UgZPFyLvbuuXGLwgA4cccMkIJA
	8Z1wO4UbJ1DE3RI6gDBJLXAtgFd14bob3v5kgUUbtZ66HecdlOrT1gtaWzQQhNXjN9rsP0oblbh
	eJiYpO9vEPNqZpxdANX2h1+m1cJM4KERF6mOPvJKNrAfVe8gcYFUbQvBFb5qfoWZ/1hR08qfRNC
	DZLj4HHbH1TBcWg+HuFK5P0ibDfH5zkcSkqh1n7RjxLKaR/Ny/Ab9GZvxZ/puhxc7z2MpR8xV1J
	VdwEsk/ue0NeG1VptoSaR5yr+yqHDVfnSiUp9O8Z+w8M+gds6sZkPcAhQSzHypUH5/xA9S913lK
	R4mleNQAIdlZLQW0I3ih+kr1S8putMYL/rBZ9ucN4jRXxSntbmGIzJH29lMgeN2Et2lDoalvTej
	mOrNQvCoxRC8Y84QNH3iGujneOaQvYU0YAAvtazCFhJ+3CFqMh6+TdEau5p1187pmc0iA=
X-Received: by 2002:a17:90b:4d01:b0:3a4:c946:9f47 with SMTP id 98e67ed59e1d1-3a4d18c2c5fmr2505401a91.42.1790804616282;
        Wed, 30 Sep 2026 14:43:36 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:35 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 1/9] mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
Date: Wed, 30 Sep 2026 14:43:13 -0700
Message-ID: <20260930214321.600863-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
and the I2C4 controller (INT3446) both claim the same MMIO region via the
shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
with -EBUSY, preventing the front camera (OV5670) sensor from being
registered.

Match the affected machine by DMI and the affected device by ACPI ID,
carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
applying it to the per-device info in probe. This follows the quirk
organisation used by the PCI counterpart.

Assisted-by: Claude Code:claude-opus-4-8
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index d4b24a717..9d7d0ad62 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -8,7 +8,9 @@
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/gfp_types.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
@@ -171,6 +173,27 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
 
+/*
+ * Devices that need a quirk applied only on the machines matched by
+ * intel_lpss_quirk_dmi[] below. The quirk to apply is carried in the
+ * matching entry's driver_data.
+ */
+static const struct acpi_device_id intel_lpss_acpi_quirk_ids[] = {
+	/* Dell Latitude 5285: ACPI GEXP device conflicts with I2C4 (INT3446) */
+	{ "INT3446", QUIRK_IGNORE_RESOURCE_CONFLICTS },
+	{ }
+};
+
+static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+	},
+	{ }
+};
+
 static int intel_lpss_acpi_probe(struct platform_device *pdev)
 {
 	const struct intel_lpss_platform_info *data;
@@ -185,6 +208,15 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
+	/* Apply per-device quirks that are only needed on certain machines */
+	if (dmi_check_system(intel_lpss_quirk_dmi)) {
+		const struct acpi_device_id *id;
+
+		id = acpi_match_device(intel_lpss_acpi_quirk_ids, &pdev->dev);
+		if (id)
+			info->quirks |= id->driver_data;
+	}
+
 	/* No need to check mem and irq here as intel_lpss_probe() does it for us */
 	info->mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	info->irq = platform_get_irq(pdev, 0);
-- 
2.53.0

