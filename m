Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195967;
	b=ozGcscnHbmjfyYVAZF60k8wYUFf9Hoqdg+FYoCF2xfmngUgi2q5cXFzC3hbAL9mx6UCZ
	 iaD/yvRTEcKar6YHZY9GyiFzSM8VKgKd0WYbuo6djdMFQ7+0hHdk4u9T510EJbIsx/agE
	 Ji+TMupyd3W44wOu+pUBFhPACs5u2xOznk44w0HKSjElQHjCUfKvWhj82/AYmTRuVG78Q
	 hoLA4WC9Ol7Emh3O19eKy7KjGK6s+FttwM1Cqp+CZmoIDVR44W+xPvrCinAn/VXi5QBb5
	 CiPlD+yPVq+9x4mNqpfGNLQqhtq0pzaf3jaBUy8pDEgE+PkXGWXZgd2KKnc8pQwRoCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qzov9cMie3JOWsLr9fHYVP0N8sIiaMOwtNhxNRILXQI=;
	b=XrfYqnAx/XLjbWzJ8j7onrRvYuJriQIMY2Fzufs3pWZfUgG2xxpcdH9u8NRJsuHRwv/K
	 GVeqPglTlbjFjUH/dt1mpcWrMBK9FKOvlzdJph3kpL0+LrbAQwSAEgCVLGb9gomaq84gV
	 R2LbxYw88GQ7xnmYSZDQFgGurMlKgz/PHcKet4D4hVDdOi/vG2fzXaMRWPvm5QU2/4qBg
	 WD62Si1ZN+YI54ij/5JcZ1+bqYAwTz6ZWhGvORU/6656celrex63oGJ1EVCGXRE6/4jrt
	 Z1XzpgB1kyuYt98BTvVnu8iVKwUdu01Q1YQzmDlN1xbokOtpjDzEAubZF8rDMDYElFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=KWKGKeip;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E28606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E28606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=KWKGKeip
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10462535e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195965; x=1793800765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qzov9cMie3JOWsLr9fHYVP0N8sIiaMOwtNhxNRILXQI=;
        b=KWKGKeipGePT9IJuVyxw5YsqDXc2AkjbuCxEI9jczow2/1/idGvDwiznsK9TOhdAlH
         Zaa3SIYobCUnBJ36mnrD/PUn90mcqMCv6TIWRZMg9JRtzys4vHLb82ANdjPm+1EFBUa6
         uh3YNsE8H4Oj9yRxgTNwaZKHDkxPWXUmZCwO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195965; x=1793800765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qzov9cMie3JOWsLr9fHYVP0N8sIiaMOwtNhxNRILXQI=;
        b=QhtPo0OW9SAyX/5xAVVnCKDilhPEhxfGXiaavzlUlmHjTdVH66xmo9jMmHwi2c92n6
         LLi01nZxd+CYT8RCSk5aZDJMx9/Ui4GtWs4jT8u+/fumF8ipEnFSNWLpZWyE+Qd7smXY
         fDrhtH47Ij9cRSHDSDNYRlJVbvT+eoZlsYzB4w9YhHE9DI2xDUs9a165BR1Pcbkra5ay
         fNT1GBwk5xJ/pi/PO70G8N4PghdjT/eX7X548JvSwmUF0yjMQ3aKPtvHYI9RxQrMk/1J
         TSXBKBj3ChhDtcR4KdP24Ob0iqjXHuFfKWsg+Yd5wOFtc2bzU63fbdLeqk7KyvImlWu3
         +IWw==
X-Forwarded-Encrypted: i=1; AKwUvBzBMIuramToCq03EqFhfTVQ6s7u7Yp+tvl7bBFbvefV8num0X6NzUJA/LH8YKbHv+eVDDCWbZymdFl5mpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrvZaL4z6rQm76AakfmejUTqiHcxJu/eEwr1fHhYdXtkfz/SUa
	4wMxWGKf4N++BGeRsMb2a+mxdWtliMv0Yh7bz1K/OFxUOTkVuROYNdpIYEuQX+FC7rU=
X-Gm-Gg: AYBFou1fK1NCwlKk0v8z9JgkqdCvYyBcpREyXgVwNcYreurnlRO1aLfC5kHexKOmnKx
	pr5sgG+h3DTPKqflAWfJhRlHpY7dwQYICJ2gx3PZqzwJmL914H7joQ6AOF79MHYkTBNaUpCG818
	roGwx6Fa2B7FC7ZH3mOjyrs3oDJW9yEEbP/6jCmMA/GWwaVARw6MIh+1sxkaM0U4ZEB05MA1w76
	Bo+lh9QhnKBPdgQcc2YJFqNeOck13wpqmGIv2lV0kr8JB4yYPEx7B7UjN4P6/mV3FTm2TeTF3UO
	hXghBwo8ipIhkjF+lRi7Rhlxc8EokMwBsYd8de7n+avv+n/oQoCe84hnIxZ8f+UTKvHiktbLqHZ
	4qysuGYrbJ9D13oY2EueNiGY3zcQPQLB5dtplqFUat1FKYwChwtj0bKHK7KGWYwHnZlhQdfwXPR
	1w0Rnv9XRXrMVSI6J1QgbKRJOZKw3GON1bWECaZeaq0swheMcpkU4BjgCl2e6ZMYAG2q2Ly1hhI
	u6VBmSRfLJd1mJY1OhuRiIGOxjKYKJA4QA41Cbvsl+3wxqbQwNFullnySxl6gUCdT54+MlQKTN7
	qfGIFQv3yE7jFWsO1IsNcX5biOUm8HCvHI+1zsmyH4rkVeaDxC3bBzt+Csjbnb0m/UKwHKYV1dP
	VeoX6MPxC8TLzpWUXoO0B7Awmv+AXd8oOZbVOKAn842ILzptY
X-Received: by 2002:a05:600c:8b28:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4a96720304cmr53194255e9.22.1793195964806;
        Wed, 28 Oct 2026 06:59:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 3/4] soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
Date: Wed, 28 Oct 2026 14:59:07 +0100
Message-ID: <20261028135915.2665857-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
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

The STM32MP25 SYSCFG provides the LTDC pixel clock mux, whose driver is
an auxiliary driver since the SYSCFG node is bound to this driver.

Create the auxiliary device for the clock driver on STM32MP25.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/soc/st/Kconfig           |  1 +
 drivers/soc/st/stm32mp2-syscfg.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
index 2a9d6a77be45..62bbe8c63238 100644
--- a/drivers/soc/st/Kconfig
+++ b/drivers/soc/st/Kconfig
@@ -5,6 +5,7 @@ config SOC_STM32MP2
 	tristate "STM32MP2 SoC family support"
 	depends on ARCH_STM32 || COMPILE_TEST
 	default ARCH_STM32 && ARM64
+	select AUXILIARY_BUS
 	select SOC_BUS
 	help
 	  If you say yes here, you get support for the ST STM32MP2 family
diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
index 770321a4a6f7..300a949744c5 100644
--- a/drivers/soc/st/stm32mp2-syscfg.c
+++ b/drivers/soc/st/stm32mp2-syscfg.c
@@ -3,18 +3,42 @@
  * Copyright 2026 Marek Vasut
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+
+struct stm32mp2_syscfg_data {
+	bool has_clk;
+};
 
 static int stm32mp2_syscfg_probe(struct platform_device *pdev)
 {
-	return devm_of_platform_populate(&pdev->dev);
+	const struct stm32mp2_syscfg_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return ret;
+
+	data = device_get_match_data(dev);
+	if (data && data->has_clk &&
+	    !devm_auxiliary_device_create(dev, "clk", NULL))
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to register the clock device\n");
+
+	return 0;
 }
 
+static const struct stm32mp2_syscfg_data stm32mp25_syscfg_data = {
+	.has_clk = true,
+};
+
 static const struct of_device_id stm32mp2_syscfg_ids[] = {
 	{ .compatible = "st,stm32mp23-syscfg" },
-	{ .compatible = "st,stm32mp25-syscfg" },
+	{ .compatible = "st,stm32mp25-syscfg", .data = &stm32mp25_syscfg_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32mp2_syscfg_ids);
-- 
2.43.0

