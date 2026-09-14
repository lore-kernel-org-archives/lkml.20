Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1734D92C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355955; cv=none; b=UGc0A2cu6Bg1MAAImz/nTa0Xc1nnSBoGxS03EDSuDZLWebAHHr/EkTQGDBi+SG5hmQyHeHbKhIgccTfVvqh4/0AkmHeEKyn2DaopZjLLNxjHL0x8qbuY1bTsfaqLzy3u3zwSMXC6axwU1sfEJEbU/bx2MmzuPeESMbPmDNmgPxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355955; c=relaxed/simple;
	bh=wBx+w1v3FQBzZz0qke9eWRr+XID002d5eHN6k03EyKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nxUoEpemcPZoGtXxCEid+cTYKTwMNXrQOZKbMNbm+jql7ymy/yHDM7cztNsrbMZnEzJ1TMiM0XGKwicMxkbPv860RpkYxUrTKFfriykjqRrcupaRo0/EvdEVwyYx/26tHozITszE8cTLpKC6SIHZztRaYmZAhQjO55iS1Z9IdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9Lx465t; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9Lx465t"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dcff8f44f2so42183855ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355946; x=1789960746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKKKPTctZOY62gpBWjyYhq7FRns8SufRf13oKGN+IiQ=;
        b=n9Lx465t0lW50t+2jFWJjQOnEpduxqyiVAiKEjH40o7qCd4Hrmjq/l6HfR0fDrplj3
         bO/u7uD6agoAm7kbmdqlMf8aYBH3ztVgZxWeDeEV8a83/tI1Nx30w7t8JsSYPqrGuFIH
         J5Sro4SwXqjV9swouDU+Mm0fdle0UT0k/+PyL4wWrC4dDIPb3SRcna6vz/mQJMjBcjII
         fmnmdXgnLspvThm36oWnYPOnShv+fkvkhvW6wL3AoUuINjdtMYrt8Fa5AkVhLqAYY06N
         L47C0Y8iNVKNf2ABo7MDitOMjkdFUV2SzI19aQrq94xJhxjLaJL+OrQHr2derWerp6Ru
         TSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355946; x=1789960746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKKKPTctZOY62gpBWjyYhq7FRns8SufRf13oKGN+IiQ=;
        b=Q/oPERT9XpTDgL+PxnCIl+PNIwFWDBJWF52f41aB6GwM2kMpJI3NrGqmAflI8KLDRf
         3henvAQw5g8bev+KcrUyX9QO8/G3rGkKgb0yDLSHPRuBeEnJRPlPzEMpfjkwV+PDgSQm
         59bVQswad6aF+yzVbMJFmWD9i18Xfs1V5f6YTa2zHYTSypjPDtpHFW/AjaVZUu0oknqk
         MTxLJjsc4ZxFiwna7J1M5JkKoY/CrlPSk0rYhVPjiGDUFEtOb6qZiW956hOidOW1FMeV
         1fTEjgqbva0gWDwKWxankoeNrPG73IEOW1tFyPiywVFTYMRQyz3YB39SMECbZfMenrCS
         N0oA==
X-Forwarded-Encrypted: i=1; AKwUvByCr4Mc/sV5ZS6klXstMxFOFB22BQAXEUsfw0B4II4AJfsn8PJrXoPBuCW/d6+N0N95hcks5ezk+jtxsd4=@vger.kernel.org
X-Gm-Message-State: AFuF++lYnNFkjmwdBPxX5fhyNbb1mHr2lK8lfPivzsQDs2BKqguBFpMX
	xmaT6Bz2IsLN3UUZDNslAoptZkQTjHOjoDOAerujz5IvvOKqzHdZc6rb
X-Gm-Gg: AYBFou0a04NAQZYEHTu1ei2qbFDZckw0Q28aBRtW0WyNk000M3qtV/g1PZOCtITFj08
	A+/1dnnIj+a8x7JEivnY/PUf9h5anyig7r/fUyY7U7MPon++Ko9wSMDCDt18/2LcuUQFetphPYc
	YRfit1bpcnApqslWdy8BRSXJD+6XG+BP7pKrhz26WSxSYCDF+zAeKjLf+vtTu52cXKV8FMVY6Dy
	4ZlEN17iR7it7OdOl9PJ6VJ3uauzB0UcO3THbCH153t1KAwUXYscRZYjk/GReX1jM3x+TESpfdE
	xgH1UMZPYWfqFw9D3S/4BOz9apc07tOgNCcxSTMi1+OuccfE8zTfhyykSkdIZFwtmMOIhrBaW0T
	8BjDaNVNmzuYaarSJgH3rlfae+23Vx5Etpj9TXVd4ElK4bO60v2uoWt5ft2NygRGqAv0YXWH155
	aawF/OOiaKxXO3lBlnuGE94Uu58h4uVg/Ebfuh67UCIAYJ13nv+1YEoAounS13CjzIUrqpnO5Bn
	uixEeuMkM8Y5piJ++IgpFZxND873vXKKixb1bhJgJHpzeiAnSGUPcMVU2fr4W0=
X-Received: by 2002:a17:903:1aeb:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2dd6c5f7d4bmr16986685ad.6.1789355946130;
        Sun, 13 Sep 2026 20:19:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:05 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon, 14 Sep 2026 11:18:56 +0800
Message-ID: <20260914031859.385224-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v4:

  - dts: move the usb_phy node out of /soc to the top level (placed
    between timer and soc), since usb_phy has no <reg>/<ranges> and
    doesn't belong under /soc's simple-bus, which triggered DT
    validation warnings. No other changes.

Changes since v3:

  - dt-bindings: add nuvoton,rcalcode = <7 7> example to illustrate the
    optional resistor calibration property; revert redundant clock example
    change (back to USBD_GATE as in the original binding).

  - driver: handle -ENODEV from usb_role_switch_register() gracefully so
    that probe succeeds when CONFIG_USB_ROLE_SWITCH is not enabled.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 284 +++++++++++++-----
 5 files changed, 389 insertions(+), 76 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

