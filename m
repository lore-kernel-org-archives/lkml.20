Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75D34A99B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363940; cv=none; b=pux0uSj86E3F5R6ffOiJw6zEYyzQ7yukzf4lzRkhqzJlZaWQNxeGh32Fn0h7J0L+y44dLfzxAC2E6ZSTFeuLPAxB7xo51WHrwPYBdxAk0OdwK+PWeoMfjRt1cBX5kvZTHpp48E68b09NxER0oPcX+1u4g+/toLUDmCyGxVxtAaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363940; c=relaxed/simple;
	bh=/5wWvImcqPU1KITCKP06lfPB9gw/2Ddp3aenchuF3RM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4PLl50loFe2Q4S5jVmvq7D+AAhD0YLgZzAujPMmhP6XKodQsNL8VwqKoDjtQ8fJAVa0P5J+64NQTC4fCBCP5OgSoWwIQmGPnLrgrQpFVZiohYjF3MlNgq34JqfECV5jGqW/1DVKuzIaY/cNt/ARfCfTYSt5UqphyXHeK/qZmaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnYBB8EI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnYBB8EI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8687630fso9729985e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363933; x=1788968733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0+gl5U9/Zkul8WCUYt9BkcdFSYfVkFnGP/S7FNbanA=;
        b=ZnYBB8EIeo6N6t0qPmdKVxb7pxxLHPTqfw9E7OKVCexYZQrVNXkYcxxwXJrB8Sl8Pu
         qiuYKQQ99xil0a8kH6B0tyzrk9wickcXfpQo0EaLhrvVS8qxWDCkGbc657R3EsbO1vL/
         UglO7kMktzlJIxiLVpTLMiRueXMGvnk9HAOpTr+qn+Fjm+2SMk7Vq4U/5WuTq8d33pk7
         R8YtLWI3lyy+Z/+LyyS6gNnmkG2otnz9+54KVn76PyOFqTiuLvqOc3QTcixoRw6rdQG8
         4amJokYd43YSBXSRmOZeejJL2IRCtZjxXT8TzRPZOzbPD2yptkhsxBiQXN/In5hUtHyG
         E+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363933; x=1788968733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0+gl5U9/Zkul8WCUYt9BkcdFSYfVkFnGP/S7FNbanA=;
        b=rGt3NJVQHAMkm1daL2viiBtKSmkEdDcEoAH38T8fDYwd54slrZOJbBODBweHJ8f7qu
         Bz7e9ZUyvYmMZe5Ju5eaWsY1eOfY30KTGM8UYuMwM+hTLWmYkXo4/Y8bzvayTlt5N1Gj
         kanQzwh43/bKN5B4bv29NEODiIuLpbqeBu3avmKnNzLqmifaAtqcNTLCmF0gss/vek/j
         7R3ou2uUCH8Jr8bwxvz3KXHRvkPgC3BhXi3JtEma87IaXuXZI3LfmaNQ3gtb8c0JyK6y
         pHAOqlGTqJmcUxcmX0n9Be0UHKbZVH2oX1C+NjzBvGIn0CJsjUpLjKCraTnWaJ5+IcXI
         Opvg==
X-Forwarded-Encrypted: i=1; AHgh+Rqpmm0psGnEa8Mw/IXucR86olm8ow+6lfXj8LHpyR/zCiOep0T2sOW8g7Fe/4Jzhx9NTGD41jVGWXz1/rY=@vger.kernel.org
X-Gm-Message-State: AFuF++lUSsTR1skOzOGDmHMnb9WFPNZ4Y415hckkWx5Zf+rcMbl/S7af
	6kIjSYzdU0t9XkPnHbjq24yZScb62GODZsZfyZEiAfMRsO/m1URpSIe1
X-Gm-Gg: AR+sD10pPcTT4WsWG9zfoCil4hb3dceMOEAPdpkTdKOjmfsxmRiY6ub+6j/w3+AYyBa
	7/Sd/liIR0ebSkALREhZDJa0Vit/SXgE342oAz+ulQbtp6qDo9p7d3OJ8WaUFzk3uxXqDmEt9VP
	SOnWdEtclVqm1+Sj4hpDkv21/XAo/VzLGd2/DaNHLn2OmH716caElcHjFBTKXHauIxP9MpE1xyS
	zo7yU6F/e8iqNihBz0J3LAzDZ113WhDtrLncwoZyAz3AO0Tmy+nixA+iDUEgLHI4jQLYbgb/oWq
	btAgpyIKNn+yev0n+hw0MYE4nN2eji20C1r9feR7tf4U2+rmnh8E8hC8D2v9ofeq37913rOdW0E
	u/cBp72aomq8bPwBHVNL+e4I54ukTM3R2KOBkcUuly/yJGXwBjhwSxi4L3Chmb1JrgHgcSX3drx
	LlpWAuTWGaxtItjkI8cyTA2OYiQwpHMAtrNs9tsRi8VdKqMAFszChfwjkor3hkSc6Hog==
X-Received: by 2002:a05:600c:a55:b0:49c:d60c:74e0 with SMTP id 5b1f17b1804b1-49ce582a35emr107105125e9.13.1788363927404;
        Wed, 02 Sep 2026 08:45:27 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:26 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 0/2] [PATCH v3 0/2] gpio: mmio: report the line direction on chips without direction registers
Date: Wed,  2 Sep 2026 17:45:23 +0200
Message-ID: <20260902154525.4090276-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this replaces the gpiolib guard patch [1], along the lines Bartosz
suggested there: instead of teaching gpiod_get_direction() to stay quiet
when a chip has no get_direction(), give gpio-mmio one and let the pin
controller tell it what the pad does.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. It now answers
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that say
where those bits live (Vybrid: OBE bit 1, IBE bit 0) and -ENOTSUPP for
everything else, the SCU based SoCs included; the debugfs dump, the only
raw-register user, reads the register through its own helper. The set
callback stays raw, as the fsl,pins binding requires. Converting the
driver fully to generic pinconf is a bigger job than this fix needs.

Patch 2 keeps the direction in gpio-mmio's existing shadow and installs
the shadow-reading get_direction() for the "pinctrl backend, no
direction registers" combination. The pad is asked once, from request(),
in process context, so it is safe for the gpiochip_lock_as_irq() path
that calls get_direction() under the irq descriptor lock.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next, with
DEBUG_ATOMIC_SLEEP and PROVE_LOCKING enabled: no backtraces, and
/sys/kernel/debug/gpio shows the right direction for every requested
line (the hogs, the SD card detect input, the USB VBUS regulator
output). Lines the pin controller cannot answer for keep the input
default gpiolib assumed before, so nothing that worked before is
affected. The initial direction scan in gpiochip_add_data_with_key()
runs before the pin ranges exist and still guesses; only requested lines
get the real answer.

Patch 2 needs patch 1 to give correct answers; taking both through one
tree, with an ack from the other side, avoids the window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Changes in v3:
- patch 1: return -ENOTSUPP for the SCU based SoCs instead of letting
  the firmware call hand back the raw pad value (Sashiko review)
- patch 1: say in the commit message that the set callback stays raw
- patch 1: -EINVAL for a pin the device tree never configured, -ENOTSUPP
  only for unsupported parameters and SoCs; reject a pin index beyond
  npins, gpio-mmio is the first caller reaching this through a gpio range
  (local Sashiko run)
- patch 1, 2: drop two comments that only restated the code

Changes in v2:
- patch 1: decode the requested parameter instead of returning the raw
  register; debugfs group dump reads the register through its own helper
- patch 2: keep the direction in the gpio-mmio shadow, ask pinctrl once
  from request() instead of from get_direction()

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: track the direction of chips without direction registers

 drivers/gpio/gpio-mmio.c                  | 59 +++++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.c   | 56 +++++++++++++++++++--
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 +
 4 files changed, 113 insertions(+), 8 deletions(-)


base-commit: 1900b5a41493e7050c68c1e62780d6fb9a209457
-- 
2.54.0

