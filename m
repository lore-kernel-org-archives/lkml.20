Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BDE52BE55
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985986; cv=none; b=b8GyqvNlCZjrNpsJXUiT6yMtXMmzgziaOvdKMLFX8S2L5ruNEcPAEGiz+daLtSESlRuxUagmusRanlf4qpxAqgg2MKKuccYEs+t+AO4Nu8HGXDslQ46LfS1QuzVr2z3i4CBNvzkO84nsSHCsbVFpvRnVP/j/At3PeDu6j+2euM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985986; c=relaxed/simple;
	bh=4K/OfbKxhhyoFgt/4DQIc1mzkF2vBz5Hc42fatDf+Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mezUo1eZuU45JZZ+7vXmfELnFOBkZfjGTjKUjyju2d6h8dPLCj3w1AGiq+gNehjj2b6sBmnaFu/rnYbMKNvFUrGt+GopansmR5QqoMF1x9x3T4jqwFaC+Geve5kGmICHU4k2RyBZdVpfvqyzApLOPVgqGXokPR9Gu3p0qSAQZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOyHVQ27; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOyHVQ27"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso1979616b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985981; x=1792590781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UT8AC87k3JtmR9Mgdy2bUpHUaBQHrXk1Cf/Lmj4HaME=;
        b=OOyHVQ27C7hGcKD7rFVCvRftfUyJ4JS9lZVXxey0n0VR5lDB5L0RmoEo5R7CNzlSs3
         SA7zONTxDWWKOLwc3aZO6j182FGjgzuI97JZkyTzfW26pO78slmxGYjcmxGGB4SEJPJ+
         Bh+Z73KTZe0f07iC82+6AhmKnNujgu4Xjl8YAyvxORaymc/LEOq5oHcteG7mKpWU8DMq
         FjvIMxHcpo+k44RMg/6PIzGdqe+FUGLy7DB25DH2Gy7iAbDdVx0PzZlOjNU09aqGxxoR
         0V3O7Q7aNHjaNFtR1QC3z2FViVOIr9G4gyNSz8nikiVli0gMi4nAEfmDIPpU2fkTcbkD
         FiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985981; x=1792590781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UT8AC87k3JtmR9Mgdy2bUpHUaBQHrXk1Cf/Lmj4HaME=;
        b=AXomfHxrN4I2b+zLkgt4lgC8n0kj4a7rFXIZ3DyLOrtBDYb3ENovU/RzVtwY9g2X5B
         AQK4hqG5QzlFwI+r3Xm4i3w4sTwHTWhw3NgdnGuYKdx/G6kdMw3smQ08gpsGWuMbWeXG
         5oaoYy7/14kjIhIBq400ZUlvpGzaUCp6n8DgcvGsf8ih9gwb75OXmOPvVDHnBQYjxQzd
         8Imv6r3Khb0hAdJayHIXPP5dc0j+X21Xc3dcs+T37RnE5FvvsQ9IlnSEhPeKwq9hohIB
         xUGrmZiJUrnDmkUHdnIfoqvuoUvOi88RPmDVcTuAXwhhdoV1LLmZ3wD4T8rN7DFzeVDN
         Ho0g==
X-Forwarded-Encrypted: i=1; AKwUvBy5+3vsre9OVVYb4sfffQOHcaNlf0ojChPTIH9LgM6kDcxSGGivsi9hA3/03GnZA5l3+VvPnNd/OCOEytM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIms8HpjqZY2h3ydFZQZn7YZJ6tXgObXcf8MuJTYueujDbH4FGA
	5s/z1x5XN221u5dJkPmqUvKcQ+i0AntiBht/6LnjOb2rs0n9hKBO/8S5
X-Gm-Gg: AYBFou3zdOW8t1HuXPsx3tZ9Fm53W3Veg+2VhDiU3kzMmEfUrtLXw76gpRJhMr9+pix
	Vg6+nVIc5zD3wShL8Y9Eu5URmh17CBzBU2J5hrBp/hNwYX1Lpt+ttPOFGR4FSBt/rAY/hwAKP5r
	BO78W4nduk+ERSqcQME3s5bY+qO4Myukq/D084DU5Asgg28sKARlg4Q1uJomD5IseQuoqZm5J2X
	dL5j0xKn1p57nzutVmwQpruZmRy29ry4P8OEVFbEo4YDNl0q/GIO1RDXu5xlSCn1TpaON5geAT1
	9JWqi9pTNfppGD4Ro8wxTO9DYNjwJY0TBrE5Pwfd2MU08xNJ5M4mMItLvASoMZHj00U2GZXoJMV
	V4Dpjhs0CW4QW+NU8Yz/lGwSDSZL8j1zPJrmuwriFgQ4idq6o26L4NBBXkiTZMMz/+9KIwGVZZe
	AdpLyrJqZCixFjYR8/NVLFCO7QF7PoBbPPp0M9+SDCZa79hdi56oKZShORVLhZHSBrLmQ5Mrcqn
	JLK8w==
X-Received: by 2002:a05:6a21:8203:b0:3de:2fbc:82c3 with SMTP id adf61e73a8af0-3e16ba9fd1bmr16360118637.10.1791985980935;
        Wed, 14 Oct 2026 06:53:00 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e6e77sm1121244b3a.40.2026.10.14.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:53:00 -0700 (PDT)
From: wyibo6109@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yibo Wang <wyibo6109@gmail.com>
Subject: [PATCH v3 0/2] Input: add support for OnePlus/OPPO Pad pogo-pin keyboards
Date: Wed, 14 Oct 2026 08:52:49 -0500
Message-ID: <20261014135251.11234-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010143836.173883-1-wyibo6109@gmail.com>
References: <20261010143836.173883-1-wyibo6109@gmail.com>
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
carried unchanged across four SoC generations of this MCU, from the
sm8550 era keyboards to the sm8850 ones covered here; only the 0x3A
general sub-commands grew over time.  Patch 1 adds the DT binding,
patch 2 the driver.

Changes in v3:

- the compatible names the tablet project the pogo port belongs to
  (oneplus,caihong- / erhai- / iceland-pogo-keyboard, the codenames
  used by the vendor trees) instead of a DT property, and the
  driver carries a per-project description in the OF match data:
  feature flags gate each 0x3A general sub-command (caihong, sm8650
  era, has no wake notification and no backlight; erhai, sm8750 era,
  adds the wake notification; iceland, sm8850 era, adds the keyboard
  backlight), while the touchpad geometry and the per-brand product
  names are per-project constants - the wake notification is skipped
  and the backlight LED only registered where supported;

- the touchpad geometry and product names are no longer DT properties:
  they are fixed per project and live in the driver; the common
  touchscreen properties (touchscreen-size-x/y, touchscreen-x-mm/y-mm)
  remain as an optional override, parsed with
  touchscreen_parse_properties().

Changes in v2, addressing Krzysztof Kozlowski's review of the binding:

- dropped the redundant "binding" from the dt-bindings subject;

- replaced the custom oneplus,touchpad-xy-max/-resolution properties
  with the common touchscreen properties: the MCU protocol has no way
  to query the touchpad geometry and the same MCU is shipped in
  keyboards with different touchpad matrices;

- dropped the serial wrapper node from the binding example;

- the MAINTAINERS entry added with the binding references only the
  binding file; the driver F: line is added together with the driver
  patch.

Tested on the OnePlus Pad 4 (iceland) running Linux 7.2.0-sm8850
(v7.2-based iceland tree).

Yibo Wang (2):
  dt-bindings: input: add OnePlus pogo-pin keyboard
  Input: add OnePlus/OPPO Pad pogo-pin keyboard serdev driver

 .../bindings/input/oneplus,pogo-keyboard.yaml |   73 +
 MAINTAINERS                                   |    7 +
 drivers/input/keyboard/Kconfig                |   13 +
 drivers/input/keyboard/Makefile               |    1 +
 drivers/input/keyboard/oneplus-pogo-kbd.c     | 1263 +++++++++++++++++
 5 files changed, 1357 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/oneplus,pogo-keyboard.yaml
 create mode 100644 drivers/input/keyboard/oneplus-pogo-kbd.c

-- 
2.53.0

