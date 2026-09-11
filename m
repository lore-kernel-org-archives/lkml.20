Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2343793A5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116924; cv=none; b=o2lt2yrygNzqhqhQii87oEp5XlH02sEm7gcBzdugckPbi2gYQAhfkPu0KRx+2uZ95kDKP3Y/f2utAtd/7LVTpvAcJXeUCxBmUheWjY4S2fI6Z9/OXE4IflPWzdUBDJF4CbIdEvsBoWUPh2mlJQno177OjnxTRkYNp+mbtxfkK8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116924; c=relaxed/simple;
	bh=2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDRaTJzTtN7W4aA8cxAPDdioUc4EBUFM29BW7ow0PgaBGOvGn2p/bkhRE5mLJnk34PdLP7U6MT9Vzfhzkcr9mWWuvunQ/tpwI2gTSuqTaz5je3zqnIcHwAFvBx+WPsgg4VOnQmeZvFzz8T8reYdEY2hjsC7RZyZiRPljKxM0IIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ9hKgyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu1uBLoA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ9hKgyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu1uBLoA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7knqZ143886
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=; b=XZ9hKgyi+VqKDRWt
	Sg79lJotgtVbJzymLntOnFnfzynIR8cLozJoYcxA/gCQ4FJJ0bIkAwrITno1PjuU
	LGCGxpRoFO/BkTm3UaI/8nqBSkGAvKG7vjmSKclfHlmkZ3iGnxdqJqmDmM1dpizM
	P+z561EgSNXDaS8XtJWoAoxJSBy2STweaO55K3pCIHCD53EC+z2m8MWQL+EtPZRm
	eegor3/SUMQk9vO0JGpaaPISO2LC0d3zImu6cu9oqDzpmjb5Sv+uq3DY2ecd7cRn
	IcLONC5WNKYXI0pmz62ezikhtyTwePRJvrDS4h0/U1ShqQlVwUNzGCBocy93Agyt
	xX4gHQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd38tyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:55:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cc288296fso904536d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789116921; x=1789721721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=;
        b=Bu1uBLoAD4la+HwFx3HmKUm+7OXFJdMKDI3KjG/Fc25zlrMfaVeds6bDW2MUlcbx1a
         GaZIs66XX4pZAzT2LhJEQjLUb68mbLxJcb+9eHz6CNbJqQz+IkBdffJOb8j2tnbtuiaI
         oQGkWRp9K40g1hGJDjUERoceT3/j6Ik5FufZciDy3tMY/BVc+qWH2WL137JPE5bLxkr6
         wGy/a6NPjtX0i/8HHMkiZYI9zJrVWY4WhI5SBb/FKvas4dKxks3T97/KfSFa7Nt2hzd7
         6ZTFufm/zi7aupMX0PbHwV5bv6FzVosrIqfZjPG7iRmwmj+1KNvhJnwMfJvwNhLcRQhu
         6Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116921; x=1789721721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IbXZHi371lo7FXX0zW3IyQ0mtUslzhc6wCLyKQtbjM=;
        b=EsLso6BfrolSC9ZdtGUwl/ybn4XDWBMcDwvmBHQiG4cFVhkJFSOghFRnNF3mh+kyye
         VZbbXB0Bfz127x+q0jCDvX2mIYxTag2Fc9oW0P78Njg+viFa0t4d1dSgeMeDqHrogkuD
         NHyYQhcWqvTPGIt/+m/YfBbmHeuMrjjC0RdzaOb6s7bRqWWo33nVbLaio8sE/LcTCMyj
         qBxuGtDgppVFbWIK0yqi/FJZLESFMbgeFXaYCYmFLZFCJw5zLypRxMM6W07D3zZ/+EVz
         EzLwQBXON16JTiKe3J4IvW9RwYCBjGH4B12aMmuGf8VAq+VHlsrBPDtcTHoP+ma3IvMb
         Pa2w==
X-Forwarded-Encrypted: i=1; AKwUvByos+fcVRTTvdkNI4VjWtdDXQ5tQfJlys9+VB2uPQW9RUWQMnu1/YVccM5k+Uvt4FSK69KeIhS9kT/Vxz8=@vger.kernel.org
X-Gm-Message-State: AFuF++mN+WBfVDp2QOVoaru7ZhrnWvuJk+ECOXNSTClPVDm7Bqnf6dWn
	WhI2jrv8cyVhdYABDYzrRxWSiM61q0B+PiDMeNdFG7t9BxcBI3cV1Y4CxHFXHSClRPqf67Iwgnk
	4T8Snubf0gz71IvgwTS2GAOx/mchD4U9Dio+G3PdBUvfnH6En18D0BRDoy+D0bbYyfoM=
X-Gm-Gg: AYBFou0zbQDrOynv56BDV3FF9mI0QejGTxAxG2dVOZv0jtMdxXLDJEQKfjCpQuAuOeE
	3ktSnsaZ5U1ufq3IUuTeqd9hFv0CrR+alzYGc3EM1w7K/ihZm04bb7rakl/Jj0aF+e7wk2gvqv+
	2TKJErV8U52gWPZ9v5hM9f4CYREmFVhj9MU9pENa1ABrnm3a2YGIi/GGfq5F/kvl+EHyK0gA3iX
	HQTw2NCXD3OxDlo0NeLZ6Ghzu5qBhvO5tjT0qXJCduieB+QpYy5Kojz0VyB91V6jdCGzQdkAokO
	kQCNkZ+qJEwVdvoZCAXIpamtiPjlYRCRE0CEh5HbX0Ak779lY43zsbmuUFYj9NKntMU3+O6D6Or
	+j4m26oPHNGDJ385YsHJVPg==
X-Received: by 2002:ad4:5aaf:0:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-9121211e4dbmr33150856d6.4.1789116915943;
        Fri, 11 Sep 2026 01:55:15 -0700 (PDT)
X-Received: by 2002:ad4:5aaf:0:b0:907:8b2c:ef0 with SMTP id 6a1803df08f44-9121211e4dbmr33150686d6.4.1789116915562;
        Fri, 11 Sep 2026 01:55:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608aee3sm56924666b.37.2026.09.11.01.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:55:14 -0700 (PDT)
Message-ID: <477ff72a-fe0b-4c23-8448-a0ec87c7e039@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:55:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add driver for Novatek NT35596S panel
To: David Heidelberg <david@ixit.cz>, Sumit Semwal <sumit.semwal@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Molly Sophia <mollysophia379@gmail.com>,
        Arnaud Ferraris <arnaud.ferraris@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3c1fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=XtAJtvJZskthm95za0cA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: c4UT7dS2TqpWLyo4FLkf8Zz-wMcJQURW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfX1ox4Tcw/3vAk
 mcnIG5ZRdJEsVXtvQ/gX4//ZrKIpjFVkJIf66j5VudMifTFDcmQEYUxKIF4sM8qOBaGUysBNCLI
 sk63bLlogLJJSZaA3eIy701sXgcnRSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyMyBTYWx0ZWRfXwdw590glAyqZ
 jat4ibn8Zm0nH8eNwTRZY0Q9d1SrTDpgfl8mdIuaAVardl83iqcw/O/wA5uUfg1qKQbZP6OWbjq
 kVbLVcDY1OBdU1Aby7aZ5da/A8OrQCu+hWA+Fn4uV1hicYFBEeySKe+ShYG7ODACuh/LhMT6IRK
 EqRNlExSkC6io2jHZ1cfYROY9+S0u8rszywq7lfIvxqJLHUCjV3e4rcjwciSECgEF059He1pI1G
 9AVlGv+59Km+QpHSdQUxiTqc7GgS/yDAM4u+VFidm8FWE6X+5n+cQFLb1H5KJMrqPfWmovfCLyU
 IUNR7Yaau8FV4hXm+qkQWiAs9aAZ8g4akejvaXuOVThmOPVHPqW4rfYXHFJaeDJqix7mPMun280
 rFxIff5gM1OJJklCQqeN4aqSvP7oP8OF0benV2wS4ws+nzYHIF1xaaBC2wdrCLuQIjLCE95FaZd
 dKYa6hL0N/sp4q3VnEg==
X-Proofpoint-ORIG-GUID: c4UT7dS2TqpWLyo4FLkf8Zz-wMcJQURW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110123

On 9/13/25 9:19 PM, David Heidelberg wrote:
> These patches add support for Novatek NT35596S based JDI FHD panels.
> This panel is already used by mainlined Xiaomi Mi Mix 2S mobile phone.

Hello, are you going to be following up on this?

I noticed we've had the jdi,fhd-nt35596s compatible in the QC tree
for 3 years, without bindings and even without a driver..

It's producing DT warnings, so if this is not restarted, I'd like
to drop that node soon to quiesce them, with of course proper
reintroduction being more than welcome.

Konrad
