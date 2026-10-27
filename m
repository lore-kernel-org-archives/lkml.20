Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100734;
	b=Ev1JiAvsbz8ch78ZLxzpYbPwDT/C+PrfBpY7SmUPNBvmRPN5vKh3p14iUx+KziiSPBLG
	 uH3q7uzd5zkKJ0tQ0EvZm5PPizuXbBgYRtfEHESW7QK4Z7YvexH0rNrGRTk7RdmaM80Vt
	 NKwT92rKjk/v8tvaSVJ+pHXA7HoiiXNVA0BSjBkj1Y5H/K8A/fmliCZGync0SRmjAB0+4
	 6W7XWvCh4CW3b8DVlj/1P80EHb4VcWWV3AoXGtrMiOrTlIJBmmTE5cJHCb43v2MXLuTfH
	 n6APQ5iTurK+YvFKqELzq+kGC29WEcxiOwkoERNWwX+xaSwrvZLLwMin0/w4C1DjrXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kgO/kXOlfCPm7NUchVNHQGlMrPYfe5uI+Ze6iO1thcw=;
	b=eMxWDX7XVeH/3INhT1v5TW0vGgzMZ2BRp8UOyeI2AR7m7vrUwkTnX8d+xBjQJgxdlcN7
	 ej8yxZMrMtkV7JA/ELlIftIOpO91weV5bXqs94vClqpzKcJ8oiobhpknFcXHc0QFbMnIh
	 98p726D5HUg/Mfr+M4Oz/Y2JjdkjwmCOYsdo9FoLEYB4Ea+DG2RveWt5fFS1LLbnsCaCl
	 O5ec7kocOnErdj0xbESvd5iSpf1NUIplqq49jFQFC0aMbPOf4DplOfFgHBgNKu6V0kgCF
	 CBUDz8fE/jNs5g1rFmnEoFcG02Xuv6IZYN0sjBpd8rrtXZJMmNR111xkVl8OkcY5Q9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFU4QL3i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcYV8KhI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DEE606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1DEE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFU4QL3i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcYV8KhI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBP51615033
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgO/kXOlfCPm7NUchVNHQGlMrPYfe5uI+Ze6iO1thcw=; b=BFU4QL3iL1LZyXEt
	50/ciXXuOgo6h5o0zfthlizBZ7jfRpMYOIxJJKooZBEV2GFjYiBprK3OYA24wJl4
	MklPDMujlzcs8CaCQQ+bxCrxRMLVx6V51YVX7UIljQ9UytvlB+oOExDiPUoOWxxK
	ZK4dCr0CeUz9EYFED4XW2d4KjZqWAHpxztnT8rIOJ7VtV4vr+0IeDM/ZGnhSbZ2n
	6Y8pkY8ij4lxb64vXUdOaXMhkechLUOVq5DvvuRfLOyoqHmZIn0EZWsXCr7AhnwS
	5HVTnmIgwvOcb5ALG7M1wQ0FS+007E6aUyZ6ndnuw0SJWWXOAvq1JHfQD9g4h4XK
	Kfa7Eg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rxqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so4689613a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100732; x=1793705532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgO/kXOlfCPm7NUchVNHQGlMrPYfe5uI+Ze6iO1thcw=;
        b=EcYV8KhIB28EXdB3wuZaZbsK4IMHgoas6rqK9TQLXagW8xN8Q7joutbIxoXWUj1URX
         5AqyTh2T4SNm4Q0NJG4r6DIVflf4ZBdtMTdjyPPsQKOESD75Bz0FSdVYGwKXj2XEeDC1
         LhdYal4a/VxNZNp+Zueeyh04QaUKZW3J54bmkN2JqeEPFPry4cV0JCzCVuv/FuZq/vEs
         0T22mN9b15jyzAb24fY6tHaUaThu8er5FbaNRxN2MNARWZHyqjVQxHuphmfrwHZKu4oA
         BFFrUaZ3RdoRcZXy3VTsCFeVenrMA5cLA0LTmrJyS5JXaFUtyy0A3r3bIDUId58aeSPN
         liPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100732; x=1793705532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgO/kXOlfCPm7NUchVNHQGlMrPYfe5uI+Ze6iO1thcw=;
        b=H+pYxXgdsd6v7ujWENaFXC5ZXo9suWhDr/Sf6fdSXPiHeDmp9slZay19mpFdMf0qKx
         3BgmdvwzEorFAHXpEA/SjCyQ6aykI5wb1b88X7PJOtN30EQvv7x7lQ3OKYS/qtdrYRbt
         uao0yMiy9aT4Zt3SxAKFEcpKvd7upHR6CXt+MzL/PVXfXofq4sl/VVsdGiNblFihPkdA
         BTVUyud8VQ4d7Pawm2cgk51rDza/gOsdB5w2uReostXP2sh5EfPXFNdnBEZKjpplzA4X
         Kqqc8dMdXAcXh3sdVcZsc/A8loCV92LCk0+vs07TZV6OlmvnSSJ0iZ/qO06V/vAUOlkG
         Ah3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzsppwZkYJkSJWXUfpQOZsMDXpzYH4SQ2xpILSfPfQ1J7HWw9vGxia+jDN7glTH9U72d1GdZKO4KTmsr0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPF7hcSvBVu3HPpWIoQN4SuNHMcKYlVPKVxF+HKVhXbEIHDpdZ
	Ftoo1tx5zRuyGau6xsUISFU2JRp3HOtHsSomhIfjf2t1YkDNgmupzKbZX1TGDEBpv5E8/LQuoJ9
	jCPyKJMaGqYozSQvt8SHT2US99u1eKPemzRuD773RgXVkSWnb/sYjGkdwVIJs7x46zL0=
X-Gm-Gg: AYBFou2D8sTp0eSk+lbiPRIo91qVHQF9qLm4Eowd7s9JUc5yhjySpeLFdRMdKFnVJCw
	rr3SZX2TlGNfl5ELJMxVVpbbAyZoNB7CyBPYoYfRO12I/P+MHNurLeCIvcOugiRNmKajLGsTZTI
	wLmdKKR/KeH9qNCYt5es38zhVN39vqzpQQkutfc5PX1a82/h/9ym/iUjUcs+Wvzc7XKBTwlS9mk
	E/0bEwtUor7VDHMFp1MhTZJggzP2JFIJX9fxK1hT3G3ICrUwar+oYJmo8n4NK35wXpxEQrFeVRD
	Tad2Y2nd8qJgHrGX44yg6XpF+59CFiCzukmX8NG8cXd3BK2zLhm63dz7xPfsYoByf1F2auq9PWB
	tN62KNKrUv/ITS26jB3p8GxyfdthXazW66BAlueBXjerRFPkti8xTrCjfJ3PyKqp6F4CPog==
X-Received: by 2002:a05:6a20:918e:b0:3de:463c:7fce with SMTP id adf61e73a8af0-3e7bfa46b23mr8395534637.12.1793100731722;
        Tue, 27 Oct 2026 04:32:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3de:463c:7fce with SMTP id adf61e73a8af0-3e7bfa46b23mr8395505637.12.1793100731157;
        Tue, 27 Oct 2026 04:32:11 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:10 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:01:56 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX27Ot3AQzGLwW
 2KyXJWi+DkM9WCj0DQC6y2UfLl8sqz2mieQjtDofAIS89yMz3y89DlhKeN8XNU8oMyOC/iBFOX4
 ZnCWwSUOMuLEy93kX1u/A0ZjmLoXyrQ=
X-Proofpoint-ORIG-GUID: gU39z8xHtfjoY0JK0avX-WfN9Y55qYvT
X-Proofpoint-GUID: gU39z8xHtfjoY0JK0avX-WfN9Y55qYvT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXwdToR3NtXgyO
 J5TR1RyO82loGvBknbIcoGgJTaQjFjtVpBPG83ZY5150pdE9X1J9AHG47GrDLHWOSzOaC5ShWyO
 Vy+LMaP5t82ZRzhaVcKqO7sBNLD4EVsOTUwvh6SOwIhh0wy7wVg1oTOueFSjyVHT3EpETMZD0XE
 cQzSDYuGdcJ94vIdpyykf/JLhDwgSJuIN9GCo89lD8li49PYsU5TxPAugN8c7gl9M8yys3yyenh
 GD5vVPYWn2wY968abyXw3cC3l4TftBTB5PMZ7W5JQBDIKIR/yWXbENyNjBNXHFQzKiwKGs37fPi
 Yv9KWV5WeaBoAi0QcdBgjf8nMQOalKtM8AT8do64DBEXgMQlJ9rSutqwesmMoJs5dzVXisQv6Mm
 83eHKO47pNwyij2BATCgtuLs+G02mA/FKJL/FRDnYEOiEdy13+h+/dbpwKee/Be2b8CY82h9/Ww
 vMUYmFMj/waBp4gPXkw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08bbc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=-0pK_m6zGA9SUU0pzkgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

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
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 281 +++++++++++++++++++++++
 1 file changed, 281 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
new file mode 100644
index 000000000000..7d9a08471906
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -0,0 +1,281 @@
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
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_2 {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};

-- 
2.43.0

