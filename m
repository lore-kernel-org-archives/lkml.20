Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855551;
	b=d0lxi3ulD6wv+WNdikRPVHtQ3sVeUFcn1+pJnOLJcY9Zc7+OpUfO02jo1TmYizaLqPDg
	 OfaMEOlr91Y59D6MYWPZzZw5sdyGIXDKu+5I8RGdsds91jZyDlTH4sp2equMGUjJCscaT
	 GHpqkPI6MUpfQzVp8qbu0TPMNyM0nfxYliScHc8VF0/75WXfVEv8IwwDnk5d3fMj3L3Lw
	 kYWRrBAP0nVvusdtDHr3fIncJPpQScCl8Lb3KnbFMHgEvKtzE7e3L0jzXvxytbAYx4NJZ
	 Bc59RMP9KUdp0AbCJhyPWDpke+QelD7maDhPCUK28+SAMsIwGID2hakOYlc7F87AmWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855551;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=IpWRaIqFYpHuiZAy8OVcSapWNWeYnlDeXUT+MZCj6vA=;
	b=qg7u3HllDa+qqJgtgKKQsXQaBadLiMO7HZKRxO/FvFQuZ9YKh74fIiTikWhmq/kd9HzB
	 y8NXL9Tc04IAf0C6z6k3LtY/B3PsZMRwH8zkAVAzKuteYphmvFZbe0+h34PcfpwEe6Brs
	 29ZExyRxUNHG2jVpfvxT5hBMru/1RJjVH9B8DktoO3I9F54UNWK9aR3Zt/W/kZlCEsyDR
	 C/+fR8yp1wh31kPLYBHvUlLE9SOhsZRM7GsPLYRkB4dHmEKOHgUyyjpZXdwf8H9rHKWkf
	 G9yJlX53OgaKef97lh4m7/WFCYtBV28QbVYkljXgSSPHQDG9mSAN9vT4ucpCQa3lKuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=RLEnayxb;
	arc=none smtp.remote-ip=198.54.127.74
Received: from out-zbxj-a74.jellyfish.systems (out-zbxj-a74.jellyfish.systems [198.54.127.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275C606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D275C606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=RLEnayxb
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxwP4rGgz8sWT;
	Mon, 16 Nov 2026 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794855534;
	bh=IpWRaIqFYpHuiZAy8OVcSapWNWeYnlDeXUT+MZCj6vA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLEnayxbmvqpyZDpX6CRadKeHs0sNdNzsmnek0FEPWG8jaT+1ycW9FgPw4c8q5MEX
	 LA4BdeJlDxU8K40KNPVpQVQm9O4fwKHwBWDATpbXfKdb2tw5sNgGFDUGagLaBuiAv0
	 N+Iosk8HI5LPwBvHek8CpllgdXsbwEGChaJr3ToCzvBs2rBztkaMrxDDUi9b4fQKmk
	 EpLPWeb7FN1QYaa6jpQ1sgB6rTdBYkpHDRxPeqTLqGhUgXbLitT8qRB2DkNDIZPwCU
	 XUn+JT0UPrYovajVsYiRlDHxYS3LPVYtwX4oKcm5tCLmnGdSkUsPIOZMnKSUC5d9gn
	 dyDzii6QUF7wg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jerome.neanne@baylibre.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 3/3] mfd: tps65219: Keep running past the warm threshold when asked
Date: Mon, 16 Nov 2026 21:58:11 +0300
Message-ID: <20261116185811.1907811-4-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116185811.1907811-1-dev@chrispinetinega.com>
References: <20261116185811.1907811-1-dev@chrispinetinega.com>
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
Changes in v2:
- None.

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

