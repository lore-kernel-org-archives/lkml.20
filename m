Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537731;
	b=LNlKtDGVjKjEy72gcuOBNO/ySgUQAYVf+1usP1kvEuQT8HizxfeAMdZqEL+fVbiCLTrH
	 Wr8XEJgECQ1hContEqP9CTPrpBBXkRDLJ3xIvpYOh7+ho87JvqnxnyJ3LD9hiQ8yrm8i6
	 zac/OlcbKplvmNRYrHqR5yOtJfCf2189Ke/8iGLp/SUfjIR6gn0UdEj+rKqVYGPhIBIRI
	 MLyskeXdINxS0bvR5fOfp3YlpdaQT34zpzuOgali89CVepDMfY0YBHzBYd1Y9HnjeJaI+
	 GMVbrO6GlO2lLAdu3ZDcNEb6d235utusdfNLh1k7QsmN6LCTKBzLOM8+eiWzqIY3pig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J9bo27w1tv3uLc7xIWUJEZ/K3SLyBdVdWXM+xU9HBfw=;
	b=OHIGnGwl0tfehZKl9GhGXE6JzHJVCb1O5rPD5fOe6Jb9/7KSlJ42+VEoNYw8DYbAPCWU
	 o9vHo1RxESozLTmGbge0MvH2Rc2yC9qy3fr0z0DFWicOBPffBYC8sgWRY5ChqxCciDEi/
	 QPjfZZJPLchb/JDpuJp6UZnxa/Pq+uZK9koCHLwUprpokdrDI5lj49R5u9PTAdZy+YmB3
	 d1zKwPOlhEdysWYEnqGXPAsEpBWBW8yI3Cbd0ClBdkGLDsLIXRZe+O/P2EG86Exe+XrKU
	 hNH9a0vq22/Aja0QRVVN5KcMOZGWYceBhN7XtAPwKcNRi5yNKETpLJC2HoAG0haZNBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZhAgQtd1;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C060A5BDD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276C060A5BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZhAgQtd1
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so60549eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537730; x=1795142530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9bo27w1tv3uLc7xIWUJEZ/K3SLyBdVdWXM+xU9HBfw=;
        b=ZhAgQtd1DgbyePNCAx4ShfZbat3pMUWupyCr+sIK5tekpz6uXxvS7GV0X5IItQawJL
         bi0gwOK809id9Hxfo9oGcO5tX9biL3A9HWU+ntj+EYJSkDhvf9gp3PMPzjn/qWeSVBq1
         0fU3nErKMMiP/94fkZ1S1DGfoaEhTHGoyBB7NsA21laQfjp9q4v6l5KZ/kX5ArYweZVS
         38HQP4wrA/tJf9D2Gmz6iXhU+O3x4Bc9cIf29cBmCuMe1+lQy8qPyJKC5vHBEUlIsSe6
         A2p3SnFhQtrT42tSiJKp/UljLxdReWg34NPQ/2ZFJuiPQI8FSZPi5wPBd1UkMw7ibLf9
         v81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537730; x=1795142530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9bo27w1tv3uLc7xIWUJEZ/K3SLyBdVdWXM+xU9HBfw=;
        b=1LN4fwWdf6u0xzInkjSwRq+PEp50OaYN8fdw2/kZIUpfifzMzbjRN4LBxVLUK4vblE
         qCB1h4n82T/bx1mcaGvcNhBRN2w+pxkrn2PwSTTN1uMJ0WRxNj7e/FYAcsJYhoyFAfi9
         q2dBQnVFfL8SotgFePZZBcGmH28LprVxEMnO+XP8c1vIi1b2QHKbM/+fj9boPFtDjSaB
         FcbjhIApgHMvFZ4C+bFGPiVPNc3TYWPb5zcde1nUMDRiuVzZX1xEAFbyQinAumnEOhJp
         EJCxiXwRN9ow5f3HRyvORCVGJLZh/Rknsj/LyqF4qnYwR8Z0nidW0bX+Wc7MInAL2EKt
         Fn4A==
X-Forwarded-Encrypted: i=1; AL+hErFcujM4ypdWZEho1PUfaBG4yuGBFoavce9Pp6o0NECENqevB91p4O1vRUk4P1xEo6PRuy0OxcHaBNXxPaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dK4VW9N28spEzJrtMtmYGIffu5J+Jzet8Ezvpm3nGPZMqWrFU
	iXjB43usO04N4u1UJ8mtIlwwaJAdY0W3Q/u0Ck/osM3UdypGYSbTIy2f
X-Gm-Gg: AYBFou2TCImkNSVXrjw+4zbuPg4VrzBsoKsEItkR4+bvJPDNg8fXflflIQewJeFbgrz
	s9j52+qmA2ckt8vrCfRIOZ5W27FsPogIf1hWLuuxyejbzR0s8/9mLXrFLyIKU6vqvkKSsfwpF+W
	3zHd6TA044T6Fr0oiAXGV+AWsGGkBa5SJLXAkym68fLixJlKdU1i6Wq1HPz458aPQh5qxvi4yYn
	9O+OhWQ/x8KhvXsNeRR6UL0h1/vgYEoRTmz+955UqwYR5FGGmRqBsK5GI9ZvqH2uzNKMsSM7rSY
	ukOJPflfwwDqUUEHaDft2nt79uKx2vMScV8qymrH9gymI4xOjsyRkOKNX7HtGyyATemlbAibUkA
	UlXl2G367xP6HjlIyleOIr4BFEq+gAaUK55Ez40oFWspFXfZ1FMBxByBSGsUJSWvO+fJUpczIZs
	8Tpuz9c/DRwCZklfD4YQYhcrzO3w3DgrQbu7TbWBlr1VnjA27Q2uEgRAg/xtjAPZeI2iwIzUWWL
	h6dw+gazQlywpr9qA9hZeR8QBGB18WZhPjmedihL3FTEj/HukrdlNstxW7xHfRN8of/lFupWWOH
	HXg7miPRTSWEL3mVGU7MpWXfxqb0DbGqAG+p8RFG4DFyjktZ/qkIMqkLM+FVCNYwmEVV5+yqxwq
	Lhh5ceet/x1wZzOqLb1HwkhthdJjNDMQx0RWxXKgxj6uQoZ7BHdMqMigf5Jo7NKIrotXvP98OZC
	9z5EU57BH4Zg==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr1903689eec.2.1794537729999;
        Thu, 12 Nov 2026 18:42:09 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:42:09 -0800 (PST)
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
Subject: [PATCH v3 9/9] media: ipu-bridge: Add a rotation quirk for the Surface Book 2 and Pro 7+
Date: Fri, 13 Nov 2026 11:40:59 +0900
Message-ID: <20261113024059.1087031-10-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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
reporting a rotation of 0 [1], so the Pro 7+ gets an entry too.

Tested on a 13 inch Surface Book 2 (SKU Surface_Book_1832) with a
7.2.12 kernel: V4L2_CID_CAMERA_SENSOR_ROTATION on the OV7251 reads 90
instead of 0, the colour sensors still read 180 and the orientation
controls are unchanged.

Link: https://lore.kernel.org/linux-media/6ae0f151.0f9a9df6.1cace3.5239@mx.google.com/ [1]
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5e419c7b9287..cdc6c8fe30af 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -303,6 +303,32 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
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
@@ -496,6 +522,11 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
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

