Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432B1199FAB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296444; cv=none; b=InmVAJG+rIhx2EUzFSMgd3/mJRIockbqWPH4edCurIr93qlSlH1Re3rjN+eyE8HQyWO24tZihMbEbm78kvlaZFjqO+CoUg2huN2gmHyUCE0Miy7LCPuIy7slVi3zbR9bZAFO1Z2VsF9+Cpg34qO5i8qQnl/GipylGfuPIVet9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296444; c=relaxed/simple;
	bh=bJG76MU0jqd2UZEmSn8HJqzFyqm6bydpj0awsCLFloo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKqYXd9e/ywC7NB8YP9/F8Ch+OeMrGIOit8RnVGI8NW1qUl57iF8SckRZc8ToXKTYeC4fJazSkKBR2g0BCQsJNLWUyNUsq6fNoEdFBX2oHT3Ly6TV2XoGXg27tCwsSchOMOngZFKjl5SMTe8kJP2ABvB7Gbt924QMOOsrfynrlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omhbL0YJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSD7cJ2T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omhbL0YJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSD7cJ2T"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMOsLp280383
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjwfF0V/eH4N4zgQCMx8Iy1opb9Nv3FqzCEAQ7KB8qQ=; b=omhbL0YJk/Cf7HyQ
	xygW4lOpvfXBnNbMajX3GbmgmNUqkpxMBwefcjmlZhPRoM8XZlK54Dy70Ne/R1qJ
	UPJnNgMxPl+iM/tU6QiSkqyBqngPL9aHEU7S3Ev/5yGQ/rnPu5qP02DK88wnEkFn
	YNCINJehJBZvzF25sTrfFwdX9FjV4l3vdez7ckglXvfhLQUWJVfahuLF+1I2UppL
	C98zUdRjTgx8ANUrQEJXf/CqkuqWnfxlY7lE6PXI/kk34nQOsoTzqgBcjd9QoAJq
	sT8zynSjVwMElxcwE/cYjevG2vAosqUj6w2bE+OGNct0+XgYz40KbZQcwmeChLS+
	EHIdNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce78bdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:34:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c0b54834bso31442eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296440; x=1790901240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjwfF0V/eH4N4zgQCMx8Iy1opb9Nv3FqzCEAQ7KB8qQ=;
        b=JSD7cJ2ToysE/v1xxd0crnoLvtOrIUUjypg0XICPSgDNjbPbf8DfZ+JS4KEIbQHzoR
         Cs+AtYuj4+nGFNrIr5kWSK0OW+/P7p7Jb2rudxto24CI/mckG4YdLP8bfgzblLLzcmQg
         jlgyMlVzMh+8KISfAAI3VF0ktpOTC7d00oBG2q/HdT6gJjEdVegX8jLxur0P2wQH/eO0
         N5VbsWH8A5GS97TQcDOrimK3r4byw+bNBXSjNz72/g013YkDMFbpcAtkTL6bPv3ytDSd
         dep8Te6I20VmDZXGIyfmp9HuP/7fHRPzNRfkDt+iMGv3BfjDfDfIefoF0HW7I/4CbEAL
         D0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296440; x=1790901240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjwfF0V/eH4N4zgQCMx8Iy1opb9Nv3FqzCEAQ7KB8qQ=;
        b=IIvq9fmqwfHGJYa29sprG0olCZwwiT5YUsNWSYBEHhZW1QSDwfuRdf9zrUp9p18nje
         NteUFTZBddXK7PF29HKXQVBN9zg6hv+cZfA/xlbMmk92nXM9+UL9AN054VTOK5sqer8n
         7kSg6oyTu9UzVgOb9tHodpsqHKIXs+c6L5BoS6iNtz9KCGVY1EU8eSm7QED4NiqfRpuy
         NT2xsiZpl0v7v17ZMHFCVATuIfkHsxI4MQ83Y00GUaSBZufF+2pEUq0tgtwTsgmLhY1q
         D8NsQBUG4nQRiHvZPX/8IUIiJqCK+nG1uK9wf3MlEVICic1xR7OZXlZmTXyfN6qxR+Kk
         w3Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwJ1svxw5sR7sgTevtr9gMeKK//lro0uyIW5eevf+sFmgb4TMOwnX5Mj34jkAscolVw4+qg0ys6SO33s+M=@vger.kernel.org
X-Gm-Message-State: AFuF++lGxRDUZarkYYHpzzFGDY5niNpkKzWAg5Hc/V7fKc7nIycTROPt
	r3dZFyKPNlnS0K0Hzx1HTpWAsjrC0Mz2K802qhgLKb1qwhs5R84kbVDPM/2xl/NdxxnsjFEeNFm
	70joRMVyidUyduTeq28Djl4aM/yklXa+t84mouqex1s3QRin/4CAezd3RNforiVceGJI=
X-Gm-Gg: AYBFou1mrW2Jo2Ypy8jVPCLgapehW7fGUTCXEAcmmhFK9VT8z/AO4uubaLUVNf49Rma
	nBWA7KbUtnKRSGodrwayNtyL4LVQyP+GrM6q8mpplnQ2gmiz2Q2jh6rIfyJMmDMLs7ESU2uCNV9
	zRlXH+p1XXA++/K0VV+aKjLJcmfTaArVWK/wIFOSGP0b3XHtmeNmnMvL1WFVg6qXeF+TSKYhT8n
	Mp0JO4aaK9AtYhUmQXfen/Q3F1SEEyRUlJQOv7dNdAXzUI/8J0imppHYj+/lic3+sNu67tdFkgr
	K416F8VbVbZ0cE1IpvjKCm4gg5LCfxvld9gQb5hClNAkmk+AJvDO4Mfjs1lA1uor3uO/a5PVhQr
	lCUUqVbq5epkpfvPwFspIXSy+p0wIVTEByx6f91QfhojfNJUUNQE9VrYd1hye
X-Received: by 2002:a05:693c:87d5:10b0:33b:ee8a:2061 with SMTP id 5a478bee46e88-34005f6863dmr5006322eec.1.1790296440352;
        Thu, 24 Sep 2026 17:34:00 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:10b0:33b:ee8a:2061 with SMTP id 5a478bee46e88-34005f6863dmr5006295eec.1.1790296439654;
        Thu, 24 Sep 2026 17:33:59 -0700 (PDT)
Received: from [10.110.16.27] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c166cfsm1839383eec.28.2026.09.24.17.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:33:59 -0700 (PDT)
Message-ID: <a2baeca1-29e7-4627-8fd6-b2696ce5d11a@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 17:33:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
 <20260915-enc_roi_enable-v6-1-29dd4c8bccff@oss.qualcomm.com>
 <38a64473-87cb-4dcd-b5dc-24550f4d24af@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <38a64473-87cb-4dcd-b5dc-24550f4d24af@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sn0yvo_dZNZOVzJQGDEaOmf4MEn2re5p
X-Proofpoint-ORIG-GUID: sn0yvo_dZNZOVzJQGDEaOmf4MEn2re5p
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab5c179 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q7n_TknA2OIddNHkTQcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX5ump5gVIgzeU
 YN54VATOjUFoXCrrIlsMvnEj9jpc9WDPQBq4pm6WD8Z6gjzaIqg9NhDceKXCUL9vGS8EorlhZFv
 a4PhiRsVJsqtWQV7ODASeFKFokpjLAd7i8siYhwmrPwhHNn9toT4LiP9qWF+QahTn1/AMI8qZis
 0ODaqmEHBGDvc7L/cwn4Xb2bdBG2nwqCxvhzySUfJ1vOHzEwxoBiKt/VCKQViBkpaj48ExmFSja
 c/ampZDH68AuNJukNOP/pRP9nmfRJXQwUMsUkEVPptE00CYpotm9aEoIYX9e3rDxxIoVgUvGVxA
 ASl/Dw2g21vR+kSFiLGK1dAI5/Rs/iO09iWGALMvoGM6xftB3dCLGzsS/BN/e5zM6+ajFLgeOlL
 0Rp8XO/iZ8ZkUA42pxZonnsuD3t2dMF8WZ7FUcOJhKdk14XuK/UuaAvvsFdQaOKMkIZzurGlTT6
 Urxb4ekLiRy/WxFUHkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfXyi4q2+UCoXNV
 8LqOGoclGu9YkJbr4nU5FB9/O/ALHx3d7xsR5hHUyQC8RS351XOaHTgPaWHiwa+zSZGFFO6fE/Z
 +kiCm7ClI+z9MhwSBLeDx5MLe1wXFmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250001


On 9/22/2026 6:17 AM, Hans Verkuil wrote:
> Hi Deepa,
>
> On 16/09/2026 00:00, Deepa Guthyappa Madivalara wrote:
>> Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
>> control type for signed 8-bit values. Add necessary support in
>> v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
>> v4l2-ctrls-api.
> One reason I asked you to split up adding the type and the control is
> that this makes it easy to do a 'git grep V4L2_CTRL_TYPE_U8' and compare
> that with 'git grep V4L2_CTRL_TYPE_S8' and see if the same number of changes
> is made in documentation, headers, and core code.
>
> And I see that S8 support is missing in v4l2_ctrl_type_op_validate() and
> check_range(), so that has to be added in a v7.
>
> Regards,
>
> 	Hans

Acknowledged, updated in v7.
Thanks
Deepa

>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/videodev2.h.rst.exceptions        |  1 +
>>   Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |  4 ++++
>>   Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |  6 ++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c                      |  1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c                     | 11 +++++++++++
>>   include/media/v4l2-ctrls.h                                    |  2 ++
>>   include/uapi/linux/videodev2.h                                |  2 ++
>>   7 files changed, 27 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
>> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
>> @@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
>> +replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
>>   replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -188,6 +188,10 @@ still cause this situation.
>>         - ``p_u32``
>>         - A pointer to a matrix control of unsigned 32-bit values. Valid if
>>   	this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __s8 *
>> +      - ``p_s8``
>> +      - A pointer to a matrix control of signed 8-bit values. Valid if
>> +	this control is of type ``V4L2_CTRL_TYPE_S8``.
>>       * - __s32 *
>>         - ``p_s32``
>>         - A pointer to a matrix control of signed 32-bit values. Valid if
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
>> @@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
>>         - any
>>         - An unsigned 32-bit valued control ranging from minimum to maximum
>>   	inclusive. The step value indicates the increment between values.
>> +    * - ``V4L2_CTRL_TYPE_S8``
>> +      - any
>> +      - any
>> +      - any
>> +      - A signed 8-bit valued control ranging from minimum to maximum
>> +	inclusive. The step value indicates the increment between values.
>>       * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
>>         - n/a
>>         - n/a
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
>> @@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
>>   	case V4L2_CTRL_TYPE_U8:
>>   	case V4L2_CTRL_TYPE_U16:
>>   	case V4L2_CTRL_TYPE_U32:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (ctrl->is_array)
>>   			return -EINVAL;
>>   		ret = check_range(ctrl->type, min, max, step, def);
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> index 9caca56478d1a97ccde582a2086e7039411b52ed..b78992e32e21c79b1c70ec673b81759c9ca84206 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>   			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>>   		}
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		memset(ptr.p_s8 + from_idx, (u8)value, elems);
>> +		break;
>>   	default:
>>   		for (i = from_idx; i < tot_elems; i++) {
>>   			switch (which) {
>> @@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_U32:
>>   		pr_cont("%u", (unsigned)*ptr.p_u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		pr_cont("%d", *ptr.p_s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>>   		break;
>> @@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>>   	case V4L2_CTRL_TYPE_U32:
>>   		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
>> +	case V4L2_CTRL_TYPE_S8:
>> +		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
>>   
>>   	case V4L2_CTRL_TYPE_BOOLEAN:
>>   		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>> @@ -2037,6 +2045,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_U32:
>>   		elem_size = sizeof(u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		elem_size = sizeof(s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>>   		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>>   		break;
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -27,6 +27,7 @@ struct video_device;
>>   
>>   /**
>>    * union v4l2_ctrl_ptr - A pointer to a control value.
>> + * @p_s8:			Pointer to a 8-bit signed value.
>>    * @p_s32:			Pointer to a 32-bit signed value.
>>    * @p_s64:			Pointer to a 64-bit signed value.
>>    * @p_u8:			Pointer to a 8-bit unsigned value.
>> @@ -61,6 +62,7 @@ struct video_device;
>>    * @p_const:			Pointer to a constant compound value.
>>    */
>>   union v4l2_ctrl_ptr {
>> +	s8 *p_s8;
>>   	s32 *p_s32;
>>   	s64 *p_s64;
>>   	u8 *p_u8;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
>>   		__s64 value64;
>>   		char __user *string;
>>   		__u8 __user *p_u8;
>> +		__s8 __user *p_s8;
>>   		__u16 __user *p_u16;
>>   		__u32 __user *p_u32;
>>   		__s32 __user *p_s32;
>> @@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
>>   	V4L2_CTRL_TYPE_U8	     = 0x0100,
>>   	V4L2_CTRL_TYPE_U16	     = 0x0101,
>>   	V4L2_CTRL_TYPE_U32	     = 0x0102,
>> +	V4L2_CTRL_TYPE_S8	     = 0x0103,
>>   	V4L2_CTRL_TYPE_AREA          = 0x0106,
>>   	V4L2_CTRL_TYPE_RECT	     = 0x0107,
>>   
>>
