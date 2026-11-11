Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390426;
	b=czX/TzCVlJ1Tq4SocDiPUb8QhZ/FwZBuhcIbv37nhuNordzoY08usq6HUcxAmd03MZKY
	 1Z7/5KJyobbEF/OPYQiF5V/EhKxIp9791NrkRemk4pfVxkiUNPLbOmz9GqXxIXk/dh5qV
	 WxIW/T+wZVyGUFWM2x4WX9SJpfVKTvyzS+Q4XhbvfGD4qvW6s9u7yCwJhyKS+XJC8OhnT
	 k1W+g3sin2+t1n4j1eWcOO+z22778JgHQZUcGhHS3rXOKQA2NtQvWvAcjxcXKcPt7ivaO
	 +QHIA0EdeUuVOJlXfEKPcc9t5rD+64ZB2NmjUJGvPMipr5HF3s2Wed9/pOoX/uw3QXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390426;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=dDFMBYQOa4uJE7PzeKyrrGP8ivAyLwocI64qk9V7SoQ=;
	b=mo8jK8nvmSm6vqtqrAb9mC037W3fj89GOdnTZBbP1nflEWZzcOoZL2URBb7SOpuwjwzg
	 hBt/NABiIeEBFAq9EhIE/6VnlM4OdkETa+STu3qkSFRFeAIXIoKQmQdLy+NclKXBQj0Ht
	 +/r3M+4pFP9wpT5w+zaHA60d0GriHzxYr0abnwAcaCN2HFLWvdCCXDDqJ/3gKsfXT5Riy
	 W502l5kex46bxKJ3lruoHg58fAkcquVkIkZt6qf032+SCnydOwarpbr0Vkb9y+HRxkCKh
	 IXZvlgnAD75cDU1WbilroswnrT4mOnKlVFl/Igf79wJ5JYM7BWpJUTh7fhGlQ+AsXGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JXBRqsR8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9584606A336;
	Wed, 11 Nov 2026 09:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9584606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JXBRqsR8
ARC-Seal: i=1; a=rsa-sha256; t=1794390409; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zova7S+4VoUlY0Zd9ItVIFVeGKZs4+fz6hdRSIiIM+PM8qgLpQll0rFvUH45cx24OIhaJkkJZ9Esoxm/3I9xIcLW+oxtjnM7AbV/3jDtcJyZo2HJxpGKJoGEuvl80DYktsZ+dhrBK7dhmawDFx2dPrsByrO2fuEbrjsinKd12io=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794390409; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dDFMBYQOa4uJE7PzeKyrrGP8ivAyLwocI64qk9V7SoQ=; 
	b=e4/2iRZ6OnHxulopSPGTWhuj64Le5Ki3NdOgMAB8ipfQQfOPZdAJsBLrUlZRe1UWkZuZEfJp2z7NoKbR4ibFD9SLbxneTBiZvMM7XW5FByX9NKdh/MfSLtWVkB5hr3kiiSb3EO03gd6XgosjjYG/anTBzemIqAwM6ntOkrmWrHE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=JXBRqsR8ousycN+AeIqhe6tHpIhFzn0QMfond1bqheK7uEsFspseCpTB34+RHZMrY1LwF8HXocIlmaBxGy8GdtSvscUYaRCMUrQbuG9xCiBn9DYwnFOu2borWiFcyWKhByEyfLepxBDOPvVIZRkMPOisTjgQOYmbFPkD+BFI494=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=dDFMBYQOa4uJE7PzeKyrrGP8ivAyLwocI64qk9V7SoQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17943904075303.476694908820832;
	Wed, 11 Nov 2026 01:46:47 -0800 (PST)
Message-ID: <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
Date: Wed, 11 Nov 2026 10:46:43 +0100
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
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
To: Faizel K B <faizel.kb@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261105232310.385463-3-faizel.kb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi there,

Thanks for the patch!

On 11/6/26 00:23, Faizel K B wrote:
> The MIPI DMA uses bytesperline as the line stride, which must be a
> multiple of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it.

Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
"Virtual line width of even frame for ID0 path(must be aligned to double
word)." which I would interpret as "it must be a multiple of four
bytes". What do you think?

> Any larger bytesperline requested by userspace is also replaced with
> the minimum.
> 
> Align bytesperline to 8 bytes and honour a larger requested value, up
> to the limit of the line width register. This allows DMA-BUF importers
> that need a larger stride alignment to use the buffers directly.
> 
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> ---
>  .../platform/rockchip/rkcif/rkcif-stream.c    | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index f2a24832a8cf..e50f20e40f7a 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -23,6 +23,7 @@
>  #define CIF_MIN_HEIGHT	 64
>  #define CIF_MAX_WIDTH	 8192
>  #define CIF_MAX_HEIGHT	 8192
> +#define CIF_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits, 8-byte aligned */
>  
>  static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
>  {
> @@ -334,20 +335,39 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
>  	.stop_streaming = rkcif_stream_stop_streaming,
>  };
>  
> +static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
> +					  u32 req_bpl)
> +{
> +	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);

Please add support for the bytesperline field in all the plane_fmt
entries here...

> +	u32 max_bpl = min_t(u32, CIF_MAX_BYTESPERLINE,
> +			    ALIGN_DOWN(U32_MAX / pix->height, 8));
> +	u32 bpl = min_bpl;
> +
> +	if (req_bpl > min_bpl && req_bpl <= max_bpl)
> +		bpl = ALIGN(req_bpl, 8);
> +
> +	pix->plane_fmt[0].bytesperline = bpl;
> +	pix->plane_fmt[0].sizeimage = bpl * pix->height;
> +}
> +
>  static int rkcif_stream_fill_format(struct rkcif_stream *stream,
>  				    struct v4l2_pix_format_mplane *pix)
>  {
>  	const struct rkcif_output_fmt *fmt;
> -	u32 height, width;
> +	u32 height, width, req_bpl;
>  	int ret;
>  
>  	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
>  	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> +	req_bpl = pix->plane_fmt[0].bytesperline;

... and here.

>  	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>  	if (ret)
>  		return ret;
>  
> +	if (stream->interface->type == RKCIF_IF_MIPI)
> +		rkcif_stream_set_bytesperline(pix, req_bpl);

Why is this restricted to the MIPI interfaces?

Best regards,
Michael

> +
>  	pix->field = V4L2_FIELD_NONE;
>  
>  	return 0;

