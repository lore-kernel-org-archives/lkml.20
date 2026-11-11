Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420983;
	b=c1DBh6aOKYxCbVq0NrzXjOnFFkZTqwCpS9eKAq8LK4r7kTLdBL2uGD3jeHsNBNYTpesy
	 cmYcyn3NA9di1cyPi/KPn8F3RDfTHvt5a1DiiVZLtngPAI9pp1ayQ8uEhdS+AIUtsMViJ
	 Ak5b4GPejlVCzbiqGhuHGKMv1rZmVTzCWogZrhEdjRw2TTC/hlRV7duic7tsVQrTpzrWg
	 CLn/44XzDg94IuwPsEPB+9gQgEAMcLwMY06UFc/8eDN6xcwSsPc0vQV+k7GF1gVDp1Mcg
	 Pxp3xrUV1yjWv5XP2YDPIwirc5h0nw6O/iknLo3DRyHBRJleU29xew09w0dDzliMsnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
	b=qBVmTlriKL91oU+KZDkmcocAlexKCbCJ2GabCIZXtUNPWZ+04k69pWVg1uvqvF3bh2iC
	 GkE228BPsruP+gnUpWcQkT9AxKD3/oMIxMZl6IvU2gEsv+YQg2O+m/8M11sLsp9tIO6f7
	 YiNT/aos9frsAfBotJlRAlWcijPP8ieUSLoWzhK/FNvq4wtOx9DBUyYkXEAH/+CL84MB0
	 zGltD9e4SkIN29S4gY1fHkVcAkej9ppw0j4SoTdaKmTeEBHxj7G2SE4yWagh5SD6lEpB/
	 33sAVFEilwWZzso2aU+ZpZj05a21qk4MkVzwpXaX+37wbP0cTKXJg5ge+P5G62BjpxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glISu5jm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxdoGSFM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38740606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38740606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glISu5jm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxdoGSFM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtP3J1014064
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=REvih3wAsG/3Y8nmSLavA6sF
	WJivHfgQW3aPqY6xVOc=; b=glISu5jmcoB4td6nZz5qG/2jm/qi4dD5Rm/9nSsa
	/I0Gl1GenJw0gJ0xFGG58LM2hwKHwHJYnsp1mOl7Imy5Wmr5+Sj3759L7ygtlwP1
	kKiIHi/sWbDtQz/DNgL9bnNJlOQWYwZQYUTix+NhFXbkDl5d7MLlNPku/BSlpKHw
	vvEvz8erB0bQP5V+CVfQIbrJ2ChUzhYDQE6SqVkGCRNGt3tQ577rEL1GABb3rc0u
	Y9OgQkxts7fON1oYYDRihHuGEGPb0E4ER1zYUCcXE+Lj027hU0I/ksXWRSH0XyCw
	8/DYX8de6VRdE7t1U0ztcqK+WKh8V2VGqOFG6HLzkXNJBg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjt1ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:16:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ead18311ebso1055845e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420981; x=1795025781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
        b=jxdoGSFMo5dMG5F8OrpLY8cboUuWxPPH4IcP0j4Epbuuta1Y/xvD1wgVgoDK9nxaPU
         uAiTvKYB1Yze2W4Q3XzttzXt8civZCLL8uk7JhrcrxDSJPjufvx4nVLlby8SPusgEf7f
         m0t60DdPraE02MXfzj/WaI+hMiExc+fG+vR3ibokNBMV78wx77s2Zt/erX3xZEeleHX5
         XFPS4SzQiQuzqvAoU1wFiLnAy5AWgSctjwRJrW+khohjkKUQ2+KAujWnywVl/Tjxpp6b
         RszV92Sjz/AlNNe9fNLJOfCWODecy2GYqt3GZBB1LlVU4wvDu8Br60JrJXoEFO3PGCcB
         VnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420981; x=1795025781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REvih3wAsG/3Y8nmSLavA6sFWJivHfgQW3aPqY6xVOc=;
        b=EutE8nMs/sLnupGfOSf4JvjUl+hNjGLxYvThx0SvDmZ2YHWHt7uJUiKMg0WDoIx5LR
         5LH+YJjC9o0vQ2hUhF1j1AVPvsOGTNkm7Jc5O0ynz7eLBobN9DPp6qqcZje+HpFIFfPC
         K6fg+lDgZLAbeGRQaaMeugn7a4Bl2JhklVx5TioU8j7g0F5rYpF+l/TvawPr9I2SlwbZ
         8Qa9NbPTWH6fpwcyb7x48URQhJQnSZLYWjP4LrVCi4vhA0E560Z5kXOB9xH7fZEXoX0/
         RdPedpsPJik4y8/ak5KxJwfBmaHUg551kxvN1QnyhswW08sM07WkfbDU1MjmTgQrLHFv
         fS9g==
X-Forwarded-Encrypted: i=1; AL+hErGBV4mC9HdNFO2NolZDgP8eO9SwjMR6U+FmHBFzIeu0BR8+K2Om2FLSVqMhoBFCqQLmdeZT6J+h1JRMd8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SNX/vcNx8S/ulm87DH9JhlzPGu1SiJ/I07J821ctfng7/j0Jg
	YDRNZGqotnTznXg3y9ydNY+Pjudj9uYa6Ie+WF6egl5RvQIncZEBnGejTeBR5fKkM1UQK9QCaeA
	TwCZ3qrMWUu1YoTHRqnLJCtFnHv8vCqQuUKoGGaGpfrP3CssriGNyY+GQ/lxPfD74UQo=
X-Gm-Gg: AYBFou3Mo/9T2YhMLjEvlbW7upWSH6cItzuSSBVSNd2zqjZPW/ae25iMc1OAAOcYm6g
	t5EbSsaf7/RR6eyY1OSHM74HL34cYZ/vb6RSvirD8re7LAERmPV3NZ2r+DgpSOPG1AhT5I2IkGv
	C1X+ZXDYQ5A6GeQZZWJcJFqqc6SN/E53eSE6N11xauZiVrHziArUF2Dl2zxIQsBFybkNJtNirgJ
	4mRChuqoCZPTCqpBDMu6svQKVw1CXE7cu41YqM9eyh8STdR1I9nuE2M3GV032LNRbnXAbXAcEBC
	UXTSjJMcbaRiZsz+3T8qc19g6kUyVe8kPs8+fDfShr6+9nlJOASuvaKGr3lVvF/GYCLAT6KkSKx
	6N1LbmGQf6Oqbmkk+W++E4ir4iRwG/eK790LxrKtH87/aiimbGA3p5H1SI+n/jQ0flq9SlsUu3J
	KKp6zyDL/ZlbKvs/dSlHNP/p6HoEyOnOD0EM98cGuCdV7KFux2OH/D0RvCVDa3eg==
X-Received: by 2002:a05:6122:e253:b0:5e9:7a1a:5ad5 with SMTP id 71dfb90a1353d-5ee1c46bab6mr1148683e0c.20.1794420981304;
        Wed, 11 Nov 2026 10:16:21 -0800 (PST)
X-Received: by 2002:a05:6122:e253:b0:5e9:7a1a:5ad5 with SMTP id 71dfb90a1353d-5ee1c46bab6mr1148604e0c.20.1794420980694;
        Wed, 11 Nov 2026 10:16:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae1bdb2c94sm625101fa.26.2026.11.11.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:16:19 -0800 (PST)
Date: Wed, 11 Nov 2026 20:16:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX9NtaJDPlTknw
 9CLZPfvYKdGKZi1rdLRykcGh/uzltM7Cuqf8POVVD+JSOtoqWL5FgMCXhYCrNGPCKVX/gvgl79N
 69U0rNgdhPVP3nJZgOOn0KdMBBgUfi2QpZHcOSO7+hTqoyTCl34ySa0C9aACx7a+TEpjAUlOEiK
 qks07OsB8t6b7n0V6oXheTXqJowcNO6CFHLswQIjRDOefxSglKtjXgXMDglF+UlY+whBrySkznE
 Y86YxN2jsooYTNJdZulASXK3/h66k7IToE323tjNIYaAfVYqBqX8H/YQvz0VI5mVkIWgjlqORFT
 q8+l0wYl5K6VuOCIi1kDIFLpTei3VTMPN+Xm5KlcNJ2rFTI8ZtFDUAMUVTCk7MJnscsqlwVvVyD
 JQwf/DuqFGbAblIo5IaOuP2y35YbHg1KpVdUxGArccAgazhQWZeuzc2N+7wZLxq/5QdwVf6rXPL
 wOM+qY4D3wykkSJ7gWg==
X-Proofpoint-ORIG-GUID: dIkFLn6Q9VQO0vfFvxsGGxgFY2DJb1l_
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af4b0f6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PrdBiiE1VpZ4eXJVCeEA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: dIkFLn6Q9VQO0vfFvxsGGxgFY2DJb1l_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXzsN/OsU7xGGb
 mSXWTtcUtBbHTn09Dkc/uJA44w+oqRDrPvL+gp9T0GCIescr3he+J5PUD+Qj63SfT2D4l1l6uLx
 QyUV1RQpjWLF8cdGjNZHTbur25VPA2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.

I don't think they will fail the probe. Nothing will be registered, no
bridge will be attached to the DSI host, which means that the component
device will not be constructed / bound.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> index 7a3f8afae22d..9c2cef11e7a9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> @@ -189,7 +189,6 @@ &mdss {
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l2a_1p25>;
>  	vcca-supply = <&vreg_l22a_3p0>;
> -	status = "okay";
>  };
>  
>  &mdss_dsi0_out {
> @@ -198,7 +197,6 @@ &mdss_dsi0_out {
>  
>  &mdss_dsi0_phy {
>  	vcca-supply = <&vreg_l28a_0p925>;
> -	status = "okay";
>  };
>  
>  &mmcc {
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
