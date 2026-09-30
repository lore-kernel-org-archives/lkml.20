Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D2251A725
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788500; cv=none; b=fK69PZeeAy1X8T/MZuo6n5cK1qHuss7+qSgr+on1g3pYfmGUhxSt82ddeqrNj4/eEoYppBovB0GlrvrFKjIaTpcBMZOtUywK9B+jrgIE8Efev0wUJ7gFMf5U8gWwyNUs2Nhe0/o7/fabgXAojBEl3Aawo2unF4z+PvWNXYShM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788500; c=relaxed/simple;
	bh=u3gkLrkF9kVgOJwNggTRWnNyg7mLMRr/4qwWou0hjVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKXUhgmSv6XAnZ0T1avyV1MnGukxFUfBYz6v6zTVrCy5XlA/3AQbuhg0XoVG+d3ib5wZJBuYS/hXNZ5TXXDYyXCBVeF91TJ8qAOgcU5Q+JJwIzB+T2qvVvIhT6OoHhBbMm5GRVA1dIu0WvouOaUiJf8Gv3zVEQLmPWZ18i3+NJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlUySY2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTgubBKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlUySY2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTgubBKO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UDxng43063743
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABNmpZA6nprlf29bjnwIeQz0NrJAORbAu9yDE7O7gWM=; b=TlUySY2lTHxHkgrl
	FUvyBqLMzaSQ0ETbgsL9IzU8XyruHQuEox23I9yG16Ndu4EmV1OQBPCVjdEJFsZU
	jLmcKGAAczqU2ihOcGwikIqVcPjpZySjnQjCfI3HJwCXiz4VAhGRdhBx+4oQqWS/
	EO2yw0tptmDwTpBcOBm6ZpTqruFegC7yeTF6+tJaxhEq/rHv5cDg25eyEjbrUdO7
	bQ5MU1wuzGiLKhh9FsRQjBppi8cqvUvd8h/m7QRX5Smw0y96yDU9MoxwqjUrKPGl
	9aBgeFOIL58vlzFg5F9Jt01omZ1b6oGlNuuRjoZO1ilMHqzgPMwNykp7Lv/C4TGF
	bhUYSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjkt6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:14:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313c7315becso896634eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790788496; x=1791393296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABNmpZA6nprlf29bjnwIeQz0NrJAORbAu9yDE7O7gWM=;
        b=aTgubBKOHO51ba8HtWLDCroiXEy3YksZxq/M+ZTFT+fHOAmMZn/PziGq3Dv3Wu764X
         FzfSaMxJmOo4lj3wiwMmOpwRzim6jhLi+JCbpSfF4l/IpBnLt3x6JOeMuF/Skbm+qxp5
         sr7qIV/NKMuvD/FPVoqy6KFvrO7Ges2Ps4nlH6KtzicssMMLyeeTngb9rD99T97RLHrI
         DmCsdMgJlCX5Pcr9IVBJSMQcbLOvzeXdCywxXVsMh3EasHqZyKSU8s9mxw9BnP2MHFIY
         CV3b4TQIJSwBWA+sDvxDIGU/kaw6cmgsUlXoaBVPtf9EM/bSw+sI+PFEOWrlHOPadBCv
         Fsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788496; x=1791393296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABNmpZA6nprlf29bjnwIeQz0NrJAORbAu9yDE7O7gWM=;
        b=kUpj8YujTskLvWOzEJAjkLFBQuDJqCB+TgmbyrVKfZoZYBoJeZEUZse+Q4uAgyz6Y4
         24RaStitu4liIP/+FWn5q2ts7JzZREaspC6DzGqw4x/1Qmauf2FXiAyID2zQTM7NuoEw
         RbYDJ/DuE9J3JC4/lq/BFWHw18IfnIqS/a+4u6N07Huu/d/cfpDA7VU2GHRqtsNvnLa6
         ev2gZYa09/a9VLUlqFD4GR+CY0rQIiFRmfV44QHzrkwCN/SwL2m7q7o6dTWQpa+n8OQj
         6zhHJeTVKB9YE/S8FPZ5B36l5hYGKcut7EveVwbf3BQK/Zy9BtmAJA0J6re83gyiGlLC
         Ioig==
X-Forwarded-Encrypted: i=1; AKwUvBy1RfDiY7BK09c52H/m59miE3oyvX51xJPL/VSdmD8DfX36e1LcNKkxXiiKZRKRIr86/8BN0UlONt5JcjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcZ37Q7NK/yD1bH+ua0h9qjxHrU2ggA6Vs8ioWwp9KFmOymljh
	XQjL38NV/qe6JqK1bPPFQ0HoH/4bW153GxodWC/gYrfAGdhEcW0P1sfENtDtrlVpQjflbtgNuhx
	8e4ikkEsHhOuaBzV+1xw47d2m5yZNb+Z+FpgvwoZKb6tSpzOBjZDrq8h8ZvDCLDO5K70=
X-Gm-Gg: AYBFou2zQn2GZj8v44GvSC5b1aQKbWmypayy4bM9RiW6Ih2uK32ESrGAhLFIn1A1AOI
	T76Q85GV8SOgp16/vVQDxBtS42VhdS3dIvyeF7ehd+ZjcOfrXGQsPuyvPXkjfhisNmAz3PqqbHu
	VjHOv7cqpZ8fW22Xf5668HOYzUEnvLZgPMCqJPwZzs7wSaYHpP2AAYkZ2D7+dCgq72O3L/8xtpH
	qgd5SPG/Xc0HKeFd58UVCYUrwmJHskw0mHN51rzfWKHXGOGvQs9e2dOqoP0hbHr5M0vd78z1Wpu
	Xinps9wdOlUoenlYU3Di9SbZcnn9qSeOrSIlgcvUDdmNvUCsABwBJMQb25F8J5vlhD54YBf0xF+
	YMCHS0sq381Y6M/M7PPMmApXkdlsTaq9P+TzyYFMizYTOCn7BaMY9Gj2HsFXzjQ==
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34cdbecb18fmr3550090eec.2.1790788496291;
        Wed, 30 Sep 2026 10:14:56 -0700 (PDT)
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34cdbecb18fmr3550053eec.2.1790788495630;
        Wed, 30 Sep 2026 10:14:55 -0700 (PDT)
Received: from [10.110.82.170] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db42325c5sm343876eec.21.2026.09.30.10.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:14:55 -0700 (PDT)
Message-ID: <34398ea8-2ee5-4197-bc89-e0ba744c4d93@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:14:53 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260924-enc_roi_enable-v7-0-6fa7413af23c@oss.qualcomm.com>
 <20260924-enc_roi_enable-v7-1-6fa7413af23c@oss.qualcomm.com>
 <e9b1f3db-9f53-44f9-a188-b1ee0e9c47aa@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <e9b1f3db-9f53-44f9-a188-b1ee0e9c47aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX4rWunDlPSUyQ
 ZmzHBPaoEQM6iBRN5fbFJYrExNYLQqzrAKf8LID6xb0FEgRLeZXG9veaYkyCLJ5ph0ffpPD8aGt
 VGT9htsx0lGmcF7jawhbJK2c2xokH24=
X-Proofpoint-GUID: BTMlo8h7um33BC04TFuRrCN0_mCqBHr8
X-Proofpoint-ORIG-GUID: BTMlo8h7um33BC04TFuRrCN0_mCqBHr8
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd4391 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Q7n_TknA2OIddNHkTQcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXxSi29GYyS2K7
 K8cQxfcFdb7+ga63dZ+0OnXqewOd1b/EO8guTzCaxELf+KSzqJm6kwdKxQAls440fFw+vYby/u/
 i+l7R0/m080/12vRxhuALJtx9sQ8Y/fHaQemiDTtWMhl60+chQJb4ne0RKwlmuDZytX/kn40PFy
 BFyBhiSbTALH7fTjxbWUG+IsIbnWXGvNdD991yhjjr0HS3mXbToAb/+Rsct0fhpoG/QWFD35qmh
 AfwXLOTuIiRNxWVjQ0YEFxzqrZW2Pwb2krRvYcIJOVIEFE0+l1i12PoONzrZTR6xNbPGX/aP/Qi
 SPbtS2g0UfmWivQQbr//rmJjt0Qca/1Vjjnnf9K5Uh/Bdsvv7o6VLatHisCox8anL3oBszzsj3K
 7SU6iQt9CFRmStEZbYrT3/zt7yg04+HRmgmzN5l7+ngXcAvc8rkmQqLuSyhLVp2Ll++mTChtqwv
 e2Od+Rt2E/UQ0m/gn0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068


On 9/30/2026 12:14 AM, Hans Verkuil wrote:
> On 25/09/2026 02:28, Deepa Guthyappa Madivalara wrote:
>> Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
>> control type for signed 8-bit values. Add necessary support in
>> v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
>> v4l2-ctrls-api.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
>>   .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
>>   .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
>>   include/media/v4l2-ctrls.h                               |  2 ++
>>   include/uapi/linux/videodev2.h                           |  2 ++
>>   7 files changed, 32 insertions(+)
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
>> index 661a3a25da5220d2e824f71e68871181533e6cd8..c5df0e0a54f81c73975f427957b7c99fd421d5ad 100644
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
>> @@ -1501,6 +1509,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
>>   		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
>>   			return 0;
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
>> +			return 0;
>> +		break;
>>   
>>   	case V4L2_CTRL_TYPE_BUTTON:
>>   	case V4L2_CTRL_TYPE_CTRL_CLASS:
>> @@ -1732,6 +1744,7 @@ int check_range(enum v4l2_ctrl_type type,
>>   	case V4L2_CTRL_TYPE_U32:
>>   	case V4L2_CTRL_TYPE_INTEGER:
>>   	case V4L2_CTRL_TYPE_INTEGER64:
>> +	case V4L2_CTRL_TYPE_S8:
>>   		if (step == 0 || min > max || def < min || def > max)
>>   			return -ERANGE;
>>   		return 0;
>> @@ -2037,6 +2050,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
>> index cec9217d97ac698cd447574f5d079dd913a9ef6f..6a181a6c6b43beae87310cacb044a0cc7ad2c063 100644
>> --- a/include/media/v4l2-ctrls.h
>> +++ b/include/media/v4l2-ctrls.h
>> @@ -27,6 +27,7 @@ struct video_device;
>>   
>>   /**
>>    * union v4l2_ctrl_ptr - A pointer to a control value.
>> + * @p_s8:			Pointer to a 8-bit signed value.
> Nitpick: move @p_s8 to just below @p_u8...
> Sure, will update in v8
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
> ...same as you do here.
> Sure, will update in v8. Thank you!
> With that change:
>
> Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>
> Regards,
>
> 	Hans
>
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
