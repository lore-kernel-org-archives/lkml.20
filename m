Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7543B0AC6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761998; cv=none; b=Iv6cvnv9iciwBKa2CkdXBwKjR9UXuTGTe3LFaA4uTG0j1Y3aCsaKA+FxxdCpxBdxmXtvUWuStNZnzMet7Q1YD4wVuxvqMMIA3L9Gx/7c0NYblm3GeDrEROE7C4fw4u8JyFBOQJnijOxbO+2gxTkdI24uBEG8uoN87nnj133LuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761998; c=relaxed/simple;
	bh=+mv1KAcFZbwD3cm08xkzGGBTGLGR/Dc8WFkhyvwduXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSgMsJ+81F3/XdoUwl+M5mbLHLrIFN7BinbTBn71FXr0hVMqeW1IMsyHBFkQ8I2Qf+/+PXRDWJKzI9q0ds92YjQWumbNnI7TrNPu335NQgdJWMu5P1dQ3x8+4E+GHvyGkCkKiQT4twdmdDFhNWS1DIV8Ex0bXmez/bcNqiIbsK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc2b/ArL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kblj13Ut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc2b/ArL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kblj13Ut"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dRcN2666884
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KoIZwhTJhIZAlpg3uBh0jGdeS9VkhuQy/HxfJPsZvvI=; b=bc2b/ArL73mD5+9e
	AAyWLY4Bu6JvyaKvf6hX2jHCu+MhEwIs8oVrA+PKWx1n8oPEGCsqFN7SorWyE3qP
	38s/Q4dQGnnjmJjHE10hphjvv+s24vQrE6MlHcKMowoLrCQgS5w54i1pzAQbrLe/
	jsLPoZckkwGl/Bpe3Y43gbRSbAA8FyypodBvAA835HTwicg+x7pU/+uwm8e4P7Kx
	KYtLsnfU1/tQQi63gX2SMkRnZQ4X+WPceytIoyk2tQYEELMjZ0YYh6I1dN0pdoOb
	yD3iXX8dA3rqM/AmSW3bGAfBTj5a8vKtxnqrWK7tnI9q12pouoRKfaWRcdYjkkmq
	i6Ndlg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27gnqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:53:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so6984988eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790761995; x=1791366795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KoIZwhTJhIZAlpg3uBh0jGdeS9VkhuQy/HxfJPsZvvI=;
        b=Kblj13UtJghTi/v6pkS51RTz2P45j56P4eqOrlV7Amt4sXiMWvUMgbr/XX8WZsah8h
         g8+E2BuHSNdaLtxpchQ8mDspEmQ1zsmcjbVjddwrTYTJVcaePoq/ZSAHSPu9RxufbKLu
         2jiCa20rc8Jn2z6UW/SyzHTb7+eqIwr4JtxtDlMZSXqGDoqLQWUcTAtC79qgF3bPZQ9z
         lrAvbbx1sBPnRSVV++Hbj3XqDEFVe30wAFeD0nIx5/1uwirxIAudfwpGLFMDrVJMRSdm
         tG/us4rZke7YwYImrMASNdK1z2P6CtBmRWieJST2ueLJF//aQyCYkf5x4Jf1OqKTerEs
         r5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761995; x=1791366795;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KoIZwhTJhIZAlpg3uBh0jGdeS9VkhuQy/HxfJPsZvvI=;
        b=PZOjZqHL3DQzaVW8ApdD2O6/rkr1TosUfWjatR0yhbJyLqhVWQSgOjb+9P9ycg95pS
         eUUrTrH9NrJt2JGaniQUggag/Wx8Rd7TLsQIaGBkYrfiQXw7YF7NPstL/rWgNqVW74NL
         dppaHtikssNSv22QEv4Yy7vYAHcwfgl5kcx68tffPMv9/u0ba5LDbP2/kHfChqvQBx0M
         rUVrVRY2Q1jt6aOsqBo6Cuj4FEaPk4xERr4OFN+ZzTDpRD1EbHBjlmB3eUK62LhJvBQG
         ATfo94CgB3RXncKeJGgv3+fRb+Jf8I3AEMGPHt201iHW+myOtNZMI/DAqAbjsy+p69Ux
         xvgg==
X-Forwarded-Encrypted: i=1; AKwUvBxJO0WWjCnlZO2Xl03qiwuof3LTSEwGSlL5LCxgaq5KeWgVYZJgScLGF6bD5mplh+g9ZrBRCVw3aSuUbhw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB35bCQwPf5rFZnCnT3Z1BcnBw5mgZv1FKeHwLk78XMwbE1OWe
	3wnrxpqZ9NuTKa23JgL/swQ7BB3N+YAVkilUy4McAztk7rtC1zHSILyDzXmuWfHIpkyUFPmNLeG
	X5tSLElIGHRlkqj3F/9OxTfI6qMGd4xThoBvjU+d4foHn+ExX6OkAnCuwQsPn09B6cfE=
X-Gm-Gg: AYBFou2QSAOmoCL0YSNV5SZRcnzwlsAuyVwcA9y9k4i9XD1vgkrC8OiOlR9huuv/86+
	Pp4irFB0Z4apzamTqk1F55MK8Y59rdQrMhLqcFRBxBJ+MddsOgQN0tDyBMpPwkc8lLdNlpWAD8c
	NrF/AUZPco1sfElicaXyXvahQul5tJO/HB5ueF9CX6qdeOQ2It/CuDwl8Wbl32IQe4mFoo4wVSp
	CiBKRDcJdUQOZloP/6Mi2IIGxEHLBGaBPgg8MxLdHUEohWmeWqYutfR8XsIY2m7O6pVqd5IJ9gf
	w3f47y0i5Gclh3qi2aM0FMFSRqvASTIQmDw5YsaCK1tjP0uNG9nd4o8BQDNWVA4CsbRaN4f146J
	lFKowLaV1+zalxr9vs3j4kp9SVBv86w0=
X-Received: by 2002:a05:7301:46a6:b0:33c:3f3:cb9e with SMTP id 5a478bee46e88-34cdbed5aafmr1297304eec.16.1790761994439;
        Wed, 30 Sep 2026 02:53:14 -0700 (PDT)
X-Received: by 2002:a05:7301:46a6:b0:33c:3f3:cb9e with SMTP id 5a478bee46e88-34cdbed5aafmr1297269eec.16.1790761993819;
        Wed, 30 Sep 2026 02:53:13 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a63ac9sm3256973eec.10.2026.09.30.02.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:53:12 -0700 (PDT)
Message-ID: <5448c02a-3238-f658-43c6-397db2878519@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 15:23:07 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-1-6fa7413af23c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260924-enc_roi_enable-v7-1-6fa7413af23c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX3wZ81efdFFqs
 /Kpyf+7GkKHnRZd4oIFR0gMdypYKI8Qy3PZvqheHoCc8NhC+MRU7ybDbVF75F+63Bcx/DPnWivN
 zW301BiyCLR+YlKzoT4Qe5GNGloY7ys=
X-Proofpoint-GUID: BcPehJckkDz7q7IlG8vckld0AhBeYJgC
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abcdc0b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zKU2OUPzHw6Z5M7UqCoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOSBTYWx0ZWRfX5oL8eLlRrI2S
 qL5BPi0o8gL46VL7DfAGnbgKPfIK4+lHzXp5Jo9E3bFDRtsy8rE1Ylbi/WQWdHtJrKHVsU7Hfuv
 besLLQdJtA3mrjmfHPyafzBSJ4q5xnN6kEykCbDHS8bPO/3vSGfrBmdMFByshqw/vgN3WQRpGQ4
 Byca0MHbKb6QtPzVkuIJVpBK2JrxgSkRcCXSWHprjuoijAorERM3QhfEWneOHGgW/vsRv5uibRE
 r8FbyEv0qwokgIo0uXBQnkG2LqthNHYAyrVHhAwt3nz9sLp6ZtBmOmUZBRqSaOwqy+mHIf7+xtG
 VbtF0RTbYzS3IYHvKXHY9xGslRWmL7I3dNymHyFAHnuAxQHm/QDTU685DyquCo0jsECNIZM80hO
 iRTK5YQoX7wW+eSSZuf5CFceybYhLJdDDHmATMRs2rSf/PgyBGYaEYfhy3+SNiNRqp3d7DxKFYI
 Kr+83O8i+lUeM52PEVg==
X-Proofpoint-ORIG-GUID: BcPehJckkDz7q7IlG8vckld0AhBeYJgC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300039


On 9/25/2026 5:58 AM, Deepa Guthyappa Madivalara wrote:
> Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
> control type for signed 8-bit values. Add necessary support in
> v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
> v4l2-ctrls-api.
>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
>  drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
>  include/media/v4l2-ctrls.h                               |  2 ++
>  include/uapi/linux/videodev2.h                           |  2 ++
>  7 files changed, 32 insertions(+)
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
> index 661a3a25da5220d2e824f71e68871181533e6cd8..c5df0e0a54f81c73975f427957b7c99fd421d5ad 100644
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

Should ROUND_TO_RANGE() use s8 here instead of u8, since ptr.p_s8[idx] is an s8?

>  
>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  		ptr.p_s32[idx] = !!ptr.p_s32[idx];
> @@ -1501,6 +1509,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
>  		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
>  			return 0;
>  		break;
> +	case V4L2_CTRL_TYPE_S8:
> +		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
> +			return 0;
> +		break;
>  
>  	case V4L2_CTRL_TYPE_BUTTON:
>  	case V4L2_CTRL_TYPE_CTRL_CLASS:
> @@ -1732,6 +1744,7 @@ int check_range(enum v4l2_ctrl_type type,
>  	case V4L2_CTRL_TYPE_U32:
>  	case V4L2_CTRL_TYPE_INTEGER:
>  	case V4L2_CTRL_TYPE_INTEGER64:
> +	case V4L2_CTRL_TYPE_S8:
>  		if (step == 0 || min > max || def < min || def > max)
>  			return -ERANGE;
>  		return 0;
> @@ -2037,6 +2050,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
> index cec9217d97ac698cd447574f5d079dd913a9ef6f..6a181a6c6b43beae87310cacb044a0cc7ad2c063 100644
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
