Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49964EFFCD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958847; cv=none; b=UHAXyBoLMu2J5thBpvMIudMHHd+lL+InTegovA7TYoyhs8649siKFRIQAeP0LZb6SbWSfHYF6fL83/9CYx3uCPWFfb6vei0psO7xOAnTms5OESwBdhKoOgpTVAxGAt2rzHALQldJRdXxvb3sKBTJF9ddC9GNmH6XN5ZbJf+M8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958847; c=relaxed/simple;
	bh=pXDjUsyP9AXPKgYAKIBntuVPiUrCnKgs+R2mRsLwZuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4FSv8mVO4wMf+ncUWocUszyyYrgXp03ZPlHhigA+LseXQKqgpoGcjOXhMuLbBx9eXqpNuK65VR1/a/CTkOYzoQfR51LzNsnTZ2i2NK3YWkPDfxyfJCSWTg4gHz8hQj7Z3cRwPboL99Bs4mmHfXV6HG5I7duD/c/la8KczPbw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnGtOV1e; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnGtOV1e"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso590009a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958845; x=1791563645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMm1bZL6Fbo8wjLXd9+f6B67RIZAPtO1SpB0E65HvaY=;
        b=UnGtOV1eLge+lvSlupNRPRoxidCfWrs/Z5ed+Iqqku7aundAhTG1QbFDmwQ5h4texR
         2X2hiChCnDaTlCScPNXty13hzukhpXqzNyx04SRC9G3qUn4nf4SiXrHHKslZxtlU6E/P
         hJzQjRFvLqfSijQdUndllzp7TB5jprWjW2Id+vfCYk8jsmU9gC5XF5MYRBqC9lvOOCRk
         +WOqcm69WgeqLy/EgnJHNpz7jOpBIXJqz47I25AxfrVyO5PWFzd4vOy3XFZXg0LNjNTe
         kNpEuCAp/5hAYPAy4/iASw2YNMfwETJckc1QC/120vWl43nmyP3DZKZDa7veTKJCLPJF
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958845; x=1791563645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JMm1bZL6Fbo8wjLXd9+f6B67RIZAPtO1SpB0E65HvaY=;
        b=2EPAhDcxI7/zRqyMeRrfDK8eMPs1AQLXugyrKUzD9/lQmXmv9sDVOVX0BpVb3MlcRZ
         UAExDXsOE6NmytldWTB8mzQ45OudZ4JSY2m2R6EIjQlhzpz7oFeHeIvo+ByZdbU06kHL
         M8K4IvqkVlc0HlU1P5KrHToPCV57+1SDCCxwEYUJCmEKYnwX6pvT7nh0CzEZDm/FN+qA
         ffMwBh88TOqPFbI0MNzDzpDAKNLyp+Mi+r8E+WIxSmpplpdl+iuPv/emuKN+UuF4idIF
         SHGOe7sOCJvVNYLRW8PvqbHrk5yDuMVD1hUURlygTrXnJyeBUm6bEZHU0eU+D1ovgMXU
         bYdQ==
X-Gm-Message-State: AFuF++lSzPcscmT9SH6Dy0iFcYu8OiexjYdlXTg1jhrgK2mMYEJgvkXE
	4qpcM4b+0K8Pm+ZVWyx2G3lluUpGtLwZx08Ime+Z6F8s7og3y104LasBOHUgB/DT
X-Gm-Gg: AYBFou1xirqBDNNyD5FnD/nBs0jLHHWJln1+CMcGb9NSYaY9f3LBa2+iZ4Mpd/lCi3V
	y5CmNNIGhZbiyqEnqE6va2jrTNKDWneig8OXgwGz6WNNd8cjD+pJnQ1bMfZlb+Z32i5CY0/2RCe
	exyx8F/JMHOGP9Kf5krD4cNExo3OaU9r0zDzhaTtpz40q8lxG8Y4o7odeouZ5L58SgfGIcCYTZc
	iFdt19XvLl7NNqPqUNb9BgHO2m3LlmxM0271onCqaiSA3cZxSHe0E3b26KkkvNB1Y6WOFvImvHk
	KVEEB323SMxnt9qyGs+73oU4R2qfce5uD7uYsQpm0ocbwTXDKQgyXy8wYIQzXh/Pth4EGNMjfg2
	jyz68i7PL1txMzWlXoPbYND/AEdQcoj9A5LO9vtFdsxUxRqlP12IZyd0v1KPQCsRVWqBIwG4NiP
	lJC07MCvEXVDu9f3WKaXfyZptETvnBEFjT65e9j8wUWcgVz+7JnHAq5/7mgPaYZR3rMmk=
X-Received: by 2002:a05:6300:2213:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e0d6ba7139mr62306637.36.1790958844667;
        Fri, 02 Oct 2026 09:34:04 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:03 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Fri,  2 Oct 2026 09:33:43 -0700
Message-ID: <20261002163350.1248431-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "D. Manresa" <dmanresa@gmail.com>

The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
same variable, so intel_lpss_acpi fails to bind the controller with
-EBUSY and the front camera sensor (OV5670, INT3479) is never registered
unless acpi_enforce_resources=lax is passed.

Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
applied to INT3446 on it as well.

Assisted-by: LLM
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 3f90942f3..720adb0ee 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+	},
 	{ }
 };
 
-- 
2.53.0

