Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F253B3894
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980807; cv=none; b=ipSQGbUXQAixLOLblr0tGJZPb2LHnugLINEoMhOg6InrjfENYtvZJbSWcmNcOjG0sTqDeE1Z6X5jmZnpPZWNFPDp3VsGlOMCrzTFMsoAAsxyjlBcp+PhRDk/J/dRXXS9MmnuB3FlxVzXpSS3ODZfUze0IODnsgBnBC0nYlbdx48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980807; c=relaxed/simple;
	bh=YyKjRrENa2jqYzkE6b4VaoAexwD0Vzx+ljnaN+l9AoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcqcVTcSm5OV7hi2YXt3fbxcdiLzoEX8j5YyzeigHlEQVSt/Asq1xn9ROcbABeZR1zQNhOEAGoSdVZx4Ci1RKCa06gR4V2Hjb+duIyUn3562it6HPfVC6RGL63lRzzvxuJtHQdpLjw8426F5Zqpyd1IlrgEooBt/n7Zppgdv/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqIh4aSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcOIS6X5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqIh4aSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcOIS6X5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgP5L2281398
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 19:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E+XR1BMyDeEa9EYabyzY1b90
	OSvHsAhw5WOfhsjMWEA=; b=RqIh4aSJsBJJhjQyyoERwKmDQV68nY9nu4gVPW54
	QxRKxjktF72bnvsW1vVXVgFg3maNHa2Scc0M8dyHs3jrwZboRe0e/qe7kDnYViMZ
	CTI3a2ILQhvK6FO5QD3iOOr+KNfcAaejM0uI5onDZ5jeM857kQ2w2Ill/ww0Wue0
	Dxk6PH7QWVc70HgSSJJYNPDhHJ9zjOxKSP9wOBs+ZUp7LXH7QCG3uqcNLu0ZHQfq
	M0jo/FA8A1fbunmyU847R3NtoxT9+vDuA6DKSKJaN+RzN+bYYg9IQ4Ur3DH8YfGk
	W3yRKoNPT4UJ+34dXnDGwhucivzGuZhgx+aHX8R7Zxp/dA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydr5hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:06:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so895312137.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788980804; x=1789585604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+XR1BMyDeEa9EYabyzY1b90OSvHsAhw5WOfhsjMWEA=;
        b=HcOIS6X59heNTsfLP6aSfLGAaKVSJXvSOk+zowmdge7gHLEwd6I2wd/Lq2wW+xWpjd
         6CKGOrK+E9kkzjyb5KsU3KNdoTD0yN1o7U3ei43jBS5q/UM9cEc40tDyj/pZ9pW+FWey
         nXrD2EpxF4nMlrCG2tK7udxIUGTlL7wIk3V8DLZF/Fop2c9NZDDrQ4/BvOggg5lhspLu
         2OqApc79HdqGNfKWJppg4hrssUI1XZZ/6rqbfsBSd88+hXKBkV+daKvEEybbqAMpZBjt
         4t1gLNxGH8Hzl35wXuG1rOOEuXgyDbQ82msvdzMKx74YQYUUJmS6MvlfCqSA6v/Ad93f
         4pXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980804; x=1789585604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+XR1BMyDeEa9EYabyzY1b90OSvHsAhw5WOfhsjMWEA=;
        b=L1akTQpqENHNAfIWpata1GRs2DMczXvYGwVLJe/LBJtZ7xRiA2a7l4TKsEJSYAoBeB
         Wk+bcTs/c77ZUJgBt6nMzFVCREMTTnoTKcIQThvbgcsRl9GDs/so3/ygtYhumEp1kbHc
         oLaoowVs9Fg7m60BiY977WXsxvKfdYjqnF7T/bIMeUh1DDxWMGRNpoF7Fzs5/VagAlZT
         Pyjno6xu/BHqSyOxp/jEuSRvI8TXfLE7PmFTw/uSTRFEgiGkDIhw5WRoPlmE27yV2c+s
         ZWqL/Z3Kmo2eEKq1NNjJVWLQ4wM/ppX7laq4ABbEZCjTzjjmaeacSxBNQi24nyx14LHS
         fUmw==
X-Forwarded-Encrypted: i=1; AKwUvBxGyx9aEFbnwRtoKPreLgY90ccUPWQoKeO28S9OT8Ky6ubf/ahS9yO+OEocl4K4b1IixugTST6j7nf2F+E=@vger.kernel.org
X-Gm-Message-State: AFuF++kuzLr3spPZfxaSCktUgv8lxYPTKRieZswDl8VXE7SXvT1cLLsw
	nibY3D5PviHQrNLhwWK+XDE2qE2On3cqquuYuL17w9zxgl/w07z3K67HltDzadUew7Q88TzdPiY
	OcIicD1t0Ym1nx3D9XOZ7ZWi6qnaYyakiVtgwGttt2Y5isH1scfaPCafhx4P6VR3y9NNDds8QhL
	A=
X-Gm-Gg: AYBFou27WftSCQCgL9D0hEMVR6fcJ2WX8GvLiA9K5qS4N1p7f7Ug7asvM2sdDByG/Ut
	CT7CSZZwU5v2NGwSWJA0BrjmpC1hY3xDuW+L5g6afsz2rmOmfehobVvSMRzwfFKQJWzioF73zzZ
	jLBxzpERJAB+LeJGLA467r6sssbswp8Vr5Y3D7TKLbFpuwC6RujANXCim2OmieXveVaR6MlTyab
	GIETmYmEI3hLb13lIobrZbN9WNeAS/gPTj1/qvBXiArj5I4BYmDv5B8APvCtQG4VCBa7ZoHugo7
	IUEETDoW+xVBcc2zMjt48yYpahAacfz9LW0v4UC8EzB3ZR5Po6e3dwGoaLqnpcraciCmsIOQozq
	+3j0R4Y6RWk3Sshp/T9clUJLJ+rknoD2vkdh1upB6M/7Dccgt12eXYkLgy/s73heAdMQuZwq2Mq
	1zkOkOe+/t+3t6
X-Received: by 2002:a05:6102:4191:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-79075874992mr2261907137.2.1788980803717;
        Wed, 09 Sep 2026 12:06:43 -0700 (PDT)
X-Received: by 2002:a05:6102:4191:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-79075874992mr2261880137.2.1788980803233;
        Wed, 09 Sep 2026 12:06:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669aedesm4079194e87.10.2026.09.09.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:40 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:06:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nazar Kompanets <xlie7669@gmail.com>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8450: Add IPA node
Message-ID: <kirwxhjjskimczzf7fv6go5b4j27qouqvj27n7vckd4vkr3rkd@tf2ugwqbp3kc>
References: <20260909-sm8450-ipa-v2-0-2deb8b4e91a5@proton.me>
 <20260909-sm8450-ipa-v2-3-2deb8b4e91a5@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-sm8450-ipa-v2-3-2deb8b4e91a5@proton.me>
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa1ae44
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=FHrIvcMS070A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=yJmHqWV7plCzNz9V06cA:9 a=IT5BngQnVUfANsGC:21
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=SgPajVZbcOB8BOzLpJrL:22
X-Proofpoint-GUID: s2-CWiueJQh1go63pdnpCosK_duxgVi9
X-Proofpoint-ORIG-GUID: s2-CWiueJQh1go63pdnpCosK_duxgVi9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfX5nopS3Fkl3Oz
 x8hJvt0SxVNdlKtyV9BwjujZC+n4hugzjeOQZquB1ttCyZeqgPiCVcW2jcxBKwTcc0GpHkCAsDg
 QV+E6sqgIGDrUWPBjvagfOnIwowYKYk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMyBTYWx0ZWRfX4A58+jOJjjXf
 aehkIPterDum09aYgtSRx+7aYNsiGLemDiHWHYWaqg7dNXOJ39jEz8eYpmymlZm/c2gjwSM6l9D
 3UvSbBmlr3LrZvvyFas8sIv3sUiBbOF2ojzdh2NN7X/NwwueJFtbuGfl/SJ+yC8OfrhpcGc0KG5
 8PP7C4Ja+L/hBgVjHB36oQ7EQUD9p4THk0Hew1WCWz9SzU2KrlnAzPIyiSA6HrUhgbMVXIBJ6Rw
 7T0jOlrQsScvM7op/yCXoIIEOqnqgTI55SLBOxU293UlTI9eFQoD4mjQ0i02LKP/vO6YO7R0m3V
 TqH7WMuu37wJ5S4p9d/aYd9CSaSDLjPiepOK6vcQGzQ+ARCMnq3MwTP53uIiB0uS8mOaAlfIaoT
 wNsHyR2jbdkk2RbJn025PEZ5zeWum/ZHxH/mUNQGOEDkLOT8M+PxsURuSLx2qxUGPsXDot/07WW
 7oKjtInp1h1WckX4L7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090213

On Wed, Sep 09, 2026 at 03:11:39AM +0000, Esteban Urrutia wrote:
> Add the description of the IPA block in the SM8450 SoC.
> 
> Co-developed-by: Nazar Kompanets <xlie7669@gmail.com>
> Signed-off-by: Nazar Kompanets <xlie7669@gmail.com>
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 59 +++++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index b8793482b181..95b6fd22a846 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2625,6 +2625,47 @@ adreno_smmu: iommu@3da0000 {
>  			dma-coherent;
>  		};
>  
> +		ipa: ipa@3f40000 {
> +			compatible = "qcom,sm8450-ipa";
> +
> +			reg = <0 0x3f40000 0 0x10000>,
> +			      <0 0x3f50000 0 0x5000>,
> +			      <0 0x3e04000 0 0xfc000>;
> +			reg-names = "ipa-reg",
> +				    "ipa-shared",
> +				    "gsi";
> +			iommus = <&apps_smmu 0x5c0 0x0>,
> +				 <&apps_smmu 0x5c2 0x0>;
> +
> +			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
> +					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "ipa",
> +					  "gsi",
> +					  "ipa-clock-query",
> +					  "ipa-setup-ready";
> +
> +			clocks = <&rpmhcc RPMH_IPA_CLK>;
> +			clock-names = "core";
> +
> +			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
> +			interconnect-names = "memory",
> +					     "config";
> +
> +			qcom,qmp = <&aoss_qmp>;
> +
> +			qcom,smem-states = <&ipa_smp2p_out 0>,
> +					   <&ipa_smp2p_out 1>;
> +			qcom,smem-state-names = "ipa-clock-enabled-valid",
> +						"ipa-clock-enabled";
> +
> +			sram = <&ipa_modem_tables>;

No qcom,gsi-loader / memory-region ?

> +
> +			status = "disabled";
> +		};
> +
>  		usb_1_hsphy: phy@88e3000 {
>  			compatible = "qcom,sm8450-usb-hs-phy",
>  				     "qcom,usb-snps-hs-7nm-phy";


Also the device is disabled by default. On which platform did you enable
it? Is it supported upstream?

-- 
With best wishes
Dmitry
