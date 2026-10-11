Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7A54705F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791689126; cv=none; b=UCDoOme8FUEEeRbynPf7p1ztvcaAXP1viZSDoD2L9tP+I4XBkSXLm/kVImSRCt7H7iasV0nhoz5dYdk0nfNAlnJnHc+mYUUlWuClf2MkeSXHBxtdSqGQO9rr2GWrMDK/jwqB1uM739ZbQeeaBW611ZtNPh1dACUbwp8lYB0oXvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791689126; c=relaxed/simple;
	bh=FGRSLqWwJCmAsaZ57DgUjFFzqf8ez1EAmjqtO1uZ8b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyE3myX0aqHYBdQYcvw9cZJisF6wyX7S6uLKhOKAysZ4SAMJObZHPKvXUfmK9DCaxKvwQ5d9Xq8OT08a2MbCFDi6UdCekWWM9dIwOZscB6UXNXEPV3DVlI69G9sfDOZyuRTEn9wUY6Yl17VxV1K8fPMAPwS9ech986uK/1cRoP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MesY5mZI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMx/wTgQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MesY5mZI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMx/wTgQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1q2vb1366740
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ki8pPIk/6jBLuAEjzjkKNzgj
	IL2/HgZYij415q9mlfY=; b=MesY5mZIIzXmco6uzhlKDC4Z0qGdWV1oTgbr8Xh2
	8JmwVJRlMPut8ybRRXJ+mcaF3y7KvzMu9Ws8I/Sk+dvZZqvy9MwAaFgSWMzbPI9w
	rSJ2qF9YBEx97dGqe7VsWDYlQTuowq0JLmWg8AEznSwnCE5L4Y69eEwb6WzGd9ot
	1Qe2c3DkWgAi2I4GQUn8yI1/68ksZ5uhEjlOIXII3lrfuh1i+hG9RnTl4mqGfiW2
	Q6NH2OLO2iXH7cQaavPLyiitcj6K86OtVI6QPVh7tXw1eske/qH5Ev4obLo39JGX
	3nLdHXsO6AlK7mABTIAx+39V52lYY8t6j2iKIQBQ9OpUUg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9t3fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:25:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-358856e5105so4614892eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 20:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791689124; x=1792293924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ki8pPIk/6jBLuAEjzjkKNzgjIL2/HgZYij415q9mlfY=;
        b=hMx/wTgQW0UoJlqMcEqUdnHlNTQ0oal50ibRaa4OMwSR4zH/tmfDL0HeiGeVnapWyL
         R/rhbTaGfeJx+OAcmFQAm4QD+6BQkADcIffUyFygxnvaZiSt9wOI4GdwptXki+SDVTLD
         sIr0IY7+23+LoJk+e3fbmCnlL4E/h2G0iVJm2wzlYp7I7ImS5jAoRVDF9/80HD+5uQjG
         CmY17Ksdg4xdxyqv3CqP/httJazV7rJIBMI1mL4A/2y5ugexyo2tw45xRuNIVgFAVY98
         TI+c9ZvEF3bl+QywSV3qzBd7nxLnoMYST5EPrIS1vZrBLrRbraUdePMcIwXjfDPhma3o
         ypyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791689124; x=1792293924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ki8pPIk/6jBLuAEjzjkKNzgjIL2/HgZYij415q9mlfY=;
        b=18PJnzi+gL+kxH0bkJWHSfa6OLFGLJmhqha9+WBUIR41i13VaWWAfcr99qZ8+7iDaW
         2mqcQPdCx3as0czM/88/5iYEXhDwdw/DmNOfXkvOgbwFOUqWGRKspY+P7D0Ii0enveeI
         cGsiAQaHRsuVRHExunnzFUWXn5a3h0yNtP5CgY9Pd34M92Ik0rOIvWy90OjbKZ5GQco/
         otrKUOuX8tfoAM4sf7r9Wl+eDU2kiTKkRr3txahKAlokW8ImCyKRryfqfNwRs/7K0m12
         IKbjE/oP+KS95U96+wqEJLpZcyM8uULDTgnjl/6ySsRj9b8IqhSFGbedOxOaHYG3TEzW
         5Tow==
X-Forwarded-Encrypted: i=1; AKwUvBwlBxOwCj0Cex+b5qq7fnSvS59Mt6U2lW3KZ54t9ykuFMMw64pUIpmNgNbfBSgv6Z7pGy9K8s7bbuebYWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJM739MrMzi3IidsPo9o6TJ2uZGyJ+fvzgEiT9BA62zmzRsGTc
	dFd212u23H3aR9imPmB2iPojtDJ3Vor9oAOar74stPA1OKtFVKbgJP7jtHcXBJOTXlAmtNClrNk
	VVh7hhTIqQ/hAgowW2iFkv2wyVzm9gk8q6GFoIU3WlM/djBBOTJJFF3COZbS3FpcAMb8=
X-Gm-Gg: AYBFou3GHso76EOnFZvyFIj3KOYXz65zvI5EazYOCwtWe3lQEQRZihsxYA20foeA00p
	o0O4it6686ripTQ3Gcabb+wikI/4g5OzH+EYy6IsBaE04z9q6oLN1Gb4BWom5DsAGMxmQexpHkS
	xoaxarM7kZNLOIkYZkCaW+6gmktmM11/6Hdj6Uc1Yl3R7M+5sVeZKvi85QhgDsJc8szQVfRXEIY
	EJw5eSYJe3JoXmTJk6f7yhlEIZTVW/qDlJACKaGqeV25rl7eSN2nfmnRVB7cep02HzlfKfLVKM7
	yIHwYV3Jz6jt1eghzF3rVTmm7asRy5OhVSl3+kaNkRGOkJdtKyUIQn/GL4bEKMwxsDrW/meUxZJ
	DCjDpRDF1x9OAZzO27EMulWg+ESptZhgoByEmXl7NNw==
X-Received: by 2002:a05:7301:140b:b0:352:4f11:8118 with SMTP id 5a478bee46e88-3537e08c6camr8328652eec.40.1791689124005;
        Sat, 10 Oct 2026 20:25:24 -0700 (PDT)
X-Received: by 2002:a05:7301:140b:b0:352:4f11:8118 with SMTP id 5a478bee46e88-3537e08c6camr8328612eec.40.1791689123305;
        Sat, 10 Oct 2026 20:25:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm17840817eec.29.2026.10.10.20.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 20:25:23 -0700 (PDT)
Date: Sun, 11 Oct 2026 11:25:15 +0800
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
        Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU
 nodes
Message-ID: <assBm36Joq5pdULw@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acb01a4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BJWcozxxeopv1PEHIoIA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: t9J2Uw08Frz5p3FpTfKPXKj6FI79XbHE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAxMyBTYWx0ZWRfX3v8KjUcRqYqP
 mgEhXDH7L+Hq3gZmosuuNdvAyilaTSz+5NV2wNGbHFR6vzgbbvXQe/Kp0mNgN+Tyg2eGVtVy1hW
 GQtNdD9PcB5OIG3cD1Ni9pBfk/YASpgmEM7JquEzWsBN6urGCmuPnACNyvMLinulj0oWDvL05Of
 Fm0EtuBsN191at9uty+xA95jk/i2n5sH2r6GFacj9LOTTo4m7r3Xq2QG79rUGT4puN6wvI8sG4v
 QSmNMJ17nGJ8HBxQlt2bqlNv7OTPDk1y2y7RTrQvD0CY2nMStRAVEHA0o6W/Mv9lXkUDM5PeCj/
 rAgRK2MI2xGqVVO7gIkc2YpnmCn3xj7w9vupUM8olYuU0aubv5asLNC3ngy2UqdlA9ZRzVe07Pp
 z/GD49GZN9EVFAvhWTdtto/PfN7Ein9ibkBlO6JciaqPT8jxOU8fGrq6Md7/hDW2JtsVS65/GWQ
 ynU9LVPrH+w/D8D76zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAxMyBTYWx0ZWRfX9POIXINxSIsV
 f49Mvn1ctpTEYpIbTeab7nl48scw+ZD/QxxJzxL2aXd/k2OKqcUf+dk9aYlL/0sQz7CUJ+ZySXn
 r/bc/XchvFd9LfwSHXTa26+5cy3ZYpI=
X-Proofpoint-ORIG-GUID: t9J2Uw08Frz5p3FpTfKPXKj6FI79XbHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110013

On Fri, Oct 09, 2026 at 02:36:37AM +0530, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
> the A7xx Gen3 family, along with its Graphics Management Unit (GMU).
> 
> Add the GPU and GMU nodes together with their OPP tables. The GPU sits
> behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
> clocked and powered from GPUCC.
> 
> Unlike previous Adreno SoCs, where the GMU AXI clock comes from the
> single global clock controller, Nord splits its GCC into four blocks
> (GCC, SE_GCC, NE_GCC and NW_GCC). The GPU's AXI clock,
> NW_GCC_HSCNOC_GPU_AXI_CLK, is provided by NW_GCC, so the GMU node
> references nwgcc directly.
> 
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 116 ++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..4379092b7bf8 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -776,6 +776,122 @@ hscnoc: interconnect@2000000 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	gpu_0: gpu@3d00000 {
> +		compatible = "qcom,adreno-43051701", "qcom,adreno";
> +		reg = <0x0 0x03d00000 0x0 0x40000>,
> +		      <0x0 0x03d9e000 0x0 0x2000>,
> +		      <0x0 0x03d61000 0x0 0x800>;
> +		reg-names = "kgsl_3d0_reg_memory",
> +			    "cx_mem",
> +			    "cx_dbgc";

nord-embedded.dtsi is created to accommodate Nord Embedded (Non-GearVM)
variant specific resources like clocks, resets, power dmains,
interconects, PHYs, etc. The common resources like reg, interrupts,
iommus, etc, should go to nord.dts. Please follow the existing device
examples to do the split.

Shawn

> +
> +		interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		iommus = <&adreno_smmu_0 0 0x0>,
> +			 <&adreno_smmu_0 1 0x0>;
> +
> +		operating-points-v2 = <&gpu_opp_table_0>;
> +
> +		qcom,gmu = <&gmu_0>;
> +		#cooling-cells = <2>;
> +
> +		interconnects = <&hscnoc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +		interconnect-names = "gfx-mem";
> +
> +		status = "disabled";
> +
> +		gpu_0_zap_shader: zap-shader {
> +			memory-region = <&gpu_microcode_mem>;
> +		};
> +
> +		gpu_opp_table_0: opp-table {
> +			compatible = "operating-points-v2-adreno",
> +				     "operating-points-v2";
> +
> +			opp-468000000 {
> +				opp-hz = /bits/ 64 <468000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				opp-peak-kBps = <781250>;
> +			};
> +
> +			opp-625000000 {
> +				opp-hz = /bits/ 64 <625000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +				opp-peak-kBps = <6075000>;
> +			};
> +
> +			opp-735000000 {
> +				opp-hz = /bits/ 64 <735000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +				opp-peak-kBps = <8175000>;
> +			};
> +
> +			opp-854000000 {
> +				opp-hz = /bits/ 64 <854000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +				opp-peak-kBps = <10687500>;
> +			};
> +
> +			opp-1000000000 {
> +				opp-hz = /bits/ 64 <1000000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +				opp-peak-kBps = <12450000>;
> +			};
> +		};
> +	};
> +
> +	gmu_0: gmu@3d6a000 {
> +		compatible = "qcom,adreno-gmu-753.1", "qcom,adreno-gmu";
> +		reg = <0x0 0x03d6a000 0x0 0x35000>,
> +		      <0x0 0x03d50000 0x0 0x10000>,
> +		      <0x0 0x0b2a0000 0x0 0x10000>;
> +		reg-names = "gmu",
> +			    "rscc",
> +			    "gmu_pdc";
> +
> +		interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "hfi",
> +				  "gmu";
> +
> +		clocks = <&gpucc GPU_CC_AHB_CLK>,
> +			 <&gpucc GPU_CC_CX_GMU_CLK>,
> +			 <&gpucc GPU_CC_CXO_CLK>,
> +			 <&nwgcc NW_GCC_HSCNOC_GPU_AXI_CLK>,
> +			 <&gpucc GPU_CC_MEMNOC_GFX_CLK>,
> +			 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
> +		clock-names = "ahb",
> +			      "gmu",
> +			      "cxo",
> +			      "axi",
> +			      "memnoc",
> +			      "hub";
> +
> +		power-domains = <&gpucc GPU_CC_CX_GDSC>,
> +				<&gpucc GPU_CC_GX_GDSC>;
> +		power-domain-names = "cx",
> +				     "gx";
> +
> +		iommus = <&adreno_smmu_0 5 0x0>;
> +
> +		operating-points-v2 = <&gmu_opp_table_0>;
> +
> +		gmu_opp_table_0: opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-416666000 {
> +				opp-hz = /bits/ 64 <416666000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +			};
> +
> +			opp-625000000 {
> +				opp-hz = /bits/ 64 <625000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +			};
> +		};
> +	};
> +
>  	gpucc: clock-controller@3d90000 {
>  		compatible = "qcom,nord-gpucc";
>  		reg = <0x0 0x03d90000 0x0 0x9800>;
> 
> -- 
> 2.55.0
> 
> 
