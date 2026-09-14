Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601748640F;
	Mon, 14 Sep 2026 19:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415374; cv=none; b=m4XFwFeKiAAZCQi4r5Aa9dBwMgTRdrbRCF7AYTh9Wum8uY48036fitS3PbtI2NMhHzJTRPh+lmqM7MKMhCIluuQS2OAGKNHTf98gK6BEtClc6DNCh1RLDXtoEWklofIxvRf6fbecjWqS9/nhbmuUC8MK0kISpVb2RpPpIO17kYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415374; c=relaxed/simple;
	bh=v8fQTf8hIDVv2spdVQcj0yniPhd6/n1JDKVbDQQa+vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKhU1OPwqr52Ue47AgV2TBvMHbx6TUxoVgSJ2lTfioWXs5Vsff+Y1jYwY+VcbU4H8FvK+5HJwhtO0yk3Bf+Q2YcnNu+eLvQmOmCvpq5ClCFGfpYl9tFwGDsknELbNrNRTMEy4uPGsyfkGFogWjFz4ijaN6w0ETH6M7WfjR7HhSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUDqtBzp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUDqtBzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9531F000FF;
	Mon, 14 Sep 2026 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789415372;
	bh=Q9tsfPq/xC4E4Hb+9MJyzyE+WxIjNjK0nuqmNERsk4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FUDqtBzpzR0LEOZEwDqNbmWvdMjy7yPSld+MllLqTrc89rYOETpE0FVoro+iUiwaN
	 UqDYSjXQPJVCsTTFhZYis1xmK7CR1fvqQnhuLhA6HNbdWDnDFPSmIaRQZxks7vWmQP
	 05qoM8zp53LUW4ZyyiXfia8qOgt6ZXJfxD4aot/zIUgrrZYqiMDMgjPBy9BoX/VSH2
	 ja6JC9HcwaYg95n53Yr6PYcfYxsApZ/92xuwsPL9Q6SWgzumRruyztQJcnW5H8AQME
	 V4eRMbi8OtJheG89PViQnFK3eV2N8Cl8lMEBnagxO/pCG0/QCiXorOEPr8AwgVGxaM
	 XXS5kvrgqtjWQ==
Message-ID: <28f71370-1cde-4b67-9201-b3d3c3f2cb85@kernel.org>
Date: Mon, 14 Sep 2026 20:49:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: iris: fix VPU4x encoder line buffer size
 calculations
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
 <5WLpQRqOVwgiU7GZrXEuE_QSd2Yl7KZ2mLQn4GzNXj_CEE9P5vH7ypd4mriRwrShRHCAlVcm8zeM3W2OEAjF9A==@protonmail.internalid>
 <20260914-add_iris_for_maili-v1-4-09df2b54c317@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260914-add_iris_for_maili-v1-4-09df2b54c317@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:00, Wangao Wang wrote:
> size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
> called with width and height swapped, miscalculating VPSS line buffer
> size for non-square resolutions.
> 
> iris_vpu4x_enc_line_size was reading resolutions directly from
> inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
> account for the 90/270-degree rotation case.
> 
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 55996fd0d14c385ee63d2577b3e6d71b51d9e541..c4922a25b4501a851e31fcc85bc13735803be366 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -2059,8 +2059,8 @@ static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
>   	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
>   					      frame_height_coded);
>   	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
> -	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
> -							frame_height_coded);
> +	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_height_coded,
> +							frame_width_coded);

Only this much belongs in this patch - the fix.

> 
>   	return se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
>   		dse_lb_size + size_vpss_lb_enc;
> @@ -2070,9 +2070,8 @@ static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
>   {
>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>   	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
> 
>   	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
>   					 lcu_size, inst->codec);
> 
> --
> 2.43.0
> 

This change should go into its own patch since the original here doesn't 
swap height and width, so if that is a fix, it should go into its own 
fixes patch.

Best practice is to stack your fixes at the start of your series so that 
you can be sure your fixes don't depend on whatever functionality you 
are enabling.

---
bod
