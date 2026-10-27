Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114693;
	b=e9fIWq0G/pG9/JbR2kLzLMRuA16hqteJUDHDDNx4MQnOQ3hqoTw2Aqyu9Cs/gBkp6BiW
	 6ZWplvKVA6z6TsYSBk9swwTs4d3BsDEMf5m526WOK8VDbLmgN+BMl2vF19WlfCg6aRCck
	 dxyve+6lRqf3uJwbSaiwvsmLVLhRGIA/Pi1gWeLBi+ePbefd3vD+IdNLcvr8Yd4rYa1IQ
	 PLdCBtj0kgHdb5L7Hi/vm6NwwgHHJsFnNTc4bwZ4u1AUEBWgDX4Y+6ce4DMaNITWYiriN
	 yI49JKkf4mY5kz684cJjcJdSKnqPbzHLnS3NNzpq39NRz3GwLhT4XBd5m18iGZDKnpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hDdFqYy/BQ5aunaQkAI9mUkJJTdQwxxuNDFrcHBEph0=;
	b=frnYLGW1ZGpHgwKwhCmY/CeztiuUuI+/EmBn+q7AfmDMo4KLbyKurEb2OetGQAvlT/DY
	 51WpsY/DSVxNkoB1laJY/+wuyWHUF4BnYR33BztqVGEz8I+sylXb//rpDcKWRiQvpSaC2
	 wHHGYQpH9qq18aj6GdZTDJ5ACayDfvAKC3x7VL3bfCscoKmTe3kysHyqVnlH/b2qTYk5n
	 WN4+YhhFAPLcBzXsvAuQCijUibNNknKFm4gGwlaEe9QkwCZvnei5lb3O0Slstp7zJ1mP8
	 s4LabhQgBmtQiDq0cjle5t7DnNYyf7J9Del2r+cXWOD2PSYMPnejfTfZABF2wRR0C3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBAYUZK8;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624CE606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624CE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBAYUZK8
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c434376dbebso205546766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114692; x=1793719492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDdFqYy/BQ5aunaQkAI9mUkJJTdQwxxuNDFrcHBEph0=;
        b=TBAYUZK8KvgIcWUedocZgwbiEiI/0dkvjz3DRZ7aDfIpEXiwshPWwZodz8RTQmPwwu
         /N8kzZGEbq1HnbOM9AeZfCwNGHKVyeR9rliCKA55OEGckc8lAr3xsJhe9iRevtQVUsyc
         4pb0h8Ff/XPEIkRuAI1GrxjGm6C5MUXnpWtItrFOWCQoK0hRQe4tKyuu8ljQC1ZjS3qF
         dmXBS+cC/suvGEXD1eSnT4GsqoPRK9KrAWEHQvY0yxYjEedO8/DTbcTnf+CBPH/5/cn0
         Hvk+fhQnVDlSBSeJCBYgiAe8y/EFa7c2lT8nQcpXX+cvMqDdQ3czJqC5qygVHnjHANik
         plHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114692; x=1793719492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDdFqYy/BQ5aunaQkAI9mUkJJTdQwxxuNDFrcHBEph0=;
        b=CCCq01mKgezCdx9tzzrIWGxxkoirAkMBjGzMiH1iuMlQovFbrmGJV4BMBn2f9V9aZ+
         7sfswJnLS5Owe3eQgIVZOBRY0ubp3gN9fba/RWnWdS60H/xueKHgjUskxUWUnOUbSf4b
         oC6/A1jB2Er3AWI/olF/xRGQedKuV7Bs8AzpcVGDuI/Yb2Yx2ygARfO3TzGvohDcHzpP
         JEsrf3bnmkLUyKpLdpT/ay/cVs5mnv0sR72p472IUhSscpEsBNMXQBSsok/f3ViFdBhu
         qKhfBVin/OyW7d2+CNHKCklznaJfs3pt1WF+MqDutvjThZSaNwaTPSREpZ6OMj8jIRE9
         zfog==
X-Forwarded-Encrypted: i=1; AKwUvBwAIC8k+//fjiI5ehnTejjqL9pD222KeCZFV+CB6XW34q9jusf/PPjB1k/leNBPLKAaR0OZ09Oy+RQhxs0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm/RpfhZAypNYnPNsx4fNceDbx7wg+5DzWoiS/Ay8LGAHCrNvw
	WXnuIb8K931TzddAQ5try0zBuu7Y+6wVH0EQcXcFU+eRMXTGG69JT9Cy
X-Gm-Gg: AYBFou29WoSOOnHx2k5fZ1Vo3+1LBRlZ/9Ca7PglnTV4IrwIKz3MmrF45o1gJ/1zH2F
	qQy85qfDj//iLZklT2mYrDlhD86bUYFhpwtcTGOeD9GoY7lCDlt4wmdidM/siQo4Hllf5Omz+e1
	wI+l/08Nj52xbhNXSGfk/vguiWg+nEGZccEC+eSD5ZXyd0KMppZvJF1q5jZpbIyFiDPvrrC0ml9
	h7lgD3Tn5xmYyA2cEnrsiRgqZIu33EcofFMHdjlMOzYJja9Az8F2ODMcVDsrk+fdHqXSkyM+Ai7
	5tpCAH1L6iesDR5TuRUduoV3eZKUJ8Lpmra8IBxJ9sk+UtjNUr6EieY2dOt2Y883/Pv2mymx4aE
	uDLHkq69PTGaJ6fUa2DUHPP0sVD/qJBhNtEXsqaBC2ux2BssuksrShmr3glt8ZkX7VNsjhKeCmJ
	mFx94KiG/JK5ubCWWclsI5h3b4ZNpdI4OzKpGlFkIY65JTQsybrTyANqhKtdJZSUotHXQyPFcgN
	MYGHZgJkf7vwvOySYQtaE8KoO4UojweEP0h6TsX3UOeSGqnowYfWPdFkP25wDH9kagaAXOqR5e+
X-Received: by 2002:a17:906:c10b:b0:c45:219c:7fec with SMTP id a640c23a62f3a-c49a744591bmr269233766b.27.1793114691772;
        Tue, 27 Oct 2026 08:24:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm467303866b.37.2026.10.27.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:24:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mfd: tps65910: Use devm_register_power_off_handler()
Date: Tue, 27 Oct 2026 17:24:21 +0200
Message-ID: <20261027152423.194794-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027152423.194794-1-clamor95@gmail.com>
References: <20261027152423.194794-1-clamor95@gmail.com>
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

From: Dmitry Osipenko <digetx@gmail.com>

Use devm_register_power_off_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/tps65910.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 6243b66b1b6f2..97855bd9cc3c8 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -16,6 +16,7 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/mfd/core.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/mfd/tps65910.h>
 #include <linux/of.h>
@@ -425,16 +426,15 @@ struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
 }
 #endif
 
-static struct i2c_client *tps65910_i2c_client;
-static void tps65910_power_off(void)
+static int tps65910_power_off(struct sys_off_data *data)
 {
-	struct tps65910 *tps65910;
-
-	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
+	struct tps65910 *tps65910 = data->cb_data;
 
 	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
 			   DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
 			   DEVCTRL_DEV_OFF_MASK);
+
+	return NOTIFY_DONE;
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c)
@@ -501,7 +501,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 	tps65910_ck32k_init(tps65910, pmic_plat_data);
 	tps65910_sleepinit(tps65910, pmic_plat_data);
 
-	if (pmic_plat_data->pm_off && !pm_power_off) {
+	if (pmic_plat_data->pm_off) {
 		/*
 		 * The PWR_OFF bit needs to be set separately, before
 		 * transitioning to the OFF state. It enables the "sequential"
@@ -515,8 +515,11 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 			return ret;
 		}
 
-		tps65910_i2c_client = i2c;
-		pm_power_off = tps65910_power_off;
+		ret = devm_register_power_off_handler(&i2c->dev,
+						      tps65910_power_off, tps65910);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register power-off handler\n");
 	}
 
 	ret = devm_mfd_add_devices(tps65910->dev, -1,
-- 
2.53.0

