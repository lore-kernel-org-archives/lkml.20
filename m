Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93F488D9C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154044; cv=none; b=heXVFJq1E4bI439+7dn0PPrh0LHLooo+3kXdjlGb+x17797WlLm+o3FATkKW8vTZ3R0n/DBYjZr6UDaM45+aTDK8Nv4apQMyDTDnDnQ5Kl8/KJm+vGPtRU/yJk237obyCfTZcaai2pkBKc9ZEsr93h3FI3kepIw5kTXQ62IYiu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154044; c=relaxed/simple;
	bh=1vU3NCxLFVHdnJywnJQnG9sCBBB2oPGI2MFppoXSbZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWZtq6MVOOeb/RCpbkYqbYmL09j8kPD+lusZtZfvxQfyG490+NsfH+Lr1eK/brxVuAF7JflWBNHL4MHfel69lkpIyxLx93bJkHVuMmVVToleYt/KPwwa403Y2UwZ2GXeWKCsT6ChQ1VQM82cc97nd0K3WZnqVDRjIGw4o8BgCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbMAiZwt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbMAiZwt"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e977109392so7519855ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154041; x=1792758841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTy4IXuSvKSJKpenSSv/dDuZ3Ab3mm4pLG3Vp1dvcio=;
        b=CbMAiZwt2qZ/kFiAfH8MATg5kBZNGjVbYTBuixuTHvY6LCnJu6UQYiHDspjyDFg2re
         6C3gEbkub3FwW/6SRSbi/IogaOzi10965TJ+Nibg7Pd1M1pddQX5Zkhpc47jqA6brpXg
         fBY0r5pH8SnNJP4cLYeboAnNpBfVpQACTyGFs6SZaJrsSixfqaSEwhacc7VLgUE6QrwL
         RQI2TfjJgzCeefd4xbG/1tWeuViY9gqRLCQUE4fjTQAlGbZfO/b6FIfuBD+2n5vXRlAW
         tMahX79MmC8jRPfizRpv5r7npUgdvxvSGUiXDot/BAQjuNoJ7NOqy79Rd26uct3Cltw6
         1d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154041; x=1792758841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTy4IXuSvKSJKpenSSv/dDuZ3Ab3mm4pLG3Vp1dvcio=;
        b=pfhyhJWvU38yidG0qc9HgCS88gKQdDgR8QcM/wXI/X1oI7QF2ydSJwP9zFpyPiD03K
         tyV5bD5nv4KhT46miAM/8UHk0odJT3RBfyRhrHt+w022gy33Ca2TR7KPyChLfXTBqw4p
         P31SykSCJliotnqmq/FYLC95TEvJ/HC2XtK3QnOpMADYBb7IFdTujJQPiSkkx8x3o9us
         yPQ2P55uwb0EpO16bIVFwgz01ZhPGQHbQddJlWPl25MtId27Ho9D5i4Ysci3uLjc+8gH
         gp7h9pO3Y4ECYSPl8psxTKG4ubTli6Rv0MU6sYjcWI9WNo5gs2SqXN0yxdJSEV7Qz8Qf
         oUMw==
X-Forwarded-Encrypted: i=1; AKwUvBym7wN04x+Y6MOSP/LUguLuZnFpaoHE1270v+UDIDYiB2Xwxu63K5xqFTe5XX8xB6SJJf5xiR2EDgpHWF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc5fNHOK4zQosw+6TEc9n4X47Xcis/hTWk7ZRTQogwpA53fl++
	Q9aVaqG1tUhVURRhBLHR/qzfkEkNoRSSq1TPLg6tWZJgfGCdT56/MU+2
X-Gm-Gg: AYBFou1G3ZFKuh/9Y2XAYx9RhWpBCifS+nZY6XLFK9QjXcY5D0jGKJFbpr55AzKz9NQ
	iaSEUkMRTyJXTv09Os2agC7mVovp2r1q78xKEKjpIQUDcHrXOFkzOBjBSmvLuVzrjliIigBsCud
	xZv965L+SXQyse3txogKgfJXRGlwln2r8oMWdp7bP13fYKr/5hOsOXfPZhkaMlr/HBsrBO3UlsR
	kQg3Fn/At4ARR6J/R7/ZFDJBABl9hQ11r7RGwPaRiMAsFQNVdHNMhx7KwyQNnqtRSMH8Q1sLag4
	xySroqvubJSh9lyS90KkyRc/EPZa3rDPP9smhFieGvAK7I0d+Ts78eT8MLNAi/mRs/XDZ9NJpH/
	i7FvnlhvXmIKzS2mklU0AscM1Fbc6NGtLj0Pg2J1XBwvlSgfZvM/Ew9Y1ufv+fhrhoWl3sQ3aut
	2njAjsTTiuLEtQRHXAgSNehncxNla1SrpsFY/ppb5b66zbjvUf0N6AfgLRLjIZhowXjKg=
X-Received: by 2002:a17:902:e801:b0:2e9:99cc:154d with SMTP id d9443c01a7336-2e999cc18cfmr9568805ad.41.1792154040732;
        Fri, 16 Oct 2026 05:34:00 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e87993esm9286735ad.59.2026.10.16.05.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:00 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v5 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Fri, 16 Oct 2026 07:33:32 -0500
Message-ID: <20261016123334.1019257-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015110859.203989-1-wyibo6109@gmail.com>
References: <20261015110859.203989-1-wyibo6109@gmail.com>
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

The core protocol (framing, keys, touchpad, sync/heartbeat) has been
carried unchanged across four SoC generations of these keyboards, from
the sm8550 era to the sm8850 ones covered here; only the 0x3A general
sub-commands grew over time.  Patch 1 adds the DT binding, patch 2 the
driver.

Changes in v5, addressing Rob Herring's comments on the binding:

- dropped the block scalar from the top-level description;

- rewrapped the descriptions to stay within 75 columns;

- restored the serial parent node in the example.

Changes in v4, after Krzysztof Kozlowski's comment that the binding
describes the keyboard rather than the MCU (wording only, no functional
change):

- the binding description and the commit messages now describe the
  keyboard (built around the Tinno MCU) instead of the MCU itself, and
  spell out that a keyboard is a fixed physical device, so the touchpad
  geometry and the product names are per-compatible constants in the
  driver.

Changes in v3:

- the compatible names the tablet project the pogo port belongs to
  (oneplus,caihong- / erhai- / iceland-pogo-keyboard, the codenames
  used by the vendor trees), and the driver carries a per-project
  description in the OF match data: feature flags gate each 0x3A
  general sub-command (caihong, sm8650 era, has no wake notification
  and no backlight; erhai, sm8750 era, adds the wake notification;
  iceland, sm8850 era, adds the keyboard backlight), while the touchpad
  geometry and the per-brand product names are per-project constants -
  the wake notification is skipped and the backlight LED only
  registered where supported;

- the touchpad geometry and product names are no longer DT properties:
  they are fixed per project and live in the driver; the common
  touchscreen properties (touchscreen-size-x/y, touchscreen-x-mm/y-mm)
  remain as an optional override, parsed with
  touchscreen_parse_properties(), for the unlikely case of a variant.

Changes in v2:

- dropped the redundant "binding" from the dt-bindings subject;

- replaced the custom oneplus,touchpad-xy-max/-resolution properties
  with the common touchscreen properties;

- dropped the serial wrapper node from the binding example;

- the MAINTAINERS entry added with the binding references only the
  binding file; the driver F: line is added together with the driver
  patch.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

Yibo Wang (2):
  dt-bindings: input: add OnePlus pogo-pin keyboard
  Input: add OnePlus/OPPO Pad pogo-pin keyboard serdev driver

 .../bindings/input/oneplus,pogo-keyboard.yaml |   76 +
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   13 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1263 +++++++++++++++++
 5 files changed, 1360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
 create mode 100644 drivers/input/keyboard/oneplus-pogo-kbd.c

-- 
2.53.0

