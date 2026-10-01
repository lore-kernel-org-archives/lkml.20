Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12249279DCC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862167; cv=none; b=RYUGpHeW1vP6rHptsFvMN/qhaCuikhpozlCHuRJuQxBvtmCvgmzaie7Mz0qgjI5Yx/j3WVwXI394GKD97wvPNMy14JLsn8+OlHjWAmQxWcA+sW77WjGM96C9WsOPrhzDmXl+pquD6u4BPScv5jMQCMvH55lM2W0XfPuUXCMa8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862167; c=relaxed/simple;
	bh=C/fpMGINKsMmABBVFoNhv/IhMHRGM5vtAbgsZlLdGIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNACuvDB1wznBnVg0XI9UuEwK+xadanm+LCR/yZzNSip2lWiRMPVQLdyPv5pmyrK+Ddb4Wq0yL5sSYACh+pIy9+LLQH7ndpcNg5B7hepS1WSpeRU+Q0wrizqsmIwzubkS/i7gwOnvXnwTO7xWxceIJ8WCmTnzSEBvtduvjewF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArZDygJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eyjhr8f+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArZDygJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eyjhr8f+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CqJ9N1933080
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 13:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=; b=ArZDygJMZD3ZyY6z
	Z+M7W7S4VCZOnWDWuKuKBNXRPUdlfZHh0ofzf22O2WZTspbutqOjmEGsTki2OYeO
	KT8Jhlm2aAiQiYDNCRI1jQH3i1l9VYDaBKsJHOhZtA3vCpBNbyG1OSq+S7u2mBob
	mlhHV/dGWXJmhs1HisL4MSM9fJCogwuxWB340BbttpxmMxij7VhGUM/MXpQ6+29b
	MymhgUvnJRqsYdRimjFnW99PCwDCMCP0edzumDg0p+OCpGMGk3lgmfY0HwXHh8ka
	yYuSSJTn6VBXrs4mcGKQi8b9uVpLPZvZ+ooH5XRY1X6UBn0ZsyRFxIPW5H2/tic9
	Fc4tJQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfssqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:42:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d84114044so4752558eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862153; x=1791466953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=;
        b=Eyjhr8f+8rEkzUvRQGus4ocbAeT54j8yFRO1m9+M1qyo6VhcspHi/grcxBRSIPim9C
         PutmqvYZfoAQTgnYTRMawLtWppSwMNgPSW3QG4CgV9TuZAjYXrzcUilWRabakuf11sY4
         UIeba/BUzuajh8H8sZfIs8DQgNOqCMqJvvQ0sG4KNXH9zdpRAejvVV/BJdQPtMVunGvJ
         JhFLxt/XdtfYl4ZLQPeM2qCqKLQ/4Rh9CwAMsiwt2Cka/R/7yLrek+sZcBrcJtbqjvhc
         3r5Es5H+VPRocE6+GR9OG/KnL5+whHmw/IQg4oKPscSgMzw2tBYd3GLSSikYmuzNJbZz
         On3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862153; x=1791466953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=;
        b=BItzPz7dGo5VTDy1Gs6HPibNUR5y2fB8lHPLtEwCbqndhq2TfHOmXd0IwVGcbUrT+4
         YIcPSXe843L5vzpsMdfY6qNyDKU95UmAuhtFWWO8E16wmKHq7yD+B1Zt+/OCTfnjgF1U
         hJ2BHphOZg/3XxFuVemUTxco1Hjzo4mEee1GLY0IyEaxNJ6DDAsfaYqQpeF3d24XLZwK
         HTrG8cHAIDhKQiFlPC/ohaHoGuR7a9DaZBkJh7SexQHOCnabsa7GUHiHF99xVegDM13W
         pf3FUt7RFcOLFw+xFCeKAkcBlq2eRvsaruEBAw3fhZMW3X4nbxJ9ZaSoMwZH6Gz/5uP5
         nY2A==
X-Forwarded-Encrypted: i=1; AKwUvByyMzxZYdZF0jkK/i7p+E0LHU+XLgM4exu2w5E1GLi+xuYXQhr2ejhb1Tj12GDkNOes2oyKJKviFwjcP4o=@vger.kernel.org
X-Gm-Message-State: AFuF++nrHGjMYiaudYDN94lkT2OhhCydhNog0AVF6Y8XQ+UfWVrh1OwU
	3f628bvsl1rg6c0JKsJZwxaD+jNueNIHhG6vHNwuHmLJlEuoquqfrRUobxZazpxggvFqJEc0WJ/
	LrjdUqvX0JFCPf1zNxMVPPN5sc6PBAUVNiyHOrFAQYRKjtlTggPPGqIZ9+WTuk49N1e4=
X-Gm-Gg: AYBFou2w5HFz2jBF6Wkkbf0S6qaD1OIZ5mFRr7ZHNsz51uznXRCelDaiOGOQBC+xrsq
	QZ18pg5JPQq9myaKpRN5QMh6FvfNewcxmvh6xO66CQGdTV7S9Di1lEBzn7yoWsyjd1DJ5PW2IJ1
	5NkroOJpc9xS1ilDsqFWjTbLioglP/RPkGMfTF9P8fAJk1MidQYJi02jt3Qx3JtprOpsTf1CwTv
	EM4OWDoiMzQzf3ZIwcUVqUXYs4tVOAL4YahZYDAfL5hOYFX9GKAtH9o/iI7PUB/zQDu3h0hSx5z
	cZG4EFJzsh+9g7VvKFfC/NI3ZpDfA2H3CPJue1BSjku5wgGHZznbz0HWZQwbghtk00XD+cCOTg6
	j7rVizuVSssUM2kOsvY1Y+n/WiU0W89YjZFY=
X-Received: by 2002:a05:7022:e1b:b0:14e:906f:9c8e with SMTP id a92af1059eb24-14e906f9dc4mr1998955c88.20.1790862149986;
        Thu, 01 Oct 2026 06:42:29 -0700 (PDT)
X-Received: by 2002:a05:7022:e1b:b0:14e:906f:9c8e with SMTP id a92af1059eb24-14e906f9dc4mr1998727c88.20.1790862148313;
        Thu, 01 Oct 2026 06:42:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df34a8385sm6668906c88.6.2026.10.01.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:42:27 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 19:11:56 +0530
Subject: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790862135; l=2930;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=C/fpMGINKsMmABBVFoNhv/IhMHRGM5vtAbgsZlLdGIQ=;
 b=CyX2cswe9Cdx3+85nooxB7wSD0ZYpHclUz/RiPzctuUdj6WVUiXnpJaLHbKBZxoctaJqAmO+m
 L5x/PXtJ4uxCUiPpl/yb5rtxuHy1vpPP/pYi1l24BvDo72oxiRdiamz
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfXyotc7LOefWDQ
 3NKv1aHM6vFCnjejHQdZzy8SmcpgGbgXlkGkE1WKbV0rlPqbQMmX9dPjVLHspey1TbbxmMrdK7t
 l9eOEqeAuhOWlTMjHAtLIywUCBUBA3Y=
X-Proofpoint-GUID: iWApkfERQb-o-UijkUDyJXgVNKQ9RSDd
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe6349 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ri4dh-MVe8xHpjP2HccA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: iWApkfERQb-o-UijkUDyJXgVNKQ9RSDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfXxZBpDC1Oc5Vl
 tNn9fExTIJTICFzBELQs90XRbEvQGfjC0raFwfWCyKe0Eg8+v07/iNUrU35sXOq9vp3YpEFcMrF
 gpFbn3yW9KkxYp0OR1Y1liRJA7KnoVFUhsA7nfhyFfdYi9RRe5aktP2Z1D6ghdzQNtYsl7ICC41
 2eA28ftoijInfJnbFsQRC46XXX2/ut6RvNj099QdPHrjl1l/LBAp0ryMWoLIiu7KAXLxBCAKYmO
 cgK8ESUGpr8rs+CY376jiu/Eu1X3s2AiVFb4kr0bB3SYmJKU3itXWSiUcEWRIa9ZyplFGnWS8Ot
 VRStxeQDh99t0vuYx6ah/4r5JtU+aoRlwDWepjZv0P7ifUikVpr8vrl9ClpO6qyXArNTmTlAmD5
 G01ixLgjwjJwvSpIuD70X7XMZIyGev9qHmKJlSHrCxfGDtaK5gMpf+uqJFk51bSeKADchdprQA8
 B830+skI2S/NSLD01vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 9823c591b02b1905619be06483f0a0a4ce7d10a9..d2e4db4025dccef21fc39a042785c7e7f4475958 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2809,6 +2809,67 @@ adreno_smmu: iommu@59a0000 {
 			power-domains = <&gpucc GPU_CX_GDSC>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
+			reg = <0x0 0x05a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x20>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

