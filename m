Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC823B3895
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449936; cv=none; b=WZM+BgzY7RMougVaKiZi0RDv/Z+gHyOzSyr3zP2eduC7KT7VQMW9y/3FounRpy35NUeZoCyMDmbMUFsj1lbDOwCyCRxMNrc/8y0Ct/Gzp5bVoShmYOGhbIcnsueNzNz9TwGfflDAtpLAeuYbozF8yenb4zFq1lpLLHm6n6WAdbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449936; c=relaxed/simple;
	bh=ihhu/GEm+uqCbuT3u186bfu9O3Hq8yZsgSx6Y24WwhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DOimkzRUQbZ5O75fa5SNY5lVvpghbw9CKmDmIDgaqazh6fjSHpOemhnG5r2DmMvso7OlvXAw5ID5avjtUsDX6YO5Wn8+VONLVYxkgKHFnIIeveDCjSCMoKgsS3OdQD/AsDrCXRZjGOKpeY7HnNrQBFvVFbfE/XNLdrm137Htasc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdW8HILo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdW8HILo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so38150835ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789449931; x=1790054731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQubKTox3I80hScamzBIXxVmWMWZlyR15SjYB1u9qiM=;
        b=hdW8HILomqXU4LWH/c2oE5xgswDPGpDcQHPEhiWWXd59Zth9M8Sgm8XBH/a4Fc1Fau
         C27+UbuVKtuPUyaaOidrChvZRDub6vDK3/t0CuArpUtEYyuj3Mi1eL928QIFxrvnoqer
         1gBTw5IFs+0xJP0Fquk2UdDyVKOn/Tl7s6wgJWeB1R1mzVIYdVPI6sOzINh8jxjojcdR
         0hUxWkT9MJoYwTFkPIvmEsHJor46ssNqxVgGjb/JnqOAVNbuw5UiiRDnGJj+8xzI3qPc
         7APmJpmX4J2ZGs9jM56JgKTkJCLeQXj25FplfghchZsoNBHzbogQRHVSmrE0syax7NE6
         tSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449931; x=1790054731;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQubKTox3I80hScamzBIXxVmWMWZlyR15SjYB1u9qiM=;
        b=A0tqt93XwH9TBtECP8SKVjgIvcEl4B3krr80jcgWHGoWASbARUEoZrWHZdeyRwQb+G
         gXvAfgtQevXXgDgsiwtvq9wTD/k5pXEv6Ptw9jGuEKLelh7Ja+PaAseWxUeihWo/KfwB
         NgXaHROMe0xhdIjQXISq+g9EeDrFLAxgumy3w4FHDZ7hP/aD9M3Zs7WWHRfQylEJtuTv
         C5RCw6wtRaUI6SaI/ocDSkm4ekbaORT55f7B+uBJ1aI7ooPqljy+InQuZV0uqP68eGNG
         MUTO13tTHNti+susOZPPOlDLPvu6HHiWdmzDCHXbLyTn1xb23rsuiQIGZHaq1Rq9qM3K
         17EQ==
X-Forwarded-Encrypted: i=1; AKwUvByBlElUlg2+VFHw8ZBAHU5gy1X4g+LYXilpm4gHWDu09ZQIP0EKKDmTvhLZ0LCsb9+nhv4kxEXf72GMbfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ3LHQX4dbvaetMZfYp4Iys8KIwK7YA7cqdqMVjlUkp7lte/3a
	K+Az990VHLMPS/Efo3GgsIYHuhvbPTjWbMwf9o1yvpHl/yspGmtTP+aO
X-Gm-Gg: AYBFou0GRqhdsEK5PITIopxYebWI+Vouti607FNpIy1AKKG9LR9qIeB/05vL6c01Q2e
	vf/3EzAd6gnNlFdIkUIP+/+0kMGI079a0SZ+5pZrFMODEVlwnHapA1uvOUiFK/1eumgsQIPbEC8
	g3506lcCOnpjopwDSc6OR47CuYqSXAh8v2RjrPGcBh7w0xx5NfMPYTcQ4GpU5SMJo4Zvyj2TT3L
	A50/lkLFOK/+htg/UaBr94vbTGEBlCavNvvOM03UifwxbWkplTo2OKtrjgsHwF3xBVP9VkscLOH
	CM99xsr2QF4tGKgs5IFqyy4dg685tI8H+enpMXFBgL0qoxb2qBCs+sJ6drslSumKQ5aBtE258Bn
	KS/I5A1kZv1oOPKkX21lfdeZcFipZJLPstnn8SB5YBmrixzNem2yBMg8uiA6S/UhaNa+aRt//Ec
	bk3kpYFFiN9ZkP+RHADV6MxMxMHWtBdF61lMq+xi9NUa2j8xGY87gcX51DATc1g7B0KeKk7GfK4
	apVkRKpCA==
X-Received: by 2002:a17:903:8d0:b0:2d7:107c:917b with SMTP id d9443c01a7336-2dd6c46714bmr123949285ad.0.1789449930877;
        Mon, 14 Sep 2026 22:25:30 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff67aasm59718445ad.79.2026.09.14.22.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:25:30 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] power: supply: max17042_battery: Make the fractional LSB macros safe
Date: Tue, 15 Sep 2026 05:25:29 +0000
Message-ID: <20260915052529.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The fractional LSB macros expand to a plain division, so they only work
when multiplied first and evaluate to 0 anywhere else. Take the value as
a macro argument and apply it with mult_frac(). No functional change.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202606062322.TyvCPB3l-lkp@intel.com/
Assisted-by: Claude:claude-opus-5
Assisted-by: Claude:claude-fable-5
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/power/supply/max17042_battery.c | 30 +++++++++++++++----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index a53970af56cbb..861b5dbc11c1e 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/math.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/power_supply.h>
@@ -57,10 +58,15 @@
 
 #define MAX17042_CURRENT_LSB		1562500ll /* 1.5625µV/Rsense */
 #define MAX17042_CAPACITY_LSB		5000000ll /* 5.0µVH/Rsense */
-#define MAX17042_TIME_LSB		5625 / 1000 /* s */
-#define MAX17042_VOLTAGE_LSB		625 / 8 /* µV */
-#define MAX17042_RESISTANCE_LSB		1 / 4096 /* Ω */
-#define MAX17042_TEMPERATURE_LSB	1 / 256 /* °C */
+/*
+ * These LSBs are fractions, so they take their argument rather than
+ * expanding to a bare "n / d" token sequence, which is only correct in a
+ * "value * LSB" context.
+ */
+#define MAX17042_TIME_LSB(val)		mult_frac(val, 5625, 1000) /* s */
+#define MAX17042_VOLTAGE_LSB(val)	mult_frac(val, 625, 8) /* µV */
+#define MAX17042_RESISTANCE_LSB(val)	mult_frac(val, 1, 4096) /* Ω */
+#define MAX17042_TEMPERATURE_LSB(val)	mult_frac(val, 1, 256) /* °C */
 
 #define MAX17055_DQACC_DIV		32
 #define MAX17055_DPACC_FACTOR		44138
@@ -138,7 +144,7 @@ static int max17042_get_temperature(struct max17042_chip *chip, int *temp)
 
 	*temp = sign_extend32(data, 15);
 	/* The value is converted into deci-centigrade scale */
-	*temp = *temp * 10 * MAX17042_TEMPERATURE_LSB;
+	*temp = MAX17042_TEMPERATURE_LSB(*temp * 10);
 	return 0;
 }
 
@@ -214,7 +220,7 @@ static int max17042_get_battery_health(struct max17042_chip *chip, int *health)
 		goto health_error;
 
 	/* bits [0-3] unused */
-	vavg = val * MAX17042_VOLTAGE_LSB;
+	vavg = MAX17042_VOLTAGE_LSB(val);
 	/* Convert to millivolts */
 	vavg /= 1000;
 
@@ -223,7 +229,7 @@ static int max17042_get_battery_health(struct max17042_chip *chip, int *health)
 		goto health_error;
 
 	/* bits [0-3] unused */
-	vbatt = val * MAX17042_VOLTAGE_LSB;
+	vbatt = MAX17042_VOLTAGE_LSB(val);
 	/* Convert to millivolts */
 	vbatt /= 1000;
 
@@ -330,21 +336,21 @@ static int max17042_get_property(struct power_supply *psy,
 		if (ret < 0)
 			return ret;
 
-		val->intval = data * MAX17042_VOLTAGE_LSB;
+		val->intval = MAX17042_VOLTAGE_LSB(data);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_AVG:
 		ret = regmap_read(map, MAX17042_AvgVCELL, &data);
 		if (ret < 0)
 			return ret;
 
-		val->intval = data * MAX17042_VOLTAGE_LSB;
+		val->intval = MAX17042_VOLTAGE_LSB(data);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_OCV:
 		ret = regmap_read(map, MAX17042_OCVInternal, &data);
 		if (ret < 0)
 			return ret;
 
-		val->intval = data * MAX17042_VOLTAGE_LSB;
+		val->intval = MAX17042_VOLTAGE_LSB(data);
 		break;
 	case POWER_SUPPLY_PROP_CAPACITY:
 		if (chip->enable_current_sense)
@@ -473,7 +479,7 @@ static int max17042_get_property(struct power_supply *psy,
 		if (data == U16_MAX)
 			return -ENODATA;
 
-		val->intval = data * MAX17042_TIME_LSB;
+		val->intval = MAX17042_TIME_LSB(data);
 		break;
 	case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
 		if (chip->chip_type != MAXIM_DEVICE_TYPE_MAX17055 &&
@@ -488,7 +494,7 @@ static int max17042_get_property(struct power_supply *psy,
 		if (data == U16_MAX)
 			return -ENODATA;
 
-		val->intval = data * MAX17042_TIME_LSB;
+		val->intval = MAX17042_TIME_LSB(data);
 		break;
 	default:
 		return -EINVAL;

base-commit: 4fc88ba435dadbc05990951e3f3fbd8ccd2df140
-- 
2.43.0

