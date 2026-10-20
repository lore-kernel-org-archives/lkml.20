Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503661;
	b=QlImwz36VA8QDP/x6kJSIDGBwHRrMwR1sulbH6nNOfJb6/sD2/Fu8KAh00FrpPS3brPq
	 7bjPJvHCicU+CoPMEfyWcO3j7vtaQ/ZK29TV2PeX4L+5M3+V2/RVFabpWCAKIOHep0x7Y
	 8LYC/IdCAwoR1fltXDI5B5m/iRjR2Qo9sXSKoko/l+0WQTBYU6jw9Y7nS5fQEv7auygIA
	 IB1dn4/xDa/tO4QfvyCBr4zV23chUEqHqfHqq/SBdW59pHQdrbtdDEuS95Bit7UbJJa62
	 j80e8eTcZM8dhE3MPIhWPlh6pvgEVZK88W/LIfaPMyqHwF7d4TEUIx454WUzF92/PNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503661;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Ch9EGHhdFtFSQITU6Xmc/6an1xBjtM45m6Nl/WAREV4=;
	b=YceRe0Ggrg0zGpY/QoToTfzU7OVvai2bAqUTOF/JZ/P5AB7UApSO4r6whvGzykYeCZeS
	 u3ZwlI9rSJE7hkEI5YX1FYrFdTd6pNN01daiO/3nq0pKCcjHueZ4rZAK974iA4NAyahEl
	 kEwon55hLgQnl34f3gNYkFEa/bmeKZPH/GiMEDhDquol7I/9E2p1Ahi3pXkyREwS6Pflz
	 oCK4nXtqtvJI8bz/NZyD2vo3Q3Tt2uXPnfULYUKpYRUOrGX8mwZGm/9KN87ClrAoDqrPH
	 xwDdfu3vTKG3uf7rczh3qWyJ40Sv7fjSc/1RHw4aeZ2O59f+ihAqzBgVSV1ZCyZE83g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b="Q6sAmx/s";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="KA/jFcbg";
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61044606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61044606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=Q6sAmx/s;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KA/jFcbg
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5D561140012B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:40:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 20 Oct 2026 09:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792503654;
	 x=1792590054; bh=Ch9EGHhdFtFSQITU6Xmc/6an1xBjtM45m6Nl/WAREV4=; b=
	Q6sAmx/s4efWvRJxz5ONQ94MWaRqF6EPglSRKZ1jax2P4NFTaxdXvcMJWbxaSE6f
	HxAyxZuTc1LgOKSIhPk94Vgpzx2k/FCG3fheup7psqgcR/0B1o3uhkpw3JJU8l7l
	Z3rnFzmrHA8QV10pLUtpxp8bTyV0cIHn/Gay8sV4paqZ/OtikYb/62RPeqxZRexc
	W4JUD6LcZDzilyEO8B75Z5aeq+X1ZOlLSAgfr+FmEEr/fQc5uGyt2yxYziyfICbC
	x+jo071hVy2Y0FgQ+4k8oz6kO8cPjeAfDr98TF9riklRH4exPUr7XQUZZVNvHBuE
	aH26l8bYIN+ZQhEry97ouQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792503654; x=
	1792590054; bh=Ch9EGHhdFtFSQITU6Xmc/6an1xBjtM45m6Nl/WAREV4=; b=K
	A/jFcbgUXJHZqLUD/0Y9/KfDsr1XoNsQBCgMNw5ADUyCfV8/4ClK8dzLoxmPwyfM
	0a+co/Y2qXNB/d2YDaaBroqMGy0Q1+kcPO4OHnfmuLuz4CY7HbTeJS5LWljaBwlg
	2QvIVmIZJBY5451TTIsXN2UqZfxVReJg+S0UkUuHXi4AXhAmW3nGJMtZb+gNgIg5
	SJSltJBQbq1FeHfzMmP2icW+fCEygEjVMDWtltpn50OAae3qfFvUcyo2kWF6WkKb
	4bhsBLFRyGoFgYHtnkwSE4d27SwAVDWLelO1BI3Im1zfZDPoV1Wk8Ou80rdsKScF
	+Jgn87pliNcUUB08odJ6Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792503654; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:JSEVQMN0PWuasTtqFIRjOLRz5mwrkzx0rm+0WYtaIpFEyO9
	jWCsr/oOtADEPCOnDnXbkqsZbxhcWhBXwiUtYdK3OKIeMPEK2gd/skSdXoPUgD30
	9G3dcv6KNlWC1jORZjbWXOrYnmW5Ce3tDI54S5cOWWRbjxDj8cqZduo7gb2Bx6cX
	ApbuLFvE+zDS5rIiHuyFxppJ7/1NMr9xdMAHV2qTLGVpGRZkbYux0Wwb42YaZrLJ
	xJK0jzcSxHhlzYOtTqgzyD0htY9Br2Jbru231rldP0TsD2FyaSyLz9ygT7fxFeqQ
	Zh4S9PGVO5dSIpmyUCkZtlNAxucaZJXolH4X8wQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7eVYVWFSw1dv9c9XRzhrtGOOKWPK9sZLTfUvGkT0IrU=:cFm8amiM4h0ViIctEggUhklzsyqkE/L1L7M9EPmqZE0=;
X-ME-Sender: <xms:Zm_XapAfqsV6rWHP2_TWKg0J4o4QpKVKQCR34QMsQTIxOSkkZNZa_g>
    <xme:Zm_Xah_eI8QktFjG0MbuljSr2SjbM5O2cnue6PFc-VUMNzBRLTu7oqPjyRHTx1X4T
    _oY1I1fXhQ61aK2ZY_9HjpHdXx69vuvXb_r5TJ-bhfLZ6AFHDviKxznLw>
X-ME-Received: <xmr:Zm_XasHr07WMGclPLRx_AFEBg5H-ev4yh_VZy9H0S-Zs0k10nAqdHMYrIqfLJRbDCm5TNbgIIf0dpFdS2o1ylfZiP-KCQ_c>
X-ME-Proxy-Cause: dmFkZTFfYFgKMVra/dTO3FrIJ2fwYSC98RHH68tJO7rscRjLc3qWFpGQmq/tiAEDEAQ/6s
    gL2tc41CSKt83ptvcHBNrq1JC5qAegJjcow4aUi5tSI5Snfilek55jmpguKzi+1v1e7lkh
    P6Dj+qF46w1YAO44TZQj5UjrWQdgbn88Uvn7Upw2zOPqwY4wlpIYSSU+K1ZE1v8idHcXrh
    JC4oMTWn0x+27MfmZhB73vgZk+DO0+MO3NlNjgjEzNEZYsOND7cTsEWMXK+0WSZXuDySpX
    gXR8PvxyqhE67mE0xK8et9KLwgIJkZMGufwiu3hT8/1tk9yBSUskFR9LCO2cjuep1mw0cg
    wwXQgvdZXyxH2E+pkzPFU/vhQMElYec2ENjlNYMkh/6RHLZ6CG4aT3xAf/0w4bKmPEsadk
    TfQIWuNeCAE8TnSnVyLbwdhP9EOVlXnPa/QANE5uzvAm334848hhoT1qfEAvGkgEewBRmi
    EXzcGbD07y7FsqFCZLXtW5D48GIStn7l0fj87mIl5kUPkfus8WQybpsodc5TxQx0Ir03/9
    DzGw3OSpxObnyVLek3PeocsOikO8DwEhXiTeGdRTYSA8KE6LOVtVJM19Rmr9KbbqlP87gP
    Y1JzhFt/QxtrBJB7gDDTphIzhmA3CEnPeKpCCOkzGshueGoXZc9m3BN8tf0A
X-ME-Proxy: <xmx:Zm_XarTo5gFRvjeT4OeQziotIB2Fb7e0I5POQ56bJ1KInTB7NPb9Aw>
    <xmx:Zm_XajRswEe0OV3AJ7rVUds5un5INMemiLjtBUfeDNR1G4Zi8-rIcA>
    <xmx:Zm_Xau3U_t4ZStAVrvyxAWnjZtIw3M4Bnk20IV5JlX9ovyg-DxueTg>
    <xmx:Zm_Xatzi88N3MN8wrHcxsN9anyxkFHpGk0I19l9_0vNmrZGQakPjNQ>
    <xmx:Zm_XavRyB4KLZbzxzsBYb_8qXMcuKOspPW_wOd0nGw5azKZn5muYW6-G>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 09:40:53 -0400 (EDT)
Date: Tue, 20 Oct 2026 15:40:51 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: rcar-isp: ispcore: Update image data flush
 settings
Message-ID: <20261020134051.GB1172387@ragnatech.se>
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
 <20261019-v4l2-add-nv12-v1-2-4a84736803b6@ragnatech.se>
 <03c04d5b-c93c-4e1e-8889-de079adae312@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03c04d5b-c93c-4e1e-8889-de079adae312@ideasonboard.com>

Hi Barnabás,

Thanks for your feedback.

On 2026-10-20 12:19:54 +0200, Barnabás Pőcze wrote:
> Hi
> 
> 2026. 10. 19. 21:35 keltezéssel, Niklas Söderlund írta:
> > Later versions of the datasheet have an updated chapter on how the image
> > out flush settings depends on proper stride settings. Update the bytes
> > per line calculation and flush out settings to match the datasheet
> > clarification.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >   drivers/media/platform/renesas/rcar-isp/core-io.c | 28 ++++++++++++++++++++---
> >   drivers/media/platform/renesas/rcar-isp/core.c    |  2 +-
> >   2 files changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > index badde72352c1..48db37bad69c 100644
> > --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> > +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > @@ -733,6 +733,28 @@ static const struct v4l2_pix_format_mplane risp_io_capture_default_format = {
> >   	},
> >   };
> > +static unsigned int risp_io_calture_bytesperline(unsigned int width, unsigned int bpp)
> 
>   calture -> capture
> 
> 
> > +{
> > +	/*
> > +	 * The datasheet specifies strict alignment and padding rules to be able
> > +	 * to flush out all the pixels. Each line must be 256 byte aligned and
> > +	 * at the end of the frame at least one extra line of space must be
> > +	 * available.
> > +	 *
> > +	 * As we can't extend the buffer with one extra line we need to work
> > +	 * with stride setting to satisfy both constraints. Fortunately the
> > +	 * datasheet gives us a calculation for this.
> > +	 *
> > +	 *   FLUSH[pixels] = ALIGN(WIDTH[pixels], 256)
> > +	 *
> > +	 *   PADDING[bytes] = ALIGN(BPP[bytes] * WIDTH[pixels], 256) - BPP[bytes] * WIDTH[pixels] + BPP[bytes] * FLUSH[pixels]
> > +	 */
> > +	unsigned int data = bpp * width;
> > +	unsigned int padding = ALIGN(data, 256) - data + bpp * ALIGN(width, 256);
> 
> So this adds one line's worth of extra padding on top of what is needed to achieve 256-byte alignment
> of the actual data? With this change, for an output size of 2304x1296, I see
> 
>   ioctl(18</dev/video3>, VIDIOC_TRY_FMT, {
>     type=V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, fmt.pix_mp={
>       width=2304, height=1296,
>       pixelformat=v4l2_fourcc('X', 'R', '2', '4') /* V4L2_PIX_FMT_XBGR32 */,
>       field=V4L2_FIELD_NONE, colorspace=V4L2_COLORSPACE_DEFAULT,
>       plane_fmt=[], num_planes=0
>     }
>   } => {
>    fmt.pix_mp={
>      width=2304, height=1296,
>      pixelformat=v4l2_fourcc('X', 'R', '2', '4') /* V4L2_PIX_FMT_XBGR32 */,
>      field=V4L2_FIELD_NONE,
>      colorspace=V4L2_COLORSPACE_SRGB,
>      plane_fmt=[
>        { sizeimage=23887872, bytesperline=18432 }
>      ],
>      num_planes=1
>    }
>   }) = 0 <0.000074>
> 
> which means that the stride is `(2304 * 4) * 2 = 18432`, which is effectively
> twice what would be required for just the 256 byte alignment. So this
> in practice doubles the size of every buffer, or am I missing something?

No that is correct, check chapter 54.5.11 Notes of additional memory 
area of flush out (Image Output DMA).

I'm quiet sure we could be more clever add add the flush out after the 
image by sizeimage = bpp * (hight + 2) or something like that. I opted 
for the big hammer here as this large padding space is needed to support 
NV12 due to how the DMA-engine operates.

In future we could look at using this more clever way for NV16 and RGB 
which do not need the large padding are to operate properly.

> 
> 
> > +
> > +	return data + padding;
> > +}
> > +
> >   static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
> >   				       struct v4l2_pix_format_mplane *pix)
> >   {
> > @@ -749,16 +771,16 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
> >   	case V4L2_PIX_FMT_NV16M:
> >   		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> >   		pix->num_planes = 2;
> > -		pix->plane_fmt[0].bytesperline = ALIGN(pix->width, 256);
> > +		pix->plane_fmt[0].bytesperline = risp_io_calture_bytesperline(pix->width, 1);
> >   		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
> > -		pix->plane_fmt[1].bytesperline = ALIGN(pix->width, 256);
> > +		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
> >   		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height;
> >   		break;
> >   	default:
> >   		pix->pixelformat = V4L2_PIX_FMT_XBGR32;
> >   		pix->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >   		pix->num_planes = 1;
> > -		pix->plane_fmt[0].bytesperline = ALIGN(pix->width * 4, 256);
> > +		pix->plane_fmt[0].bytesperline = risp_io_calture_bytesperline(pix->width, 4);
> >   		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
> >   		break;
> >   	}
> > diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> > index b5861d0cd0e8..3e135e84b75b 100644
> > --- a/drivers/media/platform/renesas/rcar-isp/core.c
> > +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> > @@ -398,7 +398,7 @@ static int risp_core_config_output(struct rcar_isp_core *core,
> >   	/* Set image out flush EOF. */
> >   	risp_core_write(core, ISPCORE_DMA_IMAGE_FLUSH_OUT_REG(index),
> > -			pix->plane_fmt[0].bytesperline <<
> > +			ALIGN(pix->width, 256) <<
> 
> I'm probably mistaken, but does this not need a multiplication by bpp?
> Or was the previous version actually incorrect?

The whole DMA Flush operation was a tad missunderstood but is better 
documented now. The unit here is pixels not bytes. This register covers 
all component outputs and each component may have a different bpp.

> 
> 
> >   			ISPCORE_DMA_IMAGE_FLUSH_OUT_PADDING_PIXEL_EOF_SHIFT);
> >   	/* Enable DMA and set burst length. */
> > 
> 

-- 
Kind Regards,
Niklas Söderlund
