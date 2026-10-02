Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58F405F7;
	Fri,  2 Oct 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931150; cv=none; b=QQdlW8kJbjN+nMDyg9OgdtkL0ME+oNifr8kSPaM8a9y/0tPi6LrpuKmbZ/wmmmGf+/aZGZoN9zDh0j2zN3W2zzllFQsc15QeWqZp+4FNUWK/bnCDNnoXhTkhzLb4hkCx6iSe+WZk1MurtDOGn62bttCtcekN9Ln7Mbk03ueTL6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931150; c=relaxed/simple;
	bh=SqHlElyVodRO1yNJr7r/TWEQrzWl+RMdAYs5HfP78kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGywFHMK7OnIZ5mdaGdf2swC9w7LS5PRFwFzV1bHpYjSCOjP43wvpbUrizrE1gDFjL0Yif9DiXS3a2cUVSdNkjv6VwjT6s9ziNhLW/9hUb87kgefchmCPMIilZDoP+cuMMPkHY/dZGpMgugHZ59+M2rpS7H2mCrDWY7uy+sQD6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZHHCSdK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZHHCSdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8BA1F000FF;
	Fri,  2 Oct 2026 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790931149;
	bh=U0WCfxPcUdYZFOPrQcWDaJAzR9K8was1K1PhmxwGAAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JZHHCSdKGBEGh4A/7PARPnCUI2DqXgPVSBaBEJjVno7ZlwDZ5SnL2l3OWsQoMVDCO
	 jYufIc8MqCZb3H7hAjVwGpujyQM96DvG7e37BsuiqpyGHlxvmuWX3iNTCqBdBi+KkX
	 5N0S/5n8soiVXwmgx7nTRNGqCjBdrilFikB9xqcb9apcapvS0GUkD+GQx5DZjoYPXm
	 yL1dU/DmfAYT7hGRjnJNDM6eF7B8ZDgZ0nx9LmHknBYrY5G37MPXNQISKZRXsmCZv6
	 uPUvlEru2foFk5jMu6mx86CKwh4vmyVqwgNeAxOkOD487h1+RM4pvdnnXB/tCgzWuy
	 23HF9CwCsAi6g==
Message-ID: <43dd9c03-39df-4807-922e-41ca9a492f16@kernel.org>
Date: Fri, 2 Oct 2026 09:52:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix 64-bit division in
 iris_set_slice_count()
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <AgJq_ESuBnuRTD-nBYJ68Y7_6aBNuPB2wIzsm4CsQ7fkkkz1ZwjSkUsF8qior3pVbYSS26UV9MGkVBy0Nfu0cA==@protonmail.internalid>
 <20261002-iris-fix-divdi3-v1-1-b2284d7fd77b@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261002-iris-fix-divdi3-v1-1-b2284d7fd77b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2026 08:44, Sachin Kumar Garg wrote:
> inst->fw_caps[BITRATE].value is an s64, so dividing it by the frame
> rate is a 64-bit division. On 32-bit architectures the compiler turns
> this into a call to the libgcc helper __divdi3, which the kernel does
> not provide, so the module fails to link.
> 
> The bitrate always fits in a u32, so copy it into a u32 local before
> dividing, as iris_set_peak_bitrate() already does.
> 
> Fixes: 9abcab03dbf8 ("media: iris: add support for multi_slice in iris encoder")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610020426.oUzBZ3mH-lkp@intel.com/
> 
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
> The original commit is 5f21cd9a4ae4 in next-20261001 and is
> 9abcab03dbf8 in the current venus-iris-next branch.
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 8c4c47944f22..06d99b18310b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1548,6 +1548,7 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
>   	u32 max_width, max_height, min_width, min_height;
>   	u32 slice_mode = inst->fw_caps[cap_id].value;
> +	u32 bitrate = inst->fw_caps[BITRATE].value;
>   	u32 max_avg_slicesize, hfi_value, hfi_id;
>   	u32 rc_type = inst->hfi_rc_type;
>   	u32 fps = inst->frame_rate;
> @@ -1588,7 +1589,7 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
>   		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
>   		if (rc_type != HFI_RC_OFF) {
> -			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
> +			max_avg_slicesize = DIV_ROUND_UP((bitrate / fps) / 8,
>   							 slice_caps->max_slices_per_frame);
>   		} else {
>   			/*
> 
> ---
> base-commit: 9abcab03dbf81439e18d09f1f3869bc39290ce4d
> change-id: 20261002-iris-fix-divdi3-44b1974118d8
> 
> Best regards,
> --
> Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> 

20261001004619.2230849-1-sashal@kernel.org

Already queued.

---
bod
