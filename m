Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426026;
	b=NXND9kAA4W82d0puZS0RejiNIxb0RKPOQxpj47SOphYsLNHQYxqN8dfETXyY88Oeytx0
	 OSlNnX8v/rRKIw1BDP+O0+WtI3ada+8lcahKnq1/d4mE+CLmVkaKo5hCbX/0+bK8FAcP7
	 O7scbzIjj8lWptexM4MmYuYxfR5GYOH/6BzZJpkTSPJNegbqLj97Kk/BFvs0aOEW9GS5+
	 MOS6mh2JnBTUnPpcbtRpiBIz9CNdlHsmCVmC8cUC5qEOSymMN9U8e5Up5x2FswyFF0Lc0
	 pT8bpfpi8blN8JUhGVivRXcxhl40p72UI9e0wAf0xNfxSV1Vdgnjp2Pj2CSIYY1k9dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426026;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=mtRwj7jd0DiYu19HtXx15Rst1HSYAjuntUvy+oixF2Y=;
	b=OAm381vs2Mln8RPjGCFyGCBbwNmq1SCbdYG+ywquXSsy1lOmvOthDio626bq8EEc9csq
	 pxxMFLlUDPUNZiimfqAlHBzGVnvWiotUvK4VLGvOGBJTvKRVIvtrQnzuLYaRY0JeP6Bnn
	 8wacH0u+pqeRvfVEtSdcgbhoYmMpGSIfNDxgd726vzpzjQQxxp9zPnHtZkEwmw7hBj/j6
	 7o3BjWfu+bkpQvqtamfpWSM2RFyh2A6c04eD+sFjrRZ3Ehsoeaf4ebhp8+mrld5vEJA7i
	 sqdGSPNP4LgjEeyTTYpaQ+QduxZCkb65kuXrdQrvAv8uxuAcy7AF1ql78xmmENHlvyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqVq9XjE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74E3606A882;
	Wed, 11 Nov 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqVq9XjE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2521F00A07;
	Wed, 11 Nov 2026 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426026;
	bh=mtRwj7jd0DiYu19HtXx15Rst1HSYAjuntUvy+oixF2Y=;
	h=From:Subject:Date:To:Cc;
	b=BqVq9XjEZAeRNFCn6lDZ9U7Kgds5B/T6I7Hdy4ZZgjxg4O94d9AMoNZrr/qs4P4pr
	 j9ZjVl5LEn3pAd+nckA4vYQx3yvwXx2NPUBHdpj0T50p6sz5AV8vLc3/ZluhLrUvxl
	 ysxMQYdPlvhoUq5Qbycpmyww9wlIAwsHED4PGgfDx8+KEUVhG3q/5Bo6dOb1xfYi2T
	 w5PT2e5+hUEPxwPllKXYed7wDYUurw6HHuM7UoWlTgaAcrCwW0tEl0yRG67dyk6aZu
	 VLmEDgSsG5xP77a63JTS4E84T4PEm2nvHGOnInttTngNG8lHBVX6vUFJkNqNlaH34i
	 Apx/xuJ5ozQ6A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 00/12] arm64: dts: hisilicon: DT warning fixes
Date: Wed, 11 Nov 2026 13:40:10 -0600
Message-Id: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw5AMBAAf0X2rIk2HuFXxKHaxTogXUQi/XeLu
 U0ymRsYAyFDk9wQ8CSmdRHRaQJussuIirw4mMyUWlB+71lN0qm6MNqgzbyucpB+CzjQ9b3a7nc
 ++hnd/g4gxgcaFcYRbQAAAA==
X-Change-ID: 20261111-dtbs-hisi-95212ea0d174
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Another batch of DT schema warning fixes for HiSilicon platforms. This 
fixes most of the remaining warnings on HiSilicon platforms.

It's best if the whole series is taken together.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (12):
      dt-bindings: mfd: syscon: Add HiSilicon register bank compatibles
      dt-bindings: mfd: Add HiSilicon reboot mode syscon schema
      arm64: dts: hisilicon: Add specific syscon compatibles
      arm64: dts: hisilicon: Describe ADV7533 supplies
      arm64: dts: hisilicon: Drop HiKey DSI endpoint unit-address
      arm64: dts: hisilicon: hi3798cv200: pinctrl node fixes
      arm64: dts: hisilicon: hip05: Rename the HIP05 NOR flash node
      arm64: dts: hisilicon: Move non-MMIO nodes out of simple-bus nodes
      arm64: dts: hisilicon: Correct DMA node names
      arm64: dts: hisilicon: hi6220: Correct I2S channel ordering
      arm64: dts: hisilicon: Remove obsolete HiKey970 PMIC GPIO property
      arm64: dts: hisilicon: Remove unsupported SBSA UART "reg-io-width"

 .../bindings/mfd/hisilicon,hi6220-reboot-mode.yaml |  34 +++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   4 +
 .../arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 138 ++++++++++-----------
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  17 ++-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          | 119 +++++++++---------
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |  26 ++--
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |   4 +-
 .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi |  69 +++++------
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |  11 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 118 +++++++++---------
 .../arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi |  10 +-
 .../arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi |   8 +-
 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi   |   1 -
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts        |   2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |   2 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           |   5 +-
 16 files changed, 310 insertions(+), 258 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-dtbs-hisi-95212ea0d174

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

