Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852114D599A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405090; cv=none; b=csndRg3LUuQMyMd7QluooJEdAW/EVPrYEaIa7tvGW+bGdZmVxu1rnNNKTCwT38Af0Lv7npCc5ooIJDS/g1uJXzZxGr343ROcEA/hwpAOl6jbby5M0Jrvc9oJDuTcRJDXiux+kLdMS1zkaLf7xAa5eRefCwcUHmoTUO8HV6XxaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405090; c=relaxed/simple;
	bh=V+0aAcFUCH1cc6EO5h875PHuWNEBDxi02UU0k+Kbco8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sC7FDb6VNJ6miqYJQTMigCxEHboxSIlUs1kXR/ROCBhb2FiNLSER8XpcYyX7wWKYzH7hVdtW0v9s5oWlYRfVGGrLMWmg26sGUcec6KcPfzEr0EPN0pPqlZK/t05LNx5VgXfNYM20kWYrYM8Nga8wXyTROhF0dpboHPpZAL1zfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1MFnrQm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1MFnrQm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1592705f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405087; x=1793009887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPA0grO6lR0vtnEVLynRjMdDas+begIgQ2sOW1izRNU=;
        b=J1MFnrQmGQuShX6qYHkCwq5tZzZ9oVaK0RmibBQuSMy3UF8ATneQKL+IJCShNdqKwU
         1d47fvoZM8PGEDbBai6IWWGqnDcBiPkeaY6SaxxpelWbxCP2IYYLCAUVe+dIUvxKD7jO
         X6f4BLaXgBlPljFblX/zu141ZsJ504iLp6vYZeXOB7HVZ2oN7QIPt+SzwIUzWT1FPG3C
         fN5LrW8lCE1MlbdYs4tW6HpR4GSjmf135E/0KItxTNNigK5BjhliCoWsfr6g9j6FLIat
         cyYRpLFp/DhhFnL9UhB9XQJV2IO7wNqe7PQjukSKkDMaZMvSNEv4tcIiAgk20t/hAQGe
         WSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405087; x=1793009887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPA0grO6lR0vtnEVLynRjMdDas+begIgQ2sOW1izRNU=;
        b=aiAd7SlAnFj7qwN8qyxr8w8G71KtntQcwPXOLfXU5zbFykqNoE7CbZhpC4CZCpl8Vs
         6By1p8NjeOAPOEm1VElw11FZjVuqLmi0AK5mSjGWgyDrIg1GP6eh+1EcCi1ryTGdHWS/
         Nu5SkbGXBK6h0JhtK8r4n4job767lcL4hG6kn37CmYhbSKmTsgK9UZb1Le9k4COhZ/hB
         rtt/jwaCULI6q8c76g9SPSLjD4BV8KT5P+r+zLx+pDdteJom9BQF0FsQEW2t5Ng3ca7C
         ipBSjVgYSzyJ278PIB/sztcxolGcv+m1vRqUkphFtZwRu1SKL591LvERc+fHIV/VBgi5
         qYgw==
X-Gm-Message-State: AFq9FYJ0cn/izET8TnopgygH5IbhNXkD2nHbU1r7Ac5icqq2vRRDk1Sq
	z1TI6R5DEVVZiFyert+mNdPCcxIUwHwUcTBTmkAfIKmH01dQ998EKX5M
X-Gm-Gg: AYBFou0KkzVFJrnUagx2izqnJNpLKLkXx5jrd4gGvwMXhQ3mOv5DCgXxv2HtHEG9olp
	8wGaxzxI1HgEv2POMkwJgOeof/JSQXWJeU9vLCOeqIKKW8H/Zj7oyPV6fCKVjZru6gRgNcFN33W
	vEHYXJ9CyCU/s7rSxUk3PYmBEiCLxxP7Qcb3JNEWVOXJgZysDfNPN3hQ6EPNkuSdPtOM2DnkMdG
	+GkgpWmWIbTaQfvTIGxNnyieSh8WWlHZM28gCzzx9jXRW0qn65QwmhvNqzFaEquU/FWMJ4T8GT8
	usUpQmHqlK7tqYWfLOVYXqZE/afZEUuLMTcAx8j4S4l/nh5/1zAYq5L8RSWucvMSp9YjtRjWn3O
	UqSxqXchHTOB+FH1wdfXNkaB3WTwkW5IPNdpcvPibQ++3woYAZXKDwTswSCRtfeWOl+lXepi+dN
	ecVEhG3CezAzUD81BZHIjvzzzharVzHfdtWk8KZhwsZCVLF53YkgjhxNXLc6SspRpb/Cz31BUal
	IPiYbgZW0LNxwAbVufUcIYwjO4MHg==
X-Received: by 2002:a5d:4a8d:0:b0:48d:fd1f:9a9b with SMTP id ffacd0b85a97d-48e07f9e94bmr10227937f8f.34.1792405086586;
        Mon, 19 Oct 2026 03:18:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:18:05 -0700 (PDT)
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
Subject: [PATCH v3 4/4] mfd: max8907: Convert to use device managed poweroff handler
Date: Mon, 19 Oct 2026 13:17:50 +0300
Message-ID: <20261019101750.125439-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101750.125439-1-clamor95@gmail.com>
References: <20261019101750.125439-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_power_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index fab44be7ced57..6d5e6a1556fd5 100644
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
 
 	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
 	if (!max8907)
@@ -238,9 +243,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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

