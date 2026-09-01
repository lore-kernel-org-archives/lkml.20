Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6554A205A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290799; cv=none; b=fDjKPpx+WoE1T4Okr7HcVjNoYJh4Nl6eYZ5bOVbF9yQVg0rlr6a8vcFdiQ9jtR0lR+SpUQqfZ+b11gHR3UTWmxXioVOg5aoXdf58dC2p+VUtyzWnISC+5ZJ+Dw5DitOB4iv2+jYsUt367kCJRjkwOfD+hlhEVnHvhtQtlnBByrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290799; c=relaxed/simple;
	bh=snDeyJ9tPxWhXrW2kNPrxD8sW8wylLhnjY3gj3zW9/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OU/dEehusv3UdgF9Y/GLYgfD7vM0NHHBgMuQbcGhSH4FJV6ER0feu/VdmT6AnpKAcaYvaDdOXhxVd5V35pWGtZkl0eNTwz2ysHz/GdPo1+OFtp/dRxqAuV0JgQn4un4YnTB4VR+IeIekHQ8vW3H7ytRC5CpFFJH4rhwMW7T6L8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOBhf3LD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOBhf3LD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so415917a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290795; x=1788895595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyEFu62ujimxaQJil6RmK3n8Y5dLLUWHpcfLAU5G5Cc=;
        b=pOBhf3LDGUK++AHuCjYgvGgI6scbtVqa08hYw8S/tnmHzUckDKnv8/YC0S+eMhbVep
         5gHxwjbBBEKL5je+hlQkOrIDj/RwTwJ7ZyLaZc6xzNm+hWdG7yzy5CcJUFHRZxErM4VQ
         OGyFG6KYKhO388+Ty5m/ALcmX3mBUHi+X1Emh3fsbepXauZs6DM5w1PUdAzOtABY3pil
         Yu0yaaFl7+wIMU1OboqEjdRuzIV5hTcygnqb8JC1cDN2J3nyb6rgxnZYwBY9h6nDJu4/
         qxle8JvlFG3Xiw980a3Nz9er12adolC1TOHZ1T0PvBLu6oc4OqEEnwG51jTU8ExvO9/i
         ChFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290795; x=1788895595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyEFu62ujimxaQJil6RmK3n8Y5dLLUWHpcfLAU5G5Cc=;
        b=eMfbHwabPxCHGHr6TrvfF7mtFjjXcTLznDFUTMyZkjJEn48EKyb6VvHkL3hjbd3eqx
         2xgUViKrhmCPkt3f/+0nsmgTiLvH7Y0YWL4AIWB2r3YJQHi+oxtGQgrS+agjZoOKIg1I
         Or296dQr1EZrE1Yh+4Ciicp3HguNPNnkGDFCfaj3YM0tMPdtNj+P1SlH8ho4q19oueks
         WPDlTZUyHpcTyFP/9WyTk35SZ8F54yBivZqx9+o6Y1vlWtqtpWKQ6Bxc+tWJiey06gey
         U6RvGk95GAbXtZaFEUhmsg3wTrb5Pn0XWISGoLMILKPJl9qzdTNfsIr4fsYTbCw2LCDr
         TGzQ==
X-Forwarded-Encrypted: i=1; AKwUvByW8OzrpaUbtKaRYN1UT807ERcaxkNnyYq13cm5G3vLDaA6f6tBH6zlXpShookMl5UKVV6JWzNx3f8IexQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mSlj5V2nOy6zZrWzo0R3S/8T6P/GscJDyQPdqnCvHbK6wY41jB
	etq6hyxyUjdTsNeaMtxYQvQnsGiNSwYoQ3JDbQ5WasdWtlAt9EL34D2R
X-Gm-Gg: AYBFou2ZshfR8XJroXx1HrgQ7xJGRYpv7y2jt6cmwsKlkd1TE+GFx7zVVVrB164PK58
	zZdII/ma+uX5ckJ0R8857Ef5UIpWiKjBzRg+c1TlAITvsWUhdbOcmL1v1+/sGR8qVGZzZXOA3KT
	VfITP9wNFdggMnMVBQ+YGpjOI6O1QSXNjsZQCQLVMvU798bq8nz/NeDeFIboyDwQfthOzhi7O8K
	cO7a35sBrNKDRjBPZgM5DS4BDbAJruxW/IeddM4SXtUEW9G8r7xJfieFsmFniogkLrkh+hVquOs
	Y7pXzDxtqbFPWfJ99DW6fNdye60/FfoIQK72hp1fI95L85vll02c0SeOx82I77Xeggk9deyOfsQ
	4hDn0sFGWvT/7YGFOXn27gmxPag9kwSkLAWME0GvyTZj0dy3gY7lElRrDLD+qJQMQEiMKlFzpTC
	w+HDCThQg2jd7W7m+YpzDc1EdiuAOfs4cPG8qhsV+nw1KOLC6c7W7XMRh/YFh7FHZ5nwhaT8Ay
X-Received: by 2002:a05:6402:21d4:b0:6a0:dda3:83db with SMTP id 4fb4d7f45d1cf-6a6818d24f1mr115922a12.0.1788290795093;
        Tue, 01 Sep 2026 12:26:35 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:34 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v3 3/3] spi: pxa2xx: Handle clock gating for GPIO chip select devices
Date: Tue,  1 Sep 2026 21:26:25 +0200
Message-ID: <20260901192625.1497791-4-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192625.1497791-1-khalil@rentman.nl>
References: <20260901192625.1497791-1-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Intel LPSS SPI controllers (Cannon Lake and later) with dynamic
clock gating (cs_clk_stays_gated=true), the SPI clock is gated when
no native chip select is asserted. When using a GPIO chip select
(via SPI_CONTROLLER_GPIO_SS), the SPI framework toggles the GPIO
and also calls the controller's set_cs callback.

Handle this in the pxa2xx cs_assert/cs_deassert functions: when the
device uses a GPIO chip select on an LPSS controller, assert native
CS in the control register to enable the clock, and force the clock
gate on. On deassert, restore both.

This is needed on platforms where serial-multi-instantiate installs
a GPIO chip select from the peripheral's ACPI GpioIo resource to
work around an incomplete cs-gpios property on the SPI controller.

Signed-off-by: Khalil <khalilst@gmail.com>
---
 drivers/spi/spi-pxa2xx.c | 45 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 6291d7c2e0..fe57620630 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -419,20 +419,43 @@ static void cs_assert(struct spi_device *spi)
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
+	const struct lpss_config *config;
 
 	if (drv_data->ssp_type == CE4100_SSP) {
 		pxa2xx_spi_write(drv_data, SSSR, spi_get_chipselect(spi, 0));
 		return;
 	}
 
-	if (is_lpss_ssp(drv_data))
-		lpss_ssp_cs_control(spi, true);
+	if (is_lpss_ssp(drv_data)) {
+		config = lpss_get_config(drv_data);
+
+		if (spi_is_csgpiod(spi)) {
+			/*
+			 * GPIO handles the actual chip select to the device.
+			 * On LPSS controllers with dynamic clock gating, the
+			 * SPI clock won't run unless the native CS state says
+			 * "asserted" in the CS control register. Assert native
+			 * CS in the register to enable the clock, and force
+			 * the clock gate on.
+			 */
+			lpss_ssp_cs_control(spi, true);
+			if (config->cs_clk_stays_gated) {
+				__lpss_ssp_update_priv(drv_data,
+					LPSS_PRIV_CLOCK_GATE,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON);
+			}
+		} else {
+			lpss_ssp_cs_control(spi, true);
+		}
+	}
 }
 
 static void cs_deassert(struct spi_device *spi)
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
+	const struct lpss_config *config;
 	unsigned long timeout;
 
 	if (drv_data->ssp_type == CE4100_SSP)
@@ -444,8 +467,22 @@ static void cs_deassert(struct spi_device *spi)
 	       !time_after(jiffies, timeout))
 		cpu_relax();
 
-	if (is_lpss_ssp(drv_data))
-		lpss_ssp_cs_control(spi, false);
+	if (is_lpss_ssp(drv_data)) {
+		config = lpss_get_config(drv_data);
+
+		if (spi_is_csgpiod(spi)) {
+			/* Deassert native CS and restore clock gating */
+			lpss_ssp_cs_control(spi, false);
+			if (config->cs_clk_stays_gated) {
+				__lpss_ssp_update_priv(drv_data,
+					LPSS_PRIV_CLOCK_GATE,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_OFF);
+			}
+		} else {
+			lpss_ssp_cs_control(spi, false);
+		}
+	}
 }
 
 static void pxa2xx_spi_set_cs(struct spi_device *spi, bool level)
-- 
2.43.0

