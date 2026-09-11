Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337125B0A5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103188; cv=none; b=TgRyivGnvrQz5H+KRH+kDZk47HsWqGZT1nLrcd+oPJr+eTblo90diuME3NNrXfzyv1R1Szx7FRQQSEIeWZwf3d4/nqsZrJPXG1NE7wg7QTY/VQk5iQy4WeRdK/F+xSNaB151iFrb4GLKEJhTMvb0EJXLvlf1xNM6l83BhS0DlP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103188; c=relaxed/simple;
	bh=Zkrk8H561//bKn1zq+L7f8BS2bF7z74ybObzphkesK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCe7J7uwh1q/wluNSPcziBA/3i8Ipdp8wIaszpyyLUDhf2V/KlTVWHEuLbZsVTzQ0NHz4C0OlwpuCzTNisb4tXK6LePMGu3F6Yez38qFuiyBlyjT28Kcppp7MA19mzuBChPU2N0ta0lqO+ZRzhrfdLS92PKQpIoplVEG4Y3E7H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOrtOsX7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOrtOsX7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso624300a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103187; x=1789707987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdLdPpFYXUzWjeezh3fUTQMRth3r97UKUcvijO9o1bI=;
        b=KOrtOsX7LddM521CkfZbSUsYGjm3SXUUMxEWvKEgmKzWQjtTSrtfY2XwY845MBlMME
         QNF4XAW6DGGyY4//mUyDnGyVZDUvuXT0DCS6K6H4CdloKmv/xIamFesf6ei6iN0UAuXD
         PFGoVKVNZlALWbPmLdgT1R4QmA1DKtV0zvXQvQWNFgro2eE9pRDqDXd87VtsdB0c1NwG
         zRArKfsSpeDuQnXNR1GV9CIjQn0+RPk4tpuWskQ8xG3t+1LWk3pmwf9Ol7EgK+u0eOLV
         BsUEDPre3kwZf5VBzCqgJfP8oZaTGIxVdrlwGFuYqB2A/e+lkdTGBKJWbI2e0QlrABf+
         1GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103187; x=1789707987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdLdPpFYXUzWjeezh3fUTQMRth3r97UKUcvijO9o1bI=;
        b=A6kP3TBN2DCKyegmTjTccuw9gKxq9E9EDgKWlzh/mAtH5lLzxVwRYnywJ8XG7Yger2
         LclAo28gk1n6POE+N2llyzEb7u0IJd6T5v/NiyJH+q008fLQ0R6dYyyU9QVvAvUSWKLq
         snMd8OcTz3YjEJ+a4Rbs5edQHd85Ky+adUE4fg61tQCCmCogfUmkyCQcodjHg6tMmHZO
         Kqdqf8ijgJeJO2fKJratK/94VPqKtFMlAXl4olPCSlS7MUVdwjn3U3Ie4/aS+UBJcbrK
         RSnx02/vC4WQilWl9dGBlcr2EfI+Ajhf3OxaMGU5cwrNaa68ilaq2+mlHh5Pvwbf8s4W
         gB7w==
X-Forwarded-Encrypted: i=1; AKwUvBzvTFrim/XlhnZowF3xL4NNouJBe6PjlxTGza61L1dJIoSgfSvYbB9rAhzGp9oqIv/rwg0TipVuo4oV7Uk=@vger.kernel.org
X-Gm-Message-State: AFuF++k/100D7AsEQkz3fVczvpRvgB6CZ1FiDMv3H8sh9gOx0HQ/f1sZ
	w9AjU2XZ4BD5DyHHSe13aqY7NPFarVdkMXsbdco1pqYTc3pbAbHr4nqB
X-Gm-Gg: AYBFou0gipboOpgClU5h/4Cj919eA06bWW7j0lgA4HdFxKZIhahQLv3B6wIbYXsUBzM
	hfdxUA+VhK0BC2ZdcXNCV0LJIPwOJu2plLySIzhGB7krHxbmLxJtaOq9baIulaas8K3Ujz4tr6o
	hOITwg3EJP2pMTQCGIQA9FMbVR0URaDlAujXjfJZtFcMeJnO17JLXCMKAkcQm0l8V9kVgonhenc
	WzV8tfzoz98msqHEmDUGiqAF8qm3EamnQrYdAZ4xaLMYoqN4rxN9FpP52Dp0rQ8CMmc+qLbj6CU
	gZeAFM7KyD1wztJOX8qUuJH/GkzeI/x2zp3BEvI+mUSdFilZvIjDnsJQeaxl7wR7iAE928GNitT
	jTGTgJhh6ZHElBoSkl0fJT5KsADW66rmKaToyrEdbPMmI/w8llX5ZydEQ/MkG358yQnaN60KQSY
	YEEkG6eACB3aFCA5GQqAExzSRcyfm2BNoOwhjAAUG+reX3/itimIBuWiqC8zhI6UTGRPL1erSes
	wHGzVzcfxM/tUbM4LZKi03zT0rqwgHLEmI/1Ak6rR/RV2CXqhlEFH3E8QT26w==
X-Received: by 2002:a17:90b:224d:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39d9b984500mr3979666a91.0.1789103186851;
        Thu, 10 Sep 2026 22:06:26 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:63d1:a611:b433:d4e7:c402])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm2801823a91.2.2026.09.10.22.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:06:26 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH] media: dvb-usb: dib0700: Add Trek ThumbDrive Tuner support
Date: Fri, 11 Sep 2026 13:06:19 +0800
Message-ID: <20260911050619.96465-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Trek ThumbDrive Tuner (0a16:3630) using the existing
STK7700P configuration.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../admin-guide/media/dvb-usb-dib0700-cardlist.rst        | 2 ++
 drivers/media/usb/dvb-usb/dib0700_devices.c               | 8 +++++++-
 include/media/dvb-usb-ids.h                               | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
index 4b76b6f1089b6..d78790562d929 100644
--- a/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
+++ b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
@@ -132,6 +132,8 @@ dvb-usb-dib0700 cards list
      - 1554:5010
    * - Sony PlayTV
      - 1415:0003
+   * - Trek ThumbDrive Tuner
+     - 0a16:3630
    * - TechniSat AirStar TeleStick 2
      - 14f7:0004
    * - Terratec Cinergy DT USB XS Diversity/ T5
diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 6ddc205133939..97d0e2b32705a 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -3909,6 +3909,7 @@ enum {
 	DIBCOM_STK8096PVR,
 	HAMA_DVBT_HYBRID,
 	MICROSOFT_XBOX_ONE_TUNER,
+	TREK_THUMBDRIVE_TUNER,
 };
 
 struct usb_device_id dib0700_usb_id_table[] = {
@@ -3999,6 +4000,7 @@ struct usb_device_id dib0700_usb_id_table[] = {
 	DVB_USB_DEV(DIBCOM, DIBCOM_STK8096PVR),
 	DVB_USB_DEV(HAMA, HAMA_DVBT_HYBRID),
 	DVB_USB_DEV(MICROSOFT, MICROSOFT_XBOX_ONE_TUNER),
+	DVB_USB_DEV(TREK, TREK_THUMBDRIVE_TUNER),
 	{ }
 };
 
@@ -4052,7 +4054,7 @@ struct dvb_usb_device_properties dib0700_devices[] = {
 			},
 		},
 
-		.num_device_descs = 8,
+		.num_device_descs = 9,
 		.devices = {
 			{   "DiBcom STK7700P reference design",
 				{ &dib0700_usb_id_table[DIBCOM_STK7700P], &dib0700_usb_id_table[DIBCOM_STK7700P_PC] },
@@ -4085,6 +4087,10 @@ struct dvb_usb_device_properties dib0700_devices[] = {
 			{   "Gigabyte U7000",
 				{ &dib0700_usb_id_table[GIGABYTE_U7000], NULL },
 				{ NULL },
+			},
+			{   "TD Tuner",
+				{ &dib0700_usb_id_table[TREK_THUMBDRIVE_TUNER], NULL },
+				{ NULL },
 			}
 		},
 
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 1b7d10f3d4aa9..e857e1925ca6b 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -81,6 +81,7 @@
 #define USB_VID_TERRATEC			0x0ccd
 #define USB_VID_TERRATEC_2			0x153b
 #define USB_VID_TEVII				0x9022
+#define USB_VID_TREK				0x0a16
 #define USB_VID_TWINHAN 			0x1822
 #define USB_VID_ULTIMA_ELECTRONIC		0x05d8
 #define USB_VID_UNIWILL 			0x1584
@@ -414,6 +415,7 @@
 #define USB_PID_TINYTWIN_3				0x9016
 #define USB_PID_TREKSTOR_DVBT				0x901b
 #define USB_PID_TREKSTOR_TERRES_2_0			0xC803
+#define USB_PID_TREK_THUMBDRIVE_TUNER			0x3630
 #define USB_PID_TURBOX_DTT_2000 			0xd3a4
 #define USB_PID_TWINHAN_VP7021_WARM			0x3208
 #define USB_PID_TWINHAN_VP7041_COLD			0x3201

base-commit: 6e30287eaf3e41b86dfb86df3b811526693d74b4
-- 
2.55.0

