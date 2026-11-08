Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130589;
	b=RZFJ3hzHwurRNvx6VpfX2l6TfFhyG2hSu7iLNCAQJPzhyRnXywF/A1UkSHjW+k/6h3w1
	 PA0iw5/L9ovVIiQoat/8K1BQVy76++PqpZHeoJQ2klhgJ4JeUiw6MJhq3/6D1wn4h0otS
	 eR/wJwURUJEDrA3vANaDmegZbo+VKYcworgMLwR7f5MPbjFHj5MLtutXDbUcsxAoOU6Vg
	 C3kNcHotY/PpiGScohheaDW5xWUJDzEkXqj+pSzi/G1WJ7CS0WaGrZecxfIuubj5EXthd
	 gL0zOPApmQLT0As9RJZhI+czZgkVzlsGX/VckK0B8DHqKRijjTyAbxI6a6lhZXA+P0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
	b=HsFU6gYqHUDX9lQVqlnXNRdXy6oobuNtF+AxS/Sx00nnRN67zooGJjHASd63b+OpBkTE
	 QCyYzskX8WI+6nu3AefN0snTD0MG7bimNMdeMPSTEtuBcreyTh1MejifjEXRO+7VZjfxY
	 dISuNmn7eAaE9Mgm9677Q91M+m8NVT0BIZviWYQFPRIBpuenkbFHHa3ltdT+2oW2eg3os
	 JDIOZF9+Q0MYkPxDyNEH9gq+WInMG7RDuXKCtNG9yeCLy081zpHMxIWGNePspPrrBYldB
	 XeyxaarU191bYbvHAMBTL01YZ5sVAA1S2p6KCccA+DMTxKJb7gXUlTL19PoDSLq7KvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eL5zqJOO;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD23C606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD23C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eL5zqJOO
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1495555e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130587; x=1794735387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=eL5zqJOOARgwAeZRFDpXiRsgR9hEN4hg09+7A+7qbkDObfGuLgBVmATW2/FPOPJL4m
         xbpFxRD4Ux2lWfJFSujF9lkj9iyFKy2u3dtjHSMlNQev3Q307jC/VLPtpBAFiYST8opR
         pys5iKpT80hWYq1mcF7KHr0FKdebak0ZvlC+MXmGq1TxwzEur6BUwMLlWGizBzSGHwl2
         oV2gIeWoBYjVIAATVHb7ZAtVV9/R5CPOaViz+Vp55Ctl9w9wmPxz39hVkhlR2b+sAzdK
         qXU7o5BlzMGLm5YiDQiv2Q5yJ7JxDNqiF8trC3z8utebmHcYTtfC6zFaDqOqz0MoKAZK
         2SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130587; x=1794735387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=P+eFyDHKc11XPeNhI4tt5A2h5l7Iq5Jk2D6cG53DLz9uSPt2IQ6/9L0Vz7iWxc/S+d
         uxm7AezLVWyrd99YDiXtLpPFqMMUfWkr/kYDEoU7NNPkmOvrOKMghM6q/jBU1wupSwwp
         lAFhlVkl3PdMY8tpQzuehMgfe3Y/+VaRv42Z3fN/0e5zVn0YycB83GfSG2t6qY+xBqT+
         iQR6q62fAeOymrm0DdyC4xcEMIdNV6obluCS7ykNsKZIpZMjwekrghQUaALi1wzn2bxJ
         AhDAGNgukHyet6vgCN8BOTRZ/5Br0m7n61To8phJ6JvlnQCoE1a7FnjzfjgxSJtuX6cZ
         meNw==
X-Forwarded-Encrypted: i=1; AL+hErEvwkZ+vuKhLpfYjgiY7elu4NSnx/C6hBjy/NiAtjlkasU9cdxIuFLLNW9bmTLQ60IkecrBSEKJthnlZIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+WJ2+IFh+R+3b2OZCj20eWFx3Wrr+C0qSHDX5W54BAZ77r7/C
	1ZyKXQAc1yvxwVk08Z3vyRVTPKcQ5fZey3R/VfruQeIZwvBdt9AImjHw
X-Gm-Gg: AYBFou3lrrXvN+XBTBnSiJBNsFvMgz6i5NsQ5eclmEtAbtMc762k80eVy/nHxgDrbzo
	+C/lXdRyP757h4l8YFKlQvUHYSho1o64Ni/d4GTSjAYZ7QpOY+SmwOxVw15m68H5gVXxlL73FNV
	jmjq7OxTtQcJ8Cl0JoEAnwV96XZvnN7Zbjm2v0UJIh83Wt5C1afyEBJJujufOUckoRtFz0eme7R
	MYrtE/Amakl+9/CATMRyzFR//nBmq5EmryZl2kLYyQEcqtcK0Hv6iFCDeLxCLgnCAxjqNKHAxBO
	W49dUHD1fzMIpHkEqXI1LMpGVJxQBTq1eqo8u21feU0eb9PgCzZlRqMf3Jn5v1eETADSf9dGPm6
	7Gis24KQ/Yc2KDWkzDrSwwunhZJFGTwlpNTgDjoeWTvY6Du156Kh9CvfaE2d+h3pGOEe1x1KZHL
	LoAzWQ+hXXgffEAkWqrvrxevZ0zWJk+b8IG2nMc7qE+mFPC/JycURV4OzcUEq/UhGBB5KISN84p
	FKnCCVxdgQVjM/xuOlPPieCDhrJlm9CBV7GD++j3QxvyaiBOxD5XUsIOBO8dlJ0g7qxWhvaIa1j
	Ev33fpRreB2CMXkktiZuEYHWQ2rWKDsa8iscGaul8LKCYaK5zQSKqb/IVPhmwmo=
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr19923505e9.19.1794130587155;
        Sun, 08 Nov 2026 01:36:27 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:26 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] sy7636a: power the panel only during updates
Date: Sun,  8 Nov 2026 09:35:57 +0000
Message-ID: <20261108093602.329554-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead, and bind the
regulator to the I2C device directly, with the hwmon driver as its
auxiliary driver.

v2 patches 1-3 are in regulator for-7.5, so this is based on it.
Patch 3 touches the regulator, hwmon and MFD drivers and removes the
MFD header, so the series should go through the regulator tree, with
acks from Guenter and Lee.

Tested on a PocketBook Verse (B288).

v3:
- drop the applied patches 1-3
- new patch 1: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- patch 4: explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (5):

  regulator: sy7636a: don't wait for power good if already on
  hwmon: sy7636a: fix negative temperatures
  regulator: sy7636a: bind to the I2C device directly
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |  1 -
 drivers/hwmon/Kconfig                 |  2 +-
 drivers/hwmon/sy7636a-hwmon.c         | 66 ++++++++++++--------
 drivers/mfd/Kconfig                   | 10 ---
 drivers/mfd/simple-mfd-i2c.c          | 11 ----
 drivers/regulator/Kconfig             |  4 +-
 drivers/regulator/sy7636a-regulator.c | 90 ++++++++++++++++-----------
 include/linux/mfd/sy7636a.h           | 34 ----------
 8 files changed, 99 insertions(+), 119 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 2a1984b30e9cfcb306a076cb4b9e68d71daeb45c
-- 
2.52.0

