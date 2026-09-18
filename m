Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC7B4343F2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725335; cv=none; b=MnWbLsXF8qyer/Wn6UCLgupuecfLhGtqE6WbNo8DYOkJObJNhSXIA+xKrHbmODbTeBm3Q4PT6mSfY1SoX55tbUN4CtrDVyAFMUIVhfuJnutN9X+AzwbupMQvoy6ehWwiPTzhr15KFFYDtO6mwSLHdgxp3Ov33eDNUTLLF3EKC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725335; c=relaxed/simple;
	bh=VP7hHskNoGPpOXNCBkJJtyv8CeQQ6LuIb5tB/rUYKIY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sMWp4XN0lI98xBTEvvWxaWErtHKI5BuP206uJsPG589YuFLrmPcgfvCcwCI47x7djK/ZRxD0l/wUfCUU27h5s299MrUMrmgcrE0rd8HzCILYVryVOxA+16v+SIZO4b8OX+jR4eKrDc5FP9ijUzArlU6H6MHMa68xrPBOMkRhe70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JtJB3pPu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JtJB3pPu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so377120f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789725326; x=1790330126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAZT5ncdu+agHg65mBYy9X51LOw7DQ1MSxf8dHyd0VA=;
        b=JtJB3pPuLwzcCOL+12ZxVZ5VJQnnX1qngms9gjcJ0AEKWvmJCDhnSA7CdQ2GdH3nVA
         G7oGVlqQSxZ01kO3TJzbVx0G/j1RX8lBS3HolIpxOenFAJ8Wweq9ygNrIMu0OXr+7vtI
         EnCPhxp35+xxhNJ/y4tLq8fbM5wZDfdvaHSkGnBTI0at4MXoobdNWrlPQrQsR0t6qKub
         /U7E6d/A/U7VvRZZTTatWwmF0GIqgkvwGTm48+sKQktp/j/dab616PTrJxbn4mTOLEZp
         MwLvEU3IVCR5G8F199AmkQm5j/Ytd5Em+TBKX4UEk65dR13oKjExjT5bHHQFYn14EV9p
         w0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725326; x=1790330126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAZT5ncdu+agHg65mBYy9X51LOw7DQ1MSxf8dHyd0VA=;
        b=I0GIu0t9BOAF8GXetrQ555P5kOIaa8XTTFmen8IZoWlvCr2EkYal8Xzt2M42gxQzxp
         /5O9+S2J8+0w2hy2VVWwPN6qon1MhO1rchMQeFpXjSocGaTu+5n9L45SlGbyy7+nF0Uc
         Kq8nGhRMTH1io+Iv8ytkjVobftdPsD+Pi7bRYqAtENM/9Eo7aajrRBuiP9G9R6uyf6o6
         BKXuGMBtRm8RUURiYgvU2+F094A6xT1xMglYGXiuZv/gZ8O1A3qGLNVFisL7YiO89r87
         gVvPnlNmoHM/0AffqluXaVaQd8zTN+YBHMsKoWxrf/OhcN8JRJzVIx+SB01u7tSFKuP7
         lnvA==
X-Forwarded-Encrypted: i=1; AKwUvByJwtiMEg41AnbKtfB9E16H4PecVAeFAYTcrOCZsIAJhsv2/EqONGHpZjAgFro3gGHz9Er6MK2/V6Vdn0E=@vger.kernel.org
X-Gm-Message-State: AFuF++mqIVrIjgkXQoTRQcjFqCe/KIHDgqn06CFDdxX+by4/I6bPHtRW
	H6am+g3kTJ0saSDDbdD5d1rbcu2xqhona5XBQsVHeMbgeSapI8EczcgiogcBR8NNLps=
X-Gm-Gg: AYBFou35gZ4AedJAPbH4/iC/GeU5ZpuRrdmhlTnvu+dZiBPvXNIG11yVGBj4NYzXu+v
	obTF2fUDytj3xLUCunJSADmOVyPgShm2fjM3KQJ5vZbfY7Q1IS/iXWvII9XljP0qj8ZEClr1FhR
	trV60eOrq2I/L8L05uTlTCJUT0DKwycdDohB18yx5EHdnQE1zfU8xCm4orXAgDZw4OnLgQaY5YV
	T+z7BRJGxIZjwsHz+OZoWGo/6oMbmU73/QggVYDXHUHQYgkbZ13JFPy0mjJoRg+zMkcapGEMML2
	5PWWoz2vHPcjyetn2SBGoX3qU6hksCmzeE7xIS44Igx7S8fiM6ca0dsvQ2kYrucljmIF3GaQh1U
	b6aENiybl0Lf4iQlQHN23lOTMGOGZfiIYHvoSan8AnkrPOsAfTV1MTS9pvYb64nVnNKbpvm8HA4
	vz1ldU/cGKWW41dfjdFqcCLtOZmAKhlKMF7Os5TdIaaqY56dkP3pbuXJKIKyu8+pdHZ9jYT6GZU
	7NLjXjG
X-Received: by 2002:a05:6000:186f:b0:487:36a:c870 with SMTP id ffacd0b85a97d-4871e2123damr2944568f8f.11.1789725326057;
        Fri, 18 Sep 2026 02:55:26 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008118dsm3345138f8f.30.2026.09.18.02.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:55:25 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v9 0/3] Add RP1 PWM controller support
Date: Fri, 18 Sep 2026 11:58:59 +0200
Message-ID: <cover.1789724999.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which is then exported by this driver via
a function. A subsequent patch will add a new device and driver
to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V9:

All changes are in response of Sashiko's review (where applicable),
see:
https://lore.kernel.org/all/20260908132302.358D91F00ADB@smtp.kernel.org/#t

- linux/bitfield.h is now explicitly included to avoid compile
  time issue related to header refactory
- synchronized the exported function to read the tachometer with
  respect to both the system PM ops and the driver unbind/unload
- reworked the error path of all functions using regmap_read. As
  a consequence, rp1_pwm_apply_config() now returns and int for
  the error.
- made u32 cast explicit for the divisor of DIV_ROUND_UP_ULL
- moved teh struct initializer in rp1_pwm_read_waveform() to the
  top of the function to avoid overwriting part of the resulting
  data.
- dropped suppress_bind_attrs flag and replaced builtin_platform_driver()
  with module_platform_driver((), since the driver can now be
  unbound/unloaded.

Link to V8:
https://lore.kernel.org/all/cover.1788872294.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   8 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 499 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 +
 7 files changed, 605 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

-- 
2.35.3

