Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C63F3DC4B8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746596; cv=pass; b=HGN30onTgMDvzyWyaut5t9JQgw+INhZG++0OFPOWxEJgY7YicJD8PFyAZEC5M4Vcn25w0lYv2fJKVj/m40Zi/I1Q5UTAxlYWpFYa8BDLyHLXste/6f8O3pZtTa/0dj1UIIpkLI2MHeySJ8o/0ZKkzDg9SZnKpudfvTUimNA/lPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746596; c=relaxed/simple;
	bh=oIdgjPl4sRXLsV3pRCIwvUhYVjlr4/qdYelL4aebP/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4/zJokvqXGzYof+vcY9hQGYKzkKjZpIusUUl0tqdnw2OZvJml63Yn4OzCrdV7B/fmgW4U5220HMSgM6u+sHXCLOFLoa0Jsc40zy/bOjv3yhj2Ljg/clgUztCeiflMEZoprQ/MM7Vjj/yWZxMCnuBEttXdOMISdzXeNeNhfzTes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfbVtNQ1; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfbVtNQ1"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1598666a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 19:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788746592; cv=none;
        d=google.com; s=arc-20260327;
        b=C11EQL9tOgT/a1Fw+AaVGGnhI39XXX0ahLv7E6k2X7CGsPKXeHgN/AhOLd1ebhV94E
         aVBzgSEs+7R9atlMEHk5NfPLc2bcOwLQA28cB2UHe4zri8QEx+XyEYj4ztDPOY5JkIXN
         7MZLXMwQHTCq09jAlPhzRJYPi+NOROp1TQEMLwCCY2JgG2moY02yR7Fpf+Mj9DOS1oeG
         LYYQMEwFA7d/h+QGhMc+aZzui7SX/MFMXUShuWUKKfghXEY2foyfcA4UnR/o6qBBrY53
         F3cVbGAJ3JerThNVc3Dq0uRW0GHTNI4QleIalKQW51q33cTgZd/xeEHJMRPKbQWz65e6
         6HzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0pnQizssdIPR6UmzqyIyO8YJVaHOLkJq8hGFrhpjUgk=;
        fh=jzI88ZyU6pc66nB6/7y/ODjCJqxY/q15JqgSnSeyCAU=;
        b=ZvnuX1y8EP2oD/WoOY0L41IdqrmMsZzi6Dz+ym/lqK7AyGsVM4KQqjQjIVJvPsbORK
         ocnsJL+q9PHjVpJreXIia0JdqHRllvl0j509uxo8lhgXZhmx1lWSpmUD38WQIMRfXcEd
         ylfzj5zCekWIzh5VjFffsOTLc6VHGgMCWgH+q7rS5nt+VWgFnk/PYvipoKV2WLMA0JZ/
         iL94xNUF3Pv1huXYIw39ld2FgGH+k6BJ6kpMYEjrFCLnu/G5of8Rb084aAgGSrihB5eo
         7ZRrU4IrPS5IlXHHgMKhAo64RzZeLXV62G0QNbgXevwE1xg9vY4OxmkrU6zwL47vB6dx
         yZ3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788746591; x=1789351391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0pnQizssdIPR6UmzqyIyO8YJVaHOLkJq8hGFrhpjUgk=;
        b=JfbVtNQ19IEEnk/oK6khdf6oeaTw+dlVFcnUfYTz3lvPN6MY0vEqbUvvpmB95BWgkH
         YDtq94WRGs3q6hoq4qPY1ndmib2DNNWq9dqbpOFeRq+cm1X9RJ3OcyDxh2UXPULigMtr
         jj2mB8GhxenYERQDgvLHgiKrxEsn4RsLxgX4JKco2ygwYVKFPOVPTiNWE3dJZE35uBO9
         KJyBNgdtjKPQiujAoxTPWw4qvu0kgyoxOqEWWuSaYklaFeCNAsUmpJNdxZp5uJnTNHtz
         Gn1fMnMO4eFNyRwFq2GgiL3cVns96UaEoh1fUkqrHZZHj+3/NFnAdSLR34U6cPDTFo+j
         jKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746592; x=1789351392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pnQizssdIPR6UmzqyIyO8YJVaHOLkJq8hGFrhpjUgk=;
        b=ASIPBsI1/iSl6Jj0UbPc+atkyxb9pc3jDgBsEU5CahQGV8uU6m0EpMaLhd/tdE4pmA
         C+0BOhf3CO+M3eDzFWZBnAGemD3NC1o/WnzlGpUa8l1JAG7dAPDO1xROEX8tP05LMdCa
         bVgeugIFr5ZDXpQkhgIGJLOb8eHjxH//oa2d2FxVHlLiHBlbT5xqIPyiGXKguMKRedS9
         b9DSolJOzVOkLF3dg57s13Vx/ZRrKVxncH0BYyQKCoZbT6Q9QTs+R/v4qrr7y42rYHZR
         JwcvdrEe8UKK95mz1wmFXw7+pn6rDKnk073GZBArW4axl7AV6rf6fv1ZX8svk4jhFenS
         WgOg==
X-Gm-Message-State: AFuF++nVOWxcDeRd7oQu9oECarIlPmEk3hwBUUhMSpDEa6iRANbLPnD6
	ENh8VJzkRvybQ2HlruQd3N96gscayaZIOPuf4JOKzoLnOXm+lxyT3wrYf1O3d6Q4beEhdlz6aaE
	bwjaXnSmngKQV8DKCrQ0scEnLgrJm/UU=
X-Gm-Gg: AYBFou0GamzmVNbl5A6WzSZyW/Omgkqcx4UFYxRMfe8HyZ/ERN2oju6DZWI3qZU41H0
	lsg31LKo3Zql83lx3KI6/Kj8IFNGSILTQwmydKNB7slk5GWBZVBRYtodvUiJUEFeqLrPstjoZ3Q
	0lpaLAhSgtIZ/XJlz20CR96HwirbuSkeJNzA9mHyczzZ7IwAbTU536ZieqUk938Gq3OCw2Vl5Ih
	jKsdD/jFJAhY4LU6/95IhtCSYM7Bag8gS2D3T4sZmOrqueK7mASMJswj/0umvizNn7xYi46mwXs
	PtHJkXF+IhC6zctuE6cCjzNOTMJX07RtznNJHu9O/Jk=
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id
 98e67ed59e1d1-39b260dd3fdmr28654964a91.5.1788746591505; Sun, 06 Sep 2026
 19:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807074647.435011-1-hoff.benjamin.k@gmail.com>
In-Reply-To: <20260807074647.435011-1-hoff.benjamin.k@gmail.com>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Sun, 6 Sep 2026 22:03:00 -0400
X-Gm-Features: AcwNN1UG0OfFvOEu4fEz6Z-aT99kXXIy3z_DyDHl6Lrx8UxUtjfS5b_T_It6_H8
Message-ID: <CAMSzxxSNy1ugVY4=MGyzg6OrMDkDZuRkWGoCanBPtDc1iXS_XA@mail.gmail.com>
Subject: Re: [PATCH] media: hws: report measured colorimetry
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org, 
	Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just following up on this series, originally posted on August 7. I
haven't seen any review comments yet and wanted to check whether
there's anything I should address or whether it's in a good state for
consideration.

Thanks,
Ben

On Fri, Aug 7, 2026 at 3:47=E2=80=AFAM Ben Hoff <hoff.benjamin.k@gmail.com>=
 wrote:
>
> At 1920x1080, the driver advertises V4L2_COLORSPACE_REC709 with
> V4L2_YCBCR_ENC_DEFAULT. The default maps to a Rec.709 matrix, but
> controlled A/B captures using the in-tree and baseline drivers show that
> both produce YUYV samples using a BT.601 matrix and full-range
> quantization. The captures differ by at most one code value, whereas a
> 601-to-709 conversion would move primary luma values by roughly 11 to 33
> codes.
>
> Set the Y'CbCr encoding explicitly to V4L2_YCBCR_ENC_601 at every
> resolution. Keep the resolution-based colorspace so HD retains presumed
> Rec.709 primaries and transfer characteristics while SD continues to use
> SMPTE 170M. Refresh the colorspace on detected geometry changes so an
> SD/HD transition does not leave stale metadata.
>
> The decoder mode register is undocumented. Stop claiming that value 0x13
> selects BT.709; both drivers use that value while producing the measured
> output.
>
> Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
> ---
>  drivers/media/pci/hws/hws.h            | 4 ++--
>  drivers/media/pci/hws/hws_reg.h        | 3 ++-
>  drivers/media/pci/hws/hws_v4l2_ioctl.c | 5 +++--
>  drivers/media/pci/hws/hws_video.c      | 4 +++-
>  4 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
> index 8fbe1fe27844..d87d52674b69 100644
> --- a/drivers/media/pci/hws/hws.h
> +++ b/drivers/media/pci/hws/hws.h
> @@ -33,8 +33,8 @@ struct hws_pix_state {
>         u32 sizeimage;          /* full frame */
>         enum v4l2_field field;  /* V4L2_FIELD_NONE or INTERLACED */
>         enum v4l2_colorspace colorspace;        /* e.g., REC709 */
> -       enum v4l2_ycbcr_encoding ycbcr_enc;     /* V4L2_YCBCR_ENC_DEFAULT=
 */
> -       enum v4l2_quantization quantization;    /* V4L2_QUANTIZATION_LIM_=
RANGE */
> +       enum v4l2_ycbcr_encoding ycbcr_enc;     /* V4L2_YCBCR_ENC_601 */
> +       enum v4l2_quantization quantization;    /* V4L2_QUANTIZATION_FULL=
_RANGE */
>         enum v4l2_xfer_func xfer_func;  /* V4L2_XFER_FUNC_DEFAULT */
>         bool interlaced;        /* cached hardware state */
>         u32 half_size;          /* hardware half-frame size */
> diff --git a/drivers/media/pci/hws/hws_reg.h b/drivers/media/pci/hws/hws_=
reg.h
> index e4fb4af44434..f6027a16a193 100644
> --- a/drivers/media/pci/hws/hws_reg.h
> +++ b/drivers/media/pci/hws/hws_reg.h
> @@ -70,7 +70,8 @@
>  #define HWS_CTL_IRQ_ENABLE_BIT BIT(0)   /* Global interrupt enable bit *=
/
>  /*  Write 0x00 to fully reset decoder,
>   *  set bit 31=3D1 to "start run",
> - *  low byte=3D0x13 selects YUYV/BT.709/etc,
> + *  low byte=3D0x13 is the vendor baseline capture-mode value; its indiv=
idual
> + *  bit meanings are not documented,
>   *  in ReadChipId() we also write 0x00 and 0x10 here for chip-ID sequenc=
ing.
>   */
>
> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.c b/drivers/media/pci/h=
ws/hws_v4l2_ioctl.c
> index 0303e311ee4a..ce396b7225d2 100644
> --- a/drivers/media/pci/hws/hws_v4l2_ioctl.c
> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.c
> @@ -511,8 +511,9 @@ static inline void hws_set_colorimetry_state(struct h=
ws_pix_state *p)
>  {
>         bool sd =3D p->height <=3D 576;
>
> +       /* Captured samples use full-range BT.601 Y'CbCr at every resolut=
ion. */
>         p->colorspace   =3D sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSP=
ACE_REC709;
> -       p->ycbcr_enc    =3D V4L2_YCBCR_ENC_DEFAULT;
> +       p->ycbcr_enc    =3D V4L2_YCBCR_ENC_601;
>         p->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
>         p->xfer_func    =3D V4L2_XFER_FUNC_DEFAULT;
>  }
> @@ -736,7 +737,7 @@ static inline void hws_set_colorimetry_fmt(struct v4l=
2_pix_format *p)
>         bool sd =3D p->height <=3D 576;
>
>         p->colorspace   =3D sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSP=
ACE_REC709;
> -       p->ycbcr_enc    =3D V4L2_YCBCR_ENC_DEFAULT;
> +       p->ycbcr_enc    =3D V4L2_YCBCR_ENC_601;
>         p->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
>         p->xfer_func    =3D V4L2_XFER_FUNC_DEFAULT;
>  }
> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hw=
s_video.c
> index 18e4bc6901d3..09cfb5a909f9 100644
> --- a/drivers/media/pci/hws/hws_video.c
> +++ b/drivers/media/pci/hws/hws_video.c
> @@ -327,7 +327,7 @@ int hws_video_init_channel(struct hws_pcie_dev *pdev,=
 int ch)
>         vid->pix.sizeimage =3D vid->pix.bytesperline * vid->pix.height;
>         vid->pix.field =3D V4L2_FIELD_NONE;
>         vid->pix.colorspace =3D V4L2_COLORSPACE_REC709;
> -       vid->pix.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +       vid->pix.ycbcr_enc =3D V4L2_YCBCR_ENC_601;
>         vid->pix.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
>         vid->pix.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
>         vid->pix.interlaced =3D false;
> @@ -895,6 +895,8 @@ static void hws_video_apply_mode_change(struct hws_pc=
ie_dev *pdx,
>         v->pix.width =3D w;
>         v->pix.height =3D h;
>         v->pix.interlaced =3D interlaced;
> +       v->pix.colorspace =3D h <=3D 576 ? V4L2_COLORSPACE_SMPTE170M :
> +                                        V4L2_COLORSPACE_REC709;
>         hws_set_current_dv_timings(v, w, h, interlaced);
>         v->current_fps =3D fps;
>
> --
> 2.55.0
>
