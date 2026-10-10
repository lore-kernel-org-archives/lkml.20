Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B301E374A15
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617322; cv=none; b=aS2L4IvRq692szyaHZk54wFJARj3nPZcDxcQEXfPDMMxtl0vGfOae/pBP76H+Wk2XCTl6qw9y7kY/MN9Aap92NFbsgTx8Vd64peOrHj3NRbvVMblOZZB867fUIIVwF/g+RokrvqWPEbTGgnk+HBq+xNMeWapXT4RJZd2XqCDtRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617322; c=relaxed/simple;
	bh=2PycBXGVgY3RND2Le7tllKHiCDXfQ6uF7dvtV7xvn3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzuQR5NZlMuA7ZiMLad1+loEdEdEMmW0zCaStq++sTNXdkKNaoS6tndMP/L8cdiv9AS3tQ201USbv5AKSsgbT9SyttgsXZ0JS/rpFcROOEgHfBTYw7Hl+b37fiH3fINsqII4vKjJHPvlwLYH6R0jjZ1qfozW4V9zDegpEZxT9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eulm5Ywj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DthkVwaX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eulm5Ywj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DthkVwaX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A3Pax53692285
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhn
	c4jYgCRU=; b=Eulm5Ywj/qYoRQPXprkEDtzzVbkJZODnFA6lvz1M60E+Di+Y8Yp
	BgRYhxX+ak1g1yd9gzyWfiufV0hWOLmOX0SQtWJi0Ipuf8noNDIAat5ANY8/NTvb
	dzhTjcfzerXiBedObCbZI/05elQc7hngwQYOK+d2UVpjQvjEq/llD3aALKIIc1zH
	E86SFAOWWa6nZ+5ZPlE7mz8OHTMbf2X6TGq9FAGAztlnATZhA1zV4DWyV0op3Yhi
	Lb58Vc886U1dUjLs43x2f+tQC5keHFHnPI5FPwYr0o5tdfKSOsQp7e4TMbVoyA2T
	RLp9CExa3RMXmE9ZeFpxx026hMNW8wFGUAQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7deugf94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:28:39 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so465820c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791617318; x=1792222118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhnc4jYgCRU=;
        b=DthkVwaXjcegH7eEvEap2eIZCLOdW9Gm9b2NYncWAwlODT8LZypHR8li4cBf/SwvER
         2wnlmN2H34Yg9GJ+c1SOFNLBxlOaOhEtLROM6KfILiBELMfNjK2jo6kf6/91et0nbG4x
         QV+UmUZTa9zKQfTRFMKZbkS+dJ2JDgCPNH3Dhfus9/eKnOk9gcA8o+veS1IXmCREoyw9
         DVZ68ogmesGmovt4GG6qUgdCNQqE8dpZme9mVTtgoh3DCsfc54WRjjvlmlTIAOHgY6ZU
         r7fenzTVq+Hc0gqMVy7V0SWKYDLxz7phwlBbuDBSeZRRlyJUtt0HsF9Lj6Ocm3YmBpyq
         xjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791617318; x=1792222118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhnc4jYgCRU=;
        b=jf7mkjJutaeNF9XzfscBTPx/lfwOjD6vKNhFcJvtpbAFOgf5rx19sR67zo6T6B0Z8j
         HT2AMsodnsjGXavlyEqPG2NVq5N7SjsZPEMkyC+emwtzMdL55PlgmyHxtOi5Xb+SeiHf
         +HfXjRyxl4dpNsdHQvrc5zw5gzdrv1eIZ4BnnMLwo324Rk57U48yxLSiZjAf6Ngi/a2W
         an0uDRTwDJxokuGCXczlpttP7Zqg1L85ybxlh1M2RqRoJiIvk6fQFj/x0oeLgz3Yzt5i
         VXaLknAeuh6gzPdTf7XkiTwKiBs2QmjC7envsVbgMPfxQr3VcwfRDqC/x3wHhgYh6FR0
         dZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjFKWV5yS9gNn9FkLV1QbwBpym7NFXdhaMLsuSaE+TZQx8euvQ3V6DNLAHA2652sL+NuyOIK1j5qdSR1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKW6wrQh9zp0YXfULvTS/bl7iNFfw5zh5vAfbFcXqEmPxcFojC
	+Xz75pYXlJmoTKF5RHdc5EfZi83gfJO0W5RNWPNBZvxknjjBkH9go6HWfaNbSqopyno/14CW8V4
	zEyg1D6oLnV77W4p1wO6QEBH3IQgNYlAf5PpmMapIh9cTkUfgqB0xiHl97kbEOeX8Oc8=
X-Gm-Gg: AYBFou1eFEV86jNeSQaFGB1TJZYQLmSCRLSKM+OD8ErxCsn44N/EaJEBnnietyBsJC4
	fBmCma576xba2U/DMpnifRNHv4fFQ6tSvmicbg61R8AxwOrJXz2vNsw9R479Lc5sJoY8Wpwxwq1
	O157251oT4udPUnhDDpyIXpSkI1j9hVy7ZPZyrBnZ9QAqYTIXv9T5jEYwqNBOYQ36q2IOrCDVMy
	od6ADoyOc38TA+kWVbqoySqEeFGjXZ821e0kcE9isD8kpdZCKtKOs3i1hqlNW9rEtN8w4f5psWj
	Z4TLT4hR1RHunsjMz5mS6peXeaBKaNHilgb0FoW0m4x+Aa3WhI3myqOpfY+UubqygHYo/jwOUC4
	VVEImIHJHRlsCQj73ffTQJkEnqsWagrd2SjHmUZobnSejccYKNBhQwCRalQo=
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr4950708c88.18.1791617318008;
        Sat, 10 Oct 2026 00:28:38 -0700 (PDT)
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr4950681c88.18.1791617317343;
        Sat, 10 Oct 2026 00:28:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm10712985c88.10.2026.10.10.00.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:28:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: nord: Add adreno SMMU nodes
Date: Sat, 10 Oct 2026 15:28:22 +0800
Message-ID: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9W4h-HZsFYukGzTgtqSnGZNO5yIEycEK
X-Authority-Analysis: v=2.4 cv=Aud7T+9P c=1 sm=1 tr=0 ts=6ac9e927 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PBtlRvXRUDiLbXfjrAwA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyOSBTYWx0ZWRfX9tcYiyjarex3
 favdVj7iQh6VQJ3vCmVlxAf9EyEv7qLN6rYJ9+Dc9l3NF4EHG6nuKwfKmr7FbI+P7xAqBcoPeh9
 WaWN4G55SR2vugsLcAiCDFVUh4D4+7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyOSBTYWx0ZWRfX7nt2yTz3yE+b
 HtOSAEY5h77P2FqSwEMy6TkL0i3MPe7N6CVc2X23385ceizB8lbCBEK5IthTTRSzT8ld5WeY3f7
 J41H7tEnHQjreGhINKYs/SiS2v4Yj7aqGdpDwcYofpLKpI/wdkXIc8xWlbkM+qihiBc1NGrJhQ1
 JJCgy2BB2wIfLdAw/Kbd15sVTDbT7NMRRN6Tu2Xkgl6fQLbOY9CP5CWeJ2+nYbxDFtG2s6HW3fO
 7x5QKurh8C3xENOQxWLG1VzEGG2Y0zeE4PIkeo9pmS38v4aMlIVHp95KOUOVgfmE9e23BpcC8mC
 tNMpraP5tcFbnESGLocIeOgst21BHRCoai94Ob31G8uZ4bVubsw1E8x8W8qK5Rx5cL9p1w3YXhS
 W8dUBkTPgtAosq+XvR4bJ6/8eEnlofHdWIb8/yjzDe4tiyzcHlxHHfvJukWi+vw6yd2r5UkI4SE
 1YfVrirqGgDTelpeQig==
X-Proofpoint-ORIG-GUID: 9W4h-HZsFYukGzTgtqSnGZNO5yIEycEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100029

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.

Wire up the gpucc clock and power domain on both adreno SMMU nodes in
nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v3:
- Wire up clocks and power-domains in nord-embedded.dtsi
- Rebase on next-20261009 where binding dependency is cleared
- Link to v2: https://lore.kernel.org/all/20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Fix adreno_smmu_0 interrupts, 673 -> 674 (Thanks Konrad!)
- Link to v1: https://lore.kernel.org/all/20260922111354.533902-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 13 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 74 +++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..867037e1a2b9 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,nord-dispcc.h>
 #include <dt-bindings/clock/qcom,nord-gcc.h>
 #include <dt-bindings/clock/qcom,nord-gpucc.h>
+#include <dt-bindings/clock/qcom,nord-gpu2cc.h>
 #include <dt-bindings/clock/qcom,nord-negcc.h>
 #include <dt-bindings/clock/qcom,nord-nwgcc.h>
 #include <dt-bindings/clock/qcom,nord-segcc.h>
@@ -34,6 +35,18 @@ mc_virt: interconnect-mc-virt {
 	};
 };
 
+&adreno_smmu_0 {
+	clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+	clock-names = "hlos";
+	power-domains = <&gpucc GPU_CC_CX_GDSC>;
+};
+
+&adreno_smmu_1 {
+	clocks = <&gpu2cc GPU_2_CC_GPU_SMMU_VOTE_CLK>;
+	clock-names = "hlos";
+	power-domains = <&gpu2cc GPU_2_CC_CX_GDSC>;
+};
+
 &crypto {
 	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350dd..147d8e595a3a 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1523,6 +1523,80 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		adreno_smmu_0: iommu@3da0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
+		adreno_smmu_1: iommu@98a0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x098a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 932 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 937 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 938 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 939 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 940 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 941 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 924 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

