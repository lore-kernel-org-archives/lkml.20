Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9004AB1C5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346732; cv=none; b=Exi4cYG0jaUfa53Zu/61RGmqUM2pKtUg7vibeA00h3Qyny2r8QPTp2ioSFyPjlrr+ubzEVm8lMzKKujPSMaPTryODn3jg86uwwbOb1YaipgiUKo1EdZzZFiZoO1XeTYcDgwhreUGiGumwtUfoz/wEmCbBaCi6a3uwDl7NQ3jzTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346732; c=relaxed/simple;
	bh=jPiPeuy0ZSyfvCcCSVktkLgVf3OTMYp+um1FECIC6oU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G6Wmixr5i8atRpszQiMRkYS439AV3jb9+Bm6IcJHst/qB2LfqiZeOD8hbzYmWX9SHOopr4jXkMlmyU74WSloGj5bTMx2ZFnze7MHbBlsX0C1YvbDynbBEur30JIwAxOp7Rt13cXEYZ+elrPUUB8tbAUFFw2wPF5JSMqW3h1OI5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Kribc5c6; arc=none smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Kribc5c6"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c2942718f87so37856466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790346716; x=1790951516; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQZjS7atIP8vDawCWzfi74uZa4w9KEezJqpA2fhv0zk=;
        b=Kribc5c6ue6vQ0WCtsV06NAvkFM6Xs4WF5R0MwKdayCfvIYSBfqz2V67j0K0HjoWve
         hQwTF1v8/cvhTvNkr8AsFvATnR9uQOhIlkDq+A6YG2VKGV9TTprMPmwwfAhaCdmpoXWw
         R1TvBaezYUnk89H9SLiWax7R4XY8UE063baZDKMyhyTNW7Ayn0SKQWjPz8sJWEKf8YCD
         frZuFy25+RIuXwgySBtvnQckVAZI0CGt62zAFrNYReVVFrY3vA+i6nWiEKLil0KLjDIv
         XXxTYjfPXD8wPsxCJgjDEAFVPgEgpJD0hmJFPYo6ces3ty4oSXOJYwuvQe0YXtdce+rS
         KNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346716; x=1790951516;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQZjS7atIP8vDawCWzfi74uZa4w9KEezJqpA2fhv0zk=;
        b=OIKe0rmbRWIy3XD+1vZs2JSkwNiRx1A3MEaF/SSDbHq15rEi+bMAVFCdaeufw7LbCu
         VnDHb/GyvBpaiHB+eTIKJ3hFKTmZsUEalRNlqygOycrnbjEpxYt4aofbNA3+8bFfsbmP
         HdDzCEL37JwS9UKBXuMSRWnJ5Ivqt0+oZjZMS2n6EdmyIEUz9YlX8OcIayRWFGjoZ7az
         0DzmVOE+T1WF9cuoMIyKYjURJgVg2j5r2zRfgp3HQ86p9qlDQwe5H7omO0rcmWHPRSjA
         gjELJAYONVu4DyomSyBvhRg0s5GvDeuwlxk1JwoRzo73KKp/ZLbTTv+WnZJNuL8LJM60
         0Cqw==
X-Forwarded-Encrypted: i=1; AKwUvByl+899OqdAUxMnUkOFG290DuhzLIuHqpynogCX/XQp44md2KbeL3w3ziVoIQQIDSEPAVL2N0SvvntUAhc=@vger.kernel.org
X-Gm-Message-State: AFuF++k9WsklJnKXwgVnGwDjIp7hNtnK5iV/3SLF1DIaeK0+rTFg7oey
	6TnkvGGYmk2rH322AGDGtzejbXkAYNU+1H4U4GV0TE2qURjpnpIq2LbXQihLdGRCoYY=
X-Gm-Gg: AYBFou3O7cFNFwobUHHHzVKOCwQINuPGSi3T8IASr2qrKLxPHCDxNU90lCILSPm336H
	hyTLAMWXmGO6DdKuAMclVnHYx7RQx3xs3VOKu9CmEN+mAeReeoJVcn50tirX4x/TI6524bhn6O5
	8W47xZxZLZFR4a65d5rHw9L9ppg0lhhkcRhfH83SMLtXngylg06e6QA7rOJEHWKkL3MdTB6M/GO
	9IaHsKmkl9hrkqY9SZAAp2u340DBhQL+qXewn+u6LhkHPo73KzdK/KUJyx1pF1LQapIIHTZIyIX
	R6j4LE7jppqNvOkWEldEb0ie/IKS+6CV45okSxKL//9FOJb9PWiC69H+7PCsamrCANg4vhvzdmd
	sCc8mtXuMJpGi+O4Z8s8grR+gcGDcOEQ1ymqpP5CmhqIsjGNoW5Pse64TG6zcUF3j6a6NHEYtls
	VOOdQpuuvfHsMmiSaqylP5ZhcLTbfnx3eU1c4LOye4Dgc5SF9MS7IyTLbPYbmPwcRfE4ysjBTAf
	uD+5zqUrqwDUg==
X-Received: by 2002:a17:907:b051:20b0:c2a:f2bb:3273 with SMTP id a640c23a62f3a-c2af2bb3b23mr107484966b.3.1790346714278;
        Fri, 25 Sep 2026 07:31:54 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae780d2ecsm126508766b.56.2026.09.25.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:31:53 -0700 (PDT)
Message-ID: <8a559d812623457381e65e0e62699ba043de7861.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Lucas Sinn	
 <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 10:31:50 -0400
In-Reply-To: <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
	 <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Ts7MasCl8Zb9sSqLl3HS"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Ts7MasCl8Zb9sSqLl3HS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Le vendredi 25 septembre 2026 =C3=A0 13:45 +0200, Sascha Hauer a =C3=A9crit=
=C2=A0:
> Add a driver for the JPEG hardware decoder Rockchip integrates into a
> number of its SoCs.  Downstream it is known as the VDPU720, which is the
> name the register definitions carry here.
>=20
> Exposes one V4L2 M2M device implementing the stateful decoder interface:
> JPEG input -> NV12 output.  The frame header is parsed on the CPU when a
> coded buffer is queued, which is where the resolution for
> V4L2_EVENT_SOURCE_CHANGE comes from; userspace cannot know the frame size
> without parsing the bitstream itself, so it learns it from the event and
> sizes its capture buffers accordingly.  V4L2_DEC_CMD_STOP drains and
> raises V4L2_EVENT_EOS.
>=20
> Hardware requirements:
> - a DMA side buffer with Q-tables (zigzag->raster), Huffman mincode and
>   value tables, rebuilt from the frame header on every run
> - a two-phase IRQ clear sequence, which some revisions require.  It is
>   done unconditionally, see rkjpegd-vdpu720-regs.h
> - 16-byte stream alignment with a start-byte offset
> - MCU-aligned PIC_H (e.g. 1080p YUV420 needs 1088, not 1080)
> - FILL_DOWN_E on every NV12 conversion, the output chroma is vertically
>   subsampled so the hardware completes the bottom of the picture
> - DRI (restart interval) support when present
> - a neutral chroma plane written by the driver for a grayscale frame.
>   The output format converter has no YUV400 path, so the hardware writes
>   the luma plane and leaves the chroma alone, which comes out green
>=20
> Every address register is a single 32 bit one with no high order
> companion anywhere in the map, so the DMA masks are capped accordingly.
> That is no constraint in practice: the block sits behind the Rockchip
> IOMMU, whose address space is 32 bit wide by construction, and memory
> above 4GB is reached through it.
>=20
> A frame that carries no EOI marker is rejected: that is what a coded
> buffer too small for the frame looks like, and the hardware would
> otherwise hand out a half decoded picture indistinguishable from a good
> one.  A frame larger than the negotiated capture format is rejected too,
> since its dimensions would be programmed against strides taken from that
> format, and so is a capture buffer smaller than that format.
>=20
> Error recovery tries the in-block soft reset first and falls back to
> pulsing the reset lines.  The interrupt handler decodes the error status
> registers into a readable diagnostic.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> A few things in here read like bugs and are not.  Collecting the
> questions with their answers so they do not have to be asked.
>=20
> Q: rkjpegd_stop_streaming() returns every queued buffer with
>    VB2_BUF_STATE_ERROR and never stops the hardware.  Can a decode still
>    be in flight there, and DMA into a capture buffer userspace already
>    has back?
>=20
> A: No.  v4l2_m2m_streamoff() calls v4l2_m2m_cancel_job() before
>    vb2_streamoff(), and that waits on m2m_ctx->finished until
>    TRANS_RUNNING clears, so the job is over before .stop_streaming is
>    entered.  v4l2_m2m_ctx_release() does the same before
>    vb2_queue_release(), which covers close().  That ordering is also why
>    the WARN_ON(!src) in rkjpegd_job_finish_no_pm() cannot fire against a
>    queue VIDIOC_STREAMOFF has just emptied: nothing is running to reach
>    it.
>=20
>    There is no .job_abort, so the wait is bounded only by the
>    RKJPEGD_TIMEOUT_MS watchdog and a STREAMOFF on a wedged frame blocks
>    for up to two seconds.  rkvdec and hantro leave job_abort out as
>    well; the block cannot be asked to stop by anything short of the
>    reset the watchdog already does.
>=20
> Q: rkjpegd_s_fmt_vid_out() overwrites ctx->dst_fmt without looking at
>    whether the capture queue already has buffers.  Can an application
>    allocate small capture buffers, then set a large coded format, and
>    have the hardware write past the end of them?
>=20
> A: No.  The reset itself is required: dev-decoder.rst has VIDIOC_S_FMT
>    on the coded queue invalidate the raw format, and a source change
>    moves it again.  What keeps a job inside its buffer is a check when
>    the job starts.
>=20
>    rkjpegd_buf_prepare() rejecting a capture buffer smaller than
>    dst_fmt.sizeimage is not enough on its own.  videobuf2 prepares a
>    buffer when it is queued, not when streaming starts, so one queued
>    before VIDIOC_STREAMON keeps the size it was checked against.
>    rkjpegd_start_streaming() clears ctx->source_change, and nothing makes
>    the application build the capture queue again after the change was
>    reported.
>=20
>    rkjpegd_vdpu720_run() therefore compares the buffer against dst_fmt
>    again and fails the frame if it is too small, and vdpu720_fill_regs()
>    keeps the frame within dst_fmt.  Both the decoder's DMA and the CPU
>    write of the neutral chroma plane for a grayscale frame are sized from
>    dst_fmt, so the one check covers both.
>=20
> Q: vdpu720_fill_regs() compares the raw header width against the buffer
>    width, but a 4:1:1 MCU is 32 pixels wide.  Should the check be against
>    ALIGN(jpeg_width, mcu_width), and should the capture buffer be padded
>    out to the MCU width rather than to a macroblock, so that the last MCU
>    column has somewhere to land?
>=20
> A: No to both, and this was tried.  The decoder does not write out to the
>    MCU boundary: it lays each row down at the picture width, at a pitch o=
f
>    the picture width, whatever Y_HOR_STRIDE is set to.  Padding the buffe=
r
>    to 736 for a 720 wide 4:1:1 frame therefore does not give it more room=
,
>    it moves the buffer out from under the frame, and every row after the
>    first is read at the wrong offset.
>=20
>    On hardware that shows up as a 720x480 4:1:1 frame decoding to a buffe=
r
>    whose visible bytes are all wrong in both planes, with the columns pas=
t
>    the picture reading 0x80 - the packed frame being walked at the padded
>    stride, which runs the last luma rows into the chroma plane of the
>    packed layout.  The other four modes are unaffected because 8 and 16
>    divide the macroblock the buffer is already aligned to, so only 4:1:1
>    can have the two widths disagree.
>=20
>    The two changes are also coupled, which is worth knowing before trying
>    half of it: with the MCU aligned check and a macroblock aligned buffer=
,
>    a 4:1:1 frame at 720 computes 736 > 720 and is refused outright.
>=20
> Q: vdpu720_fill_chroma() memsets into a capture buffer that is already
>    queued for DMA.  Does the write survive the cache maintenance
>    videobuf2 does when the buffer completes?
>=20
> A: Yes, because there is none.  vb2_dc_prepare() and vb2_dc_finish()
>    both return early unless buf->non_coherent_mem, which comes either
>    from q->non_coherent_mem, gated on the q->allow_cache_hints this
>    driver never sets, or from the USERPTR path, which is not offered:
>    io_modes is VB2_MMAP | VB2_DMABUF.  MMAP buffers are coherent
>    allocations and imported dmabufs get no sync from videobuf2 at all,
>    so nothing invalidates the write.  It also happens before
>    VDPU720_DEC_E is written, so the hardware has not started yet.
>=20
>    For an imported dmabuf the write is still bracketed by
>    dma_buf_begin_cpu_access() and dma_buf_end_cpu_access(), so an
>    exporter with bounce buffers or caches of its own sees it.
>=20
> Q: ctx->fmt_lock is a second lock next to vdev_lock, which already
>    serialises the ioctls.  Why not just hold vdev_lock over the source
>    change instead?
>=20
> A: Because the job path cannot take it.  rkjpegd_device_run() is reached
>    straight from VIDIOC_QBUF, through v4l2_m2m_try_schedule() and
>    v4l2_m2m_try_run(), with __video_do_ioctl() already holding vdev_lock,
>    so taking it there deadlocks on the first job.  Deferring the job to a
>    work item that takes vdev_lock trades that for a worse one:
>    VIDIOC_STREAMOFF holds vdev_lock across v4l2_m2m_cancel_job(), which
>    waits for the running job, and the job could then only finish by
>    taking the lock STREAMOFF is holding.
>=20
>    amphion solves the same problem from the other side, with
>    vpu_inst_lock(): it leaves vdev->lock unset and takes its instance
>    mutex by hand in every ioctl.  Keeping vdev_lock for the ioctls and
>    adding a second lock for the format and the source change flags is
>    the smaller change here.
>=20
> Q: drain_lock is a spinlock next to vdev_lock and fmt_lock.  Why a
>    third lock?
>=20
> A: The mem2mem drain state (is_draining, last_src_buf, has_stopped) is
>    set by V4L2_DEC_CMD_STOP and START under vdev_lock, but read and
>    cleared when a job completes, which happens in the interrupt handler
>    or the watchdog without vdev_lock.  Unserialised, a STOP can pick the
>    running job's source buffer as last_src_buf after the interrupt has
>    already returned it without the LAST flag, and the drain then waits
>    for a buffer that is gone.  The completion runs in hardirq context,
>    so this has to be a spinlock; fmt_lock is a mutex.  imx-jpeg
>    serialises the same pair, see commit df71c6e4d5e5 ("media: imx-jpeg:
>    Lock on ioctl encoder/decoder stop cmd").
> ---
>  MAINTAINERS                                        |    1 +
>  drivers/media/platform/rockchip/Kconfig            |    1 +
>  drivers/media/platform/rockchip/Makefile           |    1 +
>  drivers/media/platform/rockchip/rkjpegd/Kconfig    |   16 +
>  drivers/media/platform/rockchip/rkjpegd/Makefile   |    4 +
>  .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  235 ++
>  drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2536 ++++++++++++++=
++++++
>  7 files changed, 2794 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 290c3a1452ea0..a312e3c0d5e15 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23706,6 +23706,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> +F:	drivers/media/platform/rockchip/rkjpegd/
> =20
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/plat=
form/rockchip/Kconfig
> index ba401d32f01ba..53d28eb89e472 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -5,4 +5,5 @@ comment "Rockchip media platform drivers"
>  source "drivers/media/platform/rockchip/rga/Kconfig"
>  source "drivers/media/platform/rockchip/rkcif/Kconfig"
>  source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> +source "drivers/media/platform/rockchip/rkjpegd/Kconfig"
>  source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/pla=
tform/rockchip/Makefile
> index 0e0b2cbbd4bd2..c256c51ced269 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -2,4 +2,5 @@
>  obj-y +=3D rga/
>  obj-y +=3D rkcif/
>  obj-y +=3D rkisp1/
> +obj-y +=3D rkjpegd/
>  obj-y +=3D rkvdec/
> diff --git a/drivers/media/platform/rockchip/rkjpegd/Kconfig b/drivers/me=
dia/platform/rockchip/rkjpegd/Kconfig
> new file mode 100644
> index 0000000000000..4c814ea58d2f4
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_ROCKCHIP_JPEGD
> +	tristate "Rockchip JPEG decoder driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	depends on PM
> +	select MEDIA_CONTROLLER
> +	select V4L2_JPEG_HELPER
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  Support for the JPEG decoder Rockchip integrates into a number of
> +	  its SoCs, decoding JPEG and MJPEG frames to NV12.

nit: Should this help contains reference to the exact model ? (e.g. VDPU720=
)

> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-jpegd.
> diff --git a/drivers/media/platform/rockchip/rkjpegd/Makefile b/drivers/m=
edia/platform/rockchip/rkjpegd/Makefile
> new file mode 100644
> index 0000000000000..0acf2e6ac6785
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_JPEGD) +=3D rockchip-jpegd.o
> +
> +rockchip-jpegd-y +=3D rkjpegd.o
> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs=
.h b/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs.h
> new file mode 100644
> index 0000000000000..eca01174804d6
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs.h
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VPU720 JPEG decoder register definitions
> + *
> + * Derived from downstream Rockchip MPP HAL (hal_jpegd_rkv_reg.h).
> + * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2026 WolfVision GmbH
> + */
> +#ifndef RKJPEGD_VDPU720_REGS_H_
> +#define RKJPEGD_VDPU720_REGS_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/align.h>
> +#include <linux/types.h>
> +
> +#define VDPU720_REG_VERSION		0x000
> +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> +#define VDPU720_BIT_DEPTH		BIT(8)
> +
> +#define VDPU720_REG_INT			0x004
> +#define VDPU720_DEC_E			BIT(0)
> +#define VDPU720_IRQ_DIS			BIT(1)
> +#define VDPU720_TIMEOUT_E		BIT(2)
> +#define VDPU720_BUF_EMPTY_E		BIT(3)
> +#define VDPU720_BUF_EMPTY_RELOAD	BIT(4)
> +#define VDPU720_SOFT_RST_EN		BIT(5)
> +#define VDPU720_IRQ_RAW			BIT(6)
> +#define VDPU720_WAIT_RESET_E		BIT(7)
> +#define VDPU720_IRQ			BIT(8)
> +#define VDPU720_DEC_RDY			BIT(9)
> +#define VDPU720_BUS_ERR			BIT(10)
> +#define VDPU720_DEC_ERR			BIT(11)
> +#define VDPU720_TIMEOUT			BIT(12)
> +#define VDPU720_BUF_EMPTY		BIT(13)
> +#define VDPU720_SOFT_RST_RDY		BIT(14)
> +
> +/* Error status bits used to decide whether a hardware reset is needed *=
/
> +#define VDPU720_ERR_MASK		(VDPU720_BUS_ERR | VDPU720_DEC_ERR | \
> +					 VDPU720_TIMEOUT | VDPU720_BUF_EMPTY)
> +
> +/*
> + * VPU720 IRQ clear mask.
> + *
> + * Some revisions require a two-step IRQ acknowledgment before checking
> + * VDPU720_IRQ_RAW: write the status back with only the enable and contr=
ol
> + * bits kept, then write 0 to fully clear.  The downstream BSP computes =
the
> + * first value as
> + *
> + *   clr =3D (~(0x00fe7f40 & status)) & (0xff0180bf & status)
> + *
> + * The two masks are complements, so that is status & 0xff0180bf: bits 0=
-5,
> + * 7, 15, 16 and 24-31 are kept, IRQ_RAW and the status bits 8-14 droppe=
d.
> + *
> + * It is applied unconditionally here.  The BSP gates it on the revision=
 in
> + * VDPU720_REG_VERSION matching 0xdb1f0006 exactly, and the RK3588 repor=
ts
> + * 0xdb1f0005, so it is not needed on that part.  The extra write is
> + * harmless there and saves a revision check that would need silicon we =
do
> + * not have to validate.
> + */
> +#define VDPU720_IRQ_CLR_KEEP		0xff0180bf
> +
> +#define VDPU720_REG_SYS			0x008
> +#define VDPU720_FORCE_SOFTRST		BIT(17)	/* set when dec_e=3D0 before soft=
-reset */
> +#define VDPU720_FILL_DOWN_E		BIT(24)	/* fill bottom padding rows */
> +#define VDPU720_FILL_RIGHT_E		BIT(25)
> +#define VDPU720_OUT_SEQ			BIT(26)	/* 0=3Draster, 1=3Dtile */
> +#define VDPU720_YUV_OUT_FMT		GENMASK(29, 27)
> +#define VDPU720_YUV_OUT_FMT_NATIVE	0	/* no format conversion */
> +#define VDPU720_YUV_OUT_FMT_NV12	3	/* output as NV12 */
> +
> +#define VDPU720_REG_PIC_SIZE		0x00c
> +#define VDPU720_PIC_W_M1		GENMASK(15, 0)
> +#define VDPU720_PIC_H_M1		GENMASK(31, 16)
> +
> +#define VDPU720_REG_PIC_FMT		0x010
> +#define VDPU720_JPEG_MODE		GENMASK(2, 0)
> +#define VDPU720_JPEG_MODE_YUV400	0
> +#define VDPU720_JPEG_MODE_YUV411	1
> +#define VDPU720_JPEG_MODE_YUV420	2
> +#define VDPU720_JPEG_MODE_YUV422	3
> +#define VDPU720_JPEG_MODE_YUV440	4
> +#define VDPU720_JPEG_MODE_YUV444	5
> +#define VDPU720_PIX_DEPTH		GENMASK(6, 4)
> +#define VDPU720_PIX_DEPTH_8		0
> +#define VDPU720_PIX_DEPTH_12		1
> +/* qtables_sel: number of Q-table sets (0..3) */
> +#define VDPU720_QTBL_SEL		GENMASK(9, 8)
> +/* htables_sel: number of H-table sets (0..3) */
> +#define VDPU720_HTBL_SEL		GENMASK(13, 12)
> +/* dri_e: restart interval enable */
> +#define VDPU720_DRI_E			BIT(15)
> +/* dri_mcu_num_m1: restart interval MCU count minus 1 */
> +#define VDPU720_DRI_MCU_M1		GENMASK(31, 16)
> +
> +#define VDPU720_REG_HOR_STRIDE		0x014
> +#define VDPU720_Y_HOR_STRIDE		GENMASK(15, 0)
> +#define VDPU720_UV_HOR_STRIDE		GENMASK(31, 16)
> +
> +#define VDPU720_REG_Y_VSTRIDE		0x018
> +#define VDPU720_Y_VSTRIDE		GENMASK(31, 4)
> +
> +#define VDPU720_REG_TBL_LEN		0x01c
> +#define VDPU720_QTBL_LEN		GENMASK(4, 0)
> +#define VDPU720_HTBL_MINCODE_LEN	GENMASK(12, 8)
> +#define VDPU720_HTBL_VALUE_LEN		GENMASK(21, 16)
> +/* bit 16 of the Y horizontal stride, low 16 bits live in REG5 */
> +#define VDPU720_Y_HOR_STRIDE_H		BIT(24)
> +
> +#define VDPU720_REG_STRM_LEN		0x020
> +#define VDPU720_STRM_START_BYTE		GENMASK(3, 0)
> +#define VDPU720_STRM_LEN		GENMASK(31, 4)
> +
> +#define VDPU720_REG_QTBL_BASE		0x024	/* Q-table side buffer,   64-byte a=
ligned */
> +#define VDPU720_REG_HTBL_MINCODE	0x028	/* H-mincode table,       64-byte=
 aligned */
> +#define VDPU720_REG_HTBL_VALUE		0x02c	/* H-value table,         64-byte =
aligned */
> +#define VDPU720_REG_STRM_BASE		0x030	/* JPEG entropy stream,   16-byte a=
ligned */
> +#define VDPU720_REG_OUT_BASE		0x034	/* NV12 output buffer,    64-byte al=
igned */
> +
> +#define VDPU720_REG_STRM_ERR		0x038
> +#define VDPU720_ERROR_PRC_MODE		BIT(0)
> +#define VDPU720_STRM_FFFF_ERR_MODE	GENMASK(6, 5)
> +#define VDPU720_STRM_OTHER_MODE		GENMASK(8, 7)
> +/* Recommended default: accept errors, skip 0xFFFF, skip unknown markers=
 */
> +#define VDPU720_STRM_ERR_DFLT		(VDPU720_ERROR_PRC_MODE | \
> +					 FIELD_PREP_CONST(VDPU720_STRM_FFFF_ERR_MODE, 2) | \
> +					 FIELD_PREP_CONST(VDPU720_STRM_OTHER_MODE, 2))
> +
> +#define VDPU720_REG_CLK_GATE		0x040
> +#define VDPU720_CLK_GATE_ALL		0xff
> +
> +#define VDPU720_REG_PERF_CTRL		0x078
> +#define VDPU720_PERF_WORK_E		BIT(0)
> +#define VDPU720_PERF_CLR_E		BIT(1)
> +#define VDPU720_PERF_CNT_TYPE		BIT(3)
> +#define VDPU720_PERF_RD_LAT_ID		GENMASK(7, 4)
> +
> +#define VDPU720_REG_AXI_CFG		0x07c
> +#define VDPU720_ADDR_ALIGN_TYPE		GENMASK(1, 0)
> +#define VDPU720_AR_CNT_ID_TYPE		BIT(2)	/* 1 =3D count sw_ar_count_id onl=
y */
> +#define VDPU720_AW_CNT_ID_TYPE		BIT(3)	/* 1 =3D count sw_aw_count_id onl=
y */
> +#define VDPU720_AR_COUNT_ID		GENMASK(7, 4)
> +#define VDPU720_AW_COUNT_ID		GENMASK(11, 8)
> +#define VDPU720_RD_TOTAL_BYTES_MODE	BIT(12)	/* 1 =3D count sw_ar_count_i=
d bytes only */
> +
> +#define VDPU720_REG_DBG_MCU_POS		0x080
> +#define VDPU720_DBG_MCU_POS_X		GENMASK(15, 0)	/* column in MCU units */
> +#define VDPU720_DBG_MCU_POS_Y		GENMASK(31, 16)	/* row in MCU units */
> +
> +#define VDPU720_REG_DBG_ERROR		0x084
> +#define VDPU720_DERR_DRI_SEQ		BIT(0)	/* DRI not at expected sequence */
> +#define VDPU720_DERR_STREAM_R0		BIT(1)	/* special marker 0 detected */
> +#define VDPU720_DERR_STREAM_R1		BIT(2)	/* special marker 1 detected */
> +#define VDPU720_DERR_STREAM_FFFF	BIT(3)	/* 0xFFFF sequence in stream */
> +#define VDPU720_DERR_OTHER_MARK		BIT(4)	/* unknown JPEG marker */
> +#define VDPU720_DERR_MCU_CNT_L		BIT(8)	/* restart mark arrived too early=
 */
> +#define VDPU720_DERR_MCU_CNT_M		BIT(9)	/* restart mark arrived too late =
*/
> +#define VDPU720_DERR_EOI_NO_END		BIT(10)	/* EOI before frame complete */
> +#define VDPU720_DERR_END_NO_EOI		BIT(11)	/* frame complete without EOI *=
/
> +#define VDPU720_DERR_OVERFLOW		BIT(12)	/* Huffman coefficient overflow *=
/
> +#define VDPU720_DERR_HUFF_EMPTY		BIT(13)	/* bitstream empty before EOI *=
/
> +#define VDPU720_DERR_FLAGS		GENMASK(13, 0)	/* all of the above */
> +#define VDPU720_DERR_FIRST_IDX		GENMASK(19, 16)	/* index of first error =
*/
> +
> +#define VDPU720_REG_PERF_RD_MAX_LAT	0x088	/* peak read latency (clock cy=
cles) */
> +#define VDPU720_REG_PERF_RD_LAT_SAMP	0x08c	/* read transactions above la=
t threshold */
> +#define VDPU720_REG_PERF_RD_LAT_ACC	0x090	/* accumulated read latency su=
m */
> +#define VDPU720_REG_PERF_RD_BYTES	0x094	/* total AXI read bytes this fra=
me */
> +#define VDPU720_REG_PERF_WR_BYTES	0x098	/* total AXI write bytes this fr=
ame */
> +
> +#define VDPU720_REG_PERF_CYCLES		0x09c
> +
> +/*
> + * Side-buffer layout for Q-tables and Huffman tables
> + *
> + * The VPU720 JPEG decoder reads quantisation tables and Huffman
> + * tables from a contiguous DMA buffer with the following layout:
> + *
> + *   [0,         QTBL_SIZE):    Q-table data (u16, raster-scan order)
> + *   [HMINCODE_OFF, +HMIN_SZ):  Huffman mincode table
> + *   [HVALUE_OFF,  +HVAL_SZ):   Huffman value table
> + *
> + * The Q-tables are per component, one entry each
> + */
> +#define VDPU720_NB_COMPONENTS		3
> +#define VDPU720_QTBL_ENTRIES		64	/* 64 coefficients per table */
> +#define VDPU720_QTBL_COMP_SIZE		(VDPU720_QTBL_ENTRIES * sizeof(u16))
> +#define VDPU720_QTBL_SIZE		(VDPU720_QTBL_COMP_SIZE * VDPU720_NB_COMPONEN=
TS)
> +
> +/*
> + * The Huffman tables are not per component and there is no per componen=
t
> + * selector register, so the mapping is fixed: the first set is used for=
 the
> + * luma component and the second one for both chroma components.  A gray=
scale
> + * frame only needs the first.
> + *
> + * HTBL_SEL has a third setting, and the downstream HAL sizes the table
> + * buffer for three sets, but it only ever fills the third with a copy o=
f the
> + * second.  Whether that set is used for the second chroma component is
> + * unknown, so it is not used here.
> + */
> +#define VDPU720_NB_HTBL_SETS		2
> +
> +/*
> + * Per-set mincode layout: 16 DC mincodes + 8 DC accaddr pairs +
> + * 16 AC mincodes + 8 AC accaddr pairs =3D 48 u16 =3D 96 bytes
> + */
> +#define VDPU720_HMINCODE_SET_SIZE	(48 * sizeof(u16))
> +#define VDPU720_HMINCODE_SIZE		(VDPU720_HMINCODE_SET_SIZE * VDPU720_NB_H=
TBL_SETS)
> +#define VDPU720_HMINCODE_OFF		VDPU720_QTBL_SIZE
> +
> +/* Per-set value layout: 16 DC values + 176 AC values =3D 192 bytes */
> +#define VDPU720_HVALUE_SET_SIZE		192
> +#define VDPU720_HVALUE_SIZE		(VDPU720_HVALUE_SET_SIZE * VDPU720_NB_HTBL_=
SETS)
> +#define VDPU720_HVALUE_OFF		(VDPU720_HMINCODE_OFF + \
> +					 ALIGN(VDPU720_HMINCODE_SIZE, 64))
> +
> +#define VDPU720_TABLE_BUF_SIZE		(VDPU720_HVALUE_OFF + VDPU720_HVALUE_SIZ=
E)
> +
> +/*
> + * The three table length registers count 16 byte units, minus one.  Der=
ive
> + * them from the sizes above so that what is programmed always matches w=
hat
> + * the driver writes into the side buffer.
> + */
> +#define VDPU720_TBL_LEN_UNIT		16
> +#define VDPU720_TBL_LEN(bytes)		((bytes) / VDPU720_TBL_LEN_UNIT - 1)
> +
> +/*
> + * Huffman value sub-layout per set (192 bytes total):
> + *   bytes [0..15]:   DC code values (up to 12 valid entries)
> + *   bytes [16..191]: AC code values (up to 162 valid entries)
> + */
> +#define VDPU720_DC_VALUES_MAX		16
> +#define VDPU720_AC_VALUES_MAX		176	/* 12*16 - 16 */
> +
> +#endif /* RKJPEGD_VDPU720_REGS_H_ */
> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..e3a6c820ad1ed
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
> @@ -0,0 +1,2536 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip JPEG decoder driver
> + *
> + * The register programming is ported from the Rockchip MPP HAL
> + * (hal_jpegd_rkv.c / hal_jpegd_vpu7xx_com.c) and the downstream
> + * mpp_jpgdec.c kernel driver.
> + *
> + * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2026 WolfVision GmbH
> + *   Author: Lucas Sinn <lucas.sinn@wolfvision.net>
> + * Copyright (C) 2026 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
> + */
> +
> +#include <linux/align.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kref.h>
> +#include <linux/log2.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/videodev2.h>
> +#include <linux/workqueue.h>
> +
> +#include <media/media-device.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-jpeg.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "rkjpegd-vdpu720-regs.h"
> +
> +#define RKJPEGD_NAME "rockchip-jpegd"
> +
> +/*
> + * The reference manual gives 48x48 to 65536x65536, but a 32 bit sizeima=
ge
> + * wraps well before the top of that range.  Cap at four times 4K in eac=
h
> + * direction and hold both the coded format and the bitstream to it.
> + */
> +#define RKJPEGD_MIN_WIDTH	48
> +#define RKJPEGD_MIN_HEIGHT	48
> +#define RKJPEGD_MAX_SIZE	16384

Seems quite strict and miss-leading, since you can't support stuff like
65536x160, which is barely 10MB / image. Can't you semantically filter it, =
or
let the allocation fails ?

> +
> +/* The coded queue steps in MCU-sized units, the raw one in macroblocks.=
 */
> +#define RKJPEGD_CODED_STEP	8
> +#define RKJPEGD_RAW_STEP	16
> +
> +/* Bytes per pixel used to size a coded buffer for a given resolution. *=
/
> +#define RKJPEGD_CODED_MAX_DEPTH	2
> +
> +/* Milliseconds a frame may take before the watchdog resets the block. *=
/
> +#define RKJPEGD_TIMEOUT_MS	2000
> +
> +static const char * const rkjpegd_clk_names[] =3D {
> +	"axi", "ahb",
> +};
> +
> +#define RKJPEGD_NUM_CLOCKS	ARRAY_SIZE(rkjpegd_clk_names)
> +
> +/**
> + * struct rkjpegd_aux_buf - auxiliary DMA buffer for hardware tables
> + *
> + * @cpu:	CPU pointer to the buffer.
> + * @dma:	DMA address of the buffer.
> + * @size:	Size of the buffer in bytes.
> + */
> +struct rkjpegd_aux_buf {
> +	void *cpu;
> +	dma_addr_t dma;
> +	size_t size;
> +};
> +
> +/**
> + * struct rkjpegd_src_buf - a coded buffer and the header parsed out of =
it
> + *
> + * @base:		videobuf2 mem2mem buffer, must be first.
> + * @header:		header as returned by v4l2_jpeg_parse_header().
> + * @scan:		storage @header.scan points at.
> + * @quantization_tables: storage @header.quantization_tables points at.
> + * @huffman_tables:	storage @header.huffman_tables points at.
> + * @parsed:		@header describes a frame this hardware can decode.
> + *
> + * The references in @header point into the buffer payload, which stays
> + * mapped for as long as the buffer is queued.  Userspace can still writ=
e to
> + * it, so what is read from it when the job runs must stay within the
> + * lengths recorded here.
> + */
> +struct rkjpegd_src_buf {
> +	struct v4l2_m2m_buffer base;
> +	struct v4l2_jpeg_header header;
> +	struct v4l2_jpeg_scan_header scan;
> +	struct v4l2_jpeg_reference quantization_tables[4];
> +	struct v4l2_jpeg_reference huffman_tables[4];
> +	bool parsed;
> +};
> +
> +static inline struct rkjpegd_src_buf *
> +vb2_to_rkjpegd_src_buf(struct vb2_buffer *vb)
> +{
> +	return container_of(to_vb2_v4l2_buffer(vb), struct rkjpegd_src_buf,
> +			    base.vb);
> +}
> +
> +/**
> + * struct rkjpegd_dev - the decoder device
> + *
> + * @ref:		held by the binding, dropped by devres after every
> + *			other devres resource is released, and by the video
> + *			device, dropped from its release callback.
> + * @v4l2_dev:		V4L2 device.
> + * @mdev:		media device.
> + * @vdev:		video device.
> + * @m2m_dev:		mem2mem device.
> + * @dev:		driver model device.
> + * @clocks:		clocks named by @rkjpegd_clk_names.
> + * @resets:		the block's reset lines, as one array control.
> + * @regs:		register window.
> + * @irq:		the block's interrupt, masked while the watchdog has
> + *			the hardware to itself.
> + * @vdev_lock:		serialises ioctls and the videobuf2 queues.
> + * @drain_lock:		serialises the mem2mem drain state between
> + *			V4L2_DEC_CMD_STOP/START and the completion of a job,
> + *			which runs from the interrupt handler and the
> + *			watchdog without @vdev_lock.
> + * @watchdog_work:	fires when a job does not complete in time.
> + * @needs_reset:	the block ended a job in error or without
> + *			%VDPU720_SOFT_RST_RDY and has to be reset before
> + *			the next one is programmed.  Set from the
> + *			interrupt handler, consumed by rkjpegd_vdpu720_run();
> + *			the reset itself sleeps and cannot be done in either
> + *			the interrupt handler or anywhere else atomic.
> + */
> +struct rkjpegd_dev {
> +	struct kref ref;
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;

What do you use this media device for ?

> +	struct video_device vdev;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	struct device *dev;
> +	struct clk_bulk_data clocks[RKJPEGD_NUM_CLOCKS];
> +	struct reset_control *resets;
> +	void __iomem *regs;
> +	int irq;
> +	struct mutex vdev_lock; /* serialises ioctls */
> +	spinlock_t drain_lock; /* serialises the drain state */
> +	struct delayed_work watchdog_work;
> +	bool needs_reset;
> +};
> +
> +/**
> + * struct rkjpegd_ctx - one open file handle
> + *
> + * @fh:				V4L2 file handle.
> + * @dev:			device this context belongs to.
> + * @src_fmt:			coded format on the output queue.
> + * @dst_fmt:			raw format on the capture queue.
> + * @crop:			visible part of a capture buffer.  The decoder
> + *				writes whole MCUs, so a frame whose height is
> + *				not a multiple of one is padded.
> + * @sequence_cap:		capture buffer sequence counter.
> + * @sequence_out:		output buffer sequence counter.
> + * @source_change:		a resolution change was reported and neither
> + *				a capture queue restart nor
> + *				V4L2_DEC_CMD_START has resumed decoding yet.
> + * @initial_source_change:	the first parsed header must report a change
> + *				even when it matches the negotiated format.
> + * @table_base:			quantisation and Huffman table side buffer,
> + *				rebuilt from the frame header on every run.
> + *				The block reads it little-endian, so its
> + *				multi-byte fields are __le16.
> + * @job_payload:		capture payload of the running job, taken from
> + *				@dst_fmt when it starts so that the interrupt
> + *				handler does not have to take @fmt_lock.
> + * @fmt_lock:			serialises @dst_fmt, @crop, @source_change and
> + *				@initial_source_change.  A source change
> + *				renegotiates them from rkjpegd_device_run(),
> + *				which the mem2mem core runs from its job
> + *				workqueue without @rkjpegd_dev.vdev_lock held,
> + *				so the ioctls cannot rely on that lock alone.
> + */
> +struct rkjpegd_ctx {
> +	struct v4l2_fh fh;
> +	struct rkjpegd_dev *dev;
> +	struct v4l2_pix_format_mplane src_fmt;
> +	struct v4l2_pix_format_mplane dst_fmt;
> +	struct v4l2_rect crop;
> +	u32 sequence_cap;
> +	u32 sequence_out;
> +	bool source_change;
> +	bool initial_source_change;
> +	struct rkjpegd_aux_buf table_base;
> +	u32 job_payload;
> +	struct mutex fmt_lock; /* serialises dst_fmt and crop */
> +};
> +
> +static inline struct rkjpegd_ctx *file_to_rkjpegd_ctx(struct file *filp)
> +{
> +	return container_of(file_to_v4l2_fh(filp), struct rkjpegd_ctx, fh);
> +}
> +
> +static inline void rkjpegd_write_relaxed(struct rkjpegd_dev *jpegd,
> +					 u32 val, u32 reg)
> +{
> +	writel_relaxed(val, jpegd->regs + reg);
> +}
> +
> +static inline void rkjpegd_write(struct rkjpegd_dev *jpegd, u32 val, u32=
 reg)
> +{
> +	writel(val, jpegd->regs + reg);
> +}
> +
> +static inline u32 rkjpegd_read(struct rkjpegd_dev *jpegd, u32 reg)
> +{
> +	return readl(jpegd->regs + reg);
> +}
> +
> +static inline void rkjpegd_write_addr(struct rkjpegd_dev *jpegd, u32 reg=
,
> +				      dma_addr_t addr)
> +{
> +	rkjpegd_write(jpegd, lower_32_bits(addr), reg);
> +}
> +
> +static const struct v4l2_event rkjpegd_eos_event =3D {
> +	.type =3D V4L2_EVENT_EOS,
> +};
> +
> +static const struct v4l2_event rkjpegd_src_change_event =3D {
> +	.type =3D V4L2_EVENT_SOURCE_CHANGE,
> +	.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION,
> +};
> +
> +/*
> + * Colorimetry is a property of the picture, and a JPEG frame header car=
ries
> + * nothing that describes it.  Default to what JFIF implies, but take wh=
at the
> + * application sets on the coded queue, it may know better, and report t=
hat on
> + * the capture queue.
> + */
> +static void rkjpegd_set_default_colorimetry(struct v4l2_pix_format_mplan=
e *pix_mp)
> +{
> +	pix_mp->colorspace =3D V4L2_COLORSPACE_JPEG;
> +	pix_mp->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +	pix_mp->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +	pix_mp->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +static void rkjpegd_propagate_colorimetry(struct v4l2_pix_format_mplane =
*to,
> +					  const struct v4l2_pix_format_mplane *from)
> +{
> +	to->colorspace =3D from->colorspace;
> +	to->ycbcr_enc =3D from->ycbcr_enc;
> +	to->quantization =3D from->quantization;
> +	to->xfer_func =3D from->xfer_func;
> +}
> +
> +static void rkjpegd_fill_raw_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +				 u32 width, u32 height)
> +{
> +	pix_mp->pixelformat =3D V4L2_PIX_FMT_NV12;
> +	pix_mp->width =3D width;
> +	pix_mp->height =3D height;
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +	pix_mp->num_planes =3D 1;
> +	pix_mp->plane_fmt[0].bytesperline =3D width;
> +	pix_mp->plane_fmt[0].sizeimage =3D width * height * 3 / 2;
> +	memset(pix_mp->plane_fmt[0].reserved, 0,
> +	       sizeof(pix_mp->plane_fmt[0].reserved));
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +}
> +
> +static void rkjpegd_fill_coded_fmt(struct v4l2_pix_format_mplane *pix_mp=
,
> +				   u32 width, u32 height, u32 sizeimage)
> +{
> +	pix_mp->pixelformat =3D V4L2_PIX_FMT_JPEG;
> +	pix_mp->width =3D width;
> +	pix_mp->height =3D height;
> +	pix_mp->field =3D V4L2_FIELD_NONE;
> +	pix_mp->num_planes =3D 1;
> +	pix_mp->plane_fmt[0].bytesperline =3D 0;
> +
> +	if (!sizeimage)
> +		sizeimage =3D width * height * RKJPEGD_CODED_MAX_DEPTH;
> +	pix_mp->plane_fmt[0].sizeimage =3D sizeimage;
> +
> +	memset(pix_mp->plane_fmt[0].reserved, 0,
> +	       sizeof(pix_mp->plane_fmt[0].reserved));
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +}
> +
> +static void rkjpegd_reset_fmts(struct rkjpegd_ctx *ctx)
> +{
> +	u32 width =3D ALIGN(RKJPEGD_MIN_WIDTH, RKJPEGD_RAW_STEP);
> +	u32 height =3D ALIGN(RKJPEGD_MIN_HEIGHT, RKJPEGD_RAW_STEP);
> +
> +	rkjpegd_fill_coded_fmt(&ctx->src_fmt, width, height, 0);
> +	rkjpegd_set_default_colorimetry(&ctx->src_fmt);
> +
> +	mutex_lock(&ctx->fmt_lock);

Have you considered using guard ?

> +	rkjpegd_fill_raw_fmt(&ctx->dst_fmt, width, height);
> +	rkjpegd_set_default_colorimetry(&ctx->dst_fmt);
> +	ctx->crop.left =3D 0;
> +	ctx->crop.top =3D 0;
> +	ctx->crop.width =3D width;
> +	ctx->crop.height =3D height;
> +	mutex_unlock(&ctx->fmt_lock);
> +}
> +
> +static int rkjpegd_querycap(struct file *file, void *priv,
> +			    struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, RKJPEGD_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, RKJPEGD_NAME, sizeof(cap->card));
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_enum_fmt_vid_cap(struct file *file, void *priv,
> +				    struct v4l2_fmtdesc *f)
> +{
> +	if (f->index)
> +		return -EINVAL;
> +
> +	f->pixelformat =3D V4L2_PIX_FMT_NV12;
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
> +				    struct v4l2_fmtdesc *f)
> +{
> +	if (f->index)
> +		return -EINVAL;
> +
> +	f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> +
> +	f->flags |=3D V4L2_FMT_FLAG_DYN_RESOLUTION;
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> +				   struct v4l2_frmsizeenum *fsize)
> +{
> +	/* The decoded format follows the bitstream, nothing to enumerate. */
> +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12)
> +		return -ENOTTY;
> +
> +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> +		return -EINVAL;
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width =3D RKJPEGD_MIN_WIDTH;
> +	fsize->stepwise.max_width =3D RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_width =3D RKJPEGD_CODED_STEP;
> +	fsize->stepwise.min_height =3D RKJPEGD_MIN_HEIGHT;
> +	fsize->stepwise.max_height =3D RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_height =3D RKJPEGD_CODED_STEP;
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_g_fmt_vid_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	f->fmt.pix_mp =3D ctx->dst_fmt;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_g_fmt_vid_out(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	f->fmt.pix_mp =3D file_to_rkjpegd_ctx(file)->src_fmt;
> +
> +	return 0;
> +}
> +
> +/*
> + * The capture resolution follows the bitstream, not userspace: it is se=
t from
> + * the frame header when a source change is reported and only read back =
here.
> + * The colorimetry follows the coded queue the same way.
> + */
> +static int rkjpegd_try_fmt_vid_cap(struct file *file, void *priv,
> +				   struct v4l2_format *f)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	rkjpegd_fill_raw_fmt(&f->fmt.pix_mp, ctx->dst_fmt.width,
> +			     ctx->dst_fmt.height);
> +	rkjpegd_propagate_colorimetry(&f->fmt.pix_mp, &ctx->dst_fmt);
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_try_fmt_vid_out(struct file *file, void *priv,
> +				   struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +	u32 sizeimage =3D pix_mp->num_planes =3D=3D 1 ?
> +			pix_mp->plane_fmt[0].sizeimage : 0;
> +
> +	v4l_bound_align_image(&pix_mp->width,
> +			      RKJPEGD_MIN_WIDTH, RKJPEGD_MAX_SIZE,
> +			      ilog2(RKJPEGD_CODED_STEP),
> +			      &pix_mp->height,
> +			      RKJPEGD_MIN_HEIGHT, RKJPEGD_MAX_SIZE,
> +			      ilog2(RKJPEGD_CODED_STEP), 0);
> +
> +	rkjpegd_fill_coded_fmt(pix_mp, pix_mp->width, pix_mp->height, sizeimage=
);
> +
> +	/* The core has already replaced invalid values with the defaults. */
> +	if (pix_mp->colorspace =3D=3D V4L2_COLORSPACE_DEFAULT)
> +		rkjpegd_set_default_colorimetry(pix_mp);
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_s_fmt_vid_cap(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +	struct vb2_queue *vq =3D v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
> +
> +	if (vb2_is_busy(vq))
> +		return -EBUSY;
> +
> +	rkjpegd_try_fmt_vid_cap(file, priv, f);
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	ctx->dst_fmt =3D f->fmt.pix_mp;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_s_fmt_vid_out(struct file *file, void *priv,
> +				 struct v4l2_format *f)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +	struct vb2_queue *vq =3D v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
> +	int ret;
> +
> +	if (vb2_is_busy(vq))
> +		return -EBUSY;
> +
> +	ret =3D rkjpegd_try_fmt_vid_out(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	ctx->src_fmt =3D f->fmt.pix_mp;
> +
> +	/* S_FMT on the coded queue invalidates the raw format. */
> +	mutex_lock(&ctx->fmt_lock);
> +	rkjpegd_fill_raw_fmt(&ctx->dst_fmt,
> +			     ALIGN(ctx->src_fmt.width, RKJPEGD_RAW_STEP),
> +			     ALIGN(ctx->src_fmt.height, RKJPEGD_RAW_STEP));
> +	rkjpegd_propagate_colorimetry(&ctx->dst_fmt, &ctx->src_fmt);
> +	ctx->crop.left =3D 0;
> +	ctx->crop.top =3D 0;
> +	ctx->crop.width =3D ctx->src_fmt.width;
> +	ctx->crop.height =3D ctx->src_fmt.height;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_g_selection(struct file *file, void *priv,
> +			       struct v4l2_selection *s)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +	struct v4l2_rect crop;
> +	u32 width, height;
> +
> +	if (s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    s->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		return -EINVAL;
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	crop =3D ctx->crop;
> +	width =3D ctx->dst_fmt.width;
> +	height =3D ctx->dst_fmt.height;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_COMPOSE:
> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +		s->r =3D crop;
> +		break;
> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +	case V4L2_SEL_TGT_COMPOSE_PADDED:
> +		s->r.left =3D 0;
> +		s->r.top =3D 0;
> +		s->r.width =3D width;
> +		s->r.height =3D height;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_subscribe_event(struct v4l2_fh *fh,
> +				   const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);
> +	default:
> +		/* The decoder takes no controls, so there is nothing else. */
> +		return -EINVAL;
> +	}
> +}
> +
> +/**
> + * rkjpegd_resume_drain() - re-arm a drain across a resolution change
> + * @ctx:	context whose capture queue is restarted
> + *
> + * Restarting the capture queue for a resolution change clears the drain
> + * state, but a drain still in progress is owed a LAST capture buffer fo=
r its
> + * last coded buffer.  @v4l2_m2m_ctx.last_src_buf stays set for exactly =
that
> + * case.  It is cleared once a drain completes, the coded queue stops, o=
r
> + * the capture queue stops without a resolution change, which aborts the
> + * drain.
> + */
> +static void rkjpegd_resume_drain(struct rkjpegd_ctx *ctx)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +
> +	if (ctx->source_change && m2m_ctx->last_src_buf)
> +		m2m_ctx->is_draining =3D true;
> +	else
> +		m2m_ctx->last_src_buf =3D NULL;
> +}
> +
> +static void rkjpegd_last_buffer_done(struct rkjpegd_ctx *ctx,
> +				     struct vb2_v4l2_buffer *vbuf)
> +{
> +	vbuf->flags |=3D V4L2_BUF_FLAG_LAST;
> +	vbuf->field =3D V4L2_FIELD_NONE;
> +	vbuf->sequence =3D ctx->sequence_cap++;
> +	vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
> +	vb2_buffer_done(&vbuf->vb2_buf, VB2_BUF_STATE_DONE);
> +}
> +
> +static int rkjpegd_decoder_cmd(struct file *file, void *priv,
> +			       struct v4l2_decoder_cmd *cmd)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(file);
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	bool source_change, stopped;
> +	unsigned long flags;
> +	int ret;
> +
> +	ret =3D v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))
> +		return 0;
> +
> +	if (cmd->cmd =3D=3D V4L2_DEC_CMD_STOP) {
> +		spin_lock_irqsave(&jpegd->drain_lock, flags);
> +		ret =3D v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);
> +		stopped =3D v4l2_m2m_has_stopped(ctx->fh.m2m_ctx);
> +		spin_unlock_irqrestore(&jpegd->drain_lock, flags);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (stopped)
> +			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> +
> +		return 0;
> +	}
> +
> +	/* Resumes after a drain or a resolution change alike. */
> +	mutex_lock(&ctx->fmt_lock);
> +	source_change =3D ctx->source_change;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	/* A drain the resolution change interrupted carries on. */
> +	spin_lock_irqsave(&jpegd->drain_lock, flags);
> +	if (!source_change || !ctx->fh.m2m_ctx->is_draining)
> +		ret =3D v4l2_m2m_ioctl_decoder_cmd(file, priv, cmd);

With guard, you could simply return here, and your could not need the ret
variable.

> +	spin_unlock_irqrestore(&jpegd->drain_lock, flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	ctx->source_change =3D false;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	vb2_clear_last_buffer_dequeued(&ctx->fh.m2m_ctx->cap_q_ctx.q);
> +	v4l2_m2m_try_schedule(ctx->fh.m2m_ctx);

This all seems over complicated, can you explains your choices here ? When =
I
compare this very different then other driver, and a lot of added lock. You=
 only
have one core here.

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops =3D {
> +	.vidioc_querycap =3D rkjpegd_querycap,
> +	.vidioc_enum_framesizes =3D rkjpegd_enum_framesizes,
> +
> +	.vidioc_enum_fmt_vid_cap =3D rkjpegd_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap_mplane =3D rkjpegd_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap_mplane =3D rkjpegd_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap_mplane =3D rkjpegd_s_fmt_vid_cap,
> +
> +	.vidioc_enum_fmt_vid_out =3D rkjpegd_enum_fmt_vid_out,
> +	.vidioc_g_fmt_vid_out_mplane =3D rkjpegd_g_fmt_vid_out,
> +	.vidioc_try_fmt_vid_out_mplane =3D rkjpegd_try_fmt_vid_out,
> +	.vidioc_s_fmt_vid_out_mplane =3D rkjpegd_s_fmt_vid_out,
> +
> +	.vidioc_g_selection =3D rkjpegd_g_selection,
> +
> +	.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
> +	.vidioc_remove_bufs =3D v4l2_m2m_ioctl_remove_bufs,
> +
> +	.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_try_decoder_cmd =3D v4l2_m2m_ioctl_try_decoder_cmd,
> +	.vidioc_decoder_cmd =3D rkjpegd_decoder_cmd,
> +
> +	.vidioc_subscribe_event =3D rkjpegd_subscribe_event,
> +	.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +};
> +
> +static void rkjpegd_arm_watchdog(struct rkjpegd_dev *jpegd)
> +{
> +	schedule_delayed_work(&jpegd->watchdog_work,
> +			      msecs_to_jiffies(RKJPEGD_TIMEOUT_MS));
> +}
> +
> +static void rkjpegd_job_finish_no_pm(struct rkjpegd_ctx *ctx,
> +				     enum vb2_buffer_state state)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	unsigned long flags;
> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (WARN_ON(!src) || WARN_ON(!dst))
> +		return;
> +
> +	spin_lock_irqsave(&jpegd->drain_lock, flags);
> +
> +	src->sequence =3D ctx->sequence_out++;
> +	dst->sequence =3D ctx->sequence_cap++;
> +
> +	vb2_set_plane_payload(&dst->vb2_buf, 0,
> +			      state =3D=3D VB2_BUF_STATE_DONE ? ctx->job_payload : 0);
> +
> +	if (v4l2_m2m_is_last_draining_src_buf(ctx->fh.m2m_ctx, src)) {
> +		dst->flags |=3D V4L2_BUF_FLAG_LAST;
> +		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> +		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> +		ctx->fh.m2m_ctx->last_src_buf =3D NULL;
> +	}
> +
> +	v4l2_m2m_buf_done_and_job_finish(jpegd->m2m_dev, ctx->fh.m2m_ctx,
> +					 state);
> +
> +	spin_unlock_irqrestore(&jpegd->drain_lock, flags);
> +}
> +
> +static void rkjpegd_job_finish(struct rkjpegd_ctx *ctx,
> +			       enum vb2_buffer_state state)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +
> +	pm_runtime_put_autosuspend(jpegd->dev);
> +
> +	rkjpegd_job_finish_no_pm(ctx, state);
> +}
> +
> +static void rkjpegd_irq_done(struct rkjpegd_dev *jpegd,
> +			     enum vb2_buffer_state state)
> +{
> +	struct rkjpegd_ctx *ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> +
> +	if (!ctx)
> +		return;
> +
> +	if (cancel_delayed_work(&jpegd->watchdog_work))
> +		rkjpegd_job_finish(ctx, state);
> +}
> +
> +/**
> + * vdpu720_jpeg_mode() - map JPEG sampling factors to the hardware mode
> + * @frame:	parsed JPEG frame header
> + *
> + * The sampling factor tuple is determined by the luma channel's factors
> + * relative to the maximum in the frame.  Standard JFIF layouts only,
> + * anything else returns -EINVAL: the mode also picks the MCU height and
> + * therefore PIC_H, so guessing one would decode into a wrong image.
> + * v4l2_jpeg_parse_header() lets no more than 4:4:4, 4:2:2, 4:2:0 and 4:=
1:1
> + * through, so the hardware's 4:4:0 mode is not used.
> + *
> + * Return: a VDPU720_JPEG_MODE_* value, or -EINVAL for any other samplin=
g
> + * layout.
> + */
> +static int vdpu720_jpeg_mode(const struct v4l2_jpeg_frame_header *frame)
> +{
> +	u8 h0, v0;
> +
> +	if (frame->num_components =3D=3D 1)
> +		return VDPU720_JPEG_MODE_YUV400;
> +
> +	/* Component 0 always carries luma in JFIF */
> +	h0 =3D frame->component[0].horizontal_sampling_factor;
> +	v0 =3D frame->component[0].vertical_sampling_factor;
> +
> +	if (h0 =3D=3D 1 && v0 =3D=3D 1)
> +		return VDPU720_JPEG_MODE_YUV444;
> +	if (h0 =3D=3D 2 && v0 =3D=3D 1)
> +		return VDPU720_JPEG_MODE_YUV422;
> +	if (h0 =3D=3D 2 && v0 =3D=3D 2)
> +		return VDPU720_JPEG_MODE_YUV420;
> +	if (h0 =3D=3D 4 && v0 =3D=3D 1)
> +		return VDPU720_JPEG_MODE_YUV411;
> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * vdpu720_mcu_width() - horizontal size of a mode's minimum coded unit
> + * @jpeg_mode:	a VDPU720_JPEG_MODE_* value
> + *
> + * MCU_W follows the luma horizontal sampling factor, h0 * 8.  YUV420 an=
d
> + * YUV422 subsample the luma horizontally by 2 and YUV411 by 4, giving 1=
6 and
> + * 32 pixels.  The rest is 8.
> + *
> + * Return: the MCU width in pixels.
> + */
> +static u32 vdpu720_mcu_width(int jpeg_mode)
> +{
> +	if (jpeg_mode =3D=3D VDPU720_JPEG_MODE_YUV411)
> +		return 32;
> +	if (jpeg_mode =3D=3D VDPU720_JPEG_MODE_YUV420 ||
> +	    jpeg_mode =3D=3D VDPU720_JPEG_MODE_YUV422)
> +		return 16;
> +
> +	return 8;
> +}
> +
> +/**
> + * vdpu720_mcu_height() - vertical size of a mode's minimum coded unit
> + * @jpeg_mode:	a VDPU720_JPEG_MODE_* value
> + *
> + * MCU_H follows the luma vertical sampling factor, v0 * 8.  YUV420 subs=
amples
> + * the luma vertically by 2, giving 16 pixels.  The rest is 8.
> + *
> + * Return: the MCU height in pixels.
> + */
> +static u32 vdpu720_mcu_height(int jpeg_mode)
> +{
> +	if (jpeg_mode =3D=3D VDPU720_JPEG_MODE_YUV420)
> +		return 16;
> +
> +	return 8;
> +}
> +
> +/**
> + * vdpu720_nb_htbl_sets() - number of Huffman table sets the hardware re=
ads
> + * @num_components:	number of components in the scan
> + *
> + * One for a grayscale frame, two for a colour one.  vdpu720_write_htbl(=
)
> + * fills that many sets and vdpu720_fill_regs() sizes HTBL_SEL and the l=
ength
> + * registers from the same number, so the two cannot drift apart.
> + *
> + * Return: the number of table sets to write.
> + */
> +static unsigned int vdpu720_nb_htbl_sets(unsigned int num_components)
> +{
> +	return num_components =3D=3D 1 ? 1 : VDPU720_NB_HTBL_SETS;
> +}
> +
> +/**
> + * vdpu720_write_qtbl() - write all Q-tables into the DMA side buffer
> + * @ctx:	context whose side buffer receives the tables
> + * @hdr:	parsed JPEG header the tables are taken from
> + *
> + * Tables are stored sequentially, one per component in component order.
> + * Each entry is widened to a little-endian u16 and reordered from JPEG
> + * zig-zag scan to natural raster-scan order, matching the hardware
> + * expectation.
> + *
> + * Return: 0 on success, -EINVAL if the frame refers to a quantization
> + * table it does not carry.
> + */
> +static int vdpu720_write_qtbl(struct rkjpegd_ctx *ctx,
> +			      const struct v4l2_jpeg_header *hdr)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	__le16 *base =3D ctx->table_base.cpu;
> +	unsigned int k, i;
> +
> +	for (k =3D 0; k < hdr->frame.num_components; k++) {
> +		u8 tq_id =3D hdr->frame.component[k].quantization_table_selector;
> +		u8 qtbl[VDPU720_QTBL_ENTRIES];
> +		__le16 *dst;
> +
> +		/* .start points past the Pq|Tq byte at the 64 Qk values. */
> +		if (tq_id > 3 || !hdr->quantization_tables[tq_id].start) {
> +			dev_err_ratelimited(jpegd->dev,
> +					    "Q-table %u not found for component %u\n",
> +					    tq_id, k);
> +			return -EINVAL;
> +		}
> +
> +		memcpy(qtbl, hdr->quantization_tables[tq_id].start, sizeof(qtbl));
> +		dst =3D base + k * VDPU720_QTBL_ENTRIES;
> +
> +		/*
> +		 * v4l2_jpeg_zigzag_scan_index[z] is the raster position of z.
> +		 */
> +		for (i =3D 0; i < VDPU720_QTBL_ENTRIES; i++)
> +			dst[v4l2_jpeg_zigzag_scan_index[i]] =3D cpu_to_le16(qtbl[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * vdpu720_compute_mincode() - build the minimum Huffman code arrays
> + * @bits:	BITS[16], the number of codes of each length 1..16
> + * @min_code:	output, minimum code value per length (16 entries)
> + * @acc_addr:	output, accumulated symbol-table address per length (16 en=
tries)
> + *
> + * Derives the two arrays the hardware needs for one Huffman table, DC o=
r AC,
> + * from that table's BITS array.  Algorithm ported verbatim from
> + * jpegd_vpu7xx_write_htbl().
> + */
> +static void vdpu720_compute_mincode(const u8 *bits, u16 *min_code, u16 *=
acc_addr)
> +{
> +	u16 code =3D 0, addr =3D 0;
> +	unsigned int j;
> +
> +	for (j =3D 0; j < 16; j++) {
> +		u16 len =3D bits[j];
> +
> +		if (len =3D=3D 0 && j > 0)
> +			min_code[j] =3D max(code, (u16)min_code[j - 1] << 1);
> +		else
> +			min_code[j] =3D code;
> +
> +		code  +=3D len;
> +		addr  +=3D len;
> +		acc_addr[j] =3D addr;
> +		code <<=3D 1;
> +	}
> +
> +	/* Sentinel: set min_code[0] to the last valid code + count */
> +	if (bits[15])
> +		min_code[0] =3D min_code[15] + bits[15] - 1;
> +	else
> +		min_code[0] =3D min_code[15];
> +}
> +
> +/**
> + * vdpu720_huffman_table() - look up one Huffman table of a frame
> + * @hdr:	parsed JPEG header
> + * @idx:	table index, (Tc << 1) | Th
> + * @len:	returns the table length, BITS included
> + *
> + * Motion-JPEG frames often carry no DHT segment and rely on the tables =
of
> + * ITU-T T.81 Annex K.3, so a table the frame does not define falls back=
 to
> + * the one from there.
> + *
> + * Return: the table, laid out as BITS[16] followed by HUFFVAL.
> + */
> +static const u8 *vdpu720_huffman_table(const struct v4l2_jpeg_header *hd=
r,
> +				       unsigned int idx, size_t *len)
> +{
> +	static const u8 * const std_tables[] =3D {
> +		v4l2_jpeg_ref_table_luma_dc_ht,
> +		v4l2_jpeg_ref_table_chroma_dc_ht,
> +		v4l2_jpeg_ref_table_luma_ac_ht,
> +		v4l2_jpeg_ref_table_chroma_ac_ht,
> +	};
> +	static const size_t std_lens[] =3D {
> +		V4L2_JPEG_REF_HT_DC_LEN, V4L2_JPEG_REF_HT_DC_LEN,
> +		V4L2_JPEG_REF_HT_AC_LEN, V4L2_JPEG_REF_HT_AC_LEN,
> +	};
> +
> +	if (hdr->huffman_tables[idx].start) {
> +		*len =3D hdr->huffman_tables[idx].length;
> +		return hdr->huffman_tables[idx].start;
> +	}
> +
> +	*len =3D std_lens[idx];
> +	return std_tables[idx];
> +}
> +
> +/**
> + * vdpu720_write_htbl() - fill the Huffman mincode and value sub-buffers
> + * @ctx:	context whose side buffer receives the tables
> + * @hdr:	parsed JPEG header the tables are taken from
> + *
> + * One set is written per vdpu720_nb_htbl_sets(), fed by the scan compon=
ent
> + * that uses it: the first by the luma component and the second by the f=
irst
> + * chroma one.  With no per component selector register and no known use=
 for
> + * a third set, see %VDPU720_NB_HTBL_SETS, a frame whose two chroma comp=
onents
> + * disagree on their tables is refused rather than decoded with the wron=
g table
> + * for the last component.
> + *
> + * Per-set layout in the mincode buffer:
> + *   16 x u16  DC min-codes
> + *    8 x u16  DC accumulated addresses (packed pairs)
> + *   16 x u16  AC min-codes
> + *    8 x u16  AC accumulated addresses (packed pairs)
> + *
> + * Per-set layout in the value buffer (192 bytes):
> + *   16 bytes  DC code values
> + *  176 bytes  AC code values
> + *
> + * Return: 0 on success, -EINVAL if the scan selects a Huffman table out=
side
> + * baseline or needs more table sets than the hardware has.
> + */
> +static int vdpu720_write_htbl(struct rkjpegd_ctx *ctx,
> +			      const struct v4l2_jpeg_header *hdr)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	const struct v4l2_jpeg_scan_header *scan =3D hdr->scan;
> +	u8  *tbl_base  =3D ctx->table_base.cpu;
> +	__le16 *p_mincode =3D (__le16 *)(tbl_base + VDPU720_HMINCODE_OFF);
> +	u8  *p_value   =3D tbl_base + VDPU720_HVALUE_OFF;
> +	unsigned int nb_sets =3D vdpu720_nb_htbl_sets(scan->num_components);
> +	unsigned int k, i;
> +
> +	/* The last set is shared by every remaining component */
> +	for (k =3D nb_sets; k < scan->num_components; k++) {
> +		if (scan->component[k].dc_entropy_coding_table_selector !=3D
> +		    scan->component[nb_sets - 1].dc_entropy_coding_table_selector ||
> +		    scan->component[k].ac_entropy_coding_table_selector !=3D
> +		    scan->component[nb_sets - 1].ac_entropy_coding_table_selector) {
> +			dev_err_ratelimited(jpegd->dev,
> +					    "JPEG component %u uses other Huffman tables than component %u\=
n",
> +					    k, nb_sets - 1);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for (k =3D 0; k < nb_sets; k++) {
> +		u8 dc_sel =3D scan->component[k].dc_entropy_coding_table_selector;
> +		u8 ac_sel =3D scan->component[k].ac_entropy_coding_table_selector;
> +		u8 dc_bits[16], ac_bits[16];
> +		const u8 *dc_src, *ac_src, *dc_vals, *ac_vals;
> +		unsigned int dc_huffval_len, ac_huffval_len;
> +		size_t dc_len, ac_len;
> +		u16 min_dc[16], acc_dc[16];
> +		u16 min_ac[16], acc_ac[16];
> +
> +		if (dc_sel > 1 || ac_sel > 1) {
> +			dev_err_ratelimited(jpegd->dev,
> +					    "JPEG component %u selects Huffman tables dc=3D%u ac=3D%u\n",
> +					    k, dc_sel, ac_sel);
> +			return -EINVAL;
> +		}
> +
> +		dc_src =3D vdpu720_huffman_table(hdr, dc_sel, &dc_len);
> +		ac_src =3D vdpu720_huffman_table(hdr, 2 | ac_sel, &ac_len);
> +
> +		memcpy(dc_bits, dc_src, sizeof(dc_bits));
> +		memcpy(ac_bits, ac_src, sizeof(ac_bits));
> +		dc_vals =3D dc_src + 16;
> +		ac_vals =3D ac_src + 16;
> +
> +		dc_huffval_len =3D 0;
> +		for (i =3D 0; i < 16; i++)
> +			dc_huffval_len +=3D dc_bits[i];
> +		ac_huffval_len =3D 0;
> +		for (i =3D 0; i < 16; i++)
> +			ac_huffval_len +=3D ac_bits[i];
> +
> +		if (16 + dc_huffval_len > dc_len || 16 + ac_huffval_len > ac_len) {
> +			dev_err_ratelimited(jpegd->dev,
> +					    "JPEG Huffman table for component %u changed after it was queue=
d\n",
> +					    k);
> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * The accumulated addresses are packed two per u16, so a table
> +		 * the hardware cannot hold would be truncated into one
> +		 * silently.  The value block is the tighter of the two limits.
> +		 */
> +		if (dc_huffval_len > VDPU720_DC_VALUES_MAX ||
> +		    ac_huffval_len > VDPU720_AC_VALUES_MAX) {
> +			dev_err_ratelimited(jpegd->dev,
> +					    "JPEG Huffman table too large for component %u (dc=3D%u ac=3D%u=
)\n",
> +					    k, dc_huffval_len, ac_huffval_len);
> +			return -EINVAL;
> +		}
> +
> +		vdpu720_compute_mincode(dc_bits, min_dc, acc_dc);
> +		vdpu720_compute_mincode(ac_bits, min_ac, acc_ac);
> +
> +		for (i =3D 0; i < 16; i++)
> +			*p_mincode++ =3D cpu_to_le16(min_dc[i]);
> +		for (i =3D 0; i < 8; i++)
> +			*p_mincode++ =3D cpu_to_le16(acc_dc[2 * i] |
> +						   (acc_dc[2 * i + 1] << 8));
> +		for (i =3D 0; i < 16; i++)
> +			*p_mincode++ =3D cpu_to_le16(min_ac[i]);
> +		for (i =3D 0; i < 8; i++)
> +			*p_mincode++ =3D cpu_to_le16(acc_ac[2 * i] |
> +						   (acc_ac[2 * i + 1] << 8));
> +
> +		/* Zero-pad the value block, then fill DC then AC values. */
> +		memset(p_value, 0, VDPU720_HVALUE_SET_SIZE);
> +		memcpy(p_value, dc_vals, dc_huffval_len);
> +		memcpy(p_value + VDPU720_DC_VALUES_MAX, ac_vals, ac_huffval_len);
> +		p_value +=3D VDPU720_HVALUE_SET_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * vdpu720_fill_regs() - program the decoder registers for one frame
> + * @ctx:		context the job belongs to
> + * @hdr:		parsed JPEG header
> + * @tbl_dma:		DMA address of the Q/Huffman table side buffer
> + * @strm_dma:		DMA address of the entropy stream, 16-byte aligned
> + * @strm_start_byte:	offset of the first stream byte within that word
> + * @strm_len_blks:	stream length in 16-byte blocks, minus one
> + * @out_dma:		DMA address of the destination NV12 buffer
> + *
> + * Return: 0 on success, negative errno for a frame the hardware cannot =
be
> + * programmed for.
> + */
> +static int vdpu720_fill_regs(struct rkjpegd_ctx *ctx,
> +			     const struct v4l2_jpeg_header *hdr,
> +			     dma_addr_t tbl_dma,
> +			     dma_addr_t strm_dma, u32 strm_start_byte,
> +			     u32 strm_len_blks,
> +			     dma_addr_t out_dma)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	u32 jpeg_width  =3D hdr->frame.width;
> +	u32 jpeg_height =3D hdr->frame.height;
> +	u32 buf_width, buf_height;
> +	u32 w_align;
> +	u32 y_stride;	/* units of 16 pixels */
> +	u32 y_vstride;	/* sets the UV plane offset */
> +	u32 nb_comp     =3D hdr->frame.num_components;
> +	/* One Q-table entry per component, not one per DQT segment. */
> +	u32 qtbl_sel  =3D nb_comp;
> +	/* One H-table set for grayscale, two for colour. */
> +	u32 htbl_sel  =3D vdpu720_nb_htbl_sets(nb_comp);
> +	u32 mcu_width, mcu_height, jpeg_height_aligned;
> +	u32 qtbl_len, hmin_len, hval_len;
> +	int jpeg_mode;
> +	u32 reg;
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	buf_width  =3D ctx->dst_fmt.width;
> +	buf_height =3D ctx->dst_fmt.height;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	w_align   =3D ALIGN(buf_width, 16);
> +	y_stride  =3D w_align >> 4;
> +	y_vstride =3D y_stride * buf_height;
> +
> +	jpeg_mode =3D vdpu720_jpeg_mode(&hdr->frame);
> +	if (jpeg_mode < 0) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "unsupported JPEG sampling factors %ux%u\n",
> +				    hdr->frame.component[0].horizontal_sampling_factor,
> +				    hdr->frame.component[0].vertical_sampling_factor);
> +		return jpeg_mode;
> +	}
> +
> +	mcu_width  =3D vdpu720_mcu_width(jpeg_mode);
> +	mcu_height =3D vdpu720_mcu_height(jpeg_mode);
> +	jpeg_height_aligned =3D ALIGN(jpeg_height, mcu_height);
> +
> +	/*
> +	 * Dimensions come from the bitstream, strides from the negotiated
> +	 * capture format, so refuse a frame larger than was negotiated.  The
> +	 * width is compared raw because that is what the decoder lays a row
> +	 * down at; only the height is MCU aligned, PIC_H drives the MCU row
> +	 * count.
> +	 */
> +	if (jpeg_width > buf_width || jpeg_height_aligned > buf_height) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "JPEG %ux%u does not fit the negotiated %ux%u\n",
> +				    jpeg_width, jpeg_height_aligned,
> +				    buf_width, buf_height);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * FILL_DOWN_E completes the bottom of the picture for the vertically
> +	 * subsampled output chroma; the reference driver sets it for every
> +	 * NV12 conversion.  FILL_RIGHT_E does the same on the right, but only
> +	 * the 8 pixel MCU widths can stop short of the 16 pixel aligned
> +	 * buffer.
> +	 */
> +	reg =3D FIELD_PREP(VDPU720_YUV_OUT_FMT, VDPU720_YUV_OUT_FMT_NV12) |
> +	      VDPU720_FILL_DOWN_E;
> +	if (ALIGN(jpeg_width, mcu_width) < ALIGN(jpeg_width, 16))
> +		reg |=3D VDPU720_FILL_RIGHT_E;
> +	rkjpegd_write_relaxed(jpegd, reg, VDPU720_REG_SYS);
> +
> +	/*
> +	 * PIC_H is MCU aligned because the vertical MCU count derives from
> +	 * it.  PIC_W is not: the decoder lays rows down at the picture width,
> +	 * so a PIC_W past it shifts every row against the buffer.
> +	 */
> +	rkjpegd_write_relaxed(jpegd,
> +			      FIELD_PREP(VDPU720_PIC_W_M1, jpeg_width - 1) |
> +			      FIELD_PREP(VDPU720_PIC_H_M1, jpeg_height_aligned - 1),
> +			      VDPU720_REG_PIC_SIZE);
> +
> +	/* REG4: JPEG format, Q/H table counts, restart interval */
> +	qtbl_len =3D VDPU720_TBL_LEN(qtbl_sel * VDPU720_QTBL_COMP_SIZE);
> +	hmin_len =3D VDPU720_TBL_LEN(htbl_sel * VDPU720_HMINCODE_SET_SIZE);
> +	hval_len =3D VDPU720_TBL_LEN(htbl_sel * VDPU720_HVALUE_SET_SIZE);
> +
> +	reg =3D FIELD_PREP(VDPU720_JPEG_MODE, jpeg_mode) |
> +	      FIELD_PREP(VDPU720_PIX_DEPTH, VDPU720_PIX_DEPTH_8) |
> +	      FIELD_PREP(VDPU720_QTBL_SEL, qtbl_sel) |
> +	      FIELD_PREP(VDPU720_HTBL_SEL, htbl_sel);
> +	if (hdr->restart_interval) {
> +		reg |=3D VDPU720_DRI_E;
> +		reg |=3D FIELD_PREP(VDPU720_DRI_MCU_M1, hdr->restart_interval - 1);
> +	}
> +	rkjpegd_write_relaxed(jpegd, reg, VDPU720_REG_PIC_FMT);
> +
> +	/* REG5: horizontal virtual strides */
> +	rkjpegd_write_relaxed(jpegd,
> +			      FIELD_PREP(VDPU720_Y_HOR_STRIDE, y_stride) |
> +			      FIELD_PREP(VDPU720_UV_HOR_STRIDE, y_stride),
> +			      VDPU720_REG_HOR_STRIDE);
> +
> +	/* REG6: total Y-plane size (stride-units * height) */
> +	rkjpegd_write_relaxed(jpegd, FIELD_PREP(VDPU720_Y_VSTRIDE, y_vstride),
> +			      VDPU720_REG_Y_VSTRIDE);
> +
> +	/* REG7: table lengths + high stride bit */
> +	reg =3D FIELD_PREP(VDPU720_QTBL_LEN, qtbl_len) |
> +	      FIELD_PREP(VDPU720_HTBL_MINCODE_LEN, hmin_len) |
> +	      FIELD_PREP(VDPU720_HTBL_VALUE_LEN, hval_len) |
> +	      FIELD_PREP(VDPU720_Y_HOR_STRIDE_H, y_stride >> 16);
> +	rkjpegd_write_relaxed(jpegd, reg, VDPU720_REG_TBL_LEN);
> +
> +	/* REG8: stream length and start byte */
> +	rkjpegd_write_relaxed(jpegd,
> +			      FIELD_PREP(VDPU720_STRM_START_BYTE, strm_start_byte) |
> +			      FIELD_PREP(VDPU720_STRM_LEN, strm_len_blks),
> +			      VDPU720_REG_STRM_LEN);
> +
> +	/* REG9-REG11: Q/H table DMA addresses (side buffer) */
> +	rkjpegd_write_addr(jpegd, VDPU720_REG_QTBL_BASE, tbl_dma);
> +	rkjpegd_write_addr(jpegd, VDPU720_REG_HTBL_MINCODE,
> +			   tbl_dma + VDPU720_HMINCODE_OFF);
> +	rkjpegd_write_addr(jpegd, VDPU720_REG_HTBL_VALUE,
> +			   tbl_dma + VDPU720_HVALUE_OFF);
> +
> +	/* REG12: stream base (16-byte aligned) */
> +	rkjpegd_write_addr(jpegd, VDPU720_REG_STRM_BASE, strm_dma);
> +
> +	/* REG13: NV12 output buffer */
> +	rkjpegd_write_addr(jpegd, VDPU720_REG_OUT_BASE, out_dma);
> +
> +	/* REG14: stream error handling defaults */
> +	rkjpegd_write_relaxed(jpegd, VDPU720_STRM_ERR_DFLT, VDPU720_REG_STRM_ER=
R);
> +
> +	/* REG16: enable all internal clock gates */
> +	rkjpegd_write_relaxed(jpegd, VDPU720_CLK_GATE_ALL, VDPU720_REG_CLK_GATE=
);
> +
> +	/* REG30: AXI performance counter */
> +	rkjpegd_write_relaxed(jpegd,
> +			      VDPU720_PERF_WORK_E | VDPU720_PERF_CLR_E |
> +			      VDPU720_PERF_CNT_TYPE |
> +			      FIELD_PREP(VDPU720_PERF_RD_LAT_ID, 0xa),
> +			      VDPU720_REG_PERF_CTRL);
> +
> +	return 0;
> +}
> +
> +/**
> + * rkjpegd_begin_cpu_access() - make a buffer coherent for the CPU
> + * @vb:		buffer accessed through its kernel mapping
> + * @dir:	direction of the access
> + *
> + * videobuf2 does no cache maintenance for an imported dmabuf, so leave =
it to
> + * the exporter.  The buffers allocated here are coherent and need none.
> + *
> + * Return: 0 on success, or the error from dma_buf_begin_cpu_access().
> + */
> +static int rkjpegd_begin_cpu_access(struct vb2_buffer *vb,
> +				    enum dma_data_direction dir)
> +{
> +	if (vb->memory !=3D VB2_MEMORY_DMABUF)
> +		return 0;
> +
> +	return dma_buf_begin_cpu_access(vb->planes[0].dbuf, dir);
> +}
> +
> +static void rkjpegd_end_cpu_access(struct vb2_buffer *vb,
> +				   enum dma_data_direction dir)
> +{
> +	if (vb->memory =3D=3D VB2_MEMORY_DMABUF)
> +		dma_buf_end_cpu_access(vb->planes[0].dbuf, dir);
> +}
> +
> +/**
> + * vdpu720_fill_chroma() - write neutral chroma for a grayscale frame
> + * @ctx:	context the job belongs to
> + * @dst_buf:	capture buffer whose chroma plane is filled
> + *
> + * The output format converter has no YUV400 path: VDPU720_YUV_OUT_FMT_N=
V12
> + * only covers the subsampled colour modes, and for a single component f=
rame
> + * the hardware writes the luma plane and leaves the chroma plane untouc=
hed.
> + *
> + * Fill the plane here, before the hardware is started: once the decode =
is
> + * running the interrupt can complete the job and hand the buffer to
> + * userspace at any time.
> + *
> + * Return: 0 on success, -EINVAL if the capture buffer has no kernel map=
ping,
> + * or the error from dma_buf_begin_cpu_access() for an imported buffer.
> + */
> +static int vdpu720_fill_chroma(struct rkjpegd_ctx *ctx,
> +			       struct vb2_v4l2_buffer *dst_buf)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	struct vb2_buffer *vb =3D &dst_buf->vb2_buf;
> +	u32 y_size, size;
> +	void *dst_cpu;
> +	int ret;
> +
> +	mutex_lock(&ctx->fmt_lock);

I keep seeing this fmt lock over and over and can't get my head around why =
you
would need that. There is implicit locking in the VIDIOC system that do pro=
tect
these. Again, can you in your own word explain your choices ?

> +	y_size =3D ctx->dst_fmt.plane_fmt[0].bytesperline * ctx->dst_fmt.height=
;
> +	size =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	dst_cpu =3D vb2_plane_vaddr(vb, 0);
> +	if (!dst_cpu) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "JPEG capture buffer has no kernel mapping\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D rkjpegd_begin_cpu_access(vb, DMA_TO_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	memset(dst_cpu + y_size, 0x80, size - y_size);
> +
> +	rkjpegd_end_cpu_access(vb, DMA_TO_DEVICE);

This had no place here, should be done by the io ops.

> +
> +	return 0;
> +}
> +
> +/**
> + * rkjpegd_vdpu720_init() - allocate the table side buffer
> + * @ctx:	context to allocate the Q/Huffman table buffer for
> + *
> + * Return: 0 on success, -ENOMEM if the allocation failed.
> + */
> +static int rkjpegd_vdpu720_init(struct rkjpegd_ctx *ctx)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +
> +	ctx->table_base.size =3D VDPU720_TABLE_BUF_SIZE;
> +	ctx->table_base.cpu =3D dma_alloc_noncoherent(jpegd->dev,
> +						    ctx->table_base.size,
> +						    &ctx->table_base.dma,
> +						    DMA_TO_DEVICE, GFP_KERNEL);
> +	if (!ctx->table_base.cpu)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/**
> + * rkjpegd_vdpu720_exit() - free the table side buffer
> + * @ctx:	context the buffer belongs to
> + */
> +static void rkjpegd_vdpu720_exit(struct rkjpegd_ctx *ctx)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +
> +	dma_free_noncoherent(jpegd->dev, ctx->table_base.size,
> +			     ctx->table_base.cpu, ctx->table_base.dma,
> +			     DMA_TO_DEVICE);
> +}
> +
> +/**
> + * vdpu720_soft_reset() - ask the block to reset itself
> + * @jpegd:	device to reset
> + *
> + * Trigger the in-block soft reset and wait for it to report ready.  Sle=
eps
> + * while polling, so it must not be called from atomic context.
> + *
> + * Return: 0 once the block reports the reset complete, -ETIMEDOUT if it=
 does
> + * not do so within 10 ms.
> + */
> +static int vdpu720_soft_reset(struct rkjpegd_dev *jpegd)
> +{
> +	u32 status;
> +	int ret;
> +
> +	/* Idle blocks want FORCE_SOFTRESET_VALID first, per downstream BSP. */
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +	if (!(status & VDPU720_DEC_E))
> +		rkjpegd_write(jpegd, VDPU720_FORCE_SOFTRST, VDPU720_REG_SYS);
> +
> +	rkjpegd_write(jpegd, status | VDPU720_SOFT_RST_EN, VDPU720_REG_INT);
> +
> +	ret =3D readl_relaxed_poll_timeout(jpegd->regs + VDPU720_REG_INT, statu=
s,
> +					 status & VDPU720_SOFT_RST_RDY,
> +					 5, 10000);
> +	if (ret)
> +		dev_warn(jpegd->dev, "soft reset timed out\n");
> +
> +	return ret;
> +}
> +
> +/**
> + * vdpu720_hard_reset() - pulse the block's reset lines
> + * @jpegd:	device to reset
> + *
> + * reset_control_reset() is not usable here.  The lines come from a Rock=
chip
> + * CRU, and rockchip_softrst_ops in drivers/clk/rockchip/softrst.c imple=
ments
> + * only .assert and .deassert, so reset_control_reset() returns -ENOTSUP=
P
> + * without touching the hardware.  Drive the pulse by hand instead.
> + *
> + * Return: 0 on success, negative errno if a reset control could not be
> + * asserted or deasserted.
> + */
> +static int vdpu720_hard_reset(struct rkjpegd_dev *jpegd)
> +{
> +	int ret;
> +
> +	ret =3D reset_control_assert(jpegd->resets);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +
> +	return reset_control_deassert(jpegd->resets);
> +}
> +
> +/**
> + * rkjpegd_vdpu720_reset() - put the block back into a known state
> + * @ctx:	context the block is being reset on behalf of
> + *
> + * Try a soft reset first; fall back to a full hardware reset if the sof=
t
> + * reset does not complete.  Reached from the watchdog and from
> + * rkjpegd_abort_job(), and from rkjpegd_vdpu720_run() for a block the l=
ast
> + * job left unparked, see @rkjpegd_dev.needs_reset.  Sleeps, so it must =
not
> + * be called from the interrupt handler.
> + */
> +static void rkjpegd_vdpu720_reset(struct rkjpegd_ctx *ctx)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	int ret;
> +
> +	ret =3D vdpu720_soft_reset(jpegd);
> +	if (ret) {
> +		dev_warn(jpegd->dev, "falling back to hard reset\n");
> +
> +		ret =3D vdpu720_hard_reset(jpegd);
> +		if (ret)
> +			dev_err(jpegd->dev, "hard reset failed: %d\n", ret);
> +	}
> +
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	jpegd->needs_reset =3D false;
> +}
> +
> +/**
> + * rkjpegd_vdpu720_run() - fill the side buffer, program the registers a=
nd
> + *			   start the hardware
> + * @ctx:	context holding the queues and the side buffer
> + *
> + * The header was parsed when the coded buffer was queued and its refere=
nces
> + * still point into that buffer, which stays mapped until the job comple=
tes.
> + *
> + * Return: 0 with the hardware started and the watchdog armed, or a nega=
tive
> + * errno for a frame that cannot be decoded.
> + */
> +static int rkjpegd_vdpu720_run(struct rkjpegd_ctx *ctx)
> +{
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct rkjpegd_src_buf *src;
> +	const struct v4l2_jpeg_header *hdr;
> +	dma_addr_t src_dma, dst_dma;
> +	u32 data_offset, payload;
> +	u32 hw_strm_off, strm_off, strm_start_byte, strm_len_blks;
> +	int ret;
> +
> +	src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	src =3D vb2_to_rkjpegd_src_buf(&src_buf->vb2_buf);
> +
> +	if (!src->parsed)
> +		return -EINVAL;
> +
> +	/* The last job left the block in an unknown state, see @needs_reset. *=
/
> +	if (jpegd->needs_reset)
> +		rkjpegd_vdpu720_reset(ctx);
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	ctx->job_payload =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	/* Prepared before a source change, the buffer may predate the format. =
*/
> +	if (vb2_plane_size(&dst_buf->vb2_buf, 0) < ctx->job_payload) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "capture buffer of %lu bytes, format needs %u\n",
> +				    vb2_plane_size(&dst_buf->vb2_buf, 0),
> +				    ctx->job_payload);
> +		return -EINVAL;
> +	}
> +
> +	hdr =3D &src->header;
> +	src_dma =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	dst_dma =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	data_offset =3D src_buf->vb2_buf.planes[0].data_offset;
> +	payload =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> +
> +	memset(ctx->table_base.cpu, 0, ctx->table_base.size);
> +
> +	/* The tables are read from the coded buffer through the header. */
> +	ret =3D rkjpegd_begin_cpu_access(&src_buf->vb2_buf, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D vdpu720_write_qtbl(ctx, hdr);
> +	if (!ret)
> +		ret =3D vdpu720_write_htbl(ctx, hdr);
> +
> +	rkjpegd_end_cpu_access(&src_buf->vb2_buf, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	dma_sync_single_for_device(jpegd->dev, ctx->table_base.dma,
> +				   ctx->table_base.size, DMA_TO_DEVICE);
> +
> +	/*
> +	 * STRM_BASE must be 16-byte aligned, so split the address and record
> +	 * the sub-block start byte.  Both come from the start of the plane,
> +	 * not the payload: videobuf2 lets data_offset carry arbitrary low
> +	 * bits, which STRM_BASE has no way to encode.
> +	 */
> +	strm_off        =3D data_offset + hdr->ecs_offset;
> +	hw_strm_off     =3D strm_off & ~0xfU;
> +	strm_start_byte =3D strm_off & 0xfU;
> +	strm_len_blks   =3D (ALIGN(payload - hw_strm_off, 16) - 1) >> 4;
> +
> +	ret =3D vdpu720_fill_regs(ctx, hdr, ctx->table_base.dma,
> +				src_dma + hw_strm_off, strm_start_byte,
> +				strm_len_blks, dst_dma);
> +	if (ret)
> +		return ret;
> +
> +	if (hdr->frame.num_components =3D=3D 1) {
> +		ret =3D vdpu720_fill_chroma(ctx, dst_buf);

That seems crazy expensive. If the HW does not fill the chroma, why do you =
pick
a multi-plane format in the first place. Use a Y only format instead.

Fixing that should let you skip kernel mapping of the destination buffer
perhaps.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	rkjpegd_arm_watchdog(jpegd);
> +
> +	/*
> +	 * A frame whose entropy data ends early runs the decoder off the end
> +	 * of the stream, and with the condition masked it waits instead of
> +	 * reporting.  VDPU720_ERR_MASK already covers the status.
> +	 */
> +	rkjpegd_write(jpegd,
> +		      VDPU720_DEC_E | VDPU720_TIMEOUT_E | VDPU720_BUF_EMPTY_E,
> +		      VDPU720_REG_INT);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_id;
> +	enum vb2_buffer_state state;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	u32 status;
> +
> +	/* The registers are only clocked while the device is runtime active. *=
/
> +	if (pm_runtime_get_if_active(jpegd->dev) <=3D 0)
> +		return IRQ_NONE;

Was that sashiko asking you to do that ? To start with, if you clock off th=
e
device, you won't get the IRQ. If you clock off the device between the star=
t of
this function and here in a race, you have some bigger problems in your dri=
ver.

This type of IP is not free-running, its trigger based. When its triggered,=
 it
should be busy and a PM ref should be held. Be careful with sashiko remarks=
, it
does not differentiate free-running IP from triggered IP.

I'm also a little worried that maybe you don't actually understand this, si=
nce
its quite possible you simply fed sashiko into your llm to produce this v5.

> +
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +
> +	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
> +	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT);
> +
> +	if (!(status & VDPU720_IRQ_RAW))
> +		goto out_put;
> +
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	state =3D (status & VDPU720_ERR_MASK) ?
> +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;

nit: Sometimes its nice to set the payload size to zero, to signal that thi=
s is
not minor data corruption but a complete decode failure. Looking below, mos=
t
err_info imply this. Its not a bug in your implementation though.

> +
> +	/*
> +	 * A block that did not park itself wedges on the next frame, and a
> +	 * clean frame can leave it unparked too, as SOFT_RST_RDY shows.  The
> +	 * reset sleeps, so leave it to rkjpegd_vdpu720_run().  The next job
> +	 * is only started after job_spinlock has released this one, which
> +	 * orders the store.
> +	 */
> +	if (state =3D=3D VB2_BUF_STATE_ERROR || !(status & VDPU720_SOFT_RST_RDY=
))
> +		jpegd->needs_reset =3D true;
> +
> +	if (status & VDPU720_DEC_ERR) {
> +		u32 mcu_pos  =3D rkjpegd_read(jpegd, VDPU720_REG_DBG_MCU_POS);
> +		u32 err_info =3D rkjpegd_read(jpegd, VDPU720_REG_DBG_ERROR);
> +
> +		dev_warn_ratelimited(jpegd->dev,
> +				     "decode error: MCU pos=3D(%u,%u) flags=3D0x%04x [%s%s%s%s%s%s%s=
%s%s%s] first_idx=3D%u\n",
> +				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_X, mcu_pos),
> +				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_Y, mcu_pos),
> +				     (u32)FIELD_GET(VDPU720_DERR_FLAGS, err_info),
> +				     (err_info & VDPU720_DERR_DRI_SEQ)     ? "dri_seq "    : "",
> +				     (err_info & VDPU720_DERR_STREAM_FFFF) ? "ffff "       : "",
> +				     (err_info & VDPU720_DERR_OTHER_MARK)  ? "bad_mark "   : "",
> +				     (err_info & VDPU720_DERR_MCU_CNT_L)   ? "dri_early "  : "",
> +				     (err_info & VDPU720_DERR_MCU_CNT_M)   ? "dri_late "   : "",
> +				     (err_info & VDPU720_DERR_EOI_NO_END)  ? "eoi_early "  : "",
> +				     (err_info & VDPU720_DERR_END_NO_EOI)  ? "no_eoi "     : "",
> +				     (err_info & VDPU720_DERR_OVERFLOW)    ? "overflow "   : "",
> +				     (err_info & VDPU720_DERR_HUFF_EMPTY)  ? "huff_empty " : "",
> +				     (err_info & (VDPU720_DERR_STREAM_R0 |
> +						  VDPU720_DERR_STREAM_R1)) ? "stream_mark " : "",
> +				     (u32)FIELD_GET(VDPU720_DERR_FIRST_IDX, err_info));
> +
> +		rkjpegd_write(jpegd, err_info, VDPU720_REG_DBG_ERROR);
> +	}
> +
> +	rkjpegd_irq_done(jpegd, state);
> +	ret =3D IRQ_HANDLED;
> +
> +out_put:
> +	pm_runtime_put_autosuspend(jpegd->dev);

And here you drop your pm ref, showing that the condition at the start is n=
ot
possible.

> +
> +	return ret;
> +}
> +
> +/**
> + * rkjpegd_abort_job() - take a running job away from the hardware
> + * @jpegd:	device whose current job is to be ended
> + *
> + * Resets the block and hands the frame back as an error even if it did
> + * complete: the reset went through underneath it and cleared the interr=
upt
> + * that would have said so.  The interrupt is masked across the sequence=
 so a
> + * completion arriving in the middle cannot finish the job a second time=
.
> + *
> + * The caller must have stopped the watchdog from firing first.  Which o=
f the
> + * two completes a job is decided by the cancel_delayed_work() in
> + * rkjpegd_irq_done(), so a watchdog that is still armed makes this racy=
.
> + */
> +static void rkjpegd_abort_job(struct rkjpegd_dev *jpegd)
> +{
> +	struct rkjpegd_ctx *ctx;
> +
> +	disable_irq(jpegd->irq);

That is not needed for triggered IP, drop.

> +
> +	ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> +	if (ctx) {
> +		rkjpegd_vdpu720_reset(ctx);
> +		rkjpegd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	enable_irq(jpegd->irq);
> +}
> +
> +static void rkjpegd_watchdog(struct work_struct *work)
> +{
> +	struct rkjpegd_dev *jpegd =3D container_of(to_delayed_work(work),
> +						 struct rkjpegd_dev,
> +						 watchdog_work);
> +
> +	if (!v4l2_m2m_get_curr_priv(jpegd->m2m_dev))
> +		return;
> +
> +	dev_err(jpegd->dev, "frame processing timed out\n");
> +
> +	/* After RKJPEGD_TIMEOUT_MS the frame is an error, completed or not. */
> +	rkjpegd_abort_job(jpegd);
> +}
> +
> +/**
> + * rkjpegd_source_change() - report a resolution change to userspace
> + * @ctx:	context the coded buffer belongs to
> + * @src_buf:	coded buffer whose header the new resolution is taken from
> + *
> + * Renegotiates the capture format from @src_buf and reports it, unless =
it
> + * already describes what was negotiated or @src_buf is a refused frame =
past
> + * the first of the stream.  Sets @rkjpegd_ctx.source_change,
> + * which stops rkjpegd_job_ready() from letting any further job run unti=
l
> + * decoding is resumed.
> + *
> + * Called both when a coded buffer is queued and when one reaches the he=
ad of
> + * the queue, see the comments at those two call sites.
> + *
> + * Return: true if a change was reported.
> + */
> +static bool rkjpegd_source_change(struct rkjpegd_ctx *ctx,
> +				  struct rkjpegd_src_buf *src_buf)
> +{
> +	u32 width, height, buf_width, buf_height;
> +
> +	if (src_buf->parsed) {
> +		width =3D src_buf->header.frame.width;
> +		height =3D src_buf->header.frame.height;
> +	} else {
> +		/*
> +		 * A refused frame has no dimensions, but an application waiting
> +		 * on V4L2_FMT_FLAG_DYN_RESOLUTION for the first one needs the
> +		 * event anyway.  Later ones are only failed.
> +		 */
> +		width =3D ctx->src_fmt.width;
> +		height =3D ctx->src_fmt.height;
> +	}
> +	buf_width =3D ALIGN(width, RKJPEGD_RAW_STEP);
> +	buf_height =3D ALIGN(height, RKJPEGD_RAW_STEP);
> +
> +	mutex_lock(&ctx->fmt_lock);
> +
> +	if (!ctx->initial_source_change &&
> +	    (!src_buf->parsed ||
> +	     (ctx->dst_fmt.width =3D=3D buf_width &&
> +	      ctx->dst_fmt.height =3D=3D buf_height &&
> +	      ctx->crop.width =3D=3D width && ctx->crop.height =3D=3D height)))=
 {
> +		mutex_unlock(&ctx->fmt_lock);
> +		return false;
> +	}
> +
> +	rkjpegd_fill_raw_fmt(&ctx->dst_fmt, buf_width, buf_height);

Are you modifying dst_fmt while you have allocated buffers on your queue ?

> +	ctx->crop.left =3D 0;
> +	ctx->crop.top =3D 0;
> +	ctx->crop.width =3D width;
> +	ctx->crop.height =3D height;
> +	ctx->source_change =3D true;
> +	ctx->initial_source_change =3D false;
> +
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	dev_dbg(ctx->dev->dev, "source change to %ux%u\n", width, height);
> +
> +	v4l2_event_queue_fh(&ctx->fh, &rkjpegd_src_change_event);
> +
> +	return true;
> +}
> +
> +static void rkjpegd_device_run(void *priv)
> +{
> +	struct rkjpegd_ctx *ctx =3D priv;
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	struct vb2_v4l2_buffer *src, *dst;
> +	int ret;
> +
> +	src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	if (WARN_ON(!src) || WARN_ON(!dst))
> +		return;

I don't think m2m framework will call run unless this condition is met, so =
this
si likely redundant, please verify.

> +
> +	/* While decoding, a resolution change is only looked for here. */
> +	if (rkjpegd_source_change(ctx, vb2_to_rkjpegd_src_buf(&src->vb2_buf))) =
{
> +		/*
> +		 * Hand dst back as the LAST buffer, but keep src, it is decoded
> +		 * once decoding resumes.  A resolution change is not a drain, so
> +		 * the mem2mem drain state is left alone: rkjpegd_job_ready()
> +		 * holds the jobs back instead.
> +		 */
> +		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		rkjpegd_last_buffer_done(ctx, dst);
> +		v4l2_m2m_job_finish(jpegd->m2m_dev, ctx->fh.m2m_ctx);
> +		return;
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(jpegd->dev);
> +	if (ret < 0)
> +		goto err_finish;
> +
> +	v4l2_m2m_buf_copy_metadata(src, dst);
> +
> +	ret =3D rkjpegd_vdpu720_run(ctx);
> +	if (ret)
> +		goto err_pm_put;
> +
> +	return;
> +
> +err_pm_put:
> +	pm_runtime_put_autosuspend(jpegd->dev);
> +err_finish:
> +	rkjpegd_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static int rkjpegd_job_ready(void *priv)
> +{
> +	struct rkjpegd_ctx *ctx =3D priv;
> +
> +	return ctx->source_change ? 0 : 1;
> +}
> +
> +static const struct v4l2_m2m_ops rkjpegd_m2m_ops =3D {
> +	.device_run =3D rkjpegd_device_run,
> +	.job_ready =3D rkjpegd_job_ready,
> +};
> +
> +/*
> + * Bitstream inspection
> + *
> + * The header is parsed when the buffer is queued rather than when the j=
ob
> + * runs: the resolution it carries is what a source change reports, and =
the
> + * references it hands out point into the payload, which stays mapped un=
til
> + * the buffer is given back.
> + */
> +
> +/**
> + * rkjpegd_has_eoi() - look for the end of image marker of a frame
> + * @data:	the frame
> + * @start:	offset of the entropy coded data in @data
> + * @len:	length of @data
> + *
> + * v4l2_jpeg_parse_header() never looks behind the start of scan, so a

If there is something about the common parser, fix the common parser. We do=
n't
want every driver to implement its own parsing. JPEG decoders are already t=
he
exception, this is why we have stateless decoders for everything that was m=
ade
later.

> + * truncated frame parses without an error and decodes into a half fille=
d
> + * picture.  An end of image marker cannot appear inside the entropy cod=
ed
> + * data, so finding one behind @start means the frame is complete.
> + *
> + * The buffer is uncached, so it is copied out in small chunks, not scan=
ned
> + * as a whole.  Trailing padding, 0x00 and 0xff, is skipped at any lengt=
h;
> + * behind it the marker is looked for in the last sizeof(tail) bytes.
> + *
> + * Return: true if the frame has an end of image marker.
> + */
> +static bool rkjpegd_has_eoi(const void *data, u32 start, u32 len)
> +{
> +	u8 tail[128];
> +	u32 n, i;
> +
> +	while (len > start) {
> +		n =3D min_t(u32, len - start, sizeof(tail));
> +		memcpy(tail, data + len - n, n);
> +
> +		for (i =3D n; i && (tail[i - 1] =3D=3D 0x00 || tail[i - 1] =3D=3D 0xff=
); i--)
> +			;
> +
> +		len -=3D n - i;
> +		if (i)
> +			break;
> +	}
> +
> +	n =3D min_t(u32, len - start, sizeof(tail));
> +	memcpy(tail, data + len - n, n);
> +
> +	for (i =3D 0; i + 1 < n; i++)
> +		if (tail[i] =3D=3D 0xff && tail[i + 1] =3D=3D 0xd9)
> +			return true;
> +
> +	return false;
> +}
> +
> +static bool rkjpegd_header_supported(struct rkjpegd_dev *jpegd,
> +				     const struct v4l2_jpeg_header *header,
> +				     u32 len)
> +{
> +	if (header->frame.width < RKJPEGD_MIN_WIDTH ||
> +	    header->frame.height < RKJPEGD_MIN_HEIGHT ||
> +	    header->frame.width > RKJPEGD_MAX_SIZE ||
> +	    header->frame.height > RKJPEGD_MAX_SIZE) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "unsupported JPEG picture size %ux%u, not within %ux%u..%ux%u\n"=
,
> +				    header->frame.width, header->frame.height,
> +				    RKJPEGD_MIN_WIDTH, RKJPEGD_MIN_HEIGHT,
> +				    RKJPEGD_MAX_SIZE, RKJPEGD_MAX_SIZE);
> +		return false;
> +	}
> +
> +	/* The register programming always asks for eight bit samples. */
> +	if (header->frame.precision !=3D 8) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "unsupported JPEG sample precision %u\n",
> +				    header->frame.precision);
> +		return false;
> +	}
> +
> +	if (header->frame.num_components !=3D 1 &&
> +	    header->frame.num_components !=3D 3) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "unsupported JPEG component count %u\n",
> +				    header->frame.num_components);
> +		return false;
> +	}
> +
> +	/* The output is NV12 only and the block has no RGB mode. */
> +	if (header->frame.num_components =3D=3D 3 &&
> +	    header->app14_tf =3D=3D V4L2_JPEG_APP14_TF_CMYK_RGB) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "unsupported RGB JPEG, Adobe APP14 transform 0\n");
> +		return false;
> +	}
> +
> +	if (header->scan->num_components !=3D header->frame.num_components) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "JPEG scan covers %u of %u components, non interleaved scans are=
 not supported\n",
> +				    header->scan->num_components,
> +				    header->frame.num_components);
> +		return false;
> +	}
> +
> +	if (header->ecs_offset >=3D len) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "JPEG entropy coded data starts beyond the payload\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool rkjpegd_parse_header(struct rkjpegd_dev *jpegd,
> +				 struct rkjpegd_src_buf *src_buf,
> +				 void *data, u32 len)
> +{
> +	int ret;
> +
> +	ret =3D v4l2_jpeg_parse_header(data, len, &src_buf->header);
> +	if (ret < 0) {
> +		dev_warn_ratelimited(jpegd->dev,
> +				     "failed to parse JPEG header: %d (len=3D%u first_bytes=3D%*ph)\=
n",
> +				     ret, len, min_t(int, len, 8), data);
> +		return false;
> +	}
> +
> +	if (!rkjpegd_header_supported(jpegd, &src_buf->header, len))
> +		return false;
> +
> +	if (!rkjpegd_has_eoi(data, src_buf->header.ecs_offset, len)) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "truncated JPEG, no end of image marker at the end of the %u byt=
e payload (buffer too small?)\n",
> +				    len);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void rkjpegd_parse_src_buf(struct rkjpegd_ctx *ctx,
> +				  struct vb2_buffer *vb)
> +{
> +	struct rkjpegd_src_buf *src_buf =3D vb2_to_rkjpegd_src_buf(vb);
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	u32 data_offset =3D vb->planes[0].data_offset;
> +	u32 len =3D vb2_get_plane_payload(vb, 0);
> +	void *data =3D vb2_plane_vaddr(vb, 0);
> +	int ret;
> +
> +	memset(&src_buf->header, 0, sizeof(src_buf->header));
> +	memset(&src_buf->scan, 0, sizeof(src_buf->scan));
> +	memset(src_buf->quantization_tables, 0,
> +	       sizeof(src_buf->quantization_tables));
> +	memset(src_buf->huffman_tables, 0, sizeof(src_buf->huffman_tables));
> +	src_buf->header.scan =3D &src_buf->scan;
> +	src_buf->header.quantization_tables =3D src_buf->quantization_tables;
> +	src_buf->header.huffman_tables =3D src_buf->huffman_tables;
> +	src_buf->parsed =3D false;
> +
> +	if (!data) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "JPEG buffer has no kernel mapping\n");
> +		return;
> +	}
> +
> +	if (len <=3D data_offset || len - data_offset < 4) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "JPEG payload of %u bytes is too short\n",
> +				    len);
> +		return;
> +	}
> +
> +	ret =3D rkjpegd_begin_cpu_access(vb, DMA_FROM_DEVICE);
> +	if (ret) {
> +		dev_err_ratelimited(jpegd->dev,
> +				    "cannot access JPEG buffer: %d\n", ret);
> +		return;
> +	}
> +
> +	src_buf->parsed =3D rkjpegd_parse_header(jpegd, src_buf,
> +					       data + data_offset,
> +					       len - data_offset);
> +
> +	rkjpegd_end_cpu_access(vb, DMA_FROM_DEVICE);
> +}
> +
> +static int rkjpegd_queue_setup(struct vb2_queue *vq, unsigned int *num_b=
uffers,
> +			       unsigned int *num_planes, unsigned int sizes[],
> +			       struct device *alloc_devs[])
> +{
> +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +	u32 sizeimage;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		sizeimage =3D ctx->src_fmt.plane_fmt[0].sizeimage;
> +	} else {
> +		mutex_lock(&ctx->fmt_lock);
> +		sizeimage =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
> +		mutex_unlock(&ctx->fmt_lock);
> +	}
> +
> +	if (*num_planes) {
> +		if (*num_planes !=3D 1)
> +			return -EINVAL;
> +		if (sizes[0] < sizeimage)
> +			return -EINVAL;
> +	} else {
> +		*num_planes =3D 1;
> +		sizes[0] =3D sizeimage;
> +	}
> +
> +	/*
> +	 * The first frame must report its resolution even when it matches,
> +	 * whether REQBUFS or CREATE_BUFS allocates the queue.
> +	 */
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type) && !vb2_get_num_buffers(vq)) {
> +		mutex_lock(&ctx->fmt_lock);
> +		ctx->initial_source_change =3D true;
> +		mutex_unlock(&ctx->fmt_lock);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field =3D V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_queue *vq =3D vb->vb2_queue;
> +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +	bool source_change;
> +	u32 sizeimage;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		if (vb2_plane_size(vb, 0) < ctx->src_fmt.plane_fmt[0].sizeimage)
> +			return -EINVAL;
> +
> +		return 0;
> +	}
> +
> +	/* The core's LAST buffers go back with whatever was set here. */
> +	to_vb2_v4l2_buffer(vb)->field =3D V4L2_FIELD_NONE;
> +
> +	mutex_lock(&ctx->fmt_lock);
> +	source_change =3D ctx->source_change;
> +	sizeimage =3D ctx->dst_fmt.plane_fmt[0].sizeimage;
> +	mutex_unlock(&ctx->fmt_lock);
> +
> +	/*
> +	 * A buffer queued while streaming with a change pending has the old
> +	 * size and carries no picture; stop_streaming() hands it back.  One
> +	 * queued while not streaming belongs to the new format.
> +	 */
> +	if (source_change && vb2_is_streaming(vq))
> +		return 0;
> +
> +	if (vb2_plane_size(vb, 0) < sizeimage)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void rkjpegd_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
> +		if (vb2_is_streaming(vb->vb2_queue) &&
> +		    v4l2_m2m_dst_buf_is_last(ctx->fh.m2m_ctx)) {
> +			rkjpegd_last_buffer_done(ctx, vbuf);
> +			v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> +			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> +			return;
> +		}
> +
> +		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +		return;
> +	}
> +
> +	rkjpegd_parse_src_buf(ctx, vb);

This function can fail, its not clear once you ignore the return value how =
the
error will propagade to device_run() and produce a matching error dst buffe=
r.

> +
> +	/*
> +	 * The first frame of a stream is reported here, where no job can run
> +	 * without a streaming capture queue.  Once it streams,
> +	 * rkjpegd_device_run() does it, serialised with the job completion.
> +	 * Renegotiating behind undecoded frames would pull the capture queue
> +	 * out from under them.
> +	 */
> +	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +	    !v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx))
> +		rkjpegd_source_change(ctx, vb2_to_rkjpegd_src_buf(vb));
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int rkjpegd_start_streaming(struct vb2_queue *vq, unsigned int co=
unt)
> +{
> +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +
> +	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, vq);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		ctx->sequence_out =3D 0;
> +	} else {
> +		ctx->sequence_cap =3D 0;
> +		mutex_lock(&ctx->fmt_lock);
> +		ctx->source_change =3D false;
> +		ctx->initial_source_change =3D false;
> +		mutex_unlock(&ctx->fmt_lock);
> +	}
> +
> +	return 0;
> +}
> +
> +static void rkjpegd_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	for (;;) {
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +		if (!vbuf)
> +			break;
> +		if (V4L2_TYPE_IS_CAPTURE(vq->type))
> +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +	}
> +
> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
> +
> +	/* A seek also ends a drain a resolution change had cut short. */
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +		ctx->fh.m2m_ctx->last_src_buf =3D NULL;
> +	else
> +		rkjpegd_resume_drain(ctx);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type) &&
> +	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> +		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);

That is strange, STREAMOFF will flush the queues, so adding an event to the
event queue seems odd, I never seen that before.

> +}
> +
> +static const struct vb2_ops rkjpegd_queue_ops =3D {
> +	.queue_setup =3D rkjpegd_queue_setup,
> +	.buf_out_validate =3D rkjpegd_buf_out_validate,
> +	.buf_prepare =3D rkjpegd_buf_prepare,
> +	.buf_queue =3D rkjpegd_buf_queue,
> +	.start_streaming =3D rkjpegd_start_streaming,
> +	.stop_streaming =3D rkjpegd_stop_streaming,
> +};
> +
> +static int rkjpegd_queue_init(void *priv, struct vb2_queue *src_vq,
> +			      struct vb2_queue *dst_vq)
> +{
> +	struct rkjpegd_ctx *ctx =3D priv;
> +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> +	int ret;
> +
> +	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv =3D ctx;
> +	src_vq->ops =3D &rkjpegd_queue_ops;
> +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +	src_vq->buf_struct_size =3D sizeof(struct rkjpegd_src_buf);
> +	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock =3D &jpegd->vdev_lock;
> +	src_vq->dev =3D jpegd->v4l2_dev.dev;
> +
> +	/*
> +	 * Mostly sequential access, so trade TLB efficiency for allocation
> +	 * speed.  Both queues keep their kernel mapping.
> +	 */
> +	src_vq->dma_attrs =3D DMA_ATTR_ALLOC_SINGLE_PAGES;
> +
> +	ret =3D vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv =3D ctx;
> +	dst_vq->ops =3D &rkjpegd_queue_ops;
> +	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock =3D &jpegd->vdev_lock;
> +	dst_vq->dev =3D jpegd->v4l2_dev.dev;
> +	dst_vq->dma_attrs =3D DMA_ATTR_ALLOC_SINGLE_PAGES;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +static int rkjpegd_open(struct file *filp)
> +{
> +	struct rkjpegd_dev *jpegd =3D video_drvdata(filp);
> +	struct rkjpegd_ctx *ctx;
> +	int ret;
> +
> +	ctx =3D kzalloc_obj(*ctx);

There is scope function to automatically free this on return.

> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev =3D jpegd;
> +	mutex_init(&ctx->fmt_lock);
> +	rkjpegd_reset_fmts(ctx);
> +	v4l2_fh_init(&ctx->fh, video_devdata(filp));
> +
> +	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(jpegd->m2m_dev, ctx,
> +					    rkjpegd_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_free_ctx;
> +	}
> +
> +	ret =3D rkjpegd_vdpu720_init(ctx);
> +	if (ret)
> +		goto err_cleanup_m2m_ctx;
> +
> +	v4l2_fh_add(&ctx->fh, filp);
> +
> +	return 0;
> +
> +err_cleanup_m2m_ctx:
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +err_free_ctx:
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_destroy(&ctx->fmt_lock);
> +	kfree(ctx);
> +
> +	return ret;
> +}
> +
> +static int rkjpegd_release(struct file *filp)
> +{
> +	struct rkjpegd_ctx *ctx =3D file_to_rkjpegd_ctx(filp);
> +
> +	v4l2_fh_del(&ctx->fh, filp);
> +
> +	/* rkjpegd_remove() may be waiting on this context, under the lock. */
> +	mutex_lock(&ctx->dev->vdev_lock);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	mutex_unlock(&ctx->dev->vdev_lock);
> +	rkjpegd_vdpu720_exit(ctx);
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_destroy(&ctx->fmt_lock);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations rkjpegd_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D rkjpegd_open,
> +	.release =3D rkjpegd_release,
> +	.poll =3D v4l2_m2m_fop_poll,
> +	.unlocked_ioctl =3D video_ioctl2,
> +	.mmap =3D v4l2_m2m_fop_mmap,
> +};
> +
> +static void rkjpegd_free(struct kref *ref)
> +{
> +	struct rkjpegd_dev *jpegd =3D container_of(ref, struct rkjpegd_dev, ref=
);
> +
> +	mutex_destroy(&jpegd->vdev_lock);
> +	kfree(jpegd);
> +}
> +
> +static void rkjpegd_put(void *data)
> +{
> +	struct rkjpegd_dev *jpegd =3D data;
> +
> +	kref_put(&jpegd->ref, rkjpegd_free);
> +}
> +
> +/**
> + * rkjpegd_vdev_release() - tear down the V4L2 side once the last user i=
s gone
> + * @vdev:	the video device embedded in the rkjpegd_dev being released
> + */
> +static void rkjpegd_vdev_release(struct video_device *vdev)
> +{
> +	struct rkjpegd_dev *jpegd =3D container_of(vdev, struct rkjpegd_dev, vd=
ev);
> +
> +	v4l2_device_unregister(&jpegd->v4l2_dev);
> +	v4l2_m2m_release(jpegd->m2m_dev);
> +	media_device_cleanup(&jpegd->mdev);
> +	rkjpegd_put(jpegd);
> +}
> +
> +/**
> + * rkjpegd_vdev_unregister() - unregister the video device and end its j=
obs
> + * @jpegd:	the device whose video device is registered
> + *
> + * An open file keeps the mem2mem device alive past this, but the runnin=
g
> + * job has completed and no other one is started once this returns.
> + */
> +static void rkjpegd_vdev_unregister(struct rkjpegd_dev *jpegd)
> +{
> +	/* The release callback frees m2m_dev, which is still needed below. */
> +	get_device(&jpegd->vdev.dev);
> +
> +	mutex_lock(&jpegd->vdev_lock);
> +	video_unregister_device(&jpegd->vdev);
> +
> +	/*
> +	 * Let the running job finish and start no new one.  The lock keeps
> +	 * rkjpegd_release() from freeing the context this waits on.
> +	 */
> +	v4l2_m2m_suspend(jpegd->m2m_dev);
> +	mutex_unlock(&jpegd->vdev_lock);
> +
> +	cancel_delayed_work_sync(&jpegd->watchdog_work);
> +
> +	put_device(&jpegd->vdev.dev);
> +}
> +
> +/**
> + * rkjpegd_v4l2_init() - bring up the V4L2, mem2mem and media devices
> + * @jpegd:	the device to register
> + *
> + * Return: 0 on success, or a negative errno with everything set up here
> + * undone.
> + */
> +static int rkjpegd_v4l2_init(struct rkjpegd_dev *jpegd)
> +{
> +	int ret;
> +
> +	ret =3D v4l2_device_register(jpegd->dev, &jpegd->v4l2_dev);
> +	if (ret) {
> +		dev_err(jpegd->dev, "failed to register V4L2 device\n");
> +		return ret;
> +	}
> +
> +	jpegd->m2m_dev =3D v4l2_m2m_init(&rkjpegd_m2m_ops);
> +	if (IS_ERR(jpegd->m2m_dev)) {
> +		v4l2_err(&jpegd->v4l2_dev, "failed to init mem2mem device\n");
> +		ret =3D PTR_ERR(jpegd->m2m_dev);
> +		goto err_unregister_v4l2;
> +	}
> +
> +	jpegd->mdev.dev =3D jpegd->dev;
> +	strscpy(jpegd->mdev.model, RKJPEGD_NAME, sizeof(jpegd->mdev.model));
> +	media_device_init(&jpegd->mdev);
> +	jpegd->v4l2_dev.mdev =3D &jpegd->mdev;
> +
> +	jpegd->vdev.lock =3D &jpegd->vdev_lock;
> +	jpegd->vdev.v4l2_dev =3D &jpegd->v4l2_dev;
> +	jpegd->vdev.fops =3D &rkjpegd_fops;
> +	jpegd->vdev.release =3D rkjpegd_vdev_release;
> +	jpegd->vdev.vfl_dir =3D VFL_DIR_M2M;
> +	jpegd->vdev.device_caps =3D V4L2_CAP_STREAMING |
> +				  V4L2_CAP_VIDEO_M2M_MPLANE;
> +	jpegd->vdev.ioctl_ops =3D &rkjpegd_ioctl_ops;
> +	video_set_drvdata(&jpegd->vdev, jpegd);
> +	strscpy(jpegd->vdev.name, RKJPEGD_NAME, sizeof(jpegd->vdev.name));
> +
> +	/* Dropped by rkjpegd_vdev_release(). */
> +	kref_get(&jpegd->ref);
> +
> +	ret =3D video_register_device(&jpegd->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&jpegd->v4l2_dev, "failed to register video device\n");
> +		rkjpegd_put(jpegd);
> +		goto err_cleanup_mc;
> +	}
> +
> +	ret =3D v4l2_m2m_register_media_controller(jpegd->m2m_dev, &jpegd->vdev=
,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&jpegd->v4l2_dev,
> +			 "failed to init V4L2 M2M media controller\n");
> +		goto err_unregister_vdev;
> +	}
> +
> +	ret =3D media_device_register(&jpegd->mdev);
> +	if (ret) {
> +		v4l2_err(&jpegd->v4l2_dev, "failed to register media device\n");
> +		goto err_unregister_mc;
> +	}
> +
> +	return 0;
> +
> +	/*
> +	 * Past a successful video_register_device() unregistering is the whole
> +	 * unwind, the release callback does the rest.  The two cannot be
> +	 * joined.  The node may already be open with a job running.
> +	 */
> +err_unregister_mc:
> +	v4l2_m2m_unregister_media_controller(jpegd->m2m_dev);
> +err_unregister_vdev:
> +	rkjpegd_vdev_unregister(jpegd);
> +
> +	return ret;
> +
> +err_cleanup_mc:
> +	media_device_cleanup(&jpegd->mdev);
> +	v4l2_m2m_release(jpegd->m2m_dev);
> +err_unregister_v4l2:
> +	v4l2_device_unregister(&jpegd->v4l2_dev);
> +
> +	return ret;
> +}
> +
> +static void rkjpegd_v4l2_cleanup(struct rkjpegd_dev *jpegd)
> +{
> +	media_device_unregister(&jpegd->mdev);
> +	v4l2_m2m_unregister_media_controller(jpegd->m2m_dev);
> +	rkjpegd_vdev_unregister(jpegd);
> +}
> +
> +static int rkjpegd_probe(struct platform_device *pdev)
> +{
> +	struct rkjpegd_dev *jpegd;
> +	unsigned int i;
> +	int ret;
> +
> +	jpegd =3D kzalloc_obj(*jpegd);
> +	if (!jpegd)
> +		return -ENOMEM;
> +
> +	kref_init(&jpegd->ref);
> +	jpegd->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, jpegd);
> +	mutex_init(&jpegd->vdev_lock);
> +	spin_lock_init(&jpegd->drain_lock);
> +	INIT_DELAYED_WORK(&jpegd->watchdog_work, rkjpegd_watchdog);
> +
> +	/* Registered first so that it runs after every other devres release. *=
/
> +	ret =3D devm_add_action_or_reset(&pdev->dev, rkjpegd_put, jpegd);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < RKJPEGD_NUM_CLOCKS; i++)
> +		jpegd->clocks[i].id =3D rkjpegd_clk_names[i];
> +
> +	ret =3D devm_clk_bulk_get(&pdev->dev, RKJPEGD_NUM_CLOCKS, jpegd->clocks=
);
> +	if (ret)
> +		return ret;
> +
> +	jpegd->resets =3D devm_reset_control_array_get_exclusive(&pdev->dev);
> +	if (IS_ERR(jpegd->resets))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(jpegd->resets),
> +				     "failed to get resets\n");
> +
> +	jpegd->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(jpegd->regs))
> +		return PTR_ERR(jpegd->regs);
> +
> +	ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to set DMA mask\n");
> +
> +	jpegd->irq =3D platform_get_irq(pdev, 0);
> +	if (jpegd->irq < 0)
> +		return jpegd->irq;
> +
> +	ret =3D devm_request_irq(&pdev->dev, jpegd->irq, rkjpegd_vdpu720_irq, 0=
,
> +			       dev_name(&pdev->dev), jpegd);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret =3D reset_control_deassert(jpegd->resets);
> +	if (ret) {
> +		ret =3D dev_err_probe(&pdev->dev, ret,
> +				    "failed to deassert resets\n");
> +		goto err_disable_pm;
> +	}
> +
> +	ret =3D rkjpegd_v4l2_init(jpegd);
> +	if (ret)
> +		goto err_assert_reset;
> +
> +	return 0;
> +
> +err_assert_reset:
> +	reset_control_assert(jpegd->resets);
> +err_disable_pm:
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static void rkjpegd_remove(struct platform_device *pdev)
> +{
> +	struct rkjpegd_dev *jpegd =3D platform_get_drvdata(pdev);
> +
> +	rkjpegd_v4l2_cleanup(jpegd);
> +
> +	reset_control_assert(jpegd->resets);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +/*
> + * The clocks follow the runtime PM state, so the block is only clocked =
while
> + * a job holds a reference to it.  rkjpegd_job_finish() drops that refer=
ence
> + * from the interrupt handler, which is safe because the put is asynchro=
nous:
> + * the callback below runs from the PM workqueue, where it may sleep.
> + *
> + * A system transition is not the same.  pm_runtime_force_suspend() call=
s the
> + * runtime suspend callback whatever the usage count says, so genpd drop=
s the
> + * domain under a job that is still running: userspace is frozen by then=
, but
> + * a decode started just before the freeze is not, and it has until the
> + * watchdog expires to finish.  Park the mem2mem queue first and wait th=
e
> + * running job out.  That wait is bounded by the same watchdog, which ru=
ns on
> + * the unfreezable system workqueue and hands the job back either way.
> + *
> + * The queue has to come back either way as well.  A device whose suspen=
d
> + * returned an error is never handed to the resume callback.
> + */
> +static int rkjpegd_runtime_suspend(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(RKJPEGD_NUM_CLOCKS, jpegd->clocks);
> +
> +	return 0;
> +}
> +
> +static int rkjpegd_runtime_resume(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(RKJPEGD_NUM_CLOCKS, jpegd->clocks);
> +}
> +
> +static int rkjpegd_suspend(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	v4l2_m2m_suspend(jpegd->m2m_dev);
> +
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret)
> +		v4l2_m2m_resume(jpegd->m2m_dev);
> +
> +	return ret;
> +}
> +
> +static int rkjpegd_resume(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +
> +	v4l2_m2m_resume(jpegd->m2m_dev);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops rkjpegd_pm_ops =3D {
> +	RUNTIME_PM_OPS(rkjpegd_runtime_suspend, rkjpegd_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(rkjpegd_suspend, rkjpegd_resume)
> +};
> +
> +static const struct of_device_id of_rkjpegd_match[] =3D {
> +	{ .compatible =3D "rockchip,rk3568-jpegd" },
> +	{ .compatible =3D "rockchip,rk3588-jpegd" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_rkjpegd_match);
> +
> +static struct platform_driver rkjpegd_driver =3D {
> +	.probe =3D rkjpegd_probe,
> +	.remove =3D rkjpegd_remove,
> +	.driver =3D {
> +		.name =3D RKJPEGD_NAME,
> +		.of_match_table =3D of_rkjpegd_match,
> +		.pm =3D pm_ptr(&rkjpegd_pm_ops),
> +	},
> +};
> +module_platform_driver(rkjpegd_driver);
> +
> +MODULE_DESCRIPTION("Rockchip JPEG decoder driver");
> +MODULE_AUTHOR("Lucas Sinn <lucas.sinn@wolfvision.net>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("DMA_BUF");


Looking forward your feedback, I'm quite surprised of "your" choices, and h=
ow
you possibly have needed this complexity.

Nicolas

--=-Ts7MasCl8Zb9sSqLl3HS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaraF1gAKCRDZQZRRKWBy
9H/hAQD5qkLzYTuaaeHoTlhO0N4QGcz69FteStS+fDF9/TQDvgEAuzKHLWvQnyxk
0XBq2JDlEBBeb8MCYaoRzX7WAIANLw8=
=C1Dy
-----END PGP SIGNATURE-----

--=-Ts7MasCl8Zb9sSqLl3HS--
