Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41083CFF72
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791643130; cv=none; b=a2sC2kkk+0q9347L3zncS5cTo0S3/wH+9EfxcAq8ER99cqfrGNFyg3DiViOSv98U8wM1sSQjo/luxwbNpU0YIGaK8AXrWektDyhKXDAannC+34HPVrKtCnS4k6aPYyG0Nnb7qlloloIkeg/psU8yp06zAmKX5PlF/SHSgZDFbkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791643130; c=relaxed/simple;
	bh=XIR+F21hTFTrNd71D+I8BNEbEsbcq5OR1jCOUmmpFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lp5um3P72B6cZXC9O/mLK94trVXg5gG87BueAlSc4PGbodHzdqFzxDVEIxMU0XC70JcR8Qg7BWd3EDPnaODJYAYT9aHplsYd2/xdU2hNIDdfFPd3IiiFOoL1bQpjQ8gYgINlA7mItfCfP679dy7etalo2y0qIqPNW+5WLTRm1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F92XmAwm; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F92XmAwm"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a813079a55so1700119a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791643128; x=1792247928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4yObmjORIUS+HdWEYUQPrVnB688dbLM+egsRNt/fx4=;
        b=F92XmAwmtZn2Lh2CCa2mCJuL6bgJgXWSi68pzSJuTIiZTXQ6tHLKEtltsIxKvGIqVS
         1BSMeGF+KQpSNJFq7r0oRItJcJ7Bmpyv5HUYiFo+0bHLVGTRnpFc8T7KsdROJsuU2oJx
         FBSkmuP7a+Q0DapoXpa5PqaGTuGQ6Si3vpFS6NkNf3JMbvX4/fSdDGfjXrAZeXI6ZHG4
         57dtA7LWcCTjUP3YNRWDplzZXobQPtNthWF3PBd+oYjkKse5H7jeKT57IxE97cjc8DRw
         2MBtkLYGYKKQWaU7BgLf38F/l2w3UaQc+MJ2CkDEV9Vju3OXkzUPzr+m7VZZj8+DuYcl
         wCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643128; x=1792247928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4yObmjORIUS+HdWEYUQPrVnB688dbLM+egsRNt/fx4=;
        b=M22a5gGtOTbTozVaCUQfGcayiFJpQ0uxko+mpq/EF7hmV4/HDSqVkYwdxsbzgSHA6p
         jXLmrtXUDG9e1Uj04p4PCNhkUUQo4CCv0Y5xpY2h0Wy3mKHTGqRXPZJlexkNnQbTdq5b
         0yUB1ktjdIiU3kIemlzhDaywPbAoUxypR74UIoDSMUNaNQJvT/wn2Y65rUMGyji6sLue
         4RS8scxLI72FHoMRPVqSA4a99QBGu2rpkBYY4nDfO2Tu1uiRGBQ7b3dg1k/IWGab4XO5
         9knloNzGIBt9aEK/V+GQIZepB6JjsPdB9DExHkkHAAfYyFcfulfMMc0l9dWe6/GbKTe1
         v5FQ==
X-Forwarded-Encrypted: i=1; AKwUvByBG6XYTQGiBWPz83uCHvYQzkOWHcHbqviaV4lCmnna9ptmnzLQmmikTVO+e3TVuxkH0G/1qKh/DO0AtSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN2JaeTi6lwBCIVFXI5CARtHPPQa0KgKfGH8P4vQ7vfHU6LXEP
	EzifJKtJ6y9x3ccXOcySqaxsdcHHCYOasUp3l/+G5jR9ua1ha1YO7Ebz
X-Gm-Gg: AYBFou24Ymiv6q0SVCzLmCfLP6FVdVGHd9uDwYFwiLjQHwf8rDouRJL9UsqErI3Mxod
	g1R+nY6+Ks+zUQdGNAfYrlicMcISLi39L7iAUK6okP0mOf02Jr4yOIGuELX4gsWev2j9kjZxu8Y
	RnzXQ8HgybI7o7LWN9AH4f/oKtlBV3EavKeG9msdYmuYTI/D+2/0Ur2QvmNiqKCjLABqhm61K7H
	/lb4aqL45krQ8+XlfVvazNcJrMZfMC9c/a7FVBm3QVAWjO7yvaaAip7xUbMIdvyNDyd1s3AsZny
	awbJEb1fYIDuPGHpF9T4rxnAS4cnOOFJKa7qtbDCaRew7ri1eDJ9+xfW4PTDHImRalTrqiMOrF7
	1dLaWXl/o452KWtxB5pdWjfj/73G0lKZVP+dR7yFY68cfpnIG1koomM6SiiiUxqgr+AjAU93SmB
	wvlZBV7+Sik9QS2cSINsJRXxu3DyuFo8U2P04QP3suFvCH7QHQHJinFQRLrlhKq5FdJHZn
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr3194676a91.0.1791643128050;
        Sat, 10 Oct 2026 07:38:48 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm10821859a91.10.2026.10.10.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:38:47 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v2 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Sat, 10 Oct 2026 09:38:34 -0500
Message-ID: <20261010143836.173883-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009122046.551915-1-wyibo6109@gmail.com>
References: <20261009122046.551915-1-wyibo6109@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

This series adds support for the magnetic pogo-pin smart keyboards of
the OnePlus Pad 3 Pro / Pad 4 and the OPPO Pad 5 Pro.  The keyboard is
built around a Tinno MCU attached to a tablet UART.  Both sides share a
single data wire, so the host gates its transmission onto the bus with a
PMIC GPIO for the duration of a frame, and every host frame is echoed
back on RX.

The MCU speaks a framed "one wire bus" protocol over the half-duplex
921600 8N1 UART: 8x 0x55 preamble, 0xF1, src/dst addresses, command,
length, payload, CRC16-IBM (poly 0x8005, init 0xC596), 0xFE and 4x 0xAA.
The protocol was reverse engineered from the vendor kernel driver; this
is a clean-room serdev reimplementation that replaces the downstream
platform driver, which depends on a private msm_geni_serial callback and
a user-space held tty fd.

Patch 1 adds the DT binding for the "oneplus,pogo-keyboard" device,
describing the supply, TX-gate and wake GPIOs, with a MAINTAINERS entry.

Patch 2 adds the driver: keyboard matrix, touchpad, function and URL
keys, caps-lock LED, attach detection through the wake GPIO plus a
100 ms heartbeat timeout, and the keyboard backlight as a
"pogo-keyboard::kbd_backlight" LED class device so UPower and the
desktop keyboard-backlight controls drive it through the standard
interface (the level is cached while detached and restored on
re-attach).  A sysfs battery level is exported for the keyboards that
carry a battery.

Changes in v2, addressing Krzysztof Kozlowski's review of the binding:

- dropped the redundant "binding" from the dt-bindings subject;

- replaced the custom oneplus,touchpad-xy-max/-resolution properties
  with the common touchscreen properties touchscreen-size-x/y and
  touchscreen-x-mm/y-mm, parsed with touchscreen_parse_properties() in
  the driver: the MCU protocol has no way to query the touchpad
  geometry and the same MCU is shipped in keyboards with different
  touchpad matrices, so the geometry stays in DT but uses the common
  schema instead of vendor properties;

- dropped the serial wrapper node from the binding example;

- the MAINTAINERS entry added with the binding references only the
  binding file; the driver F: line is added together with the driver
  patch.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

Yibo Wang (2):
  dt-bindings: input: add OnePlus pogo-pin keyboard
  Input: add OnePlus/OPPO Pad pogo-pin keyboard serdev driver

 .../bindings/input/oneplus,pogo-keyboard.yaml |   66 +
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   13 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1196 +++++++++++++++++
 5 files changed, 1283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
 create mode 100644 drivers/input/keyboard/oneplus-pogo-kbd.c

-- 
2.53.0

