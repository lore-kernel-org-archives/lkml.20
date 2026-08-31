Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70B37B402
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199283; cv=none; b=Niy2ZGWxlJh6dhGp5sJyQOhNToh5hPqHlVtb3e+HbY4cIhzAxjpuIkf+kyHW6Adh/GVt6YcSOemhSi5AXu7EViqXBgJ2KpOVjtocMbZeepomzTGNDeyfoCM+9KCKkrhRIKx0YO+ytpvbnzDzC0bKbnSJuiKTm4dsMB9NCQs5IKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199283; c=relaxed/simple;
	bh=dGRaBeE3nJd2FiUEsWNK0qhtWpUCzITGhWfU6u54kVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjAZg+nA6swX35guVY2r/xf+Drz0Dk8M9VcHwFE5a2x4W959l0qotLLFXeWOtav4YldUcEH2r/ud3wACQVww0HSt6CeUOAmgoflo1SOzKGTiGZr3lsW72w66xVXod5wpHIPOHZQ6ks+92joaQCjzw+qnJAFL6oGJ9YX3Dt4WMb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5gvKpGO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5gvKpGO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482fc3327fdso7472f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199279; x=1788804079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGGUFeBAj4JyjV5WQU/FItRd64MCygQVYmp7iNEyrvI=;
        b=L5gvKpGOHqveUhi1W/Dv5WdUKA8r+M/+4EjU/jSMmA1S0dEcbewp8fMcyRnCMH6mSN
         FMARfgVAPpTuuho75ptnfKSVjnpyegXQ4lIFy2GtFkUrNYxK04nWymNhSdHNWXQY+m5z
         oYQrZLLdTsHbtkHIlVe5H07hk4sHmzBsp81YK2WMOo8Uy1yTqOokqXAQwsGi+uF34B6I
         tyspSLjOk84kMSNszKBXiaFRPQNdfSENurpONLS6vNJpR6Ff/BALz7kY/M6fU/eR6dgU
         nUuuKLjLRvluVAoiMEC1+8BBvfrDeHkvveNkdNN3ltHlflGDZxU26h7r73nhoUND0l5f
         m7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199279; x=1788804079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGGUFeBAj4JyjV5WQU/FItRd64MCygQVYmp7iNEyrvI=;
        b=JLT0adKSC2BwaDpUUfA6KSepgCDsEoVyDoZM8gMB+3RSqYJb6Xj9+FTUyCDVCAR00s
         xKWyRtEQkk2+48CfOYuHrUlr84V0DP+JgGXiBLUtkzcgAjPahonenHaMqMSmzpVXAwOU
         72YBLo2MUVGk2jir92PHbzzjoSmlgXzhALmNNwCbcFxL73WWvGzkxrdjIKN4VuBsqJK0
         TwLMUtMzb4rXFJkdHKqyygoXwHbmR9Rrk5VF24t2+8u130hMOkbnFNCOkd9/kAjq8FGE
         dxVqJW14M+VtcrvTWAAn1SDf8pHZ5NZCprL3rKrl8gPsKH1APVNXtoJgwM6QXXOE0ZSP
         Jnlg==
X-Forwarded-Encrypted: i=1; AKwUvBwGcrYxtD8nsWdzIG8JcEbiU8Lw0lPtvtHiaqYKmGfoU7k0x0MUN2XC8b+zR/1Epvc+zyWDs1cBxI2y0A0=@vger.kernel.org
X-Gm-Message-State: AFuF++lP9eRQBWcYxcTLpOhssLoAtbMeltd7492qLT3d3xFpayPLsCay
	dfHMYXrcX3tlSJsF1oReUcNrlfEiDBk2zIB7UQzGtrm5kFdGT+03wJ8F
X-Gm-Gg: AYBFou3RyYwt4aRCapcmo1SaEzzcgimSRsYpHXHmqEceEcAJxNNg3JQF2jSIiJgsvJH
	41DoimE6r2RAki7LREHyCh2nFcjd6CSrErUXr1XxFllo7sYkBccAt1TPNymGG+BsEgPLNLhdtXp
	3SjEKCznGpdF1pM/gjDNqkG+lg7S2FlIvV7imTJOtrgC8Qcs5YWEJJxvDah1FadlVb+bWOI+CrE
	60ZWePXayXXmuIEk3lX2Kz8ZZwAtMKS9TmMcESbWmxO2xN8OPkg171qleT4ptIodDlL0KoPax2R
	4GJNawqNKpF7J+11qtnh3x43Yt9fGV+QLSmh4LC0vhvG8ruStKCVvdZk3SegL9zIjVtEoKmPIP5
	U7sRVQKRkMHNfFVtwGweaKI+F2I9enmFyIs2JsVfCuwIBasnxg06nXWideePDu/savcj25Eh974
	JXq7+MPLl403REDfNTXyVHkNX6/tShNtk/zMiCKNsGhTuKseNxOOFNlxOIz3GgazXpeGXYQaZcc
	Pkz/2wpa6SCtxh/yswfXIFPyt9Mld0YwxnRl/TUHFU=
X-Received: by 2002:a05:6000:288c:b0:484:3bb9:25ca with SMTP id ffacd0b85a97d-4843bb92758mr14491965f8f.12.1788199279230;
        Mon, 31 Aug 2026 11:01:19 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:18 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 07/16] media: atomisp: Add Yoga Book camera configuration
Date: Mon, 31 Aug 2026 20:00:52 +0200
Message-ID: <20260831180101.3109854-8-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
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
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
With Best Regards,
Maurizio Casciano

