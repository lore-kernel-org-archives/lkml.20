Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659993;
	b=D6Uw5w3qd0aMPU7bmo4KYUBaDw5xYvxCHHISZZ0NK+YkYfiyRFS/8/yHdRVW4pwJCVXg
	 YGPZkBsoK0dm7OyXDk2KFll2L2/H63ULVvMzHT31NBnhRAbCbLq3D7uXOg1xnCnuJbGlE
	 ySMuAdQcX+MvFF7wTj3VpQiQ0GyflC0Iy35MMqQM2DXgPyTYlzAT8SyNS/jXFs7UIEFVL
	 lSpZpTdG4be8gHHnYdJnSBYhSRTM8T0dCarhb/Kd7H9/Tkb95lfhFTLpioATA2p0hwSvZ
	 5CNCS0wD9vlccqgBbpvOWB+lY1F2w5utCcFdBmehq9FA+cFHMfmD1JyBws1/p16nuEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=;
	b=r+I2Q6LP0bczioeuKdmq/2C7zWp95qByiZb3l9rHle27+qavaV1YEoUy4n5CiroNETXU
	 IFR+gdpL8TQACj6jLKVP1qHwhyYI+RhC7BD+3WUtEKuWio8Ux3h1gEfq7nYPaAW1nqHaS
	 4KBJQDF+A5atW1pxsRuusECFRWm2IEo4FMe9dzP0jmwVq9rLr/FQ3f1jgg+zssRAPmwqk
	 DriJk84u2d/Csoi9H9b3mqprSEncJ4XCauolKmnlkpU+TmcAeemtmouKCnRjLssl1Xj8s
	 egPNQLz97KeSBMZKGXh4VLsw/CEE1I1Yr7GCvdX1GBnh63cRQ/HIVcTdVBFxosGI/wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVzHEZqR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BV+Xi4PL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67164606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67164606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HVzHEZqR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BV+Xi4PL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xqaJ2171930
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=; b=HVzHEZqRXjuNxTUw
	Y6uNhSObfyF61bcnJkBnCdKjLh2B9gfCcEOYKFVF80ZP9qq5J9QyopCgrdBPa0nc
	kwNbh0mQHDcrih5EhIc3B8VIlpxPuv/GMh5UHAIQGgahTUfohjr3aXLxNfTVDbii
	sUoXr0b47H9f0/xixsACr/cjW5fq9e22EsUNry29sACOHOma32LkD9Ho4mFQnvIG
	E3aJeuxvAnHGjoKOfJg3lWAokAqpp5Nhg950biMkiFlmFBZwChwmFFCbC+jkzhnP
	J+aBNOBcneAZasrkKP7mqDC6h3YFbxtlEEmZ49yS2BVlRf9zb0TKeK8SGDQOzvps
	EVzd4A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahkgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:06:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1818929a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659992; x=1793264792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=;
        b=BV+Xi4PLji/ZeVGnXdtQQcZ0ZlhOAjJasxdTpZmFyjePgC/3NLnEkzHTrPe3y5ZkRW
         +5ZyScxx0H90Ua1stiFs4x7ixx0QK0645ZdqMFCzSTKM39DuCNcRUzqL/Q3VMalajjHS
         oTdYL6TWFPQpoTx2Hju4ypyj/PnidBEcs+skAOnm4Uv3a8RJ+QMiN1ybQtBNDfbhfoTt
         oX8NTEILsc33r8Q+po0yqLafJZsVXesCn3Zy+GQYgGHM1BePtZYJojNwVCt+RTjyyKEM
         +Y5Eg4emBmKWTYUR3qQWL3LqF/k+xhFysMOpKUSkYLqIa0O5QeB3C/frukNTna78tbWW
         BHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659992; x=1793264792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npHEiXGMMSXSXF+CGuDidepu3HoUinr3fxrhvRGkkok=;
        b=fRTOGM3zduMet9Z561G+PnYfrGYiiZQJpnjrgvH419QfoAbNCrbrOtf8iQOI47cqw0
         DdRV/QJ/LESkEMPBYpmqhDRT3bJhg+e8CwMqKz3OpuUEFdPMC9SV5TeYzpDM3Yzzo1Kv
         wjKnNKJIS2lnh5oA7I6yqSngc2h/Du7FyBucx2SHOIQ2kFstbAtMEbtEEpOaw++66NGV
         3LLz6qVAUHcAUGRWN1cZLjiK8/BHt1OSQovrDd+j+/nVBzgkgYSbd3sw+1KHmfITWVkb
         XOCjGUoivJAiyjDRZfLwnlRhyhkAT50315rMyTk+7Edu6TlGBmKZ08laPVM2thDzg3iM
         JVWA==
X-Forwarded-Encrypted: i=1; AKwUvBzQMqs1yITbAzvH3Ce5qJIrXq1pdvedgV09BOpj9krhKqQeHFuukWG7KNwIS/9639JwVFozf4gtLNTaYjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuyE2/Bsef81QoZ0hPJMSxbmuhvGPC/plfdzlN9tqk/7kD7KLN
	dEH5CLFEug4mm5o67DGRpUnXTSbfKOgSBKqJMHXC6hX6ZGHEw2YujFjJXsX5HMslkIjX/OysBDD
	RiU6sog1rAZoFRcUztyv1ZsEw3i/oCZr5H2w+Jchv/V/sOgWmxiuQluAhGBligLv/VYo=
X-Gm-Gg: AYBFou00xdQd4qdTzQGrGNgzI0EQQZif5XEc5Fw6JCJF3IoiG6ylcctWxQ54djW4Zd3
	wQxYQr+rltySZXkgBvQ+bJTIkbPWpHIXC3jXXSAS06rJrGyVyLaxE2/AfaXzyjPx0UjHglSxKbA
	oCenlvJANs0kCij7DCrzRp+JNBnbd7rt6961Tl7jExbmTcJ6gPWViG0mN3T/1hLgcOf3F9h6UwX
	6YNgcnO9jfX2NUcf7INO4/GYZOAnEAGU6gqz0xkPbGSTY9qfxoiMBr+VKx/WgeYqOEGTtq2UvYN
	jtposv3aoyUt0ckJJ7dBCA1P3d/PgSw+r5zNueuPRRRV8fqRLDKUDRhjCGyQT9XYbtBsLVPwPrw
	/LbGTONtvVByoXJuV/wUotLtxHR7fs0Fs
X-Received: by 2002:a17:90b:4d02:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3ad86d27ae5mr3754002a91.46.1792659991916;
        Thu, 22 Oct 2026 02:06:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4d02:b0:3a5:133:ca5f with SMTP id 98e67ed59e1d1-3ad86d27ae5mr3753983a91.46.1792659991396;
        Thu, 22 Oct 2026 02:06:31 -0700 (PDT)
Received: from [10.219.56.252] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad83482f35sm4051702a91.1.2026.10.22.02.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:06:30 -0700 (PDT)
Message-ID: <a97f097b-551d-403f-ac7d-726917e5b42c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:36:25 +0530
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
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
 <9043efbb-7883-43cd-a09e-28fc5304457b@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
In-Reply-To: <9043efbb-7883-43cd-a09e-28fc5304457b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZATzydacFvWfdZdE0rEA0iKMhDpas9h2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX3heUcTX6U7/L
 lr8BqdnyUMFHxKizrbdZ5Us+NZcmTKZypa1ABfJghMuxQPFeSFt0g4Fnzr5XYhzC6WKlaHgKmee
 dTBZRfpnAud9xh4XYPO+XvakpP5xbzI=
X-Proofpoint-ORIG-GUID: ZATzydacFvWfdZdE0rEA0iKMhDpas9h2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX4RncjBdYvaE2
 oOmKdR6NaEu0UdiC9/HAbC5PbrW6IIwdCdKzzNBvuy0U4M8pT7qcsB9YvUbMC/LKov2awMzhfG/
 vwzFiYUEBxb6fW6HS1HHrU6ltRC2Dn+CuYycYJ57vtooGPC83o3Macbkz6ZFr4zmDUjccYe14FG
 XylNewcUZo4Qu3558RPbIwfcKrEutHBNDJAJxF8jyHf37HShwX6E59J3N+b4SuSeter1ub7fsvz
 Uejft886jwfc03tawsTwGoHdsyc96pb3bdXpwLxJZEMpZb/eHAgoJs3pm+ZD5E8NGq2+0tiMZqU
 IJw3qFvysQzbmlXlLbVvyUiImOXZrpA2mGQb3oud6CiDz0qF5QBsmA1I38rH4aiHs1m0gZmIsuF
 j7E4o9EzIRNsaRkhAm8IeMujtR1j/iNIKcg309KagvJsIgSOcoNwt7QIDIQ8E2c8iMAjf3vwNUV
 BvS+L+LpuRGNIY3MV4Q==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d218 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6-TbrlyARiIxoJeac-sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036


On 10/16/2026 3:33 PM, Ekansh Gupta wrote:
> On 16-10-2026 10:50, Abhinav Parihar wrote:
>> Context bank 9 is reserved for secure use cases and must not be exposed
>> as a FastRPC compute context bank for non-secure offloading.
>>   
>> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
>> prevent clients from selecting a secure context bank for normal FastRPC
>> workloads.
>>
>> Secure use case support is not currently implemented upstream.
>>
> can you add Fixes: tag as well?> Signed-off-by: Abhinav Parihar
> <abhinav.parihar@oss.qualcomm.com>
Ack
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 16 ----------------
>>   arch/arm64/boot/dts/qcom/monaco.dtsi |  7 -------
> separate the patch both different platforms, also please include other
> applicable platforms in your next spin>  2 files changed, 23 deletions(-)
Ack
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 695eae1b7256..5481dfb73454 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -7861,14 +7861,6 @@ compute-cb@8 {
>>   						dma-coherent;
>>   					};
>>   
>> -					compute-cb@9 {
>> -						compatible = "qcom,fastrpc-compute-cb";
>> -						reg = <9>;
>> -						iommus = <&apps_smmu 0x2149 0x04a0>,
>> -							 <&apps_smmu 0x2189 0x0400>;
>> -						dma-coherent;
>> -					};
>> -
>>   					compute-cb@11 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <11>;
>> @@ -8000,14 +7992,6 @@ compute-cb@8 {
>>   						dma-coherent;
>>   					};
>>   
>> -					compute-cb@9 {
>> -						compatible = "qcom,fastrpc-compute-cb";
>> -						reg = <9>;
>> -						iommus = <&apps_smmu 0x2949 0x04a0>,
>> -							 <&apps_smmu 0x2989 0x0400>;
>> -						dma-coherent;
>> -					};
>> -
>>   					compute-cb@10 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <10>;
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index cfe39f923224..e73a735f2f13 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -7822,13 +7822,6 @@ compute-cb@8 {
>>   						dma-coherent;
>>   					};
>>   
>> -					compute-cb@9 {
>> -						compatible = "qcom,fastrpc-compute-cb";
>> -						reg = <9>;
>> -						iommus = <&apps_smmu 0x19c9 0x0400>;
>> -						dma-coherent;
>> -					};
>> -
>>   					compute-cb@11 {
>>   						compatible = "qcom,fastrpc-compute-cb";
>>   						reg = <0xb>;
