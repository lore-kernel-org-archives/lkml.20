Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729570;
	b=Z6Yl31caT66NlkeHMoiZlAGK03Gegsw+N+sZC4efzEzmX293PmwQcyofaZ34Rk2L8ses
	 AfOMGxESqMwO4esDaS9lIhJ0548QOaZugztYi7KqKOB/KRAxzdJ/nllGRb1XrAI9BaRC1
	 nfyIBjg7kxuHe7NFhilaBdrAl3a+H5nx+VuO5JczDYPrdcBb12QeGsaQwujbs2sP85rmm
	 hfhlPQi7Tmq9FgxFeJ9I/IS9m7C6SXxEYgfbKwYevIYK50RR9M6p57JzwaF7mJCfBV5k+
	 vLzJkrvNoNzdJ0EXtI0Yob2E3M4f8l0RIWa1QCsWIDvmZtl2p/HNF0QDCS15UQoqgOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
	b=FiQIlM1ww10Dw7c8oqN8uCL0VkeA0Vbp1BGkXvIpiqO0D7xMdpwcFBErzhA7AIPS3dNw
	 ZWiWIkPEefKYhXa/u5LwCLrEt06iMmi57P3BRq9qxNkeCDLj+uLzkE73Cmh1AoljTyIUG
	 DzfB5i/fb5srieIw1rAvIqYymnOXZxWBmgjpwTjDWAWxCDtibvfCzhVctQAI6j1lgJ7i1
	 fjg2E6Tl0+pQlXIDhN/DExE92OORPQLidm6aMcp1aMON4fiXRuWnZ2wIg9EDkDVMVTO0y
	 NLFdjY3I/BVU8d9fu4jHQPnEjIqXziR77TlhcMe0YtKuGsehwisr656BiJ65+33ximA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mt67Vxcz;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55E5606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55E5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mt67Vxcz
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2301135f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729568; x=1794334368; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=Mt67VxczMOvqPKQopALrxqQwM5X1LsyvwtR5oGuMOz37M8Fu4rHiUoBAq31FUhuNtE
         jgliNDn9RkN3r5CZ2CN+WzehJUuX+wK+fPSx3dHE/oqtlVy/woO8Vs5ozFYDOlOqhwrD
         w55K1ixsUhQ/qlgPgmLmsv2E/nfI7GX72tXw+kPFfdDjyrIy8jlHjvoCX8RgvIDFuU6H
         cPp2hoptrqvUpYXobecvGQfNNKp6vpHmtO/GHaY4vyopofrZ5x4ue+xalApa2SaXNrzF
         1akh9oUSZzfKVTQ1upC6PiIaG1XYifFvjEvIJzbKkETouKpc6xdd/qXSVB0f+adsS0pf
         GikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729568; x=1794334368;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=JcTG/zZOBMEwccgGc1VxcByJ8yyOhoCq3AV53YGnVwAzeDZrnaPQOE0Z2eQwkEIqF/
         DEYFzoq12l70oagVxCdyFkgJYrgbApTpDfqqNttx7oQyUW2Q59DSPns4qNNzCHmunOCA
         sKTl4i2K7lkM3ZlEwJT99p5PHKgMt+uolZ5xLtM8NOgMW/5aT447iUJmN5ZaSVuXELTl
         3v4cXmfaNZZs1Jw702JgUVlHx2nF9OZmjqJj+j+csgDOLB2CrRjwpY9wrOPgrwKzyIVY
         i/0w6b2LyOrolzOo1Se5wem4+FLem+xiPbtuT4OWNDete8SWC3DdchqhElzjEooIr8Gz
         B7dg==
X-Forwarded-Encrypted: i=1; AKwUvByeT50BA99Mcbd1xHur723fSlGGRLLNo7eZ3TOEkVCbO4beWvcHwx0jcFw02DA6cfapFC0xNFdshIYIFHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mI0c9lDAIg4zd4e6Mu8NuidFqT+7NTMz69ni+duMymhZuXcru
	YXGLIWsmAEBp1BUJs4h1EdObwXx5b2SI1YrqYxZQwYGDyv2GIOaQLFt/
X-Gm-Gg: AYBFou0WKQibfYHny5MiXyTL0B94QHW6yxrI3r693j7Fm/PB7Tr9HRFUpMISU2tVoeU
	XMG2rVQgZORDUiFuPwGWllFBXLXI0zSXhky6fCtW/YXWqJzZ5PCC+dqyInIzPoRwgvqYvCRk/U2
	cgAEgj7epRZrgWGOPjfPOpUX+rbHvW9szv2Z35qJF5GIWZULND3suBltlN4AOTnan7exXu8X5x1
	cHJfuoDHHN0eIvCcdEbJQhSsu3+TZ9E4NHMQn1Guy/NQgnjt3y62G9seGyBoK/jEtAQ+9oxT46D
	eNmCx0DGqB2rAfxlH64UmEoLNmiH0d6amMaYI+iVUVwohS2Km2wXl3EVVR/1czF9fzORt+Ws8Px
	SxQ7uB+loQjPRJGy1Vg5GMKdWaJ/mBVnzS3FACjB1KWXZ+FPEXK8JKPjOOvDfz5KZ8KDa5/Mf1C
	OpZXIjb+CbItE61wjdK98xzp2SUQp3s0JmOUaFlUMV5mJc2yiawILOhIQIRC8l0iLT9rwAGpn3t
	2/JGcfOp/hcFCOXbD3RpimRWcnYhH+5O7d1z//3u5vPaAM0d5MrIT9qwTPNOu9Jmy8uhGES900M
	cMLFJYyTOYHtNh35JL9Q61F2BTwusNyLAxQa1vVpeCYXTeRIASuJ/QVuBbwJV/S4Qw7XEZh3uDs
	/aVAOufLXNyY3BNiLvEitKOqoTe4S0A/2YsEx8EqU/rkJasx8EkETzilvVrpIgBvPz8WFG09RBY
	v/y++EpY4d+YZmOmXdOsGDMD/TMOF24A6nW8hmZ4BjDNd/hO56BljoRIohlhxp5OwPozvaaFybJ
	I1znH0R70hIHOogMibx7cFbRvKfX5BD69KnTkSpfeV4pu0dcn3BHsHqGFnbEw==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr33769566f8f.46.1793729568150;
        Tue, 03 Nov 2026 10:12:48 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm28261090f8f.26.2026.11.03.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:12:47 -0800 (PST)
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
 Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for
 field pictures
Date: Tue, 03 Nov 2026 19:12:46 +0100
Message-ID: <vCPa4waZQ6-kwYC7OOX3Kg@gmail.com>
In-Reply-To: <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
 <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
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

Dne ponedeljek, 2. november 2026 ob 19:56:52 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > A field picture covers only half of the macroblock rows of a frame, but
> > the driver programs the coded and the boundary size of the whole frame
> > for it, as for a frame picture.
> >=20
> > Program the height of a field for field pictures, like the vendor
> > library does.
> >=20
> > Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > index 10e98f08aafc..ca66a3c6b830 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx,=
 struct cedrus_run *run)
> >  	struct vb2_queue *vq;
> >  	const u8 *matrix;
> >  	unsigned int i;
> > +	bool field;
> >  	u32 reg;
> > =20
> >  	seq =3D run->mpeg2.sequence;
> > @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *=
ctx, struct cedrus_run *run)
> > =20
> >  	/* Set frame dimensions. */
> > =20
> > +	/*
> > +	 * Field pictures cover half of the frame's macroblock rows; the
> > +	 * vendor library halves both the coded and the boundary height.
> > +	 */
> > +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> > +
> >  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> > -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> > +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> > +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> > =20
> >  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> > -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> > +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height =
/ 2 :
> > +						   ctx->src_fmt.height);
>=20
> I'm not entirely sure, but I see:
>=20
> 	fsize->stepwise.step_height =3D 1;

Where? I don't see this in Cedrus.

>=20
> But I don't think interlaced video can have odd height in the first place=
=2E But
> it also have an implication here as you are not rounding up to a multiple=
 of 2.
> Not sure what is the proper fix, but I have this impression something is
> missing.

Odd height shouldn't exist in practice, but I'll use
DIV_ROUND_UP(ctx->src_fmt.height, 2) in v2 if you agree.

Best regards,
Jernej

>=20
> Nicolas
>=20
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> > =20
>=20




