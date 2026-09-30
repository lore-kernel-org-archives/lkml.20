Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E8E424D5A;
	Wed, 30 Sep 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752543; cv=none; b=qRquQuRoMLxrjeJBVwNbo7nS44h1JElg5wh92VRM/O8H4Fr6tSV2LoNDvm7GMbbx6LVDKbxP34IVt88M3wQGnZrpFOc0gVSy+VagIIwfLj53XhMKQxDy61913bMKj8XW/F3uNT/FykUphkqnVaAamEiPTlBxz2h/LN7syfc3CeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752543; c=relaxed/simple;
	bh=/zbd2CWO3RSxjqb6v7ycrTNDsHH07c6L/WtYoukb9go=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ISlU7M1i6bHSPGKptegaDf+r5Ny1FM8bkbItp0C6gRGcLRabCc0zt+ABa+vq+Ge6b6psFniqsBf5Y1Z/XkEWzXgOTfnZ3dDIJx8huQyh4kKWLP/6OePv+BrNfGmvdNKtFzmEyBhVoGe6PUpICJb3/3slw/i05MtZJjYyjSGHwPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aevDQtP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aevDQtP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EDB1F0089B;
	Wed, 30 Sep 2026 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790752534;
	bh=+TOL9YwZG4QYKTdYJaaobdCp0b1YWYmYs/74hMt7dS0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=aevDQtP8q03HMN1BL4kicKC/rRxyZf1uoEFQdjQ18TleVyFeM+cUEEax1KnAdcEEL
	 Fve2Q3muLOrirrR2OPTdhUWb8qsX3VoPmS+H6lMRTfZrX+LY262gjjIaAOycpBxLNJ
	 +fU4sqtZ1KPols20KJB9MbLPTf1VjqjCVDL9FLfjcOjVR0CLV12Wug3RaUwa0bqEdD
	 Yr1wb4Zdfk45HKvTLY7fwlFqkthG7TLNlljPfvd86jTsEHPbaNCn4ps6jS3fhjRXlY
	 QqqAgoFvJurhkLsqz5+qUboRmdQBcTfwwqOxcxwJF05W/Kd4iFqg/rwjH+y64LzGE7
	 AUdfxO4mbgGcQ==
Message-ID: <1353b159-24ef-43e8-ab44-94346990aeeb@kernel.org>
Date: Wed, 30 Sep 2026 09:15:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 2/5] media: uapi: Introduce new control for video
 encoder ROI
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-2-6fa7413af23c@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260924-enc_roi_enable-v7-2-6fa7413af23c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2026 02:28, Deepa Guthyappa Madivalara wrote:
> Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
> video encoder Region of Interest to allow applications to specify
> different quality levels for specific regions in video frames. Define
> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
> codec from the hardware encoder and set the corresponding ROI MB delta_qp
> map that adjusts quantization relative to the frame QP's base value.
> 
> This enables use cases like prioritizing quality for faces in video
> conferencing or important objects in surveillance footage while reducing
> bitrate for less critical areas.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 26 ++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 +++++++++
>  include/uapi/linux/v4l2-controls.h                 |  2 ++
>  4 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..a02ec20ec18f0e684973964d2de1759ad179b819 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1674,6 +1674,32 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      Codecs need to always use the specified range, rather then a HW custom range.
>      Applicable to encoders
>  
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
> +    This control is a dynamically sized 1-dimensional array,
> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
> +    This array control is used to set ROI MB map delta_Qp for the whole frame.
> +    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
> +    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
> +    is configured with delta_Qp in raster order. The valid range for delta_Qp
> +    is encoder dependent.
> +    Applicable to encoders.
> +
> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
> +    A read-only control that reports the MB Size used for the ROI delta_QP map.
> +    The supported MB Size depends on the encoder codec.
> +    Only square MBs are supported. The value returned represents the
> +    width and height of each block in pixels. The ROI delta_QP map provided
> +    through the ROI control must use the MB Size reported by this control.
> +    The number of entries in the ROI delta_QP array is determined by the
> +    frame resolution and the reported MB Size. If frame_width or frame_height
> +    is not MB Size aligned, they must be ceiled using ceil(frame_width/MB Size)
> +    ceil(frame_height/MB Size) for calculating the array size.
> +    For example, for a QCIF frame if reported MB Size is 16,
> +    the delta_QP array must contain 99 entries, ceil(176/16) * ceil(144/16) = 99.
> +    For frame resolutions that are not aligned to the MB size, for example
> +    1920x1080, if the reported MB size is 32, the delta_qp array
> +    must contain ceil(1920/32) * ceil(1080/32) = 2040 entries.
> +
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index c5df0e0a54f81c73975f427957b7c99fd421d5ad..2318a548f16ebc1ec582f829c7945a8998b96708 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1410,6 +1410,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  			return -EINVAL;
>  		break;
>  
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
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
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..be484156ed35a19229be23ad24fd224cb5a8a0cc 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -941,6 +941,8 @@ enum v4l2_mpeg_video_av1_level {
>  };
>  
>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
>  
>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
> 

