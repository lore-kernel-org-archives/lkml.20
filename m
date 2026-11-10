Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303618;
	b=0bl/tOYyCx/cIFSiwYpfCy2AhehygiV4Q1LpK6Jb8bhN/ndqP77u8wto56phAqyMyRwK
	 fxoUEvfI13uyKd7B9jJ9jOWkQBiyYlTw9fUHlBwPoc0QxImpitDZwco3QUVXPvw7vB2AD
	 WzRbzNCMRZ+ZFqM00QcSvfld6u6CFHIPqSmnA4i5Cn170+pWd8gBWXMoaP4blb2XkF28G
	 +wSeAzfDIAuEkNUNuJ87OwtAz+nBrTNuLGPTMy5UsZgX1zUWxfdk01q6SOe++MMQeDG7O
	 sFLE22i11Kdd4EnbJTr0nLVW3NljmCvxhtuS/0K9DswogF4rhHTgOTeGmD7rbbZW6DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FqTmzG2leUMrWmJ2S1homkRviVObF1AjWA6tGVbhMsY=;
	b=nWAP7o3nBs4QutBY7z3pK+CQ2SAJkXvCm/CJg2jc3aCTkhDvSZNEkkv30thrcqv0n0Gv
	 KBUSm7VYI3JrTPa8eO3oRrKOCfX01AyhBdeksI6lzuD9AC1Gv/Hq9YDukODOXXosjqtN/
	 /ypEKVvXmzkxnQRENcxAcu0U+8xCb6bdlcdSVHTSOMLFeurrQUnOIrY4bF249DNuygLSJ
	 o6YkzgqjHRSTUtug5sHb+eOwzgMIfsAA5MJ6mUvuAA13NrTHoU3CPJJVVn2ka1hFBKT2A
	 BTR4imnyq17IlB36B94t4GX6PE1XVWOaI7as6mLYEN2wibixgf9Uw1btacrecpFJIwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+zFs2XU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="B9eDQ/Ma";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0133607264B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0133607264B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+zFs2XU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9eDQ/Ma
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l6652433753
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqTmzG2leUMrWmJ2S1homkRviVObF1AjWA6tGVbhMsY=; b=R+zFs2XUqHSKJB9w
	/2qpzwzk+q+4hINDOXILfeHP+tZDMDZE2PH6PWMajq/9n/IIYYkp3bNOdo8GN5vU
	K5iQ1fTnotbZC2RjOxgB45upmJQmvS8vTukkQeRRTCiRPS5VhdG+CleeqnoBkQZI
	uctMCbVTROM/7BdFnl4h9zGXpGhP0aG4ABK3VYECwL8CpoSucKAKB27+FJNOZUGM
	zdrACues4AwzzKSknseM6X/uS75bpNYaM+MMkXLsqMgtQlfaDanSmz/x8ahMPna/
	QUzGWCNqllzDK9BvMPCgUUVeX+oft0K8CCmB3aECTeKbvUbxugLVJU5e8+1KwIZ3
	nQ6WnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux848pf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:40:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so33170a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303615; x=1794908415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqTmzG2leUMrWmJ2S1homkRviVObF1AjWA6tGVbhMsY=;
        b=B9eDQ/MauUlJzfra9u3b4tuYagOYUGOzDjprXEH0tnxZF2kC39pv3tP1/M3hLPAQWC
         8c8jTYYa98dKLloWNQ6Es3bTUoSY9WDpbXZ9eoJebkdEiZvPwIb11HYOStlWHPA1pyr6
         gD5mWIwh7ykJpsbym8X7ucbGYwIA8zFv+sqjO3T8DwB3GzYsyGagoMy77XkMiB+44pED
         rl8ql8k4sSjJTyslHXh8XOwf2MRbp5O+sIErAvuH71G4DhzuN6WIHHkzJj7hzX3cVaBs
         N4Rc/d0S7M/YVhvi3Kv0NwK798/QLcpQnRhIuTki6FGn4E9RQCqPHMsIraMHCpQl7rul
         IHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303615; x=1794908415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqTmzG2leUMrWmJ2S1homkRviVObF1AjWA6tGVbhMsY=;
        b=eCH4RJo378/hT9QlwDl5Hq8kYBEOLXY31uoE3ANcVNIyuLXAmXYPRQSqua840zdptC
         bJO9yurmamxbX6Qq+3x0HUninPuZB3gxU6MLMuJ9wxcsvxqVSYmU1JdaYQIjaY2RUl8V
         YDW5VxA+g/3ZcDP7puowIakIMHrP+HTliCPRZ7gsH1G0bv7kDbNvQU4eBfaKMsnz3/rs
         AR6qe05MW1uauyeQiFNOEzxIzAuKvZ4kzQ4/5xjxpp+5UW7QgIyBxv3kw2W1f5NULtLN
         AfvbTjMDCg3Sys2ta2t9tX9A6PyDGzuzpcF/QLKxlhjj0I8qOtaYaLQXt03wPliOKv4L
         /Hmw==
X-Forwarded-Encrypted: i=1; AL+hErGfZtMH3YfKvw0zuhxaCxulLq7r96Btx3csLPS0smLiEr+PB1g+djZ/6iUbZ03byeG5VZ1jCklZzN888gM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jboijGGxFsMiOF2P8ifwWE40DW9fVHX9BT5Nw6q8CzLywvrnk
	eVa93Vnk3t5DONm+WZoaabG2yUpVdH8PvNUrt/HRWysYZS9rrR+1O+Vzne0TVPrC7jA1Itlyhnn
	NTRxdO7/aIVO1v5FjDjxtjEILrP7f8MT/NeQL32gZMK7n4hDn3K79ECSSzv6qrlpsYBE=
X-Gm-Gg: AYBFou3GoamR1jkN9YGSbYcZ1eE5SmACohzIHCf1BzMWZRtFxpQ4XnM/sQmIsGby2eE
	UdLqPv5/qsM8yXdxd5PKZZD45Xuw++L9QA33WIlojA99vXSh2DTjZgTsUrOIUSATqAG1UNi2aCE
	0DpgYjUexx53GLWuze0Qw5xsgLVyCMcqT8VBR2+7CghFW77PJ0irRVpC9F3yvfEDBIIpcS412Js
	P7VLbqh4ZgfPpHMqkJI7mfeXxtEZVMP98Rf2dyDtOY8JrZ39QUY9STiD+DKilHvrdBKBTNOsOfy
	bZpK3DgYCN7fT0Z4+xTzMt3NQv5hpiTz+br7o0XtsTommba6EcakpYVdxEgxF7T/dEADbQDEBpn
	mCY9sXmlRCl/kyhncy+OJIo0Cj+mUsMLhVUc4RGvFkMAeT05MA1Fy7CnQ/Pj9jEXdD5X5mT1GVd
	OR
X-Received: by 2002:a17:90a:e2cc:b0:3ad:eb29:3383 with SMTP id 98e67ed59e1d1-3b166c89a67mr1747409a91.22.1794303615194;
        Tue, 10 Nov 2026 01:40:15 -0800 (PST)
X-Received: by 2002:a17:90a:e2cc:b0:3ad:eb29:3383 with SMTP id 98e67ed59e1d1-3b166c89a67mr1747398a91.22.1794303614681;
        Tue, 10 Nov 2026 01:40:14 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16ca50f2bsm886871a91.3.2026.11.10.01.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:40:14 -0800 (PST)
Message-ID: <661383c5-41c5-495a-94ab-ffd1b99d7f9d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 17:40:07 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/35] drm/msm/dp: add support for MST channel slot
 allocation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
 <agm7esy726no4u4cntecmllz5kxdtxaue7xcn7vdhkuh73lxau@r6mqybgiyl7f>
 <ab5ebfa2-9687-48ba-8403-186e517126d2@oss.qualcomm.com>
 <jwmtxurikcc2qsahg4rq63earm75puu46isd5du2s6356oe6eh@7umfzpxmoebv>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <jwmtxurikcc2qsahg4rq63earm75puu46isd5du2s6356oe6eh@7umfzpxmoebv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfXwhsUbFaf6PUy
 cPkuxMliDX8GYG6cqwJ+Ij/q/hEb6GiiGP9Xte7S/bpP2c9bzAWqVB0Pbmz0z5lY28ka+Ml7kmX
 u60GyxcXg0T95mz2zuwTuha2b429YSoTskapRQM/pN6lsfCEqb27Hr+wNkQAEBRlhj/2/+wbXsG
 fClfyhTf31wSLNUMJQDr1SIFSiVy9ZZz8NUFnO8/uMzqg+AM0LuKh0dhy5KEvscMPpbOdFInveo
 oSLRsl0RvgoJGmJ8xoijQF21LOEbezS+FkEkyEaDY9x7GVyknlqYwHMXES304I0nEfkAJIn6Y1y
 OTfE0MThPd0C0x20gHd7KHiryyLJ7TuZw2uR2N6UhbOPbFL+sXoY79LM9irdpULDEIHjx/1prTm
 +d+TSlq2uEaGcqIVNOKgbFbdatX5jFQEB1EvdnhRQsefD1XMOcEcxioFwVhTrCMKQH2R/tONjey
 FUtvZP++IY2WiQjx04A==
X-Proofpoint-GUID: pBsiCLYmw_ti1zlSgFPIkZZPozGqv3tD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX9UcbaFak2i/W
 jm+Wiz+MAM0f67+8I1l+trUaO0uWULamkkdmD0/oDT9X0LVcIFMqjg/R8lg5R31SyJqvme+AYZs
 FxG5ILFR/SirE37w14mgGPV5/etbYkI=
X-Proofpoint-ORIG-GUID: pBsiCLYmw_ti1zlSgFPIkZZPozGqv3tD
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2e680 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Quu6St0uLKo6CJq7Ik0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038



On 11/9/2026 3:20 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 15, 2026 at 09:24:52PM +0800, Yongxing Mou wrote:
>>
>>
>> On 10/1/2026 6:52 PM, Dmitry Baryshkov wrote:
>>> On Tue, Sep 29, 2026 at 12:25:37PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
>>>> support for calculating the rate governor, slot allocation, and slot
>>>> reservation in the DP controller.
>>>>
>>>> Each MST stream can reserve its slots by calling
>>>> msm_dp_display_set_stream_info() from its bridge callbacks.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 187 ++++++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
>>>>    drivers/gpu/drm/msm/dp/dp_display.c |  13 +++
>>>>    drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>>>>    4 files changed, 206 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> index 929e0f94f8dd..02732bd4efa1 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -83,6 +83,7 @@
>>>>    #define MR_LINK_PRBS7 0x100
>>>>    #define MR_LINK_CUSTOM80 0x200
>>>>    #define MR_LINK_TRAINING4  0x40
>>>> +#define DP_MAX_TIME_SLOTS 64
>>>>    enum {
>>>>    	DP_TRAINING_NONE,
>>>> @@ -119,6 +120,12 @@ struct msm_dp_vc_tu_mapping_table {
>>>>    	u8 tu_size_minus1;
>>>>    };
>>>> +struct msm_dp_mst_ch_slot_info {
>>>> +	u32 start_slot;
>>>> +	u32 tot_slots;
>>>> +	u32 pbn;
>>>> +};
>>>
>>> How other drivers handle slot programming? Is it something to be shared
>>> between the drivers? If so, maybe it would be better to update MST
>>> helpers. Or, asking differently, why do we store it this way? I don't
>> start_slot, tot_slots, and pbn come from the MST atomic state. The MSM DP
>> hardware uses start_slot and tot_slots to program the per-stream timeslot
>> registers, while pbn is used to calculate the rate governor. Therefore,
>> mst_ch_info[] is a cached copy added to make these values easily accessible
>> to dp_ctrl.c.
>>
>> Source hardware programming differs across vendors. Intel does not
>> explicitly program per-stream absolute start-slot or slot-mask registers
>> like QCOM does. Nouveau submits each head's allocation through its NVIF/VCPI
>> interface, while AMD converts the complete allocation table into SAT entries
>> and programs them into the source hardware. Therefore, DRM MST helpers can
>> handle the common payload allocation and slot-shifting logic, but source
>> hardware programming remains driver-specific.
>>
>> Without mst_ch_info[], we would need to construct a temporary complete
>> allocation table from the MST atomic state during stream enable/disable and
>> pass it through dp_display.c to dp_ctrl.c. Specifically, this would require
>> extending msm_dp_display_enable_helper(), msm_dp_display_disable_helper(),
>> and msm_dp_ctrl_on_stream(). msm_dp_ctrl_mst_timeslot_setup() would then use
>> this table to program the timeslot registers for all streams, while the
>> current stream's pbn would be passed to the rate governor calculation.
> 
> Would it be better if the MST helpers provided this table? Would it be
> useful for any other driver?
> 
I don't think this would be useful to other drivers. The table is 
indexed by the MSM source stream ID and is only needed because the MSM 
DP hardware requires an absolute start slot and a 64-bit slot mask per 
stream, as well as the PBN for the rate governor calculation.

Other MST drivers operate directly on 
drm_dp_mst_topology_state::payloads and don't need a 
source-stream-indexed representation. A common MST helper for this would 
therefore have only one user, while the hardware-specific translation 
would still remain in the MSM driver.

In the next version, I've dropped the cached mst_ch_info[] array 
following your earlier comment. dp_mst_drm.c now builds a small on-stack 
table from the MST payload states in the stream enable/disable paths, 
and dp_ctrl only translates that table into the hardware timeslot 
configuration and rate governor inputs.

