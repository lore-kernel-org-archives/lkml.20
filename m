Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704050;
	b=MY+qr8OtYj4vunFvnIO/HcjgkOKajCMabVDBN6AYxlqbKZlwWBZ95oRUWNHXjLqs0JRL
	 FTfwK/6hEKbzh5VJz/Aczhe4THkne43CjfAHzTCXlh6HJEJePTXY51Pjtuu5kOiwgSR2U
	 P5zzx6kFkUfUaYomo26hfBcV3evuVt+fNdlYKa+OOfLYIGDhmkxI2UECS/F/fAzgh4LU+
	 XT1/Yfyg/3g96OcOTNASuKElNz6yTVKi+gxuGVOpCZOqJHoVrP/cqX8TCoTk7kvw4JAOa
	 M7wpvalZDQrUqlF3BJtxkcosUih2bpWL/GF179B38YT0K9rqcSaD3cydzoYvfHE7WGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704050;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=kl33B2f2rp7Tzl8du7UR+tDLcQcMWlQpWD02vzFm6xc=;
	b=Ksr1WV5MyoWl9IZKVvdIKROhERfQOefVhjMd8P9x8C3hCYmNxyRFZT24oJSMYNa1Sq/o
	 g/sGrKSGzmjkJhpWN5ARX5ltxC6BvLTuP0+A6TrVi4eqnfTdCAJnv4g+L/jjAqMfoXfFh
	 rSakrixZbH4jrV5o2GbeHA9njt3+/F/L5IyAELRJTmw6iJngh1zOCzHESctI4aYqKjcrX
	 xSw5YFE1QNWHkaEg2rPvbiwSxlfd/Rdz+O1URIlEp97HpJTUjby75PN2xbxl+YXPuvZag
	 gKPmca7vG8Naysz4f4ksTonxy1bJm/H4gHiGBcdrvs6aAB4HL5ku9lSNIt+SuLaBObQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=ASeIvtUd;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBDC606A319;
	Thu, 22 Oct 2026 21:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBDC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=ASeIvtUd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792704041; x=1792963241;
	bh=kl33B2f2rp7Tzl8du7UR+tDLcQcMWlQpWD02vzFm6xc=;
	h=From:To:Cc:Date:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ASeIvtUd3xRbafUVythv9TzuMap+jlyDt2X+8cKoEp+pJrwIyLp5fxKTJnOw3t66U
	 oKd+/EXOOPYiE6hBsyrcYnxYysS6th2vNGC8t9v/UWLxBzUyajQW/JJYODmutYr9r5
	 M0io2S2RUcSCEx5GRV1uPpbWkLjEvJ1oM77eZV/j4S1YZ+cxrX0CtOxgCXprcGskmM
	 2c0Ibn5Z+0H/zEFW9Y7Zk0S+WNovGaTIBtSJrAbf5rfguDrtKtrMCaLCj4EFTG9Uqn
	 1x3Ey0dWbApkjxRvGrfHRYH2dlOF76iMHMS78geiaPqgvp/7Tf6QgA3CB74fb5k6AV
	 0u+CWcALnUooA==
X-Pm-Submission-Id: 4j9fFf59zjz1DFG7
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 22:18:23 +0100
Subject: [PATCH 0/2] arm64: dts: qcom: Add initial Motorola Moto G10 support
Message-ID: <cover.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

This series adds an initial device tree for the Motorola Moto G10
(capri), based on the Qualcomm Snapdragon 460 (SM4250). It adds the board
compatible and describes eMMC, USB-C, power and volume keys, the firmware
framebuffer, regulators, GPU, Wi-Fi, Bluetooth and remote processors.

The board uses the shared PM6125 and PMI632 definitions, with its own
reserved-memory layout and firmware PSCI state IDs. Modem, ADSP and GPU
firmware paths are namespaced under qcom/motorola/capri/.

Native panel, touchscreen, speaker and battery support need separate
driver and binding submissions and are outside this series.

Based on Qualcomm arm64-for-7.4 (Linux 7.3-rc1). Binding and full DT schema
checks pass. The W=1 DTB build reports an inherited unused DSI address/size-
cells warning in sm6115.dtsi, also reproduced with OnePlus Billie2.

Runtime checks covered booting with all eight CPUs, read-only eMMC access
and USB ECM transfers. simpledrm and the power/volume input devices
registered. Thermal readings and an active watchdog were observed.
Physical button events and visible framebuffer output remain unconfirmed.
GPU, Wi-Fi, Bluetooth, remote processors and suspend were not exercised;
the minimal RAM image contained no wireless/DSP firmware or modules.

The test ran without a panic or warning backtrace. A PSCI PC-mode firmware
warning also occurs with the phone's installed kernel; suspend and deeper
idle states remain untested.

For the stock Android bootloader, testing used out-of-tree handoff code
to select this DTB while retaining the firmware RAM map, initramfs and
factory Wi-Fi address, plus an arm64 Image alignment wrapper. That code
is not included here. No other device-specific driver patches were used.

Michael McAllister (2):
  dt-bindings: arm: qcom: Add Motorola Moto G10
  arm64: dts: qcom: Add Motorola Moto G10

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-motorola-capri.dts   | 452 ++++++++++++++++++
 3 files changed, 454 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts


base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
