Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5961C3515D9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861784; cv=none; b=PSyq6IrFnawsUIrFmMquAFc87H8Jjm6LP6DUXAVc6oQmumpFEVJwIkN2EASqZCemx6rSUDXcsI5YXisiVftmpJ8rtVOmja72CqRoqApvAo+rVtbKUu3e22WIp/GRGlhaIoDrRq9lc25AC16DK7BIAZarerRPvGkRmR8POdaFrXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861784; c=relaxed/simple;
	bh=jUqW7Lvb2oXV+UUSZ9bSqCz/FTS7stp6+FctKytiSHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXWmSpvUzYFzwYRQ8L9Auur/s66iY8bEv+UIYcAYsvEadrjK5RMNujrFl13XLc4nYXr3OoEbvPDDOfSGUOXVOM5gDH8FgxKqSCI+huxXOfeH2Zf/HFOg/VJfhD9WG+51EsfCYtpg/A/2wM6MQ8ihwqoiAbQXcL0me3A5QcGUTXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqNbzFM0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqNbzFM0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so1266695e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861780; x=1788466580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOVWqLZCrjPxNklY1CcQgFe9W8y6HPeVsIwMdTSzBsw=;
        b=OqNbzFM0JaTZwVDs876ZvtRwkOMe1zmqN9RCnSSoSRAQ1en5UX9yikWApa6Wt7YISS
         gaC1/8hfhPZk5pzUvW/B66liylws9wYUWJsfqPMzb1H7Tk1DCqXllaLKyKYwdecpmw0u
         k59VJXj+9KF2r5rcZO7sncoTYBsgfWuyAcMW8F3enswlqraiJXTUD/Yy+AdXvdqEMlTG
         YGOmxl3HzCB85G+7jOEUszKrscm3vh5EQVgAlNSkHdlfC+J31AyqtX0ZSylUUthMJliW
         UiUE8xJVPg7mriWin0vtdW3finRttkCaaxRXI7j/kQFK0iGLmWRPqEMN9Si+L2ACEGy8
         m5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861780; x=1788466580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WOVWqLZCrjPxNklY1CcQgFe9W8y6HPeVsIwMdTSzBsw=;
        b=AMzJi02gSWOidEnN8cPNJ+RziJ/wwV5kOo2bQDFHDneC2tbvw9NCtQvJfndG9EaiSF
         eRYqBjVrfTt3XEoRf1HymxGzCVjO8PMve92aB2vlZYpUT8zM6vFedfc4WAkGXhHXHGOa
         W9/PtP0wadiWKpksqvWVfSJaiOyU54fhY8KKYldkuZ1Husdh5HXRicTkHlu8SCAek28l
         rQdYY2Z4YOgy0tpnZqV5ZMYUVeEssaDv0QnCJgsijwO+QA2cg9QyU3Ro6+7kNXdFd02E
         S8bvEWFz8qCJ+AQopUjbZZZDRX0FpI54gasNs6gwas175c1g35RWWU0BVphqOFhhTuz5
         6swg==
X-Gm-Message-State: AFuF++mrNaGG2iAIHqV2BozbPssm9JkPL9BUhesqSgSO8cQMI+t1N6kW
	N0HWPubrFHUYwnPWbNZaW1wetQ90+tbflNKxRcgZDk7G7qHPNH5fx1hciheNfKDtFb1iCA==
X-Gm-Gg: AR+sD10+VWykDjLW6dnbR5sM1UXXH94u/O40kLuxW899htavchILeF1j8UJZ8NSsbNX
	r98SZ1pn9R0fB8qTMYTz0+a5MPjdHNY9JJ2tWec5H0mbhXlU6pT3VDyVuchw6uGtOMrsElZlRrN
	ZdetaUgZXCPi6o0EvbxFBFXi0ELs0WrDnUL3ZwwET6S9jhKb+MPBQKx3z3dXUUrJRCXkxcr/737
	qfNeBi/j3jQlzrwetd8APjIb1wevMejIrnArBw7hKhYZhZx58VqnC7/M5NLCsaCIPBXJTReg3Z4
	ER2cnR6fpv6cL7lk80uZ0+J2tJAfJJzKGDdFCx6DuL3j5xWfvVqMH/kyNg/zwbd2bUaC72Htxqf
	jbLszyv4+J0+rgn1NM5BIvLHtK9MHU1coSWRmSJ2TEuHsWKPkfG6qSZunCcibW5APNEQWUblGqY
	Q+wMPfdrzJ6lr3kvN5wyeT4lG95ln9DtZ4hL4yOOV7h4DUDMjTcExPXsKsNkxyZCX4DcY=
X-Received: by 2002:a05:600c:1908:b0:49b:9113:e03c with SMTP id 5b1f17b1804b1-49b91c26365mr19410945e9.8.1787861780506;
        Thu, 27 Aug 2026 13:16:20 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:20 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v9 1/6] mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
Date: Thu, 27 Aug 2026 22:16:06 +0200
Message-ID: <20260827201611.99825-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..1ac1dcc41 100644
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
 #include <linux/mod_devicetable.h>
@@ -172,6 +174,27 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
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
@@ -186,6 +209,15 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
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

