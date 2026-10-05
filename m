Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAB3CB56D;
	Mon,  5 Oct 2026 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193584; cv=pass; b=EEnt1juNGxyVcbPHJZnuyd1RXMM0pYOptAq72Kp6skC8XiEJ2uIMK1VnycJLNT02w3bITcYXgV7BrVLVPWtNH0sZJSCibdgwYIhcSDYQY9AJVBhnKVRdLtkQpgEp4X73iTbH8I1pzwk5oti+pLJsPRo91fbQczTiSAHiX2XRhIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193584; c=relaxed/simple;
	bh=5eAoPsFPAnNlos9wFY2FCjA1OGwXVzc91IV8+q+hYo0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IwsseUOb1pO5QIhQ60wCGCd22CtpdEzOtPHnDcEZ9FAOm/p2kmHerdUpbBZ0iPo54OIxeOM/PxvqHPNygCk6t8geshxNrKpEU80X40f3K47MYjCndlDmTELk34+myTXhd0CA1mFg+84Mra2tOS4i/s1MDWqbEQLd3NVRHekMN4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=IVFWQaAB; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="IVFWQaAB"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E704A2012A4;
	Mon, 05 Oct 2026 11:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2afNNZCZFtJGv8CYuwviOxa4nzz3Kuckgh1Dr8/RU+Y=;
	b=IVFWQaABH1SaDt9J45wRij6cKFoHNlKSSARORgnETtJnYeo8gnp5ynUWAHawen4KW/M9kD
	waMwvDcl0X3tJ+uhztXWNtoqfOIYFf9T1ZCcyJPcZH7c8cE0Mf0qwQ3DwjZltzU+SGy/vf
	cPA2xl1oW6/hGxFknLd3gDFie+Fq5ojUqbooOKBn6u2RNDoSiWpsWzVJSJNW2FqIzdlGt5
	BcCoDLhrtBaa/fscbPhtlXbyIE6ZJgk7shEy1VrU76xsM0PoQ4bGdEegIYLnIWVIGaIzvG
	Bs99+R5rAqTkBT3HxIt0bQ9wc97z+Oz9U+Iuje71PREsiWRu7AUhSS1VmbG7SA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791193573; a=rsa-sha256;
	cv=none;
	b=UXTOm1dlFK8cqU9k2HUiswjOwNYXUkZPaS0sjSoOvdl2BKPpJOz29uC0jTIyFsEOdC1CsD
	sRJIIsvikrJ8h6ysjPOwS//WJ2MF517dPxQ4RkqmluusbH6fmlKCYv/plwQ8UDKl6mjG4d
	SLqxu6vaKIk54u4fU0DyDrmGZpreTTdHhjq2EkVhrb7Et8PY3lwRgCTSkha9yIL8Ud0WbC
	PFJ30o8LScN/btjI5Xqfc6EHNJqSXpYbQuRQLnkBFydTjaR52Zki33VJ0DiSij+oXoUVbb
	6ZFIPGN1Q7AwLIF3jA8hAizlkmgBwdycN1V7UdZOxPnn14XSQNSwjU4FFa3d8g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2afNNZCZFtJGv8CYuwviOxa4nzz3Kuckgh1Dr8/RU+Y=;
	b=HI/Li2wANPodSJDIXfGwU5UvyGpvY7wtvMW46O2Sx3WL4Lv+ieN83DNCXozB3crc5i8squ
	PcgkjIYlh2+vCY+OqebOrZU2Uy5l0OSWe5ZkzMuS3wL84I+eQOydzxYjQLJogIaN66Xs8a
	EwRRWDYuARCuitYQ4gUvViDZg8NoPVN+mhfH2lWO2kcGi8+ltaa1LABg06NolJP8dzEHXY
	8HdJ3xMUNGrHTTRstLkWodLLZi1SxvFxeVmmhZKSAZqDBdGDJqxNfvJvPoNnmL2Tkv0myt
	PdzPLG2CnK9AQp7RH9syMk3U1a/VtBf+btQSV2cvIwainOpEqeV9QdpJQofqbg==
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v6 0/4] media: rockchip: Add JPEG decoder driver
Date: Mon, 05 Oct 2026 11:46:07 +0200
Message-Id: <20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9xw2oC/23P3WrDMAwF4Fcpvp6HLMeK0qu9R+lF4p/EGyTB6
 UJHybvPKYwF6ssj0Kejh1h8in4R59NDJL/GJU5jDvR2EnZox97L6HIWCEjAqGSa7Jcd4iw/Z98
 7byU4YgYbyJAVeW1OPsT7k7xccx7icpvSz/PCqvbpH1a9YquSIBmUYsQuGICP2Y/99y1NY7y/O
 y92ccWjYgoK7gq1gU3TaiQqKvpfaVSpi86KNqytrsmBw6JSHRUuKFVWwLmmdqGq264rKuagFD8
 yexcgw6y17YhflG3bfgGE4YNazQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791193572; l=7190;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=5eAoPsFPAnNlos9wFY2FCjA1OGwXVzc91IV8+q+hYo0=;
 b=OuxKbb2x4yc5tOn7V/0GD6XgzMdRiAEKXCpYNYkqdtE5J6JKAVPofTyXsl4qlzbjYzb34EKb1
 r/Zrhcxt5YaD+5nP05z+hq6QZ74mhtkWCD7tpEN8lnCo9EWcvUIc69P
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
Changes in v6:
- Rework dynamic resolution change: a changed frame is marked when it
  is queued, the decoder stops in front of it, and only the ioctls that
  resume change the capture format, so fmt_lock is gone
- Keep a drain going across the capture restart of a resolution change
- Decode grayscale frames to GREY instead of filling the NV12 chroma
  plane from the CPU, and allocate capture buffers without a kernel
  mapping
- Leave cache maintenance of coded buffers to videobuf2, drop the
  dma-buf CPU access calls
- Drop the EOI scan, a truncated frame fails through BUF_EMPTY, and log
  all hardware errors
- Drop the runtime PM check in the interrupt handler
- Drop the interrupt masking around the watchdog reset
- Drop the hard reset fallback
- Drop the media device
- Drop the EOS event on STREAMOFF(OUTPUT)
- Allow up to 65535 pixels per side, limited by the size of the decoded
  frame instead of 16384 per side
- Report sRGB colorimetry on the capture queue, keep what is set on the
  coded queue and default it to V4L2_COLORSPACE_JPEG
- Return a failed frame with its full payload, GStreamer takes an empty
  capture buffer for the end of the stream
- Return errors from the header parse instead of setting a flag
- Use guard() and __free(), drop NULL checks the core rules out
- Name the VDPU720 in the Kconfig help
- Use Assisted-by: LLM
- Link to v5: https://lore.kernel.org/r/20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de

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
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  235 +++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2217 ++++++++++++++++++++
 10 files changed, 2621 insertions(+)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

