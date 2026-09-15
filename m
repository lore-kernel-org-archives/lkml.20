Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04962439327
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492401; cv=none; b=TOLNNM1yL1wkjV0k3umwNOXPVOTvfqumANA7KF362SyU/Od6eAL6ZGRxMPLr8Lz88L7mWyztkFhiMCOcVwVOCOhmtrlZG/0kE5ayCqfdkaXfdJc+Vo0XzTlKIJ8wjr90SbuzyYwbq8jukLzjr4E1B/KRU8n5439WkF2ow5g5SsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492401; c=relaxed/simple;
	bh=qwRW5YP/OsxI03pqmCcnKn2ESNhEIHF0NnfugvT2Rec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGZA3qLtZAm6zh6TES09EbV7b6FVJ89UjhQIi2egcwMkihCmQnwyeh9TZVlea284RKbG2pqQWMewm3clTviT8I+J47YgtvhOD2kVNPFPeXsyyRQTPd/+DeXTZVaOCNmfN2AfQRy6HiWqg+2Gr7jOMCLfU+gyYcCbL7qRw26AjpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZ7N3x24; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZ7N3x24"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso1277816e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789492397; x=1790097197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRE517es95kbkROai5n0sLeTok/JKNa+OL5tekr+lZM=;
        b=LZ7N3x24VKcV0Ep6KtvOpO7XcqBkoZUL7mgIyqmHjklZEud0H+kvh+7GjgMV0BjloA
         GdNS/49XZCqE+LXfF7GoP3umOsKOGxh9pSIWAItjzK0MtPoeAJ/lUF1aw3ohVbfIQK65
         oC/v0dfPARqSdbFaEAAX5dOK6gP2er5jqiP46389pHD6mcU4IDKxebda7sliIvbgjepn
         A2vdvziOd0Cj3k5Fj43P0fgUOjA5gJZL1hXNm7QfEXmGa7yaf8RKJ/pCJAs6QN9VTpAr
         LGrsgWSsQ0583W3oRu5rpVcSB2pvh5G4kIsw+kU5RJmZJlKFPfV+hzx9Ssq2zvroza/b
         kJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492397; x=1790097197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRE517es95kbkROai5n0sLeTok/JKNa+OL5tekr+lZM=;
        b=uRXHLX62SuCRzFovWda3ywZ30AayXPKrJTn3+aWCuoaLKdFGwaNLeToCSLvS7Uim4W
         XYgBcwE6q0sPDi/NDm1rURqvywG4Ld2efRsf4PwL7oMGSO1WltZPsU42Cy7drviX24xE
         ShyR1ChBDOAN85IbCnRSagbdgQOrEV3rfc8FBILDI3cvnxFxj35nrSwFQV9prs6j4bJs
         gjM1iVibctjZItsXhJhtFbTqYoWRlIeqrymSQIAWoOeKAR9UvEr0UGoZpNR3GoA+bST3
         SmM/Js8lx2yMXAN7+9CwgEcp4Antx6eX0colc545OEEw+xtjb6b0U0T2T5ojvEi2WHFR
         LG7A==
X-Forwarded-Encrypted: i=1; AKwUvBysaHGRzSjnDqYkKYhgrzcFLE7FqirA/5OsZooOcPYjzYZMk0QBl0tUMaoDuUe/ccqf+E5ZEzucvYAWmug=@vger.kernel.org
X-Gm-Message-State: AFuF++nFBuLNZQQSv5pjfja/arvk4b+mjjI3EUHWMtxhJU8S6pjd3AN8
	vYHjnxDwgocRfNw/YPSqP9ZxQ4Fp8VA+cGdHaI5FKb0fvAQ30wD1g1s=
X-Gm-Gg: AYBFou3sGohsQNWUSxFbTCpuOy8OXwOuYni0rcz31VYqwqR2rP9u7rRtgkTbimQrQ4a
	vsCq1k0dLtVmCBBJSjyyChpy/Lej8/oM43OeLD9UAtaRfjw/wxbXW4qQfW0LKWwoH+bIIY6D0xR
	he3X2+dkTr2NKrtsdkVSaJecfaPm7YeewekY/bR8NN4yj9ddpM6JnZCasQmsw48Tm+helvkBpmi
	2NhBX6skmrXWCPAnKYpjoFzqNlLiFZDoERg1e6jSjggLhyqnzrIr+xYu2YFJdrUB9sTuGxd33Cz
	cEaeii/0OhhvmFXB/t2WDyGqHZJx4C38jGkeLEINGVvAyaMZGtmckbU5y/ELKLAyxDRk+cOeTXj
	ba74FWVrcwF1RzlbuIMe5v31ZZXxs0wwpEspnw4gPvYo5v18KraiJeqsSSyZtc8le1Xia73Hn0i
	wupGWhHoiveky67bZ4D/txcf6S2AiGzan/yvB85XpQljhuRVcakdgLZDTMqo/a+g==
X-Received: by 2002:a05:6512:10d1:b0:5b6:10bc:dc44 with SMTP id 2adb3069b0e04-5b8b2a86711mr1243660e87.27.1789492396486;
        Tue, 15 Sep 2026 10:13:16 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm91791e87.79.2026.09.15.10.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:13:16 -0700 (PDT)
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
Subject: [PATCH v2 1/4] thermal/drivers/airoha: Fix AN7583 ADC mux field mapping
Date: Tue, 15 Sep 2026 20:11:28 +0100
Message-ID: <20260915191131.25214-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915191131.25214-1-sochnev.v.74@gmail.com>
References: <20260915191131.25214-1-sochnev.v.74@gmail.com>
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
index 77b3a1af271f..2934d6aba0ed 100644
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
@@ -634,8 +634,8 @@ static const struct thermal_zone_device_ops an7583_tz_ops = {
 
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

