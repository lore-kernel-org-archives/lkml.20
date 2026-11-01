Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572302;
	b=a9tENFQi+LUCZ6pxnGwJNZBoPF/VcCWdHrWF5gXkXO33WYBTSn7kq1mzIX6JIwj07gPz
	 5yN+KemqEFxBlSRwyfVzP/hbXFZAdIS2NOGVmVm8aBR1wV3+m3uME1I+m61JYmx2lv0D2
	 WRTS7sUI9mCsQNOS7eRAWlCCFDFA2R2/te1mTNFscHfETWjY6yWBnRa6EA3+uAx6+POG+
	 LGgdKyEFd2MXEWOwUYAcae4MB7iLNqUKEKx7048sYsSc0PjGD/Lqb4moXekLxoNOgORZg
	 /o2nIFYgWW+UPSJ1wX3cW+FOLxY1ez0U84ZCs4xAcurzDfLmxabYc5kgPBztNdhV6Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
	b=yMVhcxCwWpMROfBMFg/B0sZ5sCPvYHaT37aHjdgfv42X3alfA75a/oMDjh+FuM51wIGJ
	 XmhJVcdC31PsC2cEFDp9NeHaS5lyZF8ble3Uc6ms39AXE3t0NIGh610yKzBA5xaXp046U
	 4Tnjx/0JXPynCOTJpjSuefisTYzS14iCksmIl2uJ5rmDoICOwF+Oi5bSFCUPSi0Xp8S68
	 EX8olEJmye/ZnOh+gX9uW01R5AkIDu22eXqAaKt+bvmJW+wpXWZDKRJxyy+uA/pKlhmVQ
	 STTTj4cIAB/OfboT2ZMJig5YPz8mm8+3+A3dOOE+B8eEIlQmuoyxEIeBhsEMynrsNiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBTGVxqJ;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD9606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32FD9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBTGVxqJ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d885929so1946716f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572300; x=1794177100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=ZBTGVxqJFFDmIek0+yuUIMEyoEuB0mjK7eFmVyKez2LsvkShIxZczGNHn8ZJ7RI2a2
         zPmsaGsYiPrlf8d5c9cxzTZVOKTnOjNT5tvmVCu6aIwiiyLtQ60tvFT/BDKoX6LgOrX7
         IVeAcE7TtzMcVCc7vWAIXKR3VwuValrli4He+1UZ1n37osWH8vjJmn9dNxpwmlCcQmZD
         jS0HbdNEWLYOJFB8NnnZx5fgEvfWdfBT7s3vlFHl8TNFlL4wciUahpLz16c09m9mpzBm
         5cPYQiwVLTwogadbm9kPvTUfYip4Imu2ZmIJL0/ZfzPxVniJyK9dXSUTnPLT9SsvNtUq
         O7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572300; x=1794177100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=Gz/qS3Qp340EwQhYkaiP3W+CivJA+UYzOT1VkUCLPdDHEmwfddGA8darUUHJdOKqir
         dhMf4ECJ48IpHWgKzkpxP3Q9sFHRsNb/Nquy2YU22w0Qg8MNoSid/oNyS03H0IE3slF3
         m0DCrbtjxfqJ6zZxv1tbQPrImHvyDdtLfZUd8nJoWpTixXmL3p09/364Coj2YiAWqllj
         X3P4Lm6qvgDtqvALDAq3DClIc/8a/9tfpKEmctIcWZi1nKUXAUbkm95/FIz4y/WkeQBJ
         v21L69/HRVJZU5vsPcnXKom+nh5luxMIcpr/OKvc2htIJuKK/RBuHUhzmAnW9Swm33Wb
         /0zA==
X-Forwarded-Encrypted: i=1; AKwUvBw5rI0bpBAklgKG9YoU54cOsqCL/19rAD/g5vVnb4aE7X8zIq7Yj6wMvvoflFlIbx0aBj0TkBEhjuOwoy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vcFE//75hJw4/jSW+flvslnp6KYOxoCzqy3AyyySquJoKnVFg
	3Y7SZ69qUmN9LbMf+TVAgbxvGC5ZfAbxagF+g3DtBrmxXHV39XlEqsHU
X-Gm-Gg: AYBFou2GMuq1utpOnq3t5KlBAtwR7D5V1dq6VVZw17kKJtVtMPmxH5iDebG5mAR2uD3
	BEsL4p4JDYrxPEactbyVmGcIDSyk/clAqtfwdZkqcLjax2i/a6ywDO+6/+Z/AOuRiKedgQ4iDwU
	65y57VSgPyoYDmqyrs/i61/PZs/eBKYg/4E8YlzN9LE42Z0JhN8dj3xSd84pOYQBbEsqY65I2BL
	RNp3jvXjesFgfs5r0WOEZzn8Rq30tzBdXPYBq5GkKCuxOlZgCzgEp+bdDDo+jjvlw8jRMT6nRjI
	JhIPr4GjykrdoFIEfmZsg1i4m6FbmcXLrOwzzeblwhqRlwzdaTmHux/AKGJIRPDBmbT0x6F5MDK
	Ambj0r9wz5VJ4aYTh5ZlsIoMUaB3L7SulPhsqEM4Tp7Zn2txMuyzI2lr1pDBNwCXvjEjhixsaIy
	66nWHrjMJ1rwy5wWL5Ub0a+z9mW9kURMgg/KhCqhLLyBbxp0exFGFCSsfKPQGdt5JbJ6PTbo3xM
	zP/JIDUSkSzc8Jy3BCcOi8wwYKFKOXa0kH+HmNHpwoDCB1zL3aEgD1+HJMeAzyFvvX9N86D8X5s
	Mi/ZQk0wNvRV7IYQ4HIBrVh+DypIh9dKzQ4WdqXqDaRIhczYac7YUY30dXDyJww=
X-Received: by 2002:adf:e001:0:20b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e6e2bc855mr15509231f8f.2.1793572300404;
        Sun, 01 Nov 2026 14:31:40 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:31:38 -0800 (PST)
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
Subject: [PATCH v2 0/7] sy7636a: power the panel only during updates
Date: Sun,  1 Nov 2026 22:31:18 +0000
Message-ID: <20261101223125.302001-1-pmazzini@gmail.com>
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
auxiliary driver. The regulator also gains VCOM voltage control and
waits for power good on enable.

Patch 6 depends on patches 1-5 and touches the regulator, hwmon and
MFD drivers.

Tested on a PocketBook Verse (B288).

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- patch 3: only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch 4: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- patch 5: no VCOM enable at probe, which also removes the probe race
- patch 5: read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (7):
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good on enable
  hwmon: sy7636a: fix negative temperatures
  hwmon: sy7636a: read the temperature only while the rails are on
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |   1 -
 drivers/hwmon/Kconfig                 |   2 +-
 drivers/hwmon/sy7636a-hwmon.c         |  58 +++++----
 drivers/mfd/Kconfig                   |  10 --
 drivers/mfd/simple-mfd-i2c.c          |  11 --
 drivers/regulator/Kconfig             |   6 +-
 drivers/regulator/sy7636a-regulator.c | 163 ++++++++++++++++++++------
 include/linux/mfd/sy7636a.h           |  34 ------
 8 files changed, 162 insertions(+), 123 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

