Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026919;
	b=FB5PJvAVobFQ4mtXgKq5YnT8+p2Y7ujoaMXXbT/AkqFqsTmjOABX3jSoFiAIg4zJ6/uA
	 DfhBUqqWnrymxP/wpUr4lNcmPyGFkqFa0zwhS84zNgzXGZiLr8Fgoa+MbuorzOGMIhMO0
	 d6Ngc5aHYYIWUnB3+flA77NPa9gf93FvTWsOSVLVmh99ifmQQ2tBUOMCjIKj4pKA76CUs
	 eoqMroGXePROagbA1YpxE2DSNjzJOo1wB9/Z6lKQ2DKUKG84jRtK++xYxQdFaIH6+gVCn
	 v6wdis84gGlr+qzmfO9ZZquyodQ4zF9xSJhPtajv7wzaXDW3lVM7o5gSlUQGBL4NpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CD3Du/kC//dk/9ggBqhnp23Dvqb48YN55ouEt/7rfd8=;
	b=MHYbuRlPfIApx0O/1FR7OsHoiLnRCTCukTIBrOuNS45BlMF4Q/mQGcPkuooAi/EssVuY
	 U23bPbFwJXxLmMbLzdeuuIb4JAA+ppdi8JkoGl+NjQTmheR/7sn7lwHleTV6gDBPfRWlB
	 FLS3elCU+q2c4P5G5+oFWRtz2r7RgCjVx78phTLif72YYi85NuvOx5Q8nHJmpjqtIhJkc
	 K8tY49H/R4BnMxJNoWEAfKM8sl8xy9pNhSHr9WU/EMk1b9GfgcK58vSjeJWOw2eq2R8/f
	 VOqRW2YZwFAtaG+pVPiYzL/s8R8Y24p00uguvlV1TFV4FHWSBbr2OvWgNirvflZ3rYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTKp1JuX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JgtSKSoS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7085606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7085606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTKp1JuX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JgtSKSoS
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvdAb465843
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CD3Du/kC//dk/9ggBqhnp23Dvqb48YN55ouEt/7rfd8=; b=OTKp1JuXO6ngGHdb
	CxbYX1WhhHvfgBeGckmjHW90sgY/QNxRNnbYF0Lja0LmSz49rWN5E3mTHg+oRfgn
	ELF15Z+2RuqOucq6t+f3km/qRww5kKoY/Zasc0NV5oiIqebIQq7lullQ3e9QqgkN
	02NjhTCacHKhEGpj0i+Q7/za6qljNsHxOaH/O/RqYppQ1MD0iPVND04Gxsuulm/f
	n/ArG5EcKR7D7DBmYlu1/31X1JfIjJlCC7ym1gflyU1NssaSsT/h6YkRBRX6qwYO
	ewmwDyrqRzOUZAljTLZSpxAe568pfsGLksNeEe8xDu5UYZ2WlBcNbpLTGLy0Us59
	OhG8cA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpty6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:01:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bcc2f50fso148974241.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793026917; x=1793631717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CD3Du/kC//dk/9ggBqhnp23Dvqb48YN55ouEt/7rfd8=;
        b=JgtSKSoS0fsbtObV0XOmSQ6yVmEJw8F63r6B1wEINtOsRgVil33sS5lGCfBHgn+jy3
         eRmlbyks8eAvAUse4ISVWYxLD7lB6zpWK/+xZUx7Fue4Kwro9jrX3JzoI4aRFr0jiki/
         n0oGAZC3NifLG5m6dFJvnPwBAXwR1li/5B/nV+HiHGV5f173KAxPO9SpqKt0kEScVElm
         aj3E52Zz1xHSs67zG5JXObfNxEuvFobr4jEltWqPkLvUHcvIqEpeOC0fKHkFAhFtRp9G
         jJ35seAbYI0g2AIEUic1Il0cVKcd8Bzwvx6vEcOSi2bhrJWnBNNJrLcw1LrKny1kDu61
         WFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026917; x=1793631717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CD3Du/kC//dk/9ggBqhnp23Dvqb48YN55ouEt/7rfd8=;
        b=L6LLVCuyeKGxngRWja/ctJMyO0wY70NxStF7+r7S/69qt2vYQWI5mKhtxoErAHHWoU
         7m9hWLWqv9WLM30Epf1f0EO+y1JM4MJWxruC6mGbHrT26Dw7QvcDj0gyIxact6xVi+YP
         7q9tfEOVlSxxji9BhG5OI5Ng0WdfRcqAKttkj8/kS7wsRacpsIr3sBxOPDCk306myQmt
         PyasuzjKa+O/iFMp7brsltWq75WEcILMu0EXX4rSop00scPVUqoyVSGJNU1QP/1VKQMe
         EYw/VWvSBSHFc/DvIkqvGQxer3FN3853vonY7N9DnX9VvoHwSy/+2YVNLUdscAxmnl0m
         qpWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZJ6iTSa548HTKAALHMDt+8U4BZrb79y+PVNchcfEMhg2GjcbliW/pDDaniiPHftdHQKZFTf+Wp6Pthtc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9D1HVRP66w8rsQNhI4Wcjk7OjkRFzoFLI+yxQPYsCTeu2RXde
	aCq+g1ST0r7zfVJzcaUDYeQHvkUfpEVNYFSHLvrgpGfetTxDDecaM53I4KglJ56en8pGvLx27T7
	8b4VpSLGsIBkepQHtCpwyQVFL/gBU+sQ8Xhr+jBIF0G3Q/4jA7ZLXiYWtooBSfuRK2Gk=
X-Gm-Gg: AYBFou0oQWTrhlCfGNIRSTthCBvwLpV8g+kJTViFyiF3kdE1RMx+bf2GuZCwa8gQr1D
	3luFA0phmLFbcb3W8uGULjKmcmOnsYqdM/EyyG8tVmWJFBzjLQgx6WL8G2sNWmAD4whZSDTM6q2
	rlj+IoxeKbY1qg3URpPd7WbJqW9xHLmAzzOc0L2z3MnrW2APNcyLURR8q84uZHSPjYNkU4vzmlt
	n7yHtbg/1vKRWN91IMmYgaQdDnml5u73kZuO3yRcNQfEcHfGNKXN4mxsQ3Na7raveFkoEd1aojL
	Ia3UifLj7WhmDv5QzZzgmJ9KqCu0tn3J5D5aRmVirfbak82NbPIO5iy9essHHt5GdAerkqikIop
	uhlS2xdIUNumbE/IOzR6O/w==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2105818e0c.5.1793026916382;
        Mon, 26 Oct 2026 08:01:56 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2105731e0c.5.1793026915612;
        Mon, 26 Oct 2026 08:01:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm335488366b.13.2026.10.26.08.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:01:53 -0700 (PDT)
Message-ID: <cf9aa65d-5603-425e-b09e-0a5ae86fa551@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:01:49 +0100
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
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: Add initial support for MSM8952
To: muzafferkadir@mainlining.org, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-input@vger.kernel.org
References: <20261011-msm8952-initial-support-v5-0-1857074992ec@mainlining.org>
 <20261011-msm8952-initial-support-v5-5-1857074992ec@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-msm8952-initial-support-v5-5-1857074992ec@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX/jjcz32c2rIK
 PQ043Yu4VFreIl0RYtqR4m/mNlJ1uTX7OR5VV+MzTaiZ1Wi1HpyyBgoEviESs74LguJ5AXx3Pke
 Y3BbtIL0Yd2DreYB2GhCeQtStMvFvvE=
X-Proofpoint-GUID: XH2vgxuQszIxLyVnB82Wbqsw0G-0lkYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX9hnL/zTE6p1f
 J017yqBCtRXq76FFyL+qMlH+HD+wDfrW9e4kbtll5EJsWkcKGrYsc7cy1TSis2Svax/7uBzLYb1
 U4p0VhGcNDXsU7UZRsjCVi17A3NgrW95K7AUTT2R7iyTxjsXSGva9qfGbeKgASUbzx7yrILLg5g
 2uOOsad0OCR4xNckY2XNOeIsgbNf1yh9/SszMXrjgXLPquspcs51/XfJpz+bZFp3kluAKB/o/rl
 ysnrmLKJRaG3Bnz/9FrEI2KgSrf7mXLJAX9sg1Vk4x4ZY9Ej1pAiQfIvohDfIjfZij5I5Ysy3I+
 RlQxIpTBdi54w6aGntSLha8mN9pKjpmYGFW/9NRVqilAwfN9ioK3jAPhxzQXfyssvsmtKpeKIqf
 6Pioth19MD/7a2cDyplrNOzR7FT91QlAtWP/m0reCxEO4JZ/c0L7L+qhzVtToKP+3W+4mXNnja9
 mLSWn8HbSQmmqMXIltA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf6b65 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=FRBEkmYdsRQmicOyHakA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: XH2vgxuQszIxLyVnB82Wbqsw0G-0lkYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260059

On 10/11/26 6:51 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add initial support for MSM8952 SoC.
> 
> AI help is used for calculating qfprom nodes.
> 
> Downstream reference for port is [1] which is very lightly modified
> version of [2].

Generally this looks good, couple more comments

[...]

> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		ranges = <0 0 0 0xffffffff>;

this is equal to `ranges;`

[...]


> +		sdhc_1: mmc@7824900 {
> +			compatible = "qcom,msm8952-sdhci", "qcom,sdhci-msm-v4";
> +			reg = <0x07824900 0x500>, <0x07824000 0x800>, <0x7824e00 0x200>;
> +			reg-names = "hc", "core", "cqhci";

Please break up these into one-per-line (also for properties below)
the last reg entry needs a leading zero

(in general one-per-line is cool)

[...]


> +		usb: usb@78db000 {
> +			compatible = "qcom,ci-hdrc";
> +			reg = <0x078db000 0x200>,
> +			      <0x078db200 0x200>;
> +			interrupts-extended = <&mpm 58 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&mpm 49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
> +				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
> +			clock-names = "iface",
> +				      "core";
> +			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
> +			assigned-clock-rates = <80000000>;
> +			resets = <&gcc GCC_USB_HS_BCR>;
> +			reset-names = "core";
> +			hnp-disable;
> +			srp-disable;
> +			adp-disable;
> +			ahb-burst-config = <0>;
> +			dr_mode = "otg";

dr_mode = otg is default - you can drop it

[...]

> +			pll_opp_table_c1: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-499200000 {
> +					opp-hz = /bits/ 64 <499200000>;
> +				};
> +
> +				opp-806400000 {
> +					opp-hz = /bits/ 64 <806400000>;
> +				};
> +
> +				opp-960000000 {
> +					opp-hz = /bits/ 64 <960000000>;
> +				};
> +
> +				opp-1094400000 {
> +					opp-hz = /bits/ 64 <1094400000>;
> +				};
> +
> +				opp-1344000000 {
> +					opp-hz = /bits/ 64 <1344000000>;
> +				};
> +
> +				opp-1440000000 {
> +					opp-hz = /bits/ 64 <1440000000>;
> +				};
> +
> +				opp-1516800000 {
> +					opp-hz = /bits/ 64 <1516800000>;
> +				};
> +
> +				opp-1651200000 {
> +					opp-hz = /bits/ 64 <1651200000>;
> +				};

Drop the last entry for the same reasons you explained

[...]


> +		a53pll_cci: clock@b1d0000 {
> +			compatible = "qcom,msm8939-a53pll";

This needs a 8952-specific compatible (bindings-only fallback
is fine)

> +			reg = <0x0b1d0000 0x40>;
> +			clocks = <&xo_board>;
> +			clock-names = "xo";
> +			#clock-cells = <0>;
> +		};
> +
> +		apcs2: mailbox@b1d1000 {
> +			compatible = "qcom,msm8939-apcs-kpss-global", "syscon";

Likewise
> +			reg = <0x0b1d1000 0x1000>;
> +			clocks = <&a53pll_cci>,
> +				 <&gcc GPLL0_VOTE>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "pll",
> +				      "aux",
> +				      "ref";
> +			#clock-cells = <0>;
> +			#mbox-cells = <1>;
> +		};
> +
> +		adsp: remoteproc@c200000 {
> +			compatible = "qcom,msm8996-adsp-pil";

And likewise

also IMEM, DSI, RPMPD, RPMCC

[...]

> +	thermal-zones {
> +		aoss0-thermal {
> +			polling-delay-passive = <250>;

TSENS sensors are interrupt-driven so you don't need polling

AOSS is surely the wrong name - that hw didn't come until years
later than 8952 was released. I can't find a mapping of the
sensors for this SoC right now, so either drop these or give them
some generic names

[...]

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <19200000>;

Drop this property, it's only needed for very broken FWs

Konrad
