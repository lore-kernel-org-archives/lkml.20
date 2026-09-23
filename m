Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D2349E12F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161494; cv=none; b=WW7PA453vCs7JP/qXpVPdUhz0AcRmNfY/JgVoirzhPTRowN0sCH/s02+eKcFiw/bAunRl5Y8rMm5sP82rnBww4WXSXIjsiL/OnTkx8nWi7Cm29Tm2DzXkuFYe8Ma9Wn4tud2j6MbK9mKCBQg00bD14vEvHLgsEdaNWWwAW4VHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161494; c=relaxed/simple;
	bh=7ftcPBQWyLmUt1kT/HukNXT4XOt6rrxs7ZPra+cV2CM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIAWxqnCxR/IEntRm/m8rc6AMjNiv1Njm5yCBIURh9Y+ZpLi4TufmtW592tPIZm3UIa+T8wcm7Kwo84anInfnvKcfFuR9qtHUE7eXf42KNeLD4b2InIxwpI/Lo6Ww2Ms9lSThvqHlhRVI1jsaT7CldOs8zE7Rwi2xkszDu8Q2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dg2tp11H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vp9M8ZCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dg2tp11H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vp9M8ZCm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2mXc3208868
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJ7jnSCiFkEbyzhyYpnR7+yTgEA1+m6lBLnQ1VjiBpo=; b=Dg2tp11HyBWApp+8
	lSyXpZ0GimsSLwLJuxFnzECjp0nGgEzdgCZAY++f1kOgAbjxsbY9LJHIFlShuRBn
	iBusDVzFHnMbobM9Ti8PxLSiyt/Nd0psSAYJnMhyUcMwOHX9K1zBEdohak6yDdO7
	BoCRC3k+MsaREBTsIa6M9qndquRxyxxbGY/XvIyfPSCeSoWCZSdi9GtXkpVfmLId
	iTkdGq1H/fbUw63UgDs3Bsf3epTLnDyHg0zfDfgMiumC0kcgyR3e18U75kggr5pv
	u7OI/Jf45bP7AAAuyXD9Wca5Of9P8KX7N6rfwwBMy/+mrHCvaAITbptX+OEMS/Tp
	ZoCH2g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1mvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso1360121eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161488; x=1790766288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJ7jnSCiFkEbyzhyYpnR7+yTgEA1+m6lBLnQ1VjiBpo=;
        b=Vp9M8ZCmChQjfVdDd5M6ek7p8Mu50+4kp9/WdriGIgx0HI282ZjUy4JYvBpbHULiov
         +M4MOJBw+rUHUo5+U4isAz5ZrNqrD+AsZ7FpCWVfQapPHZd93paKK/Yyr0haka6f6VpT
         yuo2TOjgBBY9oLbfk3azC498zb2M6MvXSDNsij7dsAjj94jMAOZw5YwUSbNywMLKtprx
         9/5Ad9kM+pTr0btygfVTuCRnTDoh2hjREXHbv5/actQ4wcOfdcSP9KuKvQdBiQmOyaxQ
         DWrUN2xlAR2Q1tuh+V2tkA1WAChMYhAdngQzJYL6YNGFNw++6NqTX3zH8KobEc78gBsL
         UBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161488; x=1790766288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJ7jnSCiFkEbyzhyYpnR7+yTgEA1+m6lBLnQ1VjiBpo=;
        b=Vy+FiCorCtcvBjGh1JzT5m+55SUHeyoaPpRbekhSktK3HSsLuSMlItmWS1RgLYBtvS
         dS/f5ZAGtEZ3sgA7vdhX7VrCTSS6RHvfTk7BOrcK1ckcS1R/jtYJ2tJlbxW6g3AUKVzh
         FQEuRQB96jJhv3758R3+abiBrKAarDaYX/pk+EW11cK1qm7UOaPnkk8TsKUeZ1Um1BlC
         0UFc1an0KvS7EB84r51LSOdqkopFT2kzuBmDFz2mro7liiLYFpQV+0ictfxbTqxBxG9y
         4R6wgqP7FnZ031uuHY7tNBG+Oh4ttmNM6JKfQPGcVN7Xq09C0owfS91aeMTKvOmS5Bit
         uCrw==
X-Forwarded-Encrypted: i=1; AKwUvBxix6WbxVGylGjSQwmbQyPH9UXk/1u4Nj7F1XWwgx2at3TkqfHBIywxV9u+lgvL4b+TT5WHzVyvUerDkUI=@vger.kernel.org
X-Gm-Message-State: AFuF++lRBglYbOGTkBTteFqalvaFtfOg36+hQ6PjyI184hzHEMcPf4HH
	3zRLRjyPbDxDOXSBu5x9wlY0DLFGL2ZkqcjlJZBnpiPcjMhb1C+7Ttt9BQtgRokFG3YBb1NYxmC
	JihbKvafXGmV9VWClvSUUW+mwf/GGSD8ea0Kq+5U2hrdu5uv080H9vAAyup7EupzKAc4=
X-Gm-Gg: AYBFou0WKYRUk7mSWWCePcsZJeB3UtSyXnvyb3BMLFfSVBvIgQsyFX3c4imCoRru4Rh
	UEqfTWSjhPgyTF2+dlWyCZsbyhsN93Byifu5aKTUldB2qk5ouzapymO/4mTD9y47jvXZIcFg6FR
	vHEa1IopV5oq4oO7/s3jLYQsyNKVbU5wNe+ABXJLW7gzuS2O+0r8UhSmBkhzb2hI4gtU50pIvFO
	D3LXKf8x9+rbUXtLAKlqSBeVCWfMUvKZ+0LglIUjCr6SGRUPew/SD9FX+2nnwK+0RR1VnVUVLq/
	15bOnsA8we1zW70R6dz2EFLcKykeDgwKVn23b+lzzYT/xxyM8sOpCmstg3vHCzIF9JQ8IbKvn2X
	9C8tCOhZDilSVewMu68ZPCNjfVQyVnA==
X-Received: by 2002:a05:7300:2698:b0:33c:719:f1aa with SMTP id 5a478bee46e88-33e8bb7bc1amr2146640eec.8.1790161487403;
        Wed, 23 Sep 2026 04:04:47 -0700 (PDT)
X-Received: by 2002:a05:7300:2698:b0:33c:719:f1aa with SMTP id 5a478bee46e88-33e8bb7bc1amr2146613eec.8.1790161486888;
        Wed, 23 Sep 2026 04:04:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:42 +0530
Subject: [PATCH RFC 11/15] arm64: dts: qcom: maili: Add support for
 cambistmclkcc and camcc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-11-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2702;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=RlaqkEE9fcNYhWmmYkzYFwHq+R7xYPPdglgLf2Owlko=;
 b=2CHIlULgI+BL0JS0hZLckJT9xt/I1HWI0Lqb5JYlQS+z0WbDVHE37trWq61FY58tvmx5ZElSM
 Bc9Jz1zK0G2B832VbRpnYp8SocmfTBEMGLGcBhJJjS8FBj2jo7/EXsR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX3rv18EPHubiP
 +I2P3xTDAueQJ3mhqPKiox1sIVU8lehedS4IEVpB3RzyftfWRPx937jgOpDJiDlRT8Y12v4fww2
 S7hAH8iRUSb8/IumMCNW49w0EwMx0wU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX/d+JGgiOrvdD
 8vt73hUFfqNT2oV6nRj72/Q0+rsw51rLtkELYywzifXsET9dB9FrCdVyD/lt+btIBoa0KU7a0xc
 w1dClEtMKpYHkZ4xmvcTxxkTaIdegvssEVaK/lVK8+bgEXdzrvdVGhgIuJKhOfXzQliEPPBKVs/
 xZ2nvRr6OhaazK2dfo5vJ2fwB1mUE3WT6oqgeP4D0JFj2RA2w4gLQhoEAyRRzA8uGdQGdzHFMfz
 u7EhFYk5kV7YLGxRFArhrjCitLAVBSe/Lj24eCO4+CROmaCDWHG1qhBGz0dLjeWTz0sBUjdzvhF
 +TIdTxMbi2QFLybx6qIxdvYJdnq4YQekSUN03xUV+FsVxGmbNjuYHtwMZ5rSX807FWyu7KBqAcY
 1/VUZUyW7OgN+xE86QOqDoNxOZSX/foEaY+vG3ujrjtN6QQkFCRyU40G3uniWLx4OWTr4QtG+DZ
 etq6+sa/o/g8sSDNNnw==
X-Proofpoint-ORIG-GUID: vWLDWk-qtsoYvMELF8DxLO3psDwmvXji
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3b250 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jTegW29I4pkgtfKLuLsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vWLDWk-qtsoYvMELF8DxLO3psDwmvXji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the device nodes for the cambistmclkcc and camcc on Qualcomm
Maili SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 886d307e536be6152906e344289d5b3fb290f0a4..fb404d6c3e92ed95ecd01782c389096fae402701 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -3,9 +3,11 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,hawi-camcc.h>
 #include <dt-bindings/clock/qcom,hawi-gcc.h>
 #include <dt-bindings/clock/qcom,hawi-gpucc.h>
 #include <dt-bindings/clock/qcom,hawi-tcsrcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,maili-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -2038,6 +2040,25 @@ pcie_anoc: interconnect@16c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,maili-cambistmclkcc",
+				     "qcom,kaanapali-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,maili-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5f800>;
@@ -4037,6 +4058,28 @@ lpass_ag_noc: interconnect@8f40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		camcc: clock-controller@956d000 {
+			compatible = "qcom,maili-camcc";
+			reg = <0x0 0x0956d000 0x0 0x80000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		usb: usb@a600000 {
 			compatible = "qcom,maili-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x0a600000 0x0 0xfc100>;

-- 
2.34.1

