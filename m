Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5B26656D;
	Thu,  1 Oct 2026 00:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790815773; cv=none; b=SvsZgbsF1EP3PSzT2ZtqfLOcC+z1w2BoZqfz8ChWAa7lfHnOk8s6+I0+ivjg/lgoVImD5xor88TLhLuDi/N+s5jTm2e9R0BqmwzB5yocXcpJdWRwTfPea8l4TI4l6fUojL3aRcqMYhmznG/x8xvkCUZY8iStzyQNGgnfzSxynqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790815773; c=relaxed/simple;
	bh=Tq67/JdvD00RnAGSM6IDPb5xvFelJzEaXMrgy88CzP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnH9J8PSuaBr8wzQh2vciI9wPKtlCeCf/wTopeA8yG1+l/2ntGBNdiBxvExevy09vpyfyTwEKjLxbIi13rk3SFzz46SWQuidBnyTXyRntSqf2zRgRgRsxUj3CDeMVlnICG4fa3eYEpq6kRcqhPCcfX4MBkZMHuKq0vUgX3Rr4cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEL6AUsA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEL6AUsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EF61F000FF;
	Thu,  1 Oct 2026 00:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790815771;
	bh=dsmAzYwZWv0KlwVz1Z46WG8v+aQCQZ3x5dgAm2eAzwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HEL6AUsAxvDBqPketTl4ohKhQUqlwlxIhRkpQWAW0bp06y2E3sJNg+cxZjRNh0y3Y
	 zsNTsVNm/Hr+Ss1i/hxeCH78WoKA6mWxLK/Dsw+6kNr14SW2TbrJey3DCNM5mSaIDu
	 10dXM9lf+5e1NPpNQfFUszBo97/kSZEoLf9RLaRjS0z/2IiTZl6dNxino8O7R9eqLL
	 SAeTG3F0DVJQ6H8QSXitXNJf1l4+/qTitZvjwkN8RFhu/4amCUgpvO7SiVW3anlsWp
	 X96c82ashbm9q8ETzu9iCNZgSq7wIUUCREV5HpM+dEboGPJ7yloAQEutsHptCOAQ2p
	 2alsZ5P4gmXYg==
Message-ID: <4d594d86-b037-43e4-9c48-de6170d64051@kernel.org>
Date: Thu, 1 Oct 2026 01:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix 64-bit division in
 iris_set_slice_count()
To: Sasha Levin <sashal@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: "kernelci.org bot" <bot@kernelci.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <WGjCcYNrTTl1nX0egc4fFtnjES8VeY1nYXm4v7kHVBNOSkChhctiUs2iU0KupHeUVt5uzgS6b3Re1MNJNK9riQ==@protonmail.internalid>
 <20261001004619.2230849-1-sashal@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261001004619.2230849-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2026 01:46, Sasha Levin wrote:
> 32-bit ARM builds fail at modpost:
> 
>    ERROR: modpost: drivers/media/platform/qcom/iris/qcom-iris.ko:
>    symbol '__aeabi_ldivmod' undefined!
> 
> The maximum average slice size in MAX_BYTES mode is derived from the
> BITRATE capability, whose value is an s64, so both the division by
> the frame rate and the DIV_ROUND_UP() by the number of slices are
> 64-bit divisions. 32-bit ARM has no instruction for these and the
> compiler emits calls to __aeabi_ldivmod(), which the kernel does not
> provide.
> 
> The bitrate is always positive, so use div_u64() for the division by
> the frame rate and DIV_ROUND_UP_ULL() for the rounding. Include
> <linux/math64.h> for div_u64() instead of relying on it being pulled
> in indirectly.
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:4935f1aae20e7f957e60f8fde09c4e6d153c7909
> Fixes: 5f21cd9a4ae4 ("media: iris: add support for multi_slice in iris encoder")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 8c4c47944f22f..4f2633bbb49f8 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
> 
> +#include <linux/math64.h>
>   #include <linux/types.h>
>   #include <media/v4l2-mem2mem.h>
> 
> @@ -1588,8 +1589,9 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
>   		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
>   		if (rc_type != HFI_RC_OFF) {
> -			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
> -							 slice_caps->max_slices_per_frame);
> +			max_avg_slicesize =
> +				DIV_ROUND_UP_ULL(div_u64(inst->fw_caps[BITRATE].value, fps) / 8,
> +						 slice_caps->max_slices_per_frame);
>   		} else {
>   			/*
>   			 * No bitrate target exists under RC_OFF, so approximate a
> --
> 2.53.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
