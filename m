Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709044;
	b=OftrpINbYGJ/rOkSQ4IRHUwKOqTgeh9wAEx2Q3+8zcEMQXdcei+AnLB8etSh4aiONL1q
	 BQHlpA00sF+DNhvfX4vETzDLZPHrU8BD2khVgads5m4/EYUx04TmfnTu/oaguTxq+Tb7w
	 GqSs4nAK90XCkff5ib5VVLHmic8H/B2qNYOBUF2aGtmDZNBMdvdKx561/ZBZoIcPLBjB5
	 BEmmvoJs/V2LjEwUVBlhhAabZRL/FuSJTl3UPSWqqxwb660Xszh9uBqYIUmQYShqU08wu
	 s3PYrdnbEPPvjzurmKH4944uR/uY4iSAJJktZmddWHkSSblWScTv7IADxYGHM84ZNbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=;
	b=jMr7ehhyKZrDbgDiX0ElFCqB0wNnL/RFOjBFVgOG1nt27cJQwcylie8LM//UYmNIfQrS
	 3vCI4prr7+V1NAjkQykOosPRPKlrFhNobgeL7xHdPucEB0txDO2QbBbUGD0TTpzv/CwPm
	 xGkqwVbcAkIkltxORUgte4irfbpgsLl2Ynm3Iuy+XiXFyG+X9GR6mR8Wx+UfuqqAYb9a9
	 FwqNmk00U2RfbUKncDxf3qYqlV48BowTF0MRDgm64GtdlyMh1v/oJdSHO3tkydXn4ORwN
	 fwfhvihf/L4oTfYMhZGmzeC/t9/fZKku+y5/vZnRQeOuP5YMUxqCnoPL8RZkapYUbBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEkbwBhs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMZ4lfN+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A74B6085097
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A74B6085097
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEkbwBhs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMZ4lfN+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CP4iP3873640
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=; b=WEkbwBhsloDnVLuQ
	5IWEo4NLb9MLCbwnf3qTDdmi79CyWEDcUYA6DV7MzZ6Wa/HY4rn2hNV47vOEzEvk
	H6YqqCkEHKwTJTQlq+sjjfmU66bFpA6u3yXlW7+lUPoMTWLsjFMyJAnXvrJo7/mQ
	23y668ilx+tf6myY48WHv38TVcD8CkvZ7OOoSWXm4B+c2XXRBoVuVxmDTqnG56sO
	IZzmPGEP/7PqJKRKUur2Gh+eVN9hZonI8EbRHWpHIV9nOcX2T2n7InT35YktsLuU
	Eg8XDoB7kxDPUuK9nR00fteV2p93uwa7RcK4yn9aThb6avk7/leignpTd0YQMATW
	tZNxmw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76da3q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:30:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf5c02f7a3so809905137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793709042; x=1794313842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=;
        b=fMZ4lfN+VZsV3/2QSov8Hlhp8sEHVE1q8+ocWG4lMWyQGfuxB7fWY9xzlIFV6vKBw7
         FKOkIUHDAfDFTSXHsq21z9JS0Ib6azuQUH6n7brDUKzkDNWVUPZSIFYsdw89zNk9oIip
         TqzbOPm7wyzLRd/bphrOHoqG/HrE9Lwqqd2DDNyZKbW8irKapeoa5qiJlptsE3TFIhD9
         DbYwC9lP3/4GoodsWTfOcr4xevGmC5/sjAV8HKqtW8CIpNbkhqVSiMpfJWIPCX5B8eQl
         gX8BLrleJlDBw/gUxFm5BYd9rlJKJeb3xbXW5z46ewxBfgPGrA2VTs4zlPcJe75yJZRO
         V0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709042; x=1794313842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=;
        b=uLAT7+SzAC36WMYkF+poUC8sVfmumtzZROCHSYyPXpYofWMNpO66Lz2lXu39d38cSR
         tVfFhYQj5XrkiweHPGFEFufpiBVSV1jNHENsxyooRj2j8ncAq084OJzH3vs4vhiawCrC
         LT9kEb53UhBMsbnEhbDDE6SRq0SmiMmV+x/QuYOUqB1E2oWyp7B2fGHeQuuSact1XIlR
         Y9ziEJLAJxMLL0Mj0usMNKARhSIP7+2kOQPSrTRG4dvpGqhjofEHrFvj0vfMJR+MN6wa
         g73fq4ZD6d7eP7gRtyNfHRaRjz/1rmEf0+g+WJgfCPrXSd24AlU0z7f1TP6NZXXInIai
         cRPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaR+ZK4ndiVR6Lnf61Ot5EqCvyFrIPYZD3tDc1gefzBt3OrOeBnQqSoW1tOHYqNC1icFGA7M/056YYB0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ee9sRf5HfJ9MnO3H1fCZcLIScMSf0MVeQtEaV0c/1hcn74T29
	CHOf1HSXsIaum3LI2Dn1CsahPCszPR/H+MjqrC0NcCEwDXYTotlZIGSNEvhE5G2eeU0oWsIhmHE
	llCFoipkSGRTW1AmJKC/A5kAnKWRIWYLV2VJU6IZQJKgRmiye6MgH6RZTWqnJsqiTeTc=
X-Gm-Gg: AYBFou0TyHY5OQX75R3Sv/aD7B7dyGd7vxKLZqOZ9yWdlGrAGTR1r3c5v9iwCYhO981
	W2kGzfPjV1wW38BTdXSy+7OdOxMpNf7z2EjXP7LhnIR8lbpJhhuBVqRaTrqPVgdk2OEpy4GO6Df
	0gTYbe+clolmYHPSNZT0jP7DndeJWo1V7vlWw0g1XcMdyemfnM35Rbtt4QZM8Vh+omxuAZ/9e2w
	lQAPaKb7y3ut70m2lAdTFlv9E9fFBs3ARHNFpV0z7/9FX85WnYC6yCj6HtPfR6LLiwmeHD5rrfk
	eZ2tyYqWOov0TBVm4OloYUTw4BC6Pip4CD/BKIwQDjCDCk0491zWVu8fC2kbiYwLjbtrl2EOCgy
	zCODGpPgrXzu6i4tBxl+bXigyFUpfgK/l71W+5B8x9VoaVQYnBJFGjQAjptGwgKXqtJLBgfxHhl
	h3KPM2BCKo4krI
X-Received: by 2002:a05:6102:c13:b0:7cc:1a41:20e7 with SMTP id ada2fe7eead31-7d07255248cmr3929503137.7.1793709037212;
        Tue, 03 Nov 2026 04:30:37 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7cc:1a41:20e7 with SMTP id ada2fe7eead31-7d07255248cmr3929498137.7.1793709036671;
        Tue, 03 Nov 2026 04:30:36 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm25490173f8f.12.2026.11.03.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:30:35 -0800 (PST)
Message-ID: <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 14:30:34 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: Bryan O'Donoghue <bod@kernel.org>, bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <MPrRsE5vvB26tbMAT443IrH7Zr_tyIPaFwvQfnZj5TJUaM5uN8MyHB6kU6Y7rW92Sy35A5GfNcv95YOt-4YUNw==@protonmail.internalid>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9d3f3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=zZ9IWTiuT8Pi6IuDbjQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfXz4eyLE38j1Ul
 Gao1q1v44cWYUXW4A/DGqlC6O1WlhNznrc9xo04W7DmCd6mOsDf4OQYiAAwx9f+ZJnSLXVB6uI1
 ghZnUIR3LTSUXVHf3qVv9k2lFYLsPGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX+NqLr1Gp+wrj
 fzkXVHlbaOiIjbEcA11NiKq3uehPcnldiRX76MmdLpXh3q6gCR+lvM3MZE7RXZjDQkvH1d2xdJ3
 j9FXy9qAybMVWCmZhIQHMEfcRSLtbgEsKp+wxNdT/1oQPaJC2wn137P7HgPJqUwHgrClsOVJbo6
 9ybGT8ocl6mURSsAM/Pm0IquyafdfAfvLjM0Z7/JOh1O6P/Ai2po5JdzYCYByZGBUDi7pmlACYZ
 lFmzOvbQ1C5SVpEVbKFEUlHh9EXCxjSey7/FDOE7onnzSvB13GWXq265wc2c9wud2CkYANgcH57
 yuv7NP12KoT3jK2hKXiGdQc0TBV3tihB4jrxDF0FgSzk1ym24pyakTzwa/jk9BTKA3kZmt7iBSs
 VBBQk64t44EjMehvixfGi8eHiqwXmO/rQhJCT906f5CcchdxjmI0NQEgMBBJc/+a9XY6GS2n9iI
 pX3RjlRWGUjYcCX6ZOw==
X-Proofpoint-GUID: qJY3ea5YWTT-6K9c1wRN-3tfaBPPwTYr
X-Proofpoint-ORIG-GUID: qJY3ea5YWTT-6K9c1wRN-3tfaBPPwTYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030049

Hi Bryan,

On 11/3/2026 2:19 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 07:11, Gjorgji Rosikopulos (Consultant) wrote:
>>> +
>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>> +{
>>> +	struct v4l2_event event = {
>>> +		.type = V4L2_EVENT_FRAME_SYNC,
>>> +		.id = id,
>>> +		.u.frame_sync.frame_sequence =
>>> +			atomic_inc_return(&csid->sof_seq[id]),
>>> +	};
>> On first look this was looking strange because the id is used for the
>> control id events not for frame sync. But on second thought it may make
>> sense, but the question is how the userspace should interpret those ids?
>> As of today userspace does not have any info for the VC and csid internal
>> pipelines (so called lines). So with the current state of the code
>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>> based on VC. So i am thinking of two options:
> 
> The id is not the VC its the CSID:id/port/line-number. VCs don't change 
> what this means; its the SOF event as seen by the CSI decoder - inside 
> of which there may be multiple VC:DT combos.
> 
> This is also the case for PIX which is just another CSID 
> port/id/line-number.
> 
>>
>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>     and will be well known to userspace for which line is reported.
>>
>> 2. Add and propose extension of videodev2 documentation that
>>     id of frame_sync event types represents SOF per virtual channel.
>>
>> Personally i votoe for (1) because it will well fit with stream-api
>> support and usespace will have clear understanding of the SOF to which
>> stream belongs.
> 
> You know from the media graph which CSID drives which VFE:output so it 
> is 100% possible to know which CSID:SOF relates to which VFE always. 
> CSID::SOF is a hardware description of what the CSID decoder sees. I 
> don't support mis-reporting it as a VFE event TBH.

Yes i know that, but does the userpsace developer knows based on the API and
documentation provided? Or he needs to ask the linux media?

We have some kind of id which is mapped to line and that is known just
by the driver, if you can point other drivers using id for frame sync
events will be helpfull. 


> 
> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH 
> event but these require the CSID feeding a frame into the VFE pipeline 
> and the VFE moving through its own state-machine to process that frame.
> 
> So they are separate signals and separate logical events representing 
> different things with different timings in hardware, meaning different 
> things to userspace.

Well that make sense i agree that it make sense to be part of the csid
but it should be documented somewhere, maybe proper thing to do is update
the comment in videodev2.h and update the documentation for camss driver.

> 
> CSID:SOF is the thing you want to trigger off of if you are for example 
> trying to align an IMU timestamp, not VFE SOF.
> 
> Feel free to propose VFE:SOF/EOF if it makes sense for VCs - I don't 
> think I have a clear picture of what you want to do there - interested 
> though.

I am not proposing that, but from the current state of the code each line is mapped
to different VC (before multistream patches). So this means as of today, id can
be mapped to VC. Anyway my point is to either document or open discussion for
"id" field in v4l2_event structure when event type is V4L2_EVENT_FRAME_SYNC. If
not document for me it looks like some kind of a workaround just for our own driver.

~Gjorgji

> 
> ---
> bod

