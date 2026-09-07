Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3883AE713
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806993; cv=none; b=JcsVJO92MoBIqndOZqoh5ecR/Z+cz4XD//7OxzAAZSbq+kdoJ4dLZqC6Kh//8GDcjTKWkoX2woA3vJc2eS+hRZNLtnCc8imCAmJIHIko640s19NwvX9OQS3OASqog7kuTBwaFTTQ3YkLGEOUQGUGvVg9fiSRY/FmnsX2zXlhuOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806993; c=relaxed/simple;
	bh=ZodpAMAOO7mx9Mr85gC+RHAPNg28jdl9sB2SgtEr+m0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulWzrDYgK0kjVToEu26FwEI0c4fviiftvH1fnUA+zxutsNCTltiM5GEetUvkhklXwGPIGuiuNdjojvPfPNXeNmG6u3+wTwfVXZqJS1YY9I6lyLBukM245YjdvRvqK1MMkq/g7ZwNyGeYg/KkR/TwbNwKKnGDUjkNAC+LqJ9dpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZMUlvEU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZMUlvEU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso35521205ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806978; x=1789411778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ft7Aoft2D1ri5AKkzjC8MkTf0nQ/c5VUMxblaqJZWQA=;
        b=NZMUlvEUTScp1kG8G4glfGADwfmmLxbh563OEo+mJI4f0/7+08U/JTolaACBnB9lL6
         8SLcYEu8R1OCSvQIXvieuYCZzqf0Xh4gg/3LJO1q2QzBOy0McHJyqXDF84+d3YdP7C9N
         hMs6cxM9CmDx/toLlH139tolaAbdhVPS2JEg4fQgSObwO90Q1agAK97+iTaEr6OfQrWC
         NejSQ6T7rMyOuDyVpSnP5Y3oRBEiIRdadSAsn2KmPTxCavviZKlZo5xNzBjYNjzsGsOL
         gxDMxfwwMr0lLsSSGaPthzAIQePyqm3RLdtpb5leGG7HunouK61fokpYOfXXwnP69vTR
         CFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806978; x=1789411778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ft7Aoft2D1ri5AKkzjC8MkTf0nQ/c5VUMxblaqJZWQA=;
        b=dYcsPYToChFae6G+wxoBCRZ1snB2NiSSV6J7P/rvz4ImrcnlE2Iw+luesVX51Yrbhi
         kTOTTB7mLWKqftycnxPlmjXPyxyI+LbalTDvkvoZNT9c30mb4n0CaozvNKeTrgYdMu2a
         KyycuxBxjWPhln45GbWSNfqQixn6dTGLwke/rw57oWI803mFL/R4bYidWtuMYLGsdIPr
         ALOgXxo9Yt/5AEZEkf9QJfYze9UxyjoxHCc6aD372O5fD99ma1tNG4JeBXmPA5l4Pg69
         qRmhKcaf7Rraw/ey6jy59X/jk63eUQZLpzfDRTRZofs0pmGUhcO5b9DzZokCfhaMq/J5
         qRbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzucuUt/wGmn1X+LkpWguwCTaXVa+1FsUoGbDEEp3TPnaNfPLQ4iG9KtjlAgT5N/l0wsWVJVT0QhFXxXZU=@vger.kernel.org
X-Gm-Message-State: AFuF++m7WChRTNQXK+OJ87HMSKl5cssKXS+OID2amm5ze0WSWNHyYUFr
	Y8vmkjaHkQw39d2TuqhZT4fFGDBe/WVp4NCX/ffIUyeWOssm8/NMgsSO
X-Gm-Gg: AYBFou15Edf8chgJMzj9EqOsLZ5wuU1lelz/L5I81p6fpVQbNPHXuEQmbfXOj/+NpFb
	SXbRx61ze03/ZF+/SSj+kJ8Sso5VXsmYreZZQ62ezW5B473sTnn/ALXw8ZLLxe2fcLCTCCwTpYS
	IR1gsEEBAItJvkTYJ8Y+9xyBGo7XYs+0SozDFRFk9WPNSUyHlOvO2+FNd5pWDh3TAQJ4LdhX2O2
	7ppuOBQuDMifdMLwKH9r2SKsXjWfAarSH2OD9hhEvw1X/+Pn1tVsoMQqPib+WbT/d+zFGMd8bk+
	fIj6/ymfSnpwcLyNzlvnULALB51A6P61naDTqMYY/xh8LnmQ6DZjDAaXj+oSZmuIN0UpUb5X8S9
	rdvAa8qRxzHnP43t/+W+CemBMBF1trmKkoBAu1tZF06x/jSse05pNwL1MsAW4kCeDge7XYss0OS
	TkkeRD1NdlrQ+u8fyTKcf7kWSlWm0Ul57U04bfVFyxX+pPw+CQqfv+hLTaTPr5Ke1/K4e6/KVTe
	XeLzlp3pq/zZ+RBMuohqPnBoTJwPweQOyJxnmU=
X-Received: by 2002:a17:902:f707:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2dafb0b191cmr286883345ad.14.1788806978362;
        Mon, 07 Sep 2026 11:49:38 -0700 (PDT)
Received: from localhost.localdomain (S0106bc4dfb582cc3.vn.shawcable.net. [50.68.124.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm48545385ad.63.2026.09.07.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:49:37 -0700 (PDT)
From: Berke Durak <berke.durak@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Berke Durak <berke.durak@gmail.com>
Subject: [PATCH] HID: elecom: Add support for ELECOM M-XT4DRBK (018E)
Date: Mon,  7 Sep 2026 11:47:19 -0700
Message-ID: <20260907184719.25042-1-berke.durak@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2025 revision of the left-handed EX-G wireless trackball
(M-XT4DRBK-G) reports USB ID 056e:018e instead of 056e:00fd. Its report
descriptor declares an 8-bit button field (Report Count 8) but only five
usages (Usage Maximum 5), so the sixth (Fn) button ends up as a
duplicate of button 5 and is unusable.

The report descriptor has the same layout as the M-XT3DRBK 018C
(button usage maximum at offset 16, button report count at 22, button
report size at 24, padding report size at 30), so reuse that fixup.

Rename the existing M_XT4DRBK define to M_XT4DRBK_00FD to match the
convention used for the other EX-G revisions.

Tested on a Raspberry Pi 5 with the same fixup in an         
out-of-tree module on 6.12 (6.12.96+rpt-rpi-2712);
all six buttons are reported after the fix, and they
work (tested with xev as well).

Report descriptor as sent by the device, pre-fix (056e:018e,
215 bytes):

 05 01 09 02 A1 01 09 01 A1 00 85 01 05 09 19 01
 29 05 15 00 25 01 95 08 75 01 81 02 95 01 75 00
 81 01 05 01 09 30 09 31 16 00 80 26 FF 7F 75 10
 95 02 81 06 C0 A1 00 05 01 09 38 15 81 25 7F 75
 08 95 01 81 06 C0 A1 00 05 0C 0A 38 02 95 01 75
 08 15 81 25 7F 81 06 C0 C0 06 01 FF 09 00 A1 01
 85 02 09 00 15 00 26 FF 00 75 08 95 07 81 02 C0
 05 0C 09 01 A1 01 85 05 15 00 26 3C 02 19 00 2A
 3C 02 75 10 95 01 81 00 C0 05 01 09 80 A1 01 85
 03 19 81 29 83 15 00 25 01 95 03 75 01 81 02 95
 01 75 05 81 01 C0 06 BC FF 09 88 A1 01 85 04 95
 01 75 08 15 00 26 FF 00 19 00 2A FF 00 81 00 C0
 06 02 FF 09 02 A1 01 85 06 09 02 15 00 26 FF 00
 75 08 95 07 B1 02 C0

Assisted-by: LLM
Signed-off-by: Berke Durak <berke.durak@gmail.com>
---
diff -urN a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -79,7 +79,7 @@
 	case USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB:
 	case USB_DEVICE_ID_ELECOM_M_XT3URBK_018F:
 	case USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC:
-	case USB_DEVICE_ID_ELECOM_M_XT4DRBK:
+	case USB_DEVICE_ID_ELECOM_M_XT4DRBK_00FD:
 		/*
 		 * Report descriptor format:
 		 * 12: button bit count
@@ -104,6 +104,7 @@
 		mouse_button_fixup(hdev, rdesc, *rsize, 12, 30, 14, 20, 8);
 		break;
 	case USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C:
+	case USB_DEVICE_ID_ELECOM_M_XT4DRBK_018E:
 		/*
 		 * Report descriptor format:
 		 * 22: button bit count
@@ -148,7 +149,8 @@
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK_00FD) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK_018E) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT2DRBK) },
diff -urN a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -477,7 +477,8 @@
 #define USB_DEVICE_ID_ELECOM_M_XT3URBK_018F	0x018f
 #define USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC	0x00fc
 #define USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C	0x018c
-#define USB_DEVICE_ID_ELECOM_M_XT4DRBK	0x00fd
+#define USB_DEVICE_ID_ELECOM_M_XT4DRBK_00FD	0x00fd
+#define USB_DEVICE_ID_ELECOM_M_XT4DRBK_018E	0x018e
 #define USB_DEVICE_ID_ELECOM_M_DT1URBK	0x00fe
 #define USB_DEVICE_ID_ELECOM_M_DT1DRBK	0x00ff
 #define USB_DEVICE_ID_ELECOM_M_DT2DRBK	0x018d
diff -urN a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -431,7 +431,8 @@
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK_00FD) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK_018E) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT2DRBK) },
