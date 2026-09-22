Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A6B566C52
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093012; cv=none; b=fA4I+OnDs3atvQ2Vehzo1s1th5kqKuwPdfBROg43XWo80A9l8PunigYXJOUVgwmY5/bi8soGCMvMidEvBwc00kdfWfBpc1gQyBYfuMAT1mA2oehi72SQN604ppJPsTGutxwF7X+vpDM0FngC5wy66XzaS/8EWmCuAvjBTGAQJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093012; c=relaxed/simple;
	bh=e8JQAB+2OKIHJqqLitjcvJVtojsIbIdvMsU0sAm5iQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRuU3uxb+6PnYkfWImtNFTX0nOCZgee1uVa0R0uHOXNScnygkuK4Jd3RG7t99MPL8sEvLIwCpHdaPyqoBF0Az5tEBop5qBKF1VvtgjqFKSTJlnqBSGUhK7xhxyuGcLvSC3jRLooo/dN1jQ5OJjQDGsLrI8dEYvrmifK+795xNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WI2m3eSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/IL+8mE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WI2m3eSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/IL+8mE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjdKg898320
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SRf6BCtAUOHCG8nbF0m+RZ4k
	S7K7e6lPtCgKhANO0i0=; b=WI2m3eSOQYqv7AxA0n5TQyrAEjYn0kOEtyQjmMzp
	wkY3WIsGZCRsoA97xS5I32+Jjs4/QkRFwuwnDW6DCWWb8lMSBhYPe5X0X71BhnoL
	iXN7vXxGbC188YMDsviFHrqIbwY0CR+pmU5PW2T8Qw2SkxIdffjhvZaoQJTXJDQK
	2PbGh3EAJenGiQOWztTUmOhQbtc7WG61/Rc8WMA2Zg+VDGme2em1la+Vnj6sebVQ
	7t7DwTZ1JrQA7R3ZoMsuxBBvqG1qNN54YA/FhFzlOvpmd3JJMu7GSYI9ItgR8fT7
	mMGpGDf0VWquVr/sHO9CxENBiURnea93L66iRPoLIwvVKQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkn40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:03:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c83007a11cso1528333e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093004; x=1790697804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRf6BCtAUOHCG8nbF0m+RZ4kS7K7e6lPtCgKhANO0i0=;
        b=M/IL+8mEJUGXmnP74W4GjVHMF0f4dSqsNOreLb5oldNON0KAxg+XCgYbFv0G3znAKa
         Yv9e08CgOL92z2MF0a5qQbGojFQHqDFBgiTZeYGMzAIyCC49BEvXifBSXZieWc/x6nnU
         BhdM/IxN1njk4S+uZXsa+BYG84UT/cnsMwwvDVn0HjGK/VGrQrLYax3pG45F/8BgDYp4
         hhkLvkwYCGN8ZzTTj0lxgpeYLlBmxCZUoZHtmEUwXdjZvmF9SqTsag4rdrr7CQzdhvSU
         eywVvGPMK0TaxCZUiaa2Te9vWhigqmpRK338Igvy7KvqlhyN1QLYOQvS+ttBoaFWr+vC
         jg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093004; x=1790697804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRf6BCtAUOHCG8nbF0m+RZ4kS7K7e6lPtCgKhANO0i0=;
        b=WevRU3tNKcusn3nDuWHh5fETX1z7L0lCZ6FYYFTmU2XgGW9R0afqnklrTRyod8e1GT
         kH22gyfgdt51sRx4fwsdPbsXN7NaF7lWWQ2e6+mAoZouaYrZv+b1JDddi+ktthm8EWMP
         gOi4Qpl5QhqC7XjlZvYt28BpktWVKbwRBepjylB3HBh32Od6ED30PuGHciR9bLoWhsXO
         N6GJXBBQ5oRpPRj02YQ9hWHA5PMlvGq7VvTO63RT4V/9/x9NXkw6gZw6BN9la664FDzQ
         QQ0Emou7yo93aBwpjvGGk8sA7P20Wjp47LDCk+JywnyJBOeecHaMP33CWKEHr48k1kyN
         /dgQ==
X-Forwarded-Encrypted: i=1; AKwUvBweG/TnYXCS1BLXvNLbIiQVCgrlbpIoCLBGD0/c5yZku8xCy5E/9JlX4FePPev4jWeaMlpxb6so0ZOwY0E=@vger.kernel.org
X-Gm-Message-State: AFuF++mIB0UndOR0SCgu7l9R/IC107u4sjxg3e8Nb/gOpJLoqV4gQ1Tm
	OE0Jx9UMm+1JBLnTKL8EOCgTvdLReFuk/GhoySLXL8sFLm3wKS1NSRalhdVJlncB/pedbkzmmuQ
	MRVHjU7Xxu0DIoM2Xami98JUvOQ34p4XdXkLQdqe6XvphgX4SL/3dIGRXYproPKsdKdF2T3mi3r
	U=
X-Gm-Gg: AYBFou3Hy1BBr4U9oEcmZ8DueUxRlRuqVTe8WM/0JqG+IyIdu9gL47TeKeGqS70c5Yr
	UYV12ZcQPR22UCGnGsqWpcEiQ/VqUuzx/cEixKY6AaSamvFKf0nyuASOEVPbrGKwBQTWhlxk+Pb
	q7fAWgZGrkV8CXxQADJBULJLCE3sG8UOpEv3tQuK0fZeijoCkoCgqs6PMPZS8ue9jtU8VbigLs7
	fjdDDliZZrMjMWGkjLACoQfZzhkQ+KOGX6W8b2pMkQ+5dpwdf/1ep0C5V8AaQLql8Z1OonpRFO1
	MYWWaRKCa52XRyYys49IazOMBaK3nf178fXtZlToRtrGmyb8wIX4WdmwO2rI4yhWTeJt+VrEWtM
	wDUUn4uJWvPmoZcuz3n0Orf0ivNJ0Zu6q0IqJSvYICb190BoSq7VJyKg/whN6MTaxFmheHVVCsF
	Rn0+GXk41P4NSy
X-Received: by 2002:a05:6122:390a:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9b58f8e64mr7724966e0c.3.1790093004425;
        Tue, 22 Sep 2026 09:03:24 -0700 (PDT)
X-Received: by 2002:a05:6122:390a:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9b58f8e64mr7724896e0c.3.1790093003941;
        Tue, 22 Sep 2026 09:03:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552fd4sm7707e87.2.2026.09.22.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:03:21 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2a6cd cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: Sck5-5fFnCj_9cWAKCD3aWDwt172Lxsc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX7GiA0IMvsu1Q
 m/IvZg1isu8qxhywhl2fg3qK/9X/sMsOE8QP+4taktHQo6hQsMfMvUvrndRAIRLMl3z4S0PVvGo
 pIsZzNYg1oZBzKI3p6CG529C9a85YAU038MGHJ9uxdh3P40VdTCQRpxMGO8T9fAyuiVdUKqAo23
 dHy6jFe2X9+nh2UtXjavErivsyHSNwav5vPXbkR0RhHWWnuz1+VS7NzTSdd6v9cpCGz/3IErtm+
 DIrZqiRlv+900CkCO+qpPZcR2R2i3DngN0ZLigDAhYPiSHGTi6KKQM5vhal28Bwl7lDwMya9QF9
 /QrvCwyS7t3QqTY5mDhoe6+fhBAVVi46tQ7Rt0VFvunZXAZMHtHrqWtvUHoK1kACf2d6F6TjdBe
 bWoMBLzCmIYBgHji/BrZKYLTTCo02G1/WnKQlPlpai3ntdISViw/5oAaKX5Q36Qi4ObG18CfSlR
 2lOmB0iYOenECzZf+bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX71hlxqdGY4M/
 ExzFX8H2BhudB1Q5HLEEIzIdNJD3fWz2az5QIkJ/DBZA3+RxQUnm5nHPYfI+bSWKjIL4Vi1ALKS
 bNSFOn+1TKOMhwCgHhXZ+VQtWKxZ5aA=
X-Proofpoint-GUID: Sck5-5fFnCj_9cWAKCD3aWDwt172Lxsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On Wed, Sep 16, 2026 at 02:41:20PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm
> Shikra CQM EVK board and add the DLC0697 MIPI DSI display
> panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm4125_l5>;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply = <&pm4125_l15>;
> +		avdd-supply = <&vreg_disp_p>;
> +		avee-supply = <&vreg_disp_n>;
> +
> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;

As far as I remember, your panel_bl_en enables an external regulator.
Why is it not described in this way?

> +		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry
