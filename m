Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792667209;
	b=m31w4218897YI/fURNQ3eHZ7S31P9YXm+8zfoD9jWoKwLurqwEzETFHZ5Tz25/Fo20le
	 6FemAt/DTMQrF2IMdo29i2VCF+XiBIU3ciXe4wcbzI8RmuCZFEfnSc18pacVmqczIabJJ
	 hocShsLH9n0hyb6eDCvYpKdGn62qdKNNDDeuEsgcMRfY8a8NkNL5xk31klXkxBk3PGrYv
	 XnsU5u4CoLk2AqnBlQkpC9rx6t3BlSvEY0dV44MEUdcv8rz+QR9cQOuwryhO5Fnd/U1kP
	 X2263m3SeKVd6iRqcMq5Z0FZw+54ex390fqab9TL400iy9wIYneLj2CfYGj2f1cgHlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667209;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nLtJggHjwKr/mPClxH5B2q+y4l0tBKI1aAwBEPu1z4Q=;
	b=sVynjkyVnAjUTE65t5UYOntEJhLQk6A9vcVB2nQzxvLPcp68pnwcUrkxbvX+4GzYMXYN
	 SOeI89/O85+cfLL1JXtlTSNER9XYW8eL0qtOxRhWn068BsYxq5n2O1bih3qfZNNbd8ny6
	 vHGT9DEQe1cOOEyp+qr+rGJNqkXU5Yz467FpsePvLFgHqbZTeJe7USd5hVEFkAcnX+nfr
	 EJbSGtfyP1aw/z2Z2RPhiXci15vsiqRMy2uCeKE8sBPi0FQAF9N2yIU3TnS0woJQp/4mv
	 zGplOCxZMW9MGaZIEyzVeUKjy3U+WhJotSaDweHJdIc+J9KO32sRWa66OYJ88vtZVYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BrVIN98L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379E4606A319;
	Thu, 22 Oct 2026 11:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379E4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BrVIN98L
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3E4AE200F60;
	Thu, 22 Oct 2026 13:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nLtJggHjwKr/mPClxH5B2q+y4l0tBKI1aAwBEPu1z4Q=;
	b=BrVIN98LiKLkF0BmJenoImtpSHA8ZDBX1R1vuxHS9RlWlTZeRdzfv+loO1REZCk9egcka8
	8yMajaZOZOIoAjAwB/A5Jq6wREJ4k7jt0lXs5aBVgcTgTkuwO6o07QqCh6YN4yUsP+UnA1
	h91Mg2/0UtkDF5xB/9M4numN3IpWp0gN1OJy+6o+NtO+/BDv5+uzCjXtexmLk5S/hMkzb6
	xxgvlqFWBXlK1yjQRCQ7kBWnh6b8tNNbRCfGm7fH6vpiMtsWvfBXtBETWrNOt/gcjCfkvC
	+QiMxNNVp6utj0G/1bzd08ZTNxHKFz6NXj8G8cJw3qE6eHXWFFBSYs6j1p5ZhQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792667206; a=rsa-sha256;
	cv=none;
	b=WLnCIskXntgt7MM3Fu+DfljQkLOkePp0q/zGTepAbiLpTqIAg2gUJJltxc3bZe5iH1bSQb
	WeLQlRGhd/NFYRRPYUUcdIS4p7U4cqLE8sOa3+IIuM/OR1SDAm60yluT+tC+T+Abs30kID
	QaRkIboXDpd/qV5zQBIGGAcnyEEB0MwZoJEuimjo7FgQqv29FsatD6LZ2EwcvdI7WnNM4K
	Uolbyp8FQUiXA+0BbM6uI8rzo3umcHjeTYv+LfipcTqHgcY5ujm8EVv9ReEq+9DqHUSZ2N
	93Fq8vRs6yfLz2r6UERmj+nYtmEx6yrcSYwWMEFxrH3BdsVBlIiXczoBvOjlEw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nLtJggHjwKr/mPClxH5B2q+y4l0tBKI1aAwBEPu1z4Q=;
	b=QvanH7X790skkqgIDTfHNAnUJQ3bz8j3oqpqSCC6o41/twvKij194rCO8rh65hAbr970Jr
	GJSsiKuGuoexE3CwHEOvmlCmN6IbuZZ4Tb4VQZUqTfLiOfG10qc9nJ/JjjB+yDipLj/w0o
	IkJgQmqfK1DFvmRnR1szMy9gKUifeC+2t7IcRi4eovahppfFLiVZtj+DVm24PI3gt1qUyc
	Jvxhbybll6MtyP1xUekdPeRwdMbBokh1YDMX/P9C8WGvY6Y5NX5RqhjwJYiQRHCa1RN2fP
	fa/X1tMSr+doZBoNKSiQVhBDQ9fy/sJPPSNBtV35JwDlrIshY0RSW1f96VeHQQ==
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v7 0/4] media: rockchip: Add JPEG decoder driver
Date: Thu, 22 Oct 2026 13:06:38 +0200
Message-Id: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAD7u2WoC/23PTWrDMBAF4KsErasykqzRuKveo2Qh68dWC7aRU
 5MQfPfKgbaGaPkG5ps3d7aEnMLC3k53lsOaljSNJZiXE3ODHfvAky+ZSZAIJAXPk/tyQ5r55xx
 6HxwHj0TgImp0rKzNOcR0fZAf55KHtFymfHtcWMU+/cWaZ2wVHDiBECRlFzXA+xzG/vuSpzFdX
 31gu7jKo6IritwVtJF0a5VErCrqX2lFrYsqitKknDLowcuq0hwVqihNUcD71vjYGNt1VUUflOp
 Heu8CqImUch1SVcE/RQDUFCyK1FGgD1Zga56Ubdt+ANU8s/sTAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792667206; l=7833;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=L91hPT583OPz6DWQPKsX8MejItDBU7qiDAjLvJWNM94=;
 b=Q06PmETufGH9AdxvXPEXuZrzkGTwJSu2oy6OiL4eP1L0a/Ll2xmqls4awvNXVkeZ3zdYhmifj
 mQVqMlmoea9CPnb5ukZQLmAhyw+f9hGzOAMaTjzi5/Et6BZ0InHxk3r
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

An LLM (Claude) was used throughout the development of this series:
for parts of the driver code, for reviewing it and working through
review comments, and for debugging on the hardware and with
GStreamer.  I have reviewed and tested all of it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v7:
- Don't set a capture payload larger than the buffer when a job fails
  because the buffer is too small (sashiko)
- Drop the Assisted-by tags, upstream removed them in favour of a
  note in the cover letter
- Drop the review questions and answers from the driver patch
- Link to v6: https://lore.kernel.org/r/20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de

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
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2222 ++++++++++++++++++++
 10 files changed, 2626 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

