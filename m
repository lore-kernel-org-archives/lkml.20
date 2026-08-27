Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3544D98FA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854698; cv=none; b=FkTsinhW7neKcg2F6brIpI8mMVddDTE6ThkQn+ESfiaotfDYxEcm8kKm97J0iQ0M5DmnRkk4Hv1u+qyMvYjURhSRtKEEK3v/M+SHFqRu4eRbjah72kiB6XMtuL1GCVWIipkD2vp9T1eARBocDDV/KPISmluwS0FIPPzI4AX8wok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854698; c=relaxed/simple;
	bh=zNg9hW5D8DfY6cxbJI9eBWDVBL+I9NugvrjlC/Bu+EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+QXahqvB7/AZPH/P6Ht12wQEh3boNfQbZxC1n6IDU/uMcw7aJ6E5NVkBNiUQOA50ygF+L9KkRnfj1828Upi34+V4ngUu3L1rB2ANgdUFMwi7URDSWQyAmFiya48pQL+quWnJeWOD2biOCluVNVJb1NLolOQbrLvK7rSVxrpBog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PotZtWAI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PotZtWAI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8870445e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854695; x=1788459495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=PotZtWAI/oP+3FE1mILaeqWztJ3Rzh3OfCA+Qs9YXfy0ELvnuXHRxBf2NEdSB8+Aq+
         t8Tb/yIjLhB2eZ4Dpm1O8fjkZZ53ASOFnWMi9/L7H8c8b/2Wfz/2IlHwlsTgd6ncmxjy
         PSJX12Sv/VdSGi7wzbNFOxFxDJWdvpUs7PUSTjQegLoLjBGPKXZ1+FyLvR+hNjPulGYx
         oeyRvffPgx+EbW6PuJOHztuzIv9J2iwIb3cN57oIUZM2HA0fUWkOyTMOoH7OXaoxDjxZ
         ewsOrCufHzNVYQAVT+AG+hvuZTz0RKX0nctfu8scnWjt3xZid2H+wke02VwRU22JZKpx
         ftpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854695; x=1788459495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=TGbCfMhpmmrDciMwAS8YfEGAMaryPKrcOay6jpL5Kz/U6X5MR3wUlnBNDWx+nA4RuM
         8bJY6G6OSsTbT5zg87AGuK2+kFQWrP69saGBLpYwmX/Dtcj8QxoWdGP8s9LQ4fdHwYq1
         5qCvz8fzhEPNOoKYgglM/8VCvjR/G3QOLcote+NjrCPbLY7m86oA1Y4LEecPn2rKgteY
         ZRwQy294VaHDn0vRshSQFqh1tf8PmVaj9e5ZDyW1pVSjFJZUUjF3rick8NslS4RddIYF
         k9w+g2rLUl5XAKhKWoya4iDwxhRufwsiF+qwasoHwdaU6F7taxfElZ+JGu2rYC/JBTCR
         gn+A==
X-Forwarded-Encrypted: i=1; AHgh+RrpXg8sA8C9aGNdfDE50E3CzikBIKuttfaymFwzLKGxVH2FY8QImSIHr03ZiytE0fApozwX9nIZ+sOX2XA=@vger.kernel.org
X-Gm-Message-State: AFuF++mHRlwrJjICUhSKl4hJJQb5NTrmRIXhW5Gdv7p/w5t8kYaIgBuA
	dZ4sZ3uM8O9MI3/8kAW4xg/GPFpHSfA+7bmCfhbwj1TuOJd9DkZEnlXu
X-Gm-Gg: AR+sD108jovGWwICEYAiHSCfYSozMNSQylHlW2z1Zb9t0euLGyLoqCyxlm/JJ5ve+bz
	Kr7jZKW5EyanaSvHqUJ9sHLT4VBSxLS7sopMuLVHLcTi4lyPOHd37KxJqxI0bmMO+rzUeYhRiWW
	4izaNTJfLOBW2mdfwHDLs7UW/4Y0hTvMx8jbv9Wlh08SzhB85DwLRegFDR3OcMiartTKL8Bz61J
	v0FTaZWesd/daooR5eNopye+qXtWnwmSKozgAQDgvdBEMy8vG6qXWEa0ibnSUvfc14eXn6QY5w/
	pU6T5NexPRB1gUXogt8B466pSgrYxhK0UUtY4AIU8GV0DY+9elyx65m1TkdeNK98e5YoSGlw3sx
	JujjPjDRb/aNwaWnzyq1r0kaWnallIqprT8+w4ZrE8t9G8xkZpEjILeBbGROLgOC3y0z59BueER
	wHiYgVtKREll3u17POJE4sIVS3FUXw98pQicWSWYMnFIB75/DHISjG/7Hzi16sSIMnLOqzvnxP4
	Ad6xys2SNYGEkSrM6l+54gA/VdL6Og+e/6DzCfMsGQl
X-Received: by 2002:a05:600c:8b26:b0:49a:ce8f:1a5e with SMTP id 5b1f17b1804b1-49b91a2bab2mr17583105e9.2.1787854695146;
        Thu, 27 Aug 2026 11:18:15 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:13 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 07/11] media: atomisp: Add Yoga Book camera configuration
Date: Thu, 27 Aug 2026 20:17:52 +0200
Message-ID: <20260827181756.2430054-8-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator; front OVTI2740 uses two lanes and no actuator.

Add both sensor configurations and a DMI-scoped two-lane override for
OVTI2740:00. Keep the quirk limited to Lenovo YB1-X91L systems.

Binding and media nodes do not prove streaming; both sensors and the
focus actuator still require physical tests.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..207ab69385b5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -360,6 +374,8 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false),	/* OV2740 */
 	{}
 };
 
-- 
2.53.0

