Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1FC4D9573
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061570; cv=none; b=h69AB7uEfvV2R5Km2deXm5NcggI+YVYePaHpAo5i0qFt8ZVvwkJWSVqHA3qz4M9N/aEyW2vJ/N/wL2aQ+dXBfLuvPglD/sPCzmX0Z86QNzYQ6D7U2rAN4ncq5ZzWLyJCtp2ifetpyZ8XYdkuHp3cO6aH0ZW1wbPoya9rpsISLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061570; c=relaxed/simple;
	bh=V3oyhwXKfw812Dqr+3MPsiWGU0k2Hu7Kue2S3of4B04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CM2/on7iucHox4w5mfehzmYazYmX3OwJ1wor1+DDTm+QYJXKbByESf0TvG3Bz5EF9qtzw/HniEZrRJhRx24GKEQmro0cziNspx3J09Nxzm58wnKc4fZt0gwJXnfomme6sD0UsvrhI8f3j9IEB2Bw3EGlMjm6w2pgUfImaEYosFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MONIT1zm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZD2eTT4v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MONIT1zm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZD2eTT4v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kEKr2999155
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3t8ijOMBQ8/8mEIpKRH/FLsGA1wBW/yQ8ybIxWS1bI=; b=MONIT1zmSzNjibRS
	QBi6i15vw/PSy+ZDyeZo1hZyyRrMwvuoU4ciOeBtbKU9Anwo5J2sSR1TZgafUT/Z
	Ivg9/vmslJTIyAGCr7QRjINzAtLgEEJh8jyQMpr94yjVZUYvCe4BZ3HpNDIMIDX3
	gEt3eV9yPWffgjfLaSy/fFak10oOvfXrLYk08ftw5B8yHnJq3zvt87MV2+yYDiw4
	9nyEgsx98kRDUjTlgloOBWdZjymfUCAu0uGOY3w0OmpTxVab97OnZ3+b65QsLWPS
	UTPIMdhboSVxaCToJfv9ugr+Ztp1Zd3dF6W3hZfNfQoV7rQCXwQVtTwEJH2wGFe4
	4t6wxg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0heu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8e16d22d8so29381295ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061562; x=1792666362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3t8ijOMBQ8/8mEIpKRH/FLsGA1wBW/yQ8ybIxWS1bI=;
        b=ZD2eTT4vtLzPQU/O0TXDg9O+HmL4fnTkDVciECuoAjduTyYN6vd15sYEtSW+0XO9De
         qiIESvX5+p9OcLblMuMcA3XqfqV++x3FXL3Ur6qwd2fG74q2/6MY+Ny2DWYdPq28zkaA
         iZs9Ober7mqFq/TnnF9FFeM3Uo4N21DKUZjpm1ndoYdAk9VwLxFDb6906C5J1j9c27Am
         BfEtJkTG+SsYhCapK0Fps3dmfr6SJsiZz9hqDpY7XRiR7x7w8DbTahEOSj0ISUnw1yRD
         aePeN93JBGZ1zlYGwav8auUvhqsyH0HRbCN3r0aNUMLZxbcleYTmyRZpIyUIwbceRftf
         N0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061562; x=1792666362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3t8ijOMBQ8/8mEIpKRH/FLsGA1wBW/yQ8ybIxWS1bI=;
        b=eyPFSerNXab6EE3o1G8OSffTOcNoE0/Jo1kAzyDfxETKAf6eqivHxWU4wcRvPaIvzk
         +5otIFVL2fbLprQX4Jo54AMOtCa/Yt1r4io6ltdas1Up0dPvIRNDLEkp18cVjc6kRqAt
         aAKC0y0/u3wifd4uKOOEducn9tGHK1XCR+Cbh+DSBC1Fafw+fgmcqANcdfdhNUPLDJF8
         t7YW4dsyurlpnukiejEJR4eo1tkqszRLhl2v49olPPy/xS1zfdD2poAyy1R3ZHeQbv6x
         hYBHpor+4G0CU5uBYGkT4ecwNlxQ5nJHd3EODGCaQW9nyoCXGI1fahJqeRPpg7RqArCo
         IXqg==
X-Forwarded-Encrypted: i=1; AKwUvBz0nqbXnJvCx3hATmSq9BnfELbo+gpl+CC50po1vF7ejoKY/xKYXrvNAS+HpbAPetNWzQrIUAdrGXbxDfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLp8PzRnJWN4oJGYONQ3LpOu+cyiGXzaSU07MsFxyN/Fy1R+fn
	lxSxTFN6hHLdDfe8OgJ8OqYTO5hKcKIrfct8SgI0A5Br3LAaOJ4naYVYWsuiidKAwuoo3a7Pk4t
	srJsC7xKBbeYxKBQce41cnKym0XYGM4W/Q9kJuqIHkXTN57rcpTmG72LtMumiRVmN9Ow=
X-Gm-Gg: AYBFou0ntf8L6hCfM+pT8WQe4p0XBBx0f+93BPO9oA4/YKSwcQNTbt4SCvZVPPqMm4i
	vxwuDHncpXlMePzFwOXXDUV8FjrELBETnfA/xaexCWDtCr9+xsT2bZxBeuxilyUZjkXF5cz2R+R
	QOkaFu0j5Mnx6pMhRpe60/XjoR5x3dwH7muXUfnqF0eY+G6s1heH/GamayHdKqK2gbRMlZm3sA1
	8LD8JezIXgNB6Mw0WERsthaoZFW2GfOsVKkYL5x7V7v6qARBzxBb7RXZkfpH7aztgINgb0EC13Q
	mdqytd/hOEKWq7EecsOBm84oMUbXaN3eHg0J55wAz1VE8ooGnNxNhjYAi99nLBdgw/rnMGdYfJK
	sPGPQ66NSBmIpRRmP7rR5XAwQqWC9SQ==
X-Received: by 2002:a17:903:32c5:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2e964b9ad6bmr11518935ad.15.1792061561741;
        Thu, 15 Oct 2026 03:52:41 -0700 (PDT)
X-Received: by 2002:a17:903:32c5:b0:2e9:64b9:a332 with SMTP id d9443c01a7336-2e964b9ad6bmr11518695ad.15.1792061561219;
        Thu, 15 Oct 2026 03:52:41 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:26 +0530
Subject: [PATCH v2 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY
 nodes for Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-1-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=9189;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=V3oyhwXKfw812Dqr+3MPsiWGU0k2Hu7Kue2S3of4B04=;
 b=a0hEQY7CW+SR2EDCnO4L42yvga9F1y8QYhKlWap1x9fbfaKSxgEJChbjqbkb2X7+6cNDWjs9k
 0lkEELbk4wJCdrurh2t03aYsMhTocuIYuiaIpHbofGSPlp3+3rfr9xS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: ZclaeBrclVgJPvAyCal9mDuSp1DqtT-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXzbckop3Kx7ZF
 NuQnepOyErmG9DL7qkV0nvp82mveIEnIXsVYzBg06o3xDC6C3hJ9Rozz9Bak9QQ3INoeQ/47qKN
 jqOzcm8OpbpgBKcmnVKzkMNwBdqEU9yAqyTuyyqy+jOKWtfLMx5wV0o6oOqMdZiUnO6kTTCKr0q
 gYgHCQ34pYeLJB3nXBWs1c8uU3J1Z0SD03kBk3Vl/GjiZMDJaigI6VVPMtKLHHP419WpVQt2Jcb
 HoBWjtgc/m5QcnPu+VQkF4sEPOz+iHWdRzXgscGWiAcZbmwh0hQX+1FSGQgoIHPDQ2BQKfZouew
 e3Fk5edm4kth/zNi95s36UAA5xp62dIdespDicEx8k8OibDaEpMlLUD8be2QSmZeczQEswnJZCa
 2JLcekiwU3JN7+NWJqACMXBMrADGEzLecfP/4NYkPkN/6Gq2qUAOYLomjxFtZqgA5koqVDm65LQ
 DerY6Nr8aBtU/4u9wzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX6qpCgqiqLSx+
 CSS1eLHcLzXKXyhCj9zA8nLIsWTNroT5e/tWU8Q7GrOrjrJ1NabRMUTkTphKrpienYSUqB6MPYx
 RSk2v+w6LF+okvxg/Hc+ycr09+LrUhU=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0b07a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=f8mt7GJev5yLzbN5ZcoA:9 a=RGW9HBh9GHUTZXVx:21
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ZclaeBrclVgJPvAyCal9mDuSp1DqtT-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Glymur shares the same IP as X1E80100, with three CSIPHYs that use
the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
on Glymur.

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 320 +++++++++++++++++++++++++++++++++++
 1 file changed, 320 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a99208584797eaca8196348c617619af..7609c15ba8a51b8c9b6e06a48410df1128316358 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -772,6 +772,50 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	csiphy_mxa_opp_table: opp-table-mxa {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+	};
+
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -5364,6 +5408,282 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,glymur-camss";
+
+			reg = <0x0 0x0acb6000 0x0 0x1000>,
+			      <0x0 0x0acb7000 0x0 0x2000>,
+			      <0x0 0x0acb9000 0x0 0x2000>,
+			      <0x0 0x0acbb000 0x0 0x2000>,
+			      <0x0 0x0acc6000 0x0 0x1000>,
+			      <0x0 0x0acca000 0x0 0x1000>,
+			      <0x0 0x0acf6000 0x0 0x1000>,
+			      <0x0 0x0acf7000 0x0 0x1000>,
+			      <0x0 0x0acf8000 0x0 0x1000>,
+			      <0x0 0x0ac62000 0x0 0xf000>,
+			      <0x0 0x0ac71000 0x0 0xf000>,
+			      <0x0 0x0acc7000 0x0 0x2000>,
+			      <0x0 0x0accb000 0x0 0x2000>;
+			reg-names = "csid_wrapper",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x20>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					camss_csiphy0_inep: endpoint {
+						remote-endpoint = <&csiphy0_out_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					camss_csiphy1_inep: endpoint {
+						remote-endpoint = <&csiphy1_out_ep>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					camss_csiphy4_inep: endpoint {
+						remote-endpoint = <&csiphy4_out_ep>;
+					};
+				};
+			};
+		};
+
+		csiphy0: phy@ace4000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy0_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy0_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy0_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy1: phy@ace6000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy1_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy1_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy1_inep>;
+					};
+				};
+			};
+		};
+
+		csiphy4: phy@acec000 {
+			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
+			reg = <0x0 0x0acec000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			operating-points-v2 = <&csiphy_mxa_opp_table>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					csiphy4_in_ep: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					csiphy4_out_ep: endpoint {
+						remote-endpoint = <&camss_csiphy4_inep>;
+					};
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,glymur-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
2.34.1

