Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E9C48BD35
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380442; cv=none; b=Zffu+y5VHPeRg0SJ3YYoTNSMec/deqqjNVONDT9UGNjMPN3jhRryfncHp4tbGW7uwXcDP2U5TYFPFNTpmhCEkbqDpC+JnfCiXIEhYGolArSqkQHLiaHELR0yJG+sCntMedzHPxlLAh5S4pYkz0VCJ95+DHtKOl/cv4TjhqNW4Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380442; c=relaxed/simple;
	bh=4Vc9/hOrn91FRfCIDIgEeIA69CPwchjcY8WjqIDWQ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eA/1XkLTOFn+RhO42UOptygHSBwl7KDBFHa/35O6vmdTgA9tOSPiuboUpliqQ5aowXKymogs+cb8ahC9C48ml5fbNDCIrwTXvUP68S6XCymxqLursYfqbhvU1flMQCivTJkBXfTQ4XZYmz+We1FuiyJnaCc7CdayTVFi9Vwq/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MadV++wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BErQD1he; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MadV++wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BErQD1he"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV90Y3687353
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YDKtmnnu3285Y9CLAsS2X7YS
	RDDoyHvGbs8oMElF55Q=; b=MadV++wgZr2Byi2oLWHpSZZDS8Y/EMrT/qWv9EBE
	bzgmzvm5jYZGlc1f95npp+dToo1XZ1g5KJqgcc/jby93FYADALhg2/Ii9aYM8Ssl
	tYAgkCVj80WOQUbgV91ztIQztL+jchzNTRc2/VO9YTliBfQfDfk8h4F45Jyd0Ajh
	G1iIk3Xp0bjbZziir0QJzxc0TENiuJzph9xR1z+wexT/qr+mvWeYwnsh6Y3iy4bM
	u2yIZl1e/555AIOM2e7cfsHg57IyLhdw5jqoi+AqJ2AQ4VvwX36kqASGvcijsUjU
	isMZXuaoeOy8vgFb+/H7xO9s1L+HZ02hA8qSMuYHzYEJYA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr8nfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:40:31 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806756ea40so3658481241.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380431; x=1791985231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YDKtmnnu3285Y9CLAsS2X7YSRDDoyHvGbs8oMElF55Q=;
        b=BErQD1heEnq6VIPUWuVBHgFT3fJKuODxrEj5aFov0e3Cz/TA9kjfM6p5nA5tEdPp0N
         HK/6dPF9mPMF+daeMZeFm25daUyO33C50oc1pgU7mJHvWWMvNGXFdNLgez9nWu682nk3
         MdEogIPyRGEIN1L9BF5yAW1u6q5ZndNxpEaWHXzBNKc4YCX6EoiLe4flfFmgTUrBMOwc
         Ai8bP9TEDBYFwGsxPXmIHX/Oin044/3K/bl2VO7vVOerKDM+xdJ2bR9EBDPnMz3kv/p2
         nZK9piJpyphNicVU8sDLHojcLYz6HpvFKXnjG8uZZ0IBfRkDFbi9+fDrObeMVL7dGsuJ
         nv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380431; x=1791985231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDKtmnnu3285Y9CLAsS2X7YSRDDoyHvGbs8oMElF55Q=;
        b=yfp8i9tnlORgaOCWXrqTeD1q9jSQJCQBIlDT2looNKK++YVV8ROVdqs7FLFnsROprW
         3WhRW6TZzTbkYNha/HGJyWEVYHi1CzzuQzxBGidCEuEDAUMUxcjNiYME2wfYmq6H75Ws
         TA94hp4XDRF9ePPfwfQ7AufShx6upciKwCpliL+Yf4aOK41klNbbi+eZy+9mHaS4Lqh2
         v+Ke25AbCGJDWPPWklnYEyKYDA6njg2RLqMoSVEzxsXxnk0PCLI2q5lZHzHPMKZN3uS0
         zi+RuCXwfEqXb7iGZePkUzrP/I811T553KR3atlyQ9UBvHo5bJwQ4Xr/KlXuRqupo08i
         bqqg==
X-Forwarded-Encrypted: i=1; AKwUvBzFtu7+LZg62fQDpv4Zur4Ir2t+4tZmOeD31MUQqYh9fYjRGkSzgVzHW1jlSlE7tfUUHnUmiw3Qyj1LhgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGYg46RgdKmo+R3kjRS9sRcmsFC8+J4BRPnHllhJ5nyrpnOEna
	Cuk0wcJbUimqzDEA4vtecUL19AuVhioRTh4jwSRLX2wC6LTEVUTDKcjWF9LbggxIDghjv42X4wD
	+IiygY/u/y8OCTHmEOCnKw3s5nTnZ6bF/kk+fAtwV7g9KXkbQUXouYzxQ0c54ir/YT7I=
X-Gm-Gg: AYBFou09fB9JwncYBUJrJ8GhxtEOGs2ZqmfBlhV5meAWipXmau/PK/WzjocJstMGanW
	cCNzgeU4tNdVVVPWQr6XdlaC6z4gGJfY0pWactjuMzKmeOPAlQ0t901ar0vbFws/C2q+irMdCXs
	hikYwT+K+fBewyt8gTO9LgljXdwkQBnG4ECbWO31Ip3BruAnRWUTvGV2ROOs1hrFJ/xvtXyymzh
	sEM/hZUOQUKLmni/uh1IyNiLFAiGdaIrKL8TEFf1IhS1y1MbWc64ohqV6LMfOKrDki75lCHfrFN
	Fc5cqlBOHF/5BklKUZ2atP7gn8J8MV4+0MlL8MkBH+oHZSVZHY1iZL2ANDhr/TE7GIYe59kuImO
	cFG75iyoNUcYJ5KEBqRGANXtXffStmMH+SN/VyDF/aY03mJH633BQwDSjWtYEZfCKwzeF/snC1o
	CbSo8k9PTj2l3g
X-Received: by 2002:a67:e701:0:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7ca39132852mr711072137.35.1791380430735;
        Wed, 07 Oct 2026 06:40:30 -0700 (PDT)
X-Received: by 2002:a67:e701:0:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7ca39132852mr711060137.35.1791380430205;
        Wed, 07 Oct 2026 06:40:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d58408sm6659241fa.15.2026.10.07.06.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:40:28 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:40:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <3gylobhugzzwngtxwzke2o6almcmjzxrjqefpkmcpjy74baxvh@akzm74tyb2n6>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-1-9986704e2a7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-master_lt9611uxd-v4-1-9986704e2a7b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX4Flys/XxtRrz
 RGIG0hkrNI1CMMVmuFy12m9vVR/pmZqh5IMFBXVXGpiFk2C6M5qEGykuQzWtbRgYonJQwjBikd5
 bHjYSK5k1S1WcZK6BzaIrhsEIq4fnhEuK/WyTc0cfa7bjFRCIK/TwirbaBdYGCuAo8Vkl9wu7zr
 CVRddyBlAPjnk+klSzcuKLpHGWjETqBaPt5is++ZCI/lqCKaK+tylFjGn7+TPvn+XzOtbUXGU9a
 sQtIft785xIsHH/95nhcvxiE2ws1z115wYQkSzgvj8pZwv85ZHhr9PhQAMKHiwn7BG8tzXafmpt
 zfohjH2P8qYcxbgJcxwDf1ePtgEir10ObFiT3oipWrW1gkCpyqt0o3JYYLZ3lSi1v1u3WeRaTiw
 eNc163n9NT6yo+7DLNNrR2n6AiNeh36kkN2RPiWvXqLzp+edlMFjUkwL12BwF3oYdDHqm3S9BdQ
 n8P66Boj2fCQ0ok4H8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX+4/OTwXVdfER
 r/ZQ0+j02E6/oTvqxxjtPz9fWB47qDcwJWsKjYqTeWUDjU9KIAXddbrYX8euGIAGYRTjohChw7+
 WO6e7yl51TTstmzqDcftvtm1efwuWFQ=
X-Proofpoint-ORIG-GUID: fke7muaIb71gjbJVXfsGT2WOaqqnJVYB
X-Proofpoint-GUID: fke7muaIb71gjbJVXfsGT2WOaqqnJVYB
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac64bcf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cC8yJu4M2nJ482moxY8A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070054

On Wed, Oct 07, 2026 at 06:21:06PM +0530, Mohit Dsor wrote:
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> 
> The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> rail. Reset is on GPIO76 and interrupt on GPIO85.
> 
> The bridge receives DSI output from MDSS and drives an HDMI-A
> connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> 
> Regulator and pinctrl labels use generic board-level names
> (vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
> from the bridge chip.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	lt9611uxd: lt9611uxd@41 {

unused label. rename the node to hdmi-bridge

> +		compatible = "lontium,lt9611uxd";
> +		reg = <0x41>;
> +		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&vreg_disp_3p3>;
> +		vdd-supply = <&pm8150_s4>;
> +
> +		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;

hdmi_connector_out

> +				};
> +			};
> +		};
> +	};
> +};
> +
> @@ -67,6 +160,22 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	bridge_irq_pin: bridge-irq-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	bridge_rst_pin: bridge-rst-state {

I think the current recommendation is to sort them by the pin number.

> +		pins = "gpio76";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +};
> +
>  &usb_1_hsphy {
>  	vdd-supply = <&pm8150_l4>;
>  	vdda-pll-supply = <&pm8150_l12>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
