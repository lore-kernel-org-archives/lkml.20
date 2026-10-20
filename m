Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509967;
	b=UnzASST4gf8tfCHbMiOqAxINJi0wpy91MKJyDEgHmDc5JbTDg81Mz+vD8gLc5p5sKiPX
	 gffuxm6BFXG3At/IdTphTtzJ+vDgFZFeEe3TPvx+bC2sl86ZKwr7GieswnVSX+vlooaNw
	 rQNbLrAZ5+uMq0rS44HXFORopU8cuSwUlhdF+WWhQsrcfFu51DiZrGLNSTYNcSrQoC31q
	 p23G3TuycjXeLluy3c962eBRUqtcE3dXikvKxRDJZS9chuseICRVdnCbtNbyZ3W4XY23G
	 24kGxTw7mdHt7hKnOYJLsA9N60fIXcNeq0FhHX5r2LupcO7my33D6NID0jaZB1R0n7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509967;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9dHCl5RXx/2/9qIsVZxRyhMH90kkyLGIrkYbLlu2bb0=;
	b=LjfCvZCmwvlTWMnLPKMHgrv/57BrkP73+ml9YFAN9YM+pJDU52wVXONbsvN4uHftKTzP
	 d0s9FpLMvgBnR3cLqvjxbVIDUH3zicR+fbqAOmUVmTqrzGsPGwxrq2T3TRk3cYNHCGv+X
	 kDiQ35Ml7kFcG90hNrnVEAOmGTiVHZ2DGEC326bzPvwJccGvEq7+N4Qbi/dRrfj/hyqVk
	 jFXYlRWvK/qhrCYvxJ1S61TQcr+HcSefe1M9KfoTY9xq09wHv0LVdg2IyN6UVWQfBGccW
	 Hibc04nTy7Fr5ffzGlVYORT+0FbrJHcc+4LJeIgQe5bwGO2DjMu3bsQNmRGWGo3HoBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PE4CXuGl;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70586606A321;
	Tue, 20 Oct 2026 15:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70586606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PE4CXuGl
Received: from [192.168.33.26] (185.221.141.235.nat.pool.zt.hu [185.221.141.235])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA8182E9;
	Tue, 20 Oct 2026 17:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792509832;
	bh=X/b6p9mxgo78TyagHARr8NN21UhvkYS6ChulszYxUrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PE4CXuGlW0+DNWVdBsN9LEoXvXmbBMrkulYfHpTtUQErWC1489Aw2XBiR7XOmc78V
	 QtpIJZ/DJs/kaBhsUAKzv/V/Ir+Rd6xy5YjI/LNW7JV/r6YsmSxHCDaQFIW1LLTbT7
	 azK4eihCeNt1UAJPk9edqpQ8GoXx0e6P1f2HzUgE=
Message-ID: <12501643-d486-4b89-a22a-d3e39f0ef221@ideasonboard.com>
Date: Tue, 20 Oct 2026 17:25:52 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: rcar-isp: ispcore: Honour requested
 bytesperline on RAW input
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Yusuke Goda
 <yusuke.goda.sx@renesas.com>, Yuya Hamamachi
 <yuya.hamamachi.sx@renesas.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20261019-v4l2-add-nv12-v1-0-4a84736803b6@ragnatech.se>
 <20261019-v4l2-add-nv12-v1-1-4a84736803b6@ragnatech.se>
 <6c8e77c9-c0a2-40c6-8e7f-7e2d51c71740@ideasonboard.com>
 <20261020134444.GC1172387@ragnatech.se>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20261020134444.GC1172387@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

2026. 10. 20. 15:44 keltezéssel, Niklas Söderlund írta:
> Hi Barnabás,
> 
> Thanks for your review.
> 
> On 2026-10-20 11:36:04 +0200, Barnabás Pőcze wrote:
>> Hi
>>
>> 2026. 10. 19. 21:35 keltezéssel, Niklas Söderlund írta:
>>> From: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
>>>
>>> The RAW input video device always overwrote the bytesperline requested
>>> by userspace with width * bpp. The input buffers are however shared with
>>> the VIN, which may use a larger line stride (for example 3296 instead of
>>> 3280 bytes for a 1640 pixel wide 10 bit image). The dmabuf exported by
>>> the ISP was then smaller than the VIN buffer size, and queueing it to
>>> the VIN failed with -EINVAL:
>>>
>>>     __prepare_dmabuf: invalid dmabuf length 4042752 for plane 0,
>>>     minimum length 4060672
>>>
>>> Use the requested bytesperline if it is larger than the minimum.
>>>
>>> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
>>> [Niklas: Use max(min(..)) instead of if statement]
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>> ---
>>>    drivers/media/platform/renesas/rcar-isp/core-io.c | 11 ++++++++++-
>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
>>> index b60b91f43d42..badde72352c1 100644
>>> --- a/drivers/media/platform/renesas/rcar-isp/core-io.c
>>> +++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
>>> @@ -5,6 +5,8 @@
>>>     * Copyright (C) 2026 Ragnatech AB
>>>     */
>>> +#include <linux/sizes.h>
>>> +
>>>    #include <media/v4l2-ctrls.h>
>>>    #include <media/v4l2-event.h>
>>>    #include <media/v4l2-ioctl.h>
>>> @@ -335,6 +337,7 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
>>>    				     struct v4l2_pix_format_mplane *pix)
>>>    {
>>>    	unsigned int bpp = 0;
>>> +	unsigned int bpl;
>>>    	v4l_bound_align_image(&pix->width, RISP_MIN_WIDTH, RISP_MAX_WIDTH, RISP_SIZE_ALIGNMENT,
>>>    			      &pix->height, RISP_MIN_HEIGHT, RISP_MAX_HEIGHT, RISP_SIZE_ALIGNMENT,
>>> @@ -352,11 +355,17 @@ static void risp_io_input_try_format(struct rcar_isp_core_io *io,
>>>    		bpp = risp_io_input_formats[0].bpp;
>>>    	}
>>> +	/*
>>> +	 * Honour the line stride requested by userspace, the buffers are
>>> +	 * shared with the VIN which may use a larger stride than the minimum.
>>> +	 */
>>> +	bpl = max(pix->width * bpp, min(pix->plane_fmt[0].bytesperline, SZ_64K));
>>
>>    clamp(pix->plane_fmt[0].bytesperline, pix->width * bpp, SZ_64K)
> 
> Good idea.
> 
>>
>> ?
>>
>> And does the device really accept any value between these two limits?
> 
> The stride register where this is programmed is 16 bit wide.

Right, and no additional constraints in the documentation?
(I don't think I have access to that.) In any case, I think
it should be (SZ_64K - 1) then.


> 
>>
>>
>>> +
>>>    	pix->field = V4L2_FIELD_NONE;
>>>    	pix->colorspace = V4L2_COLORSPACE_RAW;
>>>    	pix->num_planes = 1;
>>> -	pix->plane_fmt[0].bytesperline = pix->width * bpp;
>>> +	pix->plane_fmt[0].bytesperline = bpl;
>>>    	pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
>>>    }
>>>
>>
> 

