Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F83D3563FA;
	Fri, 16 Oct 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166793; cv=none; b=KL7Db1G8+wPN2e/UhF/0FdyA9tgvn99cTAiki8xwLTKrbN1OctP9OcKS2RDyPXz2BguESoIgnZGYKz9ZiGh8GMJXWUtgiTo5I+a/TvtHElz1jGuS31BFjmBrqr3SjXuuhakE0J7DdIMyOAUObvsrDXrgGmoga5gPhaQ9U9WRzGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166793; c=relaxed/simple;
	bh=IBtZzXwQvWYyPp9KNt7r3i29P6yOlwAcjg5n5lOQ0TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Khw++JUcVg9TAmALQPCqmoeerpf34UeJidZ88TJdOf+pXoTGZvf50KgkTN+PQfqZXGafYkPMrf6IGlPYGJTb7D/QYxJh+FB/Sps6s34iNPHCFg5j5DZVc5l5fr6J//tCynqb1yKu5jXzXFl5N0ccwm6TiqWgtomgwO6HcKnYa6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xHkRd-0000000085t-2pQA;
	Fri, 16 Oct 2026 16:06:09 +0000
Date: Fri, 16 Oct 2026 17:06:06 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com,
	xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: rockchip: rkisp2: Add driver for ISP on
 Rk3588
Message-ID: <atJLbtG3cGDOWMSx@makrotopia.org>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>

On Thu, Aug 27, 2026 at 07:48:29PM +0900, Paul Elder wrote:
> Hello everyone!
>
> This patch series adds a new rkisp2 driver that aims to support all
> Rockchip 2.x and 3.x series ISPs. Here we add support for the version on
> the RK3588, which as far as I'm aware is a 3.0.
[...]

Hi Paul,

I have been running this series on the RV1126, whose ISP is a 2.0, with
an IMX415 at 1920x1080 and 30 fps, through libcamera (your rkisp2
pipeline handler with a few changes) and through the raw readback path
fed from the VICAP driver. Most of the series works there as it is.
Below is a summary of the comments I sent on the individual patches,
followed by the list of changes the 2.0 needed, so that you can see
which of them are differences between the ISP versions and which may
affect the RK3588 as well. I have no RK3588, so every statement about
the 3.0 is by code inspection.

Summary of the per-patch comments
---------------------------------

Patch 1, driver:
- The ISP is not started when a raw readback node is started before
  the main or self path: pipe.start_count counts the readback nodes.
- The CR plane base address is never written, so the three-plane
  formats write their third plane to an unprogrammed address.
- The 4:2:0 capture formats name YUYV8_1_5X8 as media bus code, which
  the ISP source pads do not offer, so link validation fails for them.
- The MPFBC_CTRL format list has NV21M twice and lacks NV12M and
  YUV420.
- V4L2_ISP is not selected although patches 2 and 3 need it;
  V4L2_FWNODE and GENERIC_PHY_MIPI_DPHY are selected without a user.
- A full quantization range accepted on the source pad is never
  applied to the hardware (CSM_Y_FULL_ENA and CSM_C_FULL_ENA).
- The raw readback stop path releases the buffers without waiting for
  the read in progress.
- RKISP1_V30 is added to the rkisp1 uapi without a user, plus a few
  small items.

Patch 2, params:
- The params buffer consumed at stream start is never returned to user
  space.
- The resizer bypass test compares the luma size only, so an unscaled
  4:2:0 output gets one chroma row per luma row.
- The GOC handler tests mode against the segments enum.
- The resizer is left unprogrammed when the first params buffer has no
  CROP block, and the default crop without a params buffer is the
  top-left window of the frame.
- A missing cleanup on a registration failure and an undefined label
  in the documentation.

Patch 3, stats:
- The stats block table lists HIST_BIG1 twice, so HIST_BIG2 is lost.
- The AE lite and AWB blocks go out with stale payload and done flag
  when their status bit is not set.
- Smaller items, and a question about the 3A interrupt line.

Patch 5, dts:
- The isp0 node has three interrupts while the binding allows two.

Changes needed for the RV1126
-----------------------------
Full (draft-quality) tree at

https://github.com/dangowrt/linux/tree/rk-isp2-rv1126

These are commits on top of your v3. "2.0" below means what I observed
on the RV1126; where I know whether the 3.0 shares it, I say so.

1. Model description for the RV1126: three clocks, a third interrupt
   line for the CSI-2 receiver and raw read status (the handler only
   counts the receiver errors), 4416x3312 as maximum input size, plus
   the binding and dts entries. RV1126 specific.

2. SWS_CFG: keep the reset value and add only the frame drop disable
   bit; ACK_FRM_PRO_DIS is not defined on the 2.0. Whether the 3.0
   holds anything in that register that the current write clears I
   do not know (asked in patch 1).

3. Extra readback lines: the 2.0 does not finish the last lines of a
   frame it converts from Bayer to YUV out of memory unless the
   readback presents 24 lines more than the frame has. The lines are
   added to the readback buffer and picture size and to the ISP
   acquisition and output height, and cut off by the dual crop, which
   stays enabled for the YUV paths when the crop covers the frame.
   The vendor driver does this for the 2.0 only.

4. No image stabiliser on the 2.0: rkisp2_config_ism() is skipped by
   a model flag. The RK3588 keeps it, as your comment there says.

5. Bus priority and hurry bits in the upper part of ISP_CTRL, set on
   the 2.0 as the vendor driver does; without them the readback
   competes with the camera interface on equal terms. 2.0 specific as
   far as I know.

6. The word swap of the unpacked readback samples (LE_ALIGN) is made
   a model property: the RV1126 camera interface writes the samples in
   the order the 2.0 readback expects, and with the swap the chroma
   comes out as noise. Strictly this depends on what produced the
   buffer rather than on the ISP version.

7. VI_ISP_CLK_CTRL: rkisp2_config_clk() writes the register with the
   ISP1 bit names (ISP_3A | ISP_RAW). The 2.0 layout differs, and its
   bits 21 and 22 gate the memory read and raw read engines; left
   clear, the readback delivers exactly one frame after a reset and
   nothing afterwards. The vendor 2.0 driver writes 0x7fe009. I do not
   know the 3.0 layout.

8. The readback buffer is handed back from the ISP frame complete
   interrupt instead of the main or self path frame end: on the 2.0
   the main path frame end arrives about 10 ms before the readback
   engine has finished the frame, so the buffer went back to user
   space and the next base address was written while the frame was
   still being read. I do not know where the 3.0 finishes the read
   relative to the MI frame end.

9. Readback trigger ordering: on the 2.0 the CSI2RX_CTRL0 write that
   switches SW_IBUF_OP_MODE away from the reset value and sets
   SW_CSI2RX_EN at the same time loses its trigger in about 7 % of
   the stream starts (the mode is latched, the enable is dropped, no
   V_START follows). Writing the op mode with the enable clear before
   the MI configuration update that rkisp2_cap_stream_enable() issues,
   and starting the first buffer like every later one (base write,
   then the enable write), fixed it: 120 of 120 starts. I do not know
   whether the 3.0 shares this.

10. Resizer chroma subsampling for 4:2:0 output (patch 2 comment).

11. AWB measurement on the 2.0: its RAWAWB block does not have the
    weight RAM and the count RAM at the addresses the driver uses
    (the RAM read zeros in every mode I tried), so the AWB stats block
    stays empty. The 2.0 still has the white balance measurement of
    the ISP core, the rkisp1 style block, so I program that from the
    AWB_MEAS parameters (window spanning the 15x15 grid, RGB mode,
    the maximum limits as thresholds) and report its count and means
    in a new AWB_MEAN stats block. 2.0 specific.

12. CSM output range from the pad quantization (patch 1 comment).

13. CSC defaults: when user space sets only the colorspace with
    SET_CSC (libcamera does that for sYCC), I filled the other fields
    from the colorspace defaults. Re-reading subdev-formats.rst, a
    DEFAULT field keeps the received value by definition, so your
    code is right here and this is a libcamera matter.

14. 3A status at frame end (patch 3 question): leaving ISP3A_IMSC
    clear and reading ISP3A_RIS in rkisp2_stats_isr_eof() brought the
    ISP interrupt count from about 1400 per frame down to two.

15. Default crop covering the whole frame (patch 2 comment).

16. vb2_dma_contig_set_max_seg_size(dev, DMA_BIT_MASK(32)) in probe:
    the arm32 IOMMU DMA ops map an imported dmabuf in segments of the
    device's maximum segment size with separate IOVA allocations, so
    importing the readback buffers into the main path failed as not
    contiguous. Harmless on arm64; rkvdec does the same.

17. ISP reset on stop: on the 2.0 the IRCL ISP and MIPI reset pulse in
    rkisp2_isp_stop() does not clear the raw readback front end, and
    the next stream starts with the previous CSI2RX state and misses
    its first frame. The "isp" and "isp-rx-p" reset lines are
    asserted instead, as the vendor driver does in its stop path.
    RV1126 specific.

18. HIST_BIG2 stats table entry (patch 3 comment).

19. VICAP (rkcif) side: the unpacked raw output is written MSB
    aligned as the readback expects, the MIPI interrupts are masked
    while the receiver is powered, and a larger sizeimage is accepted
    so that the buffers carry the extra lines of item 3. The frames
    are handed to the readback inside the kernel through a small
    consumer interface of the rkcif driver, selected when the readback
    node's link to the ISP is disabled; this replaces the user space
    copy of every raw frame into the readback node that I started
    with. It is the RV1126 counterpart of the inline mode pad you
    reserved, except that the frames still go through memory.

Tested configuration: RV1126 with an IMX415 at 1920x1080 and 30 fps.
libcamera with cam and with GStreamer (libcamerasrc into the hantro
JPEG encoder), AE and AWB converging, two minutes at a constant 30 fps;
the readback path alone, 1974 frames in 66 s; 120 of 120 stream starts
delivering frames. The self path, 4K and raw output I have not tested.

Once the series has settled I can post the remainder of the above as
follow-up patches on top of it, if that suits you. The libcamera side
(VICAP entities taken from the media graph, start order, colour space
propagation, IMX415 tuning) is on a branch here as well and I can send
it to libcamera-devel.

Best regards,
Daniel
