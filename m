Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793512120;
	b=jVg7Tzu1Q6aSv43Fos7c9AxVl9mrqd5vYX3EuGpS0swzMnypPyRtowC+CTlrc913R7k0
	 G6Rd58o0WKjjJsxAE++NWq+45RUHlPWxg2ZmbmydxvD9MLH15XsZz/QdVWQGcXdreVxh6
	 04YwMJX9F38TNZNFquzVISw2J4MW4AhBzsoeK180dU2FNirx40ikW+s+WCIWtBKhwQ2/3
	 FKpIOPNYruua5lPavGZ90Bi8hjPR9HJsLc+9qMaZMMSTaOLlMBmjI8aU6fb6efrQzm6SG
	 0qm2QV0NBNm73Aeih/6dD/F47gTJNYLjnH5VQawmQdq2ibuLvp4xRzfZCpIubR1QxEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793512120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BQb0A5w/TIxC6lzjJIWIQRoZPxtk3+ao0g+gODR3ezM=;
	b=GoApQYxVpkraC/RX0Kf9womDqk5cv7P53V0GX9WcaRZXZaVnwXfZXyXJVE0H3GYilaiD
	 NiZLF/uH96UUtQ3SEtxVatZgm3+UaIukWAm61NMVzdXvkSuBtsSY6KSJM8ijfNujOTq5U
	 8eIS0+R3L/lxLTWpxGyWtIsRekJ3OiKFwZ1LAlxqPKtQdplJ75fZ1h0Z4wxO134GOqGKs
	 oM+LizeMDPKl2XkSNPm+Y/nPlJvc8avOxnARZJWc+CfIMiDaRvLSUwALWCAsJTz/4d9Al
	 G98HFG4tLBGYiXZsPW4WYRytpsYn4kjI5a/Pt2WoM7moFsO4Gn/Pce4BUwy76FNgTAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOl9pIRg;
	arc=none smtp.remote-ip=74.125.227.8
Received: from mail-vs2-f8.google.com (mail-vs2-f8.google.com [74.125.227.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A135606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 05:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A135606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOl9pIRg
Received: by mail-vs2-f8.google.com with SMTP id ada2fe7eead31-7cc2f11026cso635733137.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793512119; x=1794116919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQb0A5w/TIxC6lzjJIWIQRoZPxtk3+ao0g+gODR3ezM=;
        b=ZOl9pIRgZ2gEt1igLhIQtZ+2nDEKeKhEjIQQOmGCNyeQa5gB+pzfXlpYmlS2L4OhsX
         DnZtYAcxB/UMQt0p5n/zXDqgVZ89TrGN+xIBnz4cjPH7zMzf4H9rSeYhttSF1Lcidryx
         eAtSNDOglJXpE3dv2TisasVYYW7zVpEQVEaxe2B/WtfaiYtDIIBzExEx8p/sRIGdxFaa
         H4fGGg/auZNOXMD39WOYNJH0QptTMB6pwR75+vhc/PPg9N3ztgFOH8TT3YovHyTefrXD
         Y3O2kV8Fv0Gomyej0dsnY0tDGeq6BHwgDDYmJeiXDZj0FySxzZ84OXVaBiMoBXEj7b2N
         TICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793512119; x=1794116919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQb0A5w/TIxC6lzjJIWIQRoZPxtk3+ao0g+gODR3ezM=;
        b=c4jaaxDyx31+NfbdQGUnpNUBM49PW+cSZ0qANm/PK9sxZi1+qJ6L+QAjTxaltBtMqj
         /IAzFGYhTLZUTE74go29xuRHaw4nXWE9iCjXnZV9hDHI2jO49eFa74x3tynZwzuqQP7N
         FQMJUlSfPBNjY8w9qTib34MEE6Bwdj7Y+7fJ+fYq9vd/5ih3YR1ZcnXqMzpQVHA5shOl
         oHl1E/S3qDwi5PNyl11seFDssJsMJ0RnhzhvLytAFX656y6LMn+VaUKhJ8Z7CJMvmrZD
         RUAm6BkniVcIG/2+DoZ1ePaDvfgqMTz8hzMwbE+kwx61uzEe35erkMvXNT6leUJ6oUHB
         5UFA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ/MBXbTdhXQs9jswe4hqwf5HLKFEFeOdZG9XrmGNtcqX6DEzLY/F6G9/DmYLh0zw64BXld+9CaagZ+9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+YPtdUDrPPlfQ7yZwcDvhJcoJz+8dfV2OWkJRH0bYomqUdQ83
	zLkRym8ZQxGmibsrWbVNSSZz67T1gixEUwPDNpHFV0KDog4PCFxxk/Y8
X-Gm-Gg: AYBFou2Xz6wsaGh6qBVBXsB8h1K3H63Il1HB8Xsp2zdlyioLbU/SsMG8OAy5W83heNf
	x5rT29FE6WW66Di1KouTGIb0qzWSVI3dvIRwf3HCqIY7J3q6uNHyKYx+shFc87APYY1pOMrV888
	X9oWJvNno2vJSrTFYt2Im/aNJZq3VX57ob+GnIxIxUg0JdWjP9M6275IuiGHckkocDwxZWbPhHL
	A/j/B61wBMpGsWn6TzsIjScOPUNQ2l8ZHPi9uQL5HbX0X5/Q5ViAFmn2vWhcP7JwauY0TU6Gukt
	QC9tMsxwsdRPlYFeGTHDwoqxXZbEvglDE78qvWC8t4DccpE5f/8z15mGLlyJ0vZl8wJpeNtKbor
	Pgk85KrJx8UFNY3K7NZC8a7DjM81vwRyAsZUOVtIkSGH8xG9OuVcYtY2wpscQpETJQyPCvd7osF
	LPEUis3iSljiUVehPJIzKryVTitaD/oeIimS3DmocopyOjsYh2FSO6QEF0H4YY0Bq+kVwKXFTif
	117xycuag53nRoXb0wc0WWyNMp+7hgw1ryloipWFtjsOjZqtKt+SWzXuZEFX2h1bS4XaUEilIiO
	Pz9IFpS0Pjq87E0gjui+wCHuxb+4s4uzPjL7u0w=
X-Received: by 2002:a05:6102:5712:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7d072c56c97mr2848817137.21.1793512119388;
        Sat, 31 Oct 2026 22:48:39 -0700 (PDT)
Received: from linuxmint.. ([2802:8010:9a2b:a201:7173:4fe:efa8:f823])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee41f108sm8591353241.7.2026.10.31.22.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 22:48:38 -0700 (PDT)
From: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
Subject: [PATCH v2] HID: wacom: replace sprintf calls with safer alternatives
Date: Sun,  1 Nov 2026 02:48:30 -0300
Message-ID: <20261101054830.291749-1-nehuenlian.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101011439.261812-1-nehuenlian.kernel@gmail.com>
References: <20261101011439.261812-1-nehuenlian.kernel@gmail.com>
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

Replace sprintf() calls with sysfs_emit() and snprintf() calls in
wacom_sys.c, which are safer and avoid buffer overflows.
Also include the header '<linux/sysfs.h>'

Signed-off-by: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
---
Changes in v2:
- Use snprintf() instead of sysfs_emit() in __wacom_initialize_battery()
  as suggested by Sashiko bot.
 drivers/hid/wacom_sys.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 628372ab818a..bb5bb9c15f93 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -6,6 +6,7 @@
 #include "wacom_wac.h"
 #include "wacom.h"
 #include <linux/input/mt.h>
+#include <linux/sysfs.h>
 
 #define WAC_MSG_RETRIES		5
 #define WAC_CMD_RETRIES		10
@@ -1838,7 +1839,7 @@ static int __wacom_initialize_battery(struct wacom *wacom,
 	bat_desc->properties = wacom_battery_props;
 	bat_desc->num_properties = ARRAY_SIZE(wacom_battery_props);
 	bat_desc->get_property = wacom_battery_get_property;
-	sprintf(battery->bat_name, "wacom_battery_%ld", n);
+	snprintf(battery->bat_name, "wacom_battery_%ld", n);
 	bat_desc->name = battery->bat_name;
 	bat_desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	bat_desc->use_for_apm = 0;
@@ -1928,7 +1929,7 @@ static ssize_t wacom_show_remote_mode(struct kobject *kobj,
 	u8 mode;
 
 	mode = wacom->led.groups[index].select;
-	return sprintf(buf, "%d\n", mode < 3 ? mode : -1);
+	return sysfs_emit(buf, "%d\n", mode < 3 ? mode : -1);
 }
 
 #define DEVICE_EKR_ATTR_GROUP(SET_ID)					\
-- 
2.43.0

