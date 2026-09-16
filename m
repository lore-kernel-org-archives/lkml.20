Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913B049B20C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549912; cv=none; b=RgbXpNACnZcpDsNUR53dAawALSKYQAB69VJXhcUUxkzq/yXN07J2M+K+WlMKh2x7UdIEXLrgbpHYb3TvQlIhMJG5oGZnWidKbgCcoDr0q6sMNaLsXW7cKhQN+P9E9+d4KbaTZhzlWu9MSBO97ffeZi92ecFhtyIyBUAKTXZ1wzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549912; c=relaxed/simple;
	bh=Uzwi8xSvwV+st3vrdPsDXqrOcV6mG0RIQvYAVhIyWFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGWBg0SnOJEmstY2LkUEI/Rb9v+4+I2vtnE1JlLt7beWFiT7oO0MYpusmkS6eJbI6SZpeS5oJEaP4pFPjLgY9KDYoRb9P8Twtt5pRmHcwsLHiAan4g8R7OiQzaaAzvSPCN73aOwIcYpyk9ZZvocr+BiiLqxMqexnEujlufe6/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZDhXaTY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SP2N5Zlb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZDhXaTY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SP2N5Zlb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92ndT2122466
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OERyCDnzsffYggoKraDEa+SD+q9V0o2YI4UapHIR2AM=; b=NZDhXaTY+2WmVpOv
	kNS4YziDBedEz1uqhF5qTPCORoT3sjAKUzNdaRKSYWVuvgECZ9vyjnwbqv16bBPw
	mcgjY7/c8wvxwpkxmKkOwiVZ4S9LAkTxPybnvvq9EIOWxYQeKp7PfFt8CXsXue60
	s/wNg6XInmloQXBcHOE6Gnzewlub6mACt6ckQtNCGShPE0wOAUppcJjyGUh7YiYG
	Ntj9sHE1eVIJ6HiMhUj8Pqj8NrdPtm/0lTDP29r3TQ97jIGSGxQbLK1erRB0Ggkv
	fyVzjsHHxDNN6doIoVJtOe6yPS43OOewk5PiXO1ZsCy3st6ms1Qj8lpu1NV8X66W
	u7DnXA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7h6hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:11:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46dade0d7cdso5610934fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549891; x=1790154691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OERyCDnzsffYggoKraDEa+SD+q9V0o2YI4UapHIR2AM=;
        b=SP2N5ZlbbO4UYeG9ZlVfwzDD45BPi0VlNRhDn6ZaciDMpeeIuKMbha7Bb/Kbh+0zbT
         Fgz6nSU1ivXqoMmH+IZSQwkMmW0TOrSrkedk2ukzQ4g8Kh920n6RkXM5fO6TI4upQ2bi
         9uYwBetFeTd7mvsInYzmLu7OZ82D479aoFu8YzPtOxuc1cCAHoZp7PunqA3IijLu95zm
         +hxW6+sZ17dkpy2vL1YB7Mtq21sHzrsGX9FucEOdTWXWkv5N2mrf8DJHvJpx/YFcoeMJ
         WohxjAziT3y70NwikaUizFLEQlNB/R+68jogz5QB0xBMCRys9RoKNQYlBDD5YG++b5cq
         kgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549891; x=1790154691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OERyCDnzsffYggoKraDEa+SD+q9V0o2YI4UapHIR2AM=;
        b=CUHLi7P9yKpo37zLcB4I+a2ZEcTLJXU2YO9NM23ey5MdORCFUY6fSSWru+WFlIuzNg
         hIzfCbrqd+a1sWWJ0xeyCcv3ES6HV/w7bhahte/+8AFhOIw2sbWFojRrZdqehmp7QqUc
         /09t7n/Y4zT7bAR/Dw8qfAQizDcO15bAbI1f6qnaghKHqLC01X+TfvvZHxWK01zciQ1N
         vmLTpXJ8xmi1gO0Ujdxq+oO/aQlpXKNuB/XuPvFcr+oR5MHFLwbgIPRCn4prB0W3BUp5
         Z6xjYi7MzTcyepiGWzqL5g20kNDABEzec4N9Ii+TE7mLdDKqs7YOkSyPOydJKoJA2s27
         gAlQ==
X-Forwarded-Encrypted: i=1; AKwUvByNqJ3UEavmR77rx65WXv2kXP0rZAP65kDQTkLqgwlfUwPhGOGf2ACEaJ00ZLvwcnjgEV76/AH4wcUG4x8=@vger.kernel.org
X-Gm-Message-State: AFuF++l7s8bQT82zyDRLPJsZcsiKrwdc+DnYpWvIR/r7mUVYobmQlB6N
	SFWPU42rTnvQU7BWaNIyCv4GiEbWKenpJMRUgxqin7DNx8PWlADqfidKxoGlSySPnje/8nGmk5C
	XYJnKjpFDuTVcx8De7CTxCDzwlPwdqZLn3DBf7C04gwWz2g4OYYuc6qMHE3nyB0bUZrA=
X-Gm-Gg: AYBFou1R4zpc+ShqWSc1xWJOj6K8SappPDkDXktTqAJWOozDrWMbwsEWKa439fyfQt8
	Agv2nkAavX0M4SKzQqbjx9/UrlXnJgjxnvHMZSNWba7Isi+rGrYYSYmHx/+4RhjriVQE+LwI3g+
	Ns8gdz8eXRUJOpiwMBmTqY8ojjLgYvorzyBza5dC75TRD43eeMZxmNJ+hP/nQVvURSnsj/8hXGv
	9enXB0LG8H6pJNtEibw2oo5iiiqDWnD7GP2ITvxpXIkez08cV0sUCdvVF6Km//zFmyv+v++9q5j
	okg3EJM8AA0KlowU3t608UWFZsh6LNLtTzxXSpmq1I9sHQ7Tqe5pxSkjRiPGtCAqL50V6HMOeLG
	D4RqHkjkrtijjkkYT/ceb5G2fo2c=
X-Received: by 2002:a05:6820:f08:b0:6c1:ff2e:7f03 with SMTP id 006d021491bc7-6c7d04f2b1bmr1902544eaf.9.1789549890644;
        Wed, 16 Sep 2026 02:11:30 -0700 (PDT)
X-Received: by 2002:a05:6820:f08:b0:6c1:ff2e:7f03 with SMTP id 006d021491bc7-6c7d04f2b1bmr1902517eaf.9.1789549890234;
        Wed, 16 Sep 2026 02:11:30 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:18 +0530
Subject: [PATCH v4 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-1-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
In-Reply-To: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=6897;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Uzwi8xSvwV+st3vrdPsDXqrOcV6mG0RIQvYAVhIyWFQ=;
 b=TKf5xn9NJDnRh80/g3PrwhLU/YJl+tC0Elk4X35HagrM8R+/x7o7lgovTrLmcu1sDh/iOnayn
 bMxrqwICdNqBfKhJIEpFihPQFnU/J2pNy+iWzSWat7dSng6jOhGXi/G
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: EtEB5e5EQVzOFjIQWv7svAWeAIHxgBzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXybn7u39oEjI4
 ZISRCyOZYHHvaNssqU97Hf/Csuvvi7JPJ+9Qy8SlbEtXOXV+5nobJgpk2+32ywSpca/vl/OCMNF
 xcS8xRTpOIg3GR4rx4p0sbUZfjTpdrTrs6lzFeEXaLhTVXOfXZwlvEevpJ09dNJoiR9rmhybxJS
 MIcrrKC0ck1MpInWL5oCxEApoxz8yIKTFwXRDgf2E9qByI7lxZwqauh9uUxtMd2axNaXmI6cq2m
 Qj19pT2F/tlQLKR/ID+k/Rd3u50H17x05rEERVY+smyWFXY25FnUBbeqK1TbYACk+DFoBDZMygc
 w81XuUtXOez2pwP3m23M+ScY0l57KUR85CCWrGLDHURYsyxmDhzytMi2GwmSVV5ndIF4xX9qW6v
 5qJQJ7TPTIyxkPT4WwF6ZNuRkIs+vRhiam1wx+veQx/d0kAYnGnidULH7AInZJZz9S52e8HcgBU
 RgzNvYpC+GrN9l5szqw==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa5d43 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ETLJq0YgDw9Z7rpyrqwA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX/bNBsFMDqJKP
 TFNU285ttNkvEdlXXDHitJPV3uPmvicSg5tSHnQItvOT+gzFk0iHN6+8fw+Bti6zbFHglvAWLLJ
 Hxt8D8UX+F22lGqnIu7A74I19dfLosk=
X-Proofpoint-GUID: EtEB5e5EQVzOFjIQWv7svAWeAIHxgBzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

Add the SoC-level display subsystem nodes for Qualcomm Shikra:
MDSS wrapper,DPU display controller, DSI host controller, and
14nm DSI PHY.

Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
compatible strings are used as the primary match with QCM2290 fallbacks
to reuse the existing driver support.

The dispcc clock inputs for the DSI byte and pixel PLLs are wired
from mdss_dsi0_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 206 ++++++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..9375a8be46aa 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
@@ -2281,6 +2282,207 @@ adreno_smmu: iommu@59a0000 {
 			power-domains = <&gpucc GPU_CX_GDSC>;
 		};
 
+		mdss: display-subsystem@5e00000 {
+			compatible = "qcom,shikra-mdss", "qcom,qcm2290-mdss";
+			reg = <0x0 0x05e00000 0x0 0x1000>;
+			reg-names = "mdss";
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core";
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x420 0x2>;
+			interconnects = <&mmrt_virt MASTER_MDP_PORT0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &config_noc SLAVE_DISPLAY_CFG RPM_ALWAYS_TAG>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@5e01000 {
+				compatible = "qcom,shikra-dpu", "qcom,qcm2290-dpu";
+				reg = <0x0 0x05e01000 0x0 0x8f000>,
+				      <0x0 0x05eb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "core",
+					      "lut",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-384000000 {
+						opp-hz = /bits/ 64 <384000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@5e94000 {
+				compatible = "qcom,shikra-dsi-ctrl",
+					     "qcom,qcm2290-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x05e94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@5e94400 {
+				compatible = "qcom,dsi-phy-14nm-2290";
+				reg = <0x0 0x05e94400 0x0 0x100>,
+				      <0x0 0x05e94500 0x0 0x300>,
+				      <0x0 0x05e94800 0x0 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref";
+
+				power-domains = <&rpmpd RPMPD_VDDMX>;
+				required-opps = <&rpmpd_opp_nom>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;
@@ -2288,8 +2490,8 @@ dispcc: clock-controller@5f00000 {
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>;
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",

-- 
2.34.1

