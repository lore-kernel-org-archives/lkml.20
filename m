Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A99309F08
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226723; cv=none; b=ORS21WWOIeQeoWTGvfQGastqqg3/eW7FuomlDDr8qSxhzMojO/LCdCL+db3tzebr1/XQscXWArKHnIvvoFmFCa+Aae/rAjPnLMm7FLBaRk2uA3koSIfjdvvEtbehu+tpyb+TTkIkUAVZdmJxF3ZS2t0gGfcWyWBWzsErW77MFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226723; c=relaxed/simple;
	bh=4eBxf+Fj6KnsrotgVdRczT9ssOraNNtjnrJCSA/YZhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhAPv0bNHQIKs6pk7YcSBBELT1QwiUJDQH8YaM5xpYqAP4J+7/nmpMevrBx1/BESaV/JRDbB8EsGKgEFnmo9YrgR5PKJjwwhUOw/aroMNQnaA6dgXd9LCzL9NJTxBa7i/APcMSZh82w9wAyuEPcZAX9/vKpGo903NCxpKYm+DAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/zkERln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOuYFyEV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/zkERln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOuYFyEV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdQD62573676
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JkBknVDne8chqJALpu4JqR6J
	qVDi0RNKgdcUBmrEbsk=; b=b/zkERlnK1V/oyswBfo7UYW6xqbhpy+Koj6yomt4
	tSJ0OEuhfR8Z1jnI2/MoYbtQqJ6PcM3BEXL8NobyceqSn4uzD6K7yhnUZu+tRgdf
	yfQu27V6x02r9RHvg8vpYj900nrdW0Xwe9zEkl54CvimnETTSt6jY0kX8fyZtKcn
	Ah5y4MldPCiePveItAkqNTjHiC+afWeAIn/WsZER7BqvJHdXfnhN999ikXCe8P/O
	JTIxeQhW7RV6CfF7SNv/on5M+QNpg78MVXP28vTMyBxl867wUGA5/fS2tnFjTpNN
	hVZ2EXDAAGd9pw6VI+gsM2MwvWzuCbEzipknWOS3VW8wcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018h5g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:25:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso108271985a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789226721; x=1789831521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkBknVDne8chqJALpu4JqR6JqVDi0RNKgdcUBmrEbsk=;
        b=NOuYFyEVNzVS08trRZDCDM20EZoFfwC03gmT1OdJrOVpK19gEIubZ0sDrD7z/+zcz+
         BHzLGiGaeVyGFO84l1mOZKUfRxgyXq8bDOxWNzQ7GWh8wLcGMWHYZY9UENhFJNdj1aV4
         rVPRnT6fRF4fJQExlyZB4oJAZ5hzTew75POkQBEXyYG1kjjai7XkxLYQxu1bRKHa5MzX
         rLafLWeISxkybbAurLnhrlj61LnJsydTZhAcS3E8L872E39Tn5ii9TzkN73+XUXtz8Go
         yuF5OnzEp79DH6FWaRufhPleg5uBaRWZ4ZtwYWV7rKqJxqoEXbtUhHlx7rYgAYkD62h8
         SNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226721; x=1789831521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkBknVDne8chqJALpu4JqR6JqVDi0RNKgdcUBmrEbsk=;
        b=DcYlffku3GV8VaVDtYb2lMFti9Bx7DSz+WNrdRtlcSY00v2Fo6DL1CUXPCAOTyduEi
         DSqqmLWo7cZheHzAxkPcLs/5FDhMJ9UwMH7nkxqW5VB4C2SYKuL85fvbY3m/LTsDtGF/
         p2Fc/CnOOdW8eam5QnUE1cI2fYevR9RtyHEh5xP47WMJ6zDhwNiJl4xnwb3mRafJs7GI
         BMR3+3ijJqpYe5IPwBp2KOwgDOQ3UnfaKUOL5J47lWGVAC2Pq3zzEu0/2Vumb5lrMkFq
         wizfp1QmtnJ9qToELJBTmH/vXiEvjTSD+LWKhmvr5tFQa7Vh+11LMeXtLaFo1kkRV7/T
         yWJw==
X-Forwarded-Encrypted: i=1; AKwUvBzhBnjpkSH/pFgRw+iHtj6KClC/zhXDbXBoXYvbmVCZ2GKHxytc6s6HLIN1BWYBJvjFbMEUtPGQVUSY58Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nLdfROW23HQvnKGqRE9q/WWWs4DeC+vQ83DusqQ8bWdUQNyCFz
	qzNfE48iHHsADt5TWZyZjxsNXmuV8LFV9Ssqplvgl8nr8xVm9AGcpxrNoWIXE7DRx+r6c6BTQBE
	g7hAR2jikaRDWQ5QgsQW/Amd0lt8eG+FF12dTjdmy4FE7M8fXyw/2CfieMjuShwzyCWY=
X-Gm-Gg: AYBFou0dkNApaZhgBic2aObzne5iBoZj1fq5x9NR3RqWIk9Gey3RlRZKaC7NapSsZ9b
	J980NqYHnqnjEURtxP5x4pfXfLRlJsTtXIfpUHhNTV3ezJ6KRvHRftojcbTQ4eFjTqyZ2huO4SB
	8z8pXWcmIgXRHVogngwlPJDDq+w8LFSx8yab0e/gZ+BfAf8fiVpFBsf2AbHNVffpzpPVNpRV7IW
	cgmelzkuKZC0YZgqnWbnMT4DYVvUfN/Qbwjx9nK0Zr6yBtRBjvtRRwq6DXRGqDliQqSbzllF3Z4
	7rmxb+gjZVM9AZxQWRqgVeKibDq/s8RkSXuLS/r6qnFsmRr9scZqRpxcyJQWV8GiIVI2hZ40YJ8
	n6hepU8obJTK3SNM=
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id af79cd13be357-939d7f878d7mr1732161685a.24.1789226720633;
        Sat, 12 Sep 2026 08:25:20 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id af79cd13be357-939d7f878d7mr1732155785a.24.1789226720030;
        Sat, 12 Sep 2026 08:25:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm108257005e9.1.2026.09.12.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:25:18 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:25:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Message-ID: <yvhvfmdzjipxi6eyybrwwdfle2jkyffahenvdp7s2ieuvgjmp2@bte2vyprwnsf>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa56ee1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rlnnUfXKZFOWfltiA5oA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX6aZHXIvJql4V
 lK4JCzaRPOIY6ury0o14lfcDsZ5I1wEJH5TNv58MTRnFvaLclYr5b6YX27Grbsn1aUJ/0ElFWHw
 mj2Sbl+uOlETdJciUnHboAiS/nodk1U=
X-Proofpoint-GUID: 2X2k4tZV0xNXzHCd-SjdossV6CKhm3Nw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX1QmZIQBFkxwm
 QZqdxIgXnwiqYiMfqygEuqrS0aCGH/xDjCFxRiNWrKce+bmW/yOZUnasB7D3uCgbvJp1MC0l6j9
 WWK7nkUXYPf07jGdo3JhkAYekDcrdmY/Nb5sNL2m/wiJk0a2phMmHjSHj7k24MVMfA5LgcKgW4M
 G6Ri9lWssB/v7P4YVfNUrdHztRWLwy8lAUNlMG9wiA5MIykK2xfs5WFyZOzBFkaNS/ZrP35yC7a
 IryD+ofHdubWuvy6epcDAZxKtnC80e0IKbszmV3Q+xHZNh5z0Zxe49SKw57slox/PZGB4HMhAT8
 E723N0ecgcKXXhEG4mkbt58Q6cHRmnuoF8hvHKDPapMGWz6nRUi9QySkz85ITw2TdPPDFe5Sqjq
 emQU5yQT+es/47WdNMo9Rqoxne0Omt4l5+oZJuioJK62UycBSn/q/546eGOkJDo2b2iwXY0T8rq
 F0nCJ38VY+ofvMBKcBA==
X-Proofpoint-ORIG-GUID: 2X2k4tZV0xNXzHCd-SjdossV6CKhm3Nw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120223

On 26-09-11 22:20:40, Shawn Guo wrote:
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
