Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049801CFA2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789874922; cv=none; b=DWhjLFBTntSFCehhqlve9NVPKtswaTyZMxrUJILAG80eOKoGgs7fx3p9R6zvYKR0yKIc+uKaEN9NlsDIpGXPEl3L4ksPxFT7ToLgkt81OJiw0HUMwCLxwOhoBD5LuIWPafaTWHXfZP0szCX3Tl+lOawq59ZAn+0PvF4U40T+cm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789874922; c=relaxed/simple;
	bh=rc4XDAZoSEw5crJuY4tHdWyxPIRJNcgVL16QMaMSMro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZVdeaNDOhQ629nbF0isX9NIUr+Lw7nxK5PL3tBk2uEY6ZR28/St594EMgwuYE50yZmK0oc2BMHdqoaAfyt9kFxlqgj++cfjvGBDHhSoTXLuHKfGNcDJDJ2hrHdH3VV8JyEEL+rw+xjxPWrJSnaozLNgYtL8IXfBUgTdh6pJ6Lcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEsWMRFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RkMPF2ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEsWMRFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RkMPF2ef"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K1mRv8549745
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5rXvRzqmu67ws4mhhP2e6S
	1iBGv09ES9MANgQedfOhg=; b=pEsWMRFwzIkd2EhTuRa4385YerMHR/kMWZmil1
	mkslR4Eww0oCesFVnNiUsUDXhatGDmySSQOmOmJFX0FL2xWK3GUrfpwNo0oNPG9u
	h2BD1Uuj8Tf5BUm40Z5ynYeSHh8/KzCd5/FQhsbPwIJXq6pMDCRVAMSU/D62aumw
	wRPlXDOpv5YL/YhzMrJuXLXU9BS4owEEKfmojMYJN/RXn6e0WHV+s9Cq72k5PDRj
	fFtEQHSEej2yHASqjN7R6TvCHeZRVMFOne4lb8Rski18TO9o3uDONYXj5kIHT2PV
	JSbjdmHA0xZsdF5RH52ycD7LSTxZhAyCDrdHhtukJ+Xc+F/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5ej20q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:28:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2399559a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789874919; x=1790479719; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5rXvRzqmu67ws4mhhP2e6S1iBGv09ES9MANgQedfOhg=;
        b=RkMPF2efnCQAfrVhiRETc9BltsMQtIlFZDOrzCMG3nKzL/7WhUbLfMaqh1lNL6zVwI
         eN0hYRuoyzgKeOPrJ7beWWYr56xwUVb6z9+lYnKCw0fm+wcZwXMajYRywAQU1dKvpfEv
         h7VlgqsD3Vv6tNi7wzvEw2tx/Xs2gE63eVZ+sY+RPXaJKNNF3iQDH848DtcQ7mBsndX1
         GTCHAPa+S5aOBMdt/NA0S2RPrBK2K/gkeRlaqWrzF6lRuxC+mYcNvs4BXtA25DMuLPQd
         O1L8PwR538sPqhkeGQXPphZGfQ3F4+2VfPXZA1MliDCiinCU1bEBA8eI3ZOfVRDKHU+Q
         5zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789874919; x=1790479719;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5rXvRzqmu67ws4mhhP2e6S1iBGv09ES9MANgQedfOhg=;
        b=0FSGM3N9821AnKyYST3L+v/9WUaQwtPVvxpXaIv6Chk/gE8kcfy+DAJV/CZgZV7/R7
         qFv8GpkMlSj6b2+GTNcJj/ecUzfXPQVkhXrpXNKEhQo3T1K+WHFk6M1ckjkloeoGg9Hp
         B9kDHI90JDnAu6Z4x+LYJFi1+K1kL7lAprg3zmIX5PKKElddn8oo/m1/ya1M04bUDpjl
         G1s7/4W3brJp96OubKxqwbXEw/IK9doMopooMAcTQhb1dlLv2LDYiuW0RnTOk8Yov9sM
         /NTCA9sizwDpr8nG7j+jSsakfwetMmYlQLLTh4+MRnxu2z3Gqk0JBmLkqxVnzr2BkFst
         I+kA==
X-Forwarded-Encrypted: i=1; AKwUvBzH86WvLhRx6nvgkn4ijOwoQOMZCL30t1m9IMeYmLR0AXs9Pf1AHVCbTX/iR5w3F74Y82NNOvLAVLtMqOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kgunNXKgmh8XrRciCRlRUly8VNZ9jWYCY8cw6aC7Yvyka0JKeZ
	sEqiumOqpQmpWtZF6E4iPcdSTQr5bFOBOxZ4903c6wW6z6nwu4jab8Fes23ac/3smTSyrwBKYWX
	k5noaouBUwr0xlE0ApdUy/dB8Lts59/j36gIeV/4xBb1X/K8g1LMuftr65OjSgljwoBE=
X-Gm-Gg: AYBFou3Sg9OZPz7VPiJd+sCCljnzsUdU9SbsJeaMopkU1doD0IA4SuuLYYjo1uUKdyG
	dHWc1L2n/HrhPJfS0UNLeOAqnbS4hc24XXrH8NrDe4cVLXGBU/XBnKAdcFpMDK7PaYicuLY28b+
	xjWr+67byf2pjSGnBignvBHdL4H2bSVvUJ1gxtGwhw8RYrku4/6/pNPSpscJ6HzIon3Od3VFKcu
	YSrxS44WUtUD6FO+gNExuGsQzH1LGbIQAhO7hbBxfc5zSy/0EI3xQ64cDI/BOCpm9KbssmetSFc
	x0Yj3egJUSxIftBm9QvOXwmOdUG9lr+rP1EG7Jlhmyf7ywFGrDrfxSt36bOPdpFwg7mSbRxmdvK
	0HJHiixA4gea+JdK1rF3E3R6nMglxOmpNxoo=
X-Received: by 2002:a17:90b:52cf:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39e54bd0941mr12283154a91.15.1789874919352;
        Sat, 19 Sep 2026 20:28:39 -0700 (PDT)
X-Received: by 2002:a17:90b:52cf:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39e54bd0941mr12283135a91.15.1789874918802;
        Sat, 19 Sep 2026 20:28:38 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311ad4esm9298965eec.5.2026.09.19.20.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 20:28:38 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 08:58:15 +0530
Subject: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM9Sr2oC/52Ry2rDMBBFf8Vo3Ql6WXK86n+ULPQYJaK1nViOS
 An598o2pYGkXXQzMANz7p07V5JwjJhIW13JiDmmOPSlES8VcQfT7xGiLz3hlCuqqICTGzpIh/g
 +GvBTAms68N35Ajp4Z60KVilOyvpxxBAvC/ptt/Yjns5FYVqHpMOUzKLQVgt/S5tv9NHcoW3sf
 ez3kCUwUFTKptmiRuFfh5Q2p7P5KKa6TSmz8COW09X2CjSQu+gBLxNkXoDSWxsCxVq75l/A4vC
 eSAFD7QxnuhH6OdGahDAP4tRWNWuwtnorHVWOFiNWUh8EFimupSlxUu6Y0GRO8RDTNIyfy78yW
 2JcX8PY76/JbD5TeGpLkQzDo6mZnfkPT//Jm2PztRUCUXAmnhy5u91uX2J3859dAgAA
X-Change-ID: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stephan@gerhold.net,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789874914; l=5428;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=rc4XDAZoSEw5crJuY4tHdWyxPIRJNcgVL16QMaMSMro=;
 b=le+NqhnaQYvqozLT1aYojD/hrG3KMYw2nZVuYzAxlsTEzVIz4h3IKkvQ9LbgU++uTsRjrlKHH
 FKaBtGoygDKAeBH/1U0LhNaT1pIbhIsBWk090HwRtQ28d1cfnoxXqNC
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: EdcJzbKPax5N8YfqpPqHfMIy07r8iPgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDA0NSBTYWx0ZWRfX9K76bYba8Fm8
 CHLbreaGpmyn2wQHAjF90na4apPp90sOKyR4EY8BOhVYOjIGt8E4K8LTUDpBwgbEtIU5vL/4pSG
 TIz3ZwvcL6wX6n0aA4rDrPwfniHqUMgfVsYpjyMpVjMp5nPrlFvWYMcazk4rsL0DdDjJG0koZBJ
 aHY3/BpOHGPoCj9BDqquLIxwBiRlO/DgzY5Q9qJhRmQNfMoxwPH81xPsQYdCN4JJcS1FUZ2p5iE
 5usOKHR+qq3bR0PGrS1GMeaMBbrTCVBNvxXwXcKUR4t1RjUh/vIx+LXMuNncfzEcS4QBtww+JWr
 +hBqaIgMWlxAbLydI0SdOqzlEjyowuVMdCVPojqKQbBq5yqbwzr8Zer1Pwt4JT7uvbo0PAFYyxW
 XK4MuTkZGvubSTGlVF0TrmYQvwZVM/9vAcyY0pgerwIIhMNjSBwlAoWkpDW0JwGBNqk2QpgNaqf
 1aaw3bgyKeVL78j50MA==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aaf52e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1luV-em0b8dgtdwlMEUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDA0NSBTYWx0ZWRfX8Fdu/+x+netY
 SkInJy5A0i5f6eZTQyaS02VC+9zGKnlRjHgtcusTVyksscXd60EdWn9BfzqSEMf2AOF3/6NAVHa
 UBLQBd2coDg3Z1Pj7smFr7PD9UL7Ba4=
X-Proofpoint-ORIG-GUID: EdcJzbKPax5N8YfqpPqHfMIy07r8iPgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200045

Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
to provide modem data channels on Shikra.

Reserve a 256 KiB restricted DMA pool and reference it from both the
BAM-DMUX and BAM DMA nodes. Set qcom,vmid to NAV so the BAM-DMUX driver
can grant the modem access to the complete pool before requesting the DMA
channels.

The 256 KiB pool provides space for BAM-DMUX RX and TX buffers and BAM
descriptor FIFOs, with additional headroom.

Place the BAM-DMUX node below the modem remoteproc so userspace can
associate the resulting network interfaces with the owning remoteproc
through the device hierarchy.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
Changes in v3:
- Add a shared restricted DMA pool for BAM-DMUX mappings and BAM
  descriptor FIFOs.
- Add memory-region references to the BAM-DMUX and BAM DMA nodes.
- Add qcom,vmid to grant NAV access to the pool.
- Replace and supersede the separate BAM-DMUX VMID extension v1:
  https://lore.kernel.org/r/20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com
- Link to v2: https://lore.kernel.org/r/20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com

Changes in v2:
- Move the "bam-dmux" node below the modem remoteproc
  ("remoteproc_mpss"), instead of at the root, so that userspace can
  associate the resulting network interfaces with the owning
  remoteproc via udev/sysfs (Stephan)
- Add the "shikra-dt-m1" series as a declared prerequisite, since it
  introduces the "remoteproc_mpss" node this series now depends on
- Link to v1: https://lore.kernel.org/r/20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..4980c125b7e1a45f3793ba2335b6cfd1702eb877 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -352,6 +353,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		bam_dmux_pool: restricted-dma-pool {
+			compatible = "restricted-dma-pool";
+			size = <0x0 0x40000>;
+			alignment = <0x0 0x40000>;
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+		};
+
 		hyp_mem: hyp@80000000 {
 			reg = <0x0 0x80000000 0x0 0x1600000>;
 			no-map;
@@ -500,6 +508,23 @@ modem_smp2p_in: slave-kernel {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		mboxes = <0>, <&apcs_glb 13>;
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -1866,6 +1891,20 @@ glink-edge {
 				qcom,remote-pid = <1>;
 				label = "mpss";
 			};
+
+			bam_dmux: bam-dmux {
+				compatible = "qcom,bam-dmux";
+				interrupt-parent = <&modem_smsm>;
+				interrupts = <1 IRQ_TYPE_EDGE_BOTH>,
+					     <11 IRQ_TYPE_EDGE_BOTH>;
+				interrupt-names = "pc", "pc-ack";
+				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+				qcom,smem-state-names = "pc", "pc-ack";
+				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+				dma-names = "tx", "rx";
+				memory-region = <&bam_dmux_pool>;
+				qcom,vmid = <QCOM_SCM_VMID_NAV>;
+			};
 		};
 
 		remoteproc_cdsp: remoteproc@b300000 {
@@ -2026,6 +2065,18 @@ dispcc: clock-controller@5f00000 {
 			#power-domain-cells = <1>;
 		};
 
+		bam_dmux_dma: dma-controller@6044000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x06044000 0x0 0x19000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+			memory-region = <&bam_dmux_pool>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

---
base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
prerequisite-message-id: 20260908-shikra-pas-bam-dmux-binding-v4-1-6044889e7e3d@oss.qualcomm.com
prerequisite-patch-id: c3d19e8dbf9451f9f8155c86c21a4e6b5dc796d0
prerequisite-message-id: 20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com
prerequisite-patch-id: 30840b157a197cc896556c0152b26a00abba0010
prerequisite-message-id: 20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com
prerequisite-patch-id: a9c2ce26fabf293f94f384409991f8a9b3afaafa
prerequisite-patch-id: c4d2876bea87e825468eb3bd116bfdf5a203f7c1

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

