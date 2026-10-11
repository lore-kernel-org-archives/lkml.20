Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F8E2D46CE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791689447; cv=none; b=UibyzK3WparpBRahtB0HINIAUqy6zvIpIinsiHKaESv+LLV0R2YegDHLnp3m84bmb3ijG2iNCg+VbcNCn1OqPeqdcjR1x56MoetbB+DUs4rYj/2fLmer/59qLUYfOkxRTOUcR8A3xw6xE+3nmTyZU4AnKj6InWYKQw0Chbj4F0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791689447; c=relaxed/simple;
	bh=xAKPEdaK/XN6wt17mXDJz6sqUCeQqYJ/HRPcWiqk7YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoMYoW8gEjIqN0RM5ey9Id9/bV6RzMUlsXKwtIMZUuYpSGkpNNnVHoeD2SgzcCzcHArQ2gAb0sJqxkYcsEV96TXFxGla3LbHQGaSMsoAV/uASDKSy2msU9YSB0kbbInP8CCQYnsYB7Gk+fhMAKs1HRump8Rg+X8jhVW69mpkh7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KysF0DNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uwfwmiv2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KysF0DNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uwfwmiv2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1pc8U765587
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9svzMgESlMxQ2/eamTykJGeU+wpVc5L1Ni2Wur0Meg=; b=KysF0DNbKXWuLhgL
	vj3p1/+J0Ejl9Sm+6+jKRiOU/lqYZ+GNPhD5QoPfLqRgQgnHtXVcUwpjroowGWKm
	CGITP+wi3/G5VPy3z0LgbxE/kOz/2BZQM44IhQ+vF68JP/D6YqOfthu0hSctN3++
	Xy8ujyufEAmjJRUrbgag4kE+TEO8Xdh6TFuPptMO/CZX+7kvXip8CphBSWD8fbrw
	EKil1SVaasue3w5sDrM5zqOZXjPKBzjojtrOEJyjyuamoFhtbJ1kcjGAe6D6qXts
	wHzqsRnbxI4ppNnJumzR5Dp03RDBRTJLiVw2YWZ9sypOwGZDzxKM/tUhvvnr2gas
	7nuk0g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjj5er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:30:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso1930380eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791689444; x=1792294244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9svzMgESlMxQ2/eamTykJGeU+wpVc5L1Ni2Wur0Meg=;
        b=Uwfwmiv2tdne3iLa1zHmF7cwVc6v50wD0VkSAQxil/12r9eK2vD/TKCkKl/7ahfuc7
         HHIkzr0HbNxpM17RoNGpsItjfysdNr8HRw0COXACk+i7R14Pig/5atvjhFMR0OECgSg+
         U5SibIGEwFmQqLRog8ubCoOKJdSXD3b0GbztSpBQP0VQcvAj8sBqJyWY40dv0U1r5U7a
         jB6tgWAJEbxVubgYlnIgR3o0pOi4DCWkv5CAqvChama3VxhaPQewwLZPddbJcYZ57luP
         ftTbEi9kyEkQ9i5HbaB8FqjtX4H2nWyPx32u855fLB28lcV+t/kghYVTDybuGpEtsnuO
         b72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791689444; x=1792294244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H9svzMgESlMxQ2/eamTykJGeU+wpVc5L1Ni2Wur0Meg=;
        b=L0CD6AAL/PGgRY96vVkKTF+cojMvcUf8iRS23tgavfqmxbpX7cGtfiM6agjA8yO7Ow
         ILgE65x3OALRXq0bufYuusX4racIEfrAqwbMMqiQSqU+pM5u6y2eHG5YImWK/E8GHQ3P
         xQnm/gHmG8RdDgWHDafZSySDbRMThj9i5Qe3eS7cYExLbNmLtfu1E6oUzsdmpH70ioL8
         9BBAa7s4iUvb7cFnFv+p/ViUi9Vmr8Sf8Eo/N4ZpKfqZqWhvpv+0qELjrxNT7fzzl1tK
         l3majgGCvmFV5hhRnS89rUEdd7Gjd6FZPkdryNhoSu2Hy5SwZds5leLcyFeh9uZ0sPdg
         p37A==
X-Forwarded-Encrypted: i=1; AKwUvBzjitDTJJ7FFKhu2lME7arfd0Qw/GNYIHq0ZgQAfnRsjKFL/ZRqxfkBfjoXcv4X7Hq3NF9qQEw4rYDDK68=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM92nXu8T7FawUtxy3k6cgoDV6GApm2i1PHiXSStVnLAm1GOCN
	OCaC+XvNtF42cK11wuuFoZrPTZnydXJ6Z5YuFcXEGAhlto9lCxqKr7b7ZQcXMwIVjfc3Ksi6+50
	FKBZeAYEUbSqKib4q1wVkN6ajNAWdEQivwmAQzB/NhEVfJtdURfc1+FwC4pXyf+bv2OY=
X-Gm-Gg: AYBFou2sjhziLq+o3pldWmcUcP+SOPSM+vhmcdh3erXyfpE70kVKmC8CgXSvan2aUtH
	/R4aJCCxLFVK53nQERbAOvSovjH9ZhPgGciYb7zwPYDL8zldX6Do6mfB51OMo8OnAn8gdWG33hB
	5A/5xLWq7/4DfPAlTHn3i80844xp4Loj2Es1dCaj+KxHk1nQ/tifhRHlT+fDmq8KhmV0ggCUnpM
	g9ex4EffEeWhIqNXZmFZYEH6QjABixyfJOkb5HRT/DoM9bWGfvDLwATMyJ2RXZTssTaXJs8Hu8N
	v/F1N+xjLRgtCGgHsrCeTq32BwZIWHXs4jJ3BSYve5Ma4GfHP+o5+taeo2YE5sZiqVmvkBNCVzu
	Pb8kEopYDcaEeup09Ej6GJ3FbPIiG2phfz5dC3GCg1A==
X-Received: by 2002:a05:7300:1343:b0:351:727d:b9c2 with SMTP id 5a478bee46e88-3537e05bd1bmr11778398eec.17.1791689443432;
        Sat, 10 Oct 2026 20:30:43 -0700 (PDT)
X-Received: by 2002:a05:7300:1343:b0:351:727d:b9c2 with SMTP id 5a478bee46e88-3537e05bd1bmr11778338eec.17.1791689442629;
        Sat, 10 Oct 2026 20:30:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm19172887eec.13.2026.10.10.20.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:30:42 -0700 (PDT)
Date: Sun, 11 Oct 2026 11:30:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord: Add GPU cooling
Message-ID: <assC2v74wpr3AzI6@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009-nord-gpu1-v1-4-a06a6c57bde7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAxMyBTYWx0ZWRfXw0jltUdS0Q4I
 jl/g6Der+83ntnGvVI+c+3+UbahYTzerRWNusVHhvhAPqXqcsWdwEQUqKWsmQ2tFRn0JenKASdh
 jyst5xlju2BPiDDhIKN+TgA8ScRimoTVU59f5M2vBMvMwL2x+RO7EkQTnx/0FaWvj/wN34okt0H
 eFmO4oC3k134gzF1VFB0lLybM88A9mzGI0ghkoGdZ8Cbj5hhDooO7Xyaga4GOGTeKdW1Hi+VkhZ
 gm/Uci49FlF667WtbJB9yXuU7Sm0OjURq4ypiySNkbWynLuUCQsY7ELQE8Ainl9tV0bLOm70KLr
 pHXhU1Qt7FBW+UWeT/gsok86wz4R3Ru+Z6w62eTYfTE1iAqkAlOkvAx+eJoAz72x9XqpJOioegF
 3bELyO0ohauwE1bmBu+eUl/MD1osk3V4Km8UYQSiccCJf4/lWApuiJbN0m0xP4IW+M1eIlIutpt
 k1jvQuPsrlMhNjHFtOA==
X-Proofpoint-ORIG-GUID: Y3c3xzoz7FCsafGP78TGgWyZpkE-qIs4
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acb02e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eBu_aoQerpSAkrlkAZQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Y3c3xzoz7FCsafGP78TGgWyZpkE-qIs4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAxMyBTYWx0ZWRfX3bWt6Ppy06Iw
 Zc7TpRA7j5IU3n6wsu7KvMXolw91vFVyMNVLPjYgzd4JdP7a7+syhT9JNHjhH0h7o+2j+iZ88tg
 zfCDKGynfqsgvIwtw/BYuaXzo4ojY6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110013

On Fri, Oct 09, 2026 at 02:36:38AM +0530, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures.
> 
> Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
> reaches 105°C. Label the GPU thermal zones and their passive trip
> points, map them to the GPU as a cooling device, and add a passive
> polling delay so the thermal framework can monitor the zones while
> throttling.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 177 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord.dtsi          |  80 ++++++-------
>  2 files changed, 217 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 4379092b7bf8..23370007c974 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -17,6 +17,7 @@
>  #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  #include "nord.dtsi"
>  
> @@ -2042,3 +2043,179 @@ opp-403000000 {
>  		};
>  	};
>  };
> +
> +&gpu_0_0_0_thermal {
> +	polling-delay-passive = <10>;
> +
> +	cooling-maps {
> +		map0 {
> +			trip = <&gpu_0_0_0_alert0>;
> +			cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};

I'm not sure why this is Embedded variant specific. Can we not just
update nord.dtsi as needed? Would that break GearVM variant in any way?

Shawn
