Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=Cee9oTy4VLu2vDVGVCOXANM1spMWaIzcqo5UdLjm1XVE5US77zX9HFxEpcYdkvzlYgNf
	 HkdxhlWnZ4D9Fapx588MXTic3+cf3GNgoekmmzZ9h+Mw4nj9ct78M/f/KxTPQoev2Sqx6
	 ozAwYZv060+7k/d2Z714RwHNH93IeuzzzF3CiJ0xO36xqU6AIywrvchVNd8N040oSLrnn
	 p379eeIN88GGB6mbDsMop2FJr1n6xiILpr5B0kZEaeW3S1QPt4KKidO3/T73d9sQfjd3e
	 2APRvR8IAb491Cq9iLEno6a2OvAIA+fhWm2/iPxNWGg9ItWbcyZ/eC5KNn6zh3Yk0LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=;
	b=A/y8UVcLbpAdi9wqR8WhiuO1RDeBMhFVPQkkXTUoT8a1ML8WlnJSk1XHGe+DEYJsu9AE
	 wLq4bYRB84oGihwuFft4reFseTraGz0QVdx/ZrYaxO+8bG+W15eO3oZMus/7wbnLKHLLx
	 yz20fLuw/kfR/KDVKAveIzfs5IRzAMGLrtxarh+8ovs6GMbSSS3YhfhsOBmCXqMoPF+rR
	 bhkk9/1T8EW7jhwOa92mMba9oPQCqRHNFpZ1lIfrryeDB3ltXvMLKd/ECLwJWBfQz52yP
	 O/rrCMjDfx17oHCjo5RsZZl/orXZSxgPOpPZFQLzNqXkRB38NRcM3cJxIY/8lLwNbRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noOnX1MQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jICNGaWY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE16077DAE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ABE16077DAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noOnX1MQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jICNGaWY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRmC3296046
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=; b=noOnX1MQVRia9Aj6
	N+ueNXJB+FcGxC8p/iBKe/96NLK3vje6NQvNs/bierFd9mM9F5TrlHtCnQxrnfmF
	8suVJwv/RKjVl6GzD/ijCABvJXE2S64+OMnoveHGQcfMVtW//wWnsudxibuIGOYn
	MJZ4tXcGsi+3MfgWSo9qF7naUcZu8r7S8uqYFmETTd8EBS5tHtEa//udcAjBLn+7
	SUnXtSDnJj9ZgB9uAdRunDHt2qGRCM1T0Jm1rlK6fIK1XDv+ZNHGzSKLdehVH/Jk
	R6Jfr1qIxyLjlQ9471+iG+CzF49qzame66TF7eHNGndhLwxCZryIwktmbdJeviim
	imHe5w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tmk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:39:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1580848eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595141; x=1795199941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=;
        b=jICNGaWYkqEfwqfrVD9C1lKkWIPeL85nnytLt+IfqpS1RqBeXwi7XTGu7tL/MvHnOR
         wiJwAWX8R4fIZHITrJO35jGRsE6FbUWjjMGjA3fs7D2wJmgJsVY0/Fc/SHPugJicMIlz
         OPDb8DEeTMYOxeJP7QtngosgQqbHbgQjqzB94HOC/xpIvH3BZpcwsV8kiB9QpOqfa1QQ
         lToBwwSls3zwwNgrFMRt9cJlPMwxnKnD9VgKESao7vzlvO0p+PqR8RskuR8tecPvWlC9
         fEnmPSH2GTFwawrdWLPle5xfbGct5tyjcF/0wf9lkoSQ2HhrusjEoK72p28ZasMLV3y7
         YKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595141; x=1795199941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7c8JL+q9Cbm7aNJEf8MDq8Yrx/mghovFmqSkIqYKJM=;
        b=W3Q/KV1OZ7AqdGrfGoS2KIFup/ZJ7H4UkQzEWUgYZ7/PLPEo0fXOHcWCWCGe/EcUNg
         cCrtnCdeqCdtdUDS4pnzN0elKrQV8eIaRhYdFyXo7rZ1kkku7Hh5nL/50ohpzeEBMibH
         rM+FE9Ia/1TZczKLSjAN3McHb1wJu2aI8khQHAQZ32SbvIXRDkdpvvO2+/69oXVf4wSq
         8088Dk5V5mSVrQMDVsYKRSLsKL3ceP8Azq2mRWLiY3HSs8bw+dyjOf/9GsMIwRNr+Uhj
         TxKpgcXvh7yCoVGJZTUV3g035GHWAk1IevqpaKZjCJH9M/JqjD6xaCV+F2OG50SvsAiZ
         CNQA==
X-Forwarded-Encrypted: i=1; AL+hErGFJDVtEBzkzSTAD4AzNz1K2mplmYyGh/OVyUUSnQhk40bH5MPcOsoo1ssPKjaxelRM/54937+Fj1fuy2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jDNBgO/q1opU8mWzjuu1/hHy4bvzDpJEUTYjOxXD4wYLNTziE
	UDX9QUNMXmUhft+VkbVJM1PKRKM7EDzQg9gZbHyZFhVehmRbx/awtSJIb6Ip7w6naqw9iy5MQOP
	2IrrcsqhYiBb3LjO1dNBGHkanyEDbcNVEQbZesTpzv4aY1uI1ETNtBX4r++H/tn53VQ==
X-Gm-Gg: AYBFou2MAxfgDqy729cV1mfEy1cUeiMLcBZZqxZF3HrLBaBzK7yp/eRzTO3IMFXBf5v
	VQG5oUaO+z3o19H1VeFeoJ71gk8frzl5ZGQ6xkbGaqyGgdzkXGpOmXpj0jhBwtcmHnAyuj7PYSI
	luT1EfHloBMG07eSZNJHQ3TmsluJcxCevOLGwKh1CVx5I0Yz08sHsbUrrTahLO/WN/hibKNIFKI
	Gbnh8CYNzXVdYPcxXZoSJXNqI9GJJ9TcS2fObUfbHRRxZpt9aPeC7WWjGmKXnreOAC6A1Inyev1
	BdwxLJuOR7pTt0aCV2Lw6D9ZePhvWpvdw4FsJ1/ShyXCSApSrInRWtHR4stb7uWPMXsAX9gyBFe
	VUGEA/x9SKoJmAQ5qR75Y9Ve8Skemv3BblFaHqDrqDb5IbCMjx23onujzLCrLNVPsgTdrhnZu6k
	sXLFoMTa0TYfJ7QXu8aROYjCKLNMBmIIRDyHHqoTLG9KaOqdElvXpSbA4j9Z6VR5rDYw==
X-Received: by 2002:a05:693c:83cf:20b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-379684b1ba3mr3617870eec.27.1794595140996;
        Fri, 13 Nov 2026 10:39:00 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-379684b1ba3mr3617846eec.27.1794595140468;
        Fri, 13 Nov 2026 10:39:00 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm14046781eec.18.2026.11.13.10.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:38:59 -0800 (PST)
Message-ID: <91d1c974-5910-4053-8f4d-6bb54ee295ec@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:08:55 +0530
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
Subject: Re: [PATCH wireless-next v4 11/21] wifi: nl80211/cfg80211: define API
 to notify SMD Drain completion
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
 <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX7ZxqjfaToEmU
 oc2KXX1OxE8lL+zWfpeht3HxeH061kr50I8uojFahhLWrTESK2XSAOlEg2ZFU2REb5tOUIEWAO5
 ly3XbXWECAESoMlbkO9hE4XGGqnf5dQpZpa8hTlaCliYWiOXJLUWz3hQwYuA/5pupi+AeDIWHBm
 7QmyhmlFJCLds0plQbJu/ykFI7YS0aGbZLD8ciCP5l2KK7QqBpjcl8M3jaXKL481iC2rw0t72BX
 Fn1rY+Sdc7dx/Mj+gVGVaKCFEFCvFI4tByr+t2eOE3dGL2S55iW6EvwMYRiAouLxUSOo77r+Yfl
 sfjy3kX9+cWArKXeFJhWhdFrC/2+myjmAW4qD4iFGYhXOCRxVH/6I1JhrM5M3LHpqAXIJhXrCZa
 irB1YLGrf6HlNq5bKPGU4oLuW8UVkwkmR8PnZPR5UXtFZEzvvB03R5BLfCHDZyyd+rvDnJq1yqa
 ks1uREWX/Bfp52MgEyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX46pzuUojR2xq
 frUBamWAFAd46OWdosvveI3Ee0gNM70wcioHG3XhIUnE4v0NyRIhyWxxvQAfCJ2G78HGyuGsSZp
 D4z8hKco2mXnIGUcGbL+nxzM4m+Khs0=
X-Proofpoint-GUID: ctI_wIBRuOrkEi7xbB7Zv1HN31VSLFO0
X-Proofpoint-ORIG-GUID: ctI_wIBRuOrkEi7xbB7Zv1HN31VSLFO0
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af75945 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RKf9KYSdOsptWaLQyIwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074



On 11/11/2026 12:31 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +/**
>> + * cfg80211_notify_smd_drain_completion - notify userspace about downlink drain
>> + *	early termination.
>> + * @wdev: wireless device corresponding to the AP MLD
>> + * @sta_addr: non-AP MLD address for which DL draining is being terminated
>> + *
>> + * Should be called under wiphy_lock.
> 
> "Should" doesn't really work here (it's either must or not), but anyway,
> why, it's completely unnecessary?!
> 

wdev/dev access in nl80211_notify_smd_drain_completion is not protected again
and it might race with a DELETE_INTERFACE. But I think instead of mandating
wiphy_lock here, would it be okay if I changed it to use the wiphy_work_queue
to post this event which provides safe access?

> johannes


