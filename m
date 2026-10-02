Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F1D4F7988
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958842; cv=none; b=DFhd9PNKkBV7EKtUfLyz8lmoVu1df72Hh7mL8PjKnizFKCAbSd7UsIuXHa0+wbxAtXCfFIL0g4AF4kOItMI7CsqcztcYXeInHq3My81XHHC2BWUKNGgw4KzFChMlMfAL2bGCkWcI6HNGhkkTZSmcYUFX7fKqHRTa7iK8vdSOOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958842; c=relaxed/simple;
	bh=vPerNzUHeNkpC4UWYopCx5UVXtl70W8Mc3W34PZh+3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jX3nW9+8sAVW06Ka7cGckFiV7pT2PQUMEN5bBatR3b/B+7zrQgOHgynJSk9jPI7ToVBc+nw6GAG6wyrLHaCOTRbxLWGA8i30Kb/71+6OSYzbmM5gP6aXDLZX8Rb3x156/m6hdHj8QwH/UpEcXp+sMQEh/qfLdUsOXSPjBEeCSn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEIYcNG9; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEIYcNG9"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-888e95f3e96so1507667b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958840; x=1791563640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MF+zbJCSEd2tlTzZXByUfEsTla7iH2JPitaF2aLzAKQ=;
        b=dEIYcNG9EL6eZ83b/KtZmmP2Ox2bNMSHKpiNDowwlhvuSKJiItgIFS0ynneuY2fVtc
         pHoZSCEPhE6520ls9iNcnzXwD2EWS2/ZhqqCYn1gTH5W93SJi57arOFiUDl1/Y22Kc/p
         msC4yHhyPQM6vYpR4pCr1gi1pbEQfUqwwhUdAPL1DowPp8bEm4Iq13CoZ7PtYbDvX+SN
         GP2RpawbiTTImofloFa3xJr5zfbQn9I7GHZzjRBai2I1Laj7oDRKHvMWNGrRm+lkW47d
         pkBAmGbD2ZMzRm+QNJ5U52dru9Vg3dx48/nqs5LrIcMY0b+ZOem1nLsKGhwFsOm78Z8l
         Kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958840; x=1791563640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MF+zbJCSEd2tlTzZXByUfEsTla7iH2JPitaF2aLzAKQ=;
        b=ofkW7ljy1LaOjBvmYG4Cjwh0UXFvee9uCZ3Mn1qoI8jTGx4p+AGcbbwpTSlsZRBj0B
         VmKoxf60GwC4mP+fitMuo/PK7X8WwIp/OqhpLsff+iv84+4tk89EjtnDLe9KuI6phkO/
         RIG26FLAFPhWP2BtBrd7plDpR33X3KcXgCOUoKJh2zukxTwjp5bH6DaaeQVDSrDsQx6o
         AUQ6otd9UsZHNlBHV2elVuMwt5CuaCclxxO3tjLz9K/WQt6ds4rBz+TKd7wE0Qd7Mc53
         19MvXwjrHw163WqlyZkeClyKanlG39V9MIeE9XED4Ypj27XX0qzggJIB/O16uI/QUViU
         pxAw==
X-Gm-Message-State: AFuF++lPO8ftYxiorAsZkDwkizZCPfk4J6c9PhfBG4wU8493RukYZpxE
	NJT29YvNk3/rbl+G+UlzRL7DbwAhuCSuhQVhTMXZwIe6XLIyv9ub4rPxgVbblBws
X-Gm-Gg: AYBFou2dwjcn/xQ5oLZn3jWT8XZSv6t2Rb3ufP6i9LtKtLsT4hy8UGONVBo3oEd8w0+
	KiNrIW/ANWMTzNekEFpmHegRNLReFX59ajyUKIE9t+PN1c4lwh9xoGjk3JmlgLPO2I8GuobydfW
	Qrx8bNZzdW2MTC0PEec2BeOp5QcrzW6W6ycv8sC6Dly47v0WXlWqZFF27Lf7233Pq3Sg+ZrCiQZ
	8vY3Tszu2XFAJWE2en/Vg7VwbeUpAZOIqSSfsozKfhP5OVkKVRRAF2nmj4cPVcxvBhizFEdx1NE
	PVgJIAoJ0kGlO6OEAUh18LbdRj4SCnk8FcsruFOnWteteSAVjYLgbtccK8oH+jm64bNf3IMI6rH
	9aO80gcw05lZ+R4kkt4gaGRAeMpKIg9JifGfQKvPVqER5jZeFwqW7R2SO7AdjT48OEdAb3pyEPw
	92hCmP10pGak72Zmh4TabYEwt7jlzqZTidmtd2pIzAdEkX+WzLMH4XrsoUrElPHQM/qrI=
X-Received: by 2002:a05:6a20:260a:b0:3dd:a196:69dd with SMTP id adf61e73a8af0-3e0bd0186f9mr2812624637.56.1790958840506;
        Fri, 02 Oct 2026 09:34:00 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:33:59 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 1/9] mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
Date: Fri,  2 Oct 2026 09:33:42 -0700
Message-ID: <20261002163350.1248431-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
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

Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index d4b24a717..3f90942f3 100644
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
+	{ .id = "INT3446", .driver_data = QUIRK_IGNORE_RESOURCE_CONFLICTS },
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

