Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186546;
	b=kT6mZc4OGCFeELwDLNF8+sq2bA4NELrxpgBgjzZh059uboRj2ZWHG/76VTYJWahfWBkJ
	 EXPIM0rLmI7lPetd/LjILEFIoOeNslTjrwbAyBkPkbsX7vprsrRVeNbT5sDSiTEhw2QFa
	 MPRHswB4ZfnkwQEGuqX5mC+rZXN5AMENqZOZp2qHBPjKwR4yuHGVjWeTmr/Y25BrcxwwV
	 yuY6c7RzWleXEEV6moaUe0VAiiZzlC+vOjjPNTyBqu/pVftSjNNmf1NF9TXir7mMZblMl
	 lRDht18wnWaeqzcVwh/IWlQqCsmunQ9f4noCVpEz/virzQFdNiFLpVjIoNlMjT0kZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HA8x356X2rHAFXxIztH0/QMR8pHLzCZg63CGgLWRSjM=;
	b=neZtVbd0wDDp2W9PRd4Jcvr91n6cWT6aVrsIVnc+nHWnIVXHeIy/IvEqzUCIi0joK2lr
	 RUfonLa6NT+K+J+MmmG9dD+8eSuN0nOX7OorUq/XYRjprZavqNtIthhdcP+RePT6WYIo8
	 A7f6lqVQfNgmRfc8MHdMshoEaFSgvbvPOt0eG1Sf9TfEUfwwbDM5EVvVo6D5tVH/OaPHC
	 H0d8ahkFUK7Ugc/GEqRTNzy4S0D5SaP7CSiu5detkuuWLZrUmuSdpnrCKuCNdG5nWkEjs
	 yXbPPiSK3G2gwsldMem5dwVsYp3lxTHNPUoMHkb0jQWIc9ehYaJmclHOshXWHMhs7Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qabGGD3g;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E409560A262A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E409560A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qabGGD3g
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so2301515ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186545; x=1793791345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HA8x356X2rHAFXxIztH0/QMR8pHLzCZg63CGgLWRSjM=;
        b=qabGGD3gIS/WhzY9u1lpL/KtIWoVID8b/hfBCmdosf3En+HdoIxQxQsTzAXYvkiZtX
         HgW0WXI3lqx2xlyJzSV2EK5lZ/OWe9RwifYz5zAQx9W8XmCZnX1ZTa1+0GyoQCb/yJ6x
         behH79xhlA5QrTBmbEdu9QMgqo3V6NiN41meKCpVNG0PyJO9+fPWy0JkKLQgApwFUGCI
         iC4pjC5bpnYTSQN4H6RXRb0zNntt6AFWbDGQPcCKjBcgLgCnYY9uoJtdnmK/szlJgssQ
         LO2iHe80WBYH3nuZb+QkLOtcqI99TcBK7S+SF9OI3H1WuycfiP1iYw7iuCQtsY9awzpS
         WaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186545; x=1793791345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HA8x356X2rHAFXxIztH0/QMR8pHLzCZg63CGgLWRSjM=;
        b=cirdI//hOQjczHRs/sbSwUoI9aDka27DN5emrnxJfltYOYUx4Ov/NgAcG+RHknjYjF
         lxl6ELpWkZDHKRDcF+wOy1M3TGH+lHHEHJabivDH4TxcpXcKSB0Kqo1r3H6BbVBKz7eQ
         74A6wN3N+Arg6IPETG0/m59T6WZslc/JjD4moeWLiKkd0rEqLRyx8J6FbtDReEcdVLi1
         dRsMsFREh18EeK40yyhC2VWhFa6JzhirlFF0uF3LUKYSGw9KZFnJKxvqrmF6OhentG1+
         wGfBaGtPJleWpPB09FY8P1Kla9s0XCfrowd1mab7lqOxmBQtbjWHpb0Jz3ya2JohczI3
         d2+g==
X-Forwarded-Encrypted: i=1; AKwUvByEKkr0SJBY06jNXZRMGthJShVHGdihYCX8WSlAamSgK8mkgBYG6Nc3D2R3dZeI0Qy3ed+xlcae2xX5ZPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy0gV2Rl8MxnRh0ns49vNrVnOSJkCuLPT+v5mE/4YyWIxMDzq5
	ELhBLq29HuEgLjMNcg1sMmf4DTk+IY8YRcsHoR73kxOcpIuksRMQaM8z
X-Gm-Gg: AYBFou3Qwbaw7HcB6Fvoanui5S31a4LYmRCfcRhcWaja8U4R3eCiv8yvFKFH4ABpkjg
	XRAfbucWvnqh7imgweuv33EDA3GWNu8vuNXPzUuRTP0Krthc8pp/b6ljXfYq00hDibHyaYCFozO
	2e1bzW2UMNp1Iot9ohv5iFaTpFfb9cQRRZzdJ4AkIaeMoa2ai0LNv6l0GqizfY5Bll4ycrBBXfA
	Bc+AdhHAcbbajISRrUd/8nMAQgRMM4jN4WCsgRue/NkUX0+gqySGnQNMXbOXKL7ZPkp463EAd/j
	YZKHxe307/NsaYUW5Iu/oT+oe/O68BV6o4SXWv9W8yNTb8Q6Rs4l4qzos+LfzdOxHHtnhKLrM4f
	4G/khskO0kqaLxERocTEuXsqlgI7Dm+B++HryFxHYbrM2BMU3y3JSl5go7Y+01iPgTWaNpPV9A9
	DIUO4y4GxVTANHucWTqCbpXveY2qNvm2wRI/44QDtN8k73UtQ2yZ6jeqoNoYs94AMrpzzxAdbpv
	2SLINY3pLUKHo6n9uw599R/NdpYKN2qy2dnxyCjNbHVMk6+xLOW34ggwMaNc7mIdwKYv2XDyEcm
	OgZ5P4O+Jz0yiOfBGOq0rlz2RRtV0wegaZJ3tIv5rcyOxjDVmO+3WY8rVgkqwcNYlS3Pt9yglSW
	pE7cSrOSDn1lvnfiUyvKdqYK0HAJGSjOjKKJPkO58Pc37XcffH5wj8Lb6hS4GbJOTNGFAmWZGRy
	1pp62wLREqm0IAPD4Tvu0=
X-Received: by 2002:a17:902:fda7:b0:2e8:3cf2:49a0 with SMTP id d9443c01a7336-2eb002d8a60mr33561575ad.1.1793186545094;
        Wed, 28 Oct 2026 04:22:25 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:24 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] media: ipu-bridge: Add a rotation quirk for the Surface Book 2 and Pro 7+
Date: Wed, 28 Oct 2026 20:21:54 +0900
Message-ID: <20261028112154.855185-10-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The infrared camera of the Microsoft Surface Book 2, an OmniVision
OV7251 with ACPI ID INT347E, is mounted rotated by 90 degrees. An
upright scene appears rotated 90 degrees clockwise in its frames, with
the top of the scene at the right edge of the image, while a frame
taken at the same moment by the colour camera next to it shows the
scene upright. The degree field of the sensor's SSDB buffer in the ACPI
tables is 0, and so is the rotation field of its _PLD, so
ipu_bridge_parse_rotation() sets the rotation property to 0 and
userspace has no way to know that the image needs correcting.

The firmware is wrong here, and ipu-bridge is where the firmware data
is turned into the rotation property: it already carries DMI (Desktop
Management Interface) quirks for sensors mounted upside down without
the firmware saying so. Add a second table for sensors rotated by 90
degrees, checked the same way, with entries for the Surface Book 2 and
Surface Pro 7+ infrared sensors. Following
V4L2_CID_CAMERA_SENSOR_ROTATION, 90 is the counter-clockwise rotation
to apply to correct the image. The Book 2 entry matches on the SKU of
the 13 inch model, the one checked; the 15 inch model has its own SKU
and has not been checked. The colour sensors of this machine (INT33BE
and INT347A) already report 180 degrees and are unchanged.

D. Manresa measured the same rotation on a Surface Pro 7+ (IPU6), whose
infrared sensor is also an INT347E: an upright scene comes out rotated
90 degrees clockwise, with both flip controls at 0 and the firmware
reporting a rotation of 0, so the Pro 7+ gets an entry too.

Tested on a 13 inch Surface Book 2 (SKU Surface_Book_1832) with a
7.2.12 kernel: V4L2_CID_CAMERA_SENSOR_ROTATION on the OV7251 reads 90
instead of 0, the colour sensors still read 180 and the orientation
controls are unchanged.

Link: https://lore.kernel.org/linux-media/6ae0f151.0f9a9df6.1cace3.5239@mx.google.com/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c4..8fbcd8c5b245 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -281,6 +281,32 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 	{} /* Terminating entry */
 };
 
+/*
+ * DMI matches for laptops which have their sensor mounted rotated by 90 degrees
+ * without reporting it in the SSDB.
+ */
+static const struct dmi_system_id rotated_90_sensor_dmi_ids[] = {
+	{
+		/* Microsoft Surface Book 2 13 inch, infrared sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
+					"Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Book_1832"),
+		},
+		.driver_data = "INT347E",
+	},
+	{
+		/* Microsoft Surface Pro 7+, infrared sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
+					"Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Pro_7+_1960"),
+		},
+		.driver_data = "INT347E",
+	},
+	{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
@@ -474,6 +500,11 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
 			return 180;
 
+	for (dmi_id = dmi_first_match(rotated_90_sensor_dmi_ids); dmi_id;
+	     dmi_id = dmi_first_match(dmi_id + 1))
+		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
+			return 90;
+
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
-- 
2.56.0

