Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A9445AE3;
	Mon, 14 Sep 2026 19:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414986; cv=none; b=orpM0vqdZRQkUTsO7sMAUmZe+uSRmDzgdd1o/IFut6Ac26oWhsK2dx2iRIy3erRo95GFBYizksIre6SR8Orr8m0RIJlPeT+DShMsrHBC+W1v2QI25g7k0G5c3w3R1VgVeXJ6oXr2SP6L80LfPSXJD35kGJYDlkd06Yussa9NpHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414986; c=relaxed/simple;
	bh=FMBJpoz00RwuJxbTXqmE1QuOwU9xkmDp86nAklx5NMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpsBYhEvlGITTtODessEMDF4VsaFbCH8fHPKr5GUC+SnbMUM6QleXjoZSnAhNvgfAwgtTvLql203s/xHpe0YeGV8qNXdEjPxFaD7rZECBpQFp7G31jd51trxD0I0QFYIlCFLhFYIYWAtsEN67QLqVTckgpO0h9TH0YpRoQEDiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0ymOAxx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0ymOAxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D8A1F000FF;
	Mon, 14 Sep 2026 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789414983;
	bh=/VT0ZtmdBdmcyDLszz+EjXM1NJOqWXzrb3E9ScPzTzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=a0ymOAxxRRxCMKdwX/ju0eBUKZzALkb1j/kGwM1roAzVEkablzvgpbmBL2FU5/e2j
	 s5RABLJHZqYCWyPX0U0zVGndoj/xlX7JsJatd+6r1nE7aEJVd39MF/FsqCiyBSqjbZ
	 k6/Lea7L8YxUkRHZEYSXmev195zOBp/AaJJ1ajg5n73VBFdPk2Rz1j1n6sgegvsVKd
	 HGlcb+TJ/EtWnrH0MjRWo2o9nqNfd1Sk5nR8TPSRPMwT6uLvx51GfhfMtrP6mUsuE5
	 /rcn09wPTmbL3+7V95hMKs0nID+Mut1usn3UCfmE3fFTiKiIZLcKrvvhBW0t/wqWls
	 OzJwqKFqdpaYQ==
Message-ID: <d8c1d02b-d03f-4b3b-914d-a0849936f24d@kernel.org>
Date: Mon, 14 Sep 2026 20:42:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: iris: add AV1 decode buffer size support for
 vpu4x
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
 <aGtbqVizOvw2VPXXiZjw3_w4n5h4O_4wkkJfwPzsgvQDBxysF1c_3DMmtB_LQHSoYG_qPxZl0wtTZA2ysCC_mg==@protonmail.internalid>
 <20260914-add_iris_for_maili-v1-3-09df2b54c317@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 xsFNBGRJNSgBEADD7Vm2ZFa+v+JGJ2QYTJqQAkqis/uOHkhdFNXqpBarVBd47QU/DMNU5Rxg
 jedMQEmHoeDbJ6UOpjbrUQ63c5sgG1JbroHJJctwsEI75OOlekMuebEbjIJBLfgENGwPBMHv
 piv5TgCWr0VgYaXfp2eh2LINFywzqj823HiDPibQAXDrjzvF1ogksi/6cQZs8d4if8YQkLOr
 YISFouG+eR0nN1I7mUfIddXOWu6lJeTyqbWVurv58k2ekIXKaOC9ixLHFbcfYV0hOgRaTwQC
 B8CYF9nfqZla19iItfsN9QxN+ZdQjcRoYipp6HPCMfJlKH7GfaFcW93LKc4DKJ2lVL+pg/OQ
 lythZbjRPY492NG9kZ65aYstCs90uhMUEVVPuGUw7wBEku+6IEwZfrbMVKeWzLlPyM4Hv9hM
 8ktxSmxWsPTPqpBC8eyeAQLalMELAyVcZlkaCtEcbj7w4l/JkYz+4l37obG8ZD+B34udBUUz
 MsAJ8foDFrBh2MOFA3hxD6G90D23mmWsri7pnKA2tZs92aQX7Ee+FbCyg6g5ln62Sq83ZDbf
 53DdBs55EVpBadeInWmXhzCHPQx06H+CwTEjShTYIaMmBfrewvYUDKvFTC5iKQhAEUgt6i94
 JsbG7NoeqcxkUMcBOEUQ3uCQG1D70ugspgXc0wd3Rimiq6535wARAQABzSFCcnlhbiBPJ0Rv
 bm9naHVlIDxib2RAa2VybmVsLm9yZz7CwZEEEwEIADsWIQTmk/sqq6Nt4Rerb7QicTuzoY3I
 OgUCZ+R+mwIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAicTuzoY3IOimUD/94
 BwVEJX31JRe2sxbB/e1w2p8x1bxvTw5AeIzpV3ox7coJg1bSU2mnGuj1V4o0Yxf/3zmcJzCN
 VfVjwRF8Ii3GnC7uUXk2t+87piQfKTyJAYQABhZUKgoVJbjJq/S+C3XCKIyBA+EiezoUsgsA
 jTzwU+FzV7zVWIXFPJNtBERLwboE9w9U3KjAExOa1kSY8eLrsg6kOwlOHWy5UsQqYOjrS96M
 mzm2xuc1+RCjrndAyYhCnrOKvJ67HsPnBeJCjw7ImGD/U1GchwYbX8o3DO3JNHm3qfC86ZqX
 2sCouENg4OzgPTtLKUrueM6xsu6KMM7gj17vxsiR3KQEoJnnMB8D1xtBofN3mFZE0wD9M24m
 8yGunZbtntMCUHzIrlJgAPwKWKuGOYtA8UgMTFkccnUJtQrg9KotKtEF/FuftG9zLG9XEkt4
 5ZdNgbSoLWgelu3T47mbOJ8LHhiLaCWP7yrovtVAvLUQ1BsiA42u8ECrFCFvQj9nrejE/ICv
 kP+uqcKtdDvP9HrIGycF1WZyfZLp0RvopKW92FLvI4I1QFWJ+wenk6+LGyJ5bzlrWzevjxmf
 nHcXE6sJBHrE7eijlbbImDAi3uLYN8Nd9Dm11IDAy4GAIQxSiQn0yblDhPiyGtchy80EVkCm
 g9k17Wol+2E2mC4DKgVdCkyUtTRSLgsJCs7BTQRkSTUoARAAuTnmWHBS6izRcEE93ajpzI7h
 dgQO4U3IRvOEsvIKR5NGcNEs0ngGebwsZ/lVULjN4vYU0LleqVhPBidNXUoZCN3A0F0Z2Ov8
 NZdef+2EhQPBVWxFO7JBzhe8Z3ALj+wFtlg8akJjBzU56azW/iJzAobqHVrudzKoO2b1/CMg
 VbiAQ+RXjgfN5kY/HqYDU7mw+hXuUV9PbtX1L8xqQQac95oM9rHzKHHpiVwxTeJnGQsa+THi
 Kze+YET3rCoGHMvOQEJhdrucTv5FpAakKdkOFNel9FFckLRKEuWgCzhpFsjQ7xbirQgFUxG9
 vlk1+q4hMRGNyEqoD6svYEeqbiUSd0oPUJeioiC3rNMRCNHLVrfZ2J6SCPkxfda08uzSdDQU
 1/YPjOh8ZtQDMu7WctZ3XO288Z1gyBR49V7fbFs2w4sQxG+h/enlxqP7fdw1mjUlZjU5huCJ
 ielS0oEaIpmUpkugli7x4WhwLnhK2EbSoz7nLBC0y+ALUOdMlz/Y1l9xRt+bkDhpmf4O4IcI
 MxgZ0QMLq8rHDkGaEbsgZZHQPS58T0XE3IP30Q9SNxsruCMXtd2hYtBssf/wohc6JVsTtMg2
 VYTPDPIFNZFSXupEJB7jlqpDWJ8ooJfJRLBatbjT5+mVQaMYB7Hs/t+zWYWaJKHyc8O6WLEC
 NUV5Tdt5EkkAEQEAAcLBdgQYAQoAIBYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJkSTUoAhsM
 AAoJECJxO7Ohjcg6LuIQALnXt36OUuK43wqw6UYt0cnN6EbUqJHApAF5eNFn0jCCB2XELjSz
 JKJwuNAweowBdabiBniJ+501WIW+ewEsz1uby5fUQjZuCEsIkuaIluyfUFPb73qrQyAGuusd
 7teA4WT+/jUku9g7lX5sVoRCrKQPkd16f6Bzfztyqyjcn43/X5yQI+wlboQ6HuKe/3I3yiOx
 OgmCHzOawpC9PvhEcKj79RLM3Zz5Ts5AuHpRX70Jz8Be76LwVFLp5Msx3S24ZTU1lBo2uiJ3
 xSkay2lTpyVWRPx9vgcwzxGguOPJQJwsQeLb7wpoJMPpD3ERoaRii7Q7hvmxklpZjhKYWB3d
 t6nQ497Ek9loCrp3MIjRCSDN5xEGffiHks9yTeGMUQwO4tX8RE04uOJPkUY7uCFzFqN6/qey
 X3oFfPgkULMdiHofPAL1OskZSTzGPSfTYRE46NCJw8yoZBQ/oOyWeqaUQbK0wmW/g81wm8p7
 LKSGEglMpiX07M1AotgvylN5C8fjbouoK+/RAMsXkk8jba6rPfuuXPaDjCyyKn6zSVHETnHW
 3AJbgVY50T8STpnxayBQvWbCvu+6NOEjXCbyaOJig+5l0zlGN9XHjdANXC5HnwmyaGRL9YDq
 Jh2nVXVJDincOdQRdKcJjYLqaOAoWrYWSDi1iZGspHBTDrnOvfMQzzHY
In-Reply-To: <20260914-add_iris_for_maili-v1-3-09df2b54c317@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:00, Wangao Wang wrote:
> Add necessary buffer size calculation to support AV1 decode for vpu4x
> 
> - wire AV1 into iris_vpu4x_dec_line_size() via hfi_buffer_line_av1d()
> - add hfi_vpu4x_buffer_persist_av1d() for the vpu4x's persist buffer
>    size calculation
> - add BUF_PARTIAL to the vpu4x decoder dispatch table, which AV1D
>    requires
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 35 ++++++++++++++++++++--
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>   2 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index faebb54728660cc621f8822dabf2e44ce8c55c58..55996fd0d14c385ee63d2577b3e6d71b51d9e541 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1833,6 +1833,8 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>   	else if (inst->codec == V4L2_PIX_FMT_VP9)
>   		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
>   						  num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_AV1)
> +		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
> 
>   	return 0;
>   }
> @@ -1856,14 +1858,40 @@ static u32 hfi_vpu4x_buffer_persist_vp9d(void)
>   		HDR10_HIST_EXTRADATA_SIZE;
>   }
> 
> +static u32 hfi_vpu4x_buffer_persist_av1d(u32 max_width, u32 max_height,
> +					 u32 total_ref_count, u32 rpu_enabled)
> +{
> +	u32 comv_size, size;
> +
> +	comv_size =  hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);

> +	size = (SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
> +	AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP) +
> +	AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
> +	2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
> +	SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF) +
> +	rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;

Ah come on.

A routine, a macro can't accept something like that. You have two 
variables and a ton of constants.

Plus the logic that gives you this clause may make sense to you but, I 
don't see how.

For some of these defines - it looks like they pertain to headers, 
footers, offsets etc they can be reduced down to some sort of packet 
header type thing.

I've asked for this type of reduction of clause complexity before.

Please take heed.

> +
> +	return ALIGN(size, DMA_ALIGNMENT);
> +}
> +
>   static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
>   {
> -	if (inst->codec == V4L2_PIX_FMT_H264)
> +	struct platform_inst_caps *caps;
> +
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
>   		return hfi_buffer_persist_h264d();
> -	else if (inst->codec == V4L2_PIX_FMT_HEVC)
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
>   		return hfi_vpu4x_buffer_persist_h265d(0);
> -	else if (inst->codec == V4L2_PIX_FMT_VP9)
> +	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
>   		return hfi_vpu4x_buffer_persist_vp9d();
> +	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
> +		caps = inst->core->iris_platform_data->inst_caps;
> +		if (inst->fw_caps[DRAP].value)
> +			return hfi_vpu4x_buffer_persist_av1d(caps->max_frame_width,
> +			caps->max_frame_height, 16, 0);
> +		else
> +			return hfi_vpu4x_buffer_persist_av1d(0, 0, 0, 0);
> +	}
> 
>   	return 0;
>   }
> @@ -2163,6 +2191,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
>   		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
>   		{BUF_DPB,         iris_vpu_dec_dpb_size         },
>   		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
> +		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
>   	};
> 
>   	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..c7020931a642f0484b6f84af7ab51242e1845458 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -116,6 +116,7 @@ struct iris_inst;
>   #define SIZE_AV1D_TILE_OFFSET     65536
>   #define SIZE_AV1D_QM              3328
>   #define SIZE_AV1D_PROB_TABLE      22784
> +#define SIZE_AV1D_ARP             9728
> 
>   #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
>   #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
> 
> --
> 2.43.0
> 

