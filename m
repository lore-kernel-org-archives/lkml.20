Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F231A42AF85
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502808; cv=none; b=fBbYjH2hn+ms+oBgSYzHOFMBqwA9hgBF16WNvWtdsrD+kRjDJCS9lCT42Jug+f0aDXW5RxsYvA0DkRTFBYRpeEw/DLwpXv3lPFb4NKwbYMMsmR2lKy55mD6LjAbGZ8mXsUypoMdNt4OGXplw1nAIgc/K4lpN847itJI1g8o4+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502808; c=relaxed/simple;
	bh=v8ICbm5r9amryTs2EIqE1IFZf5CeVonmaXa23UEE4M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MITWCQRf+WA8va+f+HumgRftR0JvqUEHU6HSqqNqoXf65s6Tj1QOamhO70QuKLnW8BMZ6ZJrWkMSCVh7HJHjWkLut8ExvybU48mu4Ax/nrO+FGlu7sU3NGTOpJ7sY/Jvl2i4XqQ9pDIk5IkCS7KLNeXJKuCK1ENENcQxOb7mwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8zYEkwS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8zYEkwS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso4980505e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788502805; x=1789107605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPuADPWeLJud53uHe4FYPhjdo7U6QwRywJbeOK0xUVQ=;
        b=A8zYEkwSJyyYMP8H3ktjmevC7DrnJzSK7gBXsnX57xcy2EKaOCa2j5Y72f0SYg+ZSs
         7M8QqAw5aIj0BIGZorCD2LhlNnmBtvYDVBDR0TgoYasLmOz1k6kOBZ7pfQ7JlfNhsotP
         ERdM3bmZXn7q7h0H0Swq054iJ6qJtYoD2HvN1c8xk05u/XfUnIO03mOa5RCscUsJe5Ly
         SwDqLHfaa75ijg9ZZ7uJDoD4ruqHBUqBmXJfkxvgu5Sd12lAMochfQIROUAT1f1lgh9F
         N3x+Ho8fbztnFDl2jSA1i6mdNEXjLsW/3pifm3daruy8yKX6mT5+xX/IwuurtOKwqtqD
         dx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502805; x=1789107605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPuADPWeLJud53uHe4FYPhjdo7U6QwRywJbeOK0xUVQ=;
        b=Nvz6R8ZLjsLwEbkafb1YYsnf3J4D6BpqOQlvAvorXdQJXw4IbIWp/4Zj2NgMue0ypm
         S/xNdUDM4UcgxssEgXEZZ4U9L+31daTBq7xOPwGumL6WDziTHQe6OcuBPPJKPXOW0Kt0
         0jhLZ7+ysO40gVvxBKPv7u3F1Z0K9yaNQpVsNHjIjcKs2lii5gVjfNI74vZN59ibVNSK
         tPsRWkTjws55En8vYJlM49cgunmxsnGST/ER3gWU+mNDCaaatQywlSU27UusT/aY8yK3
         0oTpY3ToZy1gttG0JdSOU+RtW0bECSFVz2YQZd9P+CLi73wy6BqRZWJkVFStLFDoeNmv
         QtCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc7eBo/qhVfvmW3HRP+p3UwE8/O7HKwrIbZ4w5kRyl5FHzrPJf2sodI7GtVVhbC56KO6lKIrdCiRj1wx4=@vger.kernel.org
X-Gm-Message-State: AFuF++mlbkHaeqSEfcL8StGC2BsOhhfM7bvRn3MLuBIIonygTfvVXbU0
	OylWa9BAVdeE0mFBoHQTkd1erpjcWjZiugJI8LFbfUEnUTaGohp//5w=
X-Gm-Gg: AYBFou1XOtsKha3epBSUj+iHr5zjXt9oa1pwdGWobBfKJ/5pfpF6QLzX44kErp+F1c9
	PRAdRPGYBmU2yJnAT3tSNr+04i21FjbcxcICCkodWguaveYeb2dqhL48IBb6ilZBWJDdwP0nh5a
	q3D6ddhcCwHkgOaI6auIxXDwMLIE/EunpXm3przsKetgn9/4M6ZVx7eb+GGjzndgVe7PIMikKfS
	2ZlGJ69xE9UJiNGBI3yXSrOhr+QtMCo6mMaX6otXOTeqlrXyu8Lkl9pBTH3lOkd/2BD3XQySxwF
	8S7ZPfw4K5540aZ1PFqV7KISfI1SFfXNPLI/lx7b8k2segmJJOQUTVifoz8yTSXpffwdTV7SPBQ
	44imWVkYWtgXqyZGcLNb5j7pSFvOQ8iNZSE1JsZkaDqVnUwonS2N+EdBztdEo9IJgFfNWZkfUYL
	HSiN1GVcXEejFGMN+OESZEVIMxNmUbKo+40RpYODauCY3uJEgk/it0WxQlfgZLw5bP7DOjXkF00
	IvLF2JBGC/6njXLWfGc279z0ade8AjcxvqC8VutHx15Ck8h
X-Received: by 2002:a05:600c:348a:b0:49c:fa20:cc03 with SMTP id 5b1f17b1804b1-49cfa20ccedmr15378785e9.26.1788502804728;
        Thu, 03 Sep 2026 23:20:04 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d4938sm128959655e9.2.2026.09.03.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:20:04 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH] platform/x86: int3472: Add TPS68470 board data for Dell Latitude 7275
Date: Fri,  4 Sep 2026 08:20:06 +0200
Message-ID: <20260904062006.39209-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 7275 2-in-1 has the same camera design as the Latitude
7212 Rugged Extreme Tablet: an OmniVision OV5670 front sensor (ACPI
INT3479) powered by a TI TPS68470 PMIC, with GPIO 3 as reset and GPIO 4 as
powerdown and the same regulator voltages. The only difference is that the
PMIC ACPI node enumerates as INT3472:04 instead of INT3472:05, so the
existing board data is not matched and the driver fails with "No
board-data found for this model".

Add a board data entry for the Latitude 7275 reusing the 7212 regulator
and GPIO tables with the right device name.

Tested on a Latitude 7275 (BIOS 1.18.0): the PMIC probes, the OV5670
binds and libcamera streams from the IPU3.

Note: on this machine the sensor sits on the I2C4 controller (INT3446),
whose MMIO region overlaps an ACPI OperationRegion (\_SB.PCI0.GEXP.BAR0),
so the intel-lpss driver only binds with acpi_enforce_resources=lax.

Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -449,6 +449,15 @@
 	},
 };
 
+static const struct int3472_tps68470_board_data dell_7275_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &dell_7212_tps68470_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&dell_7212_int3479_gpios,
+	},
+};
+
 static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:06",
 	.tps68470_regulator_pdata = &msi_prestige_ai_evo_tps68470_pdata,
@@ -500,6 +509,13 @@
 	},
 	{
 		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+		.driver_data = (void *)&dell_7275_tps68470_board_data,
+	},
+	{
+		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 13 AI+ Evo A2VMG"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-13Q3"),
