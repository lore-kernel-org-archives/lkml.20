Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D114F85BC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629920; cv=none; b=L1WjwT0CJQdHeqtSiNL30BXiV8VjPOnh7tfedHBaUKLHVIfwG7R2D+yYwBOr+kHpp2eHRCA+YvWRit/7i7A+27iZU4cKX92Y6iWwG3pwV0eifNcRhcRcBl6NmuclHxjpNADxgkQGfbANCli5r6cc5kuzZa9He512fUVi8VdDR2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629920; c=relaxed/simple;
	bh=5aM9C+gJ/8Ac4OsLJAuT/zfQm8sg7DUAPkylp/niAQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gldghxQcAE/3E4TGatue3CJcaN6lsiPKVgm6CoFh60vJmaA4acIO3oofAjyMuqlDTImTGw2s8Zkt2AFgaYbsTsBqyUjsyywh1bqAZF/bwc/3RDGBITBJ/v5mzGNft20/7EGm57mbPOfzqJWCRt7QzX3GVawN693laedXl0DAsCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aidA454Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLter2hm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aidA454Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLter2hm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SJ8pdE2898450
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YoGqX+0cpdjSnh8H6YA4XIqhYGdMnInVY3nRbCq1HY=; b=aidA454ZK1kgmpX3
	OVn4XoegWNkyzAFx+ZKMvSwPdOw6Dnx6IC1aX8pfM2gU43QBp9g5zI3FxVkCQs6Y
	i7HmFDjKRLGkfoUBBdnVVunYP2JplBbbXf63KMdoKVGZ/OSNctowjf8g5WgL4V2c
	dEkYDkGwzSymRNMGCQvhH5lIs80pHD/sOCQMo55aJHSGXXoNmeeDgr3iOkle28mM
	Dvg1cM0UPW9w9Za5HOe8+roKFOcarswA9kiPtz2l72AVu876v8PHlKItneWUZ2SV
	dECwpk0AD6/awy9RUA8ZB/tUuRRer2qYwiq7c7a+65yBGsqu0pqDPQj1U8ACppiv
	KiXC0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6juqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:11:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34437a03f3fso163367eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790629915; x=1791234715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YoGqX+0cpdjSnh8H6YA4XIqhYGdMnInVY3nRbCq1HY=;
        b=dLter2hmepxeE0WiLcwQJozcoquDSFZZ4XL6JeGmZgKrKgNEymKv7ahQL6XNpKSnfk
         jSZakKjfNihYG+M/sO2kNZfnZHbnvREy9MyN7FkuuT/V0EzYH/4GeGoNWab4/KIl99Nl
         Ee0wF8X55R1fONIdlfljqhPON50ya07oit8FYsPi0pvPhS5K/RdlROtqHc4eE01dZrLy
         1eAHYo7tik8UzuHSmVq5Xu3VaWY2irEheWiP21iN1/G8dx4brH9S9ytg3FpgH7OizUBt
         DJ0M1f9BwT5h335xwOKBWONQKZt1JLuca3Tu13KROvUspOBipU4bCy74vY9B+9e4MdnS
         ZtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629915; x=1791234715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YoGqX+0cpdjSnh8H6YA4XIqhYGdMnInVY3nRbCq1HY=;
        b=gbqmuI9KCUuuPA4CvNcM56sL1wVeJo2FmPeDbiOKi4qq89CdpQ6JMQxQKArt6P6bs2
         uN8tWlQK2nSJQuiWnBs+Pqy9h6LohdZNoVS1ulgug+lVn7asolaKcQQ8rXb28ogcAbZq
         vtLAcscYpB9AaysqAEkJmXlu+OJLCGUuldiNuS5kVLXIRsoTK9u3i5jDvezbvqrMI4Rx
         CtPqeVUzHyjmANLEB6Ofd/YaJJLZQQv+e8ECtssv8EvQfzSF9X1vbXzapARCfyzmwdZG
         Rd3I18FvNELhzHpuL4QK83tcuuIA5Kf+WpGs0Dc3dSn8IWcQKguYTlYPDJH5hUpNAvHF
         XgfA==
X-Forwarded-Encrypted: i=1; AKwUvByTlboJy9Xt17aQnV2X257wcrpuW29uTyuUxlxkenjZZh7j7faGjlBr4oophDZBMMLjjaOBEdImnLb0K2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5k/0jTZSxMR3JaHczEkdo+rFx/NZIRwHjF6S/Nc+eNhFn/l8Q
	3OHU1o9Xl6Z4pN3CUwyd2gAIBt+t1T3xxA7/Ag5DX0glt7/Jvq+IUUJaaZZoHJqjcLusG/fMy7E
	UzQVo6KqXMVNcjpmfMU2jaj/0l9tQWsA4y7Lg/Niolu8haZf5TVROmaH/KpKT6IG7GNQ=
X-Gm-Gg: AYBFou0miHufVb2gQO4njuEVWMD6l0FWq3b0+uwsI9Gb931XWsJx+wydXuSlXL+wpw+
	YOTL5mUxWmLCWagL7hTNhgduFuDIJDkiJRHZcpQIRjdN1fg1McM6BqDd7wWhXqaWWLYa6JNoorB
	qFT6bWyOqbzV+wWcptfjHWtNvX6TFOmd1Ne6S/QxQzoedezZDjUHBX5Fps50jTSJWmu76We9Ln5
	10+6lE1sZ7rzBpO3OGjzgNiNJPmcoJx0LSSrtyzLMNTu0uqxh95a08VsOU/1wwcYM1kEJqfTisC
	1YZps8+spWeb8l1SNBuC8jug0mWx+AMVCMzlkBZx2HST62glQ3AY3z46BySY5AvIQ/skWUiEBmx
	Lz0oJpldmES+Rnqu0nus/vg6vSCU8SxR0shXz9eA+IopdZphfBbBR3g==
X-Received: by 2002:a05:693c:2589:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34273249209mr17368386eec.2.1790629914436;
        Mon, 28 Sep 2026 14:11:54 -0700 (PDT)
X-Received: by 2002:a05:693c:2589:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34273249209mr17368324eec.2.1790629913689;
        Mon, 28 Sep 2026 14:11:53 -0700 (PDT)
Received: from [10.73.195.234] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm49051565eec.9.2026.09.28.14.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:11:53 -0700 (PDT)
Message-ID: <08a3c2f3-9d85-4102-908a-7c60d43d4d8e@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:11:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] media: uapi: Introduce new control for video
 encoder ROI
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-2-6fa7413af23c@oss.qualcomm.com>
 <0235d9d9418c998b6fe18c51db4e7ff308cc2282.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <0235d9d9418c998b6fe18c51db4e7ff308cc2282.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfX3olYcvkRNNxk
 DcoowcSGcZTl3Xhb3WjMmWIWS+KFJfoBqL9Zo/lzrTzeNVh+B9fXJaeu9tI8OUy6GRIWV38bA1S
 E7nuz2aIV3+EXBlL6jXvUtYFtco0RZjdC4+UFOzgvVzZUYPTw9tEkwwI7hF6dtDCy98ITSnKjHu
 UZDz/AzC/IQJIkN9xStiw0DPyw24Tii0YPh97SrVABl1tPVfhzRG5U0IoxrG7DxvmN+1JVp1x5K
 N19jxL+/laTqab2SkpHFUEcXuFOXK/k0vThfJ2WzoTbbynrbObPWl14EVG6loRNdJjj48yS0EH2
 r72wshxPwzYSQDOd+Iy6s3TtWBgSGiVNh7HLl0D0BHjWOTi/udIs6OTHDFZi54Q9OJT5TCrY5G1
 8TGf68QMU6RatNKB6tBbVL0lvuOEcJONeQ+RVX62QA37Yv8dWlm3VXvjR4h35KdI49HPpyEgTg9
 2qlo17lntIQI/sO9sVA==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6abad81b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZKO3Dcv97OeREbnOgOkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfX5is9pWg2n14A
 FEDfYvytW9q4l4fAsGRm/NZqhfccopUBcJtHYxDVMILODneA/dpRMbFImRR39gWu6Z+p5sv9Rdd
 8Txh8iyuvtPHSiJjAEMq1/Q62/+2YeI=
X-Proofpoint-ORIG-GUID: hqfRgKE4_gE7ubKjj7iBITikKkIdJmRQ
X-Proofpoint-GUID: hqfRgKE4_gE7ubKjj7iBITikKkIdJmRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280084


On 9/28/2026 7:32 AM, Nicolas Dufresne wrote:
> Le jeudi 24 septembre 2026 à 17:28 -0700, Deepa Guthyappa Madivalara a écrit :
>> Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
>> video encoder Region of Interest to allow applications to specify
>> different quality levels for specific regions in video frames. Define
>> V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
>> codec from the hardware encoder and set the corresponding ROI MB delta_qp
>> map that adjusts quantization relative to the frame QP's base value.
>>
>> This enables use cases like prioritizing quality for faces in video
>> conferencing or important objects in surveillance footage while reducing
>> bitrate for less critical areas.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 26 ++++++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 +++++++++
>>   include/uapi/linux/v4l2-controls.h                 |  2 ++
>>   4 files changed, 41 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..a02ec20ec18f0e684973964d2de1759ad179b819 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1674,6 +1674,32 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>       Codecs need to always use the specified range, rather then a HW custom range.
>>       Applicable to encoders
>>   
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
>> +    This control is a dynamically sized 1-dimensional array,
>> +    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
>> +    This array control is used to set ROI MB map delta_Qp for the whole frame.
>> +    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
>> +    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
>> +    is configured with delta_Qp in raster order. The valid range for delta_Qp
>> +    is encoder dependent.
>> +    Applicable to encoders.
> Since there is no manue to enable/disable this. Can you define in the spec how
> one should disable this feature ?

The s_ctrl is applicable only to that frame, if there is no s_ctrl for a 
particular frame
from userspace, driver will ignore sending it to the firmware, 
eventually the ROI won't
be set. There is no explicit enable or disable. Is this what you meant? 
I can update the
documentation saying the same.

>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
>> +    A read-only control that reports the MB Size used for the ROI delta_QP map.
>> +    The supported MB Size depends on the encoder codec.
>> +    Only square MBs are supported. The value returned represents the
>> +    width and height of each block in pixels. The ROI delta_QP map provided
>> +    through the ROI control must use the MB Size reported by this control.
>> +    The number of entries in the ROI delta_QP array is determined by the
>> +    frame resolution and the reported MB Size. If frame_width or frame_height
>> +    is not MB Size aligned, they must be ceiled using ceil(frame_width/MB Size)
>> +    ceil(frame_height/MB Size) for calculating the array size.
>> +    For example, for a QCIF frame if reported MB Size is 16,
>> +    the delta_QP array must contain 99 entries, ceil(176/16) * ceil(144/16) = 99.
>> +    For frame resolutions that are not aligned to the MB size, for example
>> +    1920x1080, if the reported MB size is 32, the delta_qp array
>> +    must contain ceil(1920/32) * ceil(1080/32) = 2040 entries.
>> +
>>   .. raw:: latex
>>   
>>       \normalsize
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index c5df0e0a54f81c73975f427957b7c99fd421d5ad..2318a548f16ebc1ec582f829c7945a8998b96708 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -1410,6 +1410,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   			return -EINVAL;
>>   		break;
>>   
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
>> +		break;
>> +
>>   	default:
>>   		return -EINVAL;
>>   	}
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
>>   	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>>   	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
>>   
>>   	/* VPX controls */
>>   	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
>> @@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
>>   		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
>>   		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
>> +		*type = V4L2_CTRL_TYPE_S8;
>> +		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
>> +		break;
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
>> +		*type = V4L2_CTRL_TYPE_U8;
>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +		break;
>>   	default:
>>   		*type = V4L2_CTRL_TYPE_INTEGER;
>>   		break;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..be484156ed35a19229be23ad24fd224cb5a8a0cc 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -941,6 +941,8 @@ enum v4l2_mpeg_video_av1_level {
>>   };
>>   
>>   #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
>>   
>>   /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>   #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
