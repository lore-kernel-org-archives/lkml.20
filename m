Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716562;
	b=YoWidStoDWTSZvM//dtCmTeYY4A05vAZsXjKJJj+752G2etUTkhxs++AHzGP1k/47pVS
	 6OqpUXkJEgIGc9bt/7Rhy0zrv0odHSh9G2/c3ViRqy6BqxH8qONGSmkS5DrGevF+GEZDB
	 j3MyCf/z9hnRvg9qpsP4xlx5R3aHioRGUz7DmXYrNWdXPVm75+5CVjWnCPROjySGW1k7b
	 sRADQFmp/r3xvG/OjniMLaaN/egYddb5IhzgYCzvyd/wu3RUW0kP4U8xUW1Qo1nnBWpqN
	 OHmNpyKbcRxY3givYYost1qzMntArLSHHkr6MWl63uR1xl+czkKW/UHM5+iok1HnvRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
	b=CJmrkKujJMvJ+BmQrixdPFyPZ2dny0aRg6n5hlQk7763fqA4XY3RWUftF3j5dcst6qkS
	 MQoHLxn60HNS057whg01ppstP6r0L6bGykj1oMcgiOAcr4c3q5nKeS4e2aRy2G921Xv68
	 oApTX8wiwqrJ26gk21dc6MejtBTVO4EFkA+jn7T3WwnG+5XORJnLKfp/YwbgT0ND3REU7
	 MEutkQ72yRhFvzyC8nNnNg4cNDHO+SFakfNKgb9Wn/ez40kXpWohXB6hgYLxQNB6/PDGZ
	 k135lchLpVdmdez5AgnSEs2lW91e67brx6Qs4kpnGWD2wmQVdJvyaT8QFBZSWEW0TdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Demgw1Em;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+4Uq9pM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BAB606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BAB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Demgw1Em;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+4Uq9pM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA3pd3081254
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=; b=Demgw1EmK7stCnoS
	tfhgiEnrI71eLw+kfQqZTlXBoMyQKuvgsiLHofy6AkTlBVOc7fByasyaF687IUhs
	TkxpG+s3HcRAQ6JD/3+uFWBEiMhF9G1zJh4kV5J/I2OiRgEOqdwI6YYvEc3C/+1r
	UXwzrceW//VBW42qNuoIXqF0BvPpTjwLe0Ew/bTyfmErj4x4nDxr3MRn5JOyHCkC
	MWfiTAO8Xzg4ZbioyqoZC0G7EU1F7NOCPH9SdGDFqz83pJ7RK1sTHir72wj/Au0B
	qssIv/2GWQeQN2THbwx5OU5mNX/WC00gE8siets3dOwLh8Q6SBboV3mDiExog8Cr
	FLRluw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2ackmdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:36:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9913f410ba2so848498241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793716560; x=1794321360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
        b=H+4Uq9pMhuoYZVa8NMW2JvzoHk4/iLwq69I37ZCTSyNjxTQNpiDHWqpGs1YE1ytz8T
         JrbrNwhOORS0qwa0bjBczlElFFL6zU2F7w52t7xLLI1kBq3dM7I2aqjbQ56CsLgpr6iI
         8o61/JHgVVlFB/RChDwLBhTn8iCwl4NY9uHRGjdFdqOlZnVnm+E5gIzKVHWybIPdZHhD
         iYBXZrrsbPjkyKhqRXXP5+LSJc6uG5fT7PzCf+T3/i2kmmNR3e5JruHBM3vQqUG+MOmn
         ObkL+yze2BublLJDXkGxdEoH3gR7TrKefzrl3ReR1Z+KTH2cBbzdzZHaxNg04GphpcDc
         ItxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716560; x=1794321360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
        b=13+Rm5Sp6anNk30scMV7HyMELZfh/csYxo2L+LBQAwDuAMkPbTC3/hGZfVEL8QQQ6N
         RG9O8XwEJFJerDlTS/A9skF6oFsMMq8jMUFBthBgqSXj7KGGl1vMRO55/mi2EqmOLA1/
         hKBHQWkDxRbaWQDrvR+icIGF0ih0kqTKX9l49Q0rQkUNKZP0LaUyS9ZsokjK2NTftCtF
         2Ar7t5c1faxpBlVblO/50TcbvbmEx3JRsAa4J8Y2vSh4fJ1CU/i4WnTXZkxLIea+OKdr
         rPVzus5jXr+gLA0n4sssw2+BtmrgkTxfszwwK7gCTX80gpGLLtUXAsgsBNL9bRlC5XDD
         IGaA==
X-Forwarded-Encrypted: i=1; AKwUvBx/zR+FUVMpGtU2XQrTpuH2au4dAOJpW0ufC976ki0aVoI3iNFPzkqsr/Vkt8VfOWMD2tJxKQ4+MnuOU7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EkUozCL5X2+/wTLM8hqcxAcvieq8rlx7pvuQk/3JndQg/hSXd
	4prqDyArGUG8aeGTDgV5YaI8LMtuu0LbN+yd3RUMfbR2elhc/3H6a79UB2yQEOOFHEGMXYIWQ3q
	yXfQXgZB2w04TTN94wV8RzgdLah8kjikRZJWjYcjacpVR8yz9RLU14Pavuu3+AogSdGQ=
X-Gm-Gg: AYBFou01ocT4D79aQCsD0UBwXChLbjNbsHWlCLz4dISndQtlHx3h4TmGcfZGa2v74UH
	c3yefB747pn3LBXQ0yHYse31yMkHBsSZZMXVBaTE6GtddsDxxqGTXyfsyqQLJelsFhLbvYw9MEE
	RjkFMU5Q5sg337TvxwK//OBJA/MFfGFV8UVVGf7R/AcM0NrbxRHaciHgUcbJJ4bJA9p3qdmDWuU
	U2Yzy0l4b2Gv489kDmy0k4PcXeQcSXRiRS8AFjokakCsW5gG5w3k7CbQq5qoOVSJStkTM+CcIKh
	+R6JbNGfmmoeqa47LsQgbNFSf6tuqzCJsprg+ZmOV96uz5on3upaByF/5iOGPj4CVscDPKgQ6gU
	ObP6RK0jNLB0e6xekMEFiEYPLqiizcENnVKjMvvInu3pmbhD9FNLriCQzvSqFoEtQuuIVrRysz+
	Wtt/sNUprpKjtu
X-Received: by 2002:a05:6102:14a3:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d07272efedmr4647354137.24.1793716560002;
        Tue, 03 Nov 2026 06:36:00 -0800 (PST)
X-Received: by 2002:a05:6102:14a3:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d07272efedmr4647338137.24.1793716559440;
        Tue, 03 Nov 2026 06:35:59 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm25764805f8f.19.2026.11.03.06.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:35:58 -0800 (PST)
Message-ID: <d4d0161f-37d1-4b93-8b54-202e691d66b7@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:35:56 +0200
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
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
 <JG_h5JjMWB6vy7eR2AS1dqGGrNxZZgcte904oblinYLOAtSNIAdesLgsGrFpYyxekmZ1_FdEON9Uoua7GmkX-g==@protonmail.internalid>
 <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
 <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9f150 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=eFg4IZInNbfrhCL20lQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX5Ow/F4isTQkU
 JYNkl50btvi/UkbFy6A7qBw2Uj1Fo/d8d+Y1MyJCzgm2nSRZDx0RUJnHv1OKg/R1ZjVl7LmF3ja
 /AyrDXQTz8ADm4+ayRVoLxaUhPiJQL0eAt80n8SvVYz3qwubXJnN0Y3q/ehNi/TL0vKSOAekdJF
 ouOBxn3B8cTBoLDEVkTRGO04amacp6QK355wGPaBQNgeynCKzLeslWATO8aPdkypjHPaJPN+sjx
 znYEC94gw5nybiZnq/gqrX/ZZesXxnSzVffhA5e9VXBLc4qb8sSDcz4S2ugRdjV42u62tf9MgD8
 l0Azx++JySnFqwTQ69iH0b5V7HlsT/yVZzsBUI/WfHmZQpWC8kOHBfl4rGHlOtT+0iCLYXjb9oU
 f9lUqOABBdKch1cSyhgKyLdoUCDa3QRFW1QrG1MUJmLAf2ZPaBvPoeB7GRZWJ05mraC+zLaBkSe
 0biT3gTipgjeIvE6g5A==
X-Proofpoint-GUID: uN3MvwFGTNhYvGlAqsMctn5xexynhHCQ
X-Proofpoint-ORIG-GUID: uN3MvwFGTNhYvGlAqsMctn5xexynhHCQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX84DBm8f/eDoJ
 7Ph26HT1j7Lio8aVnDEODzykcArEFfl5msxp43LFJVPi3/a+rWzvd1d9bQTz0MQ6/dIxSOQ/xqB
 wCCFJcViAu+DmaSkJJf19rH1po6uMhE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030058

Hi Bryan,

On 11/3/2026 3:27 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 13:13, Gjorgji Rosikopulos (Consultant) wrote:
>>>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH
>>>> event but these require the CSID feeding a frame into the VFE pipeline
>>>> and the VFE moving through its own state-machine to process that frame.
>>>>
>>>> So they are separate signals and separate logical events representing
>>>> different things with different timings in hardware, meaning different
>>>> things to userspace.
>>> Well that make sense i agree that it make sense to be part of the csid
>>> but it should be documented somewhere, maybe proper thing to do is update
>>> the comment in videodev2.h and update the documentation for camss driver.
>> Just an proposal if it is decided the id to be used, it make sense to contain
>> stream_id. Then userspace based on the stream routing can map SOF
>> for the stream of interest. But the API for retrieving stream_id is still
>> experimental and i am not sure if will be well accepted.
>>
> 
> Ah yes right I didn't really grok your point about .id = <integer> yes I 
> agree with you, the assignment of port/line number should be dropped and 
> left @ 0 - also what is the point of stuffing the line id into the .id 
> field is not warranted.
> 
> Agreed, that's a mistake.

Maybe this is a good point to raise. My concern is with the multistream patches: 
the id field is also used when subscribing to an event,  so it would be useful
for userspace to identify which SOF it receives in a GMSL use case.

We can leave the id as 0 for this series, but I think we should discuss how to
handle cases where two different cameras arrive on the same PHY over different
virtual channels—for example, one using RDI0 and the other RDI1.
For sure what is currently missing  in stream_api support is the events and
how they can be adopted to be per stream/streams.

I hope that clarifies my intent—I’m not looking to hold up the series...

~Gjorgji> 
> ---
> bod

