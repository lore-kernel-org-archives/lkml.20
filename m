Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CB75304D6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700754; cv=none; b=VFvuf58VXGACP/B/lY5F1W2JXMT6QuCiT5vtWvyU03IMiJI6vhFXRcpmIHBC9/hH5FgpzHpleSMlzY+B0jOWrEML70wJc+ACow0Jscjb+jF0euGw/L7glLKRwmfNAB7PAZSNKBjgRLMUaeGOdL4altOZbo4PWP5u0V5TEh0ewAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700754; c=relaxed/simple;
	bh=garHynZi9tpyUpuiY2Mns/z5ds0lhdcmol6M4bRL3Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obJ9GOkeZnTv+O2P2o7PBszNQxqlOMjbh9XcHgxTAP9x7curz3DPnKsQEGYluXFTnlM4+rFSs60L7O/2+Z0oDrBD8L4IccUZBuebCd3+lCw/plIp/44NYMFZ0xIgnrG5yFGdrznQNtG5Co0lwdOsY1sg/z6Gc14YCbE9/x7urxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3jjTkB+; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3jjTkB+"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a770b3ee1aso2070581fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700751; x=1791305551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sds4TIuZN16FCLiHCd+CfdEgVg5/yfqoMnUiuuwQ3p4=;
        b=Q3jjTkB+2KM879dbceItHywl4mIC5tT0HxIpVFvVV+8lOtRSWHs/vjP3uU4FiRzT6o
         wMF0qcULMTE2Crk1jB3AB2Qr0QZtLfSbOQfKTFKDGQ5D4/A6KxQDh7vKE0IUXBcSDz+o
         e0oaJ+G9MMkTtqJW90CscWCEyXV9xkwtwIpqLL3BCLIYoq32w0sZVmJ1aLyKzWZKUDLr
         XoVybiRjICq9jNXHG7Sq8hWGecWtYhMVON2o/wEBFi23HQ6iob3h1se5aaycPe1Sog35
         JrNUAs9uXFrryJtL4JPB1XCdA7EAhmac0tcmfjK7zSaRXPVaNoCTUW5CTU+vxg7NYSLr
         bfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700751; x=1791305551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sds4TIuZN16FCLiHCd+CfdEgVg5/yfqoMnUiuuwQ3p4=;
        b=RwkH8etJLqQ22AhNF57+QqXYqhR1Wtn6yk0xqWXeQVdL+PvfknixaUAzF991y3JAj7
         fQDrpQRIrgfMAPyNMOxAi85vM4X3LjIw11UJNojviWp5p6ib10f57/8hG2ERjY8yw2Hf
         gFHZetOWFmndzxhYNMyMvQu1IPYvDWDN3QHWnwyDMobRmNq1SpwzKvETY9IISGSNu44V
         Z99BB87P/Jk6RCqsqtzEz2s26Pdp/GuGQ9TPtskUQWtgOnRH3mRZ95djvJ9+d/VICGSO
         d9dnTASAm62Kabah1nixXEF+GdmR5PiOH/8JlyjFS7qh6TtYINHNY5SVbob27OzuSbj+
         uUrg==
X-Forwarded-Encrypted: i=1; AKwUvBx3D7by3tq94gDTOo0T5ltRa9oxcdK12RUVf0mi7jBhE1J//ULlaUJK5/qtpDb3NyqesgrAzeo5psJBClU=@vger.kernel.org
X-Gm-Message-State: AFq9FYISiv17EnBvK+GP578AM6tOx+mZ4sVtGuPvvzPEjBKFQsJZfMVj
	BK2QCLStGJFXQqqEGMXdr8g7Ivabox+yPir46rpJjCMhB3qq9zs7p2Y=
X-Gm-Gg: AYBFou3YTgsjsUJHsLsqYdtNeVkmnwFats6NfR9ZExUAD6FMmjJZ0JDc3FPjxV09uVr
	e68fsHcBedv5jZXUsLOM02a4S9YN5MhKATiKH8bOVo9etsBGQ7nUUEZpDYG/YrO9MlePzER/IvG
	IA7SXdEVzZN+wQj6jeNSGkkO6Q0lJTzfZXhZrxi2yTYvh6bJodrdgPk2rLGf5LthR5vBqh8/gfu
	i1Qanpfnz5fhFlKfX6RxDB2ZCTXOiS+XGI/1O9KfbpkvUOWKWSOS6p37LSTzBkA94d08hyetI0v
	1aVexfBnwslLVQ8Dm/ufK6l24ySiBBsRh3eQeNN25UlyxuL9no/4cSWND3q7xdItkxWk+p1z3R9
	oihMHtzp6vgRMPMg/Wkb3ykgcr1JqkKl8v324uID3P2CxeDURcSS8tD3t4vpaSkCu1rWkHPHwv7
	Y/0fnZ9VLtcb+w87Us4w/xavS3hqaJ22/GIEGfBnWTB/NpVJXTlyJ2/5nS5ZH1
X-Received: by 2002:a05:651c:324f:b0:3a5:8d4d:470d with SMTP id 38308e7fff4ca-3a7717d4ab2mr371471fa.18.1790700750439;
        Tue, 29 Sep 2026 09:52:30 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:30 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v3 1/4] thermal/drivers/airoha: Fix AN7583 ADC mux field mapping
Date: Tue, 29 Sep 2026 19:52:06 +0300
Message-ID: <20260929165209.69669-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929165209.69669-1-sochnev.v.74@gmail.com>
References: <20260929165209.69669-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On AN7583, bits 3:1 of 0x2e4 select the sensor (0 bandgap, 5 GbE, 6 CPU)
and bits 3:2 of 0x2a0 select the diode (0 D0, 1 ZERO, 2 D1). The driver
names them the other way round: MUX_TADC is 0x2e4, MUX_SENSOR is 0x2a0.

v5 of the AN7583 series swapped the airoha_set_thermal_mux() arguments
to match these names. The diode index now goes to the sensor selector,
so the zone reads mux positions 1, 0 and 2 (PAD_AVS, bandgap, core
voltage) instead of the bandgap diodes. On a Nokia XG-040G-MF the result
crosses the critical trip and the board powers off during boot.

Swap the field definitions. MUX_TADC then selects the diode, as on
EN7581, and the existing call order is correct.

Fixes: b20d9782756a ("thermal/drivers/airoha: Add support for AN7583 Thermal Sensor")
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index ea3e2649c280..1b187c41baea 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -18,10 +18,10 @@
 #define EN7581_DOUT_TADC			0x2f8
 #define   EN7581_DOUT_TADC_MASK			GENMASK(15, 0)
 
-#define AN7583_MUX_SENSOR			0x2a0
+#define AN7583_MUX_TADC				0x2a0
 #define   AN7583_LOAD_ADJ			GENMASK(3, 2)
-#define AN7583_MUX_TADC				0x2e4
-#define   AN7583_MUX_TADC_MASK			GENMASK(3, 1)
+#define AN7583_MUX_SENSOR			0x2e4
+#define   AN7583_MUX_SENSOR_MASK		GENMASK(3, 1)
 #define AN7583_DOUT_TADC			0x2f0
 
 /* PTP_THERMAL regs */
@@ -636,8 +636,8 @@ static const struct thermal_zone_device_ops an7583_tz_ops = {
 
 static const struct reg_field an7583_chip_scu_fields[AIROHA_THERMAL_FIELD_MAX] = {
 	[AIROHA_THERMAL_DOUT_TADC] = REG_FIELD(AN7583_DOUT_TADC, 0, 31),
-	[AIROHA_THERMAL_MUX_TADC] = REG_FIELD(AN7583_MUX_TADC, 1, 3),
-	[AIROHA_THERMAL_MUX_SENSOR] = REG_FIELD(AN7583_MUX_SENSOR, 2, 3),
+	[AIROHA_THERMAL_MUX_TADC] = REG_FIELD(AN7583_MUX_TADC, 2, 3),
+	[AIROHA_THERMAL_MUX_SENSOR] = REG_FIELD(AN7583_MUX_SENSOR, 1, 3),
 };
 
 static int an7583_thermal_probe(struct platform_device *pdev,
-- 
2.55.0

