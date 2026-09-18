Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF269392C20;
	Fri, 18 Sep 2026 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727790; cv=none; b=GXr/qx3f396uoO/2wYrdddYAOMGAid15yhq7PHt/FW9UgUfvxSBVHUmLQhRvYnOujpyx30pgxSVKIMUJ70j4pKTyOPxLTsaLgRNAVy8t0V+N007RCwUBVAZnJZRhDXpD9wUpHL4hfgP14qXQ4Kk85AGMPhubirDOMMfl+GWCeGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727790; c=relaxed/simple;
	bh=/8WEpo3d4AcgkEBxVKIi0o0Ap9Q3DpoSy7HzDY0TFQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFIGfKFQKMrlN4QGbsYFxyLg8bYJFeJo0l3/LaOWua5jBILmUIMXK2QcWyzN/0P9Gu3ibtQJBHgBdpqQX6qXDZbcLIrQ6COTF58wJW/ih+5MJKYniIP/KMddxVcIPPa3Y6WfysOoWBgZw7bF2bTjuEWT4RDxOin1En8WXhWoYqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWrdrw5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWrdrw5T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eEDf522593;
	Fri, 18 Sep 2026 10:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+oxgIEFTuOpH+D6l8e+3PeG5Bj/epAOC4oHLEGkuCk=; b=fWrdrw5TcQMufaxv
	FOzW4C8PMJginacfSOLWULF4kRLnaZkUeshuC+lQoNNrqi/WImRO7lJ5ZRYma7cT
	wvlQ6PJtJipIUvr16SIBunDIE1jhvIpxn1UJ96BjEytjOxUkVfKe1aVHeTF+O4NP
	Ab0rLOaI3pn6C/NpaKtGuCT6UqUNq1yxE9nVaHGbykOMIDrWWMVcGX900miHaPuE
	ouZcAguSKeR3rnnoT+cypbUPcRii2wTBp5iRUsjzTZAsOj55On1bw4FfJQGXo06D
	Ec5Fsy8e084gCcLO7QOzETxbfQMK7HxaWvf0hfQtokhGRoslqXZcbHVfbMKV2ytG
	3blz3Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebg4b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 10:36:24 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IAaMR13805373;
	Fri, 18 Sep 2026 10:36:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68IAaL2M3805366
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 10:36:21 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id C040FB22; Fri, 18 Sep 2026 16:06:20 +0530 (+0530)
Date: Fri, 18 Sep 2026 16:06:20 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add Talos Lyra EVK SoM platform
Message-ID: <20260918103620.xqlsj52vugb5pyv5@hu-kotarake-hyd.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-2-e3a76dc9e21c@oss.qualcomm.com>
 <apmH0PSegmgOBqo6@baldur>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apmH0PSegmgOBqo6@baldur>
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: H9j9JsX-bujRCqlekSWo3pOBZbCnlO6d
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad1428 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=nfRGER2owpr_vNGksMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H9j9JsX-bujRCqlekSWo3pOBZbCnlO6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0NyBTYWx0ZWRfX7yqn6vTqqaNY
 rtrV16cMjE+VMTvYeZTFdmHluiWQmqx+OnEj8P2OQnHf8XbfpGR2ug7oJ29oTweonNOPgALyJK3
 oM3EyAWNGrLXHKDLCdlFoHcQGMsUvMWGm+fxbLHFXQAS8StJrLTz34iYnt3MVvCio1J4Y1K3odB
 SrXhKdNONA8jiYN3i3NaAznJ2igKMbGRLYURPOnFSlCdMRus3t/FkEtdypVRi/4rigEmrBqyM5A
 DD2hP+6CvEDwElijKLFYaSemW4uJJHzrsGJRc9PKmQYy3JHPJifCD0vNuZUhBdLNkhd7HiHoHZH
 BUlwpE63SN1S8GNY4ne0HNfc+3H0FrbAR5NqI8sS39ZDDn5SA/whTvdjO5JgfkZhnjUY0U0T9SC
 pl+sYmvKXz+qyJNW9wU75hvgp3dSYkEtOZf2D5DbhKPYc3rDo0z8Gy8bVqufE7CfLzl5PN36DsY
 I5Nso1kPHYkMBMO1LjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0NyBTYWx0ZWRfX++bAz5H7bw6C
 3MByupqSAjFExN3YXS+eSAq7yKeDYPGtPR7/msFBnf4XoRsEMT+4eLzN4hqTE3929YsRtkZ94bS
 4QCTVeMQIs8xmFYikbos9UQYETMh4lw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180147

On Thu, Sep 03, 2026 at 09:54:36AM -0500, Bjorn Andersson wrote:
> On Tue, Sep 01, 2026 at 07:14:02PM +0530, Avaneesh Kumar Dwivedi wrote:
> 
> Please make subject prefix arm64: dts: qcom: talos: ... so that it
> groups nicely in a git log --oneline.
> 
> > Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
> > Lyra EVK SoM a compact compute module integrating the QCS615 SoC,
> > PMIC, and essential connectivity, designed to mount on carrier boards.
> > 
> > The initial SoM device tree includes basic support for:
> > 
> > - CPU and memory
> > - PMIC and board-level regulators
> > - UFS and SD card storage
> > - QUPv3 (I2C/SPI/UART) instances
> > - ADSP/CDSP remoteprocs
> > - GPU
> > 
> > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > Co-developed-by: Sayali Lokhande <sayalil@qti.qualcomm.com>
> > Signed-off-by: Sayali Lokhande <sayalil@qti.qualcomm.com>
> > Signed-off-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> > Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> This s-o-b chain says Monish, Rakesh, Sayali, and Nirmesh first wrote
> the patch, but the way you sent it claims you authored it. Retain
> Nirmesh as author or fix the chain.
> 
> > ---
> >  arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 282 +++++++++++++++++++++++
> >  1 file changed, 282 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> > new file mode 100644
> > index 000000000000..8c19f050d5b3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
> > @@ -0,0 +1,282 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +#include "talos.dtsi"
> > +#include "pm8150.dtsi"
> > +/ {
> > +	aliases {
> > +		mmc0 = &sdhc_1;
> > +		mmc1 = &sdhc_2;
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	clocks {
> > +		sleep_clk: sleep-clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <32764>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		xo_board_clk: xo-board-clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <38400000>;
> > +			#clock-cells = <0>;
> > +		};
> > +	};
> > +};
> > +
> > +&apps_rsc {
> > +	regulators-0 {
> > +		compatible = "qcom,pm8150-rpmh-regulators";
> > +		qcom,pmic-id = "a";
> > +
> > +		vreg_s3a: smps3 {
> 
> I don't see anything referencing s3a, s5a, and s6a, are you sure that
> rpmh doesn't handle the SMPSs for us automatically?
> 
> Do we actually want to vote for s4a from Linux?
>

We’ll remove these unused rails in the next patch set.

> > +			regulator-name = "vreg_s3a";
> > +			regulator-min-microvolt = <600000>;
> > +			regulator-max-microvolt = <650000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s4a: smps4 {
> > +			regulator-name = "vreg_s4a";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1829000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s5a: smps5 {
> > +			regulator-name = "vreg_s5a";
> > +			regulator-min-microvolt = <1896000>;
> > +			regulator-max-microvolt = <2040000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s6a: smps6 {
> > +			regulator-name = "vreg_s6a";
> > +			regulator-min-microvolt = <1304000>;
> > +			regulator-max-microvolt = <1404000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l1a: ldo1 {
> > +			regulator-name = "vreg_l1a";
> > +			regulator-min-microvolt = <488000>;
> > +			regulator-max-microvolt = <852000>;
> 
> That's a wide span, narrow it to what the consumers need.

we will fix's min and max in the next patch set.

> 
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> 
> Are you sure you want to go LPM here?
 
we’ll keep HPM as the initial mode in the next patch set.

regards
Rakesh Kota
> 
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l2a: ldo2 {
> > +			regulator-name = "vreg_l2a";
> > +			regulator-min-microvolt = <1650000>;
> > +			regulator-max-microvolt = <3100000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l3a: ldo3 {
> > +			regulator-name = "vreg_l3a";
> > +			regulator-min-microvolt = <1000000>;
> > +			regulator-max-microvolt = <1248000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l5a: ldo5 {
> > +			regulator-name = "vreg_l5a";
> > +			regulator-min-microvolt = <875000>;
> > +			regulator-max-microvolt = <975000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l7a: ldo7 {
> > +			regulator-name = "vreg_l7a";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1900000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l8a: ldo8 {
> > +			regulator-name = "vreg_l8a";
> > +			regulator-min-microvolt = <1150000>;
> > +			regulator-max-microvolt = <1350000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l10a: ldo10 {
> > +			regulator-name = "vreg_l10a";
> > +			regulator-min-microvolt = <2950000>;
> > +			regulator-max-microvolt = <3312000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l11a: ldo11 {
> > +			regulator-name = "vreg_l11a";
> > +			regulator-min-microvolt = <1232000>;
> > +			regulator-max-microvolt = <1260000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l12a: ldo12 {
> > +			regulator-name = "vreg_l12a";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1890000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l13a: ldo13 {
> > +			regulator-name = "vreg_l13a";
> > +			regulator-min-microvolt = <3000000>;
> > +			regulator-max-microvolt = <3230000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l15a: ldo15 {
> > +			regulator-name = "vreg_l15a";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1904000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l16a: ldo16 {
> > +			regulator-name = "vreg_l16a";
> > +			regulator-min-microvolt = <3000000>;
> > +			regulator-max-microvolt = <3312000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l17a: ldo17 {
> > +			regulator-name = "vreg_l17a";
> > +			regulator-min-microvolt = <2950000>;
> > +			regulator-max-microvolt = <3312000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +	};
> > +};
> > +
> > +&gcc {
> > +	clocks = <&rpmhcc RPMH_CXO_CLK>,
> > +		 <&rpmhcc RPMH_CXO_CLK_A>,
> > +		 <&sleep_clk>;
> 
> I'm failing to see how that differs from that talos.dtsi already says.
> 
> That said, this list is incomplete and needs to be corrected - can be
> done separately.
> 
> > +};
> > +
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> > +&gpu_zap_shader {
> > +	firmware-name = "qcom/qcs615/a612_zap.mbn";
> > +};
> > +
> > +&qupv3_id_0 {
> > +	status = "okay";
> > +};
> > +
> > +&qupv3_id_1 {
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/qcs615/adsp.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	firmware-name = "qcom/qcs615/cdsp.mbn";
> > +
> > +	status = "okay";
> > +};
> > +
> > +&rpmhcc {
> > +	clocks = <&xo_board_clk>;
> 
> That's what it says in talos.dtsi already. I must be misunderstanding
> something?
> 
> > +};
> > +
> > +&sdhc_1 {
> > +	pinctrl-0 = <&sdc1_state_on>;
> > +	pinctrl-1 = <&sdc1_state_off>;
> > +	pinctrl-names = "default", "sleep";
> > +	bus-width = <8>;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	mmc-hs400-1_8v;
> > +	mmc-hs400-enhanced-strobe;
> > +	vmmc-supply = <&vreg_l17a>;
> > +	vqmmc-supply = <&vreg_s4a>;
> > +	non-removable;
> > +	no-sd;
> > +	no-sdio;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&sdhc_2 {
> > +	pinctrl-0 = <&sdc2_state_on>;
> > +	pinctrl-1 = <&sdc2_state_off>;
> > +	pinctrl-names = "default", "sleep";
> > +	bus-width = <4>;
> > +	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> > +	vmmc-supply = <&vreg_l10a>;
> > +	vqmmc-supply = <&vreg_s4a>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > +
> > +&ufs_mem_hc {
> > +	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
> > +	vcc-supply = <&vreg_l17a>;
> > +	vcc-max-microamp = <600000>;
> > +	vccq2-supply = <&vreg_s4a>;
> > +	vccq2-max-microamp = <600000>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&ufs_mem_phy {
> > +	vdda-phy-supply = <&vreg_l5a>;
> > +	vdda-pll-supply = <&vreg_l12a>;
> > +
> > +	status = "okay";
> > +};
> > 
> > -- 
> > 2.34.1
> > 
