Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796285;
	b=1+y6sipDS/+llc045IS17H9aWAFtLHz7ayDrF6LGS20meIzYlorrisFBKkUzd020CAuY
	 yfOcQ1uxE+d/c133K/Q4dlRDc4dzq3DRwvOoiGQeWhG6b0i/Fw9bGV8pMuJCdLZihqMQP
	 Ncs64NxsadhLSTEGNKQ+IsNxWiojnTltfrxKp2pF4W9XIpbRL2G1IJS/nq5vkInJ23aPH
	 BRpYEdi1j1fV5cmpdCQA4y9X6cEi98YNx2Rc/pU06ftxygvFK3TMHq5a2DJmCnXAscGlk
	 ovBlwJVumf6BN6JCjcT2epUph6IjGWnzEgIP8joAWT5pQbCOoGQrT7PHfOIYVUUJzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
	b=lD1dl2DIq+zAbCpi1e5fKfwQVKGPs51Obo5m2sUTWXnPMcEsos/vamq6kjS043L5aCuQ
	 qLYihptXJLC6ce1U8jdDOyUPegwOz+puV2zquQfzTokil4eTdtkI5Wq5Z7SoYTYocbOzA
	 HCF8hfdoh9GZGdmzOXnHGz753/QFJUh9KE+FwvTrVDwsG3JngGaSs8LukEy4XLENLeUVk
	 SIcQ3yIQ6jVpNj/o54cnSEpiX/M2lmAevP5ZOE0/baAz98vSmWs1ZzZ2zEvD7UVhSrG/S
	 jPsZuMqsGISGowKd1QXCSSMYTOOKFb23GTf6J4KqP9tfIqkcwNmr9QMFJsFBXf3BMoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrzyRa5y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIKOv8cM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962BB606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962BB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrzyRa5y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIKOv8cM
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba0pf608509
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lpw21cJiJ9wruQZ4XIkQa5Wx
	AYUj9rrJY9kVvdlbygk=; b=VrzyRa5yJxKjF5oCblD4/urpQd+MDemmYa1H0ioS
	bMMwosTxK4S14FNlA5omekOFPhDLypULjSJg4XTej+4KbSGwYudvfFkLypNQYL9A
	Ag77eCy9U2haTWbsANJlDXeSf52C47b3AQZXb8i/8BfXvC/cCiuLcbK9ztiVXO5l
	6mUKXPpumdZOsQ4aoLtfMLVgzD4MtP3ScIcBORJyzx4JnJPWICgAplP+EdHV1o//
	zm7wVYhoChgnhF/er4ogwF28SYaG3YKXkqeeVzDbca+RwBSTtin1QphAnokxP4vP
	yb8sDkP4C5vmGYiLSE7hz7/8pzzSXnIYu7DIEHHdfbs5mw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80aqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:44:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so955053eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796282; x=1794401082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
        b=TIKOv8cMs59SLInjeoHjWErjkqcFC92AT01kYBuiGMqWtzlDHGLrvjFQpFwDvriI48
         E72mUF+0lqXwts2apxF9Jb0Igp2w95pdxpvdJ6x9Zki9tfuAY06WqBN6OWtgCpo1+OoT
         z1WWlOxFP+Shr1z9wTxsDSNv6sGkQfEw8qfmnEzqHccrF3eMBbIbe2wqCC+ytZVn6QFT
         y+7rksuxrVtR+/cpbIyNK/cP3Jz45xbTs6IhcZyNDr84WQC+C/KUwg43l0su9s8I5+gi
         KKidJBpDDQMwa2ZM2MTizyOxY/rNKSz6gEPMkL02p/VqukcJ7mfodapkS+8BO5zfsjDW
         qFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796282; x=1794401082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
        b=PNXGPvtZNc/pB3HIxFBsNXt4XvlitTYlgEIbOR57BS8O82TLiu1Js+/Y8BwRSSQra0
         2OD50IQd5TIi0YSKlUaI/lC7ZgXEJH3AXu7dDiKzjTk9z3O5fqBOWVA2uYuP/4v2UFVl
         9Pm3g6EsHovO1qdKH64ziNytVBuFCrDvdzEBsG2EJ/Vg+YT6scxN0JAwkoqcKs9jzyCZ
         INX5mt/W8RW++kqBRJcioz8lnEcoATXEyc7jifijROZcu5Cd1zN2hlbKhNsT7ogYqPs0
         txfP7qbzFIiIi9HsElTCrJ/6iJt0IToQsoC0DQwsVGLS9v9CZbywm2HMkt+i/i4GPAKe
         8Ikw==
X-Forwarded-Encrypted: i=1; AKwUvBzj8bNDtM8OBsfAjUfD+Xqe0lDbWZdgxtX/8nfNmQXH90hjqYc9Lp0w28ZCFRo+9QCR2NyWIJNnb2DDikE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N7j7xjjLyFHC0N3wQOZzHq/sSMP321/OQkjfwFFNqRv2zXzHF
	qS2Yemchqb2XZZE6bPEs+BjDSDY+DTzYCdwtoMyvBtlj/bZgOuu5J6K4ZqTG5aEk02cbFECGwlh
	vHdPMbn46/6uZfCrxDegobOOAD1MzMwUKaLE09kMDUdAnK3eIF4r6oirgjwF7ukflj4t6578xPu
	IsfQ==
X-Gm-Gg: AYBFou3Er7auhb18YMQ5ffv+bSxmXsjoPFFAXZIb7KHd6logo8Qk6o9gMEo7zld9Vgp
	BF6S3TIUmO42uXVoVji9anTadn8DdRPECmE+wcbRY0q10h1Oa+5uqn6AkBkxrBRBNfqHc4846RX
	2G4ajYhdI3RkKGKvgSeQ8p/C39PLtUTdAAa/0frBSWDehc7P6IO9VkJ5YW2uovR02MsNgv1W//K
	VLiiTxx/8j14uG/zA0DmFYQlx8sv8FpNVuD1t7wk7xjOehYA2lTrFobJ8gKOrArrooVvyd6mpZN
	F+3a0z+lde+Uleh1Y3Ies5K9wFv+yEGrQBfZbBs/W4okAlGwoLYDLtO2P1fQfgrzcoA2XJXEhBC
	cNjLBB9kCE6yDQNSlfj2L2oJFRhs3KETLc1wQwGeKs6/s4BAjeFbKfHsvbqQ9rRA5UJdV6rfmZA
	UIBZpOGbQzazkZUw==
X-Received: by 2002:a05:7022:b044:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1ac5e320c51mr27221952c88.29.1793796282381;
        Wed, 04 Nov 2026 04:44:42 -0800 (PST)
X-Received: by 2002:a05:7022:b044:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1ac5e320c51mr27221898c88.29.1793796281578;
        Wed, 04 Nov 2026 04:44:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8110251c88.13.2026.11.04.04.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:44:41 -0800 (PST)
Date: Wed, 4 Nov 2026 20:44:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
Message-ID: <ausos--t6wJVzI9g@QCOM-aGQu4IUr3Y>
References: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
 <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
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
In-Reply-To: <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WJr7wtfaPAz2aegb4w32UeGFbFLZPdcU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX0SRAC9L5EPUa
 0u4FSYKL9lujDrOHwRzwxeh4SpVmouxV+PqApGmoSEUf945EI7nsGuwQ4hfj2DIvkpHtq/GvgeC
 FuPmuXUuOSIKxDu5lGaslfwuSSN+jGJJqNY/9S4OKNYf2Oj+OJkjZdhS1aIXm1biYkBL03gL6er
 lw8hwt9vFXWPprxIMXidGtPWJKggGha70AZzOATFGIImpuTeoRHHORvcYAPbBeKim3bfUtUQu7z
 6L5AkNhr6Jt+MmbMbGIECXzQoN286KFg1HDqCVkxzz9hy4kDPQOKN2fCS7cMOSMisuu11aZoYP7
 UQ30/zAbDro6pNpsV1uWyugutwLx3OC0TgVe/cTnP60dVcPs1IP1LRafHObfRGJ0tXQzsETvIPH
 +hvky4kj4GHROb+Ok4adgsIQTcMl4rcRxGU3AhxWaXWE7rSKqGtvtJ7qPQ7jYfuw4KhwX5AfGko
 e5C1L+EQgGIhoZWP66g==
X-Proofpoint-GUID: WJr7wtfaPAz2aegb4w32UeGFbFLZPdcU
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb28bb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apQYb0sKy1KnhfKHRK8A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX03xH4EhMAoI9
 eDzZjX1oyscXZEYvX2C8n7BREkk9RnbynmlUG6ht6JLc9Xt61KDevEgox9VJHADUTAHbdEmkEgz
 uhhRxiSx+j021Xc0YaMFvfCcHFt26N8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

On Tue, Nov 03, 2026 at 11:42:00AM +0100, Bartosz Golaszewski wrote:
> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
> EMACs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  30 ++++
>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 207 +++++++++++++++++++++++
>  2 files changed, 237 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> index 91c97a55f2787406b104650956b9a511a6a34c23..96a54f32f0eeb16dbce9802e74eec82622ecd35f 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -58,6 +58,18 @@ &cpufreq_hw {
>  	clock-names = "xo", "alternate";
>  };
>  
> +&ethernet0 {
> +	compatible = "qcom,sa8255p-ethqos";
> +	phys = <&serdes0>;
> +	phy-names = "serdes";
> +};
> +
> +&ethernet1 {
> +	compatible = "qcom,sa8255p-ethqos";
> +	phys = <&serdes1>;
> +	phy-names = "serdes";
> +};
> +
>  &firmware {
>  	scmi0: scmi-0 {
>  		compatible = "qcom,scmi-smc";
> @@ -3218,6 +3230,24 @@ &uart21 {
>  			     "perf";
>  };
>  
> +&soc {
> +	serdes0: phy@8901000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg = <0x0 0x08901000 0x0 0xe10>;
> +		#phy-cells = <0>;
> +		power-domains = <&scmi7_dvfs 0>;
> +		status = "disabled";
> +	};

We have the serdes node for Embedded variant as well.

        serdes0: phy@8901000 {
                compatible = "qcom,sa8775p-dwmac-sgmii-phy";
                reg = <0x0 0x08901000 0x0 0xe10>;
                clocks = <&gcc GCC_SGMI_CLKREF_EN>;
                clock-names = "sgmi_ref";
                #phy-cells = <0>;
                status = "disabled";
        };

Per Nord discussion with Konrad [1], I plan to move serdes nodes back to
common DTSI and let variant DTSI to supplement or overwrite properties
as needed. Does that make sense?

Shawn

[1] https://lore.kernel.org/all/ausjj6ScavYiYKWo@QCOM-aGQu4IUr3Y/

> +
> +	serdes1: phy@8902000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg = <0x0 0x08902000 0x0 0xe10>;
> +		#phy-cells = <0>;
> +		power-domains = <&scmi8_dvfs 0>;
> +		status = "disabled";
> +	};
> +};
> +
>  &ufs_mem_hc {
>  	compatible = "qcom,sa8255p-ufshc";
>  	power-domains = <&scmi3_pd 0>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> index 6f19064997a4b50525fdf630307b843604368645..2b3c9e90802bf89b91354039f0e6a24941fc95d5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> @@ -14,6 +14,8 @@ / {
>  	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
>  
>  	aliases {
> +		ethernet0 = &ethernet0;
> +		ethernet1 = &ethernet1;
>  		serial0 = &uart10;
>  		serial1 = &uart4;
>  	};
> @@ -101,6 +103,179 @@ trip1 {
>  	};
>  };
>  
> +&ethernet0 {
> +	phy-handle = <&sgmii_phy0>;
> +	phy-mode = "2500base-x";
> +
> +	pinctrl-0 = <&ethernet0_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,ps-speed = <2500>;
> +
> +	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
> +	power-domain-names = "core", "mdio";
> +
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sgmii_phy0: phy@8 {
> +			compatible = "ethernet-phy-id31c3.1c33";
> +			reg = <0x8>;
> +			device_type = "ethernet-phy";
> +			resets = <&scmi7_rst 0>;
> +			reset-names = "phy";
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +
> +		sgmii_phy1: phy@0 {
> +			compatible = "ethernet-phy-id31c3.1c33";
> +			reg = <0x0>;
> +			device_type = "ethernet-phy";
> +			resets = <&scmi8_rst 0>;
> +			reset-names = "phy";
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
> +&ethernet1 {
> +	phy-mode = "2500base-x";
> +	phy-handle = <&sgmii_phy1>;
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup1>;
> +	snps,mtl-tx-config = <&mtl_tx_setup1>;
> +	snps,ps-speed = <2500>;
> +
> +	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
> +	power-domain-names = "core", "mdio";
> +
> +	status = "okay";
> +
> +	mtl_rx_setup1: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup1: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
>  &gpll0_board_clk {
>  	clock-frequency = <300000000>;
>  };
> @@ -145,6 +320,14 @@ &scmi6 {
>  	status = "okay";
>  };
>  
> +&scmi7 {
> +	status = "okay";
> +};
> +
> +&scmi8 {
> +	status = "okay";
> +};
> +
>  &scmi11 {
>  	status = "okay";
>  };
> @@ -162,6 +345,22 @@ &sleep_clk {
>  };
>  
>  &tlmm {
> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {
> +			pins = "gpio8";
> +			function = "emac0_mdc";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +
> +		ethernet0_mdio: ethernet0-mdio-pins {
> +			pins = "gpio9";
> +			function = "emac0_mdio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
>  		pins = "gpio1";
>  		function = "pcie0_clkreq";
> @@ -205,6 +404,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
>  	};
>  };
>  
> +&serdes0 {
> +	status = "okay";
> +};
> +
> +&serdes1 {
> +	status = "okay";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
> -- 
> 2.47.3
> 
