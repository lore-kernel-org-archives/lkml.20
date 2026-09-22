Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FEE54857A;
	Tue, 22 Sep 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083046; cv=none; b=Ifdxxz4ePq9KMHyxXdhNFpzlBtHGuzq/vbrlcHHUU2WOTmvoZaZU7OhwwqlGJuGL4LCQ80ZwLVQF0RybAFZljeoAwgwK7+HL606CCSGUYzddD2atAAxj7lpGnF7Rl2B3wVSY+xCTIh01dFiWmxF5lcHz16KzfoHmIHMW5E9zTUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083046; c=relaxed/simple;
	bh=0/3a0JjW6ylRj0k59AgsVm5HEMziuQJGAhyydVI9VLE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gAGhsW67ZDx4BBT3p9T+20ci0P9AyJYrj0rf5UgXAIFC938YXtbnOQvl4tZZkPZ6/gI1QRFAyg18dXwearnaNlVS/36aFvmPQE3YUv+DuTNF2SmXnvuUf9/6kPhxDdDK+DXR4BURg7yx395juhW2vBzLaKMQ9x4nWbDAVZR495U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZQdp8Gz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZQdp8Gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA3C1F000FF;
	Tue, 22 Sep 2026 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083044;
	bh=xtWicn9O6gT4E2OJnJEip9rrDQNx9KlDp8AU1gBi+3E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=bZQdp8Gzxj4vs7A5Q9S5bsql9UvW3xI9yiDm+73qOy3gn/rSq8/x9j1iAUMNzUhLW
	 K1DCfe8/q3mFQL7AJEw4X2TYRfMeC8aoPYdm2EaQBtrNnqnZQVDiANgHzpbRY/gCsJ
	 WtFRtW6xqBO/hJnsHenhbDYGzauV4XoJDf+Z848VNp8C3IrGnWLGhTyvZYjY2+4+nL
	 C7XN5QQNR3bQjfG0UClzM0yOfxylC7XcaO3PMdC2H1qPDVhRChzgx2fsGyy++HwxQM
	 lJ4IDk65kJ1BX6dSG2vTb4zccV3oWx/MkSjR/3NAWGnAbEINhIgfPvIvqoo1u5O9wK
	 /WgHfhurllPYQ==
Message-ID: <38a64473-87cb-4dcd-b5dc-24550f4d24af@kernel.org>
Date: Tue, 22 Sep 2026 15:17:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v6 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
 <20260915-enc_roi_enable-v6-1-29dd4c8bccff@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260915-enc_roi_enable-v6-1-29dd4c8bccff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Deepa,

On 16/09/2026 00:00, Deepa Guthyappa Madivalara wrote:
> Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
> control type for signed 8-bit values. Add necessary support in
> v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
> v4l2-ctrls-api.

One reason I asked you to split up adding the type and the control is
that this makes it easy to do a 'git grep V4L2_CTRL_TYPE_U8' and compare
that with 'git grep V4L2_CTRL_TYPE_S8' and see if the same number of changes
is made in documentation, headers, and core code.

And I see that S8 support is missing in v4l2_ctrl_type_op_validate() and
check_range(), so that has to be added in a v7.

Regards,

	Hans

> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  .../userspace-api/media/v4l/videodev2.h.rst.exceptions        |  1 +
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |  4 ++++
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |  6 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls-api.c                      |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c                     | 11 +++++++++++
>  include/media/v4l2-ctrls.h                                    |  2 ++
>  include/uapi/linux/videodev2.h                                |  2 ++
>  7 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>  replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -188,6 +188,10 @@ still cause this situation.
>        - ``p_u32``
>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
> +    * - __s8 *
> +      - ``p_s8``
> +      - A pointer to a matrix control of signed 8-bit values. Valid if
> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>      * - __s32 *
>        - ``p_s32``
>        - A pointer to a matrix control of signed 32-bit values. Valid if
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>        - any
>        - An unsigned 32-bit valued control ranging from minimum to maximum
>  	inclusive. The step value indicates the increment between values.
> +    * - ``V4L2_CTRL_TYPE_S8``
> +      - any
> +      - any
> +      - any
> +      - A signed 8-bit valued control ranging from minimum to maximum
> +	inclusive. The step value indicates the increment between values.
>      * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>        - n/a
>        - n/a
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
> index 9caca56478d1a97ccde582a2086e7039411b52ed..b78992e32e21c79b1c70ec673b81759c9ca84206 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>  			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>  		}
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		memset(ptr.p_s8 + from_idx, (u8)value, elems);
> +		break;
>  	default:
>  		for (i = from_idx; i < tot_elems; i++) {
>  			switch (which) {
> @@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>  	case V4L2_CTRL_TYPE_U32:
>  		pr_cont("%u", (unsigned)*ptr.p_u32);
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		pr_cont("%d", *ptr.p_s8);
> +		break;
>  	case V4L2_CTRL_TYPE_AREA:
>  		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>  		break;
> @@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>  		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>  	case V4L2_CTRL_TYPE_U32:
>  		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
> +	case V4L2_CTRL_TYPE_S8:
> +		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
>  
>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  		ptr.p_s32[idx] = !!ptr.p_s32[idx];
> @@ -2037,6 +2045,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  	case V4L2_CTRL_TYPE_U32:
>  		elem_size = sizeof(u32);
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		elem_size = sizeof(s8);
> +		break;
>  	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>  		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>  		break;
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
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
> @@ -61,6 +62,7 @@ struct video_device;
>   * @p_const:			Pointer to a constant compound value.
>   */
>  union v4l2_ctrl_ptr {
> +	s8 *p_s8;
>  	s32 *p_s32;
>  	s64 *p_s64;
>  	u8 *p_u8;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>  		__s64 value64;
>  		char __user *string;
>  		__u8 __user *p_u8;
> +		__s8 __user *p_s8;
>  		__u16 __user *p_u16;
>  		__u32 __user *p_u32;
>  		__s32 __user *p_s32;
> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_U8	     = 0x0100,
>  	V4L2_CTRL_TYPE_U16	     = 0x0101,
>  	V4L2_CTRL_TYPE_U32	     = 0x0102,
> +	V4L2_CTRL_TYPE_S8	     = 0x0103,
>  	V4L2_CTRL_TYPE_AREA          = 0x0106,
>  	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>  
> 

