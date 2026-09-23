Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13A3932EE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178432; cv=none; b=oFOHUhiiYjAtB/YLCXTKX4S1+RpueNUZxxSO4qXM4KKG9RLTwyuj8id9Sx0VkGezA3OqIkWXT2qOWraTtUXWiEp5iOhw23uVqoqRHdF8F76MMgUj9GRXq78tC55xszDa+5A1t+c8jlOYjpvHMhz1khqzTkDGrzns/L5iEI2hQCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178432; c=relaxed/simple;
	bh=XVO6J06mWLfpj7M6Un0o8+TeKp7Jb9GRavOx6vrjjTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fmHj81gUkJHDffsc0Dk53rs4oYHNdV3pEp3zdbSdEXGlqxgU1QBA+b3BMBKkpZOK9NbIbBDUgKH7Xaaz8obQA7VHa12YdO0al3A74Jb36hPC42Ji4Noa5rSzifE859f2nsliAEtgA1jPxq3GE2jrNcV3U3ih7ZZ4AmasKslnD80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=OL6XObC5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="OL6XObC5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso7774375e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1790178428; x=1790783228; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZGi+48YLm29g6ChPmZEqo73QE8c2OeG07oFWP96bX5k=;
        b=OL6XObC523ywjCiKMXZlsDszv83X9ZTpNOWh14jpBQYpOr8z1vUpA/NYGoMehKDSKg
         8K4H761ZjFb0WDem1OfbtnEMFSvEdlqN6wnvNkS3ifwB5tsLYrk99ha1aItxjWCah8Jw
         yVT8G5xvFr6OSDDFMgVlJcNr45LO3scXV9gYl9O1WIdRJX8FFZE+durowd9SA1w50Snt
         2menPnRiGftvxX4GQeK9J/JTIC6/55Rs76xb8XmjusW3xzI3+h5UV/rHIyUn/5qtjrZ6
         AeCeAkXlfqHgtO2rIHZoZrLxKYmXN69B6jkBJ7kT8DyLETDBuwlwb4D1cJ232MBEffwD
         9/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178428; x=1790783228;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZGi+48YLm29g6ChPmZEqo73QE8c2OeG07oFWP96bX5k=;
        b=PlENpoXRW1GaKv3jQFsORkbwClZkneUHnpe3Kq1yZBsdx4uVxTvXZJ64U0PKKRyB1f
         DzBvBIXzOyXqkkW+Ii3u4M/xC5DHT+TYWOEM1UvFlPYlY4qF6uYTMBrbSezNPMNZSvWT
         avrGX2nNCEr97TGjV5hZrNa8kO/itV0/boZYSse4CnjeO3R4UwX5IyZQvqfWiQ9g/ER8
         ueqzm792Lhi5dibVoFe584WMJYnaKxLLgPMgrEMcbfRJjoDG+LBm4rQCC9wMWYJ+cgB6
         OCy2P6uKRxdvtCMSQsXbdKBDrUwDUreCeWnM3RZPvtJh0z6usLLP7fRyc1HqsDHgst16
         xWQA==
X-Forwarded-Encrypted: i=1; AKwUvBz3aCyWg2LYiYgV3UQw3PFKA61UYsOA7Qh5QHGqMCRuFHGeca4iJWe/VPqLDgz5wZ1yF0PxQdModIEA2Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++l34xkdAvAK6nOBw8gdRj08wmrJFtlVATNwtijq4Cnnch/iDCp3
	+xBXGtdFhLvbkQrvbBjWsNWFsQlQVYHWKT1wa5f3/VXcewyH9RpGjb1akgF33OfWlW4=
X-Gm-Gg: AYBFou18gGD+FSWiW6h3w7AQr6I+J4iehM/emQooYfBYrQs3gMNC7XM8GjgEmYt4NgN
	ejNRJ2eAPMELHD8vnEN5s9IHCqU2JUWvUbOKyaQ+1jc0P1nwN353DHHlOviYZlBVvmxs9uYBlOk
	PthpHDF0hwES4t0ANbcfDgblNfZVnAzLITX6G930vPyRZb45kM2NAbAkWaDzdUU+Q7YZcplO6sy
	bYmkPnK5HzY0hxwumkcMT+Q+l+t8ezKoC/7OQeQa2bB2HYCGzZ9IvaZ+tJzFAk6PmGPkzFYmw7a
	gKVjARgiLr3PSXHeikGf4cnjPNXDrc8ZyOa1H4UWZUy9jrHQXSMarxn3NqTo5prOlp+RGXoRaoY
	+Hj+6cS9nF4OhPzX6XznqGJ1F8UxqoUbnhWijDxiwdYBD4ydU79vOl2xDhaJNQZgnXeUhpkZCvu
	K0UE2DKsqi538Bj9jHngvUwGk/eZIHT07qgirH6htZHtFQI0MWPtc2iQQ4f8fMh/24IaLhosZ9S
	sv3/JaJtUdZnPRsYIH4XfCXdw==
X-Received: by 2002:a05:600c:6208:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49fdee0b744mr40622635e9.7.1790178428328;
        Wed, 23 Sep 2026 08:47:08 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:5946:670b:fefb:2ebc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm85846375e9.14.2026.09.23.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:47:07 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 23 Sep 2026 16:47:05 +0100
Subject: [PATCH] i3c: master: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-acpi-i3c-v1-1-2e78ebef251e@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAHj0s2oC/yXMyw5AMBCF4VeRWWtSrfuriEWNwVggLSKRvrti+
 SX/OTc4skwO6ugGSyc7XpeAJI4AJ7OMJLgPBiVVLiulhcGNBWsUKWKWlKakougg5Julga/vqml
 /u6ObCfd3D94/IupB/WwAAAA=
X-Change-ID: 20260923-acpi-i3c-4cc518a8e77b
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790178427; l=3578;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=XVO6J06mWLfpj7M6Un0o8+TeKp7Jb9GRavOx6vrjjTw=;
 b=dM98K8eXKNtZwoIDuKKK7dvMgG8ppYp/KLOox2m0fqs6EbRBkXZesrgZ8BoHM0Eiy2Js6I2PN
 ZAlwOozfk22BZt+Hkx8zPpgmCLMeox2ctCXzyuaGG0tF2IvEuyvJRns
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc4.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/i3c/master/dw-i3c-master.c     | 4 ++--
 drivers/i3c/master/mipi-i3c-hci/core.c | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4563d8761ba0..05584ddaf104 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1934,8 +1934,8 @@ static const struct of_device_id dw_i3c_master_of_match[] = {
 MODULE_DEVICE_TABLE(of, dw_i3c_master_of_match);
 
 static const struct acpi_device_id dw_i3c_master_acpi_match[] = {
-	{ "AMDI0015", AMD_I3C_OD_PP_TIMING },
-	{ "NVDA2018", DW_I3C_ACPI_SKIP_CLK_RST },
+	{ .id = "AMDI0015", .driver_data = AMD_I3C_OD_PP_TIMING },
+	{ .id = "NVDA2018", .driver_data = DW_I3C_ACPI_SKIP_CLK_RST },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i3c_master_acpi_match);
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dadf049bd4b5..5b8d84d0106e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -1205,8 +1205,10 @@ static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
 MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
 
 static const struct acpi_device_id i3c_hci_acpi_match[] = {
-	{ "AMDI5017", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING | HCI_QUIRK_RESP_BUF_THLD },
-	{}
+	{ .id = "AMDI5017",
+	  .driver_data = HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
+					 HCI_QUIRK_RESP_BUF_THLD },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
 

---
base-commit: fe2ec83746e501645709761605c2464a44fd2929
change-id: 20260923-acpi-i3c-4cc518a8e77b

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

