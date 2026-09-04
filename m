Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC34470457
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519393; cv=none; b=X04FppjLyH4IWcGrnKZZdWKyRpKbofMbS4DPPiKuFag7LLVk3EfbiHwmDwzgRRvMTRumt1PboZgBoQ5GUgnkrNMKJpRh3cj//bxBIpiQ8VQCHyamtGpz56JUPTDiUfrIAdtwPoXLtXpv3f+H7Q1jm0cztd1t+g3yCi1dHWUbMi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519393; c=relaxed/simple;
	bh=sVWjRkAHWSkKpr1dkXbQgajR6qipPKRY9bRmcVq4MbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SfABpv2r9mUzxY9+9SErFjnCzcz37habYIksJIp+ja1Wm3W86hs4UprCDche8bD/JEXA+5YD6u4j3a9XkEEpxOFV703roiC3i+EJbOBSuhyNUJt5ixgermQOCMNkcka4EKdcuwNSZUQKQQSfRNaTuimJ69OXHQ8+MXtmHT1mkJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbeccoGr; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbeccoGr"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e27035206so712328b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519391; x=1789124191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKWiBHnbeuyfVQadxWRuxU7x8s81hSNQ5TTmrQKqK8I=;
        b=hbeccoGrQbxKvo/sP3WOn+Q2qyCdecsYsJLDJLLVb42CytCfvx8h1VgNCnMguV1f2X
         czUA+m9LT1AOeowH5BOAjAmnmHpPCixJNxFX9QRC8Bt12RykrTO80WWqKuBoep264/Uw
         U6IeTzmcZzlc/49Wu5fQ+zMOYmXZspFrwciv0Yd9f8IEHGPWkLtJ05pb5nsM0xT3wQnh
         lcq7tbUz1k/8LnvzkmaU+fE+rHM8r3B6G4veA5N5LjsrZC2Qy4z/ts3TqWdgGEdH+8fi
         NoyRYwZsnkNsm6m94Usz6StoUNtbqlJeOK4bmQqU5u/thetwrOO8YjxrK5Q5lIYkQ/77
         4TkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519391; x=1789124191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKWiBHnbeuyfVQadxWRuxU7x8s81hSNQ5TTmrQKqK8I=;
        b=TelbzrBvoCe0j6YQfQbXXZHrSH16HvHt/HajZHfOHuOjpMiIpVLrDs8AoCQ4VccfTH
         0BRR3HXiZigMUbNBYZOqaU+EyLrq5Vzny4YGegPpy15i8zP1EGYnDlIOcWN6MlinXDGA
         +8HpMxKVpqRph7OcpThGSc5rlWWZ7eAKSznzloAqL9OeHX7UuWPoYvrMjPE9tuKdhwRR
         hkay3Ji2hVJ1dvb5jqUabwbJRRlvY1FHoBxt2ms3rAXxuI6pOwUjVFwLQpAqI7/yNfLV
         woLHTW1oZgxvQyoTU9BvJGWgJTsyMIbqPDi7xEt9SIS6nxShUKRlfaZy9Rbbzh81bJ81
         7V1g==
X-Forwarded-Encrypted: i=1; AKwUvBxWh2SOtLdFe0HJG/KWzC2M2LjkxAGD5oPantxZGjre7ccvQq9CkcE3HvvIAMQdJp6kdd2HFVtmXlCpCQo=@vger.kernel.org
X-Gm-Message-State: AFuF++mjEmb5nA45Z3xKF9jQhngwhsdbrFGD8iwzb8qaoRTTU1FYj3z5
	0tnyJsiZzvMQg2Wcd3n8iVS3ZjaotfCHOcSgEPAsTE/v82EnCGHF8aY=
X-Gm-Gg: AYBFou0ojZb38vsdSsm7DzuELHpF+slZLIgWXi5MshCA1DysPEWGCXstYEvm1BSn5F5
	N0eaU47peKkkNRVcDSahTWmGt7jGO/8rxd0yAXaZHjiSz2ORo5AqgU9n+21f4inxAI0z5DBnSjE
	d3Vj2b4DEAel41LAH/e9yYq5xB+bwXm3z+aG9oS1NzThVA5xF47IDC3d1V6UwJLPoHcv0UOCTQF
	HWdgqqly7OgQIPoZ7ekceJ/AA8QyUR87m/OEouVC7buj+0XNvchUPQXU0ZE0+3ZRYF2h7yEYIxr
	hK3HfQF7zCU391foQ7juH089+GK+H+/EvV6Y8+9LhOd3E5DupwE2VraTiV2eI6rD8q1YYHQvuC+
	unYJeiNABYg0u6ViqtX5BSwRtVJxr6AFLA9rQpXZMTT4uWuWNsp6sZDFcwxli5QqMD18tC/8J2/
	vZU0jkdq90SHc0RoyCcVgsY8vxCP94jFAY4gRBgzJTQO9hVPMPwDTgyrzS6iUZeMysMioBOTSs8
	V8On+bJxl+4fKm6
X-Received: by 2002:a05:6a00:2d0c:b0:851:8baf:5b26 with SMTP id d2e1a72fcca58-86169e73d2dmr7122541b3a.14.1788519390041;
        Fri, 04 Sep 2026 03:56:30 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:646d:d1b2:8c1b:44c5:3083:7fda])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-861520404f7sm1018680b3a.16.2026.09.04.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:29 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: samkay014@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com
Cc: imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: pf1550: fix which regulator is notified
Date: Fri,  4 Sep 2026 19:56:24 +0900
Message-ID: <20260904105624.48577-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt handler distinguishes the rail that reported the fault, but
the body ignores it. Every SW interrupt walks the regulator array looking
for the name "SW3" and every LDO interrupt looks for "LDO3", so an
over-current on SW1 is reported to the consumers of SW3 while the
consumers of SW1 hear nothing.

The lookup itself is unreliable as well. rdev_get_name() returns the
device tree regulator-name property whenever the board supplies one, and
only falls back to the name in the driver descriptor when it does not.
The binding example for this device sets regulator-name to "sw3" and
"ldo3", which strcmp() does not match against the upper case literals
used here, so a board that follows the documentation gets no over-current
notification at all. A board that names its rails after the schematic
does not match either. No other driver in the tree selects a notification
target this way.

Replace the name lookup with rdev_get_id(), which returns the descriptor
id set by the driver and cannot be overridden from the device tree, and
take both the id and the event from a table indexed by the interrupt.
The die temperature interrupts keep notifying every regulator since they
report a chip wide condition.

Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 drivers/regulator/pf1550-regulator.c | 82 ++++++++++++++--------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 610eac9bb9cb..ceee553a84b2 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -283,63 +283,61 @@ static struct pf1550_desc pf1550_regulators[] = {
 	PF_LDO1(PF1550, "ldo3", LDO3, 0x1f, pf1550_ldo13_volts),
 };
 
+/*
+ * The _LS interrupts indicate an over-current event. The _HS
+ * interrupts, which are more accurate and can detect catastrophic
+ * faults, issue an error event. The current limit FAULT interrupt is
+ * similar to the _HS.
+ */
+static const struct pf1550_regulator_irq {
+	unsigned int event;
+	u8 id;
+} pf1550_regulator_irqs[] = {
+	[PF1550_PMIC_IRQ_SW1_LS]     = { REGULATOR_EVENT_OVER_CURRENT_WARN, PF1550_SW1 },
+	[PF1550_PMIC_IRQ_SW2_LS]     = { REGULATOR_EVENT_OVER_CURRENT_WARN, PF1550_SW2 },
+	[PF1550_PMIC_IRQ_SW3_LS]     = { REGULATOR_EVENT_OVER_CURRENT_WARN, PF1550_SW3 },
+	[PF1550_PMIC_IRQ_SW1_HS]     = { REGULATOR_EVENT_OVER_CURRENT, PF1550_SW1 },
+	[PF1550_PMIC_IRQ_SW2_HS]     = { REGULATOR_EVENT_OVER_CURRENT, PF1550_SW2 },
+	[PF1550_PMIC_IRQ_SW3_HS]     = { REGULATOR_EVENT_OVER_CURRENT, PF1550_SW3 },
+	[PF1550_PMIC_IRQ_LDO1_FAULT] = { REGULATOR_EVENT_OVER_CURRENT, PF1550_LDO1 },
+	[PF1550_PMIC_IRQ_LDO2_FAULT] = { REGULATOR_EVENT_OVER_CURRENT, PF1550_LDO2 },
+	[PF1550_PMIC_IRQ_LDO3_FAULT] = { REGULATOR_EVENT_OVER_CURRENT, PF1550_LDO3 },
+};
+
 static irqreturn_t pf1550_regulator_irq_handler(int irq, void *data)
 {
+	const struct pf1550_regulator_irq *map;
 	struct pf1550_regulator_info *info = data;
 	struct device *dev = info->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	int i, irq_type = -1;
-	unsigned int event;
 
 	for (i = 0; i < PF1550_REGULATOR_IRQ_NR; i++)
 		if (irq == platform_get_irq(pdev, i))
 			irq_type = i;
 
-	switch (irq_type) {
-	/* The _LS interrupts indicate over-current event. The _HS interrupts
-	 * which are more accurate and can detect catastrophic faults, issue
-	 * an error event. The current limit FAULT interrupt is similar to the
-	 * _HS'
-	 */
-	case PF1550_PMIC_IRQ_SW1_LS:
-	case PF1550_PMIC_IRQ_SW2_LS:
-	case PF1550_PMIC_IRQ_SW3_LS:
-		event = REGULATOR_EVENT_OVER_CURRENT_WARN;
-		for (i = 0; i < PF1550_MAX_REGULATOR; i++)
-			if (!strcmp(rdev_get_name(info->rdevs[i]), "SW3"))
-				regulator_notifier_call_chain(info->rdevs[i],
-							      event, NULL);
-		break;
-	case PF1550_PMIC_IRQ_SW1_HS:
-	case PF1550_PMIC_IRQ_SW2_HS:
-	case PF1550_PMIC_IRQ_SW3_HS:
-		event = REGULATOR_EVENT_OVER_CURRENT;
-		for (i = 0; i < PF1550_MAX_REGULATOR; i++)
-			if (!strcmp(rdev_get_name(info->rdevs[i]), "SW3"))
-				regulator_notifier_call_chain(info->rdevs[i],
-							      event, NULL);
-		break;
-	case PF1550_PMIC_IRQ_LDO1_FAULT:
-	case PF1550_PMIC_IRQ_LDO2_FAULT:
-	case PF1550_PMIC_IRQ_LDO3_FAULT:
-		event = REGULATOR_EVENT_OVER_CURRENT;
-		for (i = 0; i < PF1550_MAX_REGULATOR; i++)
-			if (!strcmp(rdev_get_name(info->rdevs[i]), "LDO3"))
-				regulator_notifier_call_chain(info->rdevs[i],
-							      event, NULL);
-		break;
-	case PF1550_PMIC_IRQ_TEMP_110:
-	case PF1550_PMIC_IRQ_TEMP_125:
-		event = REGULATOR_EVENT_OVER_TEMP;
+	/* The die temperature concerns every rail. */
+	if (irq_type == PF1550_PMIC_IRQ_TEMP_110 ||
+	    irq_type == PF1550_PMIC_IRQ_TEMP_125) {
 		for (i = 0; i < PF1550_MAX_REGULATOR; i++)
 			regulator_notifier_call_chain(info->rdevs[i],
-						      event, NULL);
-		break;
-	default:
-		dev_err(dev, "regulator interrupt: irq %d occurred\n",
-			irq_type);
+						      REGULATOR_EVENT_OVER_TEMP,
+						      NULL);
+		return IRQ_HANDLED;
+	}
+
+	if (irq_type < 0 || irq_type >= (int)ARRAY_SIZE(pf1550_regulator_irqs)) {
+		dev_err(dev, "regulator interrupt: irq %d occurred\n", irq_type);
+		return IRQ_HANDLED;
 	}
 
+	map = &pf1550_regulator_irqs[irq_type];
+
+	for (i = 0; i < PF1550_MAX_REGULATOR; i++)
+		if (rdev_get_id(info->rdevs[i]) == map->id)
+			regulator_notifier_call_chain(info->rdevs[i],
+						      map->event, NULL);
+
 	return IRQ_HANDLED;
 }
 
-- 
2.53.0

