Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD354C6D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161207; cv=none; b=SlIbdmR2I8yUgGPnDbAjQTBmMWIIL4eBl7/ASZU0dLZXN75/FQ8LBKnhKtJsgigc39986jN0iYqFSOmCYBMaPOk9hGeg+yMjnBUZlmPRc3YbeDkArSQ+HjVBbCpNG4Y/mnejoI4UO7V6gxFbanvk9uzm7VfBB0RTlEO6XY/IDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161207; c=relaxed/simple;
	bh=TRINqUe4xwKAkE9bKbm01PDqmvL1+mAGSLwvgN/J4z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teaPvuShFvRlsdkj7kY+/v9lj7m1Wg2GDb+BXp5z3BMbD0WKGX0N+nLP78IKarjBtVrK9dL7YwWU0egZ4ICxZh6GiJHioPlu6WvOpKyMcNXSxFhKN4U3D8dBbN0Ubuav+ocRKJBWX4b5VUTdU+j+Zg9fUtgAbSWI7gKuOyCqpc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXVqLKQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwwzjjGX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXVqLKQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwwzjjGX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52VkI2423221
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdS8lJpcTMR3OOvAAebIM8DAFL+FJu0ANnnhwSRkLYc=; b=QXVqLKQGGVlhIski
	JVocdMpmZsuTQf/FgYoNBMX4PAog8dhr+1aswuhwvkLfH6IuhzPJm/vP1gE1I5Sy
	MRKOFjYNqv53eKh/uCyhxrcKvAgKQrppHIt6H93tJFA5r1CMbOu4+B1gCzG2EDRu
	od98gidx/o3YAiHOtVvXL8zQn02L/mRu0tqB6w+J6PIUOd1JVs2b9FsfRC+GhCKk
	zqIBCQpzC0lIriGLq/R5DIZdz548XT/AUoY4T6CnAMmUgEZSmcH336qyMS6uEndw
	v8gMLMHAxck5F/WcRaIzlWph7UsHI2pE0KyuxMFSwKjQfVKfCoIrjBkhzCRDX053
	tgtusw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2d68w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2037184a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161203; x=1788766003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdS8lJpcTMR3OOvAAebIM8DAFL+FJu0ANnnhwSRkLYc=;
        b=NwwzjjGX656ss1ks4xO5kZr1ptUAWSDuiL3lJCqF+fDT16Pc1gjGCR4e5D4kPHatkM
         BejEAPfObj0ctJTJiQcIrzKbl/c4w7R/gWcAKa5+2D23m9wb4djD4lqXVddosduHKujo
         c9Mr64VKMgT8EI1fF+QSwL+Ffx+h2YxBW63upkmoMdbja1rY8r28LAPDw5PfrXPpIbZW
         B+w0d2fa6yYK8v5egvlcH4N9TWxfywIUm4Je2JySZoxcl5scgqGg2JtVETpaLaqePwIJ
         Mb7aY2m34N4J4tb6QDiRt65pOwcpFVpsVwLttW0HUdXk/jiB+N2ZFIKm4GlIGIpoFERC
         2uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161203; x=1788766003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdS8lJpcTMR3OOvAAebIM8DAFL+FJu0ANnnhwSRkLYc=;
        b=aMDQEIPyTD/41Vcqpzcl3vZR4vJVQdhVe34ACRr7QTs0O7t+tmJpuKlhQvnXlGVQNY
         CHLXZ9t02nxiUafkkR5ChZLZmrDUQsETE1zfZvB0D1mouVh0wAs+SZ9gSbYR1hBx8pXG
         pIjBQLh3H8CLjUeoGkk08m1/eztoP2u5ThdFTE9cwFWaUCtXVP8Ba4AOzAwbt+0a9ULm
         upxHiB39UzeVgBQM2wqzo5lGkgzDPp5MA+jjdE89ehsrsFloGyzVdw72caeByuE7Q/Wy
         8ApeFrcLFr9UWhykzzDaXDekvh8slBOsF7oHZZ+242D1ddUtwYZFaNZTQhFKSwQukpYw
         shjA==
X-Forwarded-Encrypted: i=1; AKwUvByvhygtBcjTPDe46o/wz8WlzRZaamh57IPBA6kpPGnMYO8UgXeRIeACQh/NYT+9U4GTFV9bFMcQnpto1fo=@vger.kernel.org
X-Gm-Message-State: AFuF++nrghLhFIeo0jkTzUv3K49ZmDDhfHkrds8Dk60BhjGuxb0BYTg+
	2nnOiE0kMJ6mq/KLS7P0j0v4x9qtXbQe1Ht9+dk6EnJjCDJZe5liABmElcNN+0RWPYB4wy83ATK
	12g0+kRtmmKtgnQmekx6cCaP2rJuWt0hq3kcxaM4qMfnIDJrfOhmwca8UnEjUuMFjQsA=
X-Gm-Gg: AYBFou1f7G26WABqUu553qpdThmzmcIKCZHMq27L9MGPYuZPmbVuqmC+oP3nb+1lW7b
	AVUFjfKNEWOnlnsvxFdJ5RZkE/Q6VJmF9AYnMqFJStvHVoTAtlM5/NF9A0M1eMoIw4IXGZ8DgZj
	Dc2MGyZwOkBU1Mp8lRegIrAL0VYWXp69StBZFTNOUE0XstxBAH2psxa7Roef3sGKZYyLx3+AA1d
	s0V6TmMjeyXpELFEXZxQ0d4zTm2pLmyoCklUnJ+nMIdrv/m/Six3NE7UdHrDhXGId4vg2kN1Qq5
	eGvDL1Ja4nnje1TDg/xOT63X8EfDY/6rzQCt8roThW/4xKRC1D3Th0Cq/7/ypXKrJFzxep1+N4w
	Je3LsULhSUZLW2cyHYzKsqiDBGFNFumdSoQUq
X-Received: by 2002:a17:90b:4b92:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-398da5e900dmr6017278a91.4.1788161203443;
        Mon, 31 Aug 2026 00:26:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4b92:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-398da5e900dmr6017225a91.4.1788161202906;
        Mon, 31 Aug 2026 00:26:42 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:42 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:05 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: shikra: Add PCIe PHY and
 controller nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-5-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=5578;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=TRINqUe4xwKAkE9bKbm01PDqmvL1+mAGSLwvgN/J4z0=;
 b=QWYT2K6ppw2yIOxWeQ8o7aXJg8DoyCXyyuMypmQbNe6rS1dmX7jHB5cHLGKWUBNIqid57mQaq
 mp4X5gfndE7AJs9QQz7OOTwoOkuglxtA/UK95jodr2020qvAhPqdBGr
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a952cb4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Cqz-_Xt_bCzV1Ft-kyEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: IdwbR9aAqKUzr37KGLlE_DP94oxq7hKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX8ST1WyyElt+t
 fF8UVFk/vC4JWpgVbhjjcU1jvLMcyvad0+pki2CB3vpGituy64hJxb1rxnZKlCM5qHKOUMVbPIi
 xUN4VpZsqMsBokCG/PeCnM9NCMm/2lv3QxvaXkROvqXDqj/YX7wY0MvkIUQUWRDdEuVNW1v6S1T
 Jv4mp5HTg7Bo7mC3IkiMfqqTGai1d8UChoRgwxWujnbA0I1l289wtM6QyU7uD/3Y8cfpvTW1j9q
 zrC92gFnhHf3bhiocAJYWGKK5uuEGkKEY5EgT6r6zDB90BS7Q8yU4T0/T/BR5axAhMS4buBfh5h
 HhRDBEi7Nqvpq3P4W9pBUppCKTNjvF71OfDLAQofiwG5Xp/z6bGr+1eL1xcVvPnogRcAoPlfJal
 FhjNXmRbnEAf5d5Dc8DwDrnhbwKO5ZU9M6DTR9CoWObN5dtLYZNIvDHdlNgpbigd4aBCu1L0fWS
 OmZ2rBU4mzqTFRfk/6g==
X-Proofpoint-ORIG-GUID: IdwbR9aAqKUzr37KGLlE_DP94oxq7hKR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX+NEaAjhMT4Ry
 roC6KubcVLA0banMfWMEHbAlmib/AFhAbUHjIN7egWgpssTpNibnBSpYWeI96XeqBWjsntiUuoF
 qrWFxS3ODq1TQfYPWH4LxzIs0KHVQ5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

Shikra supports single PCIe instance with 5GT/s x1 link.
Add PCIe controller and PHY node for this single instance.

Shikra controller supports upto PCIe Gen3 but the PHY is
only capable of Gen2, hence limit the max link speed to 2
to avoid link-up failures.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 159 ++++++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..9c190e6e92ce 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -899,7 +899,7 @@ gcc: clock-controller@1400000 {
 				 <0>,
 				 <0>,
 				 <0>,
-				 <0>,
+				 <&pcie_phy>,
 				 <0>;
 			power-domains = <&rpmpd RPMPD_VDDCX>;
 			#clock-cells = <1>;
@@ -998,6 +998,163 @@ tsens0: thermal-sensor@4411000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		pcie: pcie@45e8000 {
+			device_type = "pci";
+			compatible = "qcom,shikra-pcie";
+			reg = <0x0 0x045e8000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf1d>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x1000>,
+			      <0x0 0x60100000 0x0 0x100000>,
+			      <0x0 0x045eb000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
+				 <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
+			bus-range = <0x00 0xff>;
+
+			linux,pci-domain = <0>;
+			num-lanes = <1>;
+
+			interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_sf_tbu",
+				      "noc_aggr",
+				      "qmip_pcie_ahb";
+
+			assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
+					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					&config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
+
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			iommu-map = <0x0 &apps_smmu 0x800 0x0 0x1>,
+				    <0x100 &apps_smmu 0x801 0x0 0x1>;
+
+			resets = <&gcc GCC_PCIE_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc GCC_PCIE_GDSC>;
+
+			/* Controller supports Gen3, but PHY is limited to Gen2 */
+			max-link-speed = <2>;
+
+			operating-points-v2 = <&pcie_opp_table>;
+
+			status = "disabled";
+
+			pcie_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0x8>;
+
+				phys = <&pcie_phy>;
+			};
+		};
+
+		pcie_phy: phy@45ee000 {
+			compatible = "qcom,shikra-qmp-gen2x1-pcie-phy";
+			reg = <0x0 0x045ee000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>,
+				 <&gcc GCC_PCIE_PIPE_CLK>,
+				 <&gcc GCC_PCIE_SLEEP_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe",
+				      "phy_aux";
+
+			resets = <&gcc GCC_PCIE_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_RCHNG_PHY_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;

-- 
2.43.0

