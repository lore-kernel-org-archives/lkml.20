Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664543;
	b=ZpZeCqcAn67tJJ3Lzb7Ya0aQ+eeYCESFj1+2HwDRnmRw9JoH5xSNz8cy/E4co8jgXF8b
	 XUjREdCeAOfmLWBAc9JhUnzaIjcT4Lc4/QC1qpExZULGXCRfd6VBuFeNKQNBiratjivia
	 uWuW3TLnzcVMmJAttDWSEQUwegq4qEqyLycX2USZGN98MOifoGVbgemMRMICa4mSPMWHI
	 m5v0pnZXCTk3GDGYmFsvtIJJQbV1hpGkWZnl2uyZKSR0Fu+S8895nlj0vjokKI3PFCEBP
	 YS22+5N59dKSwf1htiJr4oPi4lMvkZp/FOAY3G0p+v32e/U9CX8jaV63ZbWJWXV/Zog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4F3Bn4K4Bs3YPMzyvcJretv1uwSXuk9sX9+2pTIfL74=;
	b=nFa1sVkyBqnAFnXJTJXOaU/ofnqpUSEkbnbqkP7FMZnNmCiDpVKVDU/jR1y+4A9kI26x
	 0CfIE1Hwa5CPJU5B/hPSw+sfNiqL9OYbz8gZQdsqhyyi92TIYaxxzk1KCiHTqCoeZbpLv
	 t3T1UpgVEa1+4/s19hQ61NN3yUaUSvGjd2iaAP14MyQtVUbcvyMOH5YNINKADahPhr4vJ
	 6NpBIOMCDU7emFe8wVtxdXp/tNRNbrPtOvzaxYm2xQAgL5dCRKz53F+VK+sr5hFvo793w
	 TwrCHtER4kUFm7MxTvYltkmWAFrTl4uEv/a3+JPQnoB4fpCHoSn03cDTWVGRIX59LvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNanIS+6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YicCycm0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82D606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C82D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNanIS+6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YicCycm0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06cb3427069
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4F3Bn4K4Bs3YPMzyvcJretv1uwSXuk9sX9+2pTIfL74=; b=JNanIS+68yj3BCZj
	JREOdna+K6DvJBM6Ee5phe5EDE8FrgICg27v+D12qkExFPJckHRot3C/HEdi4TC/
	Bi+5hMHnX+vRkgUdJHznoPQB63Es9IIWnSf1ANK0AVHD8VNRxK8kh8Gka5LZcPlM
	MQ0SmC3/K/ngZ3rEs8Q3tBudrXHgsHNJtS3vDIwe+hOc/lVmqWm4+wMM0BvfrV+Y
	eODPCnFOP7jkWMGjLcm7LEiGapDsYHk+3qjzr7Dz6/29dAv2NOntgrQTXSbK5s7r
	E4TGg1oX0eW77DmrEzLsz8hP9+OmvuHq/e3tEZEWh48hgDTfOKgqagRS97yc2vAW
	F5mPYQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0m7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:22:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso443320b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792664540; x=1793269340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4F3Bn4K4Bs3YPMzyvcJretv1uwSXuk9sX9+2pTIfL74=;
        b=YicCycm0Cm7cnWi1yEVRn4FVsYgnMm7CnVtBoJtRlH/a8dvq5efZkjWjKRbburoi9c
         KBUdU8onJtVZBMGWC+4IJqlHJmgjung1bgQgGri5GKuYGme3XECfN2w+lI9l81Aegmvq
         qC7Y9Xj/bqd60j3TBHRygwpdR1QIgmkn0JDTzPWxF4BgHuOngrJt6cwJJpu4fqAoOdNO
         qxxEvFqLEPLeImj0UhffbOrRPCiQ9dLu+OLMgx9TDhVWhKVd/+C0yg+sP62ddePx52wP
         MJbal/TOYJ2MV6I170wpZPqpnGcn0IWNmKrsfGTez78V+yd1UxjvEDHMYFLCAPs1oj1u
         TCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664540; x=1793269340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4F3Bn4K4Bs3YPMzyvcJretv1uwSXuk9sX9+2pTIfL74=;
        b=vyldHcNKNAglKl21sDBfjwtJ+ZUbOnJK3MPGRvThfJXAr7LVigtcLf8HWR3HZM/j1d
         AZI41X3tVt6wwAcEFpvzgt3nHanSOeTkCNo2ywp4cy1Kg+zhT+WxVwjCeGGQvEj5nT+l
         1jZvlFPbPBBWSAjfbMBlpXqJtL6BZe8XIsx7/bKjXFBWPAuxdF+4NclyauQL+eHL1rte
         x8jRjrC/jNOyzGMQicMKWnRsoio8+R6M8OsgSUUjI9aNvdDQZKmfD4d60CIVaEGER13P
         3u2ONLJEWgGxlvqX3tHp61b1BghgYy7DJyDN6EpPjgkTHSf7kdYeyk076YDfy1x7z6Nb
         yjTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8wC6cjZv2NVK2R22EcmDEZ/o6ak997HObh6jozh5IZlKJVoDupcOUon/ZhdqLLEQqvtFeftSEVOoH2Zs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM2LugSP6A0LcleFGjh/C/gIEwyNaYMDjy8+yJaVYS+mQkeHKg
	PbDeq6144tvOGaI4uIOFtiSCS2EGx0OUKv9BjER5DE03k0B7tIPJJrGmpQ6+KTJJrHqikpv8Ddf
	T+MjM9puBzvjRkP2PNHUgrhthBUmk4y+J750sbs50C9d6ElUc6QgmjoXV91YgqbcS1M0=
X-Gm-Gg: AYBFou0K5PYVJAlv30YXAmxba5LXggjrsTFCRPa0eDgqjQaVtj8bMMSy9jANu2Z53iB
	ZcrB73SOKtPjfD1z5KN5CCxjLe17uWPHM2/0ClZvs74WHlp7oVX+cI0Ge5C+gfHCtxORJ2RgaWi
	+eZapA+YvzCL7P3Po9CSoX8cUNoIJMZEJ/Q/HF10G3p2ey6Kn1tz84LP7KX2gmp6E6joyqmhSgg
	oimclBjlJKwL6SfodA9AidQpNbyKuNLDALrk5agE+q573w1OGymUR3vOtPfvOKBri3kACrAW+ab
	pq8lVrIR+YUDCWu5VuBljRkN6deNRh8At3fEvDVE0EG0AnZfe6YxSD4eT1lczfp9qiHeurXefos
	bh4jYRbQWYKtlMwif9Wpyy7oS
X-Received: by 2002:a05:6a20:ac43:b0:3e2:8430:917 with SMTP id adf61e73a8af0-3e287e3c861mr4213248637.45.1792664540412;
        Thu, 22 Oct 2026 03:22:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:ac43:b0:3e2:8430:917 with SMTP id adf61e73a8af0-3e287e3c861mr4213230637.45.1792664539920;
        Thu, 22 Oct 2026 03:22:19 -0700 (PDT)
Received: from [10.233.17.96] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b864e165sm1000679a12.29.2026.10.22.03.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:22:19 -0700 (PDT)
Message-ID: <546e2125-7349-4a80-bdf2-d35dcef46985@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 18:22:15 +0800
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
Subject: Re: [PATCH net-next v3 0/2] net: phy: aquantia: fix PMA capability
 reporting and EEE discovery
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016-net-phy-aqr113c-fix-pma-capability-v3-0-0bbb1b84035d@oss.qualcomm.com>
 <20261021132908.5a73ea02@kernel.org>
Content-Language: en-US
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
In-Reply-To: <20261021132908.5a73ea02@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Tj57fO5pw6AfuuS1_Q8ydATi8m-itm2g
X-Proofpoint-ORIG-GUID: Tj57fO5pw6AfuuS1_Q8ydATi8m-itm2g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfXwTQSdyfvob4C
 mkbTBa9uq+IPRHWDHsQCKT+McyzZWVMIPoqAfFQPbNVF20NzCFFYuIaCIbp2U2K5bKsmBSL142D
 lsepIVjjcDr4TzCEzHkRSbIcRn7x+M4=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e3dd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=9R54UkLUAAAA:8 a=VwQbUJbxAAAA:8 a=C-A7-TqGoCA-4_zHprwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX5mEzm8C/efxS
 Tw9E1f6yBQN1DyhIWT0PLQFsmuXuIYEDlnSnxUIcrox+zq2XiVv8sZYUo9QaHqyvpTZfEJ8WB4G
 ueQTZhv3EmSmnio/u0X+svnw9QDztZBee0r89ud1WiRtNX55HgKYP8YkLX7qLgz6n1kZSCNnK+F
 ZYqFge+Ym5Q+EarHnO+lJPUF9aXXb/Sk/QN2gcVTYp6YwHgrsQlaycx+iBiKEjYJE9uW/LqYIXo
 0G8hgUmtBTZSSWIOjs16Y83pnJJcYqEgAB/z+b/44ijMZ0kpOp8CO5ahA9PJ5i690jyz6I/A520
 wMJrneggKyDfPfuay0PU6CdaBLquLM3i0Hf8mTBsTj0rXCOCSufZD7co7x4Bw3Pjhf0LAa3ccZV
 JfFkBH673CwJkV8eOEmP83AC+PTsdptvqN6x4wVn4UGWfBpaHyLrC4QzFrtScFSm/+nuybj3SqP
 5nQQl85xGB9Q3LtL+7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

Thank you for the explanation. I apologize for not responding to the
netdev-bot+sashiko review in time. The v4 series addresses all the
raised issues. I will repost when net-next reopens.

On 10/22/2026 4:29 AM, Jakub Kicinski wrote:
> On Fri, 16 Oct 2026 11:23:17 +0800 Hongmei Xu wrote:
>> This series fixes two related issues in the Aquantia PHY driver:
>> - Patch 1 restores EEE discovery for AQR111/114C/115C by replacing
>>    the manual linkmode_or() with genphy_c45_pma_read_abilities().
>> - Patch 2 adds get_features() for AQR113C to correctly report
>>    10G/5G/2.5G/1G PMA capabilities.
> 
> You need to respond to AI robots in a timely fashion.
> Since you haven't and the merge window has started on Monday
> we have to drop this, please repost for the next release
> cycle
> 
> ## Form letter - net-next-closed
> 
> The merge window for Linux v7.4 has begun, and the net-next
> tree is now closed for new drivers, features, code refactoring
> and optimizations. We are currently accepting bug fixes only.
> 
> Please repost when net-next reopens. There is some uncertainty
> about how long this merge window will last, so please check
> https://netdev.bots.linux.dev/net-next.html
> before reposting. net-next _may_ reopen on Nov 2nd.
> 
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle

