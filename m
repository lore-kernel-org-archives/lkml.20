Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626778;
	b=ikRxF7El0RHfEa+OPTBMmTZamBf6CmTtTrTpGpRvFn38zBhf3cPJdrqy7/QW6k7xqpD8
	 5lbSB6PiY2mY5t3EJkQBLWmVgfrGhcsFWA/U0YKXNjjAr9tKs2viewuSugrR6jlA5Sc6U
	 UPXRCa2bQU0zi2icg3Aa5s6X4bwIFfUBJz4ZdSF+WscKljbJ5fq3ic5WTGJQcbSa5KbSa
	 yYaUfQmkQM6FaVckxevDYMl+0x9rqjMaznubeW4BHn05sEsGA5TVHFHGoChKLciatdDKs
	 1ecZaLXrHQKfnBKUPBTqiqJRLYmtDFjwG+8K8EDt0L5dupgQGMX3qjYNCBnbnt69ZHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626778;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=BE6Q7lwOQS+JLVi3m1rKA+wYs4mH0nfmw3zjAxeKYQI=;
	b=W1OAJZPqbU0Ge7LYN47sy4zVELQqxBmZCP8Gpn6i6Sh7Mh4qSeo+QE6B7TKqq8tqK2o1
	 WT+MOo1+o5NwN1TB09d3lmEF1UbDJnEZeQNyaa9YnBAfi/W8XTneWoYpJL92pYhRv/+qq
	 ehXVR1626W4kYA9QwJZl/PTqYuGSeeycw5y6+gaZVujYRPd/oSZFUMRZ4FLrGHnIuwSj6
	 gCGTWr/QlhbPof4DHthtyMbrdAUEV6QHpEWkc1G6auVbxcSA6LzGvR9j9Jpu1g6u5HjeR
	 X3AVC7mcEN3pjABMapgmLpHYbKWJr97W65dC5tH6QwfHE+c9aYD/K/Npn6ZF8ZPNjPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=pEsp9+R3;
	arc=none smtp.remote-ip=198.54.127.154
Received: from out-2z4y-a154.jellyfish.systems (out-2z4y-a154.jellyfish.systems [198.54.127.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A71606A885
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A71606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=pEsp9+R3
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jRKJn6TNJzyNf;
	Sat, 14 Nov 2026 03:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794626753;
	bh=BE6Q7lwOQS+JLVi3m1rKA+wYs4mH0nfmw3zjAxeKYQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pEsp9+R3n7npaw6OVTgEubZQ2Qk47YlPKtzFjn29EguNpMuOEnPdUSTnt/JwUXDQU
	 +5OllUSS21O8hq5mcgfJWiknF9QrTM+PP7gp5ttxap1AtK86Cvqlr7Z9LfvEPSL2O6
	 if0k/JPVd6gWK5/FgJUsPgsd5AxJPb6JsMpwSEyBHUsN8yF4RXAy3kFW+NM0JSUCxM
	 pzqa91/7/xN4ZzjWeXeQzAPeFIW2tC1htsbLVAUt+obfIIfwf++qpOAD+s1Uf/j3mc
	 vTHrH/E12EJQoprMtatr4Fs9z0NmeVtPs9O9/3ZRPXFfnnF7+lu0f/aqKXQQ39m+lP
	 KuXgAg4X0lc+g==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH 3/3] mfd: tps65219: Keep running past the warm threshold when asked
Date: Sat, 14 Nov 2026 06:24:56 +0300
Message-ID: <20261114032457.3434248-4-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114032457.3434248-1-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

When the devicetree sets ti,no-warm-shutdown on a TPS65219, set the
four SENSOR_x_WARM_MASK bits in MASK_CONFIG at probe. The PMIC then
reports a warm die instead of powering the board down, and powers off
only at its hot threshold.

The masks are loaded from the PMIC's NVM at every power-up, so they are
set on every probe.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
 drivers/mfd/tps65219.c       | 15 +++++++++++++++
 include/linux/mfd/tps65219.h |  6 +++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index e52fbf148..d8e352f35 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -507,6 +507,21 @@ static int tps65219_probe(struct i2c_client *client)
 		}
 	}
 
+	/*
+	 * The warm masks are loaded from NVM at every power-up, so they are set
+	 * again on every probe. With a sensor unmasked, the PMIC powers down at
+	 * the warm threshold; with all masked, only at the hot threshold.
+	 */
+	if (chip_id == TPS65219 &&
+	    of_property_read_bool(tps->dev->of_node, "ti,no-warm-shutdown")) {
+		ret = regmap_set_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
+				      TPS65219_REG_MASK_SENSOR_WARM_MASK);
+		if (ret) {
+			dev_err(tps->dev, "Failed to mask warm shutdown: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = devm_regmap_add_irq_chip(tps->dev, tps->regmap, client->irq,
 				       IRQF_ONESHOT, 0, pmic->irq_chip,
 				       &tps->irq_data);
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 5a6be84e2..688173044 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -196,7 +196,11 @@ enum pmic_id {
 #define TPS65219_REG_MASK_UV_BUCK3_UV_MASK		BIT(6)
 #define TPS65219_REG_MASK_UV_RETRY_MASK			BIT(7)
 /* MASK Config */
-// SENSOR_N_WARM_MASK already defined in Thermal
+#define TPS65219_REG_MASK_SENSOR_3_WARM_MASK		BIT(0)
+#define TPS65219_REG_MASK_SENSOR_2_WARM_MASK		BIT(1)
+#define TPS65219_REG_MASK_SENSOR_1_WARM_MASK		BIT(2)
+#define TPS65219_REG_MASK_SENSOR_0_WARM_MASK		BIT(3)
+#define TPS65219_REG_MASK_SENSOR_WARM_MASK		GENMASK(3, 0)
 #define TPS65219_REG_MASK_INT_FOR_RV_MASK		BIT(4)
 #define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(6, 5)
 #define TPS65219_REG_MASK_INT_FOR_PB_MASK		BIT(7)
-- 
2.53.0

