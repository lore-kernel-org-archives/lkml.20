Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F61329C48
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311356; cv=none; b=NFyEsATyym2KQ9qip6xt/aURWo70IimPNvbXpU5SQded2GVIwp5YbzB7h6UG7aIr84UunOGw33HNeZhjJxPygqcRU/dlZMkBu3oF05TpVurbjkYpKv7/QQ+qk8Gpf1dKL7XtJqSy9pfGzdwJQgmD5HNT+nL2E733zgLH6TXYQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311356; c=relaxed/simple;
	bh=X50q29zW18mDiJilwD4ZnVc1TBJYKHZ54bN7CfyWkJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qA/KX7z+ch7vwUw2I5QHcUlIJ259es/a0/R7qILAfsCLu54s2mZSXoBFTq8B+nQ1XIBdDyJZx5YFvjHmNjCWV4F4YSe814uCwgYoFpbXvUZ9DS1YqSwS4KJFNZzoWjdUupd8VwILGSxYhJ3hr8dWrSloe1kEeKuwjD3pbiv1u8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Umix1Iy1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Umix1Iy1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1691475a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311353; x=1789916153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLxxag6YaoEYXvuMdxlM7z9b6lVW4mPCbnkS4JP7U90=;
        b=Umix1Iy1+Vb6kZX59/ZTdKd0BlVPHnu7w7HXj+og/0z1LMT/7+cf5lmt/c+ZRjjGwC
         O8ffUEMIaEbaF94PJ00XY72pszU4v7LMZNiLSnKL6/0whGEJ61c8DJTXYoGuXCg2Md7/
         elzne4aocw/hRt5UI6xY3wLgFXaaBxtACnxjvKBa9HaqOVFXrGALAh8UW6dzXIU+dBlM
         gwsuFa8RUwBfCnbuOyu2xgD1LrPmhsxxDaJSLI7878FoCeeAOekvijBVdmujLEIsoIs1
         WVnCmBNxLwAOz3V86zlj2B1OMj9q9aHOGfPCIhlbhp8huHHoeY2qjG7sjIu6gDTEYsNq
         UQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311353; x=1789916153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLxxag6YaoEYXvuMdxlM7z9b6lVW4mPCbnkS4JP7U90=;
        b=pykHK64UY8O7m0JODMprXTstM0G02yUDqyJu12yHjeL1KzTBhIAU4SsAWeYG3yHYn6
         PEde6IYGRWWZkBRSNGx5u2uyviIsXDZQD/tQapgrNClBgLPWPmdLusn/+djVLaBPkM+s
         hiT6nm2G/7h8IUj6iSHfUvhL7vGsPCxt3DXksG9Ru0/Sbe9Io8MGSRboT46hvB8Un/EB
         ZH1lqBEgSzipQHZuoNPOk5xaV5mnVFGkgVFDffoolb+eJ4hXO3cdWYL0f7uuIb4LtAQA
         RJslt0LTR8V7/afPUYpruweutF5/KhN56qDcgCU4Tf6/J3IAh2DejiE0xaUs3+v6nLY2
         km0g==
X-Forwarded-Encrypted: i=1; AKwUvBykM3Qyhmvw59q8RWw+TpAGBudCkJuj3vj/bJeZcrb9k0oRmQfeOR5IJhLUdQ9dhDAK6ZSfTfYikL3Jcc4=@vger.kernel.org
X-Gm-Message-State: AFuF++nZUlMyiupFftUXDfEpUR+D8ds0+EmJDHgpdyWmRm6uC/BNKCXv
	p8KEpw9m0dex0gfxfXgaqyyR8Q8e/6KpRAMqVROEW7UBfIxzjbRKJGL7
X-Gm-Gg: AYBFou0X0ckgRIhYO1ku9zHwmZg7dWPsV43EatxufC7PoehICHKfcJ25Tz2vfGT31Dk
	BCFUYfAR/t+/oU7jaTVj4M7A60IFY3aQX8MKU+OPTpVbOvnMay5vs/aVOxBPqUIR49pHy1IgjOH
	m3LoSAQ1IrqG8R1NnjAz/JdDA48sQn+0Det9jhV+Sdkf2ZECKgGXaWSPx+qJZE0/9Yuuo5Zo6NA
	PZ2PJEPzmO5kWQ0QmnH4nYsDK9dAGk4h3TouilT/7qBANHVZWQ9Ks/PjmPbgjd5DQvzg9yqKI6g
	Nukd0TWlF1N9R5JWboROJjC5kl/IhYSZ0m0hRYjh4FwFZpZ2jtOCI7ZOCTxsks+zZr53SzEZRGk
	n4HQkMDiyx0Qj0iAqku+o4WEa+IKuMX+oF7Hv+uD1IziCbwQABSOYfbI6Y9HPnnsJAgAKpmtX7z
	FtpswxDH7jiZcG74AkTSsHi7r2Cbj7dN7gRGb8lJxRLtpwohQLBxNPP4FlwDEnDEbL
X-Received: by 2002:a05:6a21:6f88:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3daed33102emr23944156637.13.1789311353349;
        Sun, 13 Sep 2026 07:55:53 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:55:52 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 0/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sun, 13 Sep 2026 22:55:22 +0800
Message-ID: <20260913145527.18148-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 7.3-rc2.

Changes v6~v5:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - removed the redundant clocks constraint for the A523 controllers
 - simplified the else branch to maxItems: 1
 - dropped the extra example node

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - no changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - skip calibration instead of passing a NULL pointer to the calibration
   callback when no calibration cell is found

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - THS1 has four sensors; added the ths1_3 (NPU) calibration data
 - renamed the scale/offset constants to match the BSP naming
 - check caldata[1] instead of caldata[0] for the factory temperature
 - use SCALE_BELOW as the calibration divisor, as in the BSP
 - documented that the BSP CAL_COM(5000) is applied through ft_deviation
 - updated the commit description

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - put nvmem-cell-names on a single line
 - dropped unused trip labels, kept the ones referenced by the cooling maps
 - renamed the "gpu-trips" container to "trips"
 - added the npu-thermal zone for the fourth THS1 sensor

Changes v5~v4:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added empty line between what and context
 - clarified description
 - added missing period

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - updated Reviewed-by tag

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - removed dead IS_ERR(caldata) check
 - replaced NULL/IS_ERR check with IS_ERR_OR_NULL()

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - clarified description
 - added Reviewed-by tag

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - fixed patch subject prefix
 - clarified description
 - sorted thermal-sensor nodes by base address
 - added empty lines between trip nodes (DT coding style)

v4 https://lore.kernel.org/linux-sunxi/20260504050245.646078-1-iuncuim@gmail.com/
Changes v4~v3:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - gpadc replaced to mod clock

x) thermal/drivers/sun8i: add gpadc clock
 - removed

2) thermal/drivers/sun8i: replace devm_reset_control_get to
 - no functional changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - no functional changes

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - gpadc replaced to mod clock

5) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - gpadc replaced to mod clock

v3 https://lore.kernel.org/linux-sunxi/20251025043129.160454-1-iuncuim@gmail.com
Changes v3~v2:
x) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - previously accepted, therefore removed from this version

1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added changes as requested by Rob

2) thermal/drivers/sun8i: add gpadc clock
 - removed undescribed changes spaces to tabs

3) thermal/drivers/sun8i: replace devm_reset_control_get to
 - changed the commit description to the version suggested by wens
 - added reviewed-by tag

4) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added spaces in the description block before "*"

5) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - added alignment of functions in compliance with open parenthesis

x) arm64: dts: allwinner: A523: Add SID controller node
 - previously accepted, therefore removed from this version

6) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - no functional changes

Changes v2~v1:
1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - added new patch

2) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - changed clock order
 - added additional nvmem cell with calibration data
 - added requirements for new controllers
 - added description

3) thermal/drivers/sun8i: add gpadc clock
 - removed unnecessary call to clk_prepare_enable() since
 devm_clk_get_enabled()includes this

4) thermal/drivers/sun8i: replace devm_reset_control_get to
 - original function replaced with devm_reset_control_get_shared_deasserted()
 - removed some of the repetitive code executed by 
 devm_reset_control_get_shared_deasserted()

5) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added possibility to get calibration data from two independent cells

6) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - removed magic digits
 - changed description of calibration data procedure for A523
 - changed numbers of array elements with calibration data

7) arm64: dts: allwinner: A523: Add SID controller node
 - fix typo (sun50i->sun55i)

8) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - cell with calibration data divided into two
 - added passive trips for gpu
 - added information that information obtained from BSP

v1: https://lore.kernel.org/linux-sunxi/20250411003827.782544-1-iuncuim@gmail.com

Mikhail Kalashnikov (5):
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: sun55i: add thermal sensors

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  34 ++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 172 +++++++++++++
 drivers/thermal/sun8i_thermal.c               | 242 +++++++++++++++---
 3 files changed, 403 insertions(+), 45 deletions(-)

-- 
2.55.0

