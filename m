Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7798C374192
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608982; cv=none; b=qmDWD6QC/PUtKcWBf1CsuMJlEpAU/Q+LRUi9ZJdSboNXoL00PUWDvRiajGUlZxNDXFUJFmOpV97RcEgy8xzmWhfVAK7J8NNsefwUvLpaMZdWC8YQuyyL2G+GVmCKQqlgTI3MLOY275K2xlhikR86FR1ItZDA4i6fIzpx21rie5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608982; c=relaxed/simple;
	bh=Pdol2tENq3d5JTmtTgUTfzoLOto6wrDnP+qqylNShQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8rnqFD0GlPAU+lQo79w4kH+370pekhwVbgRLnb6NI3B75VFOEp1yXJQbd5aULoPPVsFg2oAWES4vm24/pWATogrFipyiLNc8ebg6F/oTpWvSaGczN7ZPNpP2eUEiMuSBmqdeWgJbpuxtAlMZDaeYIj6V2fUXrHEvJhtThXhCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIVUo31v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvrspZS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIVUo31v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvrspZS9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0pqe63897368
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3DU5cPahpn7psp7SjqFFTO7
	I4tqeebDWCAKEo8WiDs=; b=NIVUo31vaSU3r5pkg/JBp8KuLWVqFvUjsSv3h+EB
	3DWFFlKb7WY9iDHHqQ2kD070fenGN7oNJYpqL7kpmCdo0O90xEbhIp9hn/1cviQo
	excxG0ZR2GEQc0/2TXpl8gt7kEBMH6hNvAcadX0E5AdYpbcKKdiJq6amd+SWfwR7
	mNVxB+hCTsTU6HDS8mgopdyahWV321p5+AR5rzPB0+BhGfpmektrg1VnS+P4Qkg6
	w0sZoznkUhG1QjngKbhH2Vj9gQlckaV3CEhvBh9jWRnrpyl6xlrLqgR3DLCLN3uF
	FPbE8Ts71VfK9QAN+FRgQPO2y/wnuv3uOk3YJxRkSs3IkQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6asrbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:36:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso432049a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789608978; x=1790213778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B3DU5cPahpn7psp7SjqFFTO7I4tqeebDWCAKEo8WiDs=;
        b=MvrspZS9tFBERwkc9V44HBCGJHXPuWSWdpSbNsyYPG9aSa6twtyyvJ9Tk0vOHbe/dj
         SpcK+6YFMBcoycmmPDjSo1geKSZNHJd9MquOVYbxopwTzrd3PrQ+u0pcvKSeCpGmKibn
         GPAeMUTdxOkrARiX1oqtzHCV94DaYRfEokonQchTHfDbVMHmfScjkKOG/qByHlbjHAt0
         bRir0QzLJNOQ9wSkJoCAbx4NnQ4u3FYKK7lxYG8u5QS76Q8VoyfNP12a0yFgRgGIZOS+
         In+5tm6KlntlEiXUfzlHp0zI1lL5LJRLeK3WGMNmM1++ccxhfys1S2tGOnzTJVtFLpoJ
         LAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608978; x=1790213778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3DU5cPahpn7psp7SjqFFTO7I4tqeebDWCAKEo8WiDs=;
        b=2TQifpAASw2gCfoqIkMdCshrQMLM/kbXcXnaD6rNmtFbuOuKcJmEo5kcaSxDlJqTys
         yHL3Y00GZg8SRK2qEWUsPrCWP/JBOaHrkAx5dlU8wnOHJGhUddIE6Jn57tFMz/80uuSB
         gBqCDU4IrYqETaduR0e4JGfweSb7E86OPuZRQQdQ6Qhw/ag/GOQsfti8t0xi5l1KJSOA
         3lTm8vkzIl97+y/cqhCQ6ih5CwEeSFy2SaIYDzhdtp6onZDL6/ArHMchCu0hdprODsCe
         1N5P6B0S0+bGkhga1+3tBB7AjDhM+sB4Hxykh8MppsNus9BG4EO8DjXLNWeOTw8oKXux
         LWwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzf2u57i81Ee+0u7IkBkF/ax/9n9jY+dT/IeFLL2V6+HyENo50aaK7Dh0BB7TP1oGP9VCuATNmKZmTXoLM=@vger.kernel.org
X-Gm-Message-State: AFuF++mFvMDwVQqlUn/3xc2lJxz97fcKNoJgQyhrmHnCU256ajNcWEl4
	zfClH01SOmbZWLMyx7ovSFuHIr95cpvp+BbUPo7z/H3dLENclYIQx96VidBG4RIGjZBR8hQQ/Ri
	WRcyZC7UCcPp+sR/BON41f32jAa3VEP1xIy0Z0Wpcag6PICuaKQXZ0sJXm7Pq9SbVI8Q=
X-Gm-Gg: AYBFou0YQEwPlXGnHjpfEk8JbBsLbGCZOrVuAtsAipQWkbeex8adTYoLsZcsp6127+E
	go6NWMIP+1LvIB0EK/fX2c0EJgcXscT7jKLiRXVQnLUsIeVsUX4gPZS6RbuPZmVFuF3L/9Jht24
	nOlkBqrqcsERAJu1+543medJPavUdo4tGu5I7r0EAIrA9WFuBqGgAzdtpybiL2sGxYyTkTEco7Y
	8b/fBAMXadc7olBmIEModGaqucNWbU80ZibFfGacUyzlNithfSw+NSAeJQV8/SiCJgaIHYaaZJ4
	iqasl53+SOlZSwS4e3De4tmxKo1L7Fn6iqAZXsVLH/H/I7nRlWtOxfHiWfFFxhF8qODx+3cfM7I
	qwdqnkl5kIoxsohDlvQBMKLSnVTB7TX0BsyLV0b5JSkk=
X-Received: by 2002:a05:6a20:cfa2:b0:3dd:57bf:7242 with SMTP id adf61e73a8af0-3dd5f456c26mr12096648637.8.1789608978073;
        Wed, 16 Sep 2026 18:36:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa2:b0:3dd:57bf:7242 with SMTP id adf61e73a8af0-3dd5f456c26mr12096582637.8.1789608977646;
        Wed, 16 Sep 2026 18:36:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb05e604sm9699019eec.12.2026.09.16.18.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:36:17 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:36:08 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
Message-ID: <aqtECDwHPiUUZqTB@QCOM-aGQu4IUr3Y>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-GUID: La2EAv5t6q045Cl6MvDDY_4VGfSSKbqK
X-Proofpoint-ORIG-GUID: La2EAv5t6q045Cl6MvDDY_4VGfSSKbqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAxOSBTYWx0ZWRfX1DynC0VlVMww
 KPGRJmd3VbhNMcg1w9llNcNrqpmvuG00b5bpspud4puKxR5v7NXA/KjGTDbIZBzr7as4pJ788ul
 7pXXKMz8zzraOmsMgM9B254eT/LvQMdXJ/5vIdNCef1zrU8lbfzExVoMAFUJqHqNLW/YNZKyq/D
 tA2F+bKYjaMrXfM6BZLgNJuRnlmLG8hSGKknNG6qxIllsQz3+2Aw3Ku25uhbVoSrE9Ol8D0f8Hj
 tKtHNGBvaAiEm7zNzK9aqq3mdulCFtxcPYN1ujcFyL1iNajfobbBbgGYQY4rJZr4jk9ootyYHmt
 3hAi1JTSSr8DMahybVbwbfGE4jSggw6YobQTRayDXf/MQgG8QWTJbLa0gQvgcJ8WhUx6s1ut205
 Z92greudbsWxvj1peanV77OMJRgkEjgETd0ShdrIOI2EY/3QrNlS2Q8fL/KyvVuxSVIMPzb1OF9
 COWAfXfWYCs2UfQ2esQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAxOSBTYWx0ZWRfX50RTrJIHBMNs
 YOPaN5GU6TKjFQ7v24gdX0UcrzLb8WPSserLmoggG815xLv4V/pesuKHvtvFPccmlqLvBp4Uykv
 nyHgn5LSd5BBsI8vWVyRirfTuVoMXGE=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab4413 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=-8PEYfhsPDB8XfM_kOAA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170019

On Fri, Sep 11, 2026 at 09:06:34PM +0530, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the binding for the display subsystem (MDSS) found on the Qualcomm
> Nord SoC. Nord is MDSS 12.1, DP-only (no DSI), with two independent DP
> controllers.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,nord-mdss.yaml       | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> new file mode 100644
> index 000000000000..0b0cacdca9db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,nord-mdss.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,nord-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord display subsystem (MDSS)
> +
> +maintainers:
> +  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
> +
> +description:
> +  Nord display subsystem consists of MDSS (display controller), DPU 1499A
> +  (display processing unit), and display interface controllers (DP only, no DSI).
> +  This is MDSS 12.1, DP-only, with 2 independent DP controllers.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,nord-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display AHB
> +      - description: Display hf AXI
> +      - description: Display core
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1

The DTS in downstream repository doesn't seem to agree. There is two
items for iommus.

> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path from mdp0 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,nord-dp-phy
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,dispcc-nord.h>

Please run dt_binding_check against mainline kernel where the header is
actually qcom,nord-dispcc.h.

Shawn

> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    display-subsystem@ae00000 {
> +        compatible = "qcom,nord-mdss";
> +        reg = <0x0ae00000 0x1000>;
> +        reg-names = "mdss";
> +        power-domains = <&dispcc_gdsc>;
> +        clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISPCC_MDSS_MDP_CLK>;
> +        clock-names = "iface", "bus", "core";
> +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        iommus = <&apps_smmu 0x800 0x420>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +    };
> 
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
