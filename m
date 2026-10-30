Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793374491;
	b=xIRKWAsyYAwHnXGTb/xl/TrvJQRMfF8yvkiAASvs2l5/CZs7tJDWeC0oykovv0huAzz5
	 HQyobwmLHlj4vT8moAQ3jplMGBpWh8OWpDfLj9NaaRG1V6tchap+qbkMxR2ePy7c4Zkat
	 qeiaetnGGAQCL3LiFNbrOkRXbSfQD3gKndkvOZAQJ5wtGkfoW8POG8OQm1lUoSWed6tGv
	 xzOxH0OTKpNI6RkxC16x7nSE0sxMfW3yQ88E2r4+tKOOAKj6KDCItdd5S91sf9WtPog10
	 qzfRu+oINj/zdHwjneJ3EbXhRxQib0Xt6QsUI8YOnst9ZFP6lkjQ3IehOil/mikkHlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1n4IbgOB2b8S36PL+kNnVl1q4UWZNmtFY8RRf5EucFE=;
	b=5RvwucL9mcqAJuthzyObnSbPc661TQsnVFgZvBdbuDlIv1KGVDOwp6+DLOQKTCdA2+dn
	 SV9zmtS+wTfSrKA8KE9kNgebW+a3kuzVX0viuYW7KsW9uvrhU+BYwVWGL8JHb9Tf8nTBI
	 7vfgzufmPFNwRnT9pT4953vCXkSxD9gXJwKzaPUbgjGhPG66FDFL9ZHm1TfiY4JTx1hFV
	 2Rt+352kVJF2RGF5SdtAzVrRHJ8aoqK/YHTw30AE4VW5iSyKX7jCCRwrjNlA7JP90euSH
	 QFWCVvhatlripF8OtZia4AH+O5klQ/MtOIDW2gWBN0BLal/j7k+srOXS1bipgJhACpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuGpfQhA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3541606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3541606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuGpfQhA
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67992884b02so486127d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793374490; cv=none;
        d=google.com; s=arc-20260327;
        b=OCYiC7Y7WuV+H7wFVjqkPaH9rDwIN2AARNDUqp2T6OQZMTZU0CdfLi54aFz9ZiBN3n
         +lK5dUUMcBw2W4ex18ZfunDzTWEGqG7SA+MZ1ubT3ld2RkmbKIzSxfYSCu44hA+cgmv/
         KULiznf2udGWEx/7Cz5g4ZxbflX1hzCcqMr++kR95Lku2+vVqomNO1F4faKsE9NQvdhV
         VFG2nIMqR5x+kFJ6HlEA4s+jExNY6CzYZV6MCzyJPMmckDZFjA4e2cWXoR/Bdg0xmH9h
         Z2wAlF6ZHVsYEjFH9xGKQaR8NOT6+TdJPykrE6TfIxVjqH9zqd0CTk6Kqp2RJdMOBV9M
         cfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1n4IbgOB2b8S36PL+kNnVl1q4UWZNmtFY8RRf5EucFE=;
        fh=wXdFACDpWD35MyA2THyfQclQ2do/cTX4YtTQhkYjqT8=;
        b=YmrGg5WE2DDd/8H3Ic71ACi3fPJZB8L+J6bdyFDwx4S5sQVNG44w7641LkcQ38Mf/P
         4E+nyqCRbS0WduiaweGiNaeP0P25W+8W63RNuHqTrPv18dSsnwJGcfYd8PgTbPP73SWr
         K98JNlpY9ZTkfeM5KMaVgD4BbwY6V0gPwCqCBt/4tb+HKF/VcumjzzknIrP6Aaws85nf
         7QxsWEtEn/TJQsmwezY7VYT4zf4uiu9R12nxbK+qxjvcwsjEselb0VkFk8uY/9ZStat5
         JHG7v5yCSRIXZl4GKdvc6/H6u391t87H1Awvd+c2j8NMdUPiTZBu+UlFkVm1h+m1jGnF
         bVMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374490; x=1793979290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1n4IbgOB2b8S36PL+kNnVl1q4UWZNmtFY8RRf5EucFE=;
        b=SuGpfQhAk2wlAeawQqPPgBJ6m4mEJ9QXRTKbFff1+bZ0wb6vKnYAJUw0mcljn0QhfB
         pc9Nvo5Z8kNdrxxFCJRL6nPgdMbJ9etuD8XQPWPZQD5nsbLvXReWEnJOC3laNvfQtMRE
         CcfeY+KV2KvgsgFmxnpFXKEjtN/5rRfV6YFWfGipEuq8I9Ju/bGgE1dyFnBCjzVDHi/R
         4DtMczuGO26MVlM7Kn8MOpOXc40j7YLMFkzy0ln70nu38X7IIRUk81bcJSSAYcVzHyVV
         ooRppFXPlicwAokelD+mHEpliWwQBZMPaGZzBJ1m5v3Sjy/f77dN+KhIuPEyO31fEQTo
         70nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374490; x=1793979290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1n4IbgOB2b8S36PL+kNnVl1q4UWZNmtFY8RRf5EucFE=;
        b=KiSpWDMiw9rDUo2MnMkfzNFb367rhL8aFmmPwDi3WuM7bxfJYzPw4tsU2s0mUVT1gI
         N8dUisiUNZxLFmdL+2w+epiTd6H2ZeVV0Qov3VB1mdRfspP3xk7CFUfUNWLydVuw38BI
         q5VLDcTwe0BXP5DUY7OK5khQyKXsSK1v6HelBSzmWvWkEpOU1DppMDR/6xqBCUKMmSnV
         Te+rEGb1vEqCbbJnP2skCwTEQQzH3AeFdeZzJ9gEX57g2dNzdSZNRXMMtrTwFaFsoMKh
         K4AO8D0kWgMh/baoXQc4v396eBXYQwmF80+pxCyi5oIOrVs147AQXKVan0Bc2oklg5NQ
         wHjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgYTAxB7f8G1stwfqy/FtgvCsxtGU1fXWnPeuwynzn3UIX6g+gKNeGnoGoj3+w/ISpjETEanYr1z1IH4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHnqxXWfatVP78TaVRJcVxsVTX72Ho06YVttRqQPiqaFdGpxIp
	aSFVacxNLycSabbNMC5+iYM/dn/vqbaUc8Hho/mfGuYWs/xZV0mSgNDvDJosyjSePHbKMw5Xchl
	JyQOF+tLst1HK15W/Rb/TVV9MgnHwBis=
X-Gm-Gg: AYBFou2ZWSEr3/Ao1mTawTGulWiF5reyd2FCPvuvLIa4agATaVr/7XKupKTnyc6+Vrg
	Ds5XWPTf0MncTgvRonnGtTFuzUigumfZe+YMKdtuSm93chc99ZuJZgEy04s6m886Cz23pqTADVa
	waCAfIj4OgRKyxt4K8nv5A+DNEhhit5ejXFuhCFjrESn07N5j/EBYpR8VnUdRPRlHchybcH56rT
	Xai81xitnd/2zHubfjB2Sz767fBR/6uhLSnb/QzfNpUzt7BHv6JGlZZyNqAnfo+CPbEjwWdpMim
	6OBbmO65yQdOFBrdM/Wnh4kqDn4VRmVK637fy8j6klmHh2cobhJ5z3hK4PN28eDOfWtjRt74oJc
	YFZU0FZCvVZBk4olVuS3BYyJKvaeXGgwbkqaOI6e3fJ6t6plhfPq4Dn/+RE4brmCye1R9jlAVq2
	I9hCna2Y1jQY/7zcDnl+Z2+8+UvA==
X-Received: by 2002:a05:690c:c4e3:b0:8b1:6d51:38f9 with SMTP id
 00721157ae682-8b2b65addc0mr15658687b3.14.1793374489794; Fri, 30 Oct 2026
 08:34:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260923205835.3505-1-frazinjonathan@gmail.com>
In-Reply-To: <20260923205835.3505-1-frazinjonathan@gmail.com>
From: Jonathan Frazin <frazinjonathan@gmail.com>
Date: Fri, 30 Oct 2026 10:34:38 -0500
X-Gm-Features: AclHuK9bhck79G74ZDFH4BZGdvCd9oliF_YBrQadZWXnT6IpMnFcqiWG_2DnYsU
Message-ID: <CANW_FuOTfGS-z0yO4K3h3ueLUqiN82NRtQqT34q6-A3Mm=YZYQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] drm/mipi-dbi: display a cropped region of an
 oversized framebuffer
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, kamlesh.gurudasani@gmail.com, 
	lanzano.alex@gmail.com, phil@raspberrypi.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Friendly ping on this series - v3 addressed the review feedback from
v1/v2 (added the missing st7735r driver). Happy to rebase and resend
if anything's changed on drm-misc-next since September, or if there's
any other feedback.

On Wed, Sep 23, 2026 at 3:58=E2=80=AFPM Jonathan Frazin
<frazinjonathan@gmail.com> wrote:
>
> A drm/tiny MIPI DBI panel can currently only scan out a framebuffer that =
is exactly panel-sized, always from the origin. This series lets a client a=
llocate a larger framebuffer and choose the displayed region via the plane =
source rectangle - a crop / pan with no scaling.
>
> Motivation: feeding hardware-decoded video to a small SPI panel. The vide=
o decoder emits a fixed frame size; being able to point the panel at a pane=
l-sized window of that buffer avoids a full-frame CPU copy on every flush a=
nd lets userspace pan/centre the image.
>
> Patch 1 is the actual fix - mipi_dbi_fb_dirty() addressed the controller =
in framebuffer coordinates, which is only correct while src_x/src_y are zer=
o. It now subtracts the plane source origin.
>
> Patch 2 raises mode_config.max_width/height (pinned to the panel size) on=
 the six drm/tiny drivers that flush through the shared drm_mipi_dbi_plane_=
helper_atomic_update(). ili9225 is excluded - it has its own flush path tha=
t does not carry the source offset.
>
> Open question for patch 2: the six drivers each set the limits identicall=
y in their probe. This could instead be a shared helper (or folded into drm=
_mipi_dbi_dev_init / the DRM_MIPI_DBI_MODE_CONFIG_* macros) so future drive=
rs get it for free. Happy to respin that way if preferred - the per-driver =
form is what is shown here because it is the smaller diff and easier to rev=
iew a first pass.
>
> The min_width/min_height, the fixed mode, the connector and the mode-size=
d transfer buffer are all unchanged, and drm_mipi_dbi_plane_helper_atomic_c=
heck() still enforces DRM_PLANE_NO_SCALING and no repositioning, so the flu=
shed rectangle stays bounded by the panel regardless of the framebuffer dim=
ensions.
>
> Tested on hardware: ILI9341 and ST7789V (through panel-mipi-dbi), both 24=
0x320 - an oversized framebuffer is accepted and a non-zero-offset panel-si=
zed window scans out correctly; a panel-sized framebuffer is unchanged. HX8=
357D was tested during the downstream review by Dave Stevenson (Cc'd). ili9=
486, mi0283qt, ili9163 and st7735r are build-tested only.
>
> Both patches have been carried in the Raspberry Pi kernel (rpi-7.2.y) and=
 in use there: https://github.com/raspberrypi/linux/pull/7589. The v1/v2 he=
ap-overflow fix (see below) has also been folded back into that downstream =
kernel: https://github.com/raspberrypi/linux/pull/7643.
>
> Applies to current mainline / drm-misc-next; the touched files are identi=
cal there.
>
> Changes since v2:
> - Patch 1: a damage clip that lies entirely within the one-pixel sliver
>   the v2 clamp cuts off collapses the clamped rectangle to zero width or
>   height. That was still being passed to mipi_dbi_set_window_address(),
>   producing an inverted (start past end) address window ahead of a
>   zero-length write - undefined behaviour per the MIPI DCS spec. Skip
>   the flush when the clamped rectangle is empty.
> - Patch 2: st7735r also flushes through the shared
>   drm_mipi_dbi_plane_helper_atomic_update() but was missed from the
>   original list - it lives under drivers/gpu/drm/sitronix/ rather than
>   drivers/gpu/drm/tiny/. Added it, and confirmed by grepping the whole
>   tree for DRM_MIPI_DBI_PLANE_HELPER_FUNCS that no other driver shares
>   this path. Thanks again to the automated review for catching both of
>   these on v2.
>
> Changes since v1:
> - Patch 1: clamp the damage rectangle to the panel's fixed mode before
>   using it, instead of trusting it to already be panel-sized. src_x/src_y
>   are the plane source origin truncated to whole pixels, but the
>   rectangle from drm_atomic_helper_damage_merged() is clipped against
>   that origin's exact 16.16 fixed-point value - when the origin has a
>   fractional part, the rectangle's far edge could land up to a pixel past
>   where the truncated origin would place the panel's own width/height,
>   overflowing the panel-sized tx_buf. Thanks to the automated review for
>   catching this.
> - Patch 2: unchanged.
>
> Jonathan Frazin (2):
>   drm/mipi-dbi: honour the plane source offset when flushing
>   drm/tiny: allow a framebuffer larger than the panel on MIPI DBI
>     drivers
>
>  drivers/gpu/drm/drm_mipi_dbi.c        | 43 +++++++++++++++++++++++----
>  drivers/gpu/drm/sitronix/st7735r.c    |  8 +++--
>  drivers/gpu/drm/tiny/hx8357d.c        |  8 +++--
>  drivers/gpu/drm/tiny/ili9163.c        |  8 +++--
>  drivers/gpu/drm/tiny/ili9341.c        |  8 +++--
>  drivers/gpu/drm/tiny/ili9486.c        |  8 +++--
>  drivers/gpu/drm/tiny/mi0283qt.c       |  8 +++--
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c |  8 +++--
>  8 files changed, 80 insertions(+), 19 deletions(-)
>
> --
> 2.53.0
