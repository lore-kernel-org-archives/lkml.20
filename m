Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEE146D0AF;
	Fri, 25 Sep 2026 11:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336739; cv=pass; b=YkYf09nr/iqoNk5a7PVd5J6ibLK6PWdGWXQUGOFxTSh4WRActAtHJQKmE3Pq/BSMMVSkHWLimXte1dW/0brSRZG0dwfAeSpzGZwXNnPFMDlcrBk4uM9m4FQSottag5Z9rhUbyt1fTjZYEO+CG1Lp0mkS3WEEMkydbIL7mcM240g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336739; c=relaxed/simple;
	bh=oTW8m3rdxS+Umc3FGpMK4NMIfKTqOYU3OHdOpzB93IY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqkE1hDChTUfj1IfSS0rHs+XyhVFHZlQVzcRwk+6oFo0JEkM5Kd91mT8rW5VB5SEn1aWe2mrI7TUbIeW8BqqNxtZi6k0FIbzIfki0PY7F94aTD1zd0xZ/VYOQv9AF8kHEEYqLV1V6Rv2/cpnGU5ZYaSDQbpRon2D7PMlohUIEII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=TkcaVFvS; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="TkcaVFvS"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4CE25201E6D;
	Fri, 25 Sep 2026 13:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FsQa/KUkLvHT4Kye35asTx+05ot6DA2lkwSKHXZT+mY=;
	b=TkcaVFvSV/yJMynXYvzcGWK1PlwHlcb36OUCa0VPadz0AJLARmwKW5Gu0F/gB3CU/7Hpk1
	APkDnCZkOnp9QVjCvk6341U0Qs7DOwtk9qXCd5RWK3ZuZk/3/7QbupJKloDJlHXfZhEadh
	eQR5tOhQM4AsyYPh7Z/HV6yNTI6pOR/cYdk2SLno/ERKz/EUZ/JmRb1AqchNv4kn7+u2U4
	lsPUuYm2EVNFTqIyzNCtuTolJFt7thAQbiW6sylbAuTSCUugKtBLeIIc7iJa0JD+7BCYF/
	LUo9luwnDAvcKC4AON/F5Q3PGDxSVND0ZvCbu2xJ4awE1JeI6mAMAlThN8hvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FsQa/KUkLvHT4Kye35asTx+05ot6DA2lkwSKHXZT+mY=;
	b=MftuI3eHVgSuzIV0K+lthXaRtS2/Vca/NAjelVJ8IgYMrAe2FvzIMwqAlDWq5QW6sGz+A2
	a46DYlVI+Ae/7YWC8PD+hv8EsXX29D20U4K0Ikb5PZW22I61/RtpbzcZyXENWuz4p2k+m7
	COYqy1QKTFi5bXcS/kwzVvTzFV/zOH/KWIe8h1vFgv5N1BAapbstRH2upfdOVPDqqOLlUz
	DtzzQ9qwZZsi4TMIWNe8oU5JxhA+Lp/X3q5bfcbS/0o5Lb9MsE9W4CMhZvbcL7t74izzs0
	p1eOqA5n+u7zKNcYh8RuQ0/x/VsBBFaRB0DsCeTyMyJ3z0IHH3vLstZyXRYBZA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790336726; a=rsa-sha256;
	cv=none;
	b=eFpqstE5UbxPt1XMke0FNXb+uRY/XF/d4C1cVbZOAkJhQrVhz2jR5+v6w+D4U+pUUuccO7
	fmHbUysjo8EMrfq+Ng+8cDGYcPmM/WEo/0X4v57b5sePuZcRJoEcm5RiWMUdTJ6wMIPrJp
	+zk4cCJkgRhKwbQvyaOyyu7H7y83fzElWxOOcctJwJ/S8TvWqf6P2PRku++nKcXFx469Ka
	xzbWrvlbZ8PrLa9VzEwz8ihX34Cyb13SHhbeVKfmH01aXHJZsFQUdXZMZXZ8mos30AjuWg
	9MkZg8DvckZSxVwBzBBaOaQUUmvOgHw/ymkA059X/kLZuA4clVmvfpEnvjxf2w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 Sep 2026 13:45:26 +0200
Subject: [PATCH v5 2/4] media: rockchip: Add JPEG decoder driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
In-Reply-To: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790336726; l=104085;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=oTW8m3rdxS+Umc3FGpMK4NMIfKTqOYU3OHdOpzB93IY=;
 b=ZM02CM3leND51xjcTFgVJjpyGEX9dJPnoIqV2Zbl0LFWbEAyVNiTDdyVSMpeHUCvRc34LGKds
 qVqHNw3Hol7CSfQt+SuAimie0wSu2dOHHjD8r2EHAdNlN51G0OYwP78
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add a driver for the JPEG hardware decoder Rockchip integrates into a
number of its SoCs.  Downstream it is known as the VDPU720, which is the
name the register definitions carry here.

Exposes one V4L2 M2M device implementing the stateful decoder interface:
JPEG input -> NV12 output.  The frame header is parsed on the CPU when a
coded buffer is queued, which is where the resolution for
V4L2_EVENT_SOURCE_CHANGE comes from; userspace cannot know the frame size
without parsing the bitstream itself, so it learns it from the event and
sizes its capture buffers accordingly.  V4L2_DEC_CMD_STOP drains and
raises V4L2_EVENT_EOS.

Hardware requirements:
- a DMA side buffer with Q-tables (zigzag->raster), Huffman mincode and
  value tables, rebuilt from the frame header on every run
- a two-phase IRQ clear sequence, which some revisions require.  It is
  done unconditionally, see rkjpegd-vdpu720-regs.h
- 16-byte stream alignment with a start-byte offset
- MCU-aligned PIC_H (e.g. 1080p YUV420 needs 1088, not 1080)
- FILL_DOWN_E on every NV12 conversion, the output chroma is vertically
  subsampled so the hardware completes the bottom of the picture
- DRI (restart interval) support when present
- a neutral chroma plane written by the driver for a grayscale frame.
  The output format converter has no YUV400 path, so the hardware writes
  the luma plane and leaves the chroma alone, which comes out green

Every address register is a single 32 bit one with no high order
companion anywhere in the map, so the DMA masks are capped accordingly.
That is no constraint in practice: the block sits behind the Rockchip
IOMMU, whose address space is 32 bit wide by construction, and memory
above 4GB is reached through it.

A frame that carries no EOI marker is rejected: that is what a coded
buffer too small for the frame looks like, and the hardware would
otherwise hand out a half decoded picture indistinguishable from a good
one.  A frame larger than the negotiated capture format is rejected too,
since its dimensions would be programmed against strides taken from that
format, and so is a capture buffer smaller than that format.

Error recovery tries the in-block soft reset first and falls back to
pulsing the reset lines.  The interrupt handler decodes the error status
registers into a readable diagnostic.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
A few things in here read like bugs and are not.  Collecting the
questions with their answers so they do not have to be asked.

Q: rkjpegd_stop_streaming() returns every queued buffer with
   VB2_BUF_STATE_ERROR and never stops the hardware.  Can a decode still
   be in flight there, and DMA into a capture buffer userspace already
   has back?

A: No.  v4l2_m2m_streamoff() calls v4l2_m2m_cancel_job() before
   vb2_streamoff(), and that waits on m2m_ctx->finished until
   TRANS_RUNNING clears, so the job is over before .stop_streaming is
   entered.  v4l2_m2m_ctx_release() does the same before
   vb2_queue_release(), which covers close().  That ordering is also why
   the WARN_ON(!src) in rkjpegd_job_finish_no_pm() cannot fire against a
   queue VIDIOC_STREAMOFF has just emptied: nothing is running to reach
   it.

   There is no .job_abort, so the wait is bounded only by the
   RKJPEGD_TIMEOUT_MS watchdog and a STREAMOFF on a wedged frame blocks
   for up to two seconds.  rkvdec and hantro leave job_abort out as
   well; the block cannot be asked to stop by anything short of the
   reset the watchdog already does.

Q: rkjpegd_s_fmt_vid_out() overwrites ctx->dst_fmt without looking at
   whether the capture queue already has buffers.  Can an application
   allocate small capture buffers, then set a large coded format, and
   have the hardware write past the end of them?

A: No.  The reset itself is required: dev-decoder.rst has VIDIOC_S_FMT
   on the coded queue invalidate the raw format, and a source change
   moves it again.  What keeps a job inside its buffer is a check when
   the job starts.

   rkjpegd_buf_prepare() rejecting a capture buffer smaller than
   dst_fmt.sizeimage is not enough on its own.  videobuf2 prepares a
   buffer when it is queued, not when streaming starts, so one queued
   before VIDIOC_STREAMON keeps the size it was checked against.
   rkjpegd_start_streaming() clears ctx->source_change, and nothing makes
   the application build the capture queue again after the change was
   reported.

   rkjpegd_vdpu720_run() therefore compares the buffer against dst_fmt
   again and fails the frame if it is too small, and vdpu720_fill_regs()
   keeps the frame within dst_fmt.  Both the decoder's DMA and the CPU
   write of the neutral chroma plane for a grayscale frame are sized from
   dst_fmt, so the one check covers both.

Q: vdpu720_fill_regs() compares the raw header width against the buffer
   width, but a 4:1:1 MCU is 32 pixels wide.  Should the check be against
   ALIGN(jpeg_width, mcu_width), and should the capture buffer be padded
   out to the MCU width rather than to a macroblock, so that the last MCU
   column has somewhere to land?

A: No to both, and this was tried.  The decoder does not write out to the
   MCU boundary: it lays each row down at the picture width, at a pitch of
   the picture width, whatever Y_HOR_STRIDE is set to.  Padding the buffer
   to 736 for a 720 wide 4:1:1 frame therefore does not give it more room,
   it moves the buffer out from under the frame, and every row after the
   first is read at the wrong offset.

   On hardware that shows up as a 720x480 4:1:1 frame decoding to a buffer
   whose visible bytes are all wrong in both planes, with the columns past
   the picture reading 0x80 - the packed frame being walked at the padded
   stride, which runs the last luma rows into the chroma plane of the
   packed layout.  The other four modes are unaffected because 8 and 16
   divide the macroblock the buffer is already aligned to, so only 4:1:1
   can have the two widths disagree.

   The two changes are also coupled, which is worth knowing before trying
   half of it: with the MCU aligned check and a macroblock aligned buffer,
   a 4:1:1 frame at 720 computes 736 > 720 and is refused outright.

Q: vdpu720_fill_chroma() memsets into a capture buffer that is already
   queued for DMA.  Does the write survive the cache maintenance
   videobuf2 does when the buffer completes?

A: Yes, because there is none.  vb2_dc_prepare() and vb2_dc_finish()
   both return early unless buf->non_coherent_mem, which comes either
   from q->non_coherent_mem, gated on the q->allow_cache_hints this
   driver never sets, or from the USERPTR path, which is not offered:
   io_modes is VB2_MMAP | VB2_DMABUF.  MMAP buffers are coherent
   allocations and imported dmabufs get no sync from videobuf2 at all,
   so nothing invalidates the write.  It also happens before
   VDPU720_DEC_E is written, so the hardware has not started yet.

   For an imported dmabuf the write is still bracketed by
   dma_buf_begin_cpu_access() and dma_buf_end_cpu_access(), so an
   exporter with bounce buffers or caches of its own sees it.

Q: ctx->fmt_lock is a second lock next to vdev_lock, which already
   serialises the ioctls.  Why not just hold vdev_lock over the source
   change instead?

A: Because the job path cannot take it.  rkjpegd_device_run() is reached
   straight from VIDIOC_QBUF, through v4l2_m2m_try_schedule() and
   v4l2_m2m_try_run(), with __video_do_ioctl() already holding vdev_lock,
   so taking it there deadlocks on the first job.  Deferring the job to a
   work item that takes vdev_lock trades that for a worse one:
   VIDIOC_STREAMOFF holds vdev_lock across v4l2_m2m_cancel_job(), which
   waits for the running job, and the job could then only finish by
   taking the lock STREAMOFF is holding.

   amphion solves the same problem from the other side, with
   vpu_inst_lock(): it leaves vdev->lock unset and takes its instance
   mutex by hand in every ioctl.  Keeping vdev_lock for the ioctls and
   adding a second lock for the format and the source change flags is
   the smaller change here.

Q: drain_lock is a spinlock next to vdev_lock and fmt_lock.  Why a
   third lock?

A: The mem2mem drain state (is_draining, last_src_buf, has_stopped) is
   set by V4L2_DEC_CMD_STOP and START under vdev_lock, but read and
   cleared when a job completes, which happens in the interrupt handler
   or the watchdog without vdev_lock.  Unserialised, a STOP can pick the
   running job's source buffer as last_src_buf after the interrupt has
   already returned it without the LAST flag, and the drain then waits
   for a buffer that is gone.  The completion runs in hardirq context,
   so this has to be a spinlock; fmt_lock is a mutex.  imx-jpeg
   serialises the same pair, see commit df71c6e4d5e5 ("media: imx-jpeg:
   Lock on ioctl encoder/decoder stop cmd").
---
 MAINTAINERS                                        |    1 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   16 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    4 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  235 ++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2536 ++++++++++++++++++++
 7 files changed, 2794 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 290c3a1452ea0..a312e3c0d5e15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23706,6 +23706,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
+F:	drivers/media/platform/rockchip/rkjpegd/
 
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
index ba401d32f01ba..53d28eb89e472 100644
--- a/drivers/media/platform/rockchip/Kconfig
+++ b/drivers/media/platform/rockchip/Kconfig
@@ -5,4 +5,5 @@ comment "Rockchip media platform drivers"
 source "drivers/media/platform/rockchip/rga/Kconfig"
 source "drivers/media/platform/rockchip/rkcif/Kconfig"
 source "drivers/media/platform/rockchip/rkisp1/Kconfig"
+source "drivers/media/platform/rockchip/rkjpegd/Kconfig"
 source "drivers/media/platform/rockchip/rkvdec/Kconfig"
diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
index 0e0b2cbbd4bd2..c256c51ced269 100644
--- a/drivers/media/platform/rockchip/Makefile
+++ b/drivers/media/platform/rockchip/Makefile
@@ -2,4 +2,5 @@
 obj-y += rga/
 obj-y += rkcif/
 obj-y += rkisp1/
+obj-y += rkjpegd/
 obj-y += rkvdec/
diff --git a/drivers/media/platform/rockchip/rkjpegd/Kconfig b/drivers/media/platform/rockchip/rkjpegd/Kconfig
new file mode 100644
index 0000000000000..4c814ea58d2f4
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkjpegd/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_ROCKCHIP_JPEGD
+	tristate "Rockchip JPEG decoder driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on VIDEO_DEV
+	depends on PM
+	select MEDIA_CONTROLLER
+	select V4L2_JPEG_HELPER
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Support for the JPEG decoder Rockchip integrates into a number of
+	  its SoCs, decoding JPEG and MJPEG frames to NV12.
+	  To compile this driver as a module, choose M here: the module
+	  will be called rockchip-jpegd.
diff --git a/drivers/media/platform/rockchip/rkjpegd/Makefile b/drivers/media/platform/rockchip/rkjpegd/Makefile
new file mode 100644
index 0000000000000..0acf2e6ac6785
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkjpegd/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_ROCKCHIP_JPEGD) += rockchip-jpegd.o
+
+rockchip-jpegd-y += rkjpegd.o
diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs.h b/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs.h
new file mode 100644
index 0000000000000..eca01174804d6
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs.h
@@ -0,0 +1,235 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip VPU720 JPEG decoder register definitions
+ *
+ * Derived from downstream Rockchip MPP HAL (hal_jpegd_rkv_reg.h).
+ * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2026 WolfVision GmbH
+ */
+#ifndef RKJPEGD_VDPU720_REGS_H_
+#define RKJPEGD_VDPU720_REGS_H_
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/align.h>
+#include <linux/types.h>
+
+#define VDPU720_REG_VERSION		0x000
+#define VDPU720_PROD_NUM		GENMASK(31, 16)
+#define VDPU720_BIT_DEPTH		BIT(8)
+
+#define VDPU720_REG_INT			0x004
+#define VDPU720_DEC_E			BIT(0)
+#define VDPU720_IRQ_DIS			BIT(1)
+#define VDPU720_TIMEOUT_E		BIT(2)
+#define VDPU720_BUF_EMPTY_E		BIT(3)
+#define VDPU720_BUF_EMPTY_RELOAD	BIT(4)
+#define VDPU720_SOFT_RST_EN		BIT(5)
+#define VDPU720_IRQ_RAW			BIT(6)
+#define VDPU720_WAIT_RESET_E		BIT(7)
+#define VDPU720_IRQ			BIT(8)
+#define VDPU720_DEC_RDY			BIT(9)
+#define VDPU720_BUS_ERR			BIT(10)
+#define VDPU720_DEC_ERR			BIT(11)
+#define VDPU720_TIMEOUT			BIT(12)
+#define VDPU720_BUF_EMPTY		BIT(13)
+#define VDPU720_SOFT_RST_RDY		BIT(14)
+
+/* Error status bits used to decide whether a hardware reset is needed */
+#define VDPU720_ERR_MASK		(VDPU720_BUS_ERR | VDPU720_DEC_ERR | \
+					 VDPU720_TIMEOUT | VDPU720_BUF_EMPTY)
+
+/*
+ * VPU720 IRQ clear mask.
+ *
+ * Some revisions require a two-step IRQ acknowledgment before checking
+ * VDPU720_IRQ_RAW: write the status back with only the enable and control
+ * bits kept, then write 0 to fully clear.  The downstream BSP computes the
+ * first value as
+ *
+ *   clr = (~(0x00fe7f40 & status)) & (0xff0180bf & status)
+ *
+ * The two masks are complements, so that is status & 0xff0180bf: bits 0-5,
+ * 7, 15, 16 and 24-31 are kept, IRQ_RAW and the status bits 8-14 dropped.
+ *
+ * It is applied unconditionally here.  The BSP gates it on the revision in
+ * VDPU720_REG_VERSION matching 0xdb1f0006 exactly, and the RK3588 reports
+ * 0xdb1f0005, so it is not needed on that part.  The extra write is
+ * harmless there and saves a revision check that would need silicon we do
+ * not have to validate.
+ */
+#define VDPU720_IRQ_CLR_KEEP		0xff0180bf
+
+#define VDPU720_REG_SYS			0x008
+#define VDPU720_FORCE_SOFTRST		BIT(17)	/* set when dec_e=0 before soft-reset */
+#define VDPU720_FILL_DOWN_E		BIT(24)	/* fill bottom padding rows */
+#define VDPU720_FILL_RIGHT_E		BIT(25)
+#define VDPU720_OUT_SEQ			BIT(26)	/* 0=raster, 1=tile */
+#define VDPU720_YUV_OUT_FMT		GENMASK(29, 27)
+#define VDPU720_YUV_OUT_FMT_NATIVE	0	/* no format conversion */
+#define VDPU720_YUV_OUT_FMT_NV12	3	/* output as NV12 */
+
+#define VDPU720_REG_PIC_SIZE		0x00c
+#define VDPU720_PIC_W_M1		GENMASK(15, 0)
+#define VDPU720_PIC_H_M1		GENMASK(31, 16)
+
+#define VDPU720_REG_PIC_FMT		0x010
+#define VDPU720_JPEG_MODE		GENMASK(2, 0)
+#define VDPU720_JPEG_MODE_YUV400	0
+#define VDPU720_JPEG_MODE_YUV411	1
+#define VDPU720_JPEG_MODE_YUV420	2
+#define VDPU720_JPEG_MODE_YUV422	3
+#define VDPU720_JPEG_MODE_YUV440	4
+#define VDPU720_JPEG_MODE_YUV444	5
+#define VDPU720_PIX_DEPTH		GENMASK(6, 4)
+#define VDPU720_PIX_DEPTH_8		0
+#define VDPU720_PIX_DEPTH_12		1
+/* qtables_sel: number of Q-table sets (0..3) */
+#define VDPU720_QTBL_SEL		GENMASK(9, 8)
+/* htables_sel: number of H-table sets (0..3) */
+#define VDPU720_HTBL_SEL		GENMASK(13, 12)
+/* dri_e: restart interval enable */
+#define VDPU720_DRI_E			BIT(15)
+/* dri_mcu_num_m1: restart interval MCU count minus 1 */
+#define VDPU720_DRI_MCU_M1		GENMASK(31, 16)
+
+#define VDPU720_REG_HOR_STRIDE		0x014
+#define VDPU720_Y_HOR_STRIDE		GENMASK(15, 0)
+#define VDPU720_UV_HOR_STRIDE		GENMASK(31, 16)
+
+#define VDPU720_REG_Y_VSTRIDE		0x018
+#define VDPU720_Y_VSTRIDE		GENMASK(31, 4)
+
+#define VDPU720_REG_TBL_LEN		0x01c
+#define VDPU720_QTBL_LEN		GENMASK(4, 0)
+#define VDPU720_HTBL_MINCODE_LEN	GENMASK(12, 8)
+#define VDPU720_HTBL_VALUE_LEN		GENMASK(21, 16)
+/* bit 16 of the Y horizontal stride, low 16 bits live in REG5 */
+#define VDPU720_Y_HOR_STRIDE_H		BIT(24)
+
+#define VDPU720_REG_STRM_LEN		0x020
+#define VDPU720_STRM_START_BYTE		GENMASK(3, 0)
+#define VDPU720_STRM_LEN		GENMASK(31, 4)
+
+#define VDPU720_REG_QTBL_BASE		0x024	/* Q-table side buffer,   64-byte aligned */
+#define VDPU720_REG_HTBL_MINCODE	0x028	/* H-mincode table,       64-byte aligned */
+#define VDPU720_REG_HTBL_VALUE		0x02c	/* H-value table,         64-byte aligned */
+#define VDPU720_REG_STRM_BASE		0x030	/* JPEG entropy stream,   16-byte aligned */
+#define VDPU720_REG_OUT_BASE		0x034	/* NV12 output buffer,    64-byte aligned */
+
+#define VDPU720_REG_STRM_ERR		0x038
+#define VDPU720_ERROR_PRC_MODE		BIT(0)
+#define VDPU720_STRM_FFFF_ERR_MODE	GENMASK(6, 5)
+#define VDPU720_STRM_OTHER_MODE		GENMASK(8, 7)
+/* Recommended default: accept errors, skip 0xFFFF, skip unknown markers */
+#define VDPU720_STRM_ERR_DFLT		(VDPU720_ERROR_PRC_MODE | \
+					 FIELD_PREP_CONST(VDPU720_STRM_FFFF_ERR_MODE, 2) | \
+					 FIELD_PREP_CONST(VDPU720_STRM_OTHER_MODE, 2))
+
+#define VDPU720_REG_CLK_GATE		0x040
+#define VDPU720_CLK_GATE_ALL		0xff
+
+#define VDPU720_REG_PERF_CTRL		0x078
+#define VDPU720_PERF_WORK_E		BIT(0)
+#define VDPU720_PERF_CLR_E		BIT(1)
+#define VDPU720_PERF_CNT_TYPE		BIT(3)
+#define VDPU720_PERF_RD_LAT_ID		GENMASK(7, 4)
+
+#define VDPU720_REG_AXI_CFG		0x07c
+#define VDPU720_ADDR_ALIGN_TYPE		GENMASK(1, 0)
+#define VDPU720_AR_CNT_ID_TYPE		BIT(2)	/* 1 = count sw_ar_count_id only */
+#define VDPU720_AW_CNT_ID_TYPE		BIT(3)	/* 1 = count sw_aw_count_id only */
+#define VDPU720_AR_COUNT_ID		GENMASK(7, 4)
+#define VDPU720_AW_COUNT_ID		GENMASK(11, 8)
+#define VDPU720_RD_TOTAL_BYTES_MODE	BIT(12)	/* 1 = count sw_ar_count_id bytes only */
+
+#define VDPU720_REG_DBG_MCU_POS		0x080
+#define VDPU720_DBG_MCU_POS_X		GENMASK(15, 0)	/* column in MCU units */
+#define VDPU720_DBG_MCU_POS_Y		GENMASK(31, 16)	/* row in MCU units */
+
+#define VDPU720_REG_DBG_ERROR		0x084
+#define VDPU720_DERR_DRI_SEQ		BIT(0)	/* DRI not at expected sequence */
+#define VDPU720_DERR_STREAM_R0		BIT(1)	/* special marker 0 detected */
+#define VDPU720_DERR_STREAM_R1		BIT(2)	/* special marker 1 detected */
+#define VDPU720_DERR_STREAM_FFFF	BIT(3)	/* 0xFFFF sequence in stream */
+#define VDPU720_DERR_OTHER_MARK		BIT(4)	/* unknown JPEG marker */
+#define VDPU720_DERR_MCU_CNT_L		BIT(8)	/* restart mark arrived too early */
+#define VDPU720_DERR_MCU_CNT_M		BIT(9)	/* restart mark arrived too late */
+#define VDPU720_DERR_EOI_NO_END		BIT(10)	/* EOI before frame complete */
+#define VDPU720_DERR_END_NO_EOI		BIT(11)	/* frame complete without EOI */
+#define VDPU720_DERR_OVERFLOW		BIT(12)	/* Huffman coefficient overflow */
+#define VDPU720_DERR_HUFF_EMPTY		BIT(13)	/* bitstream empty before EOI */
+#define VDPU720_DERR_FLAGS		GENMASK(13, 0)	/* all of the above */
+#define VDPU720_DERR_FIRST_IDX		GENMASK(19, 16)	/* index of first error */
+
+#define VDPU720_REG_PERF_RD_MAX_LAT	0x088	/* peak read latency (clock cycles) */
+#define VDPU720_REG_PERF_RD_LAT_SAMP	0x08c	/* read transactions above lat threshold */
+#define VDPU720_REG_PERF_RD_LAT_ACC	0x090	/* accumulated read latency sum */
+#define VDPU720_REG_PERF_RD_BYTES	0x094	/* total AXI read bytes this frame */
+#define VDPU720_REG_PERF_WR_BYTES	0x098	/* total AXI write bytes this frame */
+
+#define VDPU720_REG_PERF_CYCLES		0x09c
+
+/*
+ * Side-buffer layout for Q-tables and Huffman tables
+ *
+ * The VPU720 JPEG decoder reads quantisation tables and Huffman
+ * tables from a contiguous DMA buffer with the following layout:
+ *
+ *   [0,         QTBL_SIZE):    Q-table data (u16, raster-scan order)
+ *   [HMINCODE_OFF, +HMIN_SZ):  Huffman mincode table
+ *   [HVALUE_OFF,  +HVAL_SZ):   Huffman value table
+ *
+ * The Q-tables are per component, one entry each
+ */
+#define VDPU720_NB_COMPONENTS		3
+#define VDPU720_QTBL_ENTRIES		64	/* 64 coefficients per table */
+#define VDPU720_QTBL_COMP_SIZE		(VDPU720_QTBL_ENTRIES * sizeof(u16))
+#define VDPU720_QTBL_SIZE		(VDPU720_QTBL_COMP_SIZE * VDPU720_NB_COMPONENTS)
+
+/*
+ * The Huffman tables are not per component and there is no per component
+ * selector register, so the mapping is fixed: the first set is used for the
+ * luma component and the second one for both chroma components.  A grayscale
+ * frame only needs the first.
+ *
+ * HTBL_SEL has a third setting, and the downstream HAL sizes the table
+ * buffer for three sets, but it only ever fills the third with a copy of the
+ * second.  Whether that set is used for the second chroma component is
+ * unknown, so it is not used here.
+ */
+#define VDPU720_NB_HTBL_SETS		2
+
+/*
+ * Per-set mincode layout: 16 DC mincodes + 8 DC accaddr pairs +
+ * 16 AC mincodes + 8 AC accaddr pairs = 48 u16 = 96 bytes
+ */
+#define VDPU720_HMINCODE_SET_SIZE	(48 * sizeof(u16))
+#define VDPU720_HMINCODE_SIZE		(VDPU720_HMINCODE_SET_SIZE * VDPU720_NB_HTBL_SETS)
+#define VDPU720_HMINCODE_OFF		VDPU720_QTBL_SIZE
+
+/* Per-set value layout: 16 DC values + 176 AC values = 192 bytes */
+#define VDPU720_HVALUE_SET_SIZE		192
+#define VDPU720_HVALUE_SIZE		(VDPU720_HVALUE_SET_SIZE * VDPU720_NB_HTBL_SETS)
+#define VDPU720_HVALUE_OFF		(VDPU720_HMINCODE_OFF + \
+					 ALIGN(VDPU720_HMINCODE_SIZE, 64))
+
+#define VDPU720_TABLE_BUF_SIZE		(VDPU720_HVALUE_OFF + VDPU720_HVALUE_SIZE)
+
+/*
+ * The three table length registers count 16 byte units, minus one.  Derive
+ * them from the sizes above so that what is programmed always matches what
+ * the driver writes into the side buffer.
+ */
+#define VDPU720_TBL_LEN_UNIT		16
+#define VDPU720_TBL_LEN(bytes)		((bytes) / VDPU720_TBL_LEN_UNIT - 1)
+
+/*
+ * Huffman value sub-layout per set (192 bytes total):
+ *   bytes [0..15]:   DC code values (up to 12 valid entries)
+ *   bytes [16..191]: AC code values (up to 162 valid entries)
+ */
+#define VDPU720_DC_VALUES_MAX		16
+#define VDPU720_AC_VALUES_MAX		176	/* 12*16 - 16 */
+
+#endif /* RKJPEGD_VDPU720_REGS_H_ */
diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
new file mode 100644
index 0000000000000..e3a6c820ad1ed
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
@@ -0,0 +1,2536 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip JPEG decoder driver
+ *
+ * The register programming is ported from the Rockchip MPP HAL
+ * (hal_jpegd_rkv.c / hal_jpegd_vpu7xx_com.c) and the downstream
+ * mpp_jpgdec.c kernel driver.
+ *
+ * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2026 WolfVision GmbH
+ *   Author: Lucas Sinn <lucas.sinn@wolfvision.net>
+ * Copyright (C) 2026 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
+ */
+
+#include <linux/align.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kref.h>
+#include <linux/log2.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/videodev2.h>
+#include <linux/workqueue.h>
+
+#include <media/media-device.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-jpeg.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "rkjpegd-vdpu720-regs.h"
+
+#define RKJPEGD_NAME "rockchip-jpegd"
+
+/*
+ * The reference manual gives 48x48 to 65536x65536, but a 32 bit sizeimage
+ * wraps well before the top of that range.  Cap at four times 4K in each
+ * direction and hold both the coded format and the bitstream to it.
+ */
+#define RKJPEGD_MIN_WIDTH	48
+#define RKJPEGD_MIN_HEIGHT	48
+#define RKJPEGD_MAX_SIZE	16384
+
+/* The coded queue steps in MCU-sized units, the raw one in macroblocks. */
+#define RKJPEGD_CODED_STEP	8
+#define RKJPEGD_RAW_STEP	16
+
+/* Bytes per pixel used to size a coded buffer for a given resolution. */
+#define RKJPEGD_CODED_MAX_DEPTH	2
+
+/* Milliseconds a frame may take before the watchdog resets the block. */
+#define RKJPEGD_TIMEOUT_MS	2000
+
+static const char * const rkjpegd_clk_names[] = {
+	"axi", "ahb",
+};
+
+#define RKJPEGD_NUM_CLOCKS	ARRAY_SIZE(rkjpegd_clk_names)
+
+/**
+ * struct rkjpegd_aux_buf - auxiliary DMA buffer for hardware tables
+ *
+ * @cpu:	CPU pointer to the buffer.
+ * @dma:	DMA address of the buffer.
+ * @size:	Size of the buffer in bytes.
+ */
+struct rkjpegd_aux_buf {
+	void *cpu;
+	dma_addr_t dma;
+	size_t size;
+};
+
+/**
+ * struct rkjpegd_src_buf - a coded buffer and the header parsed out of it
+ *
+ * @base:		videobuf2 mem2mem buffer, must be first.
+ * @header:		header as returned by v4l2_jpeg_parse_header().
+ * @scan:		storage @header.scan points at.
+ * @quantization_tables: storage @header.quantization_tables points at.
+ * @huffman_tables:	storage @header.huffman_tables points at.
+ * @parsed:		@header describes a frame this hardware can decode.
+ *
+ * The references in @header point into the buffer payload, which stays
+ * mapped for as long as the buffer is queued.  Userspace can still write to
+ * it, so what is read from it when the job runs must stay within the
+ * lengths recorded here.
+ */
+struct rkjpegd_src_buf {
+	struct v4l2_m2m_buffer base;
+	struct v4l2_jpeg_header header;
+	struct v4l2_jpeg_scan_header scan;
+	struct v4l2_jpeg_reference quantization_tables[4];
+	struct v4l2_jpeg_reference huffman_tables[4];
+	bool parsed;
+};
+
+static inline struct rkjpegd_src_buf *
+vb2_to_rkjpegd_src_buf(struct vb2_buffer *vb)
+{
+	return container_of(to_vb2_v4l2_buffer(vb), struct rkjpegd_src_buf,
+			    base.vb);
+}
+
+/**
+ * struct rkjpegd_dev - the decoder device
+ *
+ * @ref:		held by the binding, dropped by devres after every
+ *			other devres resource is released, and by the video
+ *			device, dropped from its release callback.
+ * @v4l2_dev:		V4L2 device.
+ * @mdev:		media device.
+ * @vdev:		video device.
+ * @m2m_dev:		mem2mem device.
+ * @dev:		driver model device.
+ * @clocks:		clocks named by @rkjpegd_clk_names.
+ * @resets:		the block's reset lines, as one array control.
+ * @regs:		register window.
+ * @irq:		the block's interrupt, masked while the watchdog has
+ *			the hardware to itself.
+ * @vdev_lock:		serialises ioctls and the videobuf2 queues.
+ * @drain_lock:		serialises the mem2mem drain state between
+ *			V4L2_DEC_CMD_STOP/START and the completion of a job,
+ *			which runs from the interrupt handler and the
+ *			watchdog without @vdev_lock.
+ * @watchdog_work:	fires when a job does not complete in time.
+ * @needs_reset:	the block ended a job in error or without
+ *			%VDPU720_SOFT_RST_RDY and has to be reset before
+ *			the next one is programmed.  Set from the
+ *			interrupt handler, consumed by rkjpegd_vdpu720_run();
+ *			the reset itself sleeps and cannot be done in either
+ *			the interrupt handler or anywhere else atomic.
+ */
+struct rkjpegd_dev {
+	struct kref ref;
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+	struct video_device vdev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct device *dev;
+	struct clk_bulk_data clocks[RKJPEGD_NUM_CLOCKS];
+	struct reset_control *resets;
+	void __iomem *regs;
+	int irq;
+	struct mutex vdev_lock; /* serialises ioctls */
+	spinlock_t drain_lock; /* serialises the drain state */
+	struct delayed_work watchdog_work;
+	bool needs_reset;
+};
+
+/**
+ * struct rkjpegd_ctx - one open file handle
+ *
+ * @fh:				V4L2 file handle.
+ * @dev:			device this context belongs to.
+ * @src_fmt:			coded format on the output queue.
+ * @dst_fmt:			raw format on the capture queue.
+ * @crop:			visible part of a capture buffer.  The decoder
+ *				writes whole MCUs, so a frame whose height is
+ *				not a multiple of one is padded.
+ * @sequence_cap:		capture buffer sequence counter.
+ * @sequence_out:		output buffer sequence counter.
+ * @source_change:		a resolution change was reported and neither
+ *				a capture queue restart nor
+ *				V4L2_DEC_CMD_START has resumed decoding yet.
+ * @initial_source_change:	the first parsed header must report a change
+ *				even when it matches the negotiated format.
+ * @table_base:			quantisation and Huffman table side buffer,
+ *				rebuilt from the frame header on every run.
+ *				The block reads it little-endian, so its
+ *				multi-byte fields are __le16.
+ * @job_payload:		capture payload of the running job, taken from
+ *				@dst_fmt when it starts so that the interrupt
+ *				handler does not have to take @fmt_lock.
+ * @fmt_lock:			serialises @dst_fmt, @crop, @source_change and
+ *				@initial_source_change.  A source change
+ *				renegotiates them from rkjpegd_device_run(),
+ *				which the mem2mem core runs from its job
+ *				workqueue without @rkjpegd_dev.vdev_lock held,
+ *				so the ioctls cannot rely on that lock alone.
+ */
+struct rkjpegd_ctx {
+	struct v4l2_fh fh;
+	struct rkjpegd_dev *dev;
+	struct v4l2_pix_format_mplane src_fmt;
+	struct v4l2_pix_format_mplane dst_fmt;
+	struct v4l2_rect crop;
+	u32 sequence_cap;
+	u32 sequence_out;
+	bool source_change;
+	bool initial_source_change;
+	struct rkjpegd_aux_buf table_base;
+	u32 job_payload;
+	struct mutex fmt_lock; /* serialises dst_fmt and crop */
+};
+
+static inline struct rkjpegd_ctx *file_to_rkjpegd_ctx(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct rkjpegd_ctx, fh);
+}
+
+static inline void rkjpegd_write_relaxed(struct rkjpegd_dev *jpegd,
+					 u32 val, u32 reg)
+{
+	writel_relaxed(val, jpegd->regs + reg);
+}
+
+static inline void rkjpegd_write(struct rkjpegd_dev *jpegd, u32 val, u32 reg)
+{
+	writel(val, jpegd->regs + reg);
+}
+
+static inline u32 rkjpegd_read(struct rkjpegd_dev *jpegd, u32 reg)
+{
+	return readl(jpegd->regs + reg);
+}
+
+static inline void rkjpegd_write_addr(struct rkjpegd_dev *jpegd, u32 reg,
+				      dma_addr_t addr)
+{
+	rkjpegd_write(jpegd, lower_32_bits(addr), reg);
+}
+
+static const struct v4l2_event rkjpegd_eos_event = {
+	.type = V4L2_EVENT_EOS,
+};
+
+static const struct v4l2_event rkjpegd_src_change_event = {
+	.type = V4L2_EVENT_SOURCE_CHANGE,
+	.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+};
+
+/*
+ * Colorimetry is a property of the picture, and a JPEG frame header carries
+ * nothing that describes it.  Default to what JFIF implies, but take what the
+ * application sets on the coded queue, it may know better, and report that on
+ * the capture queue.
+ */
+static void rkjpegd_set_default_colorimetry(struct v4l2_pix_format_mplane *pix_mp)
+{
+	pix_mp->colorspace = V4L2_COLORSPACE_JPEG;
+	pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
+	pix_mp->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static void rkjpegd_propagate_colorimetry(struct v4l2_pix_format_mplane *to,
+					  const struct v4l2_pix_format_mplane *from)
+{
+	to->colorspace = from->colorspace;
+	to->ycbcr_enc = from->ycbcr_enc;
+	to->quantization = from->quantization;
+	to->xfer_func = from->xfer_func;
+}
+
+static void rkjpegd_fill_raw_fmt(struct v4l2_pix_format_mplane *pix_mp,
+				 u32 width, u32 height)
+{
+	pix_mp->pixelformat = V4L2_PIX_FMT_NV12;
+	pix_mp->width = width;
+	pix_mp->height = height;
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->num_planes = 1;
+	pix_mp->plane_fmt[0].bytesperline = width;
+	pix_mp->plane_fmt[0].sizeimage = width * height * 3 / 2;
+	memset(pix_mp->plane_fmt[0].reserved, 0,
+	       sizeof(pix_mp->plane_fmt[0].reserved));
+	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
+}
+
+static void rkjpegd_fill_coded_fmt(struct v4l2_pix_format_mplane *pix_mp,
+				   u32 width, u32 height, u32 sizeimage)
+{
+	pix_mp->pixelformat = V4L2_PIX_FMT_JPEG;
+	pix_mp->width = width;
+	pix_mp->height = height;
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->num_planes = 1;
+	pix_mp->plane_fmt[0].bytesperline = 0;
+
+	if (!sizeimage)
+		sizeimage = width * height * RKJPEGD_CODED_MAX_DEPTH;
+	pix_mp->plane_fmt[0].sizeimage = sizeimage;
+
+	memset(pix_mp->plane_fmt[0].reserved, 0,
+	       sizeof(pix_mp->plane_fmt[0].reserved));
+	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
+}
+
+static void rkjpegd_reset_fmts(struct rkjpegd_ctx *ctx)
+{
+	u32 width = ALIGN(RKJPEGD_MIN_WIDTH, RKJPEGD_RAW_STEP);
+	u32 height = ALIGN(RKJPEGD_MIN_HEIGHT, RKJPEGD_RAW_STEP);
+
+	rkjpegd_fill_coded_fmt(&ctx->src_fmt, width, height, 0);
+	rkjpegd_set_default_colorimetry(&ctx->src_fmt);
+
+	mutex_lock(&ctx->fmt_lock);
+	rkjpegd_fill_raw_fmt(&ctx->dst_fmt, width, height);
+	rkjpegd_set_default_colorimetry(&ctx->dst_fmt);
+	ctx->crop.left = 0;
+	ctx->crop.top = 0;
+	ctx->crop.width = width;
+	ctx->crop.height = height;
+	mutex_unlock(&ctx->fmt_lock);
+}
+
+static int rkjpegd_querycap(struct file *file, void *priv,
+			    struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, RKJPEGD_NAME, sizeof(cap->driver));
+	strscpy(cap->card, RKJPEGD_NAME, sizeof(cap->card));
+
+	return 0;
+}
+
+static int rkjpegd_enum_fmt_vid_cap(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_PIX_FMT_NV12;
+
+	return 0;
+}
+
+static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_PIX_FMT_JPEG;
+
+	f->flags |= V4L2_FMT_FLAG_DYN_RESOLUTION;
+
+	return 0;
+}
+
+static int rkjpegd_enum_framesizes(struct file *file, void *priv,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	/* The decoded format follows the bitstream, nothing to enumerate. */
+	if (fsize->pixel_format == V4L2_PIX_FMT_NV12)
+		return -ENOTTY;
+
+	if (fsize->pixel_format != V4L2_PIX_FMT_JPEG)
+		return -EINVAL;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = RKJPEGD_MIN_WIDTH;
+	fsize->stepwise.max_width = RKJPEGD_MAX_SIZE;
+	fsize->stepwise.step_width = RKJPEGD_CODED_STEP;
+	fsize->stepwise.min_height = RKJPEGD_MIN_HEIGHT;
+	fsize->stepwise.max_height = RKJPEGD_MAX_SIZE;
+	fsize->stepwise.step_height = RKJPEGD_CODED_STEP;
+
+	return 0;
+}
+
+static int rkjpegd_g_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct rkjpegd_ctx *ctx = file_to_rkjpegd_ctx(file);
+
+	mutex_lock(&ctx->fmt_lock);
+	f->fmt.pix_mp = ctx->dst_fmt;
+	mutex_unlock(&ctx->fmt_lock);
+
+	return 0;
+}
+
+static int rkjpegd_g_fmt_vid_out(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	f->fmt.pix_mp = file_to_rkjpegd_ctx(file)->src_fmt;
+
+	return 0;
+}
+
+/*
+ * The capture resolution follows the bitstream, not userspace: it is set from
+ * the frame header when a source change is reported and only read back here.
+ * The colorimetry follows the coded queue the same way.
+ */
+static int rkjpegd_try_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct rkjpegd_ctx *ctx = file_to_rkjpegd_ctx(file);
+
+	mutex_lock(&ctx->fmt_lock);
+	rkjpegd_fill_raw_fmt(&f->fmt.pix_mp, ctx->dst_fmt.width,
+			     ctx->dst_fmt.height);
+	rkjpegd_propagate_colorimetry(&f->fmt.pix_mp, &ctx->dst_fmt);
+	mutex_unlock(&ctx->fmt_lock);
+
+	return 0;
+}
+
+static int rkjpegd_try_fmt_vid_out(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	u32 sizeimage = pix_mp->num_planes == 1 ?
+			pix_mp->plane_fmt[0].sizeimage : 0;
+
+	v4l_bound_align_image(&pix_mp->width,
+			      RKJPEGD_MIN_WIDTH, RKJPEGD_MAX_SIZE,
+			      ilog2(RKJPEGD_CODED_STEP),
+			      &pix_mp->height,
+			      RKJPEGD_MIN_HEIGHT, RKJPEGD_MAX_SIZE,
+			      ilog2(RKJPEGD_CODED_STEP), 0);
+
+	rkjpegd_fill_coded_fmt(pix_mp, pix_mp->width, pix_mp->height, sizeimage);
+
+	/* The core has already replaced invalid values with the defaults. */
+	if (pix_mp->colorspace == V4L2_COLORSPACE_DEFAULT)
+		rkjpegd_set_default_colorimetry(pix_mp);
+
+	return 0;
+}
+
+static int rkjpegd_s_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct rkjpegd_ctx *ctx = file_to_rkjpegd_ctx(file);
+	struct vb2_queue *vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	rkjpegd_try_fmt_vid_cap(file, priv, f);
+
+	mutex_lock(&ctx->fmt_lock);
+	ctx->dst_fmt = f->fmt.pix_mp;
+	mutex_unlock(&ctx->fmt_lock);
+
+	return 0;
+}
+
+static int rkjpegd_s_fmt_vid_out(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct rkjpegd_ctx *ctx = file_to_rkjpegd_ctx(file);
+	struct vb2_queue *vq = v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
+	int ret;
+
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	ret = rkjpegd_try_fmt_vid_out(file, priv, f);
+	if (ret)
+		return ret;
+
+	ctx->src_fmt = f->fmt.pix_mp;
+
+	/* S_FMT on the coded queue invalidates the raw format. */
+	mutex_lock(&ctx->fmt_lock);
+	rkjpegd_fill_raw_fmt(&ctx->dst_fmt,
+			     ALIGN(ctx->src_fmt.width, RKJPEGD_RAW_STEP),
+			     ALIGN(ctx->src_fmt.height, RKJPEGD_RAW_STEP));
+	rkjpegd_propagate_colorimetry(&ctx->dst_fmt, &ctx->src_fmt);
+	ctx->crop.left = 0;
+	ctx->crop.top = 0;
+	ctx->crop.width = ctx->src_fmt.width;
+	ctx->crop.height = ctx->src_fmt.height;
+	mutex_unlock(&ctx->fmt_lock);
+
+	return 0;
+}
+
+static int rkjpegd_g_selection(struct file *file, void *priv,
+			       struct v4l2_selection *s)
+{
+	struct rkjpegd_ctx *ctx = file_to_rkjpegd_ctx(file);
+	struct v4l2_rect crop;
+	u32 width, height;
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	mutex_lock(&ctx->fmt_lock);
+	crop = ctx->crop;
+	width = ctx->dst_fmt.width;
+	height = ctx->dst_fmt.height;
+	mutex_unlock(&ctx->fmt_lock);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r = crop;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = width;
+		s->r.height = height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rkjpegd_subscribe_event(struct v4l2_fh *fh,
+				   const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	default:
+		/* The decoder takes no controls, so there is nothing else. */
+		return -EINVAL;
+	}
+}
+
+/**
+ * rkjpegd_resume_drain() - re-arm a drain across a resolution change
+ * @ctx:	context whose capture queue is restarted
+ *
+ * Restarting the capture queue for a resolution change clears the drain
+ * state, but a drain still in progress is owed a LAST capture buffer for its
+ * last coded buffer.  @v4l2_m2m_ctx.last_src_buf stays set for exactly that
+ * case.  It is cleared once a drain completes, the coded queue stops, or
+ * the capture queue stops without a resolution change, which aborts the
+ * drain.
+ */
+static void rkjpegd_resume_drain(struct rkjpegd_ctx *ctx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+
+	if (ctx->source_change && m2m_ctx->last_src_buf)
+		m2m_ctx->is_draining = true;
+	else
+		m2m_ctx->last_src_buf = NULL;
+}
+
+static void rkjpegd_last_buffer_done(struct rkjpegd_ctx *ctx,
+				     struct vb2_v4l2_buffer *vbuf)
+{
+	vbuf->flags |= V4L2_BUF_FLAG_LAST;
+	vbuf->field = V4L2_FIELD_NONE;
+	vbuf->sequence = ctx->sequence_cap++;
+	vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
+	vb2_buffer_done(&vbuf->vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+static int rkjpegd_decoder_cmd(struct file *file, void *priv,
+			       struct v4l2_decoder_cmd *cmd)
+{
+	struct rkjpegd_ctx *ctx = file_to_rkjpegd_ctx(file);
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	bool source_change, stopped;
+	unsigned long flags;
+	int ret;
+
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
+	if (ret < 0)
+		return ret;
+
+	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))
+		return 0;
+
+	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
+		spin_lock_irqsave(&jpegd->drain_lock, flags);
+		ret = v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
+		stopped = v4l2_m2m_has_stopped(ctx->fh.m2m_ctx);
+		spin_unlock_irqrestore(&jpegd->drain_lock, flags);
+		if (ret < 0)
+			return ret;
+
+		if (stopped)
+			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
+
+		return 0;
+	}
+
+	/* Resumes after a drain or a resolution change alike. */
+	mutex_lock(&ctx->fmt_lock);
+	source_change = ctx->source_change;
+	mutex_unlock(&ctx->fmt_lock);
+
+	/* A drain the resolution change interrupted carries on. */
+	spin_lock_irqsave(&jpegd->drain_lock, flags);
+	if (!source_change || !ctx->fh.m2m_ctx->is_draining)
+		ret = v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
+	spin_unlock_irqrestore(&jpegd->drain_lock, flags);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&ctx->fmt_lock);
+	ctx->source_change = false;
+	mutex_unlock(&ctx->fmt_lock);
+
+	vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
+	v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops = {
+	.vidioc_querycap = rkjpegd_querycap,
+	.vidioc_enum_framesizes = rkjpegd_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap = rkjpegd_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap_mplane = rkjpegd_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap_mplane = rkjpegd_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap_mplane = rkjpegd_s_fmt_vid_cap,
+
+	.vidioc_enum_fmt_vid_out = rkjpegd_enum_fmt_vid_out,
+	.vidioc_g_fmt_vid_out_mplane = rkjpegd_g_fmt_vid_out,
+	.vidioc_try_fmt_vid_out_mplane = rkjpegd_try_fmt_vid_out,
+	.vidioc_s_fmt_vid_out_mplane = rkjpegd_s_fmt_vid_out,
+
+	.vidioc_g_selection = rkjpegd_g_selection,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_remove_bufs = v4l2_m2m_ioctl_remove_bufs,
+
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd = rkjpegd_decoder_cmd,
+
+	.vidioc_subscribe_event = rkjpegd_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static void rkjpegd_arm_watchdog(struct rkjpegd_dev *jpegd)
+{
+	schedule_delayed_work(&jpegd->watchdog_work,
+			      msecs_to_jiffies(RKJPEGD_TIMEOUT_MS));
+}
+
+static void rkjpegd_job_finish_no_pm(struct rkjpegd_ctx *ctx,
+				     enum vb2_buffer_state state)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	struct vb2_v4l2_buffer *src, *dst;
+	unsigned long flags;
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	if (WARN_ON(!src) || WARN_ON(!dst))
+		return;
+
+	spin_lock_irqsave(&jpegd->drain_lock, flags);
+
+	src->sequence = ctx->sequence_out++;
+	dst->sequence = ctx->sequence_cap++;
+
+	vb2_set_plane_payload(&dst->vb2_buf, 0,
+			      state == VB2_BUF_STATE_DONE ? ctx->job_payload : 0);
+
+	if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, src)) {
+		dst->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
+		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+		ctx->fh.m2m_ctx->last_src_buf = NULL;
+	}
+
+	v4l2_m2m_buf_done_and_job_finish(jpegd->m2m_dev, ctx->fh.m2m_ctx,
+					 state);
+
+	spin_unlock_irqrestore(&jpegd->drain_lock, flags);
+}
+
+static void rkjpegd_job_finish(struct rkjpegd_ctx *ctx,
+			       enum vb2_buffer_state state)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+
+	pm_runtime_put_autosuspend(jpegd->dev);
+
+	rkjpegd_job_finish_no_pm(ctx, state);
+}
+
+static void rkjpegd_irq_done(struct rkjpegd_dev *jpegd,
+			     enum vb2_buffer_state state)
+{
+	struct rkjpegd_ctx *ctx = v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
+
+	if (!ctx)
+		return;
+
+	if (cancel_delayed_work(&jpegd->watchdog_work))
+		rkjpegd_job_finish(ctx, state);
+}
+
+/**
+ * vdpu720_jpeg_mode() - map JPEG sampling factors to the hardware mode
+ * @frame:	parsed JPEG frame header
+ *
+ * The sampling factor tuple is determined by the luma channel's factors
+ * relative to the maximum in the frame.  Standard JFIF layouts only,
+ * anything else returns -EINVAL: the mode also picks the MCU height and
+ * therefore PIC_H, so guessing one would decode into a wrong image.
+ * v4l2_jpeg_parse_header() lets no more than 4:4:4, 4:2:2, 4:2:0 and 4:1:1
+ * through, so the hardware's 4:4:0 mode is not used.
+ *
+ * Return: a VDPU720_JPEG_MODE_* value, or -EINVAL for any other sampling
+ * layout.
+ */
+static int vdpu720_jpeg_mode(const struct v4l2_jpeg_frame_header *frame)
+{
+	u8 h0, v0;
+
+	if (frame->num_components == 1)
+		return VDPU720_JPEG_MODE_YUV400;
+
+	/* Component 0 always carries luma in JFIF */
+	h0 = frame->component[0].horizontal_sampling_factor;
+	v0 = frame->component[0].vertical_sampling_factor;
+
+	if (h0 == 1 && v0 == 1)
+		return VDPU720_JPEG_MODE_YUV444;
+	if (h0 == 2 && v0 == 1)
+		return VDPU720_JPEG_MODE_YUV422;
+	if (h0 == 2 && v0 == 2)
+		return VDPU720_JPEG_MODE_YUV420;
+	if (h0 == 4 && v0 == 1)
+		return VDPU720_JPEG_MODE_YUV411;
+
+	return -EINVAL;
+}
+
+/**
+ * vdpu720_mcu_width() - horizontal size of a mode's minimum coded unit
+ * @jpeg_mode:	a VDPU720_JPEG_MODE_* value
+ *
+ * MCU_W follows the luma horizontal sampling factor, h0 * 8.  YUV420 and
+ * YUV422 subsample the luma horizontally by 2 and YUV411 by 4, giving 16 and
+ * 32 pixels.  The rest is 8.
+ *
+ * Return: the MCU width in pixels.
+ */
+static u32 vdpu720_mcu_width(int jpeg_mode)
+{
+	if (jpeg_mode == VDPU720_JPEG_MODE_YUV411)
+		return 32;
+	if (jpeg_mode == VDPU720_JPEG_MODE_YUV420 ||
+	    jpeg_mode == VDPU720_JPEG_MODE_YUV422)
+		return 16;
+
+	return 8;
+}
+
+/**
+ * vdpu720_mcu_height() - vertical size of a mode's minimum coded unit
+ * @jpeg_mode:	a VDPU720_JPEG_MODE_* value
+ *
+ * MCU_H follows the luma vertical sampling factor, v0 * 8.  YUV420 subsamples
+ * the luma vertically by 2, giving 16 pixels.  The rest is 8.
+ *
+ * Return: the MCU height in pixels.
+ */
+static u32 vdpu720_mcu_height(int jpeg_mode)
+{
+	if (jpeg_mode == VDPU720_JPEG_MODE_YUV420)
+		return 16;
+
+	return 8;
+}
+
+/**
+ * vdpu720_nb_htbl_sets() - number of Huffman table sets the hardware reads
+ * @num_components:	number of components in the scan
+ *
+ * One for a grayscale frame, two for a colour one.  vdpu720_write_htbl()
+ * fills that many sets and vdpu720_fill_regs() sizes HTBL_SEL and the length
+ * registers from the same number, so the two cannot drift apart.
+ *
+ * Return: the number of table sets to write.
+ */
+static unsigned int vdpu720_nb_htbl_sets(unsigned int num_components)
+{
+	return num_components == 1 ? 1 : VDPU720_NB_HTBL_SETS;
+}
+
+/**
+ * vdpu720_write_qtbl() - write all Q-tables into the DMA side buffer
+ * @ctx:	context whose side buffer receives the tables
+ * @hdr:	parsed JPEG header the tables are taken from
+ *
+ * Tables are stored sequentially, one per component in component order.
+ * Each entry is widened to a little-endian u16 and reordered from JPEG
+ * zig-zag scan to natural raster-scan order, matching the hardware
+ * expectation.
+ *
+ * Return: 0 on success, -EINVAL if the frame refers to a quantization
+ * table it does not carry.
+ */
+static int vdpu720_write_qtbl(struct rkjpegd_ctx *ctx,
+			      const struct v4l2_jpeg_header *hdr)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	__le16 *base = ctx->table_base.cpu;
+	unsigned int k, i;
+
+	for (k = 0; k < hdr->frame.num_components; k++) {
+		u8 tq_id = hdr->frame.component[k].quantization_table_selector;
+		u8 qtbl[VDPU720_QTBL_ENTRIES];
+		__le16 *dst;
+
+		/* .start points past the Pq|Tq byte at the 64 Qk values. */
+		if (tq_id > 3 || !hdr->quantization_tables[tq_id].start) {
+			dev_err_ratelimited(jpegd->dev,
+					    "Q-table %u not found for component %u\n",
+					    tq_id, k);
+			return -EINVAL;
+		}
+
+		memcpy(qtbl, hdr->quantization_tables[tq_id].start, sizeof(qtbl));
+		dst = base + k * VDPU720_QTBL_ENTRIES;
+
+		/*
+		 * v4l2_jpeg_zigzag_scan_index[z] is the raster position of z.
+		 */
+		for (i = 0; i < VDPU720_QTBL_ENTRIES; i++)
+			dst[v4l2_jpeg_zigzag_scan_index[i]] = cpu_to_le16(qtbl[i]);
+	}
+
+	return 0;
+}
+
+/**
+ * vdpu720_compute_mincode() - build the minimum Huffman code arrays
+ * @bits:	BITS[16], the number of codes of each length 1..16
+ * @min_code:	output, minimum code value per length (16 entries)
+ * @acc_addr:	output, accumulated symbol-table address per length (16 entries)
+ *
+ * Derives the two arrays the hardware needs for one Huffman table, DC or AC,
+ * from that table's BITS array.  Algorithm ported verbatim from
+ * jpegd_vpu7xx_write_htbl().
+ */
+static void vdpu720_compute_mincode(const u8 *bits, u16 *min_code, u16 *acc_addr)
+{
+	u16 code = 0, addr = 0;
+	unsigned int j;
+
+	for (j = 0; j < 16; j++) {
+		u16 len = bits[j];
+
+		if (len == 0 && j > 0)
+			min_code[j] = max(code, (u16)min_code[j - 1] << 1);
+		else
+			min_code[j] = code;
+
+		code  += len;
+		addr  += len;
+		acc_addr[j] = addr;
+		code <<= 1;
+	}
+
+	/* Sentinel: set min_code[0] to the last valid code + count */
+	if (bits[15])
+		min_code[0] = min_code[15] + bits[15] - 1;
+	else
+		min_code[0] = min_code[15];
+}
+
+/**
+ * vdpu720_huffman_table() - look up one Huffman table of a frame
+ * @hdr:	parsed JPEG header
+ * @idx:	table index, (Tc << 1) | Th
+ * @len:	returns the table length, BITS included
+ *
+ * Motion-JPEG frames often carry no DHT segment and rely on the tables of
+ * ITU-T T.81 Annex K.3, so a table the frame does not define falls back to
+ * the one from there.
+ *
+ * Return: the table, laid out as BITS[16] followed by HUFFVAL.
+ */
+static const u8 *vdpu720_huffman_table(const struct v4l2_jpeg_header *hdr,
+				       unsigned int idx, size_t *len)
+{
+	static const u8 * const std_tables[] = {
+		v4l2_jpeg_ref_table_luma_dc_ht,
+		v4l2_jpeg_ref_table_chroma_dc_ht,
+		v4l2_jpeg_ref_table_luma_ac_ht,
+		v4l2_jpeg_ref_table_chroma_ac_ht,
+	};
+	static const size_t std_lens[] = {
+		V4L2_JPEG_REF_HT_DC_LEN, V4L2_JPEG_REF_HT_DC_LEN,
+		V4L2_JPEG_REF_HT_AC_LEN, V4L2_JPEG_REF_HT_AC_LEN,
+	};
+
+	if (hdr->huffman_tables[idx].start) {
+		*len = hdr->huffman_tables[idx].length;
+		return hdr->huffman_tables[idx].start;
+	}
+
+	*len = std_lens[idx];
+	return std_tables[idx];
+}
+
+/**
+ * vdpu720_write_htbl() - fill the Huffman mincode and value sub-buffers
+ * @ctx:	context whose side buffer receives the tables
+ * @hdr:	parsed JPEG header the tables are taken from
+ *
+ * One set is written per vdpu720_nb_htbl_sets(), fed by the scan component
+ * that uses it: the first by the luma component and the second by the first
+ * chroma one.  With no per component selector register and no known use for
+ * a third set, see %VDPU720_NB_HTBL_SETS, a frame whose two chroma components
+ * disagree on their tables is refused rather than decoded with the wrong table
+ * for the last component.
+ *
+ * Per-set layout in the mincode buffer:
+ *   16 x u16  DC min-codes
+ *    8 x u16  DC accumulated addresses (packed pairs)
+ *   16 x u16  AC min-codes
+ *    8 x u16  AC accumulated addresses (packed pairs)
+ *
+ * Per-set layout in the value buffer (192 bytes):
+ *   16 bytes  DC code values
+ *  176 bytes  AC code values
+ *
+ * Return: 0 on success, -EINVAL if the scan selects a Huffman table outside
+ * baseline or needs more table sets than the hardware has.
+ */
+static int vdpu720_write_htbl(struct rkjpegd_ctx *ctx,
+			      const struct v4l2_jpeg_header *hdr)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	const struct v4l2_jpeg_scan_header *scan = hdr->scan;
+	u8  *tbl_base  = ctx->table_base.cpu;
+	__le16 *p_mincode = (__le16 *)(tbl_base + VDPU720_HMINCODE_OFF);
+	u8  *p_value   = tbl_base + VDPU720_HVALUE_OFF;
+	unsigned int nb_sets = vdpu720_nb_htbl_sets(scan->num_components);
+	unsigned int k, i;
+
+	/* The last set is shared by every remaining component */
+	for (k = nb_sets; k < scan->num_components; k++) {
+		if (scan->component[k].dc_entropy_coding_table_selector !=
+		    scan->component[nb_sets - 1].dc_entropy_coding_table_selector ||
+		    scan->component[k].ac_entropy_coding_table_selector !=
+		    scan->component[nb_sets - 1].ac_entropy_coding_table_selector) {
+			dev_err_ratelimited(jpegd->dev,
+					    "JPEG component %u uses other Huffman tables than component %u\n",
+					    k, nb_sets - 1);
+			return -EINVAL;
+		}
+	}
+
+	for (k = 0; k < nb_sets; k++) {
+		u8 dc_sel = scan->component[k].dc_entropy_coding_table_selector;
+		u8 ac_sel = scan->component[k].ac_entropy_coding_table_selector;
+		u8 dc_bits[16], ac_bits[16];
+		const u8 *dc_src, *ac_src, *dc_vals, *ac_vals;
+		unsigned int dc_huffval_len, ac_huffval_len;
+		size_t dc_len, ac_len;
+		u16 min_dc[16], acc_dc[16];
+		u16 min_ac[16], acc_ac[16];
+
+		if (dc_sel > 1 || ac_sel > 1) {
+			dev_err_ratelimited(jpegd->dev,
+					    "JPEG component %u selects Huffman tables dc=%u ac=%u\n",
+					    k, dc_sel, ac_sel);
+			return -EINVAL;
+		}
+
+		dc_src = vdpu720_huffman_table(hdr, dc_sel, &dc_len);
+		ac_src = vdpu720_huffman_table(hdr, 2 | ac_sel, &ac_len);
+
+		memcpy(dc_bits, dc_src, sizeof(dc_bits));
+		memcpy(ac_bits, ac_src, sizeof(ac_bits));
+		dc_vals = dc_src + 16;
+		ac_vals = ac_src + 16;
+
+		dc_huffval_len = 0;
+		for (i = 0; i < 16; i++)
+			dc_huffval_len += dc_bits[i];
+		ac_huffval_len = 0;
+		for (i = 0; i < 16; i++)
+			ac_huffval_len += ac_bits[i];
+
+		if (16 + dc_huffval_len > dc_len || 16 + ac_huffval_len > ac_len) {
+			dev_err_ratelimited(jpegd->dev,
+					    "JPEG Huffman table for component %u changed after it was queued\n",
+					    k);
+			return -EINVAL;
+		}
+
+		/*
+		 * The accumulated addresses are packed two per u16, so a table
+		 * the hardware cannot hold would be truncated into one
+		 * silently.  The value block is the tighter of the two limits.
+		 */
+		if (dc_huffval_len > VDPU720_DC_VALUES_MAX ||
+		    ac_huffval_len > VDPU720_AC_VALUES_MAX) {
+			dev_err_ratelimited(jpegd->dev,
+					    "JPEG Huffman table too large for component %u (dc=%u ac=%u)\n",
+					    k, dc_huffval_len, ac_huffval_len);
+			return -EINVAL;
+		}
+
+		vdpu720_compute_mincode(dc_bits, min_dc, acc_dc);
+		vdpu720_compute_mincode(ac_bits, min_ac, acc_ac);
+
+		for (i = 0; i < 16; i++)
+			*p_mincode++ = cpu_to_le16(min_dc[i]);
+		for (i = 0; i < 8; i++)
+			*p_mincode++ = cpu_to_le16(acc_dc[2 * i] |
+						   (acc_dc[2 * i + 1] << 8));
+		for (i = 0; i < 16; i++)
+			*p_mincode++ = cpu_to_le16(min_ac[i]);
+		for (i = 0; i < 8; i++)
+			*p_mincode++ = cpu_to_le16(acc_ac[2 * i] |
+						   (acc_ac[2 * i + 1] << 8));
+
+		/* Zero-pad the value block, then fill DC then AC values. */
+		memset(p_value, 0, VDPU720_HVALUE_SET_SIZE);
+		memcpy(p_value, dc_vals, dc_huffval_len);
+		memcpy(p_value + VDPU720_DC_VALUES_MAX, ac_vals, ac_huffval_len);
+		p_value += VDPU720_HVALUE_SET_SIZE;
+	}
+
+	return 0;
+}
+
+/**
+ * vdpu720_fill_regs() - program the decoder registers for one frame
+ * @ctx:		context the job belongs to
+ * @hdr:		parsed JPEG header
+ * @tbl_dma:		DMA address of the Q/Huffman table side buffer
+ * @strm_dma:		DMA address of the entropy stream, 16-byte aligned
+ * @strm_start_byte:	offset of the first stream byte within that word
+ * @strm_len_blks:	stream length in 16-byte blocks, minus one
+ * @out_dma:		DMA address of the destination NV12 buffer
+ *
+ * Return: 0 on success, negative errno for a frame the hardware cannot be
+ * programmed for.
+ */
+static int vdpu720_fill_regs(struct rkjpegd_ctx *ctx,
+			     const struct v4l2_jpeg_header *hdr,
+			     dma_addr_t tbl_dma,
+			     dma_addr_t strm_dma, u32 strm_start_byte,
+			     u32 strm_len_blks,
+			     dma_addr_t out_dma)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	u32 jpeg_width  = hdr->frame.width;
+	u32 jpeg_height = hdr->frame.height;
+	u32 buf_width, buf_height;
+	u32 w_align;
+	u32 y_stride;	/* units of 16 pixels */
+	u32 y_vstride;	/* sets the UV plane offset */
+	u32 nb_comp     = hdr->frame.num_components;
+	/* One Q-table entry per component, not one per DQT segment. */
+	u32 qtbl_sel  = nb_comp;
+	/* One H-table set for grayscale, two for colour. */
+	u32 htbl_sel  = vdpu720_nb_htbl_sets(nb_comp);
+	u32 mcu_width, mcu_height, jpeg_height_aligned;
+	u32 qtbl_len, hmin_len, hval_len;
+	int jpeg_mode;
+	u32 reg;
+
+	mutex_lock(&ctx->fmt_lock);
+	buf_width  = ctx->dst_fmt.width;
+	buf_height = ctx->dst_fmt.height;
+	mutex_unlock(&ctx->fmt_lock);
+
+	w_align   = ALIGN(buf_width, 16);
+	y_stride  = w_align >> 4;
+	y_vstride = y_stride * buf_height;
+
+	jpeg_mode = vdpu720_jpeg_mode(&hdr->frame);
+	if (jpeg_mode < 0) {
+		dev_err_ratelimited(jpegd->dev,
+				    "unsupported JPEG sampling factors %ux%u\n",
+				    hdr->frame.component[0].horizontal_sampling_factor,
+				    hdr->frame.component[0].vertical_sampling_factor);
+		return jpeg_mode;
+	}
+
+	mcu_width  = vdpu720_mcu_width(jpeg_mode);
+	mcu_height = vdpu720_mcu_height(jpeg_mode);
+	jpeg_height_aligned = ALIGN(jpeg_height, mcu_height);
+
+	/*
+	 * Dimensions come from the bitstream, strides from the negotiated
+	 * capture format, so refuse a frame larger than was negotiated.  The
+	 * width is compared raw because that is what the decoder lays a row
+	 * down at; only the height is MCU aligned, PIC_H drives the MCU row
+	 * count.
+	 */
+	if (jpeg_width > buf_width || jpeg_height_aligned > buf_height) {
+		dev_err_ratelimited(jpegd->dev,
+				    "JPEG %ux%u does not fit the negotiated %ux%u\n",
+				    jpeg_width, jpeg_height_aligned,
+				    buf_width, buf_height);
+		return -EINVAL;
+	}
+
+	/*
+	 * FILL_DOWN_E completes the bottom of the picture for the vertically
+	 * subsampled output chroma; the reference driver sets it for every
+	 * NV12 conversion.  FILL_RIGHT_E does the same on the right, but only
+	 * the 8 pixel MCU widths can stop short of the 16 pixel aligned
+	 * buffer.
+	 */
+	reg = FIELD_PREP(VDPU720_YUV_OUT_FMT, VDPU720_YUV_OUT_FMT_NV12) |
+	      VDPU720_FILL_DOWN_E;
+	if (ALIGN(jpeg_width, mcu_width) < ALIGN(jpeg_width, 16))
+		reg |= VDPU720_FILL_RIGHT_E;
+	rkjpegd_write_relaxed(jpegd, reg, VDPU720_REG_SYS);
+
+	/*
+	 * PIC_H is MCU aligned because the vertical MCU count derives from
+	 * it.  PIC_W is not: the decoder lays rows down at the picture width,
+	 * so a PIC_W past it shifts every row against the buffer.
+	 */
+	rkjpegd_write_relaxed(jpegd,
+			      FIELD_PREP(VDPU720_PIC_W_M1, jpeg_width - 1) |
+			      FIELD_PREP(VDPU720_PIC_H_M1, jpeg_height_aligned - 1),
+			      VDPU720_REG_PIC_SIZE);
+
+	/* REG4: JPEG format, Q/H table counts, restart interval */
+	qtbl_len = VDPU720_TBL_LEN(qtbl_sel * VDPU720_QTBL_COMP_SIZE);
+	hmin_len = VDPU720_TBL_LEN(htbl_sel * VDPU720_HMINCODE_SET_SIZE);
+	hval_len = VDPU720_TBL_LEN(htbl_sel * VDPU720_HVALUE_SET_SIZE);
+
+	reg = FIELD_PREP(VDPU720_JPEG_MODE, jpeg_mode) |
+	      FIELD_PREP(VDPU720_PIX_DEPTH, VDPU720_PIX_DEPTH_8) |
+	      FIELD_PREP(VDPU720_QTBL_SEL, qtbl_sel) |
+	      FIELD_PREP(VDPU720_HTBL_SEL, htbl_sel);
+	if (hdr->restart_interval) {
+		reg |= VDPU720_DRI_E;
+		reg |= FIELD_PREP(VDPU720_DRI_MCU_M1, hdr->restart_interval - 1);
+	}
+	rkjpegd_write_relaxed(jpegd, reg, VDPU720_REG_PIC_FMT);
+
+	/* REG5: horizontal virtual strides */
+	rkjpegd_write_relaxed(jpegd,
+			      FIELD_PREP(VDPU720_Y_HOR_STRIDE, y_stride) |
+			      FIELD_PREP(VDPU720_UV_HOR_STRIDE, y_stride),
+			      VDPU720_REG_HOR_STRIDE);
+
+	/* REG6: total Y-plane size (stride-units * height) */
+	rkjpegd_write_relaxed(jpegd, FIELD_PREP(VDPU720_Y_VSTRIDE, y_vstride),
+			      VDPU720_REG_Y_VSTRIDE);
+
+	/* REG7: table lengths + high stride bit */
+	reg = FIELD_PREP(VDPU720_QTBL_LEN, qtbl_len) |
+	      FIELD_PREP(VDPU720_HTBL_MINCODE_LEN, hmin_len) |
+	      FIELD_PREP(VDPU720_HTBL_VALUE_LEN, hval_len) |
+	      FIELD_PREP(VDPU720_Y_HOR_STRIDE_H, y_stride >> 16);
+	rkjpegd_write_relaxed(jpegd, reg, VDPU720_REG_TBL_LEN);
+
+	/* REG8: stream length and start byte */
+	rkjpegd_write_relaxed(jpegd,
+			      FIELD_PREP(VDPU720_STRM_START_BYTE, strm_start_byte) |
+			      FIELD_PREP(VDPU720_STRM_LEN, strm_len_blks),
+			      VDPU720_REG_STRM_LEN);
+
+	/* REG9-REG11: Q/H table DMA addresses (side buffer) */
+	rkjpegd_write_addr(jpegd, VDPU720_REG_QTBL_BASE, tbl_dma);
+	rkjpegd_write_addr(jpegd, VDPU720_REG_HTBL_MINCODE,
+			   tbl_dma + VDPU720_HMINCODE_OFF);
+	rkjpegd_write_addr(jpegd, VDPU720_REG_HTBL_VALUE,
+			   tbl_dma + VDPU720_HVALUE_OFF);
+
+	/* REG12: stream base (16-byte aligned) */
+	rkjpegd_write_addr(jpegd, VDPU720_REG_STRM_BASE, strm_dma);
+
+	/* REG13: NV12 output buffer */
+	rkjpegd_write_addr(jpegd, VDPU720_REG_OUT_BASE, out_dma);
+
+	/* REG14: stream error handling defaults */
+	rkjpegd_write_relaxed(jpegd, VDPU720_STRM_ERR_DFLT, VDPU720_REG_STRM_ERR);
+
+	/* REG16: enable all internal clock gates */
+	rkjpegd_write_relaxed(jpegd, VDPU720_CLK_GATE_ALL, VDPU720_REG_CLK_GATE);
+
+	/* REG30: AXI performance counter */
+	rkjpegd_write_relaxed(jpegd,
+			      VDPU720_PERF_WORK_E | VDPU720_PERF_CLR_E |
+			      VDPU720_PERF_CNT_TYPE |
+			      FIELD_PREP(VDPU720_PERF_RD_LAT_ID, 0xa),
+			      VDPU720_REG_PERF_CTRL);
+
+	return 0;
+}
+
+/**
+ * rkjpegd_begin_cpu_access() - make a buffer coherent for the CPU
+ * @vb:		buffer accessed through its kernel mapping
+ * @dir:	direction of the access
+ *
+ * videobuf2 does no cache maintenance for an imported dmabuf, so leave it to
+ * the exporter.  The buffers allocated here are coherent and need none.
+ *
+ * Return: 0 on success, or the error from dma_buf_begin_cpu_access().
+ */
+static int rkjpegd_begin_cpu_access(struct vb2_buffer *vb,
+				    enum dma_data_direction dir)
+{
+	if (vb->memory != VB2_MEMORY_DMABUF)
+		return 0;
+
+	return dma_buf_begin_cpu_access(vb->planes[0].dbuf, dir);
+}
+
+static void rkjpegd_end_cpu_access(struct vb2_buffer *vb,
+				   enum dma_data_direction dir)
+{
+	if (vb->memory == VB2_MEMORY_DMABUF)
+		dma_buf_end_cpu_access(vb->planes[0].dbuf, dir);
+}
+
+/**
+ * vdpu720_fill_chroma() - write neutral chroma for a grayscale frame
+ * @ctx:	context the job belongs to
+ * @dst_buf:	capture buffer whose chroma plane is filled
+ *
+ * The output format converter has no YUV400 path: VDPU720_YUV_OUT_FMT_NV12
+ * only covers the subsampled colour modes, and for a single component frame
+ * the hardware writes the luma plane and leaves the chroma plane untouched.
+ *
+ * Fill the plane here, before the hardware is started: once the decode is
+ * running the interrupt can complete the job and hand the buffer to
+ * userspace at any time.
+ *
+ * Return: 0 on success, -EINVAL if the capture buffer has no kernel mapping,
+ * or the error from dma_buf_begin_cpu_access() for an imported buffer.
+ */
+static int vdpu720_fill_chroma(struct rkjpegd_ctx *ctx,
+			       struct vb2_v4l2_buffer *dst_buf)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	struct vb2_buffer *vb = &dst_buf->vb2_buf;
+	u32 y_size, size;
+	void *dst_cpu;
+	int ret;
+
+	mutex_lock(&ctx->fmt_lock);
+	y_size = ctx->dst_fmt.plane_fmt[0].bytesperline * ctx->dst_fmt.height;
+	size = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	mutex_unlock(&ctx->fmt_lock);
+
+	dst_cpu = vb2_plane_vaddr(vb, 0);
+	if (!dst_cpu) {
+		dev_err_ratelimited(jpegd->dev,
+				    "JPEG capture buffer has no kernel mapping\n");
+		return -EINVAL;
+	}
+
+	ret = rkjpegd_begin_cpu_access(vb, DMA_TO_DEVICE);
+	if (ret)
+		return ret;
+
+	memset(dst_cpu + y_size, 0x80, size - y_size);
+
+	rkjpegd_end_cpu_access(vb, DMA_TO_DEVICE);
+
+	return 0;
+}
+
+/**
+ * rkjpegd_vdpu720_init() - allocate the table side buffer
+ * @ctx:	context to allocate the Q/Huffman table buffer for
+ *
+ * Return: 0 on success, -ENOMEM if the allocation failed.
+ */
+static int rkjpegd_vdpu720_init(struct rkjpegd_ctx *ctx)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+
+	ctx->table_base.size = VDPU720_TABLE_BUF_SIZE;
+	ctx->table_base.cpu = dma_alloc_noncoherent(jpegd->dev,
+						    ctx->table_base.size,
+						    &ctx->table_base.dma,
+						    DMA_TO_DEVICE, GFP_KERNEL);
+	if (!ctx->table_base.cpu)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * rkjpegd_vdpu720_exit() - free the table side buffer
+ * @ctx:	context the buffer belongs to
+ */
+static void rkjpegd_vdpu720_exit(struct rkjpegd_ctx *ctx)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+
+	dma_free_noncoherent(jpegd->dev, ctx->table_base.size,
+			     ctx->table_base.cpu, ctx->table_base.dma,
+			     DMA_TO_DEVICE);
+}
+
+/**
+ * vdpu720_soft_reset() - ask the block to reset itself
+ * @jpegd:	device to reset
+ *
+ * Trigger the in-block soft reset and wait for it to report ready.  Sleeps
+ * while polling, so it must not be called from atomic context.
+ *
+ * Return: 0 once the block reports the reset complete, -ETIMEDOUT if it does
+ * not do so within 10 ms.
+ */
+static int vdpu720_soft_reset(struct rkjpegd_dev *jpegd)
+{
+	u32 status;
+	int ret;
+
+	/* Idle blocks want FORCE_SOFTRESET_VALID first, per downstream BSP. */
+	status = rkjpegd_read(jpegd, VDPU720_REG_INT);
+	if (!(status & VDPU720_DEC_E))
+		rkjpegd_write(jpegd, VDPU720_FORCE_SOFTRST, VDPU720_REG_SYS);
+
+	rkjpegd_write(jpegd, status | VDPU720_SOFT_RST_EN, VDPU720_REG_INT);
+
+	ret = readl_relaxed_poll_timeout(jpegd->regs + VDPU720_REG_INT, status,
+					 status & VDPU720_SOFT_RST_RDY,
+					 5, 10000);
+	if (ret)
+		dev_warn(jpegd->dev, "soft reset timed out\n");
+
+	return ret;
+}
+
+/**
+ * vdpu720_hard_reset() - pulse the block's reset lines
+ * @jpegd:	device to reset
+ *
+ * reset_control_reset() is not usable here.  The lines come from a Rockchip
+ * CRU, and rockchip_softrst_ops in drivers/clk/rockchip/softrst.c implements
+ * only .assert and .deassert, so reset_control_reset() returns -ENOTSUPP
+ * without touching the hardware.  Drive the pulse by hand instead.
+ *
+ * Return: 0 on success, negative errno if a reset control could not be
+ * asserted or deasserted.
+ */
+static int vdpu720_hard_reset(struct rkjpegd_dev *jpegd)
+{
+	int ret;
+
+	ret = reset_control_assert(jpegd->resets);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return reset_control_deassert(jpegd->resets);
+}
+
+/**
+ * rkjpegd_vdpu720_reset() - put the block back into a known state
+ * @ctx:	context the block is being reset on behalf of
+ *
+ * Try a soft reset first; fall back to a full hardware reset if the soft
+ * reset does not complete.  Reached from the watchdog and from
+ * rkjpegd_abort_job(), and from rkjpegd_vdpu720_run() for a block the last
+ * job left unparked, see @rkjpegd_dev.needs_reset.  Sleeps, so it must not
+ * be called from the interrupt handler.
+ */
+static void rkjpegd_vdpu720_reset(struct rkjpegd_ctx *ctx)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	int ret;
+
+	ret = vdpu720_soft_reset(jpegd);
+	if (ret) {
+		dev_warn(jpegd->dev, "falling back to hard reset\n");
+
+		ret = vdpu720_hard_reset(jpegd);
+		if (ret)
+			dev_err(jpegd->dev, "hard reset failed: %d\n", ret);
+	}
+
+	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
+
+	jpegd->needs_reset = false;
+}
+
+/**
+ * rkjpegd_vdpu720_run() - fill the side buffer, program the registers and
+ *			   start the hardware
+ * @ctx:	context holding the queues and the side buffer
+ *
+ * The header was parsed when the coded buffer was queued and its references
+ * still point into that buffer, which stays mapped until the job completes.
+ *
+ * Return: 0 with the hardware started and the watchdog armed, or a negative
+ * errno for a frame that cannot be decoded.
+ */
+static int rkjpegd_vdpu720_run(struct rkjpegd_ctx *ctx)
+{
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct rkjpegd_src_buf *src;
+	const struct v4l2_jpeg_header *hdr;
+	dma_addr_t src_dma, dst_dma;
+	u32 data_offset, payload;
+	u32 hw_strm_off, strm_off, strm_start_byte, strm_len_blks;
+	int ret;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	src = vb2_to_rkjpegd_src_buf(&src_buf->vb2_buf);
+
+	if (!src->parsed)
+		return -EINVAL;
+
+	/* The last job left the block in an unknown state, see @needs_reset. */
+	if (jpegd->needs_reset)
+		rkjpegd_vdpu720_reset(ctx);
+
+	mutex_lock(&ctx->fmt_lock);
+	ctx->job_payload = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	mutex_unlock(&ctx->fmt_lock);
+
+	/* Prepared before a source change, the buffer may predate the format. */
+	if (vb2_plane_size(&dst_buf->vb2_buf, 0) < ctx->job_payload) {
+		dev_err_ratelimited(jpegd->dev,
+				    "capture buffer of %lu bytes, format needs %u\n",
+				    vb2_plane_size(&dst_buf->vb2_buf, 0),
+				    ctx->job_payload);
+		return -EINVAL;
+	}
+
+	hdr = &src->header;
+	src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	data_offset = src_buf->vb2_buf.planes[0].data_offset;
+	payload = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+
+	memset(ctx->table_base.cpu, 0, ctx->table_base.size);
+
+	/* The tables are read from the coded buffer through the header. */
+	ret = rkjpegd_begin_cpu_access(&src_buf->vb2_buf, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	ret = vdpu720_write_qtbl(ctx, hdr);
+	if (!ret)
+		ret = vdpu720_write_htbl(ctx, hdr);
+
+	rkjpegd_end_cpu_access(&src_buf->vb2_buf, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	dma_sync_single_for_device(jpegd->dev, ctx->table_base.dma,
+				   ctx->table_base.size, DMA_TO_DEVICE);
+
+	/*
+	 * STRM_BASE must be 16-byte aligned, so split the address and record
+	 * the sub-block start byte.  Both come from the start of the plane,
+	 * not the payload: videobuf2 lets data_offset carry arbitrary low
+	 * bits, which STRM_BASE has no way to encode.
+	 */
+	strm_off        = data_offset + hdr->ecs_offset;
+	hw_strm_off     = strm_off & ~0xfU;
+	strm_start_byte = strm_off & 0xfU;
+	strm_len_blks   = (ALIGN(payload - hw_strm_off, 16) - 1) >> 4;
+
+	ret = vdpu720_fill_regs(ctx, hdr, ctx->table_base.dma,
+				src_dma + hw_strm_off, strm_start_byte,
+				strm_len_blks, dst_dma);
+	if (ret)
+		return ret;
+
+	if (hdr->frame.num_components == 1) {
+		ret = vdpu720_fill_chroma(ctx, dst_buf);
+		if (ret)
+			return ret;
+	}
+
+	rkjpegd_arm_watchdog(jpegd);
+
+	/*
+	 * A frame whose entropy data ends early runs the decoder off the end
+	 * of the stream, and with the condition masked it waits instead of
+	 * reporting.  VDPU720_ERR_MASK already covers the status.
+	 */
+	rkjpegd_write(jpegd,
+		      VDPU720_DEC_E | VDPU720_TIMEOUT_E | VDPU720_BUF_EMPTY_E,
+		      VDPU720_REG_INT);
+
+	return 0;
+}
+
+static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
+{
+	struct rkjpegd_dev *jpegd = dev_id;
+	enum vb2_buffer_state state;
+	irqreturn_t ret = IRQ_NONE;
+	u32 status;
+
+	/* The registers are only clocked while the device is runtime active. */
+	if (pm_runtime_get_if_active(jpegd->dev) <= 0)
+		return IRQ_NONE;
+
+	status = rkjpegd_read(jpegd, VDPU720_REG_INT);
+
+	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
+	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT);
+
+	if (!(status & VDPU720_IRQ_RAW))
+		goto out_put;
+
+	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
+
+	state = (status & VDPU720_ERR_MASK) ?
+		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
+
+	/*
+	 * A block that did not park itself wedges on the next frame, and a
+	 * clean frame can leave it unparked too, as SOFT_RST_RDY shows.  The
+	 * reset sleeps, so leave it to rkjpegd_vdpu720_run().  The next job
+	 * is only started after job_spinlock has released this one, which
+	 * orders the store.
+	 */
+	if (state == VB2_BUF_STATE_ERROR || !(status & VDPU720_SOFT_RST_RDY))
+		jpegd->needs_reset = true;
+
+	if (status & VDPU720_DEC_ERR) {
+		u32 mcu_pos  = rkjpegd_read(jpegd, VDPU720_REG_DBG_MCU_POS);
+		u32 err_info = rkjpegd_read(jpegd, VDPU720_REG_DBG_ERROR);
+
+		dev_warn_ratelimited(jpegd->dev,
+				     "decode error: MCU pos=(%u,%u) flags=0x%04x [%s%s%s%s%s%s%s%s%s%s] first_idx=%u\n",
+				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_X, mcu_pos),
+				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_Y, mcu_pos),
+				     (u32)FIELD_GET(VDPU720_DERR_FLAGS, err_info),
+				     (err_info & VDPU720_DERR_DRI_SEQ)     ? "dri_seq "    : "",
+				     (err_info & VDPU720_DERR_STREAM_FFFF) ? "ffff "       : "",
+				     (err_info & VDPU720_DERR_OTHER_MARK)  ? "bad_mark "   : "",
+				     (err_info & VDPU720_DERR_MCU_CNT_L)   ? "dri_early "  : "",
+				     (err_info & VDPU720_DERR_MCU_CNT_M)   ? "dri_late "   : "",
+				     (err_info & VDPU720_DERR_EOI_NO_END)  ? "eoi_early "  : "",
+				     (err_info & VDPU720_DERR_END_NO_EOI)  ? "no_eoi "     : "",
+				     (err_info & VDPU720_DERR_OVERFLOW)    ? "overflow "   : "",
+				     (err_info & VDPU720_DERR_HUFF_EMPTY)  ? "huff_empty " : "",
+				     (err_info & (VDPU720_DERR_STREAM_R0 |
+						  VDPU720_DERR_STREAM_R1)) ? "stream_mark " : "",
+				     (u32)FIELD_GET(VDPU720_DERR_FIRST_IDX, err_info));
+
+		rkjpegd_write(jpegd, err_info, VDPU720_REG_DBG_ERROR);
+	}
+
+	rkjpegd_irq_done(jpegd, state);
+	ret = IRQ_HANDLED;
+
+out_put:
+	pm_runtime_put_autosuspend(jpegd->dev);
+
+	return ret;
+}
+
+/**
+ * rkjpegd_abort_job() - take a running job away from the hardware
+ * @jpegd:	device whose current job is to be ended
+ *
+ * Resets the block and hands the frame back as an error even if it did
+ * complete: the reset went through underneath it and cleared the interrupt
+ * that would have said so.  The interrupt is masked across the sequence so a
+ * completion arriving in the middle cannot finish the job a second time.
+ *
+ * The caller must have stopped the watchdog from firing first.  Which of the
+ * two completes a job is decided by the cancel_delayed_work() in
+ * rkjpegd_irq_done(), so a watchdog that is still armed makes this racy.
+ */
+static void rkjpegd_abort_job(struct rkjpegd_dev *jpegd)
+{
+	struct rkjpegd_ctx *ctx;
+
+	disable_irq(jpegd->irq);
+
+	ctx = v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
+	if (ctx) {
+		rkjpegd_vdpu720_reset(ctx);
+		rkjpegd_job_finish(ctx, VB2_BUF_STATE_ERROR);
+	}
+
+	enable_irq(jpegd->irq);
+}
+
+static void rkjpegd_watchdog(struct work_struct *work)
+{
+	struct rkjpegd_dev *jpegd = container_of(to_delayed_work(work),
+						 struct rkjpegd_dev,
+						 watchdog_work);
+
+	if (!v4l2_m2m_get_curr_priv(jpegd->m2m_dev))
+		return;
+
+	dev_err(jpegd->dev, "frame processing timed out\n");
+
+	/* After RKJPEGD_TIMEOUT_MS the frame is an error, completed or not. */
+	rkjpegd_abort_job(jpegd);
+}
+
+/**
+ * rkjpegd_source_change() - report a resolution change to userspace
+ * @ctx:	context the coded buffer belongs to
+ * @src_buf:	coded buffer whose header the new resolution is taken from
+ *
+ * Renegotiates the capture format from @src_buf and reports it, unless it
+ * already describes what was negotiated or @src_buf is a refused frame past
+ * the first of the stream.  Sets @rkjpegd_ctx.source_change,
+ * which stops rkjpegd_job_ready() from letting any further job run until
+ * decoding is resumed.
+ *
+ * Called both when a coded buffer is queued and when one reaches the head of
+ * the queue, see the comments at those two call sites.
+ *
+ * Return: true if a change was reported.
+ */
+static bool rkjpegd_source_change(struct rkjpegd_ctx *ctx,
+				  struct rkjpegd_src_buf *src_buf)
+{
+	u32 width, height, buf_width, buf_height;
+
+	if (src_buf->parsed) {
+		width = src_buf->header.frame.width;
+		height = src_buf->header.frame.height;
+	} else {
+		/*
+		 * A refused frame has no dimensions, but an application waiting
+		 * on V4L2_FMT_FLAG_DYN_RESOLUTION for the first one needs the
+		 * event anyway.  Later ones are only failed.
+		 */
+		width = ctx->src_fmt.width;
+		height = ctx->src_fmt.height;
+	}
+	buf_width = ALIGN(width, RKJPEGD_RAW_STEP);
+	buf_height = ALIGN(height, RKJPEGD_RAW_STEP);
+
+	mutex_lock(&ctx->fmt_lock);
+
+	if (!ctx->initial_source_change &&
+	    (!src_buf->parsed ||
+	     (ctx->dst_fmt.width == buf_width &&
+	      ctx->dst_fmt.height == buf_height &&
+	      ctx->crop.width == width && ctx->crop.height == height))) {
+		mutex_unlock(&ctx->fmt_lock);
+		return false;
+	}
+
+	rkjpegd_fill_raw_fmt(&ctx->dst_fmt, buf_width, buf_height);
+	ctx->crop.left = 0;
+	ctx->crop.top = 0;
+	ctx->crop.width = width;
+	ctx->crop.height = height;
+	ctx->source_change = true;
+	ctx->initial_source_change = false;
+
+	mutex_unlock(&ctx->fmt_lock);
+
+	dev_dbg(ctx->dev->dev, "source change to %ux%u\n", width, height);
+
+	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);
+
+	return true;
+}
+
+static void rkjpegd_device_run(void *priv)
+{
+	struct rkjpegd_ctx *ctx = priv;
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	struct vb2_v4l2_buffer *src, *dst;
+	int ret;
+
+	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	if (WARN_ON(!src) || WARN_ON(!dst))
+		return;
+
+	/* While decoding, a resolution change is only looked for here. */
+	if (rkjpegd_source_change(ctx, vb2_to_rkjpegd_src_buf(&src->vb2_buf))) {
+		/*
+		 * Hand dst back as the LAST buffer, but keep src, it is decoded
+		 * once decoding resumes.  A resolution change is not a drain, so
+		 * the mem2mem drain state is left alone: rkjpegd_job_ready()
+		 * holds the jobs back instead.
+		 */
+		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		rkjpegd_last_buffer_done(ctx, dst);
+		v4l2_m2m_job_finish(jpegd->m2m_dev, ctx->fh.m2m_ctx);
+		return;
+	}
+
+	ret = pm_runtime_resume_and_get(jpegd->dev);
+	if (ret < 0)
+		goto err_finish;
+
+	v4l2_m2m_buf_copy_metadata(src, dst);
+
+	ret = rkjpegd_vdpu720_run(ctx);
+	if (ret)
+		goto err_pm_put;
+
+	return;
+
+err_pm_put:
+	pm_runtime_put_autosuspend(jpegd->dev);
+err_finish:
+	rkjpegd_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
+}
+
+static int rkjpegd_job_ready(void *priv)
+{
+	struct rkjpegd_ctx *ctx = priv;
+
+	return ctx->source_change ? 0 : 1;
+}
+
+static const struct v4l2_m2m_ops rkjpegd_m2m_ops = {
+	.device_run = rkjpegd_device_run,
+	.job_ready = rkjpegd_job_ready,
+};
+
+/*
+ * Bitstream inspection
+ *
+ * The header is parsed when the buffer is queued rather than when the job
+ * runs: the resolution it carries is what a source change reports, and the
+ * references it hands out point into the payload, which stays mapped until
+ * the buffer is given back.
+ */
+
+/**
+ * rkjpegd_has_eoi() - look for the end of image marker of a frame
+ * @data:	the frame
+ * @start:	offset of the entropy coded data in @data
+ * @len:	length of @data
+ *
+ * v4l2_jpeg_parse_header() never looks behind the start of scan, so a
+ * truncated frame parses without an error and decodes into a half filled
+ * picture.  An end of image marker cannot appear inside the entropy coded
+ * data, so finding one behind @start means the frame is complete.
+ *
+ * The buffer is uncached, so it is copied out in small chunks, not scanned
+ * as a whole.  Trailing padding, 0x00 and 0xff, is skipped at any length;
+ * behind it the marker is looked for in the last sizeof(tail) bytes.
+ *
+ * Return: true if the frame has an end of image marker.
+ */
+static bool rkjpegd_has_eoi(const void *data, u32 start, u32 len)
+{
+	u8 tail[128];
+	u32 n, i;
+
+	while (len > start) {
+		n = min_t(u32, len - start, sizeof(tail));
+		memcpy(tail, data + len - n, n);
+
+		for (i = n; i && (tail[i - 1] == 0x00 || tail[i - 1] == 0xff); i--)
+			;
+
+		len -= n - i;
+		if (i)
+			break;
+	}
+
+	n = min_t(u32, len - start, sizeof(tail));
+	memcpy(tail, data + len - n, n);
+
+	for (i = 0; i + 1 < n; i++)
+		if (tail[i] == 0xff && tail[i + 1] == 0xd9)
+			return true;
+
+	return false;
+}
+
+static bool rkjpegd_header_supported(struct rkjpegd_dev *jpegd,
+				     const struct v4l2_jpeg_header *header,
+				     u32 len)
+{
+	if (header->frame.width < RKJPEGD_MIN_WIDTH ||
+	    header->frame.height < RKJPEGD_MIN_HEIGHT ||
+	    header->frame.width > RKJPEGD_MAX_SIZE ||
+	    header->frame.height > RKJPEGD_MAX_SIZE) {
+		dev_err_ratelimited(jpegd->dev,
+				    "unsupported JPEG picture size %ux%u, not within %ux%u..%ux%u\n",
+				    header->frame.width, header->frame.height,
+				    RKJPEGD_MIN_WIDTH, RKJPEGD_MIN_HEIGHT,
+				    RKJPEGD_MAX_SIZE, RKJPEGD_MAX_SIZE);
+		return false;
+	}
+
+	/* The register programming always asks for eight bit samples. */
+	if (header->frame.precision != 8) {
+		dev_err_ratelimited(jpegd->dev,
+				    "unsupported JPEG sample precision %u\n",
+				    header->frame.precision);
+		return false;
+	}
+
+	if (header->frame.num_components != 1 &&
+	    header->frame.num_components != 3) {
+		dev_err_ratelimited(jpegd->dev,
+				    "unsupported JPEG component count %u\n",
+				    header->frame.num_components);
+		return false;
+	}
+
+	/* The output is NV12 only and the block has no RGB mode. */
+	if (header->frame.num_components == 3 &&
+	    header->app14_tf == V4L2_JPEG_APP14_TF_CMYK_RGB) {
+		dev_err_ratelimited(jpegd->dev,
+				    "unsupported RGB JPEG, Adobe APP14 transform 0\n");
+		return false;
+	}
+
+	if (header->scan->num_components != header->frame.num_components) {
+		dev_err_ratelimited(jpegd->dev,
+				    "JPEG scan covers %u of %u components, non interleaved scans are not supported\n",
+				    header->scan->num_components,
+				    header->frame.num_components);
+		return false;
+	}
+
+	if (header->ecs_offset >= len) {
+		dev_err_ratelimited(jpegd->dev,
+				    "JPEG entropy coded data starts beyond the payload\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool rkjpegd_parse_header(struct rkjpegd_dev *jpegd,
+				 struct rkjpegd_src_buf *src_buf,
+				 void *data, u32 len)
+{
+	int ret;
+
+	ret = v4l2_jpeg_parse_header(data, len, &src_buf->header);
+	if (ret < 0) {
+		dev_warn_ratelimited(jpegd->dev,
+				     "failed to parse JPEG header: %d (len=%u first_bytes=%*ph)\n",
+				     ret, len, min_t(int, len, 8), data);
+		return false;
+	}
+
+	if (!rkjpegd_header_supported(jpegd, &src_buf->header, len))
+		return false;
+
+	if (!rkjpegd_has_eoi(data, src_buf->header.ecs_offset, len)) {
+		dev_err_ratelimited(jpegd->dev,
+				    "truncated JPEG, no end of image marker at the end of the %u byte payload (buffer too small?)\n",
+				    len);
+		return false;
+	}
+
+	return true;
+}
+
+static void rkjpegd_parse_src_buf(struct rkjpegd_ctx *ctx,
+				  struct vb2_buffer *vb)
+{
+	struct rkjpegd_src_buf *src_buf = vb2_to_rkjpegd_src_buf(vb);
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	u32 data_offset = vb->planes[0].data_offset;
+	u32 len = vb2_get_plane_payload(vb, 0);
+	void *data = vb2_plane_vaddr(vb, 0);
+	int ret;
+
+	memset(&src_buf->header, 0, sizeof(src_buf->header));
+	memset(&src_buf->scan, 0, sizeof(src_buf->scan));
+	memset(src_buf->quantization_tables, 0,
+	       sizeof(src_buf->quantization_tables));
+	memset(src_buf->huffman_tables, 0, sizeof(src_buf->huffman_tables));
+	src_buf->header.scan = &src_buf->scan;
+	src_buf->header.quantization_tables = src_buf->quantization_tables;
+	src_buf->header.huffman_tables = src_buf->huffman_tables;
+	src_buf->parsed = false;
+
+	if (!data) {
+		dev_err_ratelimited(jpegd->dev,
+				    "JPEG buffer has no kernel mapping\n");
+		return;
+	}
+
+	if (len <= data_offset || len - data_offset < 4) {
+		dev_err_ratelimited(jpegd->dev,
+				    "JPEG payload of %u bytes is too short\n",
+				    len);
+		return;
+	}
+
+	ret = rkjpegd_begin_cpu_access(vb, DMA_FROM_DEVICE);
+	if (ret) {
+		dev_err_ratelimited(jpegd->dev,
+				    "cannot access JPEG buffer: %d\n", ret);
+		return;
+	}
+
+	src_buf->parsed = rkjpegd_parse_header(jpegd, src_buf,
+					       data + data_offset,
+					       len - data_offset);
+
+	rkjpegd_end_cpu_access(vb, DMA_FROM_DEVICE);
+}
+
+static int rkjpegd_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
+			       unsigned int *num_planes, unsigned int sizes[],
+			       struct device *alloc_devs[])
+{
+	struct rkjpegd_ctx *ctx = vb2_get_drv_priv(vq);
+	u32 sizeimage;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
+		sizeimage = ctx->src_fmt.plane_fmt[0].sizeimage;
+	} else {
+		mutex_lock(&ctx->fmt_lock);
+		sizeimage = ctx->dst_fmt.plane_fmt[0].sizeimage;
+		mutex_unlock(&ctx->fmt_lock);
+	}
+
+	if (*num_planes) {
+		if (*num_planes != 1)
+			return -EINVAL;
+		if (sizes[0] < sizeimage)
+			return -EINVAL;
+	} else {
+		*num_planes = 1;
+		sizes[0] = sizeimage;
+	}
+
+	/*
+	 * The first frame must report its resolution even when it matches,
+	 * whether REQBUFS or CREATE_BUFS allocates the queue.
+	 */
+	if (V4L2_TYPE_IS_OUTPUT(vq->type) && !vb2_get_num_buffers(vq)) {
+		mutex_lock(&ctx->fmt_lock);
+		ctx->initial_source_change = true;
+		mutex_unlock(&ctx->fmt_lock);
+	}
+
+	return 0;
+}
+
+static int rkjpegd_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int rkjpegd_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct rkjpegd_ctx *ctx = vb2_get_drv_priv(vq);
+	bool source_change;
+	u32 sizeimage;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
+		if (vb2_plane_size(vb, 0) < ctx->src_fmt.plane_fmt[0].sizeimage)
+			return -EINVAL;
+
+		return 0;
+	}
+
+	/* The core's LAST buffers go back with whatever was set here. */
+	to_vb2_v4l2_buffer(vb)->field = V4L2_FIELD_NONE;
+
+	mutex_lock(&ctx->fmt_lock);
+	source_change = ctx->source_change;
+	sizeimage = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	mutex_unlock(&ctx->fmt_lock);
+
+	/*
+	 * A buffer queued while streaming with a change pending has the old
+	 * size and carries no picture; stop_streaming() hands it back.  One
+	 * queued while not streaming belongs to the new format.
+	 */
+	if (source_change && vb2_is_streaming(vq))
+		return 0;
+
+	if (vb2_plane_size(vb, 0) < sizeimage)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void rkjpegd_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkjpegd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
+		if (vb2_is_streaming(vb->vb2_queue) &&
+		    v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
+			rkjpegd_last_buffer_done(ctx, vbuf);
+			v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
+			return;
+		}
+
+		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+		return;
+	}
+
+	rkjpegd_parse_src_buf(ctx, vb);
+
+	/*
+	 * The first frame of a stream is reported here, where no job can run
+	 * without a streaming capture queue.  Once it streams,
+	 * rkjpegd_device_run() does it, serialised with the job completion.
+	 * Renegotiating behind undecoded frames would pull the capture queue
+	 * out from under them.
+	 */
+	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
+	    !v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx))
+		rkjpegd_source_change(ctx, vb2_to_rkjpegd_src_buf(vb));
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int rkjpegd_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct rkjpegd_ctx *ctx = vb2_get_drv_priv(vq);
+
+	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, vq);
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
+		ctx->sequence_out = 0;
+	} else {
+		ctx->sequence_cap = 0;
+		mutex_lock(&ctx->fmt_lock);
+		ctx->source_change = false;
+		ctx->initial_source_change = false;
+		mutex_unlock(&ctx->fmt_lock);
+	}
+
+	return 0;
+}
+
+static void rkjpegd_stop_streaming(struct vb2_queue *vq)
+{
+	struct rkjpegd_ctx *ctx = vb2_get_drv_priv(vq);
+	struct vb2_v4l2_buffer *vbuf;
+
+	for (;;) {
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		if (!vbuf)
+			break;
+		if (V4L2_TYPE_IS_CAPTURE(vq->type))
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	}
+
+	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
+
+	/* A seek also ends a drain a resolution change had cut short. */
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		ctx->fh.m2m_ctx->last_src_buf = NULL;
+	else
+		rkjpegd_resume_drain(ctx);
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type) &&
+	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
+		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
+}
+
+static const struct vb2_ops rkjpegd_queue_ops = {
+	.queue_setup = rkjpegd_queue_setup,
+	.buf_out_validate = rkjpegd_buf_out_validate,
+	.buf_prepare = rkjpegd_buf_prepare,
+	.buf_queue = rkjpegd_buf_queue,
+	.start_streaming = rkjpegd_start_streaming,
+	.stop_streaming = rkjpegd_stop_streaming,
+};
+
+static int rkjpegd_queue_init(void *priv, struct vb2_queue *src_vq,
+			      struct vb2_queue *dst_vq)
+{
+	struct rkjpegd_ctx *ctx = priv;
+	struct rkjpegd_dev *jpegd = ctx->dev;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->ops = &rkjpegd_queue_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->buf_struct_size = sizeof(struct rkjpegd_src_buf);
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &jpegd->vdev_lock;
+	src_vq->dev = jpegd->v4l2_dev.dev;
+
+	/*
+	 * Mostly sequential access, so trade TLB efficiency for allocation
+	 * speed.  Both queues keep their kernel mapping.
+	 */
+	src_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->ops = &rkjpegd_queue_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &jpegd->vdev_lock;
+	dst_vq->dev = jpegd->v4l2_dev.dev;
+	dst_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int rkjpegd_open(struct file *filp)
+{
+	struct rkjpegd_dev *jpegd = video_drvdata(filp);
+	struct rkjpegd_ctx *ctx;
+	int ret;
+
+	ctx = kzalloc_obj(*ctx);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = jpegd;
+	mutex_init(&ctx->fmt_lock);
+	rkjpegd_reset_fmts(ctx);
+	v4l2_fh_init(&ctx->fh, video_devdata(filp));
+
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(jpegd->m2m_dev, ctx,
+					    rkjpegd_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		goto err_free_ctx;
+	}
+
+	ret = rkjpegd_vdpu720_init(ctx);
+	if (ret)
+		goto err_cleanup_m2m_ctx;
+
+	v4l2_fh_add(&ctx->fh, filp);
+
+	return 0;
+
+err_cleanup_m2m_ctx:
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+err_free_ctx:
+	v4l2_fh_exit(&ctx->fh);
+	mutex_destroy(&ctx->fmt_lock);
+	kfree(ctx);
+
+	return ret;
+}
+
+static int rkjpegd_release(struct file *filp)
+{
+	struct rkjpegd_ctx *ctx = file_to_rkjpegd_ctx(filp);
+
+	v4l2_fh_del(&ctx->fh, filp);
+
+	/* rkjpegd_remove() may be waiting on this context, under the lock. */
+	mutex_lock(&ctx->dev->vdev_lock);
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	mutex_unlock(&ctx->dev->vdev_lock);
+	rkjpegd_vdpu720_exit(ctx);
+	v4l2_fh_exit(&ctx->fh);
+	mutex_destroy(&ctx->fmt_lock);
+	kfree(ctx);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations rkjpegd_fops = {
+	.owner = THIS_MODULE,
+	.open = rkjpegd_open,
+	.release = rkjpegd_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static void rkjpegd_free(struct kref *ref)
+{
+	struct rkjpegd_dev *jpegd = container_of(ref, struct rkjpegd_dev, ref);
+
+	mutex_destroy(&jpegd->vdev_lock);
+	kfree(jpegd);
+}
+
+static void rkjpegd_put(void *data)
+{
+	struct rkjpegd_dev *jpegd = data;
+
+	kref_put(&jpegd->ref, rkjpegd_free);
+}
+
+/**
+ * rkjpegd_vdev_release() - tear down the V4L2 side once the last user is gone
+ * @vdev:	the video device embedded in the rkjpegd_dev being released
+ */
+static void rkjpegd_vdev_release(struct video_device *vdev)
+{
+	struct rkjpegd_dev *jpegd = container_of(vdev, struct rkjpegd_dev, vdev);
+
+	v4l2_device_unregister(&jpegd->v4l2_dev);
+	v4l2_m2m_release(jpegd->m2m_dev);
+	media_device_cleanup(&jpegd->mdev);
+	rkjpegd_put(jpegd);
+}
+
+/**
+ * rkjpegd_vdev_unregister() - unregister the video device and end its jobs
+ * @jpegd:	the device whose video device is registered
+ *
+ * An open file keeps the mem2mem device alive past this, but the running
+ * job has completed and no other one is started once this returns.
+ */
+static void rkjpegd_vdev_unregister(struct rkjpegd_dev *jpegd)
+{
+	/* The release callback frees m2m_dev, which is still needed below. */
+	get_device(&jpegd->vdev.dev);
+
+	mutex_lock(&jpegd->vdev_lock);
+	video_unregister_device(&jpegd->vdev);
+
+	/*
+	 * Let the running job finish and start no new one.  The lock keeps
+	 * rkjpegd_release() from freeing the context this waits on.
+	 */
+	v4l2_m2m_suspend(jpegd->m2m_dev);
+	mutex_unlock(&jpegd->vdev_lock);
+
+	cancel_delayed_work_sync(&jpegd->watchdog_work);
+
+	put_device(&jpegd->vdev.dev);
+}
+
+/**
+ * rkjpegd_v4l2_init() - bring up the V4L2, mem2mem and media devices
+ * @jpegd:	the device to register
+ *
+ * Return: 0 on success, or a negative errno with everything set up here
+ * undone.
+ */
+static int rkjpegd_v4l2_init(struct rkjpegd_dev *jpegd)
+{
+	int ret;
+
+	ret = v4l2_device_register(jpegd->dev, &jpegd->v4l2_dev);
+	if (ret) {
+		dev_err(jpegd->dev, "failed to register V4L2 device\n");
+		return ret;
+	}
+
+	jpegd->m2m_dev = v4l2_m2m_init(&rkjpegd_m2m_ops);
+	if (IS_ERR(jpegd->m2m_dev)) {
+		v4l2_err(&jpegd->v4l2_dev, "failed to init mem2mem device\n");
+		ret = PTR_ERR(jpegd->m2m_dev);
+		goto err_unregister_v4l2;
+	}
+
+	jpegd->mdev.dev = jpegd->dev;
+	strscpy(jpegd->mdev.model, RKJPEGD_NAME, sizeof(jpegd->mdev.model));
+	media_device_init(&jpegd->mdev);
+	jpegd->v4l2_dev.mdev = &jpegd->mdev;
+
+	jpegd->vdev.lock = &jpegd->vdev_lock;
+	jpegd->vdev.v4l2_dev = &jpegd->v4l2_dev;
+	jpegd->vdev.fops = &rkjpegd_fops;
+	jpegd->vdev.release = rkjpegd_vdev_release;
+	jpegd->vdev.vfl_dir = VFL_DIR_M2M;
+	jpegd->vdev.device_caps = V4L2_CAP_STREAMING |
+				  V4L2_CAP_VIDEO_M2M_MPLANE;
+	jpegd->vdev.ioctl_ops = &rkjpegd_ioctl_ops;
+	video_set_drvdata(&jpegd->vdev, jpegd);
+	strscpy(jpegd->vdev.name, RKJPEGD_NAME, sizeof(jpegd->vdev.name));
+
+	/* Dropped by rkjpegd_vdev_release(). */
+	kref_get(&jpegd->ref);
+
+	ret = video_register_device(&jpegd->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		v4l2_err(&jpegd->v4l2_dev, "failed to register video device\n");
+		rkjpegd_put(jpegd);
+		goto err_cleanup_mc;
+	}
+
+	ret = v4l2_m2m_register_media_controller(jpegd->m2m_dev, &jpegd->vdev,
+						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
+	if (ret) {
+		v4l2_err(&jpegd->v4l2_dev,
+			 "failed to init V4L2 M2M media controller\n");
+		goto err_unregister_vdev;
+	}
+
+	ret = media_device_register(&jpegd->mdev);
+	if (ret) {
+		v4l2_err(&jpegd->v4l2_dev, "failed to register media device\n");
+		goto err_unregister_mc;
+	}
+
+	return 0;
+
+	/*
+	 * Past a successful video_register_device() unregistering is the whole
+	 * unwind, the release callback does the rest.  The two cannot be
+	 * joined.  The node may already be open with a job running.
+	 */
+err_unregister_mc:
+	v4l2_m2m_unregister_media_controller(jpegd->m2m_dev);
+err_unregister_vdev:
+	rkjpegd_vdev_unregister(jpegd);
+
+	return ret;
+
+err_cleanup_mc:
+	media_device_cleanup(&jpegd->mdev);
+	v4l2_m2m_release(jpegd->m2m_dev);
+err_unregister_v4l2:
+	v4l2_device_unregister(&jpegd->v4l2_dev);
+
+	return ret;
+}
+
+static void rkjpegd_v4l2_cleanup(struct rkjpegd_dev *jpegd)
+{
+	media_device_unregister(&jpegd->mdev);
+	v4l2_m2m_unregister_media_controller(jpegd->m2m_dev);
+	rkjpegd_vdev_unregister(jpegd);
+}
+
+static int rkjpegd_probe(struct platform_device *pdev)
+{
+	struct rkjpegd_dev *jpegd;
+	unsigned int i;
+	int ret;
+
+	jpegd = kzalloc_obj(*jpegd);
+	if (!jpegd)
+		return -ENOMEM;
+
+	kref_init(&jpegd->ref);
+	jpegd->dev = &pdev->dev;
+	platform_set_drvdata(pdev, jpegd);
+	mutex_init(&jpegd->vdev_lock);
+	spin_lock_init(&jpegd->drain_lock);
+	INIT_DELAYED_WORK(&jpegd->watchdog_work, rkjpegd_watchdog);
+
+	/* Registered first so that it runs after every other devres release. */
+	ret = devm_add_action_or_reset(&pdev->dev, rkjpegd_put, jpegd);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < RKJPEGD_NUM_CLOCKS; i++)
+		jpegd->clocks[i].id = rkjpegd_clk_names[i];
+
+	ret = devm_clk_bulk_get(&pdev->dev, RKJPEGD_NUM_CLOCKS, jpegd->clocks);
+	if (ret)
+		return ret;
+
+	jpegd->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(jpegd->resets))
+		return dev_err_probe(&pdev->dev, PTR_ERR(jpegd->resets),
+				     "failed to get resets\n");
+
+	jpegd->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(jpegd->regs))
+		return PTR_ERR(jpegd->regs);
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to set DMA mask\n");
+
+	jpegd->irq = platform_get_irq(pdev, 0);
+	if (jpegd->irq < 0)
+		return jpegd->irq;
+
+	ret = devm_request_irq(&pdev->dev, jpegd->irq, rkjpegd_vdpu720_irq, 0,
+			       dev_name(&pdev->dev), jpegd);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = reset_control_deassert(jpegd->resets);
+	if (ret) {
+		ret = dev_err_probe(&pdev->dev, ret,
+				    "failed to deassert resets\n");
+		goto err_disable_pm;
+	}
+
+	ret = rkjpegd_v4l2_init(jpegd);
+	if (ret)
+		goto err_assert_reset;
+
+	return 0;
+
+err_assert_reset:
+	reset_control_assert(jpegd->resets);
+err_disable_pm:
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void rkjpegd_remove(struct platform_device *pdev)
+{
+	struct rkjpegd_dev *jpegd = platform_get_drvdata(pdev);
+
+	rkjpegd_v4l2_cleanup(jpegd);
+
+	reset_control_assert(jpegd->resets);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+/*
+ * The clocks follow the runtime PM state, so the block is only clocked while
+ * a job holds a reference to it.  rkjpegd_job_finish() drops that reference
+ * from the interrupt handler, which is safe because the put is asynchronous:
+ * the callback below runs from the PM workqueue, where it may sleep.
+ *
+ * A system transition is not the same.  pm_runtime_force_suspend() calls the
+ * runtime suspend callback whatever the usage count says, so genpd drops the
+ * domain under a job that is still running: userspace is frozen by then, but
+ * a decode started just before the freeze is not, and it has until the
+ * watchdog expires to finish.  Park the mem2mem queue first and wait the
+ * running job out.  That wait is bounded by the same watchdog, which runs on
+ * the unfreezable system workqueue and hands the job back either way.
+ *
+ * The queue has to come back either way as well.  A device whose suspend
+ * returned an error is never handed to the resume callback.
+ */
+static int rkjpegd_runtime_suspend(struct device *dev)
+{
+	struct rkjpegd_dev *jpegd = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(RKJPEGD_NUM_CLOCKS, jpegd->clocks);
+
+	return 0;
+}
+
+static int rkjpegd_runtime_resume(struct device *dev)
+{
+	struct rkjpegd_dev *jpegd = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(RKJPEGD_NUM_CLOCKS, jpegd->clocks);
+}
+
+static int rkjpegd_suspend(struct device *dev)
+{
+	struct rkjpegd_dev *jpegd = dev_get_drvdata(dev);
+	int ret;
+
+	v4l2_m2m_suspend(jpegd->m2m_dev);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(jpegd->m2m_dev);
+
+	return ret;
+}
+
+static int rkjpegd_resume(struct device *dev)
+{
+	struct rkjpegd_dev *jpegd = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+
+	v4l2_m2m_resume(jpegd->m2m_dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops rkjpegd_pm_ops = {
+	RUNTIME_PM_OPS(rkjpegd_runtime_suspend, rkjpegd_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rkjpegd_suspend, rkjpegd_resume)
+};
+
+static const struct of_device_id of_rkjpegd_match[] = {
+	{ .compatible = "rockchip,rk3568-jpegd" },
+	{ .compatible = "rockchip,rk3588-jpegd" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_rkjpegd_match);
+
+static struct platform_driver rkjpegd_driver = {
+	.probe = rkjpegd_probe,
+	.remove = rkjpegd_remove,
+	.driver = {
+		.name = RKJPEGD_NAME,
+		.of_match_table = of_rkjpegd_match,
+		.pm = pm_ptr(&rkjpegd_pm_ops),
+	},
+};
+module_platform_driver(rkjpegd_driver);
+
+MODULE_DESCRIPTION("Rockchip JPEG decoder driver");
+MODULE_AUTHOR("Lucas Sinn <lucas.sinn@wolfvision.net>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DMA_BUF");

-- 
2.47.3

