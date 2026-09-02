Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAEF4A5C3D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360848; cv=none; b=WkYmv4QKZkzgY3b86WwrGAba2J5lL+UfGpDhbl2J5LxmuM1HT8955383W78Nc/Ls+nl9Iyf/hhnPW0HRQsdnmLVkPB6Zj8nLyx6Z8zi8QxM2CAy1ekNG7TsElZIk8xq1CMF70NCkf5L+K7DM24BbToFUP/EROjL8wrNFgMSdwb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360848; c=relaxed/simple;
	bh=zMz6YudLMNRyvt1tJOUeINHtau4Y9OLX8SPtgDvi43k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrFysXBOKxq7kfb0G6/oQXP+2JsP9BwvAHR3gsIKcSyITDMFTrfC3WNjKwV7j0iwM7mdRS3Pp3lWPr72WKBqnyqlTj6Y1juxFohP6dSjlqZRtMWxjOSY4cqgS796s3qdTc0ZePHu6PuVRiEpKOC+BwnvMUU3wUSHnKRF02WZAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+K4zmnP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+K4zmnP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so745661f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360842; x=1788965642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=W+K4zmnPc3dOJnxrKmMJ2Uj696MymC1q+s/G9dvtenar2TqQ8SLdeQ8cI3a9R/PC+1
         U3UPh/IJhFX0DDxwyHZ1Ez8WQNW3kxicdFm6RVuevwNFVQFM1G/zlXYO2z1FR15Iyjfj
         pDm4Sl9bH+DMaIGZYnkbR3mcqSOAuz2iJZbJMtKYhMroLT5e5kWcMUBvgwlUX9oDPqRd
         Imvof7vT0W4L0JeHvVD2xHkK8gFOb247c0yzAKPkrzbLrFJ9Gx5ibGUlPkRLkt/ugT82
         b/1FBtaDJDJbDy6b4SJO6J5QJCYzmCYYDeGB9Yuxtuej0hAPHUic4y956XKIG9ykaWU2
         s4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360842; x=1788965642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=p6emu5XzAHI82+QdzqOaF2tV5iCu5ZtoZfnre4Raq/ZBRH0fc9BUihdHhv4tYy66UD
         cZi+bSLr8cOka9VBvEXumtfeOUT1YzqzCm3ri6ZUT3MIWb/jX3SjpghGLUMl3dNNWKHa
         p6uAnO8uhhmQUvjGgkmDQ/6JA62OWoQ5LLfsVdq0PVQ/B5N/rvHzB8gBZfEDqN9DAaUq
         oDxtZg/VwRG2V8TWHh4oyps6dy0aknsOEV9Whf54bFguS39S4Wfuzc7DQVDKm44/uSMe
         bwnGJJqf2CjmTsTtp5mS0OYmaKaBybof1pMqb4EaTuG0ZkWbLgWCzv1qHBQ2n5Cp/yDM
         B+uw==
X-Forwarded-Encrypted: i=1; AKwUvBwCX0d5GMcPRM30Oz0Nu/vwGsZ1asDwJySkDFXNH5fQUk2fv/CLMx+Lo8XqowCnlERyUHHhENPVH6XHWPM=@vger.kernel.org
X-Gm-Message-State: AFuF++nhZqcFh4bzDzjUFgd4BpBPYTjhuZ86LDvHVBk28OKMBd2trtZb
	CVJznKnbW8NL1/H7j9ubB+UeTrkOxA4GOblU1noMdVroIMV/H5khXlh9
X-Gm-Gg: AYBFou2D/T8fpDq2Ze1NLSaYZJWObiJl3vjJCVMS+0nS3y6iDNCtZDEWcFcPhU8uwMV
	oHj4fkdYd5Sa/QkgKjCIhiiXWe/7k1JPgzFMQjbSebBVqhxQksww8ul7vtBbaGfxhqWEfVwzmFm
	hL6UoLDxr/zWmZFbiFQIFIWfM/7UKJUpqcmaxrCvvxkVh1fFKSLhJmMvNBXK7V+3mn0ZsP4W9qN
	KfSAnaqfgz8Xl3gZ33DQ0MagWhNtRQ5VSgd+YR8S8GUIIfPsR9zvJ0Am7Xw5tf3deY5DyMRROnm
	UUVzuPb0oWg/3aKM/OzbzGoUQGz4mYwvK4J/wneQACWCORxEQ7L0uA+ucJSkCpgVrmoXzJbF0aJ
	ieBd/D4AvbR6aWvOAvZggeFS5XMUB7krGcqHRNlJ/xxBIEDZE/Ge/DmqM/fjYklh+U4cK0+33i5
	uThjgw37IPZ7uLmv+gqPaL6rNjnnRFFWKvHQvZms+ajcjQSnIK4mXdXkZCoaVGNU3hcM2+LYWuf
	x5hVf/IyjbMIZbBQLpcsb+earN4Ds38Si8TrefcujqMfyeRDhZvY4Y=
X-Received: by 2002:a05:6000:4819:b0:484:4537:95ed with SMTP id ffacd0b85a97d-48488efe633mr10448603f8f.5.1788360842124;
        Wed, 02 Sep 2026 07:54:02 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:01 -0700 (PDT)
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
Subject: [PATCH v7 07/16] media: atomisp: Add Yoga Book camera configuration
Date: Wed,  2 Sep 2026 16:53:36 +0200
Message-ID: <3aa1bfa59816f3fab70801434659bdc2885ba4a1.1788360629.git.mauriziocasciano7@gmail.com>
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
2.53.0

