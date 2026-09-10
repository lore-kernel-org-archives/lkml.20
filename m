Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBB43AB496;
	Thu, 10 Sep 2026 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026556; cv=none; b=d2bkaN6/TVfxXbTtR6nJ7fv0wOgONlg1Ej8J4UJpQEeu69gNEKvKLEa0k0KjKmxOa8cJxV8o+bDhFgpMRRdZs9Gy+zv5scmOpepFpYESil33f0T3ADF2dlXjeVHcoUxQW2W93tIyO1RD2cw+MjH7WeUoNMxLBvwpwp+7P/Vh4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026556; c=relaxed/simple;
	bh=OvQ7ggI/Tg6ELwB0ykIJJxw6p5q4LTuoYeBMGofQOIQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pXNuoEKyw6Rf/x5GB+hQbCBWx1XXchm8EkEqxRWPkOKTaYYi5Nw//HzGZL4//906yGWrr+b6vUI+sHDDDah05oCOUsUeek3mKguwlEm/p5GwhKGN7vveDbME2Ia+hIN2T3UBiBG9RVLg+MIZoV6pRxKgTpSispCbf+XBSzFBmYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYBOGyIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYBOGyIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8DE1F000FF;
	Thu, 10 Sep 2026 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789026545;
	bh=sn6nFkYVcCPkfFaLL5VLW0/SPkPG0ME9zLNq/XqDPG0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=aYBOGyILHItgmKFJMty3As4wua5ohH2WP0D/xJGNJ9YcY6/nA5MJKmEec3ZjPCaD6
	 XBM4MqiEOgbxbXKpp2rHgqOZZD7Otc7kzjVxIxUXh6lz4NgbRFmZbcyZXQbjk34Mat
	 wlqRNSvgcYhImIsDaRMFB3SIfg6NswAh1ib2aq5WqNtb8u7G5zEgZy1bQAKjoE6pas
	 W1LqG4rwWHa5aRmNTdb4bh61562zhz/l/jI7JnKTea6BRwfyA9ixDkN2t3hcQTMyDq
	 q23VQk0GB97Qy39Kn6yRsqLwweSTdOGI4jUFr6ZJy+H/NwEKlhA3zVxpIQblGvJFD/
	 6ON7XqrIzsyfQ==
Message-ID: <eb975daf-9474-4368-814c-6ea12e5f7700@kernel.org>
Date: Thu, 10 Sep 2026 09:49:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 1/5] media: uapi: Introduce new control for video
 encoder ROI
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
 <20260815-enc_roi_enable-v5-1-ded944f0fc7f@oss.qualcomm.com>
 <790e3c11-1ba5-4e2f-a072-4deb4f384c3d@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <790e3c11-1ba5-4e2f-a072-4deb4f384c3d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2026 09:37, Hans Verkuil wrote:
> On 15/08/2026 21:22, Deepa Guthyappa Madivalara wrote:
>> Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
> 
> A small terminology issue: custom -> array
> 
> Custom controls are driver-specific controls. But this adds a standard
> array control. Please check this series for the use of 'custom' and
> replace it with 'array'.
> 
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
>>  .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 19 +++++++++++++++++++
>>  .../media/v4l/videodev2.h.rst.exceptions              |  1 +
>>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    |  4 ++++
>>  .../userspace-api/media/v4l/vidioc-queryctrl.rst      |  6 ++++++
>>  include/media/v4l2-ctrls.h                            |  1 +
>>  include/uapi/linux/v4l2-controls.h                    |  2 ++
>>  include/uapi/linux/videodev2.h                        |  2 ++
>>  7 files changed, 35 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..c16b1c5cd1c02b7f66b5f13433eb039eb615b35e 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>> @@ -1674,6 +1674,25 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>      Codecs need to always use the specified range, rather then a HW custom range.
>>      Applicable to encoders
>>  
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8)``
> 
> __s8 -> __s8 array
> 
> Otherwise it is not clear that this is a compound control containing an array.
> 
>> +    This custom control is used to set ROI MB map delta_Qp for the whole frame.
> 
> Here is another use of 'custom' were 'array' is meant.
> 
>> +    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
>> +    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
>> +    is configured with delta_Qp in raster order. The valid range for delta_Qp
>> +    is encoder dependent.

Add:

    This control is a dynamically sized 1-dimensional array,
    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.

Regards,

	Hans

>> +    Applicable to encoders.
>> +
>> +``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
>> +    A read-only control that reports the MB Size used for the ROI delta_QP map.
>> +    The supported MB Size depends on the encoder codec.
>> +    Only square MBs are supported. The value returned represents the
>> +    width and height of each block in pixels. The ROI delta_QP map provided
>> +    through the ROI control must use the MB Size reported by this control.
>> +    The number of entries in the ROI delta_QP array is determined by the
>> +    frame dimensions and the reported MB Size. For example, for a QCIF frame
>> +    (176x144) if reported MB Size is 16, the delta_QP array must contain
>> +    99 entries (176 x 144 / 16 x 16).
> 
> What happens if the width/height is not nicely dividable by 16? E.g. 1920x1080.
> 
>> +
>>  .. raw:: latex
>>  
>>      \normalsize
>> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>>  replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>>  replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>>  replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>>  replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>>  replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>>  replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -188,6 +188,10 @@ still cause this situation.
>>        - ``p_u32``
>>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
>>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __s8 *
>> +      - ``p_s8``
>> +      - A pointer to a matrix control of signed 8-bit values. Valid if
>> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>>      * - __s32 *
>>        - ``p_s32``
>>        - A pointer to a matrix control of signed 32-bit values. Valid if
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>>        - any
>>        - An unsigned 32-bit valued control ranging from minimum to maximum
>>  	inclusive. The step value indicates the increment between values.
>> +    * - ``V4L2_CTRL_TYPE_S8``
>> +      - any
>> +      - any
>> +      - any
>> +      - A signed 8-bit valued control ranging from minimum to maximum
>> +	inclusive. The step value indicates the increment between values.
>>      * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>>        - n/a
>>        - n/a
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
>>  	s32 *p_s32;
>>  	s64 *p_s64;
>>  	u8 *p_u8;
>> +	s8 *p_s8;
>>  	u16 *p_u16;
>>  	u32 *p_u32;
>>  	char *p_char;
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
>>  };
>>  
>>  #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
>> +#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
>>  
>>  /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..95d8369e0d3d1e434978b9e576e0ef122691c65c 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>>  		__s64 value64;
>>  		char __user *string;
>>  		__u8 __user *p_u8;
>> +		__s8 __user *p_s8;
>>  		__u16 __user *p_u16;
>>  		__u32 __user *p_u32;
>>  		__s32 __user *p_s32;
>> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
>> +	V4L2_CTRL_TYPE_S8		 = 0x0103,
>>  	V4L2_CTRL_TYPE_AREA          = 0x0106,
>>  	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>>  
>>
> 
> Hmm, I see that patch 2/5 adds the v4l2-core changes for the new controls.
> 
> Can you rework patches 1 and 2? It is much easier to review if the first
> patch adds V4L2_CTRL_TYPE_S8 support in both headers, documentation and v4l2-core,
> and the second patch does the same for the new controls.
> 
> Currently the patches mix adding the new type and new controls, and that's actually
> hard to review.
> 
> Regards,
> 
> 	Hans
> 

