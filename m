Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511504;
	b=ejkYV9XTLK2qh4bB5Pp6ixQ+trOKbeTUz6MhbIWdMKGBEX2e055OItlcZzd2JRjYHPiV
	 4PrsrBsVUCa+ojYFCII9jLegrY0fgbeJ2XoQgwsoksWrf3saWmtOR7easIu6ctwxah+bI
	 a50lozTQDUUCwv0uPR1jUnWq79Qq85+HgwSS3gp7XHnlHs7GY+85xYdo+AVS31mO5AZOf
	 kV2hCdy98oJr2dQLATNHtLGKAZZKFI12702FCLWW2g8J8VgAgwuOhqAvGR8Fz60P20VYL
	 FMgDt6kEfNbBMZPHISp+RjDxPqAS0VrszXvwvu3WXAI3DhnJb/jiiaTb82uN7O79KgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511504;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ihyqJcp063hQ12/dZ8QdAr6+jbzqYQLZQXqNm7GwdvM=;
	b=R4V9OHRXnY+A2kuMDamJ1XBgQJZPOwkeYpmD8PW8U+IlwzUX0xiRu2M9WWcTKtlqCHE+
	 UPB3KBB7VZeLcuNQk1BUX7ZRAeqj7y7Cloo3Uf5+KDD88xK4px3FvWMLbL72P+H09GyNj
	 dWfXCymHAEIHcq/F/Anw2PNurWlqKTrOF0/YIgycpEkC0NjwMED4Ku55w765ph5m3NnDY
	 s3omZn1FW0oYYN/qKqLkxZVouUsIi6IvfXjavrK3tR5JBP0EZZsXRjHD78wfeFi3hMgtx
	 CPA6B4GLnJG1KYQ1xrayiohnGtS/xq+coswsfvJzU7MBV6SlQSW2qi6VuRKym2m1n+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=ha5bkC54;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Kc4FgRHO;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB0606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2CB0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=ha5bkC54;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Kc4FgRHO
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C3740EC0207
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:51:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 20 Oct 2026 11:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792511496;
	 x=1792597896; bh=ihyqJcp063hQ12/dZ8QdAr6+jbzqYQLZQXqNm7GwdvM=; b=
	ha5bkC54wedeKtJH5vcHtHzWgqHjRvR1mZIgmSHHOm3WowXVj2/BfYygUsjzqyJs
	oITBkc5X+ZtP1z/SJtJsCJ8WwX8zwO6HI82aTVKJUust7P7CL+H9TIKJr2/v9Jwj
	AzvAGJdFW+MWd0E3nWLVYH2g8BXiJp8RLFmbp8OqBRru1VcDI84P/s5r0ZCktphd
	51+dQf6uF0/vDJHvqOOnu+KaDS6NUgs+ictG3Sge8wK1LMyYwMiIzAPzuh+tBJq4
	Tq5+oNpLVCQsj92WLBmoCT/wHL7JFnX7BawiVTtyxW0z2cHT3BxrdI7E6TOAEfRt
	Bun6ElRHlb1lFT8o72c+ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792511496; x=
	1792597896; bh=ihyqJcp063hQ12/dZ8QdAr6+jbzqYQLZQXqNm7GwdvM=; b=K
	c4FgRHOKGBWsFjl5LHnPNspHCcX035P9ffT9QKg8TioUadpJY0A1C9tiUwMDrFIt
	TjPsqFAzNA0AWVeMI1F1nUjUIjG/LX68D6bjYZ91b0FM1ID+zY2vOQ3EdJZfes6B
	syKQcSboJdgLkaiGwPW6aT6fdYn3nW69IDbX4suyq2E2jfjfpAibPPP1Wa6aUcR2
	FVtVQYBFvKZN0pSQlw3Jul5YFCd1LLwpz/6qkRA6kPH/v21wjr3RLTWBvUXj+PtR
	j8QnKX/DPz8sycT9wYPIuQ4rYTz3brluKKHTq98P1cT0sNioPcYXL4tuEfP+xgZd
	TNv5ED1a2Du1sIKAtoMkA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792511496; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:nUOeCo7NlLZw0vmydzAXAC8CP+j5ZsJETehkJMhsjU5i2ek
	YGycTiicepIBMOVZL8G2KSmYLofxS3YYf/I/zRU6q5KwLGzAAjp5qxhnFMX8GDsT
	6SHBC+RJsxxWMyd6WRYnkNZoxqF+tvZwzSncBLvMlFNgsQgj1T/22Rl5ZSyZilEx
	5aTOJ17pSBMZ6bZ2DekBJuaxHOzXLXucG3iFGi2HHu15VSE5onTVHGiADjwqHsP5
	PS/RNI5QOLcV3mlVicC4lNyMwMfVYuHVYTPM7TaF4OXQ/XJhnbD7JRJdl+DJklUX
	n0aQaubNtgO9HOtbOX3xLxwC5fpQ87pRItwz2bA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:H6+VekH+RfagDa9Ta/ZkJBvhGYjQcvrLCCvplf64HDI=:2CBY8Di5Gw49pHFVJ7q6QG5GPGQrCc+6ley0NbL/Upk=;
X-ME-Sender: <xms:CI7XarKavU3vZvSHa1PyTo3Tx--mpIkwijHfyGKeXE9lugHy1DVEiQ>
    <xme:CI7XarCcs2FpAS7i5X2mzouVeXz6MfUFZqYy4DwpQYpyWUU71wcvrAHyHBQPtHI15
    EYbKdc-fpjonG61tYgX2ZRi0TttaxbEeX47T0rj9xa6xHiuYldhIzjs>
X-ME-Received: <xmr:CI7XagvySto26wzf-fX056jC9rCcDu8U5iaVnfiD2nDyRqaX57yD9VTWby4KR7SFVCjKLRO-1TCBdBs0Gm5NgvRTVupGQGE>
X-ME-Proxy-Cause: dmFkZTEIwlMRXjli2b4S0aXU2cBhyZD12OVjGkssSXZvXVQNqyrihKWi53snV8WZnVAKCI
    k2hSrdqUS3sPWHQR9KC1cP7oMsBwxgbhfU2wOc0kF1kFSsjNo484RD5YLMOYJgFEIgBZZE
    mZZnND+XOPjGiP4Sm2IbjhJsCk/mt7rssMcNIRXoUsw0ueHbX/0yxfpQputKpSLS3kX2JK
    +D37VONNxHlTvhOf9031AgWUwe9RpV//k2gUh2Y8OHJaqGtKNU3irD/ioOqYvhqyWUBmxY
    UnqpBAfeBoCwo/rj8cPW1zjRrz59TuuOXybhFNgBHYsnlYQnymswK+0DtDz2NdkN/aetWy
    zb7l3PnxhFG7ZuJ1dj+1ERfr8ZJWQ01TUXwZXD0bPJzZ/ekeJwhfboiUft0nM1Bi66vjQU
    cyBNGi02fYiteGDfr9H1GYGc4FTrRVPPFyKeQeNiToWEAmDoPezqJGU/vS9fkIKg1N9AOW
    V2BSiZySwpCUul/NFNgrgTE5BrV8PeOf1iNS5SrYRxa+WutGNm8rMIFGUgsyL9idy2rF19
    AudA+92DlFroRv0Beiqlk/IqiAaZA0g4FQuOAJCsz04CbsX8CFsxlpMlKulKBCxdQUjVeT
    RrWGRy3gqVSeUMZyQFeiFrzvQ4otv9kDHrQekzk3a8pU2qAMh5V7D3kCR7Cg
X-ME-Proxy: <xmx:CI7XapRbtLDzXDdKk9ziNo989FVjoLk-KfvEDXbm71ZXFjFfED61ZA>
    <xmx:CI7XanIv09N1E94W7KvB-omCdD3nB0HtpUTQ2EB8gAAzfG02QrwRbw>
    <xmx:CI7XasvcUbn7YartpZUPwWKmaHPyHltuIxlXj-Ytj9CBE8huMGv5Vg>
    <xmx:CI7Xau_6508go6YWiZdiMRCXX8S4NWen0UHnjX_J6wwoLPiCWeMu6g>
    <xmx:CI7Xag_iNU8RmxK5J_v8KJTyBKbThSRKLiuX_-uk58C908h2Q50cXIhV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 11:51:36 -0400 (EDT)
Date: Tue, 20 Oct 2026 17:51:34 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] media: rcar-isp: ispcore: Honour requested
 bytesperline on RAW input
Message-ID: <20261020155134.GD1172387@ragnatech.se>
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
 <20261019-v4l2-add-nv12-v1-1-4a84736803b6@ragnatech.se>
 <6c8e77c9-c0a2-40c6-8e7f-7e2d51c71740@ideasonboard.com>
 <20261020134444.GC1172387@ragnatech.se>
 <12501643-d486-4b89-a22a-d3e39f0ef221@ideasonboard.com>
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
In-Reply-To: <12501643-d486-4b89-a22a-d3e39f0ef221@ideasonboard.com>

On 2026-10-20 17:25:52 +0200, Barnabás Pőcze wrote:
> 2026. 10. 20. 15:44 keltezéssel, Niklas Söderlund írta:
> > Hi Barnabás,
> > 
> > Thanks for your review.
> > 
> > On 2026-10-20 11:36:04 +0200, Barnabás Pőcze wrote:
> > > Hi
> > > 
> > > 2026. 10. 19. 21:35 keltezéssel, Niklas Söderlund írta:
> > > > From: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> > > > 
> > > > The RAW input video device always overwrote the bytesperline requested
> > > > by userspace with width * bpp. The input buffers are however shared with
> > > > the VIN, which may use a larger line stride (for example 3296 instead of
> > > > 3280 bytes for a 1640 pixel wide 10 bit image). The dmabuf exported by
> > > > the ISP was then smaller than the VIN buffer size, and queueing it to
> > > > the VIN failed with -EINVAL:
> > > > 
> > > >     __prepare_dmabuf: invalid dmabuf length 4042752 for plane 0,
> > > >     minimum length 4060672
> > > > 
> > > > Use the requested bytesperline if it is larger than the minimum.
> > > > 
> > > > Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
> > > > [Niklas: Use max(min(..)) instead of if statement]
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >    drivers/media/platform/renesas/rcar-isp/core-io.c | 11 ++++++++++-
> > > >    1 file changed, 10 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > > index b60b91f43d42..badde72352c1 100644
> > > > --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > > +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
> > > > @@ -5,6 +5,8 @@
> > > >     * Copyright (C) 2026 Ragnatech AB
> > > >     */
> > > > +#include <linux/sizes.h>
> > > > +
> > > >    #include <media/v4l2-ctrls.h>
> > > >    #include <media/v4l2-event.h>
> > > >    #include <media/v4l2-ioctl.h>
> > > > @@ -335,6 +337,7 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
> > > >    				     struct v4l2_pix_format_mplane *pix)
> > > >    {
> > > >    	unsigned int bpp = 0;
> > > > +	unsigned int bpl;
> > > >    	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
> > > >    			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
> > > > @@ -352,11 +355,17 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
> > > >    		bpp = risp_io_input_formats[0].bpp;
> > > >    	}
> > > > +	/*
> > > > +	 * Honour the line stride requested by userspace, the buffers are
> > > > +	 * shared with the VIN which may use a larger stride than the minimum.
> > > > +	 */
> > > > +	bpl = max(pix->width * bpp, min(pix->plane_fmt[0].bytesperline, SZ_64K));
> > > 
> > >    clamp(pix->plane_fmt[0].bytesperline, pix->width * bpp, SZ_64K)
> > 
> > Good idea.
> > 
> > > 
> > > ?
> > > 
> > > And does the device really accept any value between these two limits?
> > 
> > The stride register where this is programmed is 16 bit wide.
> 
> Right, and no additional constraints in the documentation?
> (I don't think I have access to that.) In any case, I think
> it should be (SZ_64K - 1) then.

You are right, will fix together with switching to clamp().

> 
> 
> > 
> > > 
> > > 
> > > > +
> > > >    	pix->field = V4L2_FIELD_NONE;
> > > >    	pix->colorspace = V4L2_COLORSPACE_RAW;
> > > >    	pix->num_planes = 1;
> > > > -	pix->plane_fmt[0].bytesperline = pix->width * bpp;
> > > > +	pix->plane_fmt[0].bytesperline = bpl;
> > > >    	pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
> > > >    }
> > > > 
> > > 
> > 
> 

-- 
Kind Regards,
Niklas Söderlund
