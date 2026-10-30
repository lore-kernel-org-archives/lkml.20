Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365811;
	b=x7FSPIC4RRIRp0WuSzLbu2F/Bk7Tr/Y8ToibJI7DXFN2RO4mxmZxzaxxL0bviQUylEfj
	 AZHs58yYtCimg1/PuY2QGdjCRgMibm2f8AnLuQ5ORPPJH6n+qW34XQyhYkpQ/Oa1A5TmM
	 OBKb9mxEhFtczUpW+MjmcPZWNFH8TqbLZ+2vEpooWw+U90OqZ+YFrCvEJua/tOXXjZY+z
	 sbukRLiBkac6szu11bbKUBfvoO6OYh1pXk2YXYoZzCyutK6jR5ojiU3rg159hjt4eHbXK
	 1DGsIfrtfdVL90YxzsMNDD493oNh4IlFHdeNkOG0OqdRaJuTK7zH69CxtYtnbGcMwtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
	b=FqsE3CI7rsncUC13YfjRgoa2CMd6t8gpxwy3JQMbBW1+e0dDwHgaS3P556q0QTXD0WDe
	 zS6theFoe4tnCPQYnYFRO51JybwAVQNGwoBDcZ9de9YKC44OF54y073uSzeg0E6CYTAXn
	 2yKVIwrfuao7E/f8SN+bur0anqZACFt+fJkgTRoWS4g363nfnkUCZifoO0bWdsmEliR8e
	 /emD3uHPCEaF4upnEvxQGfrfi1K8Bqh22UsnPtiWFOL6hlkjiZ30pOPZjdv36P8RCgMsp
	 huI7HM/dPh/c4ONUwlfUOSrQsc33ekCyS86g/LajzcpXJS967uLlKQ8At2IY8eLIeog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tjw7LyIU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fjfUVw4M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD59606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD59606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tjw7LyIU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fjfUVw4M
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGLH63130296
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=; b=Tjw7LyIUXUz7kTQZ
	nHbzHNDytvKwXF7h6fO5R0T7IGPnebTHUPziPf71DnEPsGCP2xg9JiDcZ1BPoF90
	ZFknm9PD/jcRLyWOM9Bn7r2tH5j/hZ7yciCwnxuOnWzEWRVCQiWBIuqkuDN6liSm
	XcRVQZHfLXOydwZa0+rGTK4AalyAr4Ru73e7YYqk4ui4CsnextGljDS09InSXzEF
	frM17HOq+y6Fnki1ziT8eLNBb3LcOZaEafigxUN9sUEI7OZYOqkgwm4XsGDdspzz
	2Qh7ecy6OODRietSmf6tl9TMvx8gHcAinVyJJJox+NZEiitxIZTC7HWS9oQ9qPOE
	msN7aA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk3w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:10:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso5413185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365808; x=1793970608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
        b=fjfUVw4Mdy6t1vyLm4FZKxe+OU1g3qpnQdZyygd21v081yUe03tHm48khBoF9PhOS5
         PF+CIZBUl78BO6phxz2t3N+0xVVnnOrVX2W2armNeGXsCqktbhPqPX++GnpugjDBLfS2
         UJjRpxSe5G6mjz7X/X3xOMAMtswE4FjSdUEyqDgMBRVXxBCpPi+OBRzS4m6sOheYwWg0
         UAvtv+tWhBvO8MVQxUYfpfP6FsZII867i94/bT5W1Q/e/gE53fv87EO9AS9ep2YYqLUu
         KUR/HRGmwqM/T9jDoW9ePwV/QICLI8hEbJUv2fNtLYSR9/FlPR1gL1rI+4obaOeG+VwL
         FYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365808; x=1793970608;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywCvlXy/LXKFqaxptvjDdPHYZDdYq6KYRB/vMQRsu30=;
        b=KYuRJXLRG8Dbc24flk3+Z3mjYujx+WEj8YiGUlCg+g919NK6AJdRq36yFE/LAtRHLc
         NdebW2Cc+9+38QtjMjjZsDw5ru/u6CuPy/tYT38CgaDR5QGGL2RZJdkzbIxSNtkpuZtU
         mTSVE41Vd9INwoQUrz9tmFWlbu6VLt0uMQnhh0z5BoQzLWxMEESAaNUVhMtpdJ6NZ9Ri
         FNketlH0xcZZbkY8W11TMHBwhbxt4AhCjI+dNCWCkZVUir479HPITODNQ4i/BZHfD8MY
         wb4RDEg0bTaNKmx6WsPYphwiOb0SFSGbbwFVB3CHc+lmkmuiExo56EBn6/+4IJgABXJj
         mDWQ==
X-Forwarded-Encrypted: i=1; AKwUvByiQIRAW6flrpn7iF8HoilI57H8Z06mXe3N1YBPMssVnbM6poN43v6A1hidv7mF6aBBIfzMVTF+5NEgQoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgGXIitKNe19WSJRHqeh02n3R7JgaxE7kR72uqm1vzWW2LKJaV
	8JMx38TjmHETKBRBZ3iXPPGiNtOrJk32cpc3EiIvtClhqvFIbs5demgpwpRC1XbXBOobiySwH/x
	bHQvBX6Ctm4PTioW/DbR9Wc2aq2xopgi2J7Xbq3P+i5AQth7S3AZFZ+E5MDXR1jMydvqDREwZmc
	U=
X-Gm-Gg: AYBFou1SraCLcKHWlhwtfz3ypdKuruuvJTUESVLatFyAifkTb6GOtoeqRK0jt/SrdzN
	+Lmpkh2HmjIVnrXe5PznznBsWkl59BR4dNYU9vTp3ufboEFn+mY8cOmmMwXtqbjJd7TWbCvb/1V
	E94pTiTTxwM7zz5rBJv3tVoQ5zRqUMQTnHDrProH7Do/03xh3w9NbEU5PXXRv12D7bqvXinUmZY
	Nt2uHulO5FiYCCEA6W0twokfoz8GyaiIlf40kHqv3WkP4oeCuMQGsp3yVbbpyejKlEdSuNyFjXl
	v6xAKJZ6NhMlOBlO1ehPTebYFHnttsDgeAdtO3bJWkOJ9tMsdD4rpcup4x+uWiLTMrcKQ/gwLa8
	FMtQ4mW+1faiM+BEwGTGin84MXCaySiA+Y8+jirrIZFdEUSSMNqKvn0KgYLCJMwmCks+C95g=
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr392368285a.5.1793365807975;
        Fri, 30 Oct 2026 06:10:07 -0700 (PDT)
X-Received: by 2002:a05:620a:870e:10b0:940:f21a:eb64 with SMTP id af79cd13be357-944216f3e4amr392359485a.5.1793365807359;
        Fri, 30 Oct 2026 06:10:07 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm65887066b.4.2026.10.30.06.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:10:05 -0700 (PDT)
Message-ID: <4f6e1534-5105-4a4a-83e6-4b2b846b67f9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:10:01 +0100
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
Subject: Re: [PATCH RFC v2 04/14] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wsDhBQKGU86QuCcEER5yy0SaSiu-MYXH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX83UyiaoL9P40
 iJhm8jZNfHoBhqQeKDAej15tWhQFHTjZaC+vt30iQHTwoMmXfHpVhLTV3OEFJihArqi1PgsufHT
 FzmM89KjCDRlwn7QCUUbww/Zm+Be86I=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae49730 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=7uVtGDAPqmP0Npu4MUQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wsDhBQKGU86QuCcEER5yy0SaSiu-MYXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX+jFtUBrkz4XU
 Ug3c7m1L8SrKnDVfFLNdbCXvoOK6nW1BWy27F6/utYsvvje/7s+6mIKcYfVR9jxGL23wfKmsxhE
 dJXUCHJW8Qc+5I5S4vRuKPoKgwq0NoK5bcTmIR8wNxz2bYgtu87owqeQ7FdfNl30/co94DSpkvx
 jymDCf0jNthKq0exyHA1qnYkceDI+RpuPS8BdDR+cpQVaXLbtgH+fpdV9XJ7Ms5wfKyUPM8SbTD
 zaIvc3sr5mNE0njoL5rVNPoa+Mq+2eJ0tNBoXvbHTtCXXbL90KavTXTdKRwX7taPn9AWpEi3S6k
 Qfg0OTBlMqKdXqfFjEFhXqFf1jl1pkVF+Y67KaHXKQuqEuPrizjDP6h/MaXrwF4Ej/P2is4UPp0
 nmpo8qDbfvb+SXTbErWVbmMVVpZz60yt6x9ZV6X9n7GJF6hDbVhyM4HA2aLujqdx4Fbf7c477W/
 GebJszUs00FodBJlvRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300052

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> Previously both SID 0 and 1 where associated with the same domain.
> 
> When LPAC is not used this is needed so firmware can acces memory when
> initializing using the same page table as GFX.
> 
> To use LPAC however we need to move SID 1 to a different device.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 1604bc8cff37..f47d1dbd06da 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4144,8 +4144,7 @@ gpu: gpu@3d00000 {
>  
>  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
>  
> -			iommus = <&adreno_smmu 0 0x0>,
> -				 <&adreno_smmu 1 0x0>;
> +			iommus = <&adreno_smmu 0 0x0>;
>  
>  			operating-points-v2 = <&gpu_opp_table>;
>  
> @@ -4158,6 +4157,12 @@ gpu: gpu@3d00000 {
>  
>  			status = "disabled";
>  
> +			lpac: lpac {
> +				compatible = "qcom,lpac";

I'm debating what to do with the compatible here.. On one hand they
shouldn't be generic (should be soc hw specific instead, but that
feels a little overkill here) and it may be that we even don't need
one, but the iommu driver needs to know what we need a 1:1 mapping
hmm..

Konrad

> +
> +				iommus = <&adreno_smmu 1 0x0>;
> +			};
> +
>  			gpu_zap_shader: zap-shader {
>  				memory-region = <&gpu_micro_code_mem>;
>  			};
> 
