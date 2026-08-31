Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8335D37F303
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199291; cv=none; b=Ue8pJRB3bhIp8U/eOi6FJDedN27XfL0c7z6zl2s9DB0TzRd2vl8ysEx2ACyfCj+xNUsy1tbF+xGS/EatAd3+DttaeFYBA/71ghFwo5MOiakHVS6WEeYctIBLDBWhyJIVx0L4TmQORCuV2sHmGkX3XRhH0zoSNBka6Kb9pbAU94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199291; c=relaxed/simple;
	bh=8zThRUQpY5dLJkLhz/VsoaCUOQSCbp2KirpHaq7e5ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7lOZj4z7v6i2xUXrDrJsyimPpwaAvMV0eQbYLIWR/FsYe4+9wx4I9DKLLanEKQ3QJMWNPQ9XxoC/1y3s9fL6l3Y/sDkHnvccYsPmTq1lxK50CRr8ZVH5hu27wwgSBkC9bI0T1W2nSs/5EaT4ccIYBsvad/6pXrqfa6xn+J/gVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbfvcOU9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbfvcOU9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f633e6058so3032297f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199288; x=1788804088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpJ8roXvhY23ncBXqOP9UGLUTn78a3yu4lle+mqKLYc=;
        b=rbfvcOU9upCsc7DyTrkfIgnfSGCYOYOuQDKBjXZtZycAlwCMb70km1620or5kfME4K
         t5ceWuUQoXp+QSuwNnOavttweVidouHQ5ooBwABrFlvJMsp+GecwgvverbJIumX7pkq3
         nHrLCs+NrrltrTfFxChYg855vkWY/X9crg2u5idUL3eWQwWwp+TJ4IGLMrmsXgBhiyh4
         Pj05ITGNtUsX2nTGfn0PADTPpeK82TNlgBleWiC83FtN2Fjz71zDcOssY9epunc5IIZg
         KjpHhIbVWL/X7iKxQrZikDhlz6G1hYQvpgrlRswajSQjnvh2FpmbBRp2Ymi6u6Nl48Da
         2i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199288; x=1788804088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpJ8roXvhY23ncBXqOP9UGLUTn78a3yu4lle+mqKLYc=;
        b=EM3yx9H/ifdQb48GGS9y4vdyPf5Yqx8C3yMB+h+Qr6omO3BT5+IaplxpThNi/bVE1+
         TBiDhGAr4h0vtUJZ+1fWXeWUAGlRdx9bOZcmk9gFR31eRXSdHPCjAGLKU0aKKFskdAJc
         nKr8f9PC01e4k1O5Z4+6gAt3e3de0af/gFtb5oOuRVAWTbPzHLCvxfIdYNycj7iSdu1Z
         I7uM7Wo5bZeiCL9nWSLUu/Rc8/xvj5xK/YG6Yp+MDYsVQN+lSbgZ3Kbbk5f0tKbMrQic
         8kyPC+7TKt8H3mG/RGvTocaT4sr08exkz79qln2sywZIi+pbsbJ37xKn0F5qsMP90hH0
         ljZg==
X-Forwarded-Encrypted: i=1; AKwUvByOZhKaJx7lGrKvCMoR2+hgW4axzopYcre2fqSHySlfXvXNjyTEp+ypQ+wclLGVUHMI++C0RBfCxVu8guE=@vger.kernel.org
X-Gm-Message-State: AFuF++n2F4OpkHCtGb/qu64uA/1sudK+qC5qdQIcsWHITtFa5iH8hqKX
	CFl+cJMf1w4P9S97xtJDo5Y3dHSX6pzBpEOi2EIBOeN+8skjHjuPTVO6
X-Gm-Gg: AYBFou1mKJ5XjUBgo3uq2f1CgaV5C/bvWO5osd7FFjMaOZt0caz764nvGxDzlNgMmof
	4TnTo0X/wd/2CJFUkGzJ/muX9KMu4ROYpVOqCHdCqvvSu5va7uit9BgjckM0HuGXPEqdRisgxtj
	vsvxEs3tATT3eTBgjVVYmV9cHPExsTnaLzeVSJsewziu9/H1A3Vc9ZVNLW5NxXms2pMKi575zYv
	ifmEIQ70toped8qo9iizhok5IX2x5opN2yctkxxiZ9DGdiMx6qPi0Vk76ARjzewc74agOtRAVnE
	PxLfue2rRY4EMSDPGoRb78Ol1KHW/NeMc7jjGDX2QGRGGCCLGPBJZIMhc8kX6RwFMDIpU3L5m2X
	BzpFfTxoTMM/C9P0dVwMs49v12NtPx9kWC1DmDUGk3E2dv5CruEsvOTKmyDNB9akGz0LAc5i/z2
	9+3oA64JU2SqxCmsdIzvbQWnTbgeBwNeOv0/fQX9B5tRqfsVaAPHnfuf2vUhcBmL6xTOe+rNUFB
	7EXfyQc+0jpJ4TEdJGvxMjMekkFZf++aYcpnjehtv8=
X-Received: by 2002:a5d:5f08:0:b0:482:f0dc:b4f7 with SMTP id ffacd0b85a97d-482f799dadcmr44755064f8f.4.1788199287659;
        Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
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
Subject: [PATCH v5 11/16] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Mon, 31 Aug 2026 20:00:56 +0200
Message-ID: <20260831180101.3109854-12-mauriziocasciano7@gmail.com>
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

The Lenovo Yoga Book YB1-X91 firmware does not describe the front
OV2740 link frequency. Extend the AtomISP sensor configuration with an
optional frequency and assign the 288 MHz Yoga Book value while adding
its ACPI ID.

Pass the value through the IPU bridge per-sensor endpoint data so the
OV2740 driver selects its matching mode and the AtomISP CSI-2 receiver
derives the correct D-PHY timing.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c       | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 56da454f0d9e..226c81409848 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -15,6 +15,7 @@
 #include <linux/dmi.h>
 #include <linux/platform_data/x86/int3472.h>
 #include <linux/property.h>
+#include <linux/units.h>
 
 #include <media/ipu-bridge.h>
 #include <media/v4l2-fwnode.h>
@@ -43,14 +44,16 @@ static const guid_t vcm_dsm_guid =
 		  0x9f, 0x48, 0xa9, 0xc3, 0xb5, 0xda, 0x78, 0x9f);
 
 struct atomisp_sensor_config {
+	u64 link_freq;
 	int lanes;
 	bool vcm;
 };
 
-#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM)			\
+#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM, _LINK_FREQ)	\
 {									\
 	.id = _HID,							\
 	.driver_data = (long)&((const struct atomisp_sensor_config) {	\
+		.link_freq = _LINK_FREQ,				\
 		.lanes = _LANES,					\
 		.vcm = _VCM,						\
 	})								\
@@ -374,9 +377,11 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	/* OV5693 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false, 0),
 	/* OV8858 */
-	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true, 0),
+	/* OV2740 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false, 288 * HZ_PER_MHZ),
 	{}
 };
 
@@ -395,6 +400,10 @@ static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
 
 		lanes = cfg->lanes;
 		vcm = cfg->vcm;
+		if (cfg->link_freq) {
+			sensor->link_freqs[0] = cfg->link_freq;
+			sensor->nr_link_freqs = 1;
+		}
 	}
 
 	/*
-- 
With Best Regards,
Maurizio Casciano

