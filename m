Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09646D0A2;
	Fri, 25 Sep 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336732; cv=pass; b=e7dvhrUgmt0tMbHy3oNAazI6CQ40m0CBDaVUb8mkLqE5ylW/HHsSsVrxCIjfNBxcNUnPoiXDyD6jolN/kico+IqNvslojj8sGW7XO9yK0ni1HFfDRwIsR5dEC9+mcf7+b1xA26a6Kan/VfcDR6+AySmRVxhfhjmtLyuSLXbCx68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336732; c=relaxed/simple;
	bh=+M+i0Q3HQN/+aw6oPzUhTeqV1kAS1si2zWtei3F8PUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S/hojN0b0dmIvD+po9C2kS3KfCWhbbym3sXazsCkHqW31uSjdpVZZk4yOcji9jVp0p5Ck450oNxKvLjw098TtI484yrw0qEtJHbHe4O506xknq5pY84xpLkT0iH9VWRXy7KjAqBN6hOO/JkvxphjQaioLl0V6mEP5R+q/t8YlOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=gD5jygeD; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="gD5jygeD"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1B8F0200291;
	Fri, 25 Sep 2026 13:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ucRt60YJHeOY9EN5z7JhvTDp5yZqWsUnoSz0CkvUWAs=;
	b=gD5jygeDHjEs/AI7xwh4J9Fhd4xSIVdbWpx4swqcG4YXxz7tFPnFwOLjR/QRb0BHnH+xLh
	V9xk8p3Nua2/k6fDVn52WQhZEVvIM0t2DErcQoaeyNNiNaCAenlYtt0oCLyBtWaBU1CxkE
	X0VGhgE8nk56o/0scao8r8WGahI0hbD4v4sj7rZn+X8obd/UG9BLvxtLmiBDkfuYHcXP7a
	3QQ0C6O/COvq0f+EWEtyX0SGDBC6l9vD3hy+0DXNg1Je90eFuRF2bcVk7j+ivLbLgVSZ5d
	5xw45HaSkHpKl1vYWlcFWaaQfs3hYPOZPS0H0ohCFxh5CcIyb5uQL0KlCbKulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ucRt60YJHeOY9EN5z7JhvTDp5yZqWsUnoSz0CkvUWAs=;
	b=Wbzxcw0wBRMx8VlJ7sgm/qyKCsjgaQUmMh7t0qQ9BsuZPOdIDSJJ+l96WEcrLkm20OP0TP
	Y9Juv2V1aHZGwE1230LaREsJNOSwAfnfCgoXL7SMIKi+rv72qooy58MAKyqZOBgNsO1nLA
	L3EXUXch/boFJHY/SBAdBO3GcBlOiSF+vATcrc3hYo/9BwObgvqoyW5hvpL0bmgcl/8yUz
	OB+zLxMwISTVCrANOksoP7aopckG7rvDLFxPOC6JyhxKpY5ZLFl0DaZgSQ0NAOYNWt9MVe
	iucwMfzSVat0vG+aHsZAjfLPrGpjIgqw5mMlVu57yPtPjg3JYaey+CrtYwmhVQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790336726; a=rsa-sha256;
	cv=none;
	b=Mj+r6Q4pFnF2Jqu3QfzJGewPp+ctsht1FxTxuGVXFdkWFcEvj3jC6K8YOVJQQMEXV1s+6J
	nN17652PwdY1iFycYNFRHZx3p0jg6XygHYeMSgUqsh8PaUBjgbIpkAZGetkXz5Jx+TZwNG
	vqEv6idNmCHRc+86BjSCV4kvCilTVvvcFkm5fALdA5ZPQ/S/bBexbp1r21myyGTgV2xOvj
	Rtxa5iP7oVASMZzrB2sHdHfGuhQ0qIXGy0y9azdERGydV+LzGGRVm9XjbHEjOb3EHDxztq
	yQ7SghRtO/LwLPFqyFR+i2Yz2vH2T3auebKy0N/qCqdJtcPqOZmXgGaR8PIVVQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v5 0/4] media: rockchip: Add JPEG decoder driver
Date: Fri, 25 Sep 2026 13:45:24 +0200
Message-Id: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRetmoC/23OwWrDMAyA4VcpPtdFlmPH6WnvMXZILDnxCklwu
 tBR8u5zCmWF+vgL9El3sXCKvIjz4S4Sr3GJ05jDHA/CD+3Ys4yUWyCgBYdKpslf/BBn+T1zT+w
 lkHUOfLDGepHX5sQh3h7k51fuIS7XKf0+Lqxqnz6x6h1blQTpQCmH2AUD8DHz2P9c0zTG24lY7
 OKKr4opKLgrtg3ONK1Ga4uK/lcaVfpFZ0Ubp72uLQFhUaleFVdQqqwAUVNTqOq2696Ubdv+AFA
 5kkiHAQAA
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790336726; l=5701;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=+M+i0Q3HQN/+aw6oPzUhTeqV1kAS1si2zWtei3F8PUQ=;
 b=/tNV7Qr3RxkuJubvJ8Czrq/N4ZFjU1RvotplIrGhg52Wm38pRXIP0gwSdgZEYbISmikhEGFqZ
 nwuyrsu/vRxDnMrW1d5G3N9s6rVliFdWSw/S2cO6dLfwfxb/eJOhO21
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

This series adds support for the Rockchip JPEG decoder hardware. The JPEG decoder
is an in-house IP which is integrated into various Rockchip SoCs. The driver is
tested on a RK3588 board but reportedly works on RK3568 as well.

An earlier version of this driver was posted as part of the Hantro
driver [1]. That turned out to be the wrong abstraction, so it was split
up into a series with the Hantro fixes [2] and this series with a
standalone driver, which started over at v1.

[1] https://lore.kernel.org/r/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de
[2] https://lore.kernel.org/r/20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v5:
- Keep the device until both the binding and the last file handle are
  gone, devres freed it under an open file
- Let a job still running in rkjpegd_remove() finish and start no more,
  close() waited forever
- Reset the block after a job that ended in error
- Reset the block after a frame that left SOFT_RST_RDY clear
- Skip trailing padding of any length when looking for the EOI, 63 bytes
  of padding hid the marker, and search only the entropy coded data
- Annotate the DMA side buffer as little-endian
- Return -EINVAL from enum_framesizes() for an unsupported format
- Drop most of the in-function comments
- Drop the review note on rkjpegd_remove(), the code is fixed instead
- Bound the Huffman value copy by the table length parsed at queue time
- Fall back to the standard Huffman tables for frames without a DHT
- Resume decoding on V4L2_DEC_CMD_START after a drain or resolution change
- Do not re-arm a drain that already completed
- Report no resolution change for a corrupt frame past the first one
- Send no EOS event for the LAST buffer of a resolution change
- Correct the IRQ clear and Huffman table set comments
- Keep a resolution change out of the mem2mem drain state, a STOP sent
  before the capture queue was restarted ended the stream at once
- Look for a mid-stream resolution change only in device_run(), buf_queue()
  raced the interrupt handler for the capture buffer
- Set the field on every capture buffer and the sequence on every LAST
  buffer the driver returns itself
- Report the first resolution after CREATE_BUFS on the OUTPUT queue too
- Report the capture colorimetry from the OUTPUT format rather than echoing
  what userspace passed, and stop S_FMT(CAPTURE) changing the OUTPUT format
- Refuse RGB coded frames, Adobe APP14 transform 0, instead of decoding them
  as YCbCr
- Drop the 4:4:0 mode, the JPEG parser never lets such a frame through
- Depend on V4L_MEM2MEM_DRIVERS
- Correct the downstream clock rate in the rk356x DT commit message
- Serialise V4L2_DEC_CMD_STOP/START with the job completion, a drain
  racing the last job's interrupt never finished
- Forget a drain that STREAMOFF(CAPTURE) aborted, a later resolution
  change re-armed it
- Bracket CPU reads of imported coded buffers with
  dma_buf_begin_cpu_access()
- Wait for a running job when probe fails after registering the video
  device
- Add an SPDX line to the Makefile
- Link to v4: https://lore.kernel.org/r/20260918-rockchip-jpegdec-v4-0-0dd97df47abb@pengutronix.de

Changes in v4:
- Set and read the source change flags under fmt_lock
- Check the runtime PM state in the interrupt handler
- Use dma-buf CPU access around the grayscale chroma fill
- Update the review notes in the driver patch
- Link to v3: https://lore.kernel.org/r/20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de

Changes in v3:
- Rename binding to rockchip,rk3568-jpegd.yaml to match the compatible
- Link the earlier Hantro based series in the cover letter
- Enable clocks from the runtime PM callbacks, use pm_ptr()
- Protect capture format and crop with a mutex
- Clear bytesused on capture buffers returned without a picture
- Revert padding the capture buffer to the MCU width, it broke 4:1:1
- Add notes on review questions to the driver patch
- Link to v2: https://lore.kernel.org/r/20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de

Changes in v2:
- rename clocks from aclk/hclk to axi/ahb
- Add missing Signed-off-by
- Fix suspend/resume path
- Pad the capture buffer to the mode's MCU width, not to a macroblock
- Reject a frame header picture size outside the supported range
- Set the capture payload at decode time, not at queue time
- Trim comments in the driver
- Link to v1: https://lore.kernel.org/r/20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de

---
Sascha Hauer (4):
      media: dt-bindings: Add Rockchip JPEG decoder
      media: rockchip: Add JPEG decoder driver
      arm64: dts: rockchip: rk3588: Add JPEG decoder node
      arm64: dts: rockchip: rk356x: Add JPEG decoder node

 .../bindings/media/rockchip,rk3568-jpegd.yaml      |   92 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   22 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   24 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   16 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    4 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  235 ++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2536 ++++++++++++++++++++
 10 files changed, 2940 insertions(+)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

