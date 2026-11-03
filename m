Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728961;
	b=a8+Pk8Nv5wPa66OKMrzrxiKjpmtW0euf0OAmvdTMPaXEIi5Leb8WgelwgRrTe2+BdBHo
	 kfwc+gxHOLJ2966hGVf5DvTV6ftDASJNvdQbPvIO0ATMQTtJqZoYp6ji5WPX2aSpW5gVz
	 /9PLRsQcsJDNeyc4G1tMokdW6ICtPSYSIIuFnaPd/8yYyD1oM5imJwPKXyvyR19S+lRHR
	 dXG8/TCoAT2m1Hgo2mUMMw9e2nSyy9YI4243xAg18IFstZNNVTgiVWjPTzdv4zaCOG59t
	 kzTpdTpNEmg4BrNMoaDAwlMSKNBJRN9GQquYmLhv/jbTDmaPb8upHPVlAB6Y+sezGHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
	b=RmvoJCjPdMLS/DLeu836eF0kZiX1TFMl+PIBQUES3f2Vp3opaCMBrtXM4nk/5H6s/NqE
	 lTp34650YQ7B38bTGOPlv3r7aWsV+VTCPi8LMU48llUei2ymwIBoNF6+69DmI32cwJxN6
	 vLGWRVONlIEfQWQw/2mRO+/901ofX23MwnoIuQR2O84StZlFMcf9saO1OmUE86CTyv+85
	 rn1opKuENv79sSLxlUBF2LVgTa7Wye3TCVd+j/OpaXdS+LxGZpQ9lHMVg5CQl+XyyeRtw
	 3AlvZDja1NBCOl8uXvNT8Ol6eG92YQQOSHEJx255UKFIxJaLix7xey//gndiR2o7K0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixe7eYE;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE05606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE05606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixe7eYE
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e10a70540so2591402f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728960; x=1794333760; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=zixe7eYEIAo6pYA5hGapPWS9JIrz8VzDcWpZSJ4uqdqvvbHwt3+4tSH1i6SzHV8UZP
         aCJz1RMX9zP+eQr2rNd88dUTs2is6rBmnKw9QhpqfHGpKj0ube3MGc2nBCeMn3SJxSkC
         rxi7JHjE+k1+V2paeicDVne2ZzCI86kCrTPqfl8OgEcTrtVaQ5urF4fCGF6I/HyehDei
         LddWMNAXGipyA9ffOZKlUV6Uju8/3ho5mmTxsnc+aB7F6zLJVdAVBX+NB3lVQdwy2DH3
         EA4mjFfPR2G8V9BZgu8PK39YwiE/H0U2Ja7G9drNAT52PXhfbHf5axP35JAves1y78AG
         VzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728960; x=1794333760;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=VWzTCZ2Wdj23m+GU4KQ3IM4ZAo9V1gA8ytbN5+zQnLMlvBN+ss3gtarsS5LJJt5ylu
         PwLqtFIIO860Bl0e5RCDeltjdDlnCYhI92V1HcaGythLYPd/S8pGTH2jj4NC1I7Jxttq
         fx+JLChVClJugF5B7bZ6be+53I0uqSJmPUXq37lfaZ4hSCw9nv3tpzcz1cbWoy1Xt2y4
         S3TyC3gpuSJGhVoL1i2TbaAmPwA75pDXKFkn7uc84yunHjNGUmE0J0PqFTldM1YPstBf
         yhlAz18tK8XB9QFCnYEN3oNmfnDw/991gk//RuLZwPffvegG83tXq3/mOMk5PnzOWYz8
         y/zw==
X-Forwarded-Encrypted: i=1; AKwUvBwp9flqCYjpj3Jw8XAwLapZHR+Ftm4xdJSVd/Pe/uDloHQ3PbHSijBVhp2YumVz+xIVTvjOcMbNeRVmZkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GorTNfkcsRi1MZiQYV0lQZC9YB8MtbQ6umupGhQbjLN0k80Ne
	5noYQ/v7zoLvAKVafxP/xa02irTkw3AukiNNRt6KsVhqBX01+A5H8Rr1
X-Gm-Gg: AYBFou1A/Y3xwJSxqrJWyM4feud1pnEWFFIVNU/d+MVcbLR6ucirdXI55bYkYNud5Rf
	9In1nokMhlCFZuAdX9V1RQXUCMYlBAck+kceT/uHMIACoAMF670q2J0j53zKC8xBq19/LWidmTl
	oVmodadOOvbsDoP49rahjn6PwRWBtK5X7TXwWyzKMVaHC57IqxYm3NEXFpm327G1IcznYafW6z+
	kch2yXUqmyGB5DVfNaLYPkTvCddfl9U9usR9HofQE6VueEjTuc9J2yL4r2Z/2jpi4jgf/aToCij
	8QUETCdNaPAPdYk6VD+9uORxQXvM/YVYblXTg6xIZOduJe+L8umu3iDDtiwOElXwWLCIAalSXMC
	ihmGmZ1GKWg872wZfCtBgnLJQr5O7N1+eecXa3Xeq9/QPI2YqqRJEnN5ps1XPAvfnXH7R9AJQK7
	GPYvuQyqSE9BizsrmnzFazcGc2IBZuXDGrraga+kMiBjyTeW5TOTCBGBScE3IT/gZuhlTZm0hlL
	lQlz5NAdS57vZunYNM912EQ46sdhF9cfQwqPUvJrTtwl/yfuhnGQ4wtEOVVWDcOEqeOz+39JJpm
	KICq13dpt6ap6DpOiB44j/LSvihFZZ6ENxnKMZ35s/ZrOMBrAhztssrRTvpxdThrv0g6rJsVWIh
	JTQzHTAAV52rt1MPBJBvm3eGO29zmxiW5SPCq1Uc+87LpRg011GpaU7ywAbxpvdWExH9jLIH7Lj
	MffJwjH5eTHv0+PxgfLfrDTCIhZQw+d5bqNEJeMMiAIahppQqF+jcpHEXAEJ+dlFb8s/HBabXVF
	cOi5N+pRY+kNhtnRAVXzmVN/3kFW3dcIbcawPfC09tTbUmA3CNR65uC9GUFCw==
X-Received: by 2002:a5d:5d09:0:b0:48e:4835:de5f with SMTP id ffacd0b85a97d-48e6e4fcf2amr28751210f8f.47.1793728959547;
        Tue, 03 Nov 2026 10:02:39 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm26248330f8f.46.2026.11.03.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:02:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Tue, 03 Nov 2026 19:02:37 +0100
Message-ID: <P3FCc6YrSeexw_Zto5zS4g@gmail.com>
In-Reply-To: <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
 <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 2. november 2026 ob 19:44:38 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The hardware decodes whatever picture size the SPS describes. An SPS
> > beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
> > are allocated, makes the hardware overrun memory and hang. On H616, the
> > JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
> > 4216x528) leave the hardware wedged, so that every following job times
> > out until reboot.
> >=20
> > Validate the SPS picture size in try_ctrl. Move the size limits to
> > cedrus_video.h for that.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
> >  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
> >  3 files changed, 44 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stag=
ing/media/sunxi/cedrus/cedrus.c
> > index c3331b4f3f02..45deebddb630 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@ -28,10 +28,38 @@
> >  #include "cedrus_dec.h"
> >  #include "cedrus_hw.h"
> > =20
> > +/*
> > + * The hardware decodes whatever picture size the bitstream headers de=
scribe.
> > + * Reject sizes beyond the hardware limits, or beyond the capture buff=
ers once
> > + * they are allocated, instead of letting the hardware overrun memory =
and hang.
> > + */
> > +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u3=
2 height)
> > +{
> > +	struct vb2_queue *vq;
> > +
> > +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> > +	 * formats pad the buffers to at least 16 pixels in both directions.
> > +	 */
> > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > +	if (vb2_is_busy(vq) &&
> > +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> > +	     height > ALIGN(ctx->src_fmt.height, 16)))
> > +		return -EINVAL;
>=20
> If my memory is correct, Hans rejected this kind of construct in try_ctrl,
> because if you are only doing try() it shouldn't fail like this. Instead =
we can
> validate in the real s_ctrl, but I believe the downside is that it makes =
the
> error asynchronous when a request is used (perhaps that's actually wanted=
 ?)

You're right. This is not the best place to check size, since it can be
bypassed as sashiko bot find out.

My suggestion for v2 is to split this to two stages. Max width and height
check stays here, whereas buffer size check is moved to setup() callback.
=46ailing there it will mark buffer with V4L2_BUF_FLAG_ERROR.

What do you think?

Best regards,
Jernej

>=20
> Nicolas
>=20
> > +
> > +	return 0;
> > +}
> > +
> >  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> > +	struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_=
ctx, hdl);
> > +
> >  	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
> >  		const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> > +		u32 height;
> > =20
> >  		if (sps->chroma_format_idc !=3D 1)
> >  			/* Only 4:2:0 is supported */
> > @@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  		if (sps->bit_depth_luma_minus8 !=3D 0)
> >  			/* Only 8-bit is supported */
> >  			return -EINVAL;
> > +		height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> > +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +			height *=3D 2;
> > +		if (cedrus_check_pic_size(ctx,
> > +					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
> > +					  height))
> > +			return -EINVAL;
> >  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
> >  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> > -		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus=
_ctx, hdl);
> >  		unsigned int bit_depth, max_depth;
> >  		struct vb2_queue *vq;
> > =20
> > @@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  			/* Only 4:2:0 is supported */
> >  			return -EINVAL;
> > =20
> > +		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> > +					  sps->pic_height_in_luma_samples))
> > +			return -EINVAL;
> > +
> >  		bit_depth =3D max(sps->bit_depth_luma_minus8,
> >  				sps->bit_depth_chroma_minus8) + 8;
> > =20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.c
> > index adc7f255d7cf..2521315abdb7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -29,11 +29,6 @@
> >  #define CEDRUS_DECODE_SRC	BIT(0)
> >  #define CEDRUS_DECODE_DST	BIT(1)
> > =20
> > -#define CEDRUS_MIN_WIDTH	16U
> > -#define CEDRUS_MIN_HEIGHT	16U
> > -#define CEDRUS_MAX_WIDTH	4096U
> > -#define CEDRUS_MAX_HEIGHT	2304U
> > -
> >  static struct cedrus_format cedrus_formats[] =3D {
> >  	{
> >  		.pixelformat	=3D V4L2_PIX_FMT_MPEG2_SLICE,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.h
> > index 8e1afc16a6a1..367e52158f01 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > @@ -22,6 +22,11 @@ struct cedrus_format {
> >  	unsigned int	capabilities;
> >  };
> > =20
> > +#define CEDRUS_MIN_WIDTH	16U
> > +#define CEDRUS_MIN_HEIGHT	16U
> > +#define CEDRUS_MAX_WIDTH	4096U
> > +#define CEDRUS_MAX_HEIGHT	2304U
> > +
> >  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> > =20
> >  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>=20




