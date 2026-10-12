Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74470361DBE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785915; cv=none; b=AMvUKAztvSxy4YyCCwF8S6u1+W+/dX0axkrW82nq/KboMrrxsMV/iMhxA0xIaYaX+jxpW3ateW9xY6WKsXuqhQxN7SBNfj9JrxGUIiowjL6SPqOc77H+IJlSecHzrlFl2VYo/4L16k9i959A5/YTwUIWrKpBi3GWv33cV17xDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785915; c=relaxed/simple;
	bh=1sRg5CPDbFiFv5La+GzJHDw/0Klk1paS5Uq0/nZWIrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MkWVz9yaoKguNhoBC+ajlZAoyePVdCFnmwYgRnR6gkDol6Pc9FnIaC+0wXkPG2GfuXKKAVcfVYNOGVCi653oz9L6XzYCPN1t4Y21H5gmJaXk/fPuh7Es3Gy8fL5mgObh0pba/1zBCzQquEsQGG9hNsHdbnrC/HEV2XbzSDcMHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKXZN5Jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwGTcNJX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKXZN5Jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwGTcNJX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hEM474937
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOe12GivjwL+NAZlI6bJU56+LpJd7ckj32c0Jsy3m54=; b=BKXZN5Jnvu+hpLtu
	s6mxlofZkRqMjEYkUsdAcytCy3XhM7x1fSngoTe3+ApnQo+bBio6KVDgvaG+644n
	R6CGoVTgLjGRPL/PCv9nn8dwL+y1PxJvDRFgpdg4T/YLQ86P7QANU7YVMjrrakSp
	iVtXRdfkH7BQPMd+8BKtoaFrw4Q9WZKm3ok4zj5OBYISO8WF5LEicKtxkf4PB+iB
	Tnwp6ZmBVCP/8bACvRxTQ+GGwcm13fsCssKCJpf2bvjX4jRJwP3lhIEUq5L8WCnO
	ZL0j2M8BKDg9zpqTAmN08ACyqxrNdhUplMbsFK0uBDvJrh9mjer2zcCxutBRv4mc
	pcubSQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9vtyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ccacc75a997so551375a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785913; x=1792390713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOe12GivjwL+NAZlI6bJU56+LpJd7ckj32c0Jsy3m54=;
        b=GwGTcNJXcq5QX6+IU+kaPbxSWuC5evqXAnhUUcU5edoWhLOCMN4d67gWFWMG4sDd96
         7y1z3ZCHeWJ853MsJjzLWDlQyii9t1Hi79U4e2owg30UiefDRqmc/0CB/Nmzh+G4jM8H
         BZ7VKiqQ+KjrZYXSBN8gduZLZEmUX+FM4q0+eGBLAXNPBBS5UGpyjqbDbS0foQsI8Cqj
         Jx1CK9C6yhVPN4S7IdP1DfGDQkbuJ6s49xUl2piA1SBVen9BaDTw5Wgmub/JL04CJ5n+
         pMzyDva1OLSMOJcP7LzWAfZ2STVqs4Ps7HWVwAUbPQPXPXbtqrwNSXLoH8MqKmTBddg1
         rM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785913; x=1792390713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOe12GivjwL+NAZlI6bJU56+LpJd7ckj32c0Jsy3m54=;
        b=xwG0Z/5j3/JiP6oBtoMb5W6KFRuQ+4KohMqVEWXof0GkQv255JJc+dLeH/1U9+/pJ5
         MKI1wKvqCp5o8FZM0kaHD1IBX2WXfjs5ecfZ6VojAcvSLLzTv2h50YRgyzA8B5I/qOYV
         GGdpRDGid4ESDEPBaEjumGHBal+M7GXnmOul5M4IDt62rABDkP3yL7JJ+zcunYqlpb6A
         Phgrei6wAlf2X3dEETeSozA2K9P6A1+jJCvN9V/Iwe3q8S99UdnJBiEbBBOIsJlY8IHu
         lESzzDCKTxRK4afgpBv3Q4x/EjxhlYBVpAwNkX2SRnnxVO6oGD7vdHrqiotwVlb0EFwI
         WAsg==
X-Forwarded-Encrypted: i=1; AKwUvBz9f5H3ZwiJ+uO7Ev6oToZj1lcqM81bxG74wh2HLFkZ4BPE/YxgJ8Y2PWEx4gvorKHVy8xyw6JIsILD9TI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzSAFmNiY9aCfBk98WeprkGQubnITd2Mh1qS+M+y5Q5F8BKwsn
	6ejwESKCEiAlZZTX6dUxtpqlJrtABgy0YH4o9gkqW3dwbVAnbSgvHGdDQ4EQT316Zw2LdJGyC5M
	S3edMgAkT7J5LkI04GwNMsGq++bpmzQMFMFFqpAFwETqawLz4Np5oUyuY3Szvb/xJJGaQArwMC/
	Q=
X-Gm-Gg: AYBFou2NiPuDo4YGIzQJtcrJjBWZS89ayM5xTdt4qdtDm/WyV8589wOFcKx605qR4F/
	KLZtGCCoPZ4/5naTmYKu+hzKoNMS6ayF+H9XIVpgKF5YuJ9rM9uuz55CbJdix2fNv/UTwJOlabE
	B5Rc5OHefwNZpfncCOhNOaDpEraJ8t5LTbpLsvMYMvQZ2TdnDu9cuQbybHcuB/RqNIVgH5gEmEF
	KXnDPrXRHUChrHDZI2mJI950ZL2OdX64eVPsFobWxF/EmaOGICEbSfS+9NiaCy6lc6ejoKntlh/
	Khis1EDibC6RR5sx0aWjxC7K/NVo+DEwEnyO26TwhnCngGXhl4d39R9EXiqibQ/7BtVSglRV7B9
	mRG8fB7d2EeCHLZp9m1IA
X-Received: by 2002:a05:6a20:244a:b0:3e0:bda8:1628 with SMTP id adf61e73a8af0-3e16bd94d65mr8592099637.20.1791785912867;
        Sun, 11 Oct 2026 23:18:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:244a:b0:3e0:bda8:1628 with SMTP id adf61e73a8af0-3e16bd94d65mr8592078637.20.1791785912366;
        Sun, 11 Oct 2026 23:18:32 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:32 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:46:27 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc7bb9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=dNQKF4CCghH-XP0Wq_UA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wcz8W2mn8_pxb1S-9l_tf3XT3jElHwD5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX4PzTRO+fvuR9
 d0bkNmPM92ceJrRydKppcEoTH2bH4uWYfO5CrMkQznp95y0b57S1eOFSPZMx1OdjsvD0a/n63pv
 BnclANt5CGJrROBAZD8y+mifGqpARmdAGN+0jmTZvH1mLR2nHM8lKL/s3XCZpiXaYQqB6mpHbTN
 QCMnaw/Bkn9jATRGQ1TVBdX6BduuWBGSZVusEq2hkQfuGthB2wc7tYTEKxWW/gLJHVT7jL5TEdU
 6lYKtLJU8C25AdOHD6TpsgWiFP3QETOJj54UYaCRgpbZoriJhZo1zAKuguHQ66doMd/cAVMRj0W
 UzsMmjsfgziudNSqmhPnusnQz5MjO+L1XAV6DARu8+PB6vV800xyo6iuepK3SNVQMjmXqd9zub1
 sslBamAEUtBXJ8dCvT8x2V3nm4zgZkgXD6jz2zPi4LTPVXqOAOOkwRz7qSo4F/ozkD5j3UMGfT9
 Ry9v2pPYEwl6A7qZlYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX3CfAhQLNoAZ1
 q4rh81nzbpge4zZ6ZS71fB9hSI5j/6xuloUHaILHsZiVc0w/974/u9ocg7oCimeXjdtGsEdJTsZ
 QaB7P9HKUClajqW3Ko+f8PCfbuAeEMY=
X-Proofpoint-ORIG-GUID: Wcz8W2mn8_pxb1S-9l_tf3XT3jElHwD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
Lyra EVK SoM is a compact compute module integrating the QCS615 SoC,
PMIC, and essential connectivity, designed to mount on carrier boards.

The initial SoM device tree includes basic support for:

- CPU and memory
- PMIC and board-level regulators
- UFS and SD card storage
- QUPv3 (I2C/SPI/UART) instances
- ADSP/CDSP remoteprocs
- GPU

Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Co-developed-by: Sayali Lokhande <sayalil@qti.qualcomm.com>
Signed-off-by: Sayali Lokhande <sayalil@qti.qualcomm.com>
Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 251 +++++++++++++++++++++++
 1 file changed, 251 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
new file mode 100644
index 000000000000..15124572186a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "talos.dtsi"
+#include "pm8150.dtsi"
+/ {
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1829000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1a: ldo1 {
+			regulator-name = "vreg_l1a";
+			regulator-min-microvolt = <856000>;
+			regulator-max-microvolt = <856000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a: ldo2 {
+			regulator-name = "vreg_l2a";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1248000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a: ldo10 {
+			regulator-name = "vreg_l10a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a: ldo11 {
+			regulator-name = "vreg_l11a";
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a: ldo12 {
+			regulator-name = "vreg_l12a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1890000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a: ldo13 {
+			regulator-name = "vreg_l13a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3230000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a: ldo15 {
+			regulator-name = "vreg_l15a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a: ldo16 {
+			regulator-name = "vreg_l16a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a: ldo17 {
+			regulator-name = "vreg_l17a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vreg_l17a>;
+	vqmmc-supply = <&vreg_s4a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+	bus-width = <4>;
+	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vreg_l10a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17a>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_s4a>;
+	vccq2-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};

-- 
2.43.0

