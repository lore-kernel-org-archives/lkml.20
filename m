Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C3D4B826B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728008; cv=none; b=cgBOaZ3DuEi6pFnibo7nyABQX67bPHM5UBX6EmSWS2hr+i69pVJf9EKPvGJjfnreC7CdRJDQ0bYyVlpWZkOszh5CSFGtCdmHinka9ZCkpJ1MJeSsHTNQZP4Cad/tuXZGLL+jEQG6JeWadwPuNkrVR8G8aPIcR4u9Vs5SESheCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728008; c=relaxed/simple;
	bh=X17ccHw+VbWj+Okmiex6XkU3F9Uxf+xlyknIrjgj49I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nB2e9dn1vl5EtKbrr7cgibGbyJ8ZgYjRBdvjV8CbieeE4eBdEMlJjx6zWvivEltTS+JaOFM7o16hiEJ/6WucEFDXdq1JAEAsPF/A/nSed8L0sFP5F8qjeD20GO3wC9HeeExxIYWekCnZNeTDKfEv34uJnVTRp9fLUa77Fs1a9dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAMqhrx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WB80vLwi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAMqhrx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WB80vLwi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dshJ139301
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	91y9vS6cgne0toKjGomx+H9dmRQBOGswYip+3K3Ykrs=; b=cAMqhrx1jOolxKVX
	07KZYV/p+7qUx9y0NAUrpMAL3xcsATX9AOv0qAWm4k8XnPcZT5WuhSkMc2qruWg6
	s6Gg/5nZm5XyThU8NB9Z+SSh3QgMMz4HaH7XnrOqWWYum/oELPe4MVb9Wm+Pz3af
	LK7lif5FHAUTGdxg5ooRZVtGaRaSoLlSQ6TKJeFSoC+47mA/M8R2Tr9nG3dkQXLH
	soB4T5OaFRC4JuuwTMmiM60ap7D2qrou9UDmrKLWeL2rzaEqo2te21iSughBcrDd
	IAwICjuBu5losUlS5O2Ie8kwQXLrr7y3ZaxHzvjQ3/WJBMW4c1FwS4i+cNOCtqMl
	nQ3vMw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bs8ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:40:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso804366a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789728001; x=1790332801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91y9vS6cgne0toKjGomx+H9dmRQBOGswYip+3K3Ykrs=;
        b=WB80vLwiQzC74lIqCJxJhGUG88SAKk1+hyzLUkZyO3igL1ITa8NcMXb3ZWO2H4Ke3d
         ZuXYF4p/Tav7VaNpB5Nk2FknFJDRZ5RNit95tBn++GR87z5oTOjHp11tnf5whnvwkgD7
         7tQZKP75P1ttLFa1OVbRZ9M7ikQfLM6YYH/BCiH+xFZW4x/jwTvc7enuKrWnr//jinOl
         n9/fMMupVgXUbEdM+EKtyDgpfeXXUaJnOGfT/waZPAyTgvtogJiwcjgtOFFaEYSvv7Zf
         Mc6ro1AKm4///M+xnZ4j2iMnhDnMwBAGOy2vYNPulGNi6O6e56T/GAbbADQNx9oJxpIK
         92Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728001; x=1790332801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91y9vS6cgne0toKjGomx+H9dmRQBOGswYip+3K3Ykrs=;
        b=YIfiXUy6I12vi5nR+l06+UEbsjiAmuxTi2EMmImzA9KbS1i0feGRziK9U1E/QLPWtV
         ObHKHux3HhdWl0yKhX9Vwrmhj+1ijjtVP2VzEcWdafHS1IbXSEeNcjLbqM0KFfgE4KOV
         lJZAUVym+nmk69nM/c860jKT6q0ZMQzWubdmEY8HJA2ht0YkHwgw3W9T2g0STY4DuarO
         vQRt3lVGFIQxJeswRRb7K74MaXpU9djUkgYkiHIfYiLARjxuoYlltzZbNYR2Wi1mdv37
         95Rz4prhYz6LKrO395AU5uXSNlfBXolterbB5FS9Di5BSgNhTlBUhkGWtymJv+PTvbnK
         CqvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgqPupcs2RSrg9caOOZUGJVDeYAJWABBKYXFeAMkv8t1YyJk8XdT1JL7hhp0MGsY6WD5Fgck4URWZVa7I=@vger.kernel.org
X-Gm-Message-State: AFuF++n1yTCKLkajoHSm7m8cVN0xkUzLKpEEsOyS+LvNG9fAGKjhGYNf
	AZh1RG0HXkqq6+0RmxloaSD9CmimHLmkPQzP1rq+cjLBPYvjggKd100uV7NPKNh20ZKiZasnkM5
	NZ2WbEBmSg7jfrn0cL6NeYRItcABQA+1vA57h4QqImrVCixWELilIaa24V4WHBF/FEK4=
X-Gm-Gg: AYBFou2q5zRr7w/a7IiJeA/sGAiAUYbpvpGOVrkUT66eacBj/+T3cYkh0zE0+BCdvpq
	ZhHjZRYQAaylb7QGhMmCNG+TiTrPRmD83fO3bYwO6GP6KneoTUgm9nMJjweVwv/1MuFwL/8yZ4E
	eaaEvu8vqCvfYXnS07/RjmSad2cAi7YZWW2wSOr27q5KKWZON0sQvbPeSdfX9vc7qAOWjYPdOu7
	nhkHDlzKoz02VRIXl8GBjIDf3ySlcO+FFsLeQPFP2UnfzX8Aw8ufX9oh1jHFkqG/2vhcg7Y3AMJ
	B9MbA7Y365DR5sSS0/ctlmmFwlYT9hXIQHetiKmKAqvy01oiQOahfjDAymlDBzRZAg1DKIgtO2F
	K3RL3zO5u4V2BjsPRjTwH701cHg==
X-Received: by 2002:a05:6a21:9090:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dd8c33a760mr4745934637.12.1789728001293;
        Fri, 18 Sep 2026 03:40:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:9090:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dd8c33a760mr4745861637.12.1789728000859;
        Fri, 18 Sep 2026 03:40:00 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:40:00 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:09 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: glymur: Add UFS nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-3-16619f7e36a6@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=4407;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=X17ccHw+VbWj+Okmiex6XkU3F9Uxf+xlyknIrjgj49I=;
 b=eywfFGAb6dF7PysyGpiAKhEapuU/T6TygMc11WtLD7/nM4ti9htvj/EaHbnO1upJZ0lCjwTD1
 +YN1LA1d/x/BnHWAACNGlV2vDZTKWCatDkCYRpZxsTajzPGAHQ9XTfW
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX8qSP0LPBnkYJ
 3WQWIthWTQOlyEPmErSssi9ms1tVmY6A1zQDAOoXYaBIZKk9WRq9Xm2UhfnOHORgcagEXXKfN4E
 yHnZhU+wJKcMCzJaogKP5TIF/cOC29onTlae/uy4cxb8ia4K4H24AU9+wcotV/cbXzX2HLygIjS
 vXj8fljILYHmqydbdZXXfCxsJnJwa2c2hoadtvGCPIzOCNlc5YfFuB/bNwAA3KRNCbIcVc/cIAS
 HiVLL2YEndUtGEuU4JAtq4VVB76beACDatAwuOelDpbdfabn3mmU5kxzQAzENGkKHhX5GyawalA
 XG4LnvCHRloXATdQGkfOhd5EezOprJnwDfOR6QWN2a59hUD4wvJJ3pnE5nL64c78t+/H3NT8EVu
 Gd4R5vXTgxNa+GpUuvQOhm0dxbbbcK/i2+RKrbXaF68WFkX8n1zeIHWfuO8GjdBaA3kBr4TJetT
 DUSTasWHrezixhWPj2A==
X-Proofpoint-GUID: FdiLAuAF9urVkVSc7oBHwOv2wmxSEXed
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad1502 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7sHo3vQ6stv6frjssEUA:9 a=JqOrBNmfTE-P4NNt:21
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX3RPLSYxcUPNF
 n+mpEadpY165U/Ak0riEgvsSjOzhh9wlP9dE7k+3joIbZzXC9pgb4o1X/yxcoD+u83N3Sqe00zq
 CxgyWJjJhBVndAjnjX0Gc6OEKIc9iZA=
X-Proofpoint-ORIG-GUID: FdiLAuAF9urVkVSc7oBHwOv2wmxSEXed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

Add UFS PHY and UFS host controller nodes for Glymur SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 624a9edd602c..b1d91903b0dc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -812,9 +812,9 @@ gcc: clock-controller@100000 {
 				 <0>,				/* QUSB4 1 PHY RX 1 */
 				 <0>,				/* QUSB4 2 PHY RX 0 */
 				 <0>,				/* QUSB4 2 PHY RX 1 */
-				 <0>,				/* UFS PHY RX Symbol 0 */
-				 <0>,				/* UFS PHY RX Symbol 1 */
-				 <0>,				/* UFS PHY TX Symbol 0 */
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
@@ -4103,6 +4103,125 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,glymur-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 /* UFS and PCIE4 share the same clkref */
+				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
+
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,glymur-ufshc",
+				     "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x01da0000 0x0 0x15000>;
+			reg-names = "std",
+				    "mcq";
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_LN_BB_CLK3>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			operating-points-v2 = <&ufs_opp_table>;
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			interconnects = <&aggre2_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x460 0>;
+			dma-coherent;
+
+			msi-parent = <&gic_its 0x460>;
+			lanes-per-direction = <2>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-201500000 {
+					opp-hz = /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403000000 {
+					opp-hz = /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.34.1

