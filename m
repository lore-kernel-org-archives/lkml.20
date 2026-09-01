Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469E4A2A44
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289508; cv=none; b=Uo3gs+oyjSUe+AicPtQYGT76sCbAH+8MqrRT0KBmr9ECb5S4q9M7f2E7+tOgYixZK7JrLxuROurpSBXXBB91/hB9DKY1GhYez2XX7kglTpBI7Ky3DVkooes+CJvgCA+HtSJ4s9FaO61v0/82QfgS+PehEakOB/Ge3C34VGHEN94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289508; c=relaxed/simple;
	bh=O8+H77ig95xx3D9xkOkxR8/Uxxs4zMr9rHlkTdeo084=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbRkxAceVRMdYKOJiC0UpiD8rcwOF1zSYvQG0zWgI2wzFD/NevgBa6lyG/w5838IPZR2KAaDDeXzpNwueWB6+9WFdiLnXF47G34ui/e9o2VKUfEVldE8pDZ3uQCOW5CVWmM52eeUpP9rBS7KPyjVkL8FM9hI1nLgwseFp4nlkGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=becZRBY6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="becZRBY6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b965570d7so1221795e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289504; x=1788894304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=becZRBY6dtkAMoyFuLeLT3F+E0XbsvgWczRQmwqc4MjgLGDyNdm7DnJVQXie0pmFVp
         Zmf5JYdxV1x97MYQqVOqFMLM2uFRxcRNH7jZr9dqhismx+KaxX1yXuyHUcY/98psp5Kp
         k33U+2B0vmtLFROSW+dDoVpS7ooBBm905XFUs7R4iVujHvSQSZqlhZtExSS4QJwJDMYb
         WcJwzzgpu44lQTQ6l2OlIyvPcRRHCMbRLoXNzmXrhXZtY8+ad5RioZ/x3ACV1jJ09OOK
         Vqj63g4CXJA1RFyGmwyV6lZuo5cSeLmft/xqM7wxd/nC/qfMGYWCgX1Bjdv7uyzODFqN
         vOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289504; x=1788894304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=XR9oMI2EMZVMI1usJTNPT/0DVgzilegmxCNsrPNGj9cp+I8SSUmO2k1hP4dc2Kw7T5
         tvrQ8/9CKP15k8OulhGd3Wd+/OSOpUTQZrsACGeh2Nrvvo3vvzOMNfIm+3pWS+K0D75f
         cCAG9sY7hXxmb89wuauWPkHCxxYySgPMgPdFn3Z8s65uBeCG6s39sYszvaPIwMMLJgxe
         1hke6UZuxywHNJAsNAAPuhRkqCjWXlJgBJkAGR1P5P1mHPt7kDFOTHICJlk2vFmt2cKm
         tfLMyIdlgxYJwSW0p98kMNoBLlM/yF38LkQlz9JWR0zjnrtt/mote3vvQNXeyW9TTjBc
         5vVw==
X-Forwarded-Encrypted: i=1; AHgh+Roi9/I2hy4WYyLHrlSPOEnp+bzlovVGVMqdNN18ZsHAjh18/PFPcCbNFLFYpptkKiv33Otoe2qP10SXyt4=@vger.kernel.org
X-Gm-Message-State: AFuF++mA3/9uZcdJsrXm19xhD2vXkaAfYPf8K8cykF1FZerTjTQ5WqI1
	6qWBHkzB1TYROto4L5qyUIXRlK3Ixtoh4oIT+bNldD/ftjqIEIMy4+Se
X-Gm-Gg: AR+sD11DKV4gIM4+ECIzq95/1Rs+NOzlQaxyNlCiy/kCPVztWGQlVao3apWmyr5dHcw
	Aq68NO0ymas7iwo2u9xEqU85Q7gsdb5LAf8STYGShiWp4zTFnxtTvxRpAkXuW4nbgS4TrXZWeNj
	WvvrkRbRiwC/DO3dn4o2tLirCmgRaEA9fz5dEG1g7OImhQh319V8hwnthpB/Z2Eyf5Gs/YTPV9Q
	Rekn954ib33pp5MIxCxKz1uxFsuxvBHTtVKaeCBF2SlclTZntDw9rmh3KBsIdPQYriFAIS60vaE
	bPLxsSNMXVHIqMxxrFMlUmz2nhs9bmoV4YL8Kc4DwOTv9y+6eOX7knH66knZ+/gBzT5X3ERgtac
	bdvVMbHNnPm4k3iz8jlZCXxfCwCTAC++RSMMUbv1GshjB7ToBZgujxgJPOnE3r53N27dJ1iR2Mt
	ohSv9xvTfCSE8s1s9ibKQQE1GXs4eP4e3dfC9kk45gSCYppgn/yEjyTPVvvB9cNdK9rp5Jkz1vQ
	DsbDdK/Lt1Pf0RGpvWKcnoEN8Muwn2FHad5T12TvR4CZ0pC/2lL
X-Received: by 2002:a05:600c:4688:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-49b91c4fa79mr486809935e9.11.1788289503687;
        Tue, 01 Sep 2026 12:05:03 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:03 -0700 (PDT)
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
Subject: [PATCH v6 11/16] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Tue,  1 Sep 2026 21:04:33 +0200
Message-ID: <3c061a86251dd0a7210d67d4f1a254c2b8308d36.1788286339.git.mauriziocasciano7@gmail.com>
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
2.53.0

