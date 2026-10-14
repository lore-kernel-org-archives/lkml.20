Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83546421A17
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981547; cv=none; b=WeZjcnZckZMZfuYfeN1Pyd3ZTnS4+5krNUWFtEQBbvsvBCm6zwTXz2okjvfONYROafxwLHCOcD/1aGIs8OxMTF2EkYdgUkcjahvkmSKQBPPsEnKacrGuHB0NL/pglJ1Kac3ZgNbPTWyTWKSNRHjfbC4LT6zBz1X6RJZY7v15Epg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981547; c=relaxed/simple;
	bh=l1jRMWxG8RdouFaSgoCqrvZ1hJGAI4dQoynHDRwfyhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jz9TbfHul1vB4hsEdclmCC0ho2IjXjdq3EC+QBsumXtnEUx9Xr8kSMMQghwScvbXH51+u/mHXqEYnwK5id8fwaHRlzF9Q+3+LbrDezmc+m4DIiP7F+KYBgpv7ZhlIqqWK+K4fSZps+ft+d5m0E7wckymZA4/TlTe+10Mq2g1iYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F09bMLUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrjmfvaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F09bMLUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrjmfvaL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBTiuR2515999
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8LWP4j+bIpY8MUEJUHYxf6cp4BonPSG9HyxtvJUqRY=; b=F09bMLUgmIud66IR
	bGEjfC8h0uO4+ZE471JhFlskW1uqinYqAfrBAyYuSv8Jyq5vFAG9M0ZIsYyuB4x9
	JtqMhSipBbwmHPUFj9YFsoV6b6t5adWkKFl7bpE0G6LdJ0FTFc/np2nNJ+sh41qs
	p+UsDbvk+1yJHsTR+EkUsT7M6tMHtDpS07S6SiliFZSGDjepHAGvjz7PTpTfoUqo
	GYNUoSuflpNuU0FZrpOpVic2HN3MoL6i1/EDA/zlDzMUIPFSm9WDoj3CequkCi3k
	b9ji1OU1/2Fzzmpv1duEsOAnUXKHiNfdERnyakYUHq/PvBZhiFhkbLjVXh/46qMG
	ntzNlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709j08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:39:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a470ead068so4415610a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981544; x=1792586344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8LWP4j+bIpY8MUEJUHYxf6cp4BonPSG9HyxtvJUqRY=;
        b=SrjmfvaLsbgxhL19xxJyfbkzlCqOKZHIvTihkBexitVcOlmKUNcTFC7DzjjVNmMM9N
         xEHcGnVYUzcwvVcWvM2EcwZ3BMAfTjp8ApRzB3xH0vVAvpKu6JD+tKmJgt3fnwFSZFVo
         PQuJb35OTpePDKhC5RbNgMYplSxhV0yqVSRlnW/w4LpGyf6J/8Slbpr0LYw0kr1eqiq+
         nzwTOH4/5Pwe/jgYqwgsgzORH1FGyEaArbCng1svIGuQgTOLklQlQkwghPRmKb3rtd2d
         YSS4PsGQGYzq7vOi2hgiZvrDn9cnESL66B9EF3mlikl2IkFyCGAtQ7v+Rv1AwlpoU8uc
         IesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981544; x=1792586344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8LWP4j+bIpY8MUEJUHYxf6cp4BonPSG9HyxtvJUqRY=;
        b=iNdB+HPjjPIvxiZx/1q7tprrnGIBwTrH41G/c42rsjmfFS5FgZCEgL35Z1G91YdMng
         95y0KKwmDBUj15fvXLCu7b/65JKGdEFgxUU+hFEje8/LWbCEcRSQZP4myh2TQfuUwgal
         pCHUx4V5P2dnOWgR9xSNwJM7KKh1Q2TxoM2nbjDMHqxUXU/JVpqKjXUcS/tnjq/Wb1M+
         V90vuuoYPp024JeIjh0fyORSrHsejPSDd+yki96ZxSlBak1VAQjxf3IUHRwxHIJWMi/v
         KAd5jn7NwwX0L7hRFcf/5PNFhwOsucTW6ojYoDsMPmh4wCn6s7Y1wBLNs9sTDSjC2W1b
         fAJw==
X-Forwarded-Encrypted: i=1; AKwUvBz6rkcD1FPhqLJngsjZMOwEXJeSuxSZxm797lp+HmfUWpLvXOfjQD3q5wsRHLjepkGQ8DoTk6f6f/w6Pa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1k2NLYR3pb3PtlkodhJc4PmMw39pUvYMF+/0dFdzau0NszLFV
	Xe0yx9K4XgqLBkum38rnwennge4oNurG4ryOU3YWXSFB5VG5wpKqZdr7zvSMgNBrHPQzo2Xdxix
	QQcmeKUtRw0BBaNLWZGlpdhHmjTzz3MRmx1EIduDOfgxhiII14btw73w+2RWg2i3v/jU=
X-Gm-Gg: AYBFou1NQspI3TSX//vyc215WDmbhQpd6uoGukSvKnBGAZ+U8pHSsdDA6SXvQFQ5SeH
	wHWFLcLKNzplYIWEBQFTDCtPSi7qI6mJS68T4jP0Q7yfMtjO/YYJDNTab3oV2z5ykaSsYwWQiFD
	7xgyhNBYxM4/okWV9dMSeAqnK4d6NKY8n4kkTxQGLc/4B3dsjXYf3m4fLu2sSgy4yIq0iV9ewYX
	wRBUhmZPAMxbuUMv3QSZpPQKIf33+zq9arLKDic5+FazV7aXHT1d/neCxCKD+gKry7C0bFF7Oli
	UdK/0rwBc3lrjV1frPsoIzXbHXUMvh8Bw7jLb62Fkg9NSOY9uWbeMq3A5unuuyj5vZhD5UJtklQ
	YjF/WpAwnVEbjZPIgai28sg5gJs9EM4PqwJ6G1NnVmhV1qGpkHcNnLLXpD0viSKOI8xGGkhx6bZ
	SqydFyQ1a6mCCmnPExi4dZ2/os5iU=
X-Received: by 2002:a17:90b:3c8c:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ab3a99b4d0mr11899812a91.21.1791981544212;
        Wed, 14 Oct 2026 05:39:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ab3a99b4d0mr11899778a91.21.1791981543678;
        Wed, 14 Oct 2026 05:39:03 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f2ba9efsm4368806a91.16.2026.10.14.05.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:39:03 -0700 (PDT)
Message-ID: <a60bc242-e132-4d92-9f04-5d234ba4979e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:08:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-5-406fc042162a@oss.qualcomm.com>
 <762978b8-72ce-4836-85f4-2cd3ee4dc5cf@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <762978b8-72ce-4836-85f4-2cd3ee4dc5cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfXwIAWZteWvik6
 JS/+yOMd28xlX23a0/Rley5F0SR1rB0NXDr86XtEQjjXaYUalBMzkBIgk/6KfJT552BMqdFGcef
 MR3KFvE/1Nf7pV2/WoqkaW7eAc2zpqJ5BapKH06FpRN3yr16cvKMO5wFFFUKyz1S8Djr5fEi5Zb
 GmZzQBxSf6lifuD38J6ReWUfykCOt1gAfamomgGJl0KZwDhyH/NqVA7MpOdCvw0Zf4gH2It2BVo
 3Np6iY2uN/FO/d1/DO5H9iv9BH0ZvZCzA96kguFZoBvXeXN2Z5+BTdvY2O/vYwxk0NnLOH4Tcnf
 TofGIsMO+KDJCy//TqDQPzv+Q8RYsCzsh1+6N0oRyKhQvjIN2xWeXPp01RCZVWl3HWN3aLU5skC
 XVtXu6LtF4rbMbbLtZ0dGfftxE+bjP3NLycJGbb3OTzDnnD/t9gkLj88JYe+Z4z08uMScy0ehyS
 grLd9qQYz/8/dXsz2eA==
X-Proofpoint-GUID: YISJ3okHE0F99zPm2c-0JfLzikP2oSdK
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf77e9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=03qAMiCteCMXZj9sYoEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: YISJ3okHE0F99zPm2c-0JfLzikP2oSdK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX23fiCbGWn+Hk
 kMJXPBEIxXkmh6aU+mEJk5RJ7L+pggm3kpWDNW7d3eNhypsj6n1QZqFw0VgxkIU6pOE7x8DJryI
 ASXacU64UK+1UtSJnJ8jNsAzfvLmIas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140050


Hi Konrad,

On 10/13/2026 4:00 PM, Konrad Dybcio wrote:
> On 10/6/26 11:50 AM, Gopikrishna Garmidi wrote:
>> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
>> built on the Mahua SoC. Most of the board follows the Qualcomm reference
>> design. The keyboard, fan and platform profile sit behind the Surface
>> Aggregator Module on uart22, same as on the Surface Laptop 7.
> 
> [...]
> 
>> +&mdss_dp3_out {
>> +	data-lanes = <0 1 2 3>;
>> +	/* HBR2 channel equalization fails, limit the link to HBR */
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000>;
> 
> Oops, that's no good - is there a chance this helps?
> 
> https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com/
> 

Thanks for the pointer. It helps, but doesn't get HBR2 working.

The panel (SHP LQ138P1JX61) supports up to HBR2. With all rates allowed,
clock recovery passes every time, and channel EQ goes like this:

               without patch    with patch
   HBR2 x4     fail             fail
   HBR2 x2     fail             fail
   HBR2 x1     fail             pass

Without the patch the sink asks for swing 2 / pre-emphasis 2 on all
lanes and never locks. With it, lane 0 settles at pre-emphasis 1, but
lanes 1-3 still sit at 2 and fail. A single lane doesn't have enough
bandwidth for the native mode, so it seems the PHY still needs more
tuning at HBR2.

Limited to HBR, 4 lanes train first time, so I'd like to keep that in
v2 for now. Happy to test anything else you have in mind.


> [...]
> 
>> +&usb_0 {
>> +	dr_mode = "host";
> 
> OTG should work just fine on both ports

Will drop dr_mode in v2.

Thanks,
Gopikrishna
