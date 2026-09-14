Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA77A3A5E6F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370403; cv=none; b=N5RJ5qFwbh4Cb/f+NzkucN+BYh3Vky5asXwzkjaVWtKsiZv989aVlnbGiKmy7HpiyuqZ91mb/PBmqm+HkhwFXezMG7TKL9TXXgEyApReAofYFPoxKokwT35B0gidALZAqTP+a4V7WfoA6n9B04JsW6CKZ5qGcPCBz2OegnXuTt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370403; c=relaxed/simple;
	bh=sZ9gPMCrBkOlgoutzyqg3q4N3lZoVyDSkK/8KY6j5OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ma3jY/k9Fb04Fz/KEtoTvDz2aRNP2fqw72Y3IKCYOWZr7rB0GuKmou3ZvPFB8BcFh1iO34J3AXFSOC3QxCtc0XQBldlLAeqomib5lb45WN10mZzGN2ee6RSSAUcqzPrTeNOs9iLHZWZSdt+gYbPSxIP4gg8yqiCbOfpks1tixE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elduQiiz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpXCsANv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elduQiiz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpXCsANv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jIEq3740650
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nuGAqxwjrc5
	gtHWdOePA/FxGECbr1WgiUPAEMdWNqy4=; b=elduQiizgcrFfFYG0NeqYRzGqXX
	CacAeMM9DhLQ/G3CTa9BwiCLBwIngyxXULrKRHlkL9MKEBnabLF5g0REoIFXGTgk
	CHvqdv6UXo4wJ5KQKQTO4nMMcjw14FCo3neP68x4zgR4KNtRc98d4LscwvAaK2Sh
	ga7GButRcqEtBRKC9Cg8CRK2E9mlsCnEMxgjkKBnU7K6mkuMIq0nXJkUgnqsRXyt
	L3YrGSM6G32ueKmVnVu5OYHAEs4pkTlSLqZ7JtTI3D2+sqsSOj4+0f7HYUaM6ehs
	H8L6j/Qi2lef8I9X9lDSSfxON9Oq+DU4McaWVUqUjBRaDwXZWZO6IlS+uZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddfwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:19:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3671470a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370398; x=1789975198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuGAqxwjrc5gtHWdOePA/FxGECbr1WgiUPAEMdWNqy4=;
        b=LpXCsANvKlodhUF26RC8XqHfMWqZjhYW5sbfBPiiVqbzglc7PPnCA9GpCDeRW/5DHY
         mqMlkS7PdulzcL2A7CpVbtJD6MvhlwjopCrXDzKwrkyKSI3OCOkeHAiu2Ipq/vNFcgqw
         s1yHn30u0614tZDhoaCLZi5JtDsmLFAeasAVEYZXWvTeYzAt+I5+gk3Zdbgajsfr4IIc
         5Lx9eh784SvklWnDFLfZYJ7C9QN6wy808u55jLBIxdtApZhTVL3v/8kNVFx+lno5VmI2
         XLGOf1ir4CHPBSR01cF6YStepFdDPdzBsLqdo+YtzOsCS/YsekEH/X8TQc3CynRL49vl
         Gsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370398; x=1789975198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuGAqxwjrc5gtHWdOePA/FxGECbr1WgiUPAEMdWNqy4=;
        b=KezOi76m8eFZCZUmtTENIX3Ao6U29CF4XUOAq552yqpwsip4IxB4m8DV5bL3VDSwIJ
         3QhrYA09FaMpjsKhy/QadaILv6o3+ARsXqLPoSr0N3K0QTvwohtoaIoyZLM+OuqWw9yd
         r11TjiW4yx1kW4Zl5JSvpAmOHqvC34rO6/GAA6DkzLK8B1EdmvmfPSO7DEo07cHgNpAJ
         7/OepJCGtPZt9mthVfKzx8D1Us8FeNzTgiHMZwqi4qgNiXm5tIuMbe0KgTPEz0ogwepk
         QAPfcnXuRdTFFoZQWm4U/e1OpyTFypowPn621WVXRKvCgHyMk2VdcioHmhJnL9UbVza1
         ozjg==
X-Forwarded-Encrypted: i=1; AKwUvBzVsG+Afi4Yyfbu4hbeF3dVJPqCkqBZ2MXn4eLQVcWtci85GzZADm2cBDaxMaRh25HiHHDLOcMkitKGs/w=@vger.kernel.org
X-Gm-Message-State: AFuF++k0fO1BHj9SJBnGclK+DTq9KBL+3TKNLOOV1o1TvkBeRnFXoADa
	X5PUEnPRcQsYx0VHE0JpLQTcJheBDkErXQD0XUlyuHIlwpy9YVOaSbv4/quzGvmznOTQNxE4zyf
	7GXsCpuoBE0HdKzFFFIZL8HxjwYdBUW9v9nyQxy+g9BK0wMWzMJ60C74Xmvo+LAbm/WA=
X-Gm-Gg: AYBFou3E3BvYQ7Jqp3pV9cjAsxDchWBsgEvIqxpfFFAi1Z2y0gYKbMdx7EEXvNZaHEf
	p+9puujNJzOdOgnOHsC4AvTgVTKGEzdpLz4SEYcv4qRvsWR1Mnsik+5UyY/0Rynys1lrZVn6D/5
	J5LdQICJrlZFdb5uZ7r5YyzItAWo0PxfifIaTh0vHTr7/NaZJYT4DAvrJmxqQJuPjPfmqzijjp5
	HuH2s+Aecssw5T34lP3ZDLQN1xvAt0Rusana/q2ZZ/FtZCeFcpTcWknWQGAZrW90Vi5H/rpHdnQ
	lahzu6YFCbOx0serQCi5hkgfHihXyEMSOPuhb4n7+5zwFTVobkG1W6d1GBvhbybArj5OIYnNsHS
	KLwo/lAydIEiB2u3uiBJjzrq5yV2LJfZhDB3hvoNym6KbN9WZeKoce1RwDhJR
X-Received: by 2002:a17:90a:2ce3:b0:39d:ee69:d204 with SMTP id 98e67ed59e1d1-39dee69eec0mr1622079a91.23.1789370397972;
        Mon, 14 Sep 2026 00:19:57 -0700 (PDT)
X-Received: by 2002:a17:90a:2ce3:b0:39d:ee69:d204 with SMTP id 98e67ed59e1d1-39dee69eec0mr1621993a91.23.1789370397244;
        Mon, 14 Sep 2026 00:19:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:19:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/5] arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
Date: Mon, 14 Sep 2026 15:19:40 +0800
Message-ID: <20260914071944.164217-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfXzGSYN2reAM6f
 wBqsUEJ1W9H3Mu2qKTwZo+30vzLxD7rEPzE8+8ISWzml/fbWzd510evNa/NNRMDdZ8h0QNaJ3ds
 abnOpNdB0Q9JK6crEvysMQFhfQjp31rvdOm+i7h15GErnSBY74kdVOABUGm26mYCuerlbH3JheZ
 EcmO2jewHeVWgdqfYH7f9LBdpId95aS+ScABjydBSR9u5V774gg2tte04vQ2Q00Oe+S+65VaKqn
 fC3+cULP8kNTjyc/rHtoRZuCEuIk1lxI4ip6B+/sB1UXWupW+zrj6m9V1KmSy2sjKzAcEItWD4Y
 NySpKFz24/AKEQi8JeYebbWXURtlISDzMmVKazeJVwC+Dxuvs7z22Aa7iS6ELTgZW2F5FAmAsvH
 wu3ojsBfbGd/12crpr8uC8GYq338IqZ2EwA/YojRdJ6nItgLDRsMQP+hjOtpduapCdBh7+tYfGA
 RFXZUChXcih4WGzL5CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX3OJ9N7nybYck
 Cd17jI7yImMRLY6AUPhdGNpVx/BBy3KE0TJAVkiAP0x4UY0OFbgye12G9V3LbQjiuKkgtOFu1CG
 s7IM5xlQ8BgP50q86jJY6Sno8F31cFY=
X-Proofpoint-GUID: ZyUFy5uFehWMCB_zoiMvTlnpf48s0v2N
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a01f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7rqOJILHKxEwWM2FdFwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ZyUFy5uFehWMCB_zoiMvTlnpf48s0v2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140103

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Nord has four PCIe controllers backed by a single quadfurcated Gen5
QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
topology in effect is selected by firmware through the TCSR link-config
mode register, which the PHY driver reads at probe time.  Describe the
x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
configuration the boards ship with.

Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
also become available now, so hook them up as GCC parents in place of
the <0> placeholders.

The controllers and the PHY are left disabled here and enabled per
board.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 926 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord.dtsi          | 297 +++++++
 2 files changed, 1219 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e..6e79f3cb20e9 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -342,6 +342,738 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&pcie0 {
+	clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
+		 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_A_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_A_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_A_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_A_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_A_GDSC>;
+
+	resets = <&gcc GCC_PCIE_A_BCR>,
+		 <&gcc GCC_PCIE_A_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie0_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie0_opp_table>;
+
+	pcie0_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x8 */
+		opp-20000000-1 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x16 */
+		opp-40000000-1 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x8 */
+		opp-40000000-2 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x16 */
+		opp-80000000-2 {
+			opp-hz = /bits/ 64 <80000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <8000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x8 */
+		opp-64000000-3 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x16 */
+		opp-128000000-3 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x8 */
+		opp-128000000-4 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x16 */
+		opp-256000000-4 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x8 */
+		opp-256000000-5 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x16 */
+		opp-512000000-5 {
+			opp-hz = /bits/ 64 <512000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <63012000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie0_port0 {
+	phys = <&pcie_phy 0>;
+};
+
+&pcie1 {
+	clocks = <&gcc GCC_PCIE_B_AUX_CLK>,
+		 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_B_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_B_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_B_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_B_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_B_GDSC>;
+
+	resets = <&gcc GCC_PCIE_B_BCR>,
+		 <&gcc GCC_PCIE_B_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie1_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie1_opp_table>;
+
+	pcie1_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x8 */
+		opp-20000000-1 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x8 */
+		opp-40000000-2 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x8 */
+		opp-64000000-3 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x8 */
+		opp-128000000-4 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x8 */
+		opp-256000000-5 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie1_port0 {
+	phys = <&pcie_phy 1>;
+};
+
+&pcie2 {
+	clocks = <&gcc GCC_PCIE_C_AUX_CLK>,
+		 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_C_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_C_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_C_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_C_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_C_GDSC>;
+
+	resets = <&gcc GCC_PCIE_C_BCR>,
+		 <&gcc GCC_PCIE_C_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie2_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie2_opp_table>;
+
+	pcie2_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie2_port0 {
+	phys = <&pcie_phy 2>;
+};
+
+&pcie3 {
+	clocks = <&gcc GCC_PCIE_D_AUX_CLK>,
+		 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_D_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_D_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_D_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_D_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_D_GDSC>;
+
+	resets = <&gcc GCC_PCIE_D_BCR>,
+		 <&gcc GCC_PCIE_D_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie3_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie3_opp_table>;
+
+	pcie3_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie3_port0 {
+	phys = <&pcie_phy 3>;
+};
+
 &qupv3_0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
 		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
@@ -704,10 +1436,10 @@ gcc: clock-controller@100000 {
 		reg = <0x0 0x00100000 0x0 0x1f4200>;
 		clocks = <&bi_tcxo_div2>,
 			 <&sleep_clk>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>;
+			 <&pcie_phy 0>,
+			 <&pcie_phy 1>,
+			 <&pcie_phy 2>,
+			 <&pcie_phy 3>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -774,6 +1506,100 @@ mmss_noc: interconnect@1780000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	pcie_phy: phy@1b00000 {
+		compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
+
+		reg = <0x0 0x01b00000 0x0 0x10000>,
+		      <0x0 0x01b10000 0x0 0x10000>,
+		      <0x0 0x01b20000 0x0 0x10000>,
+		      <0x0 0x01b30000 0x0 0x10000>;
+		reg-names = "port_a",
+			    "port_b",
+			    "port_c",
+			    "port_d";
+
+		clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+			 <&tcsrcc TCSR_PCIE_CLKREF_EN>,
+			 <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_A_PIPE_CLK>,
+			 <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_B_PIPE_CLK>,
+			 <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_C_PIPE_CLK>,
+			 <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_D_PIPE_CLK>;
+		clock-names = "aux_a",
+			      "cfg_ahb_a",
+			      "ref",
+			      "rchng_a",
+			      "pipe_a",
+			      "aux_b",
+			      "cfg_ahb_b",
+			      "rchng_b",
+			      "pipe_b",
+			      "aux_c",
+			      "cfg_ahb_c",
+			      "rchng_c",
+			      "pipe_c",
+			      "aux_d",
+			      "cfg_ahb_d",
+			      "rchng_d",
+			      "pipe_d";
+
+		assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>,
+				       <100000000>,
+				       <100000000>,
+				       <100000000>;
+
+		power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
+				<&gcc GCC_PCIE_B_PHY_GDSC>,
+				<&gcc GCC_PCIE_C_PHY_GDSC>,
+				<&gcc GCC_PCIE_D_PHY_GDSC>;
+		power-domain-names = "port_a",
+				     "port_b",
+				     "port_c",
+				     "port_d";
+
+		resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_B_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_C_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_D_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
+		reset-names = "port_a",
+			      "port_a_nocsr",
+			      "port_b",
+			      "port_b_nocsr",
+			      "port_c",
+			      "port_c_nocsr",
+			      "port_d",
+			      "port_d_nocsr";
+
+		qcom,link-mode = <&tcsr 0x71050>;
+
+		#clock-cells = <1>;
+		clock-output-names = "pcie_a_pipe_clk",
+				     "pcie_b_pipe_clk",
+				     "pcie_c_pipe_clk",
+				     "pcie_d_pipe_clk";
+		#phy-cells = <1>;
+
+		status = "disabled";
+	};
+
 	pcie_cfg: interconnect@1ba0000 {
 		compatible = "qcom,nord-pcie-cfg";
 		reg = <0x0 0x01ba0000 0x0 0x7200>;
@@ -998,6 +1824,98 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	pcie0_default: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie1_default: pcie1-default-state {
+		wake-pins {
+			pins = "gpio3";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio4";
+			function = "pcie1_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie2_default: pcie2-default-state {
+		wake-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio7";
+			function = "pcie2_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio8";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie3_default: pcie3-default-state {
+		wake-pins {
+			pins = "gpio9";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio10";
+			function = "pcie3_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio11";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 83760341456b..2f883f963a6f 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1587,6 +1587,290 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		pcie0: pci@1b80000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b80000 0x00 0x00004000>,
+			      <0x00 0x40000000 0x00 0x00000f20>,
+			      <0x00 0x40000f20 0x00 0x000000a8>,
+			      <0x00 0x40010000 0x00 0x00020000>,
+			      <0x00 0x40100000 0x00 0x00100000>,
+			      <0x00 0x01b84000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			num-lanes = <8>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommu-map = <0x0 &pcie_smmu 0x0000 0x10000>;
+
+			msi-map = <0x0 &gic_its 0x80000 0x10000>;
+
+			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1: pci@1b88000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b88000 0x00 0x00004000>,
+			      <0x00 0x50000000 0x00 0x00000f20>,
+			      <0x00 0x50000f20 0x00 0x000000a8>,
+			      <0x00 0x50010000 0x00 0x00010000>,
+			      <0x00 0x50100000 0x00 0x00100000>,
+			      <0x00 0x01b8c000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x50200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			num-lanes = <4>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 835 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 351 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 830 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 348 IRQ_TYPE_LEVEL_HIGH>;
+
+			msi-map = <0x0 &gic_its 0x90000 0x10000>;
+
+			iommu-map = <0x0 &pcie_smmu 0x10000 0x10000>;
+
+			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie2: pci@1b90000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b90000 0x00 0x00004000>,
+			      <0x00 0x60000000 0x00 0x00000f20>,
+			      <0x00 0x60000f20 0x00 0x000000a8>,
+			      <0x00 0x60010000 0x00 0x00010000>,
+			      <0x00 0x60100000 0x00 0x00100000>,
+			      <0x00 0x01b94000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 263 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 154 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 110 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 258 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommu-map = <0x0 &pcie_smmu 0x20000 0x10000>;
+
+			msi-map = <0x0 &gic_its 0xa0000 0x10000>;
+
+			status = "disabled";
+
+			pcie2_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie3: pci@1b98000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b98000 0x00 0x00004000>,
+			      <0x00 0x70000000 0x00 0x00000f20>,
+			      <0x00 0x70000f20 0x00 0x000000a8>,
+			      <0x00 0x70010000 0x00 0x00010000>,
+			      <0x00 0x70100000 0x00 0x00100000>,
+			      <0x00 0x01b9c000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 111 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 246 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 239 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 234 IRQ_TYPE_LEVEL_HIGH>;
+
+			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
+
+			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
+
+			status = "disabled";
+
+			pcie3_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		ufs_mem_hc: ufshc@1d44000 {
 			compatible = "qcom,nord-ufshc",
 				     "qcom,ufshc",
@@ -1736,6 +2020,19 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		pcie_smmu: iommu@9980000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x0 0x9980000 0x0 0x20000>;
+			interrupts = <GIC_SPI 898 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 900 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 902 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq",
+					  "cmdq-sync",
+					  "gerror";
+			dma-coherent;
+			#iommu-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

