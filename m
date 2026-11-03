Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711594;
	b=ughlKOMu8YRkkbnrxLn/jbqh2e4IpF7iMU8bOdBt/mbxB51XQVKFDw9cFoEwc/kk630b
	 PEM2JUC7EJUKhfa0miuAjGcK1OIfAlRsEYCNQlVqo6rJBiioTZAuPgHTE1v9o07m/Rhn9
	 bXMHM6WiRS7FRSk+mMCiJoJ/KXESVJWemPZ1CZ0VPoKXX/bvN6nVRj3h/sgxRrIvoRLrj
	 m1u3IxOJuRzNg+dU3FY6K5a+8a0GxzNoLqaZR050kmBKtqJWjoFTpnldqTAUd9129gjuQ
	 8m+RgZUl6Im5NFIagNpAPJS3kZDW2Hy5P1vkVHBmRmz3+V88vJEHkWCUlSvOX1JEnWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
	b=JKTZmE7Tp6ciYcTaOsO2YYl60+2xBN2yUBwRdS1M4cgglKzpPTCbM/P/0bCclcugUDVg
	 caT/n3DeN601K2nK0E0cdHzQVQYa0wGMVMs+kKYUXw4YJzwBQ8kSFDqlsv1fmMb5S0Uo0
	 xre8H6BTDOOXHn8uGl0CkSG1wsH0+vkVF34dNr6TLS9NtQ2ZdcZggCy7+dzB70vYeIvLH
	 lyoP36Me3ui8C85jtZcatNBjIa5UdDN8dJnIJrjQUxA8D/gS/Bcbh6Q2f6ZxPtoamdx45
	 DTcdjwft1sF6NNjndqTdR0y7FEpyEae4PJwDUp3pR60quYLeLpCfipjhuYmsWXVr/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnCsvjoK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyZH96eC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B47606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B47606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnCsvjoK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyZH96eC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClCIf1821117
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=; b=YnCsvjoKOg41w2fy
	NCc1D3VtRcD7lTaZmWWlydx7PxtmO5zPxPFaQaBnfKZZHDCyjmUlApeSfrwTT37f
	mqLXYYjTQvHaw5IDogbFKmc/xp6eVvJNmZqwkVreAxbv5VLeRO9Sh41s2DMyBfJE
	gJVxiXtx/ec5uxAiFH8D0mQMF4KVWvvWVitATB/8N/rjlo3SNWyQX/pHZRWua3A2
	4wUsyvY8KYgJls1pjaEFl32RB2XbACdETG/aEyQOO7Y4l+4QkXutE8VZ6iu1ac9K
	GHskR6yICmAMB+yP5yRQXz0RDH4rQCq7bTGSlxmNSI2ibwggUozxeawzVvO8zBQ1
	uHFLpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hwv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:13:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so377261885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793711592; x=1794316392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
        b=GyZH96eCTgaAbcQ/PZM92t5m8rbsF7QRu6Zcf8iu3O+OU8heoP8jA8ZHj1tFRqm0k0
         lsXU54WBSsNHy8cmWA/JFrBjVuKOGuFC/dcgnLDiHs+H3dIXB3rad46uzZbl0vPsN1Xj
         hodfDL3qRgaKlG9YfGxbJcerbC12CtEfn2omMFOZcMAVUjawhEjMqkpjFHeq2GPNT3Ma
         9YN4v/V3Ye7W/mn+rADwUEmf9CedJPG1ym4WgXTpfTLIlk3pzBGMSo1sJ5E9xLinlTqH
         AYacMzUNtkPXkrGrhqQdjlDAu9sEf9dgwUWMpUtwVCMnAtiCx+MhLLnNUEg7d99Tnt+y
         5IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711592; x=1794316392;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
        b=Q036x3JS7eE8KUkzDxEo+6UFE86+iM55lRENuf7x4a2fCqzSjM9A4sZsmIit//ZAIq
         yzgj4m2D4VXFX/2NC132NWdz9cOVyU36N2AUjFDVJlq0oOTJbSX5l4aX9FI3TZd4h2Sx
         Rrr4cq3LKrwL7qigHVx8u1HF3UcqCnjlakoGDTpO271jR7kDZBKghwrISsHWo6C0C1tZ
         UNxfQ2GU69wTRP4BHNajTQj6OeVsekfBb+jHBVRKhR6KImZ90gta9nU8/jRS35iXdFD+
         WrOIFGA7VoHcmsMaHjmzpiygVJnvTGM+PXFv2/LPtBqWN/L04wv5ggiZHzx9LkPEtSWR
         KCRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0htGx5l3yMZGiIH91KFLN6wrkq0np41u7nrIhREvGfwhLkERFKgaNml9XPG/kPhKWuYaPRP75am0J08A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o2uwaW285r31XQR8o1TH3hlWrmMMD21Zl+eFjOB/Z4LcPg9ZN
	KegpxbO+rsjMTdoTHK8EfjxZDmmrLQieTlS74p46VcrnewV7Fh73QVGWJGmmDkgc+p0SzLOUWiL
	ME7lsdMOy+zpp7/6qIbG3PhmuKb1ahFtExEY7qh1vmqJmX1FvKz5EV+RXiUJl0wH0oUU=
X-Gm-Gg: AYBFou1gYf9Xu2mcn9Gaz6M1pUAtkxc2bg5AKwa41cir+s/9GPCUvpkG4rJhP3qg58w
	L/LjzZKyTOdP4cE2fZ5ckM/yMZ7IeZOtCB3Wnr9ZtwUrvy7x6e+sPr2ifmxDwkrlmS1hyRkPwHk
	OBsYEWM6lcmfDzYgF/3V5fus9eN5NqQbzT/aFqpLyNlHRtnnxRf4FD0zkQUr+4lpdo8vAWh1iZ3
	Q0qGS+0FDc1QhrS6xHIMKlvmC6YJFpmjTvwFryzgDRFLIlL/2Bf1VwK2Ur30lol7nMDaG9XxCKA
	tYwmt0qBQFsG/qY4nD9rb4PqYbbtamBlg6jSKSuYfv4rSWOP7LhV3BoeJsZ/+yZ/tHdRdxnqcj6
	6VUgHc2B2Qvd9wz7HxPhUcmGiU/lS4WCI5nLWmHY2uuJs8grEMMpM0FdvQsRtEH5Q/Kvul6UKSJ
	WyMXebHecn0SgL
X-Received: by 2002:a05:620a:6293:b0:93e:d5c1:da58 with SMTP id af79cd13be357-944217ce7d5mr2047385085a.79.1793711591411;
        Tue, 03 Nov 2026 05:13:11 -0800 (PST)
X-Received: by 2002:a05:620a:6293:b0:93e:d5c1:da58 with SMTP id af79cd13be357-944217ce7d5mr2047380085a.79.1793711590852;
        Tue, 03 Nov 2026 05:13:10 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm50322075e9.9.2026.11.03.05.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:13:09 -0800 (PST)
Message-ID: <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:13:08 +0200
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
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
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
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1ag2aYufpWOygrJ8iGlDSHpguksC-eaa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX47OH930pfaat
 tD6WWCVkjvJUl6gEyZjagppLfDjusl9zNx0eCMTU2DzXlWxu4DynqSzRG4Ga/QjgEY6AGaeN+z0
 Sn6vn1vqWv82WzncC+YMef6OpAdoEJI=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9dde8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Fj6EcmcQT-bn4kmwQ3wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1ag2aYufpWOygrJ8iGlDSHpguksC-eaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX58fMrlbd+TQ2
 /p9Zlla7zRDjb3NrSD/x8uxgkqmfW0mmmfVdvrPr9n4QVVFJsAdQ8TFne1xWVhH2a+6QLqowcwb
 m+/VjHzrSP2Q0YCODzcDNCZpgU0k7AXbiM6zX/8Yiew+g8jq1MvCgvlVu3c8snWlj0cUjHPK+PA
 8aBpeyLmb24bUzi7P0CZIXnVPUy91Tepdz+rSohMMWMMdO5ARvFrfiCS+M7/7fi/cQLbtMQ4ZzQ
 e9fhd4q4lHl/l5K2Cm69kzp0qT9zA/Z9GYs4OaIMVjSVPOanEDA/EFrFmpB2lJqZWQFLZPTCv/T
 Z9wc+idhN3VbbJ+RxGpWKC8NdkGmOZUX8FkEvXdAAtwNBFE1k3LNYl3Kktiu9q/KwbP+QnfPu84
 LA5eMJBpvsU/Vl8qjyhD9zGuRSGVAhMvIeONR0jCITYeSXJDcbvv2N0FKelE/+tqosY+URGvSQ6
 iFhz6/mGMCJS5muSN/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030052



On 11/3/2026 2:30 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 11/3/2026 2:19 PM, Bryan O'Donoghue wrote:
>> On 03/11/2026 07:11, Gjorgji Rosikopulos (Consultant) wrote:
>>>> +
>>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>>> +{
>>>> +	struct v4l2_event event = {
>>>> +		.type = V4L2_EVENT_FRAME_SYNC,
>>>> +		.id = id,
>>>> +		.u.frame_sync.frame_sequence =
>>>> +			atomic_inc_return(&csid->sof_seq[id]),
>>>> +	};
>>> On first look this was looking strange because the id is used for the
>>> control id events not for frame sync. But on second thought it may make
>>> sense, but the question is how the userspace should interpret those ids?
>>> As of today userspace does not have any info for the VC and csid internal
>>> pipelines (so called lines). So with the current state of the code
>>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>>> based on VC. So i am thinking of two options:
>>
>> The id is not the VC its the CSID:id/port/line-number. VCs don't change 
>> what this means; its the SOF event as seen by the CSI decoder - inside 
>> of which there may be multiple VC:DT combos.
>>
>> This is also the case for PIX which is just another CSID 
>> port/id/line-number.
>>
>>>
>>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>>     and will be well known to userspace for which line is reported.
>>>
>>> 2. Add and propose extension of videodev2 documentation that
>>>     id of frame_sync event types represents SOF per virtual channel.
>>>
>>> Personally i votoe for (1) because it will well fit with stream-api
>>> support and usespace will have clear understanding of the SOF to which
>>> stream belongs.
>>
>> You know from the media graph which CSID drives which VFE:output so it 
>> is 100% possible to know which CSID:SOF relates to which VFE always. 
>> CSID::SOF is a hardware description of what the CSID decoder sees. I 
>> don't support mis-reporting it as a VFE event TBH.
> 
> Yes i know that, but does the userpsace developer knows based on the API and
> documentation provided? Or he needs to ask the linux media?
> 
> We have some kind of id which is mapped to line and that is known just
> by the driver, if you can point other drivers using id for frame sync
> events will be helpfull. 
> 
> 
>>
>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH 
>> event but these require the CSID feeding a frame into the VFE pipeline 
>> and the VFE moving through its own state-machine to process that frame.
>>
>> So they are separate signals and separate logical events representing 
>> different things with different timings in hardware, meaning different 
>> things to userspace.
> 
> Well that make sense i agree that it make sense to be part of the csid
> but it should be documented somewhere, maybe proper thing to do is update
> the comment in videodev2.h and update the documentation for camss driver.

Just an proposal if it is decided the id to be used, it make sense to contain
stream_id. Then userspace based on the stream routing can map SOF
for the stream of interest. But the API for retrieving stream_id is still
experimental and i am not sure if will be well accepted.

> 
>>
>> CSID:SOF is the thing you want to trigger off of if you are for example 
>> trying to align an IMU timestamp, not VFE SOF.
>>
>> Feel free to propose VFE:SOF/EOF if it makes sense for VCs - I don't 
>> think I have a clear picture of what you want to do there - interested 
>> though.
> 
> I am not proposing that, but from the current state of the code each line is mapped
> to different VC (before multistream patches). So this means as of today, id can
> be mapped to VC. Anyway my point is to either document or open discussion for
> "id" field in v4l2_event structure when event type is V4L2_EVENT_FRAME_SYNC. If
> not document for me it looks like some kind of a workaround just for our own driver.
> 
> ~Gjorgji
> 
>>
>> ---
>> bod
> 

