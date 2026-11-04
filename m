Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836273;
	b=Y/8Mr4ZJdOPlw3g+Dwn4EC8T2ZLnSH4pRal+9dYjjpIOO8DFyk5mDYG9UnOQEHQSz8ha
	 S9srUTWjDYqQCe8CurupreOiaZIo4IokG2CAO/ZBZxLKtfPAK/M2yJslDk17EwLsbSbMp
	 XIVmEwlt9V8xzIMR3dXHY2pv05NUJW4TChv8TTv6X20NyAsH8wnIXgXAF/q2QxkfmTu6L
	 4DwoDQkxQ8kd8ek2R1rdP+cfP4VGNqDkkdT0WD/Ie68YmNAQK4DMpxvHq+OpOdV9gMP2X
	 5AIl0Hn5DBNjGUFAYupf87cyzSbq9S7bwf0hr+ZAva8FG/sBRAeqhzAqQ01ZrFdBo6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cwbe/XfdA3mX7yoytvk/55af8sErsLEc1FTxPSa6yI0=;
	b=5My7fkpVNr/vSwqFCGd9f1i197XTnB7DJ0PXJSYvVr6Ar87T0PlicMEIHpz9plp4xldI
	 YbJNBBS+cBYTUkdESDx4RtDSme5FHfOLXaB0iYE1opEOFojGW9DzaXxdwcdTNhHL2Pf5y
	 mdLrRrdU6iaLFRpSFWZN59pPpmhi3EOK9gcVCt/8QkQvGbASB4yAOQDHBhD7bbzEiJKzU
	 UbNWEakqcnrVD0m9MYwlKE0jjunGsfGRW0MSqBtK3h/q667Q+HtSvjDxcWgRHA3mlKycg
	 UagqOcxMrxj+KuINIFo/z6y4rD02knhd0woRfjJ1/2oyN7V30BMlRsE6IZZePDuS2+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNmQF1kE;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2F8606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD2F8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNmQF1kE
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06454116eso719480b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793836272; x=1794441072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cwbe/XfdA3mX7yoytvk/55af8sErsLEc1FTxPSa6yI0=;
        b=bNmQF1kE3aFKPO1ntIRZIaBAjUZbGWG4hp0SzTcG4Hn96N8bGgPVm8D6NGrsZijfSK
         aVxtTZnycYxlNxHKrALH/SYEIQqTOg8+8ijbx2UGsi4ONuMf8TcxbUM/v+Tzn8ALjMpw
         92jbLGo0IdTNKi9hpKdIGinD4visJcg7A3BM+SBAx5x6esVjGoJorvso0uvE+7Z5MDVJ
         vjqrYVTF9sbn4lv8F0xW0tkrrEAAi7jF8OSI5sVK1+RqrLsysNKIEiUqjCvmD6vFwmam
         UFGTT4xro/GLVbj9/sY8jYBUp6a/ZPCgXNpJ2kEEPVHnkstDwT4Nauy+VEpL43GrY1ep
         zexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836272; x=1794441072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cwbe/XfdA3mX7yoytvk/55af8sErsLEc1FTxPSa6yI0=;
        b=FPySTRMVCVSXpWSnUPSXOYp7z8Xk7FEGFWrU8DX2GwSr1EpHS+bHxjAVsbvpXIt9C7
         l0Np8JfPlVBOZycfqfjdsnRJnrIsi60epT2vb4cQugtEqUWh5fgyKfgYhScBhLlDyQI3
         Cwfh2FwC8cvJCeaGsYh01Oenw1KyHoR3495w6bpdcig4FPV/h4lt2lxx1Z/ecZsTsyDF
         6j1M6vwIYcTPES8+iLiYN2DKlLnQuK8dXsqVSGfBSa2C5Lsl5+Wjh6cyalsa7MjbWUEj
         W0Ygjqes/MNS78ERnopbQh60ujOztyYdI3p1Z2ZDKhj25xDw6uwOgRrxRa27eiPL86xf
         5kBg==
X-Forwarded-Encrypted: i=1; AKwUvBz75HEBzFcGG2VZua5ttWLdhAP9J7fZ3FBlvkG3YTcoMTymr1iMPyg2k1tWSVpZmOH393WFO++SdeQQL3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z819tEhP9+LoOiU3UqKU6fvOFjzWi+F8JqWoF5kqRcgYOFJYeUH
	I/MJXhInaebxw96rYmhfURfLf6jgGWbedrdG9WkpkFXWpfZu91xhnHlW
X-Gm-Gg: AYBFou2KuLKiWH1jIS466WDIIL0GlH4uNiKfhjo13p/kXh5sgKUnnDdYloOh2TsPGNa
	3Tu1ffxXWu3xLuiV+ZvPVluMactDWyFbTHIgGRU7x/v5SYUQBTA42XnOiLhUi+UT8C9ydZHhl1P
	W0cqbwU0bNAjeI4gSZcz9AefKvjYzbqIMG0L+YBN8rkbvC5Skivcy8ICagIN2xYpKlg/KuzNYVT
	CrGWMXd/DRtEJIswcnNFtl2L4+fWzyORlivN0biPtNug2FFwGveZ4k8hRYWppi2Lq8PKJHMxlmg
	w9LRcztgCNQy1npHVFuixdFsEaVp6AgLe4eDQvaJAFu0U3+3AJ58c+uD3HDUkHuIeWJfvBxQIxH
	I94ODw2SSm0M4anoxnjeNm8CHPWbBoPshCRweN41n7VS0miiK3jqmGKRzacW2iXCm5qJYQxgzlV
	gpih3S8D3xYuhZJlrEhUhV8giCa1kVpqKZyKOI/sGyoPZOZRxMmCONv+0SW3ZM9jqfBpPUCfpBp
	uMf5dK3Zbw7dkD/f0HB/0oium4UTm+3b27sC6bL94OGQ5dlwe0D8ozSjNwBnMrmHLyvbIi5Ehbt
	VgxPj/1783xvynf+VT6LH6kXupywK6HIQ59r2rXJHR6fynpPxYaceYPsaDAC5+DJ3IqW4Nxuh2b
	89MpARPqUpAPQhzaLvzD1NfqVnFr++Zmye2m+o03bYiTEQakCZfHmOZSsyAtxcCSNSP6dqTcGxj
	RwxKDkhsZPeFVZ6Q5MDS7vUGNj517ZqhFAZaoxISOh/Vo6WWtKEFxOLPag1FTBcQ==
X-Received: by 2002:a05:6a21:6a0d:b0:3e2:47cf:17ec with SMTP id adf61e73a8af0-3e928d28b6cmr14923917637.34.1793836272084;
        Wed, 04 Nov 2026 15:51:12 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb467f6668sm1608170a12.8.2026.11.04.15.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:51:11 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Jarred White <jarredwhite@microsoft.com>,
	Jeff Kirsher <jeff.kirsher@microsoft.com>
Subject: [PATCH v1 1/1] i2c: designware: Add ACPI ID MSFT0006 for Microsoft Cobalt SoCs
Date: Wed,  4 Nov 2026 23:49:28 +0000
Message-ID: <20261104234928.86458-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Add the MSFT0006 ACPI ID for the DesignWare I2C controller integrated
on Microsoft Cobalt SoCs, along with its 300 MHz input clock description
in acpi_apd.c.

Without an explicit MSFT0006 entry, ACPI device matching falls back to
its _CID (APMC0D0F), which configures a 100 MHz input clock instead of
the controller's actual 300 MHz clock.

Cc: Jarred White <jarredwhite@microsoft.com>
Cc: Jeff Kirsher <jeff.kirsher@microsoft.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/acpi/acpi_apd.c                     | 6 ++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 9fc667d6776c8..a1baa056931c4 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -198,6 +198,11 @@ static const struct apd_device_desc hjmc_i2c_desc = {
 	.fixed_clk_rate = 200 * HZ_PER_MHZ,
 };
 
+static const struct apd_device_desc msft_i2c_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 300 * HZ_PER_MHZ,
+};
+
 #endif /* CONFIG_ARM64 */
 
 #endif
@@ -272,6 +277,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HJMC3001", APD_ADDR(hjmc_i2c_desc) },
 	{ "LECA0002", APD_ADDR(leca_spi_desc) },
 	{ "LECA0003", APD_ADDR(leca_i2c_desc) },
+	{ "MSFT0006", APD_ADDR(msft_i2c_desc) },
 	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
 	{ }
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 1da6b0314b6a0..f359d38cc63c7 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -280,6 +280,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ .id = "INT3433" },
 	{ .id = "INTC10EF" },
 	{ .id = "LECA0003" },
+	{ .id = "MSFT0006" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-- 
2.45.4

