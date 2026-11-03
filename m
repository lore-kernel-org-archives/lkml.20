Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729175;
	b=o/rNH3sT/ukM3dLbP00MFfSOr4HpsvGRtQcFfsWYvN2ybcyWuqjSpXp0wAd7F9N8Qg7z
	 TmEzL0aVbdat8OZUS0cGV9+FGe4rtgSe5mDIQk/+0KcIqgdjznBd/KkYhW4/vo0FT/tDW
	 Uwa9YfZBejgSXv7q2/TpLGRcNimmbncZg7Xj0m7b1sV/N4uUOC42bfteGf9s3fy4Y9Uwq
	 gVljxiKBdtd1OiT9i0PlppkB3JLbQD/jJIK1jKrhfA+s0LwAjLLMau77zbWE76NUaUVte
	 A0LJXeaEoBznl5cX2V/JThMvpaBKGh/43bumvVKg6FrfgtazGjBUFrQin+CDBDA3IQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
	b=p4XM2ZArhWRt6/o+dkluYwX0K7Z72x++2JCYgIVlGYceepA3+yTjsWJ3aoLtkpHVY0AH
	 wnVpZl564RdbwIKXX0bn3zgtQ9pi8DDRDNT39mlBlkDrNWpvUwOrgaOYs6nOuzwTeB3Cq
	 sZiXthMsY+M/QOVtBo6IN/g9T9XuiiLrKdny2RajzrTxsRgEisHx74NNf7hF+v0u+lSzr
	 h4C5JZcpgcLifzm3RdUxwk31cbXfIzVGSZB2OHkiUBNmRr+0igjf0/A1szK4K2JAYz+4e
	 pVP5EfMhKX2dy3bWk0sYc15VkkplbmiU4wsfaF1l14WV+dFPaSX+cHKSMXa0ZY7vMLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idNvEbbb;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBF4606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CBF4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idNvEbbb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so44649675e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729172; x=1794333972; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=idNvEbbbZpJyK0/FZ5PKq6vZIUwUCRUMAt2Qm1csJy31sLm4GXNKwGoQz3qgo4Wntm
         TmJ3Cw1XVYSYscnxrd4ofDDx6MpIrZaMvzSLvk+OY/9fRhrVtMLBQyJRGtjCt3ZBIhd3
         2fb8GTxGgHOuDi4Fx6NxVplGElDpt3+8M9zzoevPmrtslJw+ugANd8l0KF9/zkLhobjN
         DbGePUSxW6WWTgXx45fyepLWOPu8JVrVQMOK0a1cmtg27RcaPwxZXn1c8EDQK1xCk2ES
         YHUGYQ+OJat/IPqtWQZCa28odubgCZiqF1db3FnJC4QhuKlFFoAZzzFIhMLO/1uSXKIV
         UbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729172; x=1794333972;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=L5OeKR6cah1xnptwZhgrZZUNqd8lgzf7qwf7VyxH0K3qmQX+3SeIu5xFvajhb/T+Cv
         eUvCRrwd97b4yAPJ+2RP1QeugK2j2y51K/dhSUudA6HwM0d3USPo4UzNswQbkQUrBnH0
         43QxhkrLkcB+NNf6UhyGnnOR90qKm2vqiaqWwr3mRaPXD1qYGj1IA5WUeh9FF13BVkad
         hUraarrL5uKDC6FyEACQhl5dSdpuKxeYw+NJBynK4yaPXz9GUJjEeegASSmTp4/o6LJw
         Ev/dNX6W4ZXvgXAn9PIKu/n6tD7TjAaUOzEWEOvK3Vx4r56jeLVjUVtBxlR8ORj5CHNN
         ZLPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXAdXdBz9loBr++NQR3Tq3Tdz+uazC0sfxiVDBXLLLx5aq82Xnxvd5wrkaszkVUM3tx5Lekk/HIOdAsNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MN7rkmFRNqRJOBS4oyqpHcswHoMhSZetW3YURnJG7ruNhdjkF
	DYK/S8kCqz/ZH9nkPjPuZxgikoJ175C/NLucj3Vtk++AB6HOOqOz1/nH
X-Gm-Gg: AYBFou2CpFargiSF5dJdty8SqQgZzaPcyU0tWct398U+2ErPoTKqWTIp0d8/mP4DXMO
	HR0E7nN241nXKTgwG9ZfDVsL+FIVDxbGa9VLqnAWnbtkvZuJ5s4gHr38AP/0Kw1t0hmJ2bOJLbw
	puw1CvXwDUmURzrsHX0A3TwIIB9/pyYKMG5QbDtom25Ft8syJ5zIrIivFglZ9x+Q8t2gw/Nabrg
	MUsMvxt+y1tvwBy9qLsqn9Hao7bQr5N5p+PmsuzHC/akBgAcukM5pRxIMZJ0VOc3qEgcQb150jC
	UjiAJiL7NDnMgqwzG2GvevS88XoBs0b6m/k8VseY8lPrAhzV6JLrvojFg+KiciGkeQRlFbx7RIz
	QQgf0LH4foIHiljF0Dvr8KzG2WO2dP6f978JMHCLK7eAcX8XVk8wpmFznN9a8jWhcAxy6B1mmQq
	ct/KWTvOjOeT7WC7MHorXeajb9czaV5AB9qyqZ3aiMU7CSphgg+FQXRzMz7E7cWl8dtKp29tR+f
	K2DIAdyzirgDPZ0W3mNJkRrhWepTO6Pl7sMrPPIe581B36H5by7Ht3js6gi8eBa6hzhA1i0peKi
	/lkOO7n+R++k/lSJrrIg2FYnCL1/xPZRhiulf53LOm2VhcW9ZenZDibIIrIw4/BV8ZlyFl+V5xn
	4Xhs+rcc5QQkd91P+04v968mA1yJf2GuVgOC/no/EL00QBnJ+eCnbqgFQfBrS366TZSjrZcXuMc
	ahQ2L0ShUJQuqWUMZ0aeOzh1nZFj5ficoGzKmvgNwgc7x1kXq7L6bo4o1IO0eoDT+fCbQZ+WymD
	pQOGUoWMsvnA661kw2arJ4pgjDhoBFgcrUADqtVDVNoTLvosvScY2nf23CRlCn+m5SobZD3nL0h
	/xWC71U=
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr284061485e9.23.1793729172136;
        Tue, 03 Nov 2026 10:06:12 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm82769945e9.4.2026.11.03.10.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:06:10 -0800 (PST)
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
 Re: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in
 the frame info
Date: Tue, 03 Nov 2026 19:06:09 +0100
Message-ID: <zYI0QcxKSEeu6sHIbu0-3w@gmail.com>
In-Reply-To: <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-4-jernej.skrabec@gmail.com>
 <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
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

Dne ponedeljek, 2. november 2026 ob 19:50:44 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Hi,
>=20
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The frame info of a reference has a reference type for each field, in
> > bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
> > long-term reference. The driver never sets it, so the hardware handles
> > long-term references like short-term ones, also where they differ, like
> > in temporal direct and implicit weighted prediction. The vendor library
> > sets it.
> >=20
> > This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
> >  drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h264.c
> > index 892193c12b2f..a716955655f7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *=
ctx,
> >  				struct cedrus_buffer *buf,
> >  				unsigned int top_field_order_cnt,
> >  				unsigned int bottom_field_order_cnt,
> > +				bool long_term,
> >  				struct cedrus_h264_sram_ref_pic *pic)
> >  {
> >  	struct vb2_buffer *vbuf =3D &buf->m2m_buf.vb.vb2_buf;
> > +	u32 frame_info, ref_type;
> > =20
> >  	pic->top_field_order_cnt =3D cpu_to_le32(top_field_order_cnt);
> >  	pic->bottom_field_order_cnt =3D cpu_to_le32(bottom_field_order_cnt);
> > -	pic->frame_info =3D cpu_to_le32(buf->codec.h264.pic_type << 8);
> > +
> > +	ref_type =3D long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
> > +			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
> > +	frame_info =3D VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
> > +	pic->frame_info =3D cpu_to_le32(frame_info);
> > =20
> >  	pic->luma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0)=
);
> >  	pic->chroma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, =
1));
> > @@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  		cedrus_fill_ref_pic(ctx, cedrus_buf,
> >  				    dpb->top_field_order_cnt,
> >  				    dpb->bottom_field_order_cnt,
> > +				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
> >  				    &pic_list[position]);
> >  	}
> > =20
> > @@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  	cedrus_fill_ref_pic(ctx, output_buf,
> >  			    decode->top_field_order_cnt,
> >  			    decode->bottom_field_order_cnt,
> > +			    false,
>=20
> nit: Not a hard objection, but I really hate boolean parameters. It could=
 be a
> simple as:
>=20
> +			    false, /* short term reference */
>=20
> Or using an enum. My preference being documented here, its yours to decid=
e.

I'll use VE_H264_FRAME_INFO_REF_TYPE_* as parameter. I have to fix sashiko
issue anyway.

I'll keep your Reviewed-by, unless you object.

Best regards,
Jernej

>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> >  			    &pic_list[position]);
> > =20
> >  	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers=
/staging/media/sunxi/cedrus/cedrus_regs.h
> > index 05e6cbc548ab..961fe023bb43 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > @@ -616,6 +616,14 @@
> >  #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
> >  #define VE_AVC_SRAM_PORT_DATA		0x2e4
> > =20
> > +/* Frame info word of a frame buffer list entry in the AVC SRAM */
> > +#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
> > +#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
> > +#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
> > +
> > +#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
> > +#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
> > +
> >  #define VE_VP8_PPS			0x214
> >  #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
> >  #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, =
28)
>=20




