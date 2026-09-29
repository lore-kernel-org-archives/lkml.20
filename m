Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E69C3DD536
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707807; cv=none; b=Bk5ooOYKtiHIN5woFJ7zZ0L6L5GVWcUsyhN2kAg7u5j/A2Q0Eh7Ibk42xA9e1jj+rzQKP9JtY07pNbx+nZ10zt+JTS8pREjfIx4Mc9NiOkYXPJ0RnJTqy4UVoRZk4eomSxQ7WasWr6DHknA24Bf+5SIvUWwp+Wc3v9C44XsF4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707807; c=relaxed/simple;
	bh=rME4CygQdMeBpELseslAXOMkF+9QTE2/B/8YQvY8mf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EG7Cnn/YPJ/n/4OpQ4pZyfgePqS6oGDxoiGHZ3TiGfajwq+YOTgKanidlnXw84J1laBlN55pjR+AKd3VCVqn0SjiEqGuFbvIeb03n+BPqJqb9GOpqWGM8Qllo5iEw5Nx52c38IhwS1K4sVw3y6E87xkSVLrqMB5vFDvlPCJEDHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nuff7Y7n; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nuff7Y7n"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso3563800f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707804; x=1791312604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/s7A+PFwirZKBCyO0jb5R3037x6NgRD0oowhqjmVw1Q=;
        b=Nuff7Y7nUdqHepKVpkZq7IHtv/vg/cAjVLJDambMjWwj6pCachTswzSgmclQ1RJZjM
         D45Bpbnoc5QhMC8Ip6vC59L0CWilRjV/nvuWsYhWOCUUp9mm8kBmpsiuOP89HC5xHNqW
         EXx7LmnCANkjqpxS/8qWtgUedPBOWHcy4H8R4AxsKma5FMHLYGCg+d/HwUYmfTrt0zVm
         9hJP4QyaeAblrRiy9GS0nLWIjpvT9bHGMFohJ9hqkYXXl5GCbAHW95c+ZnUnHkf/xF38
         ckMRWf75LJmhyUUy+htkq9rzzD0suptKUgE8jzDwGtU6jiQZ50KdnBl0sunJ77n+iEOe
         Rw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707804; x=1791312604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/s7A+PFwirZKBCyO0jb5R3037x6NgRD0oowhqjmVw1Q=;
        b=xSueXiTwLbxRpn6nO01ZNqtchEUREdRvXQ5BUCI5g2XzU8vOaTnTS3rVuQ8tGwkoOf
         0PuyBEbbyUNfmfqHTqakwePOCxPNofJs88SMNT+uZDAjADsJVU58RCgTbv+qZjGgOdI+
         dkApVEmjmCcyn6yfdBPMWh9RJcTPqpNyfBzGYhKYyTu3M3lpWvQLA3OV75TrNoT7NIvH
         CwmLroZJI5dQUW1RLFS7zIUURFBMpXnkj6MsWZE6vaUYLNFHHZL3Hv9oVv9fDgrUHfXg
         1NPPNJAO239Yg2X+JDRyEyPUrwrYG2ttXQh0WJHdBjBzmf3y5DKwvZCGQr0mfINAAV6d
         t5gA==
X-Forwarded-Encrypted: i=1; AKwUvBw5mc10/wysYP2Gxa0bb81aeCE3om9e6zdg7nOEdWGooLTQEGVC4capAztd2pXklQC/XnsaKObuidpdha0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEIwiyMOjwm1TD79vZSXsSlHumvJ7N9sn6asNlNpGGR8GWXTD2
	/cyMUgbjS96kctbFVWAZ0SAfr6dVzZhjfOGfu46dn8pgAZtoBOSymq9G
X-Gm-Gg: AYBFou3dIX8NiYALlop29YNrt50wPxyxec9qa37WjhCIsADbWV1sX/4+8tNG+ZHc6kO
	HK/xRHpGauPdrXnYcPI29LRSNlm5Ws9CuBeAWhpe+84csNZYYt7EyhbwdJz9YO6CN5pWKVVhlIV
	SYidhV4sHkJB4A8WjlWZAi38nHE2h7SUImaWrpdDNndylduZUr1Y7BaG08/Pr3CqylPdmamNLPi
	WmK45j7OJr9/xmvxaOTNNeFk5aBHpiMuQzN4eZM9fmTuyiiHUD9zsW9YTxuc6kcs77cmc4UH2ga
	Z1dW58C1pnTMqpfF8PTvfaEu8lHktFqn9WCUvfSKjUtxhq7GbHrJuuMeihLsS0F7pvh4wCVOfb4
	VmcpGzD2F6A1l3tFpfoswa5fkHFWsPFIYdmAErjCDR44noVDPy/CYeJnFiFrhRl8CGQtlTBN8e6
	PfltfaebXrXUrKbBOB61qLCHhu70sCGu09b/dH7Ok5t5bLDdzGQxkFX8GXqdLo0kngu7cKc9pnm
	1JcB7ALtNepaF/kmGoxogJ6U/s4Kyc=
X-Received: by 2002:a05:6000:22c5:b0:486:f856:1975 with SMTP id ffacd0b85a97d-48afe72ae94mr396451f8f.22.1790707803583;
        Tue, 29 Sep 2026 11:50:03 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6b8d1esm452569f8f.30.2026.09.29.11.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:50:03 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	narcisaanamaria12@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH 3/3] staging: iio: accel: adis16203: clean up register definitions and drop redundant comments
Date: Tue, 29 Sep 2026 21:49:00 +0300
Message-ID: <20260929184900.39515-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop redundant, single-line comments above register macros that provide
no additional value.

Vertically align the macro values with tabs to improve readability and
conform to standard kernel coding style.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/accel/adis16203.c | 87 ++++-----------------------
 1 file changed, 13 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index 905485fd556f..b0fa2701cbd1 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -17,105 +17,44 @@
 
 #define ADIS16203_STARTUP_DELAY 220 /* ms */
 
-/* Flash memory write count */
 #define ADIS16203_FLASH_CNT      0x00
-
-/* Output, power supply */
 #define ADIS16203_SUPPLY_OUT     0x02
-
-/* Output, auxiliary ADC input */
 #define ADIS16203_AUX_ADC        0x08
-
-/* Output, temperature */
 #define ADIS16203_TEMP_OUT       0x0A
-
-/* Output, x-axis inclination */
 #define ADIS16203_INCL_OUT       0x0C
-
-/* Incline null calibration */
 #define ADIS16203_INCL_NULL      0x18
-
-/* Alarm 1 amplitude threshold */
 #define ADIS16203_ALM_MAG1       0x20
-
-/* Alarm 2 amplitude threshold */
 #define ADIS16203_ALM_MAG2       0x22
-
-/* Alarm 1, sample period */
 #define ADIS16203_ALM_SMPL1      0x24
-
-/* Alarm 2, sample period */
 #define ADIS16203_ALM_SMPL2      0x26
-
-/* Alarm control */
 #define ADIS16203_ALM_CTRL       0x28
-
-/* Auxiliary DAC data */
 #define ADIS16203_AUX_DAC        0x30
-
-/* General-purpose digital input/output control */
 #define ADIS16203_GPIO_CTRL      0x32
-
-/* Miscellaneous control */
 #define ADIS16203_MSC_CTRL       0x34
-
-/* Internal sample period (rate) control */
 #define ADIS16203_SMPL_PRD       0x36
-
-/* Operation, filter configuration */
 #define ADIS16203_AVG_CNT        0x38
-
-/* Operation, sleep mode control */
 #define ADIS16203_SLP_CNT        0x3A
-
-/* Diagnostics, system status register */
 #define ADIS16203_DIAG_STAT      0x3C
-
-/* Operation, system command register */
 #define ADIS16203_GLOB_CMD       0x3E
 
 /* MSC_CTRL */
 
-/* Self-test at power-on: 1 = disabled, 0 = enabled */
-#define ADIS16203_MSC_CTRL_PWRUP_SELF_TEST      BIT(10)
-
-/* Reverses rotation of both inclination outputs */
-#define ADIS16203_MSC_CTRL_REVERSE_ROT_EN       BIT(9)
-
-/* Self-test enable */
-#define ADIS16203_MSC_CTRL_SELF_TEST_EN         BIT(8)
-
-/* Data-ready enable: 1 = enabled, 0 = disabled */
-#define ADIS16203_MSC_CTRL_DATA_RDY_EN          BIT(2)
-
-/* Data-ready polarity: 1 = active high, 0 = active low */
-#define ADIS16203_MSC_CTRL_ACTIVE_HIGH          BIT(1)
-
-/* Data-ready line selection: 1 = DIO1, 0 = DIO0 */
-#define ADIS16203_MSC_CTRL_DATA_RDY_DIO1        BIT(0)
+#define ADIS16203_MSC_CTRL_PWRUP_SELF_TEST	BIT(10)
+#define ADIS16203_MSC_CTRL_REVERSE_ROT_EN	BIT(9)
+#define ADIS16203_MSC_CTRL_SELF_TEST_EN	BIT(8)
+#define ADIS16203_MSC_CTRL_DATA_RDY_EN		BIT(2)
+#define ADIS16203_MSC_CTRL_ACTIVE_HIGH		BIT(1)
+#define ADIS16203_MSC_CTRL_DATA_RDY_DIO1	BIT(0)
 
 /* DIAG_STAT */
 
-/* Alarm 2 status: 1 = alarm active, 0 = alarm inactive */
-#define ADIS16203_DIAG_STAT_ALARM2        BIT(9)
-
-/* Alarm 1 status: 1 = alarm active, 0 = alarm inactive */
-#define ADIS16203_DIAG_STAT_ALARM1        BIT(8)
-
-/* Self-test diagnostic error flag */
-#define ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT 5
-
-/* SPI communications failure */
-#define ADIS16203_DIAG_STAT_SPI_FAIL_BIT      3
-
-/* Flash update failure */
-#define ADIS16203_DIAG_STAT_FLASH_UPT_BIT     2
-
-/* Power supply above 3.625 V */
-#define ADIS16203_DIAG_STAT_POWER_HIGH_BIT    1
-
-/* Power supply below 2.975 V */
-#define ADIS16203_DIAG_STAT_POWER_LOW_BIT     0
+#define ADIS16203_DIAG_STAT_ALARM2		BIT(9)
+#define ADIS16203_DIAG_STAT_ALARM1		BIT(8)
+#define ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT	5
+#define ADIS16203_DIAG_STAT_SPI_FAIL_BIT	3
+#define ADIS16203_DIAG_STAT_FLASH_UPT_BIT	2
+#define ADIS16203_DIAG_STAT_POWER_HIGH_BIT	1
+#define ADIS16203_DIAG_STAT_POWER_LOW_BIT	0
 
 /* GLOB_CMD */
 
-- 
2.54.0

