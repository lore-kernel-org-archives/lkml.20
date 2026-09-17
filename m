Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F04D956D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648004; cv=none; b=FizKYJuinQgbWff5FWDV7Rpnl2QCz+l/uA2lrXTaek3wVlQOEcQYlGVuJd4dAf8eye0MJwiLQc+60k+hLiVerutoRkeEEnXmL1pj4BRw6DG49ltur3WfU2o7YfZlyaBJ0A8yubbhtCZBrHYUO4NSVty7Y5Ox9waLwyHocH9uyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648004; c=relaxed/simple;
	bh=+ni5l5rxgVAQMIalE7RPp6XqvHp1u/AdEHjbOFe3K2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3RLlPqLh2vptAjAAmed8k7otUJ7paMpxNCY++gH7wJGea3Ex82wcJTgzBNRFV9vN7ymTz8dPHhUwzUlezOgSFboVfFLrL34ygI0rh+FtsZhyaIqmGVq+A1bPVF5zc2pN8yLDKpBKjVOEUxD2ovb/aXcgjZETkNDg3Rll9/YIyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pN011Sn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPiHC3w9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pN011Sn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPiHC3w9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZtD41390184
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=; b=pN011Sn+Hub9B9mw
	A7pZLmXr7bWtWj9ac0+3pOabrEAE8x5y15f2Gs7WWSVQgcJ/G5pIq93de83HcVoY
	9L4PG4vQrAuXBskE90J+eFIuci1RYtgo7wJ79OaveqzCQBTa9U4ivyJcdwZNP5hE
	t3b4WWbZHcppHBERnvxR9LQi4U6DJKhYNTtdvzIjT7MDo8J9S4GLwwkRbXkDK2Kc
	5XrVEp7aVHnp8ENMYn372o2tkCVjg+7aPe10HNY8SgrIR+PfZdgfT+qCIqRNmpGj
	Vp8+KYIMOGGN9K7ycxM8MPHAyWsYy6B4my42LKp7HArsXHI8lEjlIeooiooDvQmS
	L1mAFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d4bek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:26:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so16011385ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647982; x=1790252782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=;
        b=FPiHC3w9jXW2LtSh4LVbcqtNGBwM7umlJvxq4rGc4qxtr7dAwlMCoRYtMCB7eelNM1
         PnhPby+NX/minMRtdW8XeU0oYaj5FBK+dNQW/utre1R76TeOgIwS7iMptMAl60prxNDD
         jbEMygtRmT+VNpGPHBui24rX5sY3zeSnfYPDBVpUVLI6F5lXgTdifI1HvBC2HBl1rgxR
         +rCDcPMsQbS+zkFmx/OcDjCm0me2RcqPEtQq76QoQOOgcKnlupAhLo98BsZPeDCyS2lT
         Me2UTmGu1XWzIOAE37HVx5RKs+eDAwGKcOtcdJj/iQGQojGMQ5eYk1mK1QBECzXKwk2b
         Sk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647982; x=1790252782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGh1G7KMrcSlNmouC9TvdO6WXDttZlUID4VW+C8Q2Yo=;
        b=zgnA+T6OU1S0jtdFGGNUYVfQbuR8g6aUPrwJT+ix1LbO2l5SiSTmexIIl6uZvpAxxh
         6i3UPGbfbj+p57ZGDbR/UWzEYe/ehJucrt7M+Pw4pfEuQ6j4EVlwow1blokNXXqvz765
         GqzoBpjzrAxcq7d3QXCAj50ALGAqXCd3dIpg4hFN6A7ymjlNAEQHY3/iOiUX/Yy/V4bS
         ENGO8DfPeRs4vMElBxFETBnIa/3RZrRiXfPrM4y4JKHq+OrYsFprEc60B2LvEYKWLbPw
         0zDnUwEx9d0BNLPS8a1y6qK6GMRqAyohVTEbVmE+u7KzZMJ6INaGGJrGPCEO0onKFKMk
         GfPA==
X-Forwarded-Encrypted: i=1; AKwUvBy5h326gmxkIK8EApspfPWF2/hn2oasgjTq0gZizAkcbRbBT7paVeupZCxepKsmEuTV+WA1AayRsifSSks=@vger.kernel.org
X-Gm-Message-State: AFuF++nc+fg/Acx9RGNFwuaqfdmfX8qQTUdod2XjR1cj/2mxuklZwYw2
	HTujkW/pauO/REZH91QH/EjmATEv7DqkRUN6t2yYavkrfcd9iYjavECzfza9qpaQG3OejPDartT
	r28EUx0JHJ7U6TOobsMuViXx26suayRHxTT28sr+PVBcloBYERE7MjGxebLjXJZiE9LI=
X-Gm-Gg: AYBFou18eTaSU1QLCp8qCNe3MuSFUi2IimDyAkYps5pEgefvuUaDlVuxEXC6K/rnsnY
	OchUDQDlQNScdodOYffIHi47XlpwnwSTqymJqU9Xh4yEJeyrzpGklv8a4eqX8URvpm1FQRlzGCT
	btUfHvyIvHAdSFDtgar+14l/qJFfP3cM+aN/60SjlYBZ2sz0zZtzJ8waWsc2G4WPlr/1K4DeyaE
	BgURcDI9yNGoGa1MW+oRzX65qlqKqmdRXLD8VzXCPHjpVqpMObjpeJB6l8//HBoa5qIFRM/Q6wM
	r1pdXwE3s1o1Vcyvc93eb38dkN9xs2wVlUlqCq1X6J/JKdyN8KqClbtzsglDHLsciPNsKs9JrnL
	gEf6teaT9tJPSXVIuv8SELlWWfiMpLETC2r8=
X-Received: by 2002:a05:6a20:729d:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3dd5f5c78e7mr15164823637.17.1789647982281;
        Thu, 17 Sep 2026 05:26:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:729d:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3dd5f5c78e7mr15164779637.17.1789647981804;
        Thu, 17 Sep 2026 05:26:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:27 +0530
Subject: [PATCH v2 13/15] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=6068;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+ni5l5rxgVAQMIalE7RPp6XqvHp1u/AdEHjbOFe3K2o=;
 b=AfjFk+zOpZfim6A2Z2Q4J4HLTuwYft8MCkf5Dcg0r65Kaw8FxMs6DnClzzfUaC1eZH8hfbjyt
 J6T60R53StsA+w412t7RdbmvMgqMoybg0N+kHrhxJcJgN3pGON0KI4C
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 14Gd_Xnn7HSJKYITtgfU_9gBDYXQ5ZSa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXztqJMzHvdJrX
 pjcdr212ri+7Njt1NUL7xbyNE/rNw15iJXoxqQ6BlaH9au2ykrMtwd2y2WP+CRd/BIMYVRKfVzE
 JL4o2CzTgO3tMEDtvxU8b5+IT04kk+k=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabdc6f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 14Gd_Xnn7HSJKYITtgfU_9gBDYXQ5ZSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXxVYFUNwssOmW
 o1GzbqQ0951ilTGxfHlFPpWeHgOk9dk03GYBJ1trYWmqcBv91MHuFHth3ga83BJcNICvtLjcs3n
 Yq/LyF57Jme1JHCGXjtChinbgdgfR6U6tHPPOR7sZ7HLZ6eT8UUU7jmm69jzTU37cN2M43/uQfy
 R1fef7r/eb5U8Ut2ahcRduZS5UqL5tWwGvWIv1aBGhuX3BfajRG4Fi9BPA+WnfOaPzGX3uc104C
 Vcz5DCXuEqEcdC208zcn6Hdi2Yi6y6YmD1vHoGq5BQfM4XpbQ1Nl6fO5z1P5zx10ss+XA6P6n0b
 7zUvcBYLMaPaowmyyg/AW1liHFpvIQtP8qLJiFm1T6Zal1NzTAsuOARIMKEsK9eWVKC25oJk2Nd
 DPkYit3Vg+BT7UkhGYtfo4CZWiA7vO34YbNB9D6DIfva2y8gkZu78QqvY8Gwo7vd6LCPWAOkwaV
 AX/Z0gOfxJ+JKSBXqXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
nodes to allow board-level overrides. Move perst-gpios/wake-gpios
from the controller overrides to the respective port nodes in the
board files, renaming perst-gpios to reset-gpios to match the binding
used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi        | 15 ++++++++++++---
 .../arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi |  5 ++++-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi     |  7 +++++--
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  4 +++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi               | 21 +++++++++------------
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 0c076852b494..ad435a13ba24 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -458,23 +458,32 @@ hdmi_ddc_suspend: hdmi-ddc-suspend-state {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 130 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2 {
 	status = "okay";
-	perst-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
 	vdda-supply = <&vreg_l28a_0p925>;
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index a4dcc88bb01f..7a3f8afae22d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -210,12 +210,15 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&vreg_l28a_0p925>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index 5b42c266557a..20b5eeef46e4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -191,13 +191,16 @@ &mmcc {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	vdda-phy-supply = <&pm8994_l28>;
 	vdda-pll-supply = <&pm8994_l12>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 2abcc733dad8..3c70a9be45d2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -278,8 +278,10 @@ &pcie0 {
 	/* Supplied by vdd_3v3, but choose wlan_en to drive enable pin high */
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&vreg_l28a_0p925>;
+};
 
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91..f3c004f02cfc 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1924,9 +1924,6 @@ pcie0: pcie@600000 {
 				      <0x0c100000 0x100000>;
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_0>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0c200000 0x0 0x100000>,
@@ -1975,11 +1972,13 @@ pcie0: pcie@600000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie0_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
 
+					phys = <&pciephy_0>;
+
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
@@ -2001,9 +2000,6 @@ pcie1: pcie@608000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_1>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0d200000 0x0 0x100000>,
@@ -2052,11 +2048,13 @@ pcie1: pcie@608000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie1_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
 
+					phys = <&pciephy_1>;
+
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;
@@ -2076,9 +2074,6 @@ pcie2: pcie@610000 {
 
 				reg-names = "parf", "dbi", "elbi","config";
 
-				phys = <&pciephy_2>;
-				phy-names = "pciephy";
-
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges = <0x01000000 0x0 0x00000000 0x0e200000 0x0 0x100000>,
@@ -2126,11 +2121,13 @@ pcie2: pcie@610000 {
 						"bus_master",
 						"bus_slave";
 
-				pcie@0 {
+				pcie2_port0: pcie@0 {
 					device_type = "pci";
 					reg = <0x0 0x0 0x0 0x0 0x0>;
 					bus-range = <0x01 0xff>;
 
+					phys = <&pciephy_2>;
+
 					#address-cells = <3>;
 					#size-cells = <2>;
 					ranges;

-- 
2.34.1

