Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB5440A08
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240179; cv=none; b=qKdYf1WRT1U1+Pit5ZMGtXfouR4+wSHepkq4jGn/1FO9JymKMHMraAKgvii1V2JkWCKBCrSznlT6Bslmhli0aEaN0tCtSs4lm+VzEDIxPHeHQczGhyb2OU24GiyRMCoiH3WrOXJFodanjycoxxNAcL3wpK8/KkFv4F+UAnPOgHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240179; c=relaxed/simple;
	bh=Nup17ENEmXpV9ZwGGRFtcICN35ExK3wjqeYVDJVYpJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5ibq4GwpCMdzbYU8E5gaJI7tKUdU2kJ283P2xQ0AN/qRXrN0p/co+JUrhtiT8VWzISok7s6LtT3IgFrVgwbZmOQ2UfpmLjSlgbmdNtDSvYxGRW3gjxz4o6ptk3OD9Vwp7WypMTVwgATtbFuoRbs/GAzb4DPrgO1/Sb3alcirJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTX7ktsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+Y6g8Kj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTX7ktsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+Y6g8Kj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e6NI1531617
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bxt3q8Jtf9Fw4kHeMbUugrOi
	qJ2FR8QUG1VRmITBYC4=; b=XTX7ktslLowmfmnbQRFjDshYze/T8wCX9Z3ayS9n
	RM8AmilfvLS5mKnFr9QdowjTr1baO3y2sZJhPlJ0G0V6twHbapqcTqvHWHgvroDl
	gnRqAvTzQmzxrrkGxboPeRvV24jiEP/YMpcVOmDcgFwkxv7MgXPQ+8cNvXewdJSB
	g3xHyUUSIcTf283P0a3njGUtZ3zeBgQcYyG0lWGAMoenEKKxlIloWA8lXNPdbliO
	RFfvh3f2RfyRUp8NwUS15x3o0uhwvlAqjFnUxv0PLTh57TlFXXvZkRPQR55gw/oD
	lwjJw5i6AQ76aZmnxLYHbhz2IB0kCCscPCEywrGdWDtjYQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgskcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:56:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3738376c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240174; x=1790844974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bxt3q8Jtf9Fw4kHeMbUugrOiqJ2FR8QUG1VRmITBYC4=;
        b=e+Y6g8KjlXDyC4VC3i84Vzxq4QUFlbSN5Xr2b3ZE3nTyWuS5gOkCfllzcv9ihGX9VH
         Q0UPQxR6F8+pw1bHKGyxD4UDD9k2uzCDwgsbWt/y6MI8o4F/F6XDes36QGXG4kZ3+pti
         kutcPP6e7terVWH/P8br2ziFKwqPRlt0Ys8OFUL9jdc0YH+dhTcZ28Ast3tUJUeGiS21
         6F4jr+CblJKrpc4FanmHRzo/Ob9cPkwxlJpaiNyI7sI+uuYhifIYB0fJb4/IpzqFX0kP
         5F74F7Ei8Y8Kf3CPihFtiTATYuUN4UJEH2wdGwJqnDIq1bImhbWmpvl14ShjVM/zw2Cp
         mT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240174; x=1790844974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bxt3q8Jtf9Fw4kHeMbUugrOiqJ2FR8QUG1VRmITBYC4=;
        b=1NbZ/12GBwl5MBoBnYb849nUFt+wKVJAhoT6FuwOJmsqztAUWxc1Wra6jjkYfuCwgs
         9C8iu8mbo6e0IEyCEc9g03Plr0ozBPsZ2wLH4IbxwDwHYo0VQHJsXACfNDhGaFn/BmYO
         1zp/KTyO8WIWf6Mvk2WheTU4T9V+4wdAkeb4PwDTF6dMIHqzdGbeC0bXO05yfbt35+lL
         3OdBMYrP9JF5muXue+1zj9N86rKVQ1ckuszIWWFfRn4jsxxdVORHVAH3bZ6IdU48tyuy
         Zzs+hGFVpd7TWnbO1vdyQ36ZlTAncUV/mWF2PPwzs474PAiPAXglQXEeAkjLYss69LvW
         xmIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcb3fmZJ73szqX6d58hU7kTmUwV4MxAUPecIDCCQ+GftfAw9wS4DFE4UDRbsf6zABIAXOKk3n7tQlu2YU=@vger.kernel.org
X-Gm-Message-State: AFuF++kKcHTjAgwVESQLcY95q5Bx4K5jBvQkCD+BypbMz7t8ZNiLtZik
	V9Z0SvryuiwrWyIoGqZmTkqxHi+dThDdF49JG+l4Bpw7PFJXnzw/Txzb6OWjIBTQKVyaaMmdUAL
	Bqg0swIfvNfIy8MvBl+vNyqjwh9ZA6Blm0upw3CzGVBIOp03+LGA7EpPKAws45zdhYI8=
X-Gm-Gg: AYBFou3MdaobTy16PUu5j0zEep/U3AEwmt8ql8ag+9YEp1oLaUqQO4JNlzDKbm9cHw9
	nC8twVKeXHvOE9x+r4p/x/9V9/y1WwdfBqGS17r8ACVtPdtJqcapaiUv5M4Kw//GWUsY73G+5Lr
	ckiLJ4q1Dnw3g8zxUvANbDa409wEc4n/phkNH0lc86zeIt7Oy8zKTWqzydMAbwsmbCA3hkS20ku
	cN1gKat7yJEhOxCwyOanLKFyaeVX2Z+bPgIGlrp4G2F+lUZPVUXKXw4xozn19AW5RwOaBwAWoq+
	k0P+q2KihimzfWFQjQcpwquihSmEIbDw2jKeZlnzw8/OFLrgtt6fic2FVz05pni0EfnoH7Rx+fm
	GOl9hqAQ678lkzoFvmPbkhp8sJ+1C97nVSSX3bzk04Q==
X-Received: by 2002:a05:701b:418e:20b0:143:298e:913b with SMTP id a92af1059eb24-145040d3ecamr1278181c88.45.1790240173723;
        Thu, 24 Sep 2026 01:56:13 -0700 (PDT)
X-Received: by 2002:a05:701b:418e:20b0:143:298e:913b with SMTP id a92af1059eb24-145040d3ecamr1278165c88.45.1790240173132;
        Thu, 24 Sep 2026 01:56:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm19986937c88.13.2026.09.24.01.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:56:12 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:56:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <arTlpnQCjyXk2clV@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-2-fa4364e087ef@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4e5ae cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=cg-lLse-URA5QQXuI28A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: KPeP04kumNK1_5MsqksRFSfxSEn0kxQw
X-Proofpoint-GUID: KPeP04kumNK1_5MsqksRFSfxSEn0kxQw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX/BdvS/Z4R9AG
 /5eYzdWuonItCk+4U4kWrZEsIph3bkXuJI8y1HOFdMvcR1hD9W1kiE8/JZlKwA8UOep46WNYlPJ
 56HnAZDimSv2Z23/jUgJ4nR0FvgHIBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX6DbZY8v7gHVy
 6DfHz2mgu/nb8OfXTt1rgO/+OUSxO5C3XkbiFdW+XUP7gV4StoneyuueDHdReeljUOSoNEtNsbG
 MnAg3EvUVISqhxushTOoz3m7SfH4tEswll0U0e+XatiHYvUi6FaPeCy5qmipfABCj9+vPHqNQ1X
 8oazJWMofHSWW7n7vZRq+okMoPv5imEhv26tjlhvLAA6mXesjpqJURe9XDcL3iRMUlobBw8CSjL
 Gam3bg0KXhA9r4xrn3OpxWqEj36SyrxwfnCbTeC12sNbaO40iYx6SALCajFZDe+71JcmWl0ehKP
 NNA7KJYEuPgbFhsRpRU2I18tu1Lm/oUVU1CMj3PcK+mAZpxZT4a5e2D5p63NXnZ+FXPOLd4JRXF
 xQbErxySTKXwJNM5dtThG6H2ToUp12/5w+vyPC8Yk2X6tYnWExkSyoc8Kfk7mYJp1fzQo1VT5mW
 GblpaPIL6CzU6K0vzYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240037

On Thu, Sep 24, 2026 at 12:51:32AM +0530, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX)
> Clock Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3553e0eecd5027155b4dca5c0596e3140641aa9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DPRX Clock & Reset Controller on Nord
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |

We agreed to drop " |", didn't we?

> +  Qualcomm dprx clock control module provides the clocks, and resets
> +  domains on Nord.

You fixed it partially by dropping "power" but keeping "domains".

Shawn

> +
> +  See also:
> +    include/dt-bindings/clock/qcom,nord-dprxcc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,nord-dprxcc0
> +      - qcom,nord-dprxcc1
> +
> +  clocks:
> +    items:
> +      - description: XO clock source
> +      - description: DPRX CFG AHB clock from NWGCC
> +      - description: Sleep clock source
> +
> +  power-domains:
> +    description:
> +      MMCX power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      MMCX performance point.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - power-domains
> +  - required-opps
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    clock-controller@a940000 {
> +      compatible = "qcom,nord-dprxcc0";
> +      reg = <0x0a940000 0xc000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
> +               <&sleep_clk>;
> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
> +      required-opps = <&rpmhpd_opp_low_svs>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
> +#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
> +
> +/* DPRX_CC clocks */
> +#define DPRX_CC_AHB_CLK					0
> +#define DPRX_CC_AUD_CLK					1
> +#define DPRX_CC_AUDIO_CLK_SRC				2
> +#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
> +#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
> +#define DPRX_CC_CORE_RCG0_CLK_SRC			5
> +#define DPRX_CC_CORE_RCG2_CLK_SRC			6
> +#define DPRX_CC_CORE_RCG3_CLK_SRC			7
> +#define DPRX_CC_MDP_MEM_CLK				8
> +#define DPRX_CC_MMCX_XO_CLK				9
> +#define DPRX_CC_PLL0					10
> +#define DPRX_CC_PLL1					11
> +#define DPRX_CC_VID_MEM_CLK				12
> +
> +/* DPRX_CC resets */
> +#define DPRX_CC_DPRX_BLK_BCR				0
> +
> +#endif
> 
> -- 
> 2.34.1
> 
