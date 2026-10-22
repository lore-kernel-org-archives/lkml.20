Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792648802;
	b=1NH4OJ4pv/TPo8YtQqO/ukPk8xd1p5iqmnxIbFxCEDwmqBQ5l1w4RaeMrbZRk//5BsGN
	 LRWYW86A+tAOuT3zxE4y36IjPN3V1m1LJO+cTwirdnyj9LUaHQlsD68LX55x5jWLC2AX+
	 f1nDgRqp2ESV3UtoK8VE3oj6ZA9olWPhiY3c0IZmjXXGCHgzlTZ2eS2HAPxKjl77Ty2oE
	 UerR2qGXmOcyke2nKhsMd1lI1rcluUG1HC6Kj9NMG8IIKYXQ41OTMGz5iDX6mouiAdkNP
	 iP60qijDPw2ODDAy0lvc6jOZoKQGzAK6UQIwEvfE9DISdAta359qt4QN5GR2mHdMUyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648802;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HUvL51f7V9p0KcCzZsOCgyyG6v93gRvgQUjNHkLc5hE=;
	b=M5MAlBZlJ1JyReSJtB0BSBJKCEvsMpUreBPHyNO4ccR9M1BnrcmPrg8E2fE+SCLzSML3
	 3RCkgfnLThr+2zZT92vc0iDgrJf6lHwyXC29d7i8D3T2J3GtObMcXOKFfYCwBC0DoPjIl
	 16DLH0tMO8iDYnhraDY59lf9MFrGwdCWVAypbCMnt6d8bUVimbUNq5FG7fSVfD/dqJZYH
	 Pow6EF8PNZgfFrZrk0qUX+6zLj05VUljdG7egoVRsu/U0eVTVq3gTObUlGrVx3BALLtU3
	 FBaVVZYrkZ8it5TZR+ncvZhtdhNpesQob8toJzUFGKQOd9+DmUPXjj66i6o8mJyR9EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GzuNHu31;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A5606A322;
	Thu, 22 Oct 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GzuNHu31
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792648801;
	b=CQACgGisau1xqIKP1Ki0xxgpB5acYu8nljfPjpo0VlJtfaqbXiH7dN4/cecNgHODJ/Tb
	 SX+cYL3mHYGpdNLiAUaKXiFsvqpmTllVL6aYhWwkVlSTdu1Y/wlibxQLauu+tNL1WNeon
	 Kd31ITtESo4ALtzK/VPw9OB8APSI//GW+0RMVrvuwr3ycQYPAmRAG597KHnTOFuPkSNy9
	 /yUiHBdbuT/Yx9ok+oytoU8Ap7O8m6pKX4mWuOUybzziSSEFLnrBEcyPiQYTJBp/Unudx
	 +pwI2m48Q/ioQ3aFMXooVghquPiYBTsFNHJO/Nflq9nUdQ+IzA85u0N0k/MHklmfGyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792648801;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HUvL51f7V9p0KcCzZsOCgyyG6v93gRvgQUjNHkLc5hE=;
	b=kEDzktBxSRILa29vC4vvGXK5pGAAs7OetkXvNZ7bjDyIa5A9P/9UH51mUwtGac8K6YXK
	 fyPrHSLOGIvVO4c1eU2tR4Czteqjpj7zsndF45f8Kyz1rW7H+iKiSSj//qBTlTfahV6en
	 JTftEf4UFAuarRN2NI1cOqarwioofCEXUpkhEbuTcxN6o1T5PWSD6cPt44EZVESfcFHrb
	 IoV3H4UQn8CYatbCY2bIpzpSsiH2jdZtzwyaCaUlYSkyNUKmGxsCwd0cKGhXU7anmAwXn
	 EROTDuY6r1UmhKXO7qIrC3A5ZOD1KCO5KMJRaR8U9NYgSxvRTq42/3sOf/oxsK+LWBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A2781F000C4;
	Thu, 22 Oct 2026 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792648801;
	bh=HUvL51f7V9p0KcCzZsOCgyyG6v93gRvgQUjNHkLc5hE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=GzuNHu31nkcgETO0ZeQlMzBKieJKEqr5WJUg0dVpNxaier59N3qMfmrFHJwq7tQIJ
	 ZISEXe72fq7YGSG323ueVeFfmZzV7sMJg+cqJKlXnIQqKyEkeVXF7dzOMn38m7MjJv
	 ozuP3NCkDLOes7ICfAbuxj5qGociqmilRSd6UzrtxRSKBBxu/hCGqxgV68HHsSZ9Gn
	 nPsC7dlmH6RlZm3oCpYGEAOceEHVfBsPCIMXrjXH++lXevWhOFEVrfPcwMUnMR0zbT
	 oSBe+JnFv2rXYuxSadpQe/kAmIVAlv00pwl5iNtQLZFk7sWqVmFnt1b9dPNLOyLhWb
	 U/+b3dprIBJYA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CB444434FD;
	Thu, 22 Oct 2026 05:59:59 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
Date: Thu, 22 Oct 2026 05:56:04 +0000
Message-Id: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAHSl2WoC/yWM3Q6CMAxGX4X02iZYCFFfxXixjSo1ZJCVmSWEd
 3fVy/P9nB2Uk7DCrdkh8UdUlliBTg2EycUXo4yVgVoazi0Rao5FcEnWrYIdzpti3/krUT+4C49
 Qr2vip5Sf9v74s2b/5rCZyxbeKaOvljBZNEvMBS2E4/gCnxZUk5UAAAA=
X-Change-ID: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792648566; l=4037;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=UWARrsbcfqqgmoUfwye7apXutTup2/cnkBWxxeBO1G8=;
 b=Fis/SI/NwEVhlFc/JEIH4uS2Tg4IpEa6L7GSS4krojtK6zXY72tIac9VY33JDqYQLUakPuHBD
 mf7uB3uRGEjAK/yrElPyLps0orgN6OxFJqhGscpGQQD6biyzSw/xulm
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

Continue Jernej Skrabec's April 2025 Orange Pi 3 LTS series, retaining
his authorship and Rob Herring's acknowledgement of the binding patch:
https://lore.kernel.org/linux-sunxi/20250413134318.66681-1-jernej.skrabec@gmail.com/

Add the board compatible and a device tree for the Allwinner H6-based
Orange Pi 3 LTS, with 2 GiB LPDDR3, 8 GiB eMMC, Motorcomm YT8531C
Ethernet PHY, USB host ports and HDMI. The wireless module's SDIO wiring
and power supplies are described; working Wi-Fi/Bluetooth is not claimed.

Changes since v1:
- Rebase onto current mainline Linux.
- Fix oscillator naming and use CLK_OSC32K_FANOUT.
- Chain the GMAC and wireless 3.3 V regulators to their input supply.
- Keep BLDO3 always on and describe the PM-bank supply.
- Document the DCDCA/DCDCB polyphase arrangement.
- Use rgmii-id with zero MAC delays and 1950 ps PHY RX/TX delays,
  following the Ethernet discussion in the original review.
- Use green PL7 as the power LED and red PL4 as the status LED.
- Default green off and red on for Linux startup; userspace can clear
  both at its readiness milestone. U-Boot overrides its own defaults.

The device-tree hardware settings match the accompanying U-Boot series;
only include paths differ. U-Boot boot tests of the earlier red-LED
revision confirmed 2 GiB RAM, SD/eMMC enumeration, DHCP and ping.
The submitted green-LED U-Boot revision also booted the Linux test
image from SD. The corrected U-Boot handoff LED sequence has also
been confirmed on the board.

Validation:
- Compile both the new LTS DTB and the existing Orange Pi 3 DTB.
- Run dt_binding_check for arm/sunxi.yaml.
- Validate both board DTBs against the full processed schema set.
- Run checkpatch --strict, ignoring FILE_PATH_CHANGES because the new
  DTS is already covered by the Allwinner MAINTAINERS directory pattern.
- Build an Allwinner-focused arm64 diagnostic kernel with the required
  drivers built in and a separate BusyBox initramfs for RAM-only testing.

The proposed eMMC properties remain conservative. Higher-speed eMMC
modes and the earlier LED drive-strength question are not resolved by
this revision's build and schema checks.

On-board Linux testing with the diagnostic CONFIG_MODULES=y kernel
reaches the RAM shell with four CPUs and 2 GiB RAM. AXP806 regulators
initialize successfully; SD, eMMC and an SDIO card enumerate; eth0 and
USB host root hubs register. An earlier CONFIG_MODULES=n diagnostic
build failed to defer pinctrl probing and timed out accessing the PMIC.
The latest test no longer exhibits that failure.

The YT8531 PHY links at 1 Gbps/full duplex; DHCP, DNS and an IPv6
Internet ping passed (2/2 received). Two direct 8 MiB reads from each
of SD and eMMC compared identical. Two cold starts with LED, shell and
Ethernet checks were confirmed. Sustained transfer, external USB device
transfers and HDMI output remain untested.
The installed Fedora IoT deployment is untouched. The test initramfs
clears both LEDs before opening the shell. After updating the bootloader, Cristian confirmed the complete
sequence: green in main U-Boot, red at Starting kernel, both off at
the diagnostic shell.

Codex assisted with adapting the original DTS and review feedback,
preparing this cover and container build/test tooling, and analyzing
the supplied serial log. The board boot was performed by Cristian.

Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
Jernej Skrabec (2):
      dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
      arm64: dts: allwinner: h6: Add Orange Pi 3 LTS

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 362 +++++++++++++++++++++
 3 files changed, 368 insertions(+)
---
base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed

Best regards,
--  
Cristian Filipescu <filipescu.cristian@gmail.com>


