Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DF4A6CC5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360854; cv=none; b=uudA6na2BvbFhYivsTEvOPAipSM0tm2rBX78dPrP3844xOp6Nxf04SlMyrz67oEkOTAL3N+yRpFnAEPBWBb3rFjxiPqmTGz0PvDa+aHMKyXAwBjp6cg1qGTWc8b0RZ3Ow3I01tiMS0/pQTWO0ZgHYgIaBosNl+J8b6elhYsmESE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360854; c=relaxed/simple;
	bh=O8+H77ig95xx3D9xkOkxR8/Uxxs4zMr9rHlkTdeo084=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfTsQ5f3DkT/jaUHHhMOP0n7+1safiMgHSZ2nQn0AY0isBGahgpJs2ca3fBRiDOcqX4padJqqIVOoU8CUe+PFgEvXePetfQK3VNZ9O0pJB/t8VQDqJONvzCW+cJRz5zaCZC9j+nB68SyNUKFtk8wsxxjFODkfO47nwGDxuunsBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSsQY9V1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSsQY9V1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso8845835e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360850; x=1788965650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=YSsQY9V1QkEpK5YjEjc8t+Jhg6BW+OvzQdeq1jPLp3+rwplzP1/sZIDtXSfNJriWal
         lc89iSgkP/aFCpGqfq/TraaBG7F7fgEURy04sPOnhKtRpU1n5bdQyncEw03hSsTd53TP
         vwiv9iWlXNigTmP3a98i6VE7t+NLqOEgFeNr/JXeMRam3vheUAskYylsPGugA4e8DVnM
         U3UF47tR74db7Wkhz07aboolevSSmucAQ+7sFs3XptGuPHw7fcvp/8hN3Fj/LTdf3rD9
         3vCg9/7eYD7beNCPGeor4uk3ovPELMCdhzw45YXR3a8efEss9GNVvv9JeaRv6pEZ+TSy
         +47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360850; x=1788965650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=Iaga38LL35XIWE8oxq9Rf3s785PsiVuLRPL6fe/zr4iDXeR5sJp4QxmJv4UNddwbH7
         +t2suwJvPEqcBIxMfBEgYeGeJN89uEYtDZfZArLsmhEKVuLaC37qBlwk82uk/rHUEC+U
         vTg6lJzWDs3FqlN9iXKwvlTEJL09gOov85uIt/E9B1sug4+vWjpypVaeoGJZLzWrciQt
         mg4bV2GzbfkdLwbmfls1VKNAxYeSn1ULfmizogKgFy5mnoOx3OtVsw+MIApbAIdB6DXD
         tV+YetqItLbv86nXfrq1hSpJDdt2fkrJrnihhK7KWuB2zLI8NRkMVKCqW6viyCZIh+GS
         tykA==
X-Forwarded-Encrypted: i=1; AHgh+RpXSX4mEaWIgT7X1wj9VkHqX8ByEQKcsqSXTiUSbAMO2DcTDvZTzVmNP1oj1lNOXqKMW0anBo7YWck+pbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lqQyEwU+zRQs01N1PYnA2Jj968KI4Vb0KwZgR7Og0eyKQlTDI1
	c9wOiuCIeFtB7eIOBjIDFmtEI9DD2YtjG+Jf7ulU38y/wW/QOwWQhPbC
X-Gm-Gg: AR+sD13jwpJjQDwCdvlBB/xO44etBsebUEtxRdJMoiIq7cpgtuAIG1UiyYpXz/DLrKJ
	QCesQRhdBv35ugQEW8ib0imM40q+BY/aJN9HTWjHNZP0xutH0wlKhgo6L+v1AzooLKGDXlS4/c2
	GmGsOeixODk6ZtwojAQWiYwrEpiSFag/MNpBgbyrs8ncLivJBZPuNvftaXU4ulEIq+j68x8dmt9
	PARAB8JmKueX+R5visHKEsuFU76jdlhS9fzjFrjyXExbwTgtOfTqc3VMNv5RJvt6Oykp7Hu6aB9
	qeUWk3QI2Mg159p47RdsVZAac7ytxlLKTrb1+cw/V2/zU+RIm67Hej9yPLA/dFVlQ0Q/Mcw3Z/i
	OIlUX6WlNJXB3S71HmXIwW6R9hr4y1a2+WcRJQLtIdIoxJ8hOXJeMKN+YV67HOqyvZEptex974K
	d2n+A82QdGIpGHel3bcbYNo5Gj4WLI67TrCj1eZ/RB/VblX7CSexJUAYHLpU/uYnRD2s0QLhP9Z
	rq5pK4nDJ4I3ORb+M9jfTdOnv8wHg4DtWDmnoj7lrU1
X-Received: by 2002:a05:600c:4e8f:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49ce57f5647mr83604445e9.1.1788360849699;
        Wed, 02 Sep 2026 07:54:09 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 11/16] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Wed,  2 Sep 2026 16:53:40 +0200
Message-ID: <ac9418b65cb9b52a3aa864786f1bdb1819d73315.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

