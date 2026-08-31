Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272AA3C661A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174740; cv=none; b=hmLv7mECo0RIus63m33GhzgaFLrFdkhf2XV+ROUYEIQljwWmK3Ketlnm1knXa8sbgrrtIne4Er6pm/z+0SeIGVB5OSi8eZNpTb7nVmjkm36HvEgc8VTebUHB73eWlzW1JelLHEmvGq1K0X9/nL3mSlKvDWF87NjesbHSVupaTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174740; c=relaxed/simple;
	bh=AsOz+oNscCl9RZI3te2sew7N0y+pek6xru3C7aqS9XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QL6tiMHmdapFlRYCILWHKXT3L8YjzBDNh0wTgWz+cc4N4VJoKegxiO9xQ0AiG85qxrpcR6vJNwsNv1cB7nWmwXEc2zVVVoIaE2ad9TYeaWmD2OaO1bkhkzSkK5Ek5BOVxOcFWYgYJV6j/hUJpLO8xy8PPl4IEBYER7lvgDMQrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FSnwQYTR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FSnwQYTR"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b45f2e5f58so2648702e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788174736; x=1788779536; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5ZB320lDl+SnNWGHnW1xzOqG/h1rSK0736CPhMeVKE=;
        b=FSnwQYTRviy92oVyI5AmbFcpP2beHu65BS6bKAIrAz9APJSMeZj2Y4c2lXT5rVRLcJ
         IeqBzhcDCBN8bqoEFZ9Lgz71XPu/QmdJ91eZcYikiZ1kCK4Tzi2UcnU2iJ0WUHokjo0P
         hKUzKB5119DLZPuJ1ae9FaASkxwccsyYuNtHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174736; x=1788779536;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l5ZB320lDl+SnNWGHnW1xzOqG/h1rSK0736CPhMeVKE=;
        b=MBChtykqBcngDAaoTpfeiuWoulksaPdYveI/BPSPrwAymhvU5itHgOXiDCL2ckrQ2o
         9h3yn+Th145TwdGBBLdGEDOsHQo+OAH7Q8dODukiuBSu4rmt9mF4UcVTelkLcBxBaZjq
         Wp1hYElfYqmTbDf93AMN1AVyni/bjbn7hfRZHIsKOxsEDKWnqTJXQk3B1prHjTbbEmhS
         W9fk/pONw6hcoxNL5HeESsHWcN/BtGZIzPHFL/ICI9u4q4D8ZGLN7ghd2cC9rSCkxRjS
         JLDEuHrM53zxOUTa23flY1ZdpRFIf/VU3+wJ8EgKlasNaVge3c9BCU7E0rkC1FzEdkRA
         +h6A==
X-Forwarded-Encrypted: i=1; AKwUvBzxMXR3Gu7oUdkVlwRcfSIjthDFqa6+3wkkrrKzNayx87Ma1p/zEiDFCi1P1gWru7dxgyA831sYMf3b2XI=@vger.kernel.org
X-Gm-Message-State: AFuF++nCQxBeuK3st4C/v6kb5Ef9Y6qsY5A9Ese1Ie2cVG8b5GJ8noFP
	PsT1QPNVijXm97H8Ooi/n1v4To6djpR6aGx3vFftEyO+KAJNzAO35XyhlfuaAio6hnXlZmBSUdW
	sDVFWJGWR
X-Gm-Gg: AYBFou1FycN2BJDQsNNhGGzHdWq3k42Ds8KdM7ShJESjmC0wvPnfJEEk1lj2QldfMYh
	dPwV3KQr3PyvdMQ7LQCnEQ8mMJgbbtFMa337P9QZ1Hm7UwSoMWHbklt+xsFxNkv3xoKGvW+Y+Vc
	Pe2lZrdnGEIyuGUcfszmIojOkv682O27j7tEwFkSQDltv7Zqt2BR1Rm6sA8hAVS/XQgt6d2bE59
	OM3TlArTTzfeKw1fMaV/oOrb0jcuk2XMUbiz8NC+QGrHZltSRSPLTc5KkvbrFJ5WCpj6Rf+VP+D
	Q4DJ3z9L2ap/DVUbTo9S1KO7sfzEMLTOsmXbJRNoILO64tkxKx0cVcBovOlVvevwSLTk+IN5kKq
	Vx08B4CaKasCFIlid8UYYy1KUUSmuGKY4xvTRgA3yfwcYheOMryO8GCJ+BrfUDVy6jisf3w5lCd
	6g8yh4Q6ttWzrXUuPwqxGdo5vOVTvJZinNgLxDj12obO3K+6q8Z5hbX7+N2NWqFjf3eP2TPO9ec
	Tj2WRkZpOgSwjNVyGEOGHFurYZ06bj0uCBrYHWIIQF4bDXeMQ==
X-Received: by 2002:a05:6512:3b98:b0:5b4:a8c3:d26f with SMTP id 2adb3069b0e04-5b5e6907269mr7993088e87.23.1788174736051;
        Mon, 31 Aug 2026 04:12:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89cfae5sm2042767e87.23.2026.08.31.04.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:12:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:12:11 +0000
Subject: [PATCH] HID: Merge duplicated documentation for Lenovo Legion
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-lenovo-go-v1-1-e9526e88ee09@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIphlWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC2ND3ZzUvPyyfN30fF3zJJPUZJOkNIPkFFMloPqCotS0zAqwWdGxtbU
 AqGTbjlsAAAA=
X-Change-ID: 20260831-lenovo-go-7b4ec4bf0cd5
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Lenovo Legion Go and Lenovo Legion Go S share some definitions. Merge them in
sysfs-driver-hid-lenovo-go to avoid this warning:

WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261

Cc: stable@vger.kernel.org
Fixes: 168c91839139 ("HID: Add documentation for Lenovo Legion Go drivers")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../ABI/testing/sysfs-driver-hid-lenovo-go         | 11 +++----
 .../ABI/testing/sysfs-driver-hid-lenovo-go-s       | 35 ----------------------
 2 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..f3ba3504939d 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -364,11 +364,12 @@ Description:	This displays the available options for the mode attribute.
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
-Description:	This controls the behavior of built in chord combinations.
+Description:	This controls the behavior of built-in chord combinations.
+		For the Legion Go S, this controls the touchpad's operating mode.
 
 		Values are windows or linux.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
 Date:		April 2026
@@ -377,7 +378,7 @@ Description:	This displays the available options for the os_mode attribute.
 
 		Values are windows or linux.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/product_version
 Date:		April 2026
@@ -640,7 +641,7 @@ Description:	This controls enabling or disabling the touchpad.
 
 		Values are true, false.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
 Date:		April 2026
@@ -649,7 +650,7 @@ Description:	This displays the available options for the touchpad/enabled attrib
 
 		Values are true, false.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enabled
 Date:		April 2026
diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
index 4d317074bb7e..218164cfe544 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
@@ -231,41 +231,6 @@ Description:	This displays the available options for the mouse/step attribute.
 
 		Applies to Lenovo Legion Go S line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This controls which value is used for the touchpads operating mode.
-
-		Values are windows or linux.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This displays the available options for the os_mode attribute.
-
-		Values are windows or linux.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This controls enabling or disabling the built-in touchpad.
-
-		Values are true or false.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This displays the available options for the touchpad/enabled attribute.
-
-		Values are true or false.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode
 Date:		April 2026

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-lenovo-go-7b4ec4bf0cd5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

