Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258115;
	b=QV90KWli1mslx2cfEWHWfGmMI7kzljm1ga+n4JgNF+ET0aGtUZD0+Fqd4wLfYwhAQ8ng
	 VSlm+l9EXv0WYweG5gkA4S3x8slNUzadHFZNDuhAXJlNoHPXhxzRYzyaYLThbLYUqne5X
	 x2qw3qAGs7mTfsXQSr96muXxeEbfMQo9I6E7i0+u2qZGB02IM1z6Bx9y6hyGtoPVanA2c
	 42dI6azAUHoKKm5pSc10aM4U7ta/rLTDia/mGyTxjwJPIftN1wCwNQj/hTfeZrBT9p/Mw
	 WOXbRveFS6b1mYkmrCUaBTJjWYWDZpDs9J8K5uDjw00m0MaUDjGvz2J/28sppr098Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1rRofamHWsgQtnXWvZBbAiHKmjpBdt9GxPKw93w6wfI=;
	b=5phxEjXDbpSUzCux3JIWDWyo1uc14rlYB4mgKmGkVRzUOeB/m43B4Ip3nN2bXe5DYLy/
	 sZ2s5tBcMUom/rGTA8YgjJULcniJJmBQcWhqZhIMWqXMJ1tpqcdAIfi3g3C6VUvuHe2+j
	 WRQcjvrWv2Ij2+zpQyJ5U6PmpnCKcdK+MH5dJgTrFajwNKAZXL39zpQMeILLvaon8xoPt
	 YyD9sojHGVAztEWVlKS4x625u04MikNNtfoRRBORt3fQvIVSXYGCDWb55MCbR63sL1gMQ
	 aKgsl9zawXy+fzbNoh5Pc3RpKw5tbd0WJY0URiJzad+H79y0IMrayxVQmqjRQKY629A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5L6amhx;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF525606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF525606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5L6amhx
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so745912a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794258114; x=1794862914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rRofamHWsgQtnXWvZBbAiHKmjpBdt9GxPKw93w6wfI=;
        b=D5L6amhxFSoDqc8GwvGK3NvVz5o+I0AQvBDbqUKgOzZ/CdW25tCh9hjypnl+Xpd2ve
         HHub+xs/2/NInY4mxfESNkENa6n9PPadk9TlwMOLuchIADPTzqhp7IRsub52uCgO4VqX
         +FNiv7i/pAKGWeOaHu5/27nUSNVhWxpcNRsFjHMsR7rGe6tmzt0NFkJ80SKfoRiz+K+C
         iTov9Pz6KcZ5UuU/2vHccxPKHJ3hOY1k2afJUiOIn0HKH4uzJcS6WLUv9aFoUom/GSxs
         jOl1dWq49VnmO2BQucHm5wjdl+6ZhZ7azuhhvzWPTHhxZwnNZvM225Bs5xRrdSKCfb7g
         iRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258114; x=1794862914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rRofamHWsgQtnXWvZBbAiHKmjpBdt9GxPKw93w6wfI=;
        b=Fe+GDHp9Oo9QxH9qRxjfXfJNYeJ1Y5ICU6YPxpChqZQdvpnzEDjIou77JbyTQZvPeX
         6FDWH6b7Oi0ROGKd2vsxpqXUStfRC3dK53Wqy7+yNlqcP8ZPzcMO4SiGBXnQN0Egxn+S
         0id2khxqJZWXfaRnPWZEwjLv7ehgzg4MKfkRTwGy/Vw3KZ/EnWJ5azbBHDk0eQoPB1yw
         YPSqg24Go5nDTwwOW37bUYZ0yfrd7mXO0WfqP1ZCcg9KYEkiA1yH/43ycUcCO6ghdtg3
         91zmNHt0ZExX0VjTz7WIE8e2ytelfkFPpybmkzc+OcbgMXxZN41tkD9Uf+z4DQdTJ6LZ
         wDqw==
X-Forwarded-Encrypted: i=1; AL+hErFaa6M1yijIvudL+Ppssy87oukUycHKVTDRNIy6k7SgKnw52FacQIbrc3CeF5fdqLc7XZ/AHd5TqPueRhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bXY1hBBCxCZH73QXJ9ViDbGuwKKOlrmFGhLrFaZsduI/wJlBU
	CUpvXua1xn48cXCmvEkWv7zvCGuligtx6/wzfwzqWufOUU3CuMX4m0lB
X-Gm-Gg: AYBFou0pD1ZGGudi7YS4NbsKOkmDtVi/BRM1XxwP5RWkOB5wBVu4l6jG4TMYdfY1hVk
	Q7/kHJy+OjDCSK/hdvgc0lo9qq43qTBJ+u7k80M+tNpTJT3RQQT8ZvmfupWZP4cxO5eblbEf4yZ
	KPyJsh9j2oS1eQ+RrzZNRrBz2jlkYysvUyzdc1JY+kuXXFbygrqOQimYmGlqoMi+Etx+OiyvCGv
	EXAaX3BW3iQWtv91XBn84FO9AZsXP1zMf2pFm3T7TKCz6eTADiXaOFOPFQI7LXpU7fwGhjEyWCP
	kb/N3EzvShAbr8W2i88sG0mJqi52Zywgbmau4eGqBqNQtKQa45YQf267l4aOqYpRg3y4dcNlzEY
	e6BkBocH0mf62RmumNPvNLuzjvdVCdfs++v8Pz8fc9GtuzRj4fKqnhi/sdrQ8EgMsRnKITeYevi
	fowNUU6UGIbi/i+VK9azUNw9acATORkaKMvb7S0lUvmMoVizEFgfIb5K801Mc/ejmDlHXP1ns8q
	q+HyrfbS3QlByGaEdIRkNKcQOUzRzKOFrFIO770PBob5HkcF0s8PyCe9ydplKUlqjdXcuSNxQB8
	E2gDeuEgTvT9D90qKZj5W/UnSDUmAkoaaFUS4lMACvxM7M1+iNIMnOkchYT6dTEmq7h+RB2ym5Z
	T016k8Uy6ReMGrNmGlIeqJsiqVcrskIhrWJ6B33ztP/EevyG82473oY1KGoTdgvGC1F06ITyjv1
	qJ9TLu5aPaZRkYIN3+etZDDye/En2z41znpgJmkUAV
X-Received: by 2002:a17:90b:3e4c:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b1679e9575mr500295a91.32.1794258114035;
        Mon, 09 Nov 2026 13:01:54 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168ed00d2sm275299a91.1.2026.11.09.13.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:01:53 -0800 (PST)
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
	Jarred White <jarredwhite@linux.microsoft.com>,
	Jeff Kirsher <jeff.kirsher@microsoft.com>
Subject: [PATCH v2 1/1] i2c: designware: Add ACPI ID MSFT0006 for Microsoft Cobalt SoCs
Date: Mon,  9 Nov 2026 21:01:46 +0000
Message-ID: <20261109210146.57766-1-sidchintamaneni@gmail.com>
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

Acked-by: Jarred White <jarredwhite@linux.microsoft.com>
Acked-by: Jeff Kirsher <jeff.kirsher@microsoft.com>
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 drivers/acpi/acpi_apd.c                     | 6 ++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index ea226fd987567..66a7607752d9b 100644
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
index 13dd7c50486a4..cf364f3c26199 100644
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

