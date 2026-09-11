Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A8B35675C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137236; cv=none; b=IEitRIl6Q/Jjhw+7kTDP0nNNaNdu0sB8cTue1YiEJV4bDGFfpMTe/SvBKV1HcpL8tPjOs91iOupXqNfmvQij6Q4Kbb5RhfHX7YdL+CjWWIsEAIl2Sg08bmeTAiILJeOtnuUXYahuAp8kYk0S2ZHSEXBiHNskudkZRSYPi99Y1D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137236; c=relaxed/simple;
	bh=cJ3zJdyQLESWJxyl8LoiF1RSpFCEAxC+0QEhnvoAq08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAo/vg0fan56WzHDY0ygXqQMb7qb07pLnV0u10n1/F+bSEMDdH9TQIub8aV8mMREc21Qm82iCFNwkWFNWchlHFCr2t8nkc7wAbaEiJLF6iu4vDwQiskolO2q250JEikGq6gokhr0O4ses8xZdETVHLmxGgHQKxPU8yKqDXf6wjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2K+b9we; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjVDG0dJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2K+b9we";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjVDG0dJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjlHZ1099007
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/f/3hDXPEmkpUjn36wZnVHUKAQU6nEKOyGFkLsJQTs=; b=L2K+b9weGNfW8ZZA
	mf6+iP7ThBlkK3oW/Zr48D4srLa0qNaauy5oucyUAuzJxFCF86ZmbGfLViWz7YiS
	UqZQfzZkaFqqskY9BppvkPq0dWpUIG6naVTbgvadPnzSUXc4Yz8wEBWAGu+GOLOG
	3rAwnyZaqPrXaGZ2MJeBeQqLc4rCnlmLkJkZPNmKvVmUvX7k061ItJoFIaV4mfdY
	+kdWERgrmtY5KeGKKh5Fx8jP4X6nh2O1c6O9lLMBcWOtdG/1Eo4K2s/yr5qQN7bn
	ADKk9ZYchp0LJqeQ1pehcq18Rt9o8e2MfArSfhxBZs7xt1YL4eg35/Pkaf/qDlDD
	UZO3Bw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8j6e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:33:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so201392385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789137232; x=1789742032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/f/3hDXPEmkpUjn36wZnVHUKAQU6nEKOyGFkLsJQTs=;
        b=YjVDG0dJ3fvgxZcNmT1EF2vlohKhKaMWKgH0nzE/mWdzpJ1k0386BOAcjYjZmR0087
         kISWDO656ukWDzLWsxLkTUo/3pueeDsxQhnjMngGNDoo3YuPkxDlNDf315iv91br4Qnx
         Ch3k5AAamt8wci6D4jhSwiGBPaErTbI0uo1P2SRwhr9onpnrAe1k0BAhIY59ke6vu6Qh
         v/NBh7Gc6Uj+tKwiFkZcllW4Iw5KpxzKNQEMCCrI2pus2n15vOpmJtXVUZJTuI/vyY5S
         7rHlXQCv39O2NyuQdN18Z1SuVl+frR0wlFoZXo2JWlRMU1pRhBUIfnt55iKeh1VGZgmb
         EIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137232; x=1789742032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/f/3hDXPEmkpUjn36wZnVHUKAQU6nEKOyGFkLsJQTs=;
        b=hRQ83O20lVXk1aE7wWbtkzypE2/S75SvMi3kPMemHZrqmfkre2d3++InVHgOhN7zBr
         AOI9R8m32BXrgzYpfCYPXcwMmGYoqvgbFvMiRnK0fgj2dLkj5fDVYDh7ox7/oy96+Mkh
         rCs4inE/y1g/3VsO9O69oBDe5wC63iPm+lnfemrfhof3c+z9PJQaEKwKqCOMuYGFgSof
         /xrITJkc15uYs7Qv9IhB3IHtf2+r8BdpPuDXWpHCfUEDA/qx/QNvTP9CuOaGlI5wFq+a
         maG7mnEhktT0KCIobury9/EULIEx/Zku3E3qSm2M3tDpsn2OqyNRw61kZshwESn9CEkt
         qkEw==
X-Forwarded-Encrypted: i=1; AKwUvByW9o3bBAU8Sgd1z1x7+rsBHpoyDF1jZmHN725hol6PMI+xRf0h2cjhHtwlNnTXCySWZEEVSU218IYIUe4=@vger.kernel.org
X-Gm-Message-State: AFuF++kB390ljcW6nvqFnOIL2mmxdYNrbIfV+8kRIV+1sCx+4uEoK+5Q
	VqLBEQjXBjHFXZXADZsNuaDVnhz/FdfOmqD9FJHWf+CRGo2uxeyz0CDLpCOvOOzPUseaWnz0Y4E
	wS2dP6F7ROelp0h5AyeTKVd8gzt0OdbiPMuJz9VNxueBc7k6S9t0BFWrLjs0HTsw4fYA=
X-Gm-Gg: AYBFou3fP9AQo3gY9a+MCkAUdpo2PpCVvS8JOnod7YxYy7wsgV4KpOct3UcYR/sozSQ
	s2h+ztH3aPUecxlXx+cNsTgs3M0I2IaMYLLdMgyttPmDkA92ucFkrjia1hOW1jrlNSOUUA//rQz
	BZni3gjx2m2ncfHJE6ZmJPN+ERw0dVEDAS8p1sU+GlZHPPvP1VSXLackWmtjjGTK2x6HmfaY2Mw
	UtZV/08/mBzebalJ4aK2fObLU9RqGmBXcs6QXMEBnv0Hrgz2yKgGRt/0iECl8Ffww1EDm5tOfZz
	genrgp+jQGLjQ0Tvl6hfSsmSSmsLD0muEvxu8DAPsMu94Xp+/r4BMVLMwP1H8Ua2sBwgXW8lUfL
	cvzFunTzT1iyHggV4PJSR1qoJYdahNPZoX9qrtitV
X-Received: by 2002:a05:620a:6892:b0:939:d6a1:234 with SMTP id af79cd13be357-939d7eb1d0amr1197582285a.18.1789137231600;
        Fri, 11 Sep 2026 07:33:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6892:b0:939:d6a1:234 with SMTP id af79cd13be357-939d7eb1d0amr1197571885a.18.1789137230924;
        Fri, 11 Sep 2026 07:33:50 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62231360sm44266545e9.4.2026.09.11.07.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:33:49 -0700 (PDT)
Message-ID: <5cf6f2d9-bc9f-4d86-8318-b040d7a6839f@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:33:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: qcom: camss: Add streams API support in CSID
 subdevice
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
 <20260911062213.195007-5-gjorgji.rosikopulos@oss.qualcomm.com>
 <f1570f7e-c895-433e-996d-973a96a9afef@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <f1570f7e-c895-433e-996d-973a96a9afef@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sAwD1CYp1GLZ7go2CgMK0CWMNF6Fzb8D
X-Proofpoint-ORIG-GUID: sAwD1CYp1GLZ7go2CgMK0CWMNF6Fzb8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMyBTYWx0ZWRfX6Mo12R25B2/W
 9DdysjUnjMbgnlU4383vJWVKa3r3EFoRKqpEN+z4qA9mt2ctbnjMJabIc0RTLQD5bt0x+fmB92T
 ny9xwb9r2cFuZZ6P5+xNJW4CfGLaMpABOVmSoSQoBNCtYAsxOT7+OxTojvBfr1BjPG+1h+x77b/
 NMdmMf8zZzVv0TD97qrC/9tqKHtPBMOKfdp0s/DxzP+17cLC93adJt7fQ5l00KrLx6roU6umk+p
 lI56g7UoLTOPWqeRPDOSPAjy1Tj5yINSFZyS+KDQxxVeUX2QdS5q+w9HhDwyvgjExYaFiKGtq+z
 eQIBi74nt18nOsBeQrZ9akb11OjclzSw3bUthGi2qVVjQREC+r/zkuThCpcg2jZrEsgKd5c5oUI
 hiFIEyygaltfXLPVZ+86j9ZrBoZofQJnyXRNKpjBS/gQX/QJ3ROfBgBgAmW+D0P5/vhfaFX+luS
 7oMq19vFYvQV7u8xVNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMyBTYWx0ZWRfX7a6j12LMTjhy
 IaN13EFEzvXJx/FbqQoC8DF+Nt6B7xEeydPkz+RNtUrRfq6FjR9ekM7YO6DWQhS3h73EkPHmQhF
 M15ukysrS8tlAqEWbd5d54lR3OhEFeo=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa41151 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aa__H5kD5iCe5lwQuFMA:9 a=Ez32RhJvJVYJKobC:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110203

Hi Bryan,

Thanks for the review,

On 9/11/2026 2:35 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Add the V4L2 subdev streams API to the CSID driver: per-source-pad
>> enable/disable_streams pad ops, VC/DT discovery via get_frame_desc on
>> the remote sink pad, and a routing table that routes a single incoming
>> sink stream to every source pad by default (remappable via
>> set_routing for multi-VC sensors).
>>
>> Active streams are tracked per pad via a per-pad enabled_streams[]
>> bitmask, so that enable/disable_streams correctly propagates to the
>> CSIPHY only on first arrival/last departure of a sink stream, and
>> multiple source-pad consumers can share a single propagated sink
>> stream without redundant or colliding propagation.
>>
>> csid_init_state() caps the number of default routes to
>> MSM_CSID_MAX_SRC_STREAMS - 1 for non-lite CSIDs, matching the 3 usable
>> RDI pads on full-IFE CSIDs (the 4th/pix pad is non-functional).
> 
> That makes sense.
> 
>> msm_csid_register_entity() mirrors the same is_lite check for the pad
>> count itself, so non-lite CSIDs no longer register a pix source pad
>> that no route ever targets.
> 
> Nope. I'll send a different solution. Fixing the non-functional and 
> incorrectly mapped pix is a Fixes: level thing not a workaround it 
> inline thing.
> 
> Just drop the workaround and assume any CSID you are working with 
> actually works and is valid.

Ok will do that in the next patchset.

> 
>> csid_pad_enable_streams() rejects enabling with -ENOLINK when there is
>> no remote sink link and the test generator is disabled, matching the
>> equivalent check the legacy csid_set_stream() already performs.
>>
>> msm_csid_register_entity() assigns the ctrl handler's lock as the
>> subdev's state_lock before v4l2_subdev_init_finalize(), when the test
>> pattern control is present. Without this, the test-pattern S_CTRL
>> handler and the streams API's active-state accessors serialize on two
>> independent locks despite both touching csid->testgen.enabled,
>> allowing a concurrent S_CTRL(TEST_PATTERN) and stream enable/disable to
>> race.
> 
> Actually this reminds me of the first go at VCs in CAMSS which ended up 
> getting rolled back.
> 
> How will this be tested ? Is the TPG capable of generating different VCs ?

TPG can not produce simultaneous streams with different VC's so can not be
used for verification. I have setup for verification but checking if can
be shared publicly. I agree having implementation without a way to test and
verify by the maintaner is same as having nothing...

> 
> _That_ would be very useful.
> 
>>
>> This is opt-in per CSID instance via the new streams_enable resource
>> flag; no platform sets it yet, so CSIDs continue to use the legacy
>> non-streams subdev ops unchanged.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>   .../media/platform/qcom/camss/camss-csid.c    | 494 +++++++++++++++++-
>>   .../media/platform/qcom/camss/camss-csid.h    |   2 +
>>   2 files changed, 491 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>> index 48459b46a981..ce4b07c0c1c2 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -842,7 +842,7 @@ static void csid_try_format(struct csid_device *csid,
>>   
>>   		break;
>>   
>> -	case MSM_CSID_PAD_SRC:
>> +	default:
> 
> Why subtract the case ?
> Just add the default:
> 
> Also I don't think that code change is anything todo with adding streams 
> support to CSID.
> 
> Separate patches for separate things.

I agree somehow this was included, it will be moved to separate patch.

> 
>>   		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
>>   		    csid->testgen_mode->cur.val == 0) {
>>   			/* Test generator is disabled, */
>> @@ -1338,10 +1338,476 @@ static const struct v4l2_subdev_ops csid_v4l2_ops = {
>>   	.pad = &csid_pad_ops,
>>   };
>>   
>> +/*
>> + * csid_get_stream_csi2_desc - Discover the virtual channel and data type
>> + *			       used by a given sink stream, from an
>> + *			       already-fetched frame descriptor
>> + * @frame_desc: Frame descriptor fetched via .get_frame_desc from the remote
>> + *		subdev linked on the sink pad
>> + * @sink_stream: Sink-side stream number to look up
>> + * @desc_csi2: Returns the discovered virtual channel/data type on success
>> + *
>> + * A frame descriptor with a single entry means the remote only exposes one
>> + * stream (e.g. a single-VC sensor), which feeds every CSID source pad, so
>> + * that entry is used regardless of @sink_stream.
>> + *
>> + * Return true if a matching entry was found, false otherwise
>> + */
>> +static bool csid_get_stream_csi2_desc(struct v4l2_mbus_frame_desc *frame_desc,
>> +				      u32 sink_stream,
>> +				      struct v4l2_mbus_frame_desc_entry_csi2 *desc_csi2)
>> +{
>> +	unsigned int i;
>> +
>> +	if (frame_desc->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2 || !frame_desc->num_entries)
>> +		return false;
>> +
>> +	if (frame_desc->num_entries == 1) {
>> +		*desc_csi2 = frame_desc->entry[0].bus.csi2;
>> +		return true;
>> +	}
> 
> You can drop that check entirely, the below loop will do exactly the 
> same thing for num_entires == 1..

I Agree, will be done in next patchset.

> 
>> +
>> +	for (i = 0; i < frame_desc->num_entries; i++) {
>> +		if (frame_desc->entry[i].stream == sink_stream) {
>> +			*desc_csi2 = frame_desc->entry[i].bus.csi2;
>> +			return true;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +/*
>> + * csid_get_stream_vc_dt - Discover the virtual channel and data type to
>> + *			   program for a given sink pad/stream, falling back
>> + *			   to @format_dt when no frame descriptor is available
>> + * @csid: CSID device
>> + * @state: V4L2 subdevice state
>> + * @remote_pad: Remote pad linked on the CSID sink pad, or NULL if unlinked
>> + * @pad: Source pad number the caller is enabling a stream on
>> + * @format_dt: Data type derived from the sink format, used as a fallback
>> + *	       and sanity-checked against the discovered data type
>> + *
>> + * Return the discovered virtual channel/data type, or {0, @format_dt} if
>> + * not discovered
>> + */
>> +static struct v4l2_mbus_frame_desc_entry_csi2
>> +csid_get_stream_vc_dt(struct csid_device *csid, struct v4l2_subdev_state *state,
>> +		      struct media_pad *remote_pad, u32 pad, u8 format_dt)
>> +{
>> +	struct v4l2_mbus_frame_desc_entry_csi2 desc_csi2 = { .dt = format_dt };
>> +	struct v4l2_mbus_frame_desc fd = { };
>> +	u32 sink_stream;
>> +
>> +	if (!remote_pad ||
>> +	    v4l2_subdev_call(media_entity_to_v4l2_subdev(remote_pad->entity),
>> +			     pad, get_frame_desc, remote_pad->index, &fd))
>> +		return desc_csi2;
>> +
> 
> if (thing ||
>      some_other_thing) {
> 	return desc_csi2;
> }
> 

I agree that will be fixed.

>> +	if (v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0, NULL, &sink_stream))
>> +		return desc_csi2;
>> +
>> +	if (!csid_get_stream_csi2_desc(&fd, sink_stream, &desc_csi2)) {
>> +		dev_warn(csid->camss->dev,
>> +			 "Failed to find CSI2 descriptor for sink stream %u, using vc=%u dt=%u\n",
>> +			 sink_stream, desc_csi2.vc, desc_csi2.dt);
>> +		return desc_csi2;
> 
> Is this an error it seems like it should be ?

I was also not sure. Maybe is better to mark as an error anyways the streaming will likely to not have
calid vc/dt.

> 
>> +	}
>> +
>> +	if (desc_csi2.dt != format_dt)
>> +		dev_warn(csid->camss->dev,
>> +			 "Sink stream %u frame desc dt=%u differs from format dt=%u, using dt=%u\n",
>> +			 sink_stream, desc_csi2.dt, format_dt, desc_csi2.dt);
>> +
>> +	return desc_csi2;
> 
> I'd return a pointer here.

Well the structure has only two u8 fields i think that passing pointer as argument or allocating and returing
pointer will likely be to match. But if you think is better i can switch to pointer.

> 
>> +}
>> +
>> +/*
>> + * csid_pad_enable_streams - Enable one or more streams on a source pad
>> + * @sd: CSID V4L2 subdevice
>> + * @state: V4L2 subdevice state
>> + * @pad: Pad number
>> + * @streams_mask: Bitmask of v4l2 streams to enable
>> + *
>> + * The v4l2 core only calls this on a source pad (v4l2_subdev_enable_streams()
>> + * rejects sink pads with -EOPNOTSUPP before reaching the driver), so @pad is
>> + * not checked here. Each source pad only ever carries stream 0.
>> + *
>> + * The shared sink stream(s) are propagated upstream only once, on the
>> + * transition from no active sink streams to at least one, so that a second
>> + * consumer of the same shared sink stream never triggers a second, redundant
>> + * propagation to the sensor. The Rx front-end is likewise only configured
>> + * once, on that same transition.
>> + *
>> + * Return 0 on success, -ENOLINK if there is no remote sink link and the test
>> + * generator is disabled, or another negative error code otherwise
>> + */
>> +static int csid_pad_enable_streams(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state,
>> +				   u32 pad, u64 streams_mask)
>> +{
>> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
>> +	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>> +	struct media_pad *remote_pad = media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
>> +	unsigned int hw_port = pad - MSM_CSID_PAD_FIRST_SRC;
>> +	const struct csid_format_info *format;
>> +	struct v4l2_mbus_frame_desc_entry_csi2 desc_csi2;
>> +	u64 sink_streams, propagate_mask;
>> +	int ret;
>> +
>> +	if (!csid->testgen.enabled && !remote_pad)
>> +		return -ENOLINK;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSID_PAD_SINK,
>> +						       &streams_mask);
>> +
>> +	if (!csid->enabled_streams[MSM_CSID_PAD_SINK]) {
>> +		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
>> +			/*
>> +			 * sd->state_lock is aliased to csid->ctrls.lock, and is
>> +			 * already held here by the v4l2_subdev_enable_streams()
>> +			 * caller, so use the lock-free variant to avoid
>> +			 * self-deadlocking on the same mutex.
>> +			 */
>> +			ret = __v4l2_ctrl_handler_setup(&csid->ctrls);
>> +			if (ret < 0) {
>> +				dev_err(csid->camss->dev,
>> +					"could not sync v4l2 controls: %d\n", ret);
>> +				return ret;
>> +			}
>> +		}
>> +
>> +		hw_ops->configure_rx(csid);
>> +	}
>> +
>> +	/* Sink streams already active elsewhere don't need re-propagating. */
>> +	propagate_mask = sink_streams & ~csid->enabled_streams[MSM_CSID_PAD_SINK];
>> +	csid->enabled_streams[MSM_CSID_PAD_SINK] |= sink_streams;
>> +	csid->enabled_streams[pad] |= streams_mask;
>> +
>> +	format = csid_get_fmt_entry(csid->res->formats->formats,
>> +				    csid->res->formats->nformats,
>> +				    csid->fmt[pad].code);
>> +	desc_csi2 = csid_get_stream_vc_dt(csid, state, remote_pad, pad, format->data_type);
> 
> You're doing an implict memcpy() here - just return a pointer.

Yes it is just two u8 fields vc and dt.

> 
> And I really wonder based on the activity within the method why 
> returning an error isn't part of this ?

Well yet to be discussed the get_frame_desc is not standartazied across the sensors,
What we have today.
If sensor supports get_frame_desc it will return the vc/dt per stream. You also need
to validate if the dt reported is matching with the dt converted from mbus format.

If sensor does not support get_frame_desc you need to asume that vc is 0 
and get the dt based on the mbus format. The idea of that function is to hide that
and return vc/dt regardless if sensor supports that op or not.

So if you think that having return and passing pointer for desc_csi2 is 
more portable for future implementations and extensions i will switch to that.

> 
>> +
>> +	hw_ops->enable_stream(csid, hw_port, desc_csi2.vc, desc_csi2.dt);
> 
> I commented elsewhere should this be void or int ?
> 
> I'm not suggesting either more asking rhetorically.

Not sure either. We are just writing the registers, if there is a way to validate that
streaming is actually started and having return code yes make sense to have return code,
but with the current implementation i dont see that is the case.

> 
>> +
>> +	if (propagate_mask && remote_pad) {
>> +		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
>> +						 remote_pad->index, propagate_mask);
>> +		if (ret) {
>> +			csid->enabled_streams[MSM_CSID_PAD_SINK] &= ~propagate_mask;
>> +			csid->enabled_streams[pad] &= ~streams_mask;
>> +
>> +			hw_ops->disable_stream(csid, hw_port);
>> +
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * csid_sink_streams_in_use - Compute the subset of sink streams still
>> + *			      referenced by a source pad other than @pad
>> + * @csid: CSID device
>> + * @state: V4L2 subdevice state
>> + * @pad: Source pad to exclude from the check
>> + * @sink_streams: Candidate sink streams to check
>> + *
>> + * Return the subset of @sink_streams still referenced by some other source
>> + * pad
>> + */
>> +static u64 csid_sink_streams_in_use(struct csid_device *csid, struct v4l2_subdev_state *state,
>> +				    u32 pad, u64 sink_streams)
>> +{
>> +	u64 in_use = 0;
>> +	unsigned int i;
>> +
>> +	for (i = MSM_CSID_PAD_FIRST_SRC; i < MSM_CSID_PADS_NUM; i++) {
>> +		u64 other_streams = csid->enabled_streams[i];
>> +		u64 other_sink_streams;
>> +
>> +		if (i == pad)
>> +			continue;
>> +
>> +		other_sink_streams = v4l2_subdev_state_xlate_streams(state, i, MSM_CSID_PAD_SINK,
>> +								     &other_streams);
>> +		in_use |= sink_streams & other_sink_streams;
>> +	}
>> +
>> +	return in_use;
>> +}
>> +
>> +/*
>> + * csid_pad_disable_streams - Disable one or more streams on a source pad
>> + * @sd: CSID V4L2 subdevice
>> + * @state: V4L2 subdevice state
>> + * @pad: Pad number
>> + * @streams_mask: Bitmask of v4l2 streams to disable
>> + *
>> + * The v4l2 core only calls this on a source pad (v4l2_subdev_disable_streams()
>> + * rejects sink pads with -EOPNOTSUPP before reaching the driver), so @pad is
>> + * not checked here. Each source pad only ever carries stream 0.
>> + *
>> + * A sink stream is only disabled, and propagated upstream to disable it there
>> + * too, once no source pad references it any more.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csid_pad_disable_streams(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    u32 pad, u64 streams_mask)
>> +{
>> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
>> +	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>> +	struct media_pad *remote_pad = media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
>> +	unsigned int hw_port = pad - MSM_CSID_PAD_FIRST_SRC;
>> +	u64 sink_streams, disable_sink_streams;
>> +	int ret = 0;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSID_PAD_SINK,
>> +						       &streams_mask);
>> +
>> +	/* Keep a sink stream active as long as any other source pad still uses it. */
>> +	disable_sink_streams = sink_streams &
>> +				~csid_sink_streams_in_use(csid, state, pad, sink_streams);
>> +
>> +	if (disable_sink_streams && remote_pad) {
>> +		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
>> +						  remote_pad->index, disable_sink_streams);
>> +		if (ret)
>> +			dev_err(csid->camss->dev,
>> +				"Failed to disable stream on remote pad: %d\n", ret);
>> +	}
>> +
>> +	hw_ops->disable_stream(csid, hw_port);
>> +
>> +	csid->enabled_streams[pad] &= ~streams_mask;
>> +	csid->enabled_streams[MSM_CSID_PAD_SINK] &= ~disable_sink_streams;
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_mbus_framefmt csid_default_format = {
>> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +	.width = 1920,
>> +	.height = 1080,
>> +	.field = V4L2_FIELD_NONE,
>> +	.colorspace = V4L2_COLORSPACE_SRGB,
>> +};
>> +
>> +/*
>> + * csid_set_routing - Handle setting of routing table
>> + * @sd: CSID V4L2 subdevice
>> + * @state: V4L2 subdevice state
>> + * @which: TRY or ACTIVE routing
>> + * @routing: Routing table to set
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csid_set_routing(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_state *state,
>> +			    enum v4l2_subdev_format_whence which,
>> +			    struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csid->enabled_streams[MSM_CSID_PAD_SINK])
>> +		return -EBUSY;
>> +
>> +	for (i = 0; i < routing->num_routes; i++)
>> +		if (routing->routes[i].source_stream != 0)
>> +			return -EINVAL;
>> +
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX |
>> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING |
>> +					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &csid_default_format);
>> +}
>> +
>> +/*
>> + * __csid_get_stream_format - Get pointer to per-stream format structure
>> + * @csid: CSID device
>> + * @sd_state: V4L2 subdev state
>> + * @pad: pad from which format is requested
>> + * @stream: stream from which format is requested
>> + * @which: TRY or ACTIVE format
>> + *
>> + * Same as __csid_get_format(), but honors @stream for TRY-state lookups.
>> + * For ACTIVE state, csid->fmt[] is indexed by pad + stream. @stream is
>> + * always 0 and @pad selects the RDI channel (0-3).
>> + *
>> + * Return pointer to TRY or ACTIVE format structure
>> + */
>> +static struct v4l2_mbus_framefmt *
>> +__csid_get_stream_format(struct csid_device *csid,
>> +			 struct v4l2_subdev_state *sd_state,
>> +			 unsigned int pad, u32 stream,
>> +			 enum v4l2_subdev_format_whence which)
>> +{
>> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
>> +		return v4l2_subdev_state_get_format(sd_state, pad, stream);
>> +
>> +	if (pad == MSM_CSID_PAD_SINK)
>> +		return &csid->fmt[MSM_CSID_PAD_SINK];
>> +
>> +	return &csid->fmt[pad + stream];
>> +}
>> +
>> +/*
>> + * csid_streams_get_format - Handle get format by pads subdev method
>> + * @sd: CSID V4L2 subdevice
>> + * @sd_state: V4L2 subdev state
>> + * @fmt: pointer to v4l2 subdev format structure
>> + *
>> + * Return -EINVAL or zero on success
>> + */
>> +static int csid_streams_get_format(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *sd_state,
>> +				   struct v4l2_subdev_format *fmt)
>> +{
>> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
>> +	struct v4l2_mbus_framefmt *format;
>> +
>> +	format = __csid_get_stream_format(csid, sd_state, fmt->pad, fmt->stream, fmt->which);
>> +	if (!format)
>> +		return -EINVAL;
>> +
>> +	fmt->format = *format;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * csid_streams_set_format - Handle set format by pads subdev method
>> + * @sd: CSID V4L2 subdevice
>> + * @sd_state: V4L2 subdev state
>> + * @fmt: pointer to v4l2 subdev format structure
>> + *
>> + * Return -EINVAL or zero on success
>> + */
>> +static int csid_streams_set_format(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *sd_state,
>> +				   struct v4l2_subdev_format *fmt)
>> +{
>> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
>> +	struct v4l2_mbus_framefmt *format;
>> +	struct v4l2_subdev_route *route;
>> +
>> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && csid->enabled_streams[MSM_CSID_PAD_SINK])
>> +		return -EBUSY;
>> +
>> +	format = __csid_get_stream_format(csid, sd_state, fmt->pad, fmt->stream, fmt->which);
>> +	if (!format)
>> +		return -EINVAL;
>> +
>> +	csid_try_format(csid, sd_state, fmt->pad, &fmt->format, fmt->which);
>> +	*format = fmt->format;
>> +
>> +	/* Propagate the format from the sink stream to every source stream it feeds */
>> +	for_each_active_route(&sd_state->routing, route) {
>> +		struct v4l2_mbus_framefmt *src_format;
>> +
>> +		if (route->sink_pad != fmt->pad || route->sink_stream != fmt->stream)
>> +			continue;
>> +
>> +		src_format = __csid_get_stream_format(csid, sd_state, route->source_pad,
>> +						      route->source_stream, fmt->which);
>> +		if (!src_format)
>> +			continue;
>> +
>> +		*src_format = fmt->format;
>> +		csid_try_format(csid, sd_state, route->source_pad, src_format, fmt->which);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Why do we need a full new set of get-format and set-format ?
> 
> "Feels" like this could wrapper the existing code.

It can, for stream api you can have in one pad multiple streams and each stream
can have different format. In csid case becouse we have one stream per pad existing
API can be reused. If we decide to have muiltiple streams per source pad then we need
to intrudoce this function. I am ok to reuse existing function with some small change.

> 
>> +
>> +static const struct v4l2_subdev_pad_ops csid_streams_pad_ops = {
>> +	.enum_mbus_code = csid_enum_mbus_code,
>> +	.enum_frame_size = csid_enum_frame_size,
>> +	.get_fmt = csid_streams_get_format,
>> +	.set_fmt = csid_streams_set_format,
>> +	.set_routing = csid_set_routing,
>> +	.enable_streams = csid_pad_enable_streams,
>> +	.disable_streams = csid_pad_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops csid_streams_video_ops = {
>> +	.s_stream = v4l2_subdev_s_stream_helper,
>> +};
>> +
>> +static const struct v4l2_subdev_ops csid_streams_v4l2_ops = {
>> +	.core = &csid_core_ops,
>> +	.pad = &csid_streams_pad_ops,
>> +	.video = &csid_streams_video_ops,
>> +};
>> +
>> +/*
>> + * csid_init_state - Initialize the routing table for the streams API subdev
>> + * @sd: CSID V4L2 subdevice
>> + * @state: V4L2 subdev state
>> + *
>> + * source_stream is always 0: each source pad MSM_CSID_PAD_FIRST_SRC + i
>> + * links to its own independent downstream subdev, and a link's sink side is
>> + * validated against the implicit stream 0 exposed by any subdev without
>> + * V4L2_SUBDEV_FL_STREAMS (see v4l2_link_validate_get_streams()) — every
>> + * downstream VFE line is such a subdev.
>> + *
>> + * All source pads route from sink_stream 0 by default, fanning the single
>> + * incoming stream out to every port; a multi-VC source is supported by
>> + * remapping each route's sink_stream via .set_routing, leaving
>> + * source_pad/source_stream untouched.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csid_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
>> +{
>> +	struct csid_device *csid = v4l2_get_subdevdata(sd);
>> +	struct v4l2_subdev_route routes[MSM_CSID_MAX_SRC_STREAMS];
>> +	struct v4l2_subdev_krouting routing = { };
>> +	unsigned int num_routes;
>> +	int i, ret;
>> +
>> +	/* The full IFE has only 3 rdi's and pix output is not functional */
>> +	if (csid_is_lite(csid))
>> +		num_routes = MSM_CSID_MAX_SRC_STREAMS;
>> +	else
>> +		num_routes = MSM_CSID_MAX_SRC_STREAMS - 1;
> 
> No. Don't code around this here.
> 
> I'll make a Fixes: patch for the pix stuff - I have it in tree. I don't 
> want to add work-arounds in code.

Ok, Sorry i did know that. Just that my scripts are iterating and verifying all
the paths, and this was failing i have introduced this change.

> 
>> +
>> +	for (i = 0; i < num_routes; i++) {
>> +		routes[i].sink_pad = MSM_CSID_PAD_SINK;
>> +		routes[i].sink_stream = 0;
>> +		routes[i].source_pad = MSM_CSID_PAD_FIRST_SRC + i;
>> +		routes[i].source_stream = 0;
>> +		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>> +	}
>> +
>> +	routing.num_routes = num_routes;
>> +	routing.routes = routes;
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &csid_default_format);
>> +	if (ret)
>> +		dev_err(csid->camss->dev, "Failed to set routing: %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>>   static const struct v4l2_subdev_internal_ops csid_v4l2_internal_ops = {
>>   	.open = csid_init_formats,
>>   };
>>   
>> +static const struct v4l2_subdev_internal_ops csid_streams_internal_ops = {
>> +	.init_state = csid_init_state,
>> +};
>> +
>>   static const struct media_entity_operations csid_media_ops = {
>>   	.link_setup = csid_link_setup,
>>   	.link_validate = v4l2_subdev_link_validate,
>> @@ -1360,13 +1826,18 @@ int msm_csid_register_entity(struct csid_device *csid,
>>   	struct v4l2_subdev *sd = &csid->subdev;
>>   	struct media_pad *pads = csid->pads;
>>   	struct device *dev = csid->camss->dev;
>> +	bool streams_api = csid->res->streams_enable;
> 
> As I stated elsewhere there's no need to have this flag copy/pasted.
> 
> Just move it one level up does this SoC support streams, in 
> camss->supports_streams;

Yes that is noted. Will be fixed in the next patchset.

~Gjorgji
