Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678181;
	b=k/DFG2/B6xHgjNz9rtp2nNmYE18RJ/XtKKs3D3wb+3VX4DkhOnzaaq1Dw/ln52fpc2jv
	 8tv1FVpwh4IIYEUEyUNrBD44NAjRPvE1qloojFg1klt3hT81VNN7lHY0nYTYYTJ4AKirU
	 lrwu96rVyyDqRzhFgRmMPxFiFn9Brgsn8YUS+Sp6bc9Sm9+m3GwgJBH5bXlD0zwa7ou8n
	 MT8elQBqEYNN7PmcqYuInWMCBdzMYAWOgie7Ula1HxcmnFyTiT3M0sRl2Ob73XibhPXDd
	 D8vookcQwOscMcm6kBXLRRbrq2LrcscH/sv5h8wLURcnDyBL8n/JiQZtJC34duERcmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
	b=i3yQ/Swb5e0bsXkLn2FUSKJEuG9IqBMDQSwftXDs/Xj3A9hUTtJEx7ph7C4Bu+angCzL
	 KbKtDorfXXRRkaVW18EMCnbc9OpIJGmfl5K5Q/TCIWwfchmSs86AmW4q8I5qIlwwmDFCn
	 uFyaM5wXV87cI0dQ0zrHjGfdjbim6tZ49hSqsIm/HjMPLVS5Lot59o35AXVBghqxz+mgU
	 +oN/IHPaq4XiEU6zetvWFP24BS8ARzfLJpnzCDfm8FZd/I0Xw3/AtHSA7aqoQAV0778Aj
	 xSUo02NmYektenMhhkSMwSIa2uamFPPd/zZw7J+80unWi+jvFvCP0sEyYR7RA6sSQzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ELtSfocY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238F9606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ELtSfocY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so12973165e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678179; x=1793282979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=ELtSfocY0aSODrp9esPeQgfMoz+v7HKwjSI7sxm8uS43Yq+tTC6w/9itWvg+q4ZcnH
         piXssBMpqrcC37U8hGqIcJamdkS7f/U9nFMis8k8Npb8YSDJxEpimRGzpyIuHeauFbRl
         9KaxhD/YA0ASU68hxIjpcszXrStVERR4r/vwFghL1hzVYVIdPlV26LubQahrh045AnVZ
         P93A/ZJ8RrorLnEloI7FnkwQqWIJB+LroHl3VcsW33iDpuEKNtQrsdbtcGVeiIgrxTP8
         I5e1lA58OvL3cz2UAHeG25x1qWmuX4VGxGz3uaZSwqxrJqjPGHa+k4YriJ56Q7KkOdYg
         tnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678179; x=1793282979;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YXago1OoE7za0flCz23UuKhtMvUqXuNpFfpj2dGF/2k=;
        b=h6tv5nZWpiUUE8OVan4qg/pkvveDWEXsyfBalloevN9XXP0HHJ2KHZrdJ2hvrIXB9m
         2nN4XzGT9O6IO11zK1zj1Fu6mQiuj/N74dEzoKE7lDOezGn4c2FsSfFWMOORs2ztmLMv
         w0Z8M83/pbac9aKG+sE/9yEC4nCQgM04SovTKoEyH/3m9G5rcnpDt+85Wl/nqrXb3Qvs
         gnqmh0DHilJebp1PbJJFXdM4SwM3MGrMqwpcSuLUK2NBaS+sVv8uzQSC37RyonYOTBBT
         4g5nVpnhbRcVPoXPYNnsM0UIXl2YXCj2qu48lV3XZEMxn1KXAF3mbOwac7eNRz+fcPVM
         hQNA==
X-Forwarded-Encrypted: i=1; AKwUvBw+HNb1LA107cVDKKih/c4uP/JkIVS/IydTuwA6BGDnx4TUmuFdDuslkc7QPlw/XFk1UE0DlvMi2ZsgblE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbAiZHsZ4Yz5H01Lb/PsrM+5LZg66U3jQQGSAuUkTYl4oeJCis
	xux7NffCmiOJvcPgzrWHbIbW1My5rrTRFMTkYjj5YSZmykj9hhhU9o3W
X-Gm-Gg: AYBFou2cAxS/hnZFqZQqlE+UryAino7+zdjIitu90RnCcozqLnvI4CsfjuRYnKYH463
	PyJZYp9QHHPhd5LVf+TvzbC7XghC6tDRanwxJ8JEljieFsz/iKpLA0zz7jN7mtSCZDlDyRUkQvQ
	XnkDtx8NQDBRqGRXvW/IOuvtigK7J6+IbYF9M1mqoRtlUbWELC+OXwGtVjmLaU47H46jTM4an82
	KOSBAbl5hZS+MjDAbcvBgPM32a1dRnvxLDvXIXuaQilGBnTRDIvI0NBakrITftnrsVrJFrgohoF
	GnzSu8Ay3Fewh8FW7OkE9i5ti73fOMacsXI76LCV6JMj8x3SUgqG0pdifzjrjPFW06W9Ckcs1kg
	bXw3jLnhbF1hj2nDY3bvsQqE9MI1jIkgVOzAXritvmFucW4iARmZWTkNvzwzbuVGK4IwLPg1/5v
	ODCWjcUx88DcMipxNjWDJd9ibjk3vtM6AxhLLGzTYYMCODnN3IcSnApMpU4lTY+qDjzHoOHS22b
	cXQLmbi3Fpo+/GQOCiNQ/FKdC74dLEAGjbMghHSpQzogqM1px3hKyGXOAjDUXTt78kgGmPSMWoc
	Msaecy62G2Chj/jWJvLO+WhOe0YW2hmMMo4N+DTpwSTXMjG8CcjQZ6w=
X-Received: by 2002:adf:e00e:0:20b0:48e:1e03:687f with SMTP id ffacd0b85a97d-48e264c3ffamr7880482f8f.31.1792678179143;
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:38 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/5] arm64: dts: freescale: Share the Toradex Cortex-M
 UART overlay
Date: Thu, 22 Oct 2026 16:09:32 +0200
Message-Id: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwZ2moC/32NTQ6DIBBGr2JmXRrAnzhd9R6NC8CxTlKlgYZoD
 Hcv9QBdvpd87zsgUmCKcKsOCJQ4sl8L6EsFbjbrkwSPhUFL3UnUWiQleNmwFT5ReJk9ih5tbVD
 1rcUayu4daOLtbD6GwjPHjw/7eZHUz/6rFSNFh42S0ky2se5exmak7er8AkPO+QsnW9p3tAAAA
 A==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Several Toradex modules assign one UART to firmware running on their
Cortex-M core: Verdin UART_4 on Verdin iMX8M Mini, Verdin iMX8M Plus
and Verdin iMX95, Aquila UART_4 on Aquila iMX95 and SER0 on Toradex
SMARC iMX95. The overlays reserving it only differ in the UART
instance.

Label that UART uart_mcu in each module device tree and share one
overlay, imx-tdx-uart-mcu.dtso, which reserves the labelled UART. The
merged Verdin iMX8M Mini overlay becomes the shared one, and the
combined Verdin iMX8M Mini DTB keeps its name. NXP's imx9-mqs.dtso
uses the same pattern with its mqs1_conflict_dev board label.

The overlays mark the port as reserved so Linux does not claim it.
Firmware remains responsible for configuring the UART and its pads.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Share one overlay through a uart_mcu label instead of adding
  identical per-module overlays (Frank), and include the merged Verdin
  iMX8M Mini overlay
- Add Verdin iMX8M Plus, previously posted with the Verdin iMX8M OV5640
  series:
  https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com
- Drop the Verdin iMX95 NAU8822 BTL patch, now covered by the shared
  NAU8822 BTL series:
  https://lore.kernel.org/all/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com/
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com

---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mm-verdin: Share the UART_4 MCU overlay
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay

 arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso       | 14 ++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi           |  2 +-
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi           |  2 +-
 8 files changed, 32 insertions(+), 21 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260922-v1-imx95-overlays-89b3a9185b93

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

