Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EBE457E47
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512810; cv=none; b=lld0nPHhbq6mIrsTt7vLAZU7/7MGoHQuqdTiqdFIpw/Ur9e038rSg/wEcE4fj3YGbD8rkcTJdXOD4q+r0E8mhGlScoJfxSQeZOf6aorYqjDMoLxuhsGtqVHVUHNTrzQ/zcg/+ah6hc82CfYRujWrbFcJ2hFWjY1+hjaQ1LKvT1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512810; c=relaxed/simple;
	bh=urS2kzDNEy3kLXRgefUlB2o4vYdHVSnp0qRcZVA5lZs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C+ZorVRB0RjwP63L1WDt+rVTWg6j70RLUtQbZyKGTkNo5CEWYKr7j6nJz++7oIq0XDWy2q2aH5K2qhBFRAjbcthEBhbxFdyClzk7ZqkUzn9MFMQDjbIlFXqPt68nHcCDt1+aydRDlkv0RZqH+YNztLCnhkVQX7FgBz4UAu2YAWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvPfe2pA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlO9wuY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvPfe2pA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlO9wuY2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM39iY1932214
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOZqoVswgphE7fnHhHummai5lzdSMYuuIyLJqsvPSFQ=; b=GvPfe2pA4KusFQwu
	aLn2Nhfib7Me9oyR8oNZ0+/Elaqc2aE9hfmW+XeIvaI44OPx36DcyuPTlCuIkzwG
	fuUuGDOvnawTszu9l5aD1+LyylLCXBjfh9eft6k1tSri1pQ2y/t73ZXPHRz5yAIx
	gVBPiCwE6yEKiZjmybO4A5YV5t1tdA0uxmefAVs8Bpf4aAhSjnv2vCGhIQp/+jWv
	7t/MH3wro+ey0PNPEbRcRJmgb9B4A3/x6OOLrmECseuTLhRhx024Udxxj7r24A9M
	LvC0WaIXBaRHDcJnGP/rN20xHZId2ok64ANgiIfAGtqsODv86Y66uPpl6anhjpe9
	NHV02w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp84w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:53:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d3a12589so1529876a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789512807; x=1790117607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOZqoVswgphE7fnHhHummai5lzdSMYuuIyLJqsvPSFQ=;
        b=WlO9wuY2RKPPyAc8tGXKspw9aHn3yyRRukeGhG9U9BabeuvJSbkfvTIG63hB9TsjYa
         p6+yYVXsHg2IMOrfsTyhQBoUJT++kk99HcFUdCHqo3yLy/iyG76GEhwt67F2eRqOeReb
         FCH7v/bg37HbN2RsQa/Vy7XoG+rLgi2MpWXsmP0owpmfVSZ+I1SzTyxiZgEfVqNpDRGJ
         0CWYVLc4eTkGNGK6Y3RwBsDrziJGNdc2GwcLBZ8B1KxkMW2cTMhMNlcnCpbGKsEnu10m
         133/c25/zMWx+sjaw56VN8ulNFvOGtcH+1sopZk9eiWeoyzP+g0g78CjUWTtpkmW+qcY
         I9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512807; x=1790117607;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOZqoVswgphE7fnHhHummai5lzdSMYuuIyLJqsvPSFQ=;
        b=dAIJOHeodcppOUYXeYgbXMVu+r0KeTjqPCSi8kaUOMX5iCyXZE1MRVC+4cwxF8YVE2
         bskEqI+NQUUJaImw0uS9XbQxpb6v+wBxIuYyvRd1+HcXNKjGdo/mSIGwUBxNmcsIHjB8
         GpcZ/A9XgkxiBffztjFsNzP+OX85XiZCpuorPwdPnYt+lVEkoi6F+jwo1SfZB+P+ykxK
         B0Tchtdz54C38RkhG2enJZIGL9IGHGFbfjkvQO8MAs5Rh9uU42nEl5b5JBOHE76kvcE+
         Jc6+5bAI5hDC6VIvA36k9YD7Ya9gFx6cH6mKf0dTB2Ct9kp82UTeY/M1TEu9+UiF1e0H
         tfXA==
X-Forwarded-Encrypted: i=1; AKwUvBzMoweAeMOIgNcRlt71my4Kcvweyi0/XzRWxCIwnQZBk7Da+FnbkqLZ1nicF1xZvIqaHqEUpaCDzjXJT/g=@vger.kernel.org
X-Gm-Message-State: AFuF++kBArZjBtHTNHu1TmZ6TJYmIP9lXbknMkGFviVefXqpxfvN+4PD
	czdHXZTCx+MtmwiV44ITAFP3FV/BTV22cL53uweONAYb366SBY4MMZxo480+zSD9Lj8GfTyGIpY
	7yzi6J2Ty7D+8agc8lbBK83I4p++WYjunAlZS09MpCAQ/hidfWToVDOnAwjm2idXOsFrG8BitIi
	s=
X-Gm-Gg: AYBFou1t/ju8Ef64V+b8DdUlMWV1bdsi6JQ2DSlz/MQ6FM1EcrKT58wDdfCRHgHJfjN
	7HLoMsYJT6JlTGL770yGyvgwdHK1SRnaN7fGv+qPmGyxcrrUX53xjeOpwqC8M6C3mk5WYx4DA43
	LZzbOcaTwMotl0hyikOHvgUol/DawG7Ka95ofWJqYn5SaRyiX5j8XhCCF07jsFqWSHRvbVNPFCu
	4hQ4ZlBQ5ZH1l2yjuQ0Tva3D1D53IEnLmTmlUoeBABuAvndsG/EX++MYylvHj6zzkreIWFCIxOM
	lu9Nhxy+9WBu3g3NlRjULA/G9GOuGST5dCUZ5m+QM4EthQuZRGfs5Xf/xW+ZsjDmVuPxB9KNYt8
	ilRq/sc3dBjX1WuC1riAMMQIFkBcHcAFP1wzegYSejzpzuzrxeMioeHW/Flid+w==
X-Received: by 2002:a17:90b:2703:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39e1e4b2c56mr482915a91.3.1789512807101;
        Tue, 15 Sep 2026 15:53:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2703:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39e1e4b2c56mr482894a91.3.1789512806625;
        Tue, 15 Sep 2026 15:53:26 -0700 (PDT)
Received: from [10.110.88.91] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aca3fbsm2231351eec.20.2026.09.15.15.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:53:26 -0700 (PDT)
Message-ID: <be315a16-9eff-43fd-a255-b92aa774d1a3@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:53:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/5] media: v4l2-core: Add support for video encoder
 ROI control
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
 <20260815-enc_roi_enable-v5-2-ded944f0fc7f@oss.qualcomm.com>
 <98399307-338b-4a16-9ac3-2a342c12b318@kernel.org>
Content-Language: en-US
In-Reply-To: <98399307-338b-4a16-9ac3-2a342c12b318@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMzNCBTYWx0ZWRfX83zRqjU+OJ2a
 WtuC52l91d8J8NxJ0mkDx/6lGnsYteS6wEVAibgnzG+zlq986+c6XHFASVRAt6L77choT0+Rqb1
 brCY3/2I7UQkLh2CFymbDgyysczGFMU=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aa9cc67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z3w0i3cEy9E7FsoBxG8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: JMmYmZlHJxksnoejikXNgvExT-DUvAdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMzNCBTYWx0ZWRfXw8VgP3K1Lj8J
 F6FGCSJSS6IlpDyGEOXuh9aLsnCoWLphadzD9Ze+4apRChYWSwcO3daAvL0SX5KQxaBTcO669ll
 /t3HDP5sVNeQcATye5KPeOw5l9OXdsk2HOMRfeV6jO1hNsYLYzP5qfwhkmD+Sb6D5p7qUmjn/RW
 qRv0wsyhR+I5dpbRJ9w5myt/UqnxbeJwFiwy4j0EllcoCNZ4GaJUYpcn4pGD9nxOFrwbkQC7hwb
 nY73WrEMfGzL6IjF9safFDn2+7DHlqnW56A4mCW5mNVHb4v0XmyJMkw5YjCy8Ag7UHXaVLFqZql
 CucEo7yGf6X4XVW32sqcCa8WsvcUH65bnMXVdWhd9RDLZgXC1hcigktTSviJUGjFuky57Cqq/A0
 Mlh1usA8Wth+0TNbEtrHVLRVcKUJJ9lnE1oY2m252OsFnQCP7dol2vDTn1yir61SwQrIhQT8pxT
 wJgGK/t6xFkwj2yJrIw==
X-Proofpoint-GUID: JMmYmZlHJxksnoejikXNgvExT-DUvAdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150334


On 9/10/2026 12:49 AM, Hans Verkuil wrote:
> On 15/08/2026 21:22, Deepa Guthyappa Madivalara wrote:
>> Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
>> and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.
> See my comment at the end of patch 1/5: this split should be done differently,
> the first patch adds V4L2_CTRL_TYPE_S8 support, the second adds support for
> the new controls.
Upated in v6.
>> Signed-off-by: Deepa Guthyappa Madivalara<deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 ++++++++++++++++++++++-
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++++
>>   include/media/v4l2-ctrls.h                |  3 ++-
>>   4 files changed, 35 insertions(+), 2 deletions(-)
>>
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
>> index 5b8a594fb9e24e16128c9c763a3b1dd311fad2ba..db6577070ebd2eb6a60599b3b2394fe128236705 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>> @@ -290,6 +290,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
>>   			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
>>   		}
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		if (value) {
>> +			for (i = from_idx; i < tot_elems; i++)
>> +				ptr.p_s8[i] = value;
>> +		} else {
>> +			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
> It's a single byte, so you can just do memset with 'value'. Just cast value to u8.
>
>> +		}
>> +		break;
>>   	default:
>>   		for (i = from_idx; i < tot_elems; i++) {
>>   			switch (which) {
>> @@ -370,6 +378,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
>>   	case V4L2_CTRL_TYPE_U32:
>>   		pr_cont("%u", (unsigned)*ptr.p_u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		pr_cont("%d", *ptr.p_s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
>>   		break;
>> @@ -1397,6 +1408,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>>   			return -EINVAL;
>>   		break;
>>   
>> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
>> +		break;
>>   	default:
>>   		return -EINVAL;
>>   	}
>> @@ -1410,6 +1423,7 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   	size_t len;
>>   	u64 offset;
>>   	s64 val;
>> +	s32 tmp;
>>   
>>   	switch ((u32)ctrl->type) {
>>   	case V4L2_CTRL_TYPE_INTEGER:
>> @@ -1435,7 +1449,11 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
>>   		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
>>   	case V4L2_CTRL_TYPE_U32:
>>   		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
>> -
>> +	case V4L2_CTRL_TYPE_S8:
>> +		tmp = ptr.p_s8[idx];
>> +		ROUND_TO_RANGE(tmp, s32, ctrl);
>> +		ptr.p_s8[idx] = (s8)tmp;
> 'ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl)' should work just fine. No need for 'tmp'.
> The 'u8' type is used for an offset variable inside the macro that is always >= 0.
Got it, updated in v6
>> +		return 0;
> Add back the newline you removed above. It separates the 'integer' types from the
> boolean type.
Done
>>   	case V4L2_CTRL_TYPE_BOOLEAN:
>>   		ptr.p_s32[idx] = !!ptr.p_s32[idx];
>>   		return 0;
>> @@ -2030,6 +2048,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>>   	case V4L2_CTRL_TYPE_U32:
>>   		elem_size = sizeof(u32);
>>   		break;
>> +	case V4L2_CTRL_TYPE_S8:
>> +		elem_size = sizeof(s8);
>> +		break;
>>   	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
>>   		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
>>   		break;
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
>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>> index a1806ddbc797efa52e83cd3f685ef70d5b5483d2..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
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
>> @@ -61,10 +62,10 @@ struct video_device;
>>    * @p_const:			Pointer to a constant compound value.
>>    */
>>   union v4l2_ctrl_ptr {
>> +	s8 *p_s8;
>>   	s32 *p_s32;
>>   	s64 *p_s64;
>>   	u8 *p_u8;
>> -	s8 *p_s8;
>>   	u16 *p_u16;
>>   	u32 *p_u32;
>>   	char *p_char;
>>
> Regards,
>
> 	Hans
