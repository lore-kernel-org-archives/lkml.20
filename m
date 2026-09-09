Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428F49550A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942681; cv=none; b=aNx0PW9aOqoHVIcumfm6PQJZVxgAjtgUOQKOT76deqloRs0QHYWOtpnTZGQCGGWaByTegDEzZ+U2j4ULOc5P2Qz+RHBzdSrDqWG1OHi+EuWbiEwiowXKuWs1NH1OQTj5AiLuKx28M19uWDsxTe7jEJbKlM2557kWJxmOBeWasEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942681; c=relaxed/simple;
	bh=rZ8DjkKmBHedyIDcWayVpq5SOsoVmYxXX7VB04WSCkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQwCQi4CagHoOPWXozAv1VMeIgmVHHL/XSZKl+c96WTEBJGi+t0WMSZI/1iPYW0vGv/b0RqUocYxalB91L2CBBivDqfwBHujJIMKi6sA9J6JpN5tf1L0gG7NC7ufg5vF/U0r1NVMWZRoXcpoos1qO39CANFzfzhK9NcgWdHqNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pn0CP8Vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VarJKn49; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pn0CP8Vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VarJKn49"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896UdLb336590
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bg/eHNRfWD3uscd40GV8QRig
	po/JtPPXEdYD1Se/H7Y=; b=pn0CP8Vi19ezKuIiBkVokjSghRGhDI8D4h5CtbQT
	zMkTS5BVsNjt2oyJ+PtZsMb9zJu88Lxj+KK0p6Q6uCVYmASChhOn/7Ch8n16iIoQ
	1DOw0f1C+3oh3JrZ1pYU3bud3zj+wCQO1L2/FpiP4kveuJhLuWzgh3rnp2AzEQlE
	BRNQfOVnWVkjw4eGfReXUMzdzF3jB9Z0VOgzWHu3hRtTzuI35cpjyYNi+hob4LN9
	qst7tzAkJcYtjge4E0Sr60uxgNFWY7kivi8Dd71zSCgDdwgr67xLwwIm+GYNl2Na
	XtPrB9m6kYQ+Wqfc9JdeiggBVPq/bIHPE0uIsct+sKnTCw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7jy68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:31:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso4887217a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942676; x=1789547476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bg/eHNRfWD3uscd40GV8QRigpo/JtPPXEdYD1Se/H7Y=;
        b=VarJKn49yLWvlpeYk5lP1QtpfsNogouhS2Dfinyj5UOyjfXZgHo/8vQLAygunuB817
         lXLlPET7x0wzkoymWHYHhrSFhK9T/GWov1Vci6IwydBXXBQPSP2lyPfeLxspBlhngjeN
         h6VIMQFhUKpt2ieXT9uuq6QX55vtNovjIEbIEB/W/P1H87Jl4BhtWDiMFr9qfH1bzAJI
         y6qSHTIvcs+fD+b1nL7jeR36nxpkiRqCtMVpzo7Fv9IpSt6SpcyZndQb8ss8zhqc86cw
         Q8PA7tj99Of04IV72gpoqGTCj8hNl8di6tu4ViQLH5+C3njW3OTuFZM0qIlIyVBQNoXW
         ZitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942676; x=1789547476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bg/eHNRfWD3uscd40GV8QRigpo/JtPPXEdYD1Se/H7Y=;
        b=NwnW4PWhgeGeFGfZl05PiS/Rb6zSilv213OimlZNEe/t5lmT7afBmWsmPJDUWGOJMk
         k8YUp7MROZ1/IZwp2qGH+hSQ/0K9+H4vzHnzZkfxbJCbrDlklxi8MgjXWLJ0iTwSQabe
         UzsTvcpe5F36H1GO1QGRwAJSAVRmIft13CgJyWjfh2p+sYIzXihBfAADsSPxc80J7MFr
         T6pnlnvBUbyLHd+rFBm+qrzrWVcCn3SEFqG1Nl2bGc2sAO2kT9xtR8NCpZm4M8yyI9G8
         Eb5H31z5jPuUXh0sNDod2MuvPrC8RD6FAKrBsR3Yh2I2QBKjAzaUTNUDw2bG3fdjrAh7
         6ZrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcHguUuncUUVx4sNAfuwg8PPQuJQnQSDYskLqZSZ8oOhnr2QLosxj7Sn5jKw28nJyTxSyY40lIcPetIR8=@vger.kernel.org
X-Gm-Message-State: AFuF++lajQHt4UvA1hPnIVVcyKWE2jR/mAIDOO1KhbhsGnwm+AQ8FWl3
	9iiql+rK00Bn2guFyPoEpd6O1ziDPlKoMrlKdYU8If3Pybd9m2MKq/+1QeytXVRIbYFgVZs6rdq
	jnvahYrLSGq5wkr+285uNlHYGO1xO+kL98Ed542r34xQK25e5xr6bM3IpqpvYFUoekpc=
X-Gm-Gg: AYBFou2iGnR9StmK9iTseZDeQQimVPeRkqNeRFLWTFjcH0qWxpLyEM1YX7eSID97oxY
	jtOpX+Yp6Ae9+46vUgnpqSGG2a9wJfBoAsWhrdJWZlczx1XtvkDVSiyaudaixvc8cD4RI099yaT
	kMTKQSkvAgYOUcz/5L4Bu7eyqGe6eS5O5mpne5uZ468OPEDudaAwVbwXiwAcpjCK6uYzDEKdPAH
	GMMt4YQKi78sZ+kh/YAwMGB+HWAZuhPGfsgXgBS6PbNaicfVks0U7nXNO+bUzlH7aQ4PXMTYRxn
	7FBjMKJ3OU7rE5+RUWK5CjGczYxpGldVdMCO7vZTEgAC/eqSwsE3KeWkpCccrIs39D75KQRrk1z
	j+JuFE4mtmKwF6t51mstLSif0NTKLIAQkGb3KrRop57o=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr50788806a91.16.1788942675537;
        Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr50788731a91.16.1788942675042;
        Wed, 09 Sep 2026 01:31:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm39776875eec.18.2026.09.09.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:14 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:31:08 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <aqEZTDMtVaGR8F6o@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX6GplkUA+4o8w
 ZoAnuQQfrgdAO+pwo92w5TV1U7FLcCJH9pyuH2doC4YdtfV8KGq+RfFzv2yFL3vm6nc4iuBlk0Z
 4DPqnI4r/zLVmWSDmpTuycjFqZAfsvU=
X-Proofpoint-ORIG-GUID: rFZOwb9Vr0LNDEKwDRySePaUN8va1KzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX4v35SIZUaZY6
 RaH/NdoeANB56dzp7vOVOZpMIyiMacZFxXdL0l5q5hqVU5jkBTRD/bGP9xPmw4gwCuHou70/QJf
 cTd6OG06ZF+2hwnpy+QNlVxnQQqxsEvYClqmbT8LFT/GFeRTuW7qkGsEYMctIRCJ9LjRSH/p/cx
 fpgyYL8WTtbt3vsc72vLYcBaW7UYi5SjC6SSNXZOYxH9zIJ4RqhlOXEmhbCDRQ+WRgqh3BwYaxs
 2ZjkSi/szTeHL08eP6vWOPdT2xbApWpZBpkEd+q1/rDWPT3QME9bD1KjC/oBUYU0+j9ss+MAoZc
 3L4Qv3FjcNvlMH2lwbowlIWW+QmBX432DAzpzC4Q3z7WHF61Xovg5LnqYZaeHQttJB+L3nGKTJi
 PEtnlFRNo31DS5NapbsDzIGER8hD/cnYtFld39Yt7ZGT+oFYmNdQfUVWivaPxMHvWMbIewCGzL+
 MoEWTtKtVwYX3mchrwg==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa11954 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=FJ8gEVljA5m4mNThiM4A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: rFZOwb9Vr0LNDEKwDRySePaUN8va1KzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

On Mon, Sep 07, 2026 at 01:56:14PM +0530, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..fbaaad1f3db3ff67589d6201ed0e25710c044614
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

" |" can be dropped?

> +  Qualcomm dprx clock control module provides the clocks, resets and power
> +  domains on Nord.

I'm not sure it provides power domains, as the driver registers no GDSCs
and the binding has no #power-domain-cells.

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
> 
