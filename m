Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865985;
	b=TCafoc2zJ4CJ/xP2qJssoQ6BNzz02hgByans7N8zwF//VlVDHI+3ecEHzH5grCkRX/8M
	 0g6YFjL9+1fzAJPouu2d5NYwvA7i8P5ppk5ceKs73p0fWuWMTTFW23MUpPXoFO2xnA1nr
	 ErUhP/0txTHLLkoZsM42qXiBcwlqW48l+1Lrpu+kDJ/M4jeXFg/Ing8TsT89tk+9mxxgP
	 y4uipM3d/BewQmHmXtuJNjI9gxtO6Y2KM3bMLgsz6F1WcpYcylXoKQqnO+qyScXsWxqzw
	 pp4v1YSR8saUpZtZgMH2iFwWkTw0m4VpxPjtjX9P/RMeyyyIyXhcMuKiaMdyvig2Hig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
	b=Qq+d3PiesCSUxM0V1ridiNkklshYiJOURvh+0oFtcQimnLzzQQvDEtyfrtlCik7ao841
	 IQz3fjMx+Ib3r+7sJ+3kceB8o7YXKTDOZEw9e2z/WT+b6CNGDc4sCjgnES5nGZtK02EwW
	 noRYJJFbDywRTUmzHNtDCq8chIIeDqEv5HMK6qMpASaUe6mf+RawOjqEqsfYzBNBHhPSL
	 2FW4Ls3UzuK3MXQUIQVEmDx60L9PbEpY4kJQFG6qxiF3Mm86SRYi0PUk7vYkCvqcAWHNC
	 hYqbPZ6RUQsFi8v6hh6B2tFSkPQD2ZtaHsiBQtt0SeLaDyx44f9xmqRknuQ6I18QVVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyCcL2bP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSifANim;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7F4606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7F4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyCcL2bP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSifANim
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UZ8g595357
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=; b=hyCcL2bPYYDkie56
	xQ0ldzANVWAVN/WJmuSz0YvmE0YcO5OMBVmebfyZ/DtDdmY8P/5rSqGHwL9rrMwm
	vJBbdkS34hwQhsloWQSJbEZ7SpSlgl3ipOskQZjimZcTZcsUulE6YGYuy/HlgRTO
	8/F9fOiC6yTzUpOuMwLfkFkIih7HhxJzL43xRp7KHxvhQaasvDazgVDectHPO+Gn
	jFCVRX3zAXgx+45ZsUW7WLR2Z2J/xzA5mu2moiv5W327u9DJoY9z7gD0LsVQRfBX
	My7BaSCzdAWVr4yWeQphklmafcRjyN7/LQh/mrnXdfsYyaMUhqRHZGcFSK9mMZau
	avNsNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3cdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:06:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5476f5bd009so4284901cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865983; x=1794470783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
        b=RSifANimv0yEnp8K/iJ29ge6aNg8x4hP5I3RkFj2BpMAGzRjerLyBx0fj+QyoCOZuz
         gSijooXQNO+1X9oQfT5EH04mHW82yfz94Wjbw0XtqoPnl8oOI0uib6phUCkFRenYC7NQ
         xpQecf0sncWeGM716A2n7eFXNAql05e2hmZ8d6k3SXr03eDMoUDKgMvF4aHNgrgUTWpm
         V93rkK0OipJz1OHR2aC0Ur11Qwg7oL+k25QDmN721cPz39JwzrEdmGq58HnbnvOVpwps
         RdGRxuR3x63f0LAsAa+luLPGpl1NFATv06d79MwqYkpL5URMNeRaYrN4jtgfUewIj3Jt
         c70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865983; x=1794470783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
        b=U+r9uqbyrNOocZCXaNzxsFjyv7ZbONKC2We9TjWC4Ya6itY051cKwqghAEyiBP9e0f
         r5mnhtJZAXdy30B41lA5EkrWeVta6py24nPMNj+T1CKzPFVGaLQk1dTeY6VIVhpWbfIb
         YK+IMhO0F3Itpz2AvYwMQpNpmm7vTe9/DpXuxgP4VtZRxNmdzfo6ifo2p6Xxq9jxoPBu
         PKiVFBQKgdfJ1FLg/HVfmQ2wImG6lhoxG1yQJlHfkfnzPhMixar0F9QV26mCN1y62Gf1
         DOatanrFifROeODJes6euI+gAgJT6jnkHxTMz5QEC2b5vGWKrIBhjXyJcKNBmObHRLwI
         4n4w==
X-Forwarded-Encrypted: i=1; AKwUvBwXfz8yzLw8EZOfH+pjY/+yZc49LvBgOBp+j7i5MysIp8xxFFQ7K+wcLs2+0e2yg3Vni20hHpUgPzWnggE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+33h8rDHnf+20agfSA9j5fXuEm4PvEv2sogJncamLi9Ws7plHV
	QJ3yDOH2Ch6vxZHZzzbFT3ujZkZ0iQ7OZYOWKMHqE1JW6y+rxtpT4ePwrEI0m6vB8gJ4Y4A2UNU
	aEGJChTF7YiDBwzedcnO24OMBH0glGMmAJupXvlq4mawUdQMOuDI3AZ+cJubQqxktfVU=
X-Gm-Gg: AYBFou04A80a0Rms55JdMx+hCHKo62QY+2+7bxFIuOHTUapHCKPXKvWezXGL4rMV9cE
	qGwqXKKBeRhpw1rUeSLHTqTMTZyGBCPSL9gnS9lQgCmJzfT1Ve/b2QUEJSB/vlH4henMcUjVsGM
	C2KjVNSB/m35J/h45Bj/isjikIrbNwVmu1PG7mEUBFisyZ4aCZn0rgv7YcI4wnXvlyvZJtB9Frh
	7GYRKqhAJzNkZVjSzZ56Rj/JCVwk3V6tD0iAUHKiA8sdJhtCnZ2g4OXLCK9JP8uQrh3Lt+j9ocb
	pc1dZ7uLBBBcyT4DDB8rojPGSiCvsB1rgXj0lTqBrI8hq+14IHINB+KzWXt6TyfyPuzBOrZdIQs
	iLLXLN4ZXCEFRNMtzUiKLW8mZV8D2iiHavX6HYb0sKHFzu7EkeupRO/SVL2HlNxGLImiF
X-Received: by 2002:a05:622a:e2c5:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-54aa0ae7fd0mr101400551cf.3.1793865983105;
        Thu, 05 Nov 2026 00:06:23 -0800 (PST)
X-Received: by 2002:a05:622a:e2c5:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-54aa0ae7fd0mr101400251cf.3.1793865982586;
        Thu, 05 Nov 2026 00:06:22 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a771bsm145751966b.85.2026.11.05.00.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:06:21 -0800 (PST)
Message-ID: <2c31e18b-18a6-48f5-b892-b343f47907a7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:06:20 +0100
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
Subject: Re: [PATCH 0/4] media: qcom: camss: fixes for SoCs without IOMMU, RDI
 and CSID1 streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec38ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sv9X2YDxvq9Wc_PriaYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX5rwgYyTF8jDX
 qbc76qljqc8wDXWeUbOqf2Q7l2kyLXlbmODbeCKaoQB3AjLdQYXecI2kud7JaboGhNYRl3BNdQU
 jwyIFPLXkRn5miznJWBqP0HYkhdkio8=
X-Proofpoint-ORIG-GUID: fYbZ0q46BjXtgvxEp3PDx-heda8qStFt
X-Proofpoint-GUID: fYbZ0q46BjXtgvxEp3PDx-heda8qStFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX1bb48WoJKFYV
 5nmb4Pa1KEgjeUj7Pi7r6FlbmnQj57ulhfWeVamkqDSG8MCqUbH24Aan7QigiIKOK8DdZC5fvdU
 qP5SvyUEBh25fhP60Eh/EXlHTtYJmSxOI0ql7Q1fObraFxrruOmy9YE8eqE2gJhlezO9vR2r53z
 3R9lqw+gEtaDXTSkpwk4m6zBCha6mr8GV8FZgyYSlrIO1Xobqr9imO78EsoMdQwvz3xVilA8xrL
 qPopDO7vjVYMNmvCN8DBAPajeDOzb6WzjWJx16h0HpddyYMvAsaFUQXXIBqg19mKGBl1n8PTrZ4
 lLvyIEtBK7U5szW9rGIGneeK0xkqSddSDoI5gCtK4oXNXKMuxWet3s8QM2XrZACXdVALqaW/xFv
 rHCDtilOo9E7wN4Jj9AiF2FG8/X6bgA0Pt8WO7RZwHjaiM6W6Z33YKJ1VIzBQ2ObCBTvLS/0zbv
 BUuDFczyVbHxg74AWLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 9:23 PM, Allan Siriani wrote:
> These fixes came out of bringing up the CAMSS on MSM8226 (Moto G 2013,
> "falcon", MT9M114 front camera on RDI), where the CAMSS is not behind an
> IOMMU. The MSM8226 support itself will be sent separately; the problems
> fixed here are generic.

I believe that there is indeed a IOMMU in front of this, at the very
least in front of the VFE and JPEG. I suppose this is "just" because
upstream doesn't support iommu on that SoC?

You may want to take a look at

https://lore.kernel.org/linux-arm-msm/20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com/

+Cc Dmitry who poked at that topic

Konrad
