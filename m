Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C233B975;
	Thu, 10 Sep 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026572; cv=none; b=Sjd8dt9Tu09RQlApk0tYmAvzwtra172s5jYMs/eKrfsrHWEfZVvc8WbJt04fGnZkEAJH2clFygLBVpYIbLmZYnK4eUPDsl889i8YhTgd1JsT18Sr0KQ60MdFCyB3X4OUIxSWUwGljXSMoxOXMYmNCto132dC4OtbfP4GDh7maqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026572; c=relaxed/simple;
	bh=MiSnufNVEvH4ApBGXkBlEdbx6Rp46M+uIptD4jUyyYY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dYW8wLollt4zMnrPQS2uUfgtfj8ZM3sc0v6/qcJ/u704QscxrL/0XZml32qq4Wi47yUvLNK4ehCQ37tpfZsr1sydDw6Pv9UJe+ct3OnGq1AwL583GLlbtdpIuhSod5+hJc1zqF/YsoVrYOIsA+OZMDGoMvOuBy9XFYAxZz8m7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5CJrKBc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5CJrKBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE961F000FF;
	Thu, 10 Sep 2026 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789026570;
	bh=kv2kqfqZeeIYq8cX50TYZbSNuAOAnCdazBGTUePN3pI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=N5CJrKBcuw9ZlWHk6ws47wP3eerx9XlAF2kzqC5dUltgzRHAKVAx/mQM7mWXjhHt4
	 hKJFS1O6Dg+XeTKmvB2Ow9dNW17jGz9Q8DdsC+x455Peba5/wPusXZwhBcG/WVx4z9
	 OIlZGAjYEKA4P1YhikD5ASJuvo4EiYRf7EVHb+bq3O6i99eFdAuFB0YkeTbOCGt1AP
	 SmN730Dlw7S0b6xUMwuUdGuQHxzNi7oUdrox1pCZabOksdAc6lxn8FqZeswNGECXcW
	 AziStP4ZIACkQKdWqVvzZjBUa6vvSIjZ0G8dxRBbXUqPSVfZsxICpOR78Z9K84A6w9
	 z/5VUm4Infzwg==
Message-ID: <98399307-338b-4a16-9ac3-2a342c12b318@kernel.org>
Date: Thu, 10 Sep 2026 09:49:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 2/5] media: v4l2-core: Add support for video encoder
 ROI control
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
 <20260815-enc_roi_enable-v5-2-ded944f0fc7f@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260815-enc_roi_enable-v5-2-ded944f0fc7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2026 21:22, Deepa Guthyappa Madivalara wrote:
> Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
> and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.

See my comment at the end of patch 1/5: this split should be done differently,
the first patch adds V4L2_CTRL_TYPE_S8 support, the second adds support for
the new controls.

> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 ++++++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++++
>  include/media/v4l2-ctrls.h                |  3 ++-
>  4 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>  	case V4L2_CTRL_TYPE_U8:
>  	case V4L2_CTRL_TYPE_U16:
>  	case V4L2_CTRL_TYPE_U32:
> +	case V4L2_CTRL_TYPE_S8:
>  		if (ctrl->is_array)
>  			return -EINVAL;
>  		ret = check_range(ctrl->type, min, max, step, def);
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 5b8a594fb9e24e16128c9c763a3b1dd311fad2ba..db6577070ebd2eb6a60599b3b2394fe128236705 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -290,6 +290,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>  			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>  		}
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		if (value) {
> +			for (i = from_idx; i < tot_elems; i++)
> +				ptr.p_s8[i] = value;
> +		} else {
> +			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));

It's a single byte, so you can just do memset with 'value'. Just cast value to u8.

> +		}
> +		break;
>  	default:
>  		for (i = from_idx; i < tot_elems; i++) {
>  			switch (which) {
> @@ -370,6 +378,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_U32:
>  		pr_cont("%u", (unsigned)*ptr.p_u32);
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		pr_cont("%d", *ptr.p_s8);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>  		break;
> @@ -1397,6 +1408,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
>  
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1410,6 +1423,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>  	size_t len;
>  	u64 offset;
>  	s64 val;
> +	s32 tmp;
>  
>  	switch ((u32)ctrl->type) {
>  	case V4L2_CTRL_TYPE_INTEGER:
> @@ -1435,7 +1449,11 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>  		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>  	case V4L2_CTRL_TYPE_U32:
>  		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
> -
> +	case V4L2_CTRL_TYPE_S8:
> +		tmp = ptr.p_s8[idx];
> +		ROUND_TO_RANGE(tmp, s32, ctrl);
> +		ptr.p_s8[idx] = (s8)tmp;

'ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl)' should work just fine. No need for 'tmp'.
The 'u8' type is used for an offset variable inside the macro that is always >= 0.

> +		return 0;

Add back the newline you removed above. It separates the 'integer' types from the
boolean type.

>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>  		return 0;
> @@ -2030,6 +2048,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_U32:
>  		elem_size = sizeof(u32);
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		elem_size = sizeof(s8);
> +		break;
>  	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>  		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>  		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
>  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
>  
>  	/* VPX controls */
>  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
> @@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>  		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		*type = V4L2_CTRL_TYPE_S8;
> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
> +		*type = V4L2_CTRL_TYPE_U8;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index a1806ddbc797efa52e83cd3f685ef70d5b5483d2..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -27,6 +27,7 @@ struct video_device;
>  
>  /**
>   * union v4l2_ctrl_ptr - A pointer to a control value.
> + * @p_s8:			Pointer to a 8-bit signed value.
>   * @p_s32:			Pointer to a 32-bit signed value.
>   * @p_s64:			Pointer to a 64-bit signed value.
>   * @p_u8:			Pointer to a 8-bit unsigned value.
> @@ -61,10 +62,10 @@ struct video_device;
>   * @p_const:			Pointer to a constant compound value.
>   */
>  union v4l2_ctrl_ptr {
> +	s8 *p_s8;
>  	s32 *p_s32;
>  	s64 *p_s64;
>  	u8 *p_u8;
> -	s8 *p_s8;
>  	u16 *p_u16;
>  	u32 *p_u32;
>  	char *p_char;
> 

Regards,

	Hans
