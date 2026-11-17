Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927820;
	b=oz2XCZOMsHLZz1GORBevaFGYMYCPxun1s5B2TeUO66/Ty0258ecnVGGohJxdCHQbfYkO
	 Fch77+z2d/SPsT33uhRfvA4+r+wZ6tY3ACMjodkVlAzQW4Mp5iaWFjjfnneN2ielhSC7S
	 cGnWS7m9owhMyo1A8m4zcQGbE/CIII8K1j61vMrP8iQlOImcZNqLBoMuGu7Q/6L8yl+o/
	 uo863eQzmi5eiMph3lCYSV4uGUN9qtPWnT7W7crFuXQrvyY+joJL8NDW72ZmRDOoCw7UV
	 5gCa3WIKrilChMAzW0zgxN+bTJIuKBChHxoNRMbxUPIkCoOokSlGnC7K59ZYo4e0HGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=;
	b=4FUGpUS2mA7lHUCxRNo1ypAQMYJNgEta+LUoLH1JxBH81ckfcXu05UpFhvpV7QO/ZzEw
	 nLkkcF+QaGOsOX3mCGfO1X0ILS70eMmJFVug1K9QDlfEFc82IyxU+/myDiGy50Ohb3N0b
	 ZvFov2rQEH45ojZlVW6VT8uOi3+/6igeEQJls6L4VJcN5VYko/rDYXu+UD+KCrW9IHM3Y
	 zrlRV5LWq6tMaqfBe6UpWpapmLjZ7YUt56muWHWMcj6fNw+6WJdR6G9J3Ef6R44YGUxL9
	 ub5YXVwbHNfNgATY5Ptq0coHZZphJitkw0HScu1DT+ooUSC4aCMpd/LCFUckpP4AN1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IjYLqhvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZ7wEJSt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5616A606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5616A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IjYLqhvo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZ7wEJSt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC19ew3713906
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=; b=IjYLqhvoDTx9eYks
	sIT5oTYw2E5MkagUa+mevANfzpfmGN54T0YhBs+ckHnPfL3vRHD4/lR2Oq+faCym
	TFlCK0Tol6wN+jll4NzC3tSrIjdSks89yw2MMTpasHQanE9zCgqpwew0ISI3VEj7
	heW9VdDAu+IzE6fNLNa3lG2txvlouUdVxDKlSfbBETkzGECWQ0+i664otnL2RFI+
	hZqlPRN7LTZn+k6Z8MQKClujYwgXm6BzxyHxUYQTLPBU7YaYg7BxuPGtbWsc7WuQ
	4VBCEAZ1Lpc952f1YLSaMkayrqmaaAt2mzBu1vtWBcV8R4Y0JcS8WxF+VuQaXOXm
	TK1G0Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve21fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:03:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso168234e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794927818; x=1795532618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=;
        b=iZ7wEJStucinL6uy2ztEuKeeUwyHRaZlGCIXOV39fKUo8SnOdn7JWB/Vg6pEa41QIZ
         PtntL9K2UBg4+yjnC9VkpLn065IaqBHR4vxI/HwKTxs1nw8X3vWxHiUXJbRWuyoU0Y4i
         I9MUwg/KjCaeMqKijxq8Rhl0Yh0Yv5px71QUO4Xo7hkLXw3TWbkKydo64aNWuGB6sxrX
         KEMTLRICKFa/TKGsdImux1kw1xs9YNliBBxxbHjw+G3/hRXS5mG67l7vK2woiFpeRTnU
         A69IIGO+dp4uYcshzYT9TGORFXTowYDDX7JvUvV0GYTq7nZ/nuRLXlXxNFAAHb1jl9t6
         /dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927818; x=1795532618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhDkCY+HRr1h2SeUFyi3k83ZYwhiKXXvaa6v5p+Q4oQ=;
        b=LIAILKQG1n/yfdJPO2FUSwa/lVbOtxgYGo3DEMi9jJnFIDO6zEx5tZAmes0CdNi/tt
         Y2gbBwEpmLyG8SbNqpEf1N5GUumQ44Q5Qxzkg2L6DJWHotQwjufpd5iINdNCNbFwJ+iL
         ADdS3grWbHlika5K/SyJ7mtTT9orEQTuy0/PSUXZWNvbxDkVhByeZK8BR/mKGQ029i3w
         4XXzBVsDlmDnhy0fgRtIR8r9GdhZhWSiXrJMwhr+/aNkw2npYOR8MPM/bOQqdnnDk6ut
         0EHxQJuYz3JK10FiUCwYo1xDgeT6el3txv/kmGB+eKROolI2nhPpCg9PWciLGyrDF/e/
         +kAQ==
X-Forwarded-Encrypted: i=1; AL+hErGxDOYTNthX5c5WMvH8S/E7w3PawFq5uC/Bt4jrKnJlXD/wRsB0v8RVVO5wftNx2bqbWje9eaa11zLUPHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BcMAEef+RjlWsKg60wf7N1cltLzA4ulsd1nDRsyOedt4Ir/v0
	Ih/fmAUynllajaeRnTmjw5YZtgoIzbHuKmbnQtcCbC/rv8HGY4dXDzqIdExYqraWjnaqj35jDDi
	DcZnsJzdZlXkdmYq7s/mq1SXAVmGGikL9i8n6kQfaNMqRzaDBLClyUWVfI/7ars3jcr0=
X-Gm-Gg: AYBFou2UqSuB+qWBsdgwwfD9NcXjrJOf/GBUK1vGDnMJtl0h+GCpf+wmy/rwyHQTiU/
	uqL/Lop9+5+NEt9KKdx/YX+8B4xMkp4yHltk/OSWs1OKzwOAYFHgWO5LHc+5QS/wg+hoJcP4tgd
	Pi28Be5kK+RgpcU2uRLH4OmwKdqrO6TZLnloJV2F5BIib33RTUDFUidTAlYRijPURKJxD4grhnI
	CTxRoHJSyuPsT9M4hz53jz13dcgNq3osFytb2wXJcDRzDg3udWM03pq+9b7Iobbjk8GAU9MxWrr
	I9kKvmQDAHZ1WhOjxYXd0Igw4PFeQXs+O3trNIzeW80U7jZPGJUPrJ6CNGE+F1saD5XDQlizB3E
	I1HjgRVCndOYb2ExwImH0pi1vycl8ox2xWo1pFme78usbOq46ByHwMYnbG9P7uUQxpKUncSgxZ6
	a3jR0=
X-Received: by 2002:a05:6122:3b1a:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee344e8201mr6488208e0c.0.1794927817999;
        Tue, 17 Nov 2026 07:03:37 -0800 (PST)
X-Received: by 2002:a05:6122:3b1a:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee344e8201mr6488100e0c.0.1794927817243;
        Tue, 17 Nov 2026 07:03:37 -0800 (PST)
Received: from [172.20.97.52] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad96096sm37231895e9.9.2026.11.17.07.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:03:36 -0800 (PST)
Message-ID: <c0b63f73-6491-4da9-b550-f5ad3d276415@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:03:34 +0100
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
Subject: Re: [PATCH 0/3] Fix up AON clamps on qmp-combo-phy
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <179477514161.135135.15496134606156270634.b4-reply@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179477514161.135135.15496134606156270634.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfXyfOhwC1H1e52
 jQR6FXbESGDxguHLZ2CBzFQjGQcD+0Z4Slzuz8/kTS/XEMqn1sVc6l78d8doekrEQ56pB+w4sbT
 gcXSm6Q7/8nUURwwoOS05hvkxuSAby8=
X-Proofpoint-GUID: c19zHafhqm3crjkuADn3HlaxU2t_Z8yx
X-Proofpoint-ORIG-GUID: c19zHafhqm3crjkuADn3HlaxU2t_Z8yx
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc6ccb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=R_VssaL8g6-HNQvAZl0A:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1OSBTYWx0ZWRfXyUz7jR5WNuew
 NBJpZ89sEyguaA/8F2gLTbrYZGTRAVI0a8PteHswuv8nByKWly86sLCCNI+NfRJzE0THKrWbprm
 RgZv5H6ua0WPh516zy7H+23U+WL/zT3eUZG5K0SMmmumEYLUS17niZ8qHCZjA0n3ATkKgteP3Ti
 9Om91SV5+hsJ/ym8t2CQwKgZTXUOOZ7Zts58dEca9mtPXJw3aKeZCyS5TcYGTv3pOa/1ncbrgBu
 2KSb4uM0KXwindGb5xzl3kyjvpxDLRJEzE0+Bd/quRphRoCofOzQTmgbMvr+UPEI2H3QJJq+Izw
 ZVOEr9CrKFLn6I9kAkeRtWwNaw8i4g3agKXsycHnIGE1gKogQRKwYnx2lN+YX+uaTaiI8AthUxp
 E+M4+KH6rJGiNizIqVHaz1g5LA35ghYQR+n1AtsOv6CHpj7XYvtW9uiKaxo7N/K/cRFNXVQmewJ
 DGzXQPbFX0px8a90HWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170059



On 15-Nov-26 21:39, Manivannan Sadhasivam wrote:
> On 2026-11-02 14:59 +0100, Konrad Dybcio wrote:
>> Various platforms have apparently not had the AON clamp writes end up
>> at the desired registers. This fixes that up, based on the robot's
>> findings.
>>
>> Depends on (reviewed and ready to be picked up):
>> https://lore.kernel.org/linux-arm-msm/20261023123512.1912-1-26rote@gmail.com/
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> No Fixes tag for any of these patches? Anyhow

I concluded that with the amount of churn in this driver it'd
take an unreasonable amount of time to pinpoint it exactly

Konrad
