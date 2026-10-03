Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEB495049;
	Sat,  3 Oct 2026 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056810; cv=none; b=tlJITQ4xfb3NAbrb1zrqF4nf0xibSSYGFVogVZIWBZtNQqF8fnDQyWiA/6O727A5TrXy57gZRyQ6L9Qs3HCTyZ1V8XVT+MG+zKUUccmv042CbX4k3ZZhKep+e5N2dQXJT+dDQVjKcpe46ttUB2JlpsjGfraa2BFC/EhbJ835308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056810; c=relaxed/simple;
	bh=ShkTY0+rQkFFsx449jSEVzD0XmDR63XkYEvARtORrRU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=H6t0oKummjWkwidyKw0yAzjY773aSr5JjdKq4dgnBCqGjQa1db6lJYXmJ6lA785E5LhlEqqv7bJiAkq7W07FDzxph53k2NFADQeGu5iK4P33OFw6Mjoxmu17uv/05UPy/DKnUYuSgbUtBHEUq9IubV34iA2b3Hm7geiD9YhKu5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=WOewKR34; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="WOewKR34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791056793; bh=KXqzVoCOHNj4x3oLI8LonBNbU14rAUA+riYDz1pDaA0=;
	h=From:To:Cc:Subject:Date;
	b=WOewKR34m6KKKjNP+ze8At/bPfhY6OgNPhEJMMT53/s9QnFTSKa3aASpMmS8vCAuG
	 ZZi1W2Gzy8fEpdTjB0i+wbeRzlOSYTmwtMKUc1WxK2gLupbfWS7PMgPrLOuZBorIcv
	 mHk3PIFxvOm/A/t7tmrSoUe6ibRfY0QKSywuwNFE=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B9D93CB0; Sun, 04 Oct 2026 03:46:29 +0800
X-QQ-mid: xmsmtpt1791056789tmd9xg9z6
Message-ID: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfCSVcvSgQB7e432dlIGlLZrovKeFBv0TAHYe9WXGY3FxV37JeyX
	 dHdwWhfp26KS02Vzsx6TlYjvuA78DOji+Uimyq2rcewDQM8AhJaHQmuy/l5tV+W/yOjE/EN3wHoT
	 m6rShVkqzEMAgMW+Y7Wk3xBLHbn9tr//fISPELMA9e12w4wcwiPeC6ra/kdRCYcuj3kVn7NrDY9b
	 FBCyPoTl2u+11jIT+dEbgX1/xcmj7MSRCnB8DGZ8pq1vsv9GUyt7QChwjryZvPKE77WOFP6KBjZv
	 5zPGDZUZUip3bVuEZYtDSIMPjuvqTLVyGZ/L6gg0510xjGhLR2s1zDfaWhffMzNtY+q8OHmLs0M8
	 vQa/HF4ZXv0YELi/BjcN1k8do3M8IWh5ShLQFrVbZWf6Tmk0yWtzYD4ee3AD64ctjniNLZxegTeU
	 Avtxsi5hHR7X0JZBY8v2ymjEflm6X1AhAFTD2nP6XvrK7aacH5gk56xujhYx/AzzHXPi1/hBFqjC
	 lqG8/TQGwj3i+01TYeKLClAOzuDbTC3x17yIvS6PLkPswQBNqueVfDr85a6XQ/1mQUxI1ZUNJfmx
	 6lzziCLKmz0hpkVOvtRrzEVIuYg6yFXACFNnb0Bn27GYGmB007QNdAnRdvvio3pb73riA8JPzfyC
	 4XNjTAKzVa/ipbmTNCpa6172lkEN08h2m+m7u6MR5WF4rvshVA+Y8qGqZjiDY1PmGsdG2SdV00Uz
	 B9XFp5SRZOVsaPHvuhHeqWoimbzQQi18DwBmUbmWjoZINPIg9Evb/qpczG7YcQsQgNeLzCuw0RY4
	 cuIqZ3nLNhRea6TIcS+VIxq41YKSJK4TiO1mMbafynWg7UnpoxeZX8ZBGWr9+U8IazMdwdtfdT8+
	 Y9LPEGRlg6uRA4gyivdF09ugdP2XWE1izXTa4H8YxKUPXggRB/NqT7LI6+2QW63sTiNTeASCJeaz
	 2ZkUKYKepu/JVDjdE8RYhc7V0s3HvFofsgf3rmuOCuzars0bwPaPJ+t/LK8gyH8pIf6I98SRyvHB
	 ohf81j9uWj9Yl/TfUSux0+nymAOC7ehMhZRZ6M/KzpcWea2ydI
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: zynqmp: Add support for EBDEE EdgeBoard FZ3A
Date: Sun,  4 Oct 2026 03:46:22 +0800
X-OQ-MSGID: <20261003194625.936288-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EBDEE EdgeBoard FZ3A is a development board built around the MYIR
MYS-CZU3EG SoM, based on the Xilinx Zynq UltraScale+ XCZU3EG.

This series adds the EBDEE vendor prefix, documents the board compatible,
and adds a device tree for the board's PS peripherals:

  - UART1 debug console
  - eMMC and microSD card
  - GEM3 Ethernet
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

The Paddle-Mobile FPGA accelerator is not included. Its PL description
depends on vendor-specific IP and an out-of-tree driver.

Tested on EBDEE FZ3A hardware with Linux 7.3.0-rc5: the board boots from
the SD card into userspace over the serial console, and all enabled board
functions work as expected.

The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
dt_binding_check.

Pufan Jin (3):
  dt-bindings: Add EBDEE vendor prefix
  dt-bindings: soc: xilinx: Add EBDEE EdgeBoard FZ3A
  arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development board

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-ebdee-edgeboard-fz3a.dts    | 272 ++++++++++++++++++
 4 files changed, 276 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0

