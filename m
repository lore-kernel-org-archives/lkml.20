Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733324;
	b=gqAAlBsSTsrHeTNKXPGQck+cYCbATWb/AzI7JYB0lk92Znv6jSMKYgSGkHCOehHrGr+x
	 m209rhk0ljqeLO6smYzEriKPtdW6+JsbPVnqrHkWVYUL2dzTn+puDCOO8Il/wSZWzKjdF
	 HuTSwDodq7hx4Ng6PxdxWI0OmSomY1YZG/QfaFiTVsx8IRTK6utNZraVtU0SrfRtiXyRD
	 yWjgRL/dU2CPzHuE9RJTXq49gEaIVQcW8lkcUclVdaVyIC/jC4vdihH6DnkydfUpNQSRg
	 OpK/uO1bgF4f5gORVNcH9E1zTUxjitpUCG4s63xo7OehzI5sCKD84cd7TGYH2Mn2Kvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
	b=sKqzsKyTuyTsPY9gLkVWBT2Aef1ML+JJ64nwTpy2oWRVkIrn4gcPr0caxU3rAjP2hEUt
	 lrXQJnasJ3CXzt0LkwgNpf4/qDK4uVZYHM+8b+SxLVeyK5I8RXTEvumQiW65GoqiRP+HB
	 Ahzd1IwcwwDEitlYTRPYJZGtUW8lTwix481yF5UjauDC+qSTOL2CvnQE6zVIr338F+WKl
	 sGgOaCfDcGxSva0NiVoKIwheiNGWS0oHnN27q04VGMbxwvM2eTAIAawt1U43aO4SZ5AF5
	 hiMCsMR9kWWqDb9Tw4PYUWMLhbcdm79gHR7Sg5en06AyeoWE4RToRK/s0PtDv8uW0Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNbn5TYI;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DD2606A8A9
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55DD2606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNbn5TYI
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50604721c8so430400366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733323; x=1795338123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
        b=MNbn5TYIf/3m158dUPO7+7WNtkW/VRabw5aJK/Aw7+W3D6EUxYKIp3BighUBxk0q4S
         NAFkfHGSGIQ7Y6v4R6xpWg80p7qkmOzVe72k0+j+26NLpCHFGr6D6gKd+T3y9M9pD5yG
         iAm9bnETom8l099Y31vOryZVYcp2dxUj4UQ2zfpDh6/Xcav3L+Lh+hiiyAbD48vxhrnv
         DGM+SqMJ4/iIahbcaVYPUP7Smvj2wS8qqDVW6aXdFcDb7i3FUsoGaTQRrkzzDPOoCFAu
         fMw0HGC7ARk6UTBPZCRHoA15EiwewHSlarDvTREpcCDu4MoF8nVw9znHvBIczylSuwWo
         y4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733323; x=1795338123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
        b=JaNVGF5XPQAIXZdpTeQAK7/imzh2JWcCp1Y4ZVba0R7ZNHS6OQ4TAcqp1zT9HcbOSf
         VR+HGuinMgS7ji135PPfR7K7IqSghj5InR7uWGUogyqaCAtl3FYcEYJec96PSNzZ4I8X
         hg3mjdYA5xk6z2+XECLUfpLEF+CZt4Advy7dletLAcf/0a3EPpGT9X6vDVhw1l8jFKe6
         KEySrIcq9U4AgdJrvc4X8kTdSMzxjE5YMFrDkcMSTwBrXhEohWvo53SY15I/UVu1NqUt
         NbHdjKDjh2n6QRl9wKNcy9ax4PnFEagqh/msHsAKywGEi9FHEVYtJLOnRKMguXp8wL2R
         EapQ==
X-Gm-Message-State: APuU4Z/8I62GpQQvUIWyfrNYGk0jB1L2EGdJLAMAbO68V75++tJHjpCO
	8foOphhkWkbuhBl0/xmcBmmWcTAP4wLv/5QFftoQyOuWmnwU55s/bw9r
X-Gm-Gg: AYBFou05Y51sqYZk08fsk6EuLqbRFWHIYMDPLYKVBcSShinfxLIi4geM/vbMTaJCwG1
	Hfyq1cVcLvkQKz71Hf/hdYW4cM6aQY0l0NPYzK8soDyIAqneFjgchkhwBoot/EXKp0dsQs74Y0v
	2SRwCWhLRSNFS7V3r8xy9SSQMKrMU+iXuZ8h9vJCKe9AMSHr7vStZtidLLpTAL6kKPOpiA0E5DH
	uzKCID0ZLMgk2RABGKF4bTzKioAdBk0tc32kv22XQ90oZrpXBF9K4GuutCSMcmC4KWUaCd2Au0U
	PFlmsN4EEm9mlO4MdxdHN/w+6eVkZquUcs5kwnZmvbSaHeqoS6tt5wnClc2gKDHdAHBd9C2b1Kr
	8J2ej/jwFYsL6TTNBAHrZlGSqQny9oSp87GQtHnlG9LSpxpWe6UIiOts2+OdSyyo0/dTNv7dgjF
	9rjqZzaZ1EQnm3zPGLSrusPr0+W/d0fkrSOqgI5XoAPZQNEz0CdNjEBWPki+qAMAHg60HEpSCfR
	eIxiZR9suR37Vceid8nXuW23JKg7KHFW+sNiaMnVmv8hK+D/ohVPAD+rJEh86dDIUUVbE+GSTlk
	H4c+4xAChTtWjkqbPq4xH8k1Zgjo2YJYKFFjO1t+7R7zE3eO0HjTwp2qcLKqet5pasL5xdSawY2
	eBPrQ6T92aw==
X-Received: by 2002:a17:907:3e8b:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c50964101demr575842866b.39.1794733322499;
        Sun, 15 Nov 2026 01:02:02 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:02:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 4/5] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun, 15 Nov 2026 11:01:46 +0200
Message-ID: <20261115090147.95337-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_power_off_handler() helper.

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f6d7a4ce9712f..8412dab2133e3 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,11 +174,17 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to power off the device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
@@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
 	if (!max8907)
@@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

