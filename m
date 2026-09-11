Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B2147F2C4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131693; cv=none; b=So9nGImRuIppAbqKywoD7mOFQTM8/g/gkPh+3TNVJvQahk5QwNwGXRpsOtKQy1XZlNsCM5kSnG+wyZ4Wf3/zcq3t4mUaNUzHSm3bUGWvaPFsO194EcXEsHB63rBZpfdKSuk706OcUdBPxV1hiC+nozIBwDGeLaAUGtFubgDdd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131693; c=relaxed/simple;
	bh=UME81Wjgx4yMeSlwEKx68IafUmT8cLniGFxkwHTBZxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjB3sWgO45zT35lidyh1unO6ql1ObmRaFPPCOouLGAER+ef2IsCLhN15mQGSDux6SoKRc03Hzoed8vwIOwnCstJsvWB4URrzDFD1jk3AHn5KYWClpBJMQ3Y+EvoqaTdVmf0GA7KgNV5Oomm+yFZ6H3LhM3uEDq9zj770YyOJFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjRH1zQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pix3Z2fd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjRH1zQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pix3Z2fd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjdDL525000
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGJ3kNukLusnFdyRx9SeXZ/hwbvBYeJhvqWpjSPiDHo=; b=WjRH1zQnXlbVYx4+
	Q+jeHEO9C4jvGCm0G/M/kSoz6W2vWoPwhgewIPzTEGTh5om+4pTMcPRLEkeBWD+9
	OBLHGv4PnEgAM+CPCJfeXiJfZ8AUS1K40VsCQ2qal+kDhqlFpVAcCQ6fY5MjWrnA
	Xzq0iaUmZ4tupNZOGZSg1E1Yp9Mtu/fRXbZ9A/EhobxMAtjtKh5+NXf7F4CBLDBj
	v//36dPIbjbHSfc8Q7MKCjFbvh8SnHeLDWUg2DNcqC4DPXgHIVmK5V4koZVC22zP
	ShRsRj8MugA2ujgN9Cdz0tvIlbPuQTdjY/m30MTVh5SyXi7o3v1y8jyXpjMbd6Jj
	WYCq1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q13k6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:01:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so17520581cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789131680; x=1789736480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGJ3kNukLusnFdyRx9SeXZ/hwbvBYeJhvqWpjSPiDHo=;
        b=Pix3Z2fdnjDNuWyVUOxF94S/EajXVAHBkGJDbt51N/MjVMSSu6Ib2ZwduXULM5EEIp
         r8eFeArJmSf/rXo78CXXte2tAJ63I+91hZYTTx0ML8/3vD3DzQ3fqfC/vrgt3DG3VemG
         Ip0ucWAW6QDPzbHcQDnk4Y+fF9sYMrBAj4FUBkDfOyc6qWI2NpdwD1BiP20i73j9UHAR
         COB2iPZrMAljM41OjJz3G/gFHwfRN2pIi1GJfbPb+PxQC9hPtUQt00ZbDqyISjgZO3V7
         8ELSGqkBsZh0bUeoAgxwk54+cuhZwkWN9KAODkxqTdA84o9M7KS3uW9wd2mYghmTobBu
         nG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131680; x=1789736480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGJ3kNukLusnFdyRx9SeXZ/hwbvBYeJhvqWpjSPiDHo=;
        b=CBE+kBLOdBNYV3Sx+266cnNHFlnxmq+i709mroHucctFHgyX6bglvAGYoML2MTHh53
         MeFaNdqACJjSXh/0n8GUhNOkFqq1Sx6kzLeFRe7nv0wHH/uVWlD/r4v89da3YWn4pVoc
         +zuNzQ3h7sHmZihBpz5Z4ROCO9Njf1Ys2bYLZGLyFgoDiNg3CmhldXzRgyTyaJSiaDSz
         f7jeqWLtnJzImh7UIHH6CxoTeRRCDgIvhpOea2drBOwQcZGY33P91lEUlv0XvTG6aMYY
         8+btpqr5y093q+5iCCDilAs2MPa7jl74qd0sDLlmrfrBzZnlDia8JWAkYCX2WiZRUp2t
         Iaxw==
X-Forwarded-Encrypted: i=1; AKwUvBwn5gIkkDZ3U5FLK8w5r6o3K7XoaZp3zpHablFtFvjIsoWXdQErmCAcx7iqy7cjY0an2fy0/wF4mJZ529A=@vger.kernel.org
X-Gm-Message-State: AFuF++khtshD0hFSyqWA2gtMuCvuWqJWXFF89VrTFst5I7Igtql2aWOs
	hosicrFKzYqsWRkpUEOdPeKskOJ4CZJEu5Ny3rH8FpMtKtclGFKTPFvd8z0SmjOAljXvZc0Oro4
	RSv+MZwiXp2FLbpIC73Mo4psN3MYM3BrThize00dbRIShT3kkx4Yz0P5ZcRm/nygVzy7RyVADco
	5CvA==
X-Gm-Gg: AYBFou1JxjVQa4N3cgOarlMpNpOuJue6F3UnlR07kEhpTlSnReIawQ2wKjCsAPmh21t
	RZyrIw/OvyahckSVQYwkVnIl8Tf/Ak8yNn9VCYyw99bt0qUDPBKfNBVoH3cSH8qvQ9WiNKLrZ2/
	+BvuUmnfNEB8m3BuzlUH5hbsUduulM5WFFGkfkBBu0KGL1t0yocYRx4hX32jh76zK8XRVcWaruU
	4CgXNEjBZRWLk20f8Wwr21Hbu2boecO00lFI3nURJWTNi85LU482PM1yBgwNQcziwtVQCI1KTz1
	dADx64PfOUAzee8v3P4oP/ifVTvJ61P1nAP2rfg0NQAncxIkIkTiVlYQeARITjiBbMZOw3cYyXr
	JVO87iIvaw0lSfcDVQjfUulur0Tt7EHPoVNX38Bnw
X-Received: by 2002:a05:622a:e308:20b0:530:cf10:8a97 with SMTP id d75a77b69052e-530cf108b6fmr26134401cf.38.1789131678985;
        Fri, 11 Sep 2026 06:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:936:ea3d:9313 with SMTP id af79cd13be357-939ea0a8e5cmr494862785a.20.1789131633727;
        Fri, 11 Sep 2026 06:00:33 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33e020sm6110046f8f.18.2026.09.11.06.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:00:32 -0700 (PDT)
Message-ID: <2cd833b6-ab8d-4241-959c-485f850845e9@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:00:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: qcom: camss: Add streams API support for
 CSIPHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com>
 <d08ec8a9-4970-4d5c-b9e0-a5f84000186d@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <d08ec8a9-4970-4d5c-b9e0-a5f84000186d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3fba0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9NmG1Z8FHrD9Po8C_t4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX3GS9VrDkuBjC
 rLmb1bl5dW+N0mWU1EaSDK8oveaiXpZglmIv+YjoMp6h11+f6L+rxv78zYORguYMQQIy38dS1xJ
 Fh/9yXWdBHi5J7GzDevSGLClwb7HWEEIBQLYBRVHq7uaT3O0OQ1400drX9BpmDucud2/lu5Hv4G
 ODOHILkQzqh2Qo1TQjiw4H4Qm7RO950XuXmBJqRLFlnodesL7kpabhGBUgludaMHTispE5X6fiJ
 25k0mO1kAb1OLRz9MbSam6hyOZptDO4h9jqGe5is+VSwGQWrvieXmae4yko1pytjMJxf0CMPmew
 IcrSaxltAKNTnFQE/1uHSfaEdjfvE4GNXqVxu4HWwnug3ZZb5Masvx//0v3knoA7etesREsL6zB
 HcGIo26VCrwqnaFDvT9VzRnCDGMtzKGTEeBtCOuOVlezZNmMwJZeWdFmPkA4X4L9Ig+MQ/jVpVZ
 xVAcz6m4xrj2Dlnw+Cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4MyBTYWx0ZWRfX327ymZlCAZ6F
 X3dEiA8ZaMVXpcOKzTMZz4oKtANHEPmrnVFi2aFPjM2Oe0NTWcTjrK5PggiPBJwYPd3M6nr4dWb
 HSR+YKvfOtqwjHmkzVGAdBrxvoItI4Y=
X-Proofpoint-GUID: s3t4-ZKkKWqdUmfkcfjX5OUHQp05pbP-
X-Proofpoint-ORIG-GUID: s3t4-ZKkKWqdUmfkcfjX5OUHQp05pbP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110183

Hi Bryan,

Thanks for the review.

On 9/11/2026 1:37 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Add the V4L2 subdev streams API to the CSIPHY driver: a passthrough
>> routing table (one VC per stream) and NO_STREAM_MIX routing validation.
>>
>> enable/disable_streams pad ops track active streams per pad via a
>> per-pad enabled_streams[] bitmask, so that multiple source-pad
>> consumers can share a single propagated sink stream without redundant
>> or colliding propagation to the sensor. The shared D-PHY lanes are
>> enabled once, on the transition from no active streams to at least
>> one, and disabled once all streams have gone idle.
>>
>> This is opt-in per CSIPHY instance via the new streams_enable resource
>> flag; no platform sets it yet, so CSIPHYs continue to use the legacy
>> non-streams subdev ops unchanged.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>   .../media/platform/qcom/camss/camss-csiphy.c  | 223 +++++++++++++++++-
>>   .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
>>   2 files changed, 222 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index 539ac4888b60..7e9748e92ab8 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> @@ -332,6 +332,112 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
>>   	return ret;
>>   }
>>   
>> +/*
>> + * csiphy_pad_enable_streams - Enable one or more streams on the source pad
>> + * @sd: CSIPHY V4L2 subdevice
>> + * @state: V4L2 subdevice state
>> + * @pad: Pad number
>> + * @streams_mask: Bitmask of streams to enable
>> + *
>> + * The shared D-PHY lanes are enabled once, on the transition from no active
>> + * sink streams to at least one. 
> on the transition to an active state.
> 
> The sink stream(s) are propagated upstream to
>> + * the sensor only for the subset that isn't already active,
> only for streams which are inactive
> 
>   so a stream

Thanks that will be incorporated in next patchset.

>> + * that's already running is never redundantly re-propagated.
>> + *
>> + * CSIPHY is only ever linked to a single entity on its source pad, and that
>> + * entity is responsible for only enabling a stream on this pad while it
>> + * itself still needs it, so no cross-consumer refcounting is needed here.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csiphy_pad_enable_streams(struct v4l2_subdev *sd,
>> +				     struct v4l2_subdev_state *state,
>> +				     u32 pad, u64 streams_mask)
>> +{
>> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
>> +	struct media_pad *remote_pad =
>> +		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
>> +	bool first_arrival = !csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK];
>> +	u64 sink_streams, propagate_mask;
>> +	int ret;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
>> +						       &streams_mask);
>> +
>> +	propagate_mask = sink_streams & ~csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK];
>> +
>> +	if (first_arrival) {
>> +		ret = csiphy_set_stream(sd, 1);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] |= sink_streams;
>> +	csiphy->enabled_streams[pad] |= streams_mask;
>> +
>> +	if (propagate_mask && remote_pad) {
> 
> When is remote pad false ?

Never, but i get some internal AI bot review comments so i have added that check, i agree it can be removed.

> 
>> +		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
>> +						 remote_pad->index, propagate_mask);
>> +		if (ret) {
>> +			csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] &= ~propagate_mask;
>> +			csiphy->enabled_streams[pad] &= ~streams_mask;
>> +
>> +			if (first_arrival)
>> +				csiphy_set_stream(sd, 0);
>> +
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * csiphy_pad_disable_streams - Disable one or more streams on the source pad
>> + * @sd: CSIPHY V4L2 subdevice
>> + * @state: V4L2 subdevice state
>> + * @pad: Pad number
>> + * @streams_mask: Bitmask of streams to disable
>> + *
>> + * The shared D-PHY lanes, and the propagation to the sensor, are only torn
>> + * down once no sink stream is referenced by any source pad any more.
>> + *
>> + * CSIPHY is only ever linked to a single entity on its source pad, and that
>> + * entity is responsible for only disabling a stream on this pad once it no
>> + * longer needs it, so no cross-consumer refcounting is needed here.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csiphy_pad_disable_streams(struct v4l2_subdev *sd,
>> +				      struct v4l2_subdev_state *state,
>> +				      u32 pad, u64 streams_mask)
>> +{
>> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
>> +	struct media_pad *remote_pad =
>> +		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
>> +	u64 sink_streams;
>> +	int ret = 0;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
>> +						       &streams_mask);
>> +
>> +	csiphy->enabled_streams[pad] &= ~streams_mask;
>> +	csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK] &= ~sink_streams;
>> +
>> +	if (sink_streams && remote_pad)
>> +		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
>> +						  remote_pad->index, sink_streams);
> 
> I'm again questioning when the remote_pad is false i.e. can a PHY have a 
> sink_stream without a remote ?

Never, it will be removed...

>> +
>> +	if (!csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK]) {
>> +		int stream_ret = csiphy_set_stream(sd, 0);
>> +
>> +		if (!ret)
>> +			ret = stream_ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * __csiphy_get_format - Get pointer to format structure
>>    * @csiphy: CSIPHY device
>> @@ -743,6 +849,71 @@ static int csiphy_link_setup(struct media_entity *entity,
>>   	return 0;
>>   }
>>   
>> +static int csiphy_init_state(struct v4l2_subdev *sd,
>> +			     struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_subdev_route routes[] = {
>> +		{
>> +			.sink_pad = MSM_CSIPHY_PAD_SINK,
>> +			.sink_stream = 0,
>> +			.source_pad = MSM_CSIPHY_PAD_SRC,
>> +			.source_stream = 0,
>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +		},
>> +	};
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = ARRAY_SIZE(routes),
>> +		.routes = routes,
>> +	};
>> +
>> +	/*
>> +	 * CSIPHY is a transparent D-PHY with no per-VC demux, so every sink
>> +	 * stream (VC) a multi-stream sensor may drive must pass straight
>> +	 * through as the same source stream, or downstream link validation
>> +	 * (e.g. against CSID's multi-pad sink) will flag it as dangling. A
>> +	 * multi-VC sensor is supported by userspace adding further routes via
>> +	 * .set_routing; this default covers the common single-VC case.
>> +	 */
> 
> Drop the references to DPHY - people are actively working on CPHY support.

Noted it will be removed.

> 
>> +	return v4l2_subdev_set_routing(sd, state, &routing);
>> +}
>> +
>> +/*
>> + * csiphy_set_routing - Set routing for the CSIPHY subdev
>> + * @sd: CSIPHY V4L2 subdevice
>> + * @state: V4L2 subdevice state
>> + * @which: Type of format state (V4L2_SUBDEV_FORMAT_ACTIVE or TRY)
>> + * @routing: Routing table to set
>> + *
>> + * CSIPHY is a transparent D-PHY with no per-VC demux, so every route must
>> + * pass a sink stream straight through as the same source stream.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csiphy_set_routing(struct v4l2_subdev *sd,
>> +			      struct v4l2_subdev_state *state,
>> +			      enum v4l2_subdev_format_whence which,
>> +			      struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csiphy->enabled_streams[MSM_CSIPHY_PAD_SINK])
>> +		return -EBUSY;
> 
> Can this happen ?
> 
> dev_err() ?

I need to check the core but there should be protection to not be able to set the routing while stream is active.
If that is the case i will remove this check.

> 
>> +
>> +	for (i = 0; i < routing->num_routes; i++)
>> +		if (routing->routes[i].sink_stream != routing->routes[i].source_stream)
>> +			return -EINVAL;
>> +
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_NO_STREAM_MIX |
>> +					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_subdev_set_routing(sd, state, routing);
>> +}
>> +
>>   static const struct v4l2_subdev_core_ops csiphy_core_ops = {
>>   	.s_power = csiphy_set_power,
>>   };
>> @@ -764,10 +935,35 @@ static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
>>   	.pad = &csiphy_pad_ops,
>>   };
>>   
>> +static const struct v4l2_subdev_pad_ops csiphy_streams_pad_ops = {
>> +	.enum_mbus_code = csiphy_enum_mbus_code,
>> +	.enum_frame_size = csiphy_enum_frame_size,
>> +	.get_fmt = csiphy_get_format,
>> +	.set_fmt = csiphy_set_format,
>> +	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
>> +	.set_routing = csiphy_set_routing,
>> +	.enable_streams = csiphy_pad_enable_streams,
>> +	.disable_streams = csiphy_pad_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops csiphy_streams_video_ops = {
>> +	.s_stream = v4l2_subdev_s_stream_helper,
>> +};
>> +
>> +static const struct v4l2_subdev_ops csiphy_streams_v4l2_ops = {
>> +	.core = &csiphy_core_ops,
>> +	.pad = &csiphy_streams_pad_ops,
>> +	.video = &csiphy_streams_video_ops,
>> +};
>> +
>>   static const struct v4l2_subdev_internal_ops csiphy_v4l2_internal_ops = {
>>   	.open = csiphy_init_formats,
>>   };
>>   
>> +static const struct v4l2_subdev_internal_ops csiphy_streams_internal_ops = {
>> +	.init_state = csiphy_init_state,
>> +};
>> +
>>   static const struct media_entity_operations csiphy_media_ops = {
>>   	.link_setup = csiphy_link_setup,
>>   	.link_validate = v4l2_subdev_link_validate,
>> @@ -786,11 +982,16 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>>   	struct v4l2_subdev *sd = &csiphy->subdev;
>>   	struct media_pad *pads = csiphy->pads;
>>   	struct device *dev = csiphy->camss->dev;
>> +	bool streams_api = csiphy->res->streams_enable;
> 
> Is this really a feature of the CSIPHY though ?
> 
> Its the CSI decoder that has to program registers in itself to trap the 
> appropriate VC and route it.
> 
> Its a supported feature for a particular SoC.
> 
> This flag should live in struct camss_resources and you have a pointer o 
> that structure in this routine anyway so..

Hmm yes there should not be separate flag for each sub-device becouse either the whole topolgy
supports multistream or not. I will move the flag in camss_resourcess. Thanks 

> 
>>   	int ret;
>>   
>> -	v4l2_subdev_init(sd, &csiphy_v4l2_ops);
>> -	sd->internal_ops = &csiphy_v4l2_internal_ops;
>> +	v4l2_subdev_init(sd, streams_api ? &csiphy_streams_v4l2_ops
>> +					      : &csiphy_v4l2_ops);
>> +	sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
>> +					: &csiphy_v4l2_internal_ops;
>>   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	if (streams_api)
>> +		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
>>   	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>>   		 MSM_CSIPHY_NAME, csiphy->id);
>>   	sd->grp_id = CSIPHY_GRP_ID;
>> @@ -813,12 +1014,27 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>>   		return ret;
>>   	}
>>   
>> +	if (streams_api) {
>> +		ret = v4l2_subdev_init_finalize(sd);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
>> +			goto err_media_entity_cleanup;
>> +		}
>> +	}
>> +
>>   	ret = v4l2_device_register_subdev(v4l2_dev, sd);
>>   	if (ret < 0) {
>>   		dev_err(dev, "Failed to register subdev: %d\n", ret);
>> -		media_entity_cleanup(&sd->entity);
>> +		goto err_v4l2_subdev_cleanup;
>>   	}
>>   
>> +	return 0;
>> +
>> +err_v4l2_subdev_cleanup:
>> +	v4l2_subdev_cleanup(sd);
>> +err_media_entity_cleanup:
>> +	media_entity_cleanup(&sd->entity);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -829,5 +1045,6 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>>   void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
>>   {
>>   	v4l2_device_unregister_subdev(&csiphy->subdev);
>> +	v4l2_subdev_cleanup(&csiphy->subdev);
>>   	media_entity_cleanup(&csiphy->subdev.entity);
>>   }
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
>> index 9d9657b82f74..e55c098dbe67 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
>> @@ -84,6 +84,7 @@ struct csiphy_hw_ops {
>>   
>>   struct csiphy_subdev_resources {
>>   	u8 id;
>> +	bool streams_enable;
>>   	const struct csiphy_hw_ops *hw_ops;
>>   	const struct csiphy_formats *formats;
>>   };
>> @@ -114,6 +115,7 @@ struct csiphy_device {
>>   	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
>>   	const struct csiphy_subdev_resources *res;
>>   	struct csiphy_device_regs *regs;
>> +	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
>>   };
>>   
>>   struct camss_subdev_resources;
> 

