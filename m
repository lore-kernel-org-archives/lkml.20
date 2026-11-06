Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980529;
	b=VIuYbC12xarybSBU7S7wSOGnYw2h81VbryVOmHpNgE2U6xf3x6ZyH0U55QGsFMgqGvqN
	 3XENJmqtEIBHgU5ecK9FDMJXxaXvlKlultNSLurNng7WTOhWu14DGrFwppoosUX9BVZcS
	 qt6zlT83s4IvMUxhUsKOA2QfP1N4tdchaSXKjV5HwfSLBrynNnR+j8Xi3ek5JzJWPJS0o
	 xsfwzU3WRdtE2YYtRW2sqce1I13M1ff6QzCMZ3tlSR+Xt+IRddcdR0IJkw28vJypOEgS3
	 v1xiqXCdXwzfO5eBuXFW8nj48d+2wd8FOowT18U5Gx/smnoC3Pvcn7Fqy5U93LfpxUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=o9kbdoBsE4U8B/2v2AZP0fcQdT5UCzBPj2wIoqruvs4=;
	b=fCb4Ybb6WW1KeMii4GkGWfd/iioEeMv4G5HolQvOSUMLTOVLp0AqyLdwPS7gQ67Iq8RL
	 ja6Ybc5nk8NOnTMd1iK7M9T2JAxmbBCMR9+Zp3cm1dG2bOFKteClbCM4R0NGnrO29Z1Qf
	 FoUAPR5wbbsrBpMtHjxaqwzvR1HK3MLLMgzL48LhGIMnYGLM7hrGuAkTeTImctC4f6fTZ
	 pNBFJ9+MVFGGktuB08cj2YuEDxEbrW0B/01D8wyjGjYKbb1yCT9+jr+JBtLOzI29W/0L8
	 IDqFK4yHdfls+MmAxohUdpjuxmjM4A0EI6Kq5WDgl9tcnDAV38/9OY77JL7hUUOuJsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OvhWqfKe;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270B606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B270B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OvhWqfKe
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4910b863b84so1323056f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793980527; x=1794585327; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o9kbdoBsE4U8B/2v2AZP0fcQdT5UCzBPj2wIoqruvs4=;
        b=OvhWqfKeNlNBrueqsKnaYRAeQPjoWvwmd9mwEND/vwmG+jm+NDNInHisaJfoIz/EBC
         4WXVVTozXz0azIu0+5loTudCJuxf/t7UP1vrsp5aXLYBoGoIuWHa5FSjFDHr2YdPXq2U
         OxiEi2Yzz7ByRPqueo8Jk35tmvwubKhLo3mDhoxxofTaKYYQ4wrs7y9jjZJqMCP4d8n4
         rG5ncxfJLzqP93+TfhBvcbKURXCXQ3dXOjo+IuLJvdkmduTY12kpwAk+Dwyow8XPuCgR
         iRfSQBgKE6Da2tZwJN4uJ++ReYCEF5WCq0CSNGz29J4XsouZ9EjGZNqNAYYnFBe7uHlb
         xB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980527; x=1794585327;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o9kbdoBsE4U8B/2v2AZP0fcQdT5UCzBPj2wIoqruvs4=;
        b=M5FThPFm0O6yPtU7jz/i3CsyUFZNPp92h/Z+1bYd54RjVyxUdIEXNc7DmjWSgNPVgX
         i7Ayc2IwICYJRdtw9ye4chMkF9cefz20n7nCGkRdAAezNTdGAekD10EZTu39HkCcARBQ
         UPFi1v34u9+cVmc3kTnp6p2JkLSmvu1UhSoCNz1MqgdEFAK6h4cDwMA+5ZvFnf3WiXiy
         f59p6PXso2zNz2p4kJXqkY57T18u3EQ2imMj05jTbUGoSi502nas65YgC4HTrYDLVN3l
         KffRnv7Z7uYjEq58MJ/doFMLAlZf+Gl1D5R4Qs/JpKzmmax/eftXHSgWu+e2V/Ofjs/E
         x+GQ==
X-Forwarded-Encrypted: i=1; AL+hErHfJY0fZCHYG2q+4uX376qqdUsK9d1MrWG6gEQBKK6O4HpTbvgMKgsrdQ/gnO8cK0m7+PPnXlYIwNcsJFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+soKPlJmPZLTLFZo3JCSUBhFvP7DUIhcfHCI7Iqjvu6r5SlzUu
	G5XMIOaAHuhOrP4cXCHJlRYjGF9bG5/YKDnPgunVvlni2A9Nr7m3mTtFQjFFym6HAgQ=
X-Gm-Gg: AYBFou1Jj5nVowngyrV6uHHW31VHPLHzVA1yIsyTINnUE3KOy5VkEZBrzw1Mk/DQ0lZ
	R6UQpft/YB2OvVmACCIVN9b+B/ynv9OAeJx3w80nwgwnbsoqDGy8vDfj+QfwiPh6HlxB8eSJ6mY
	ZJyTB6SgoCTwHEMRNT7GNEX68kk7qo6t6F/YPEwpmuRJY9kQIBVQhad2LDF6wVmnFkhsjjwiSau
	IVb4/P1+XCTwF4pGeuf+o3b8ic+5o0RN2u3hq0UmDLuDrTBbOgUMCpMxmCBtMcb28fA3AFGJnj4
	iH5BAFcw1BQlu5lDawCbi8wzEDfDNtOhh/p8V+CiaYxeTe1fPMXTEOQkr5PY7jHPrYH7GTsolKj
	P6j//b7TF0lqcmTj3jITpsVZ0hIjwl4JUanAC9Pta0iiu8V+aVGIFelGEdTQzk8vwvT2WQBfhmz
	NFq5UUbKLka/7gbCmX/xqIzb8N5UfL9dbhtnCqzQ8zxm9D85Cc/hOJT/lObEYgpmaZnRPMF71Li
	WktT5rJYvFQ8PcJKjYK7B5ua2gBGSlY6y30MudaIpcrpU2WS0XXt5X+4WQSwG5/NE3nRvI3sima
	tlLJXSqGm3IwJ7CT0FS3jiGTDEEOj4DZZ6XXyt837mx7fali9fKIk5l/s7QInegGeA==
X-Received: by 2002:a05:6000:2893:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-49115c978f5mr13236722f8f.1.1793980527027;
        Fri, 06 Nov 2026 07:55:27 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:153c:4b80:6e11:422])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809ddbbsm4492288f8f.53.2026.11.06.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:55:26 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 06 Nov 2026 15:55:16 +0000
Subject: [PATCH] mmc: sdhci: Use named initializers for acpi_device_id
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-acpi-mmc-v1-1-00934babd69e@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3cTkgkzd3NxkXfOkpCRLMxMz85QUCyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQABnyAqbAAAAA==
X-Change-ID: 20261102-acpi-mmc-7bbb96467dd8
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hu Ziji <huziji@marvell.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793980525; l=5528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wk0vJLpQ6eLGpzrrOfKv/kURpO3tO1+Cxw3RmtkJnps=;
 b=w4MPYYFZwmLZeAw2/+63BAo7MARTNN03UeXZvJKjaw4YFtVxwA3b1mxsR+J0DpD3p+f2D1Jpj
 EchWeco3koqDhaHCp0G1RXvxaQT3Gf186PUHp5qnBqR4NFHcjXSlAcs
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

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/mmc/host/sdhci-acpi.c       | 30 +++++++++++++++---------------
 drivers/mmc/host/sdhci-iproc.c      |  2 +-
 drivers/mmc/host/sdhci-of-dwcmshc.c |  2 +-
 drivers/mmc/host/sdhci-xenon.c      |  8 ++++----
 drivers/mmc/host/sdhci_f_sdh30.c    |  4 ++--
 5 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index 84c7054607fc..e97c33614fd1 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -704,21 +704,21 @@ static const struct sdhci_acpi_uid_slot sdhci_acpi_uids[] = {
 };
 
 static const struct acpi_device_id sdhci_acpi_ids[] = {
-	{ "80865ACA" },
-	{ "80865ACC" },
-	{ "80865AD0" },
-	{ "80860F14" },
-	{ "80860F16" },
-	{ "INT33BB"  },
-	{ "INT33C6"  },
-	{ "INT3436"  },
-	{ "INT344D"  },
-	{ "PNP0D40"  },
-	{ "QCOM8051" },
-	{ "QCOM8052" },
-	{ "AMDI0040" },
-	{ "AMDI0041" },
-	{ },
+	{ .id = "80865ACA" },
+	{ .id = "80865ACC" },
+	{ .id = "80865AD0" },
+	{ .id = "80860F14" },
+	{ .id = "80860F16" },
+	{ .id = "INT33BB" },
+	{ .id = "INT33C6" },
+	{ .id = "INT3436" },
+	{ .id = "INT344D" },
+	{ .id = "PNP0D40" },
+	{ .id = "QCOM8051" },
+	{ .id = "QCOM8052" },
+	{ .id = "AMDI0040" },
+	{ .id = "AMDI0041" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_acpi_ids);
 
diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc.c
index 35ef5c5f5146..db5bed2397f6 100644
--- a/drivers/mmc/host/sdhci-iproc.c
+++ b/drivers/mmc/host/sdhci-iproc.c
@@ -350,7 +350,7 @@ static const struct acpi_device_id sdhci_iproc_acpi_ids[] = {
 	{ .id = "BRCM5872", .driver_data = (kernel_ulong_t)&iproc_data },
 	{ .id = "BCM2847",  .driver_data = (kernel_ulong_t)&bcm_arasan_data },
 	{ .id = "BRCME88C", .driver_data = (kernel_ulong_t)&bcm2711_data },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_iproc_acpi_ids);
 #endif
diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 09702022e708..113a9399d7dc 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -2400,7 +2400,7 @@ static const struct acpi_device_id sdhci_dwcmshc_acpi_ids[] = {
 		.id = "MLNXBF30",
 		.driver_data = (kernel_ulong_t)&sdhci_dwcmshc_bf3_pdata,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_dwcmshc_acpi_ids);
 #endif
diff --git a/drivers/mmc/host/sdhci-xenon.c b/drivers/mmc/host/sdhci-xenon.c
index 046e8100dd08..2e4926e722f3 100644
--- a/drivers/mmc/host/sdhci-xenon.c
+++ b/drivers/mmc/host/sdhci-xenon.c
@@ -700,10 +700,10 @@ MODULE_DEVICE_TABLE(of, sdhci_xenon_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id sdhci_xenon_acpi_ids[] = {
-	{ .id = "MRVL0002", XENON_AP806},
-	{ .id = "MRVL0003", XENON_AP807},
-	{ .id = "MRVL0004", XENON_CP110},
-	{}
+	{ .id = "MRVL0002", .driver_data = XENON_AP806 },
+	{ .id = "MRVL0003", .driver_data = XENON_AP807 },
+	{ .id = "MRVL0004", .driver_data = XENON_CP110 },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sdhci_xenon_acpi_ids);
 #endif
diff --git a/drivers/mmc/host/sdhci_f_sdh30.c b/drivers/mmc/host/sdhci_f_sdh30.c
index e9b934e159ad..f3d0a50d1a6f 100644
--- a/drivers/mmc/host/sdhci_f_sdh30.c
+++ b/drivers/mmc/host/sdhci_f_sdh30.c
@@ -227,8 +227,8 @@ MODULE_DEVICE_TABLE(of, f_sdh30_dt_ids);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id f_sdh30_acpi_ids[] = {
-	{ "SCX0002" },
-	{ /* sentinel */ }
+	{ .id = "SCX0002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, f_sdh30_acpi_ids);
 #endif

---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261102-acpi-mmc-7bbb96467dd8

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

