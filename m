Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C74756D6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130185; cv=none; b=LgEu1WB1e2f+FsgupKaxVGSebHQriERdplLhbdAG1LBBZRKmAh51BtSsIQUO8RAxabTRkogVCfSvT82evM59jozOgDf7vxQPtj0PNHayQKam5LrcQbGd48s8sHHhwRNCQ1x2VVZ/GACsTfQdfe0kweJUBTT+L+GU6svb/Uz/YJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130185; c=relaxed/simple;
	bh=v3H5ZkNHV36erG0MxtCb6pxoYV7neyJzdd3gUEk9Vxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=riXayll41LwWjcE5XKyM1Xb+SaATJGvLdYZIxCILp0WCdFsEgVJwgo6PPTD/TsH9SFUm1H83yCR2tmk/dK92HujW4OJSdwxtMysumHp0Nc9dZ+veppK5U7w5qCQ9yDv0QQJ+1dV+oUszvf5k/Gs+1qmWLRytfreDa4OrjktRYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oerqMIrH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bk7VMPqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oerqMIrH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bk7VMPqu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqBA9560647
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uHHyhqlf41DimyNYjZw66Q
	yVIWBkLDkAbwH46LsGtBw=; b=oerqMIrHCRV5/gF/+05XuPyFDRcQEu14T51Sk+
	qt0d8/N9tOBEzMNkFyrPxwLRRTQmF2yeLmeh31NMPG7IjUuOP3kusQIVCybjj2pw
	46YYnveyEnn27ITlIg8RLTsmF1Mn3GtZWfcRvYCwk/xBV8aYwjqY0tRthGXFuGv3
	VZujD6peBu8itg0wU+NEMeTpQ4ylsOPXracQi2+Hdox6p3AE2k4vbbuBFoKjVOUQ
	Kxt1QXIKMYJly5m7y4N42wIVVUwoEnHnCP5Lwj+7QjL9sb3c0w2wfQGvWiieeE6Y
	yfMV9iFT05E4xPLjGTBFo1twOg6USWRSuAcCLnSuj+XcS68A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd39qcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:36:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1070853a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789130182; x=1789734982; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uHHyhqlf41DimyNYjZw66QyVIWBkLDkAbwH46LsGtBw=;
        b=bk7VMPquaYzsKC9xg7WkT3iZ3x+GEeG5xHC7BHqv7ExGN1lTdME07Wi+vMZXR4ndFb
         KPOVIG8POEZHBPpftvghAn5o1P5OMA647q8bmgAJasc757BeFBdcFCpA6ye+QfvWmEy/
         HjTdVMRrcv/bd1Pn/tZMQT3IaZ5H7zMpE11w6K5o7wYH7Tf/97W0SwRFjbFMphyZz/ds
         y94mtPNV03hGVuXeCUH9nfQvScsQh+Mir7ePKtNMdwGF5zlBlCmGKA44LmF1fkFzhgWO
         ogCS0cwgg+L8mFwk0uisLikbKf3ZHfJmRch6KS1/joHVDw/EPx2hyVcSoPeZiLX08Hdp
         W4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130182; x=1789734982;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uHHyhqlf41DimyNYjZw66QyVIWBkLDkAbwH46LsGtBw=;
        b=TphV+9jxSK0aCB4Izn1Kia+iVd9Sh/SbMWEMXBBicx32HK+OSvU9lgx4mluPCSnUFV
         C36yAlBPrnznw/eF3OrSZUWVbFZNgwe75J/TBgvhowq1sQJZC3WUh089APP+MAdeQlBY
         /9sN4QfTOA+97dtf0jcyaOEFEHHES5EhS5w4u8gWdssoGz5iiZF5xL226lyr5+5wJ3zI
         oFWrDF78ZD56yiR3A9ejkfQEBmpnm9fc2kE9O88Kq3yRcYfaN9cVDOCsdpmj7smvGhGM
         OIJl8+GvIXSAiT9eEJCOpzaRJqufc5+BcMwvzUUbX+7m/BU7ZPU6h6Fqj3p3ECvTHxmP
         /krw==
X-Forwarded-Encrypted: i=1; AKwUvBzouUrK+yKV/aquRnBtCbAHvbmK2ax0nacg3JRovuDaKKXERA/B/0UcSlraSBm0UXP2Y0qKNtd3rpTEl1M=@vger.kernel.org
X-Gm-Message-State: AFuF++npm91ggujstrN0FmVKtdzvyqkuOtLF0zLyMmFCQahFuOseHh+U
	hhlb1gYfSXgmuonO0vglyd6cOSp09XhGVhDWvNbXD1TeJXylRIgwzwOsHefjXmIEnmgf8Oktd8q
	gi57bDfkSDkhBZdy7g9n6xa+Xjr9s5U9INk5OsUBwFwINavLvX6dJ3Yn+BW0SQd8oNZw=
X-Gm-Gg: AYBFou1bj7oFvqph6k6LM6ZW0D5w+fci/9dak7dfX2l9YFJlOO4w6rxLDV4s37dtdnW
	pXN5+kKacRu3bWpmPVL4k1ly7/GWtdxXidUbb0HV9oahTscTR0JtkDIHVnA0dHWWhtcWR0fx/IY
	WwIMG1VsMW0ydJOyRfhpSa/pFNWN67XuCRwis86YU/k+jNjOMSdTNkgI3gGzCQGd5t6bz9MAhcW
	yN90tTbR50usrpEJiCM88y/vUhC2+2aAf0VGNDV8nhCOELAd1NcQPe6kl9dTLqgFTQn5HqoSHTu
	KGg5DsLkYZ+dNOIu0Ml1yNt4P0kRAqsh2G6Typo/+SPDs1Ot4ZunjjmM0HdX8aXHiJ5NSahAsjS
	2rNOvViARMqLNPnHeReoHXrpRvy/IwDc=
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr6880096a91.24.1789130181828;
        Fri, 11 Sep 2026 05:36:21 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr6880009a91.24.1789130181283;
        Fri, 11 Sep 2026 05:36:21 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bb0119sm5360258a91.2.2026.09.11.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:36:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:06:04 +0530
Subject: [PATCH v5] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALP1o2oC/33NTW7CMBAF4Ksgr+toMnZih1XvUbHwz6SxKBhsE
 lGh3L0OXcAisBnpPWm+d2OZUqDMtpsbSzSFHOKxhOZjw9xgjt/Egy+ZIWALLTQ8D2GfDDejD9H
 FRM5x3VBPPSghlWTl8ZSoD9c7+rX7z4nOY7Evj3II+RLT7314qpf27cZUc+CKqLVNj75D/Rlzr
 s6j+XHxcKjKYYs64UNSoFclLJIVCF4jOu/hhSSeJBSrkihSB1YrbQi8pBeSfJbkqiSLBEZ31tb
 C61qtSPM8/wH5qYaWrgEAAA==
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa3f5c6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BLctq3pD1h73di9K4sgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ejkJLSF8iIT8FMK0Qxz6xrl3dAmYHUYw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE3NyBTYWx0ZWRfX0g1BakKAVWOM
 RueqK/ZGX1oyD1SVIz1fIoDc94+DoBzlyAvezRM5wuC0fu8XOs+A4C1l2reMZDE/bHUDkq3mN8X
 kKd6nj1mWdUvM35zAkbtJiuUsGGaD+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE3NyBTYWx0ZWRfX5eHF1AZYvbBB
 ryekBKLVajhyfSo1AYnra+Lb9TM/b04Qm1jhPBvJJJmB98d6gT9XDqO/4zHPX1shdJbIaH03l3k
 ryh4kAofnBhM0swFxnd2y9bMBIQt4wL5U0orFMHY9yufr2E+oOXc4vENn+wMVFP6cfdM3RtBOpl
 QZTvSVKVcooRweiHjkJUjLBgd4pIfOTudyXFf35AnAuAobM5m8e8actZzdos348rH1n3WfWCChI
 r0T8PwRDXPE7ssVn9//NypWjeuquUKzHwRzG6Dp19ViR/I6nGYB1xjJAbgJngIE7XbmhX1OK7U2
 vcy6omVlvDv1sMeeSro1CdeWiEOS7kATQLwFC1ParZ41ekbIr11MM+mBVM8xuQDUMFfMFhxDusZ
 3ePDtwz3MQytv7//C6XkrtwlSZ2x4KmGtMPRM3/EVVEHw5HKTHx40eiPeYxaaLP79ENcATi8pbm
 e94RMspPnx7FbjvI5Gw==
X-Proofpoint-ORIG-GUID: ejkJLSF8iIT8FMK0Qxz6xrl3dAmYHUYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110177

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
This patch is rebased on top of Shikra USB DT series [1] to avoid merge
conflicts, and there is no functional dependency.

[1]: https://lore.kernel.org/all/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com/
---
Changes in v5:
- Dropped the bindings and driver patches that are already merged.
- Link to v4: https://lore.kernel.org/r/20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com

Changes in v4:
- Dropped "clk: qcom: common: Register reset controller only when resets are present" patch
  - Sashiko AI review pointed a valid GDSC-only corner case issue with this
    change, will address it in a separate patch.
  - This patch is not needed for this series, after splitting AudioCoreCC
    clocks and resets into different devices.
- Added NULL check for device_get_match_data() in driver [Sashiko AI review]
- Removed unnecessary <linux/mod_devicetable.h> include in driver [Uwe]
- Collected the R-By tags received on v2.
- Link to v3: https://lore.kernel.org/r/20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260722, as the dependent RPMCC/GCC and Shikra base
  DTS changes were merged. 
- Separated the audiocorecc and audiocore_csr bindings into separate schema
  docs [Rob]
- Moved the AudioCoreCSR schema to bindings/reset/, since it now only
  describes a reset controller.
- Updated audiocorecc DTS node to use status reserved [Konrad]
- Kept audiocore_csr node globally enabled by default in DTS [Konrad]
- Collected all the R-By received on v1. 
- Link to v2: https://lore.kernel.org/r/20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com

Changes in v2:
- Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
  different register spaces. [Konrad]
- Updated bindings and driver patches to handle the separate node
  compatibles.
- Updated resets in driver patch to handle HW_CTL bit.
- Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 286ea46d0c36..079a1636cb6a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1395c182a2b1..999b478e1640 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -3594,6 +3595,22 @@ cti@9900000 {
 			label = "cti_apss_2";
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "reserved"; /* Owned by Modem firmware */
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_cdsp: remoteproc@b300000 {
 			compatible = "qcom,shikra-cdsp-pas";
 			reg = <0x0 0x0b300000 0x0 0x100000>;

---
base-commit: ae800ad8819a6d89308031288a6ab6789eb5d2d4
change-id: 20260605-shikra-audiocorecc-85efef073474

Best regards,
--  
Imran Shaik <imran.shaik@oss.qualcomm.com>

