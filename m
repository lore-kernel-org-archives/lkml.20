Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956909;
	b=FNFfGQ7rvbImkIeFzC2PWAJF9qdIq+U4juGc0Mj47KywHG1beO8xRrJQ94eRvdi4zFFr
	 wO3D0wxIB6a9dXaV/rhjUyouODfLKHfDnASM/Ewq1C6zH1Uor0IkWnTL9nRpN7PPMOLJn
	 3F/e2Zd4qHZAIXMXfAOpfNF0+z+PQ5fljselr0pAy0kU5JIjDIZhHIwhGVVa32zYSCxaJ
	 +N6bnsdBEmGl3BDluavQNIdIi8Bj4zKEYehn0lkGcnKF4cCHwlsE94XLf67vIX6St8Fio
	 QX7Y0B4A6PFSdzyBnm9cuo14dH6Wqj8IGzFGFvPkUZDTDYIaEyzL2caLpD8wPTEU2DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
	b=YiFZbzzuD1NptGlrq0hemqGpS4VjYSRDSKuPOGHfVqp0wgLiYT8yhQ7Y3flywODhGqom
	 0varNGQIw+D4/6yry7RL/aZ0pZvdGcGhOvX+PxBvqcoczTmcdZoMJ2GHMBQ2l8E2x/T3r
	 h7AFAHqEqZ6mwKP27tcLRnoE87iEJ3N7ZnXFpoUjn2ym7kZq7agRUW90gdVRSltc3I5oW
	 nCH4yytFt3zUHGZN0nHlVN+mAlTM+/equfCxdJCJkiqlOefrWJ/rQUmBTITw4JssJZpzx
	 NkvwZBDEr2JW3/5LIDpTsy/YHzplB7PLCarBKiUKiCrG8IV2X0rZCXf7yDExH8E8gwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Qzsi/72D";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYZ8YJ2H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60D606EE9A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB60D606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzsi/72D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYZ8YJ2H
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7qn3243883
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=; b=Qzsi/72DOJQ13oqI
	mXu0jlLkGfUFwwgjMZ8Yryu7Vd+HNv5eIzTngLVRCUC/9n05iNdYPF400lD4ddrk
	gXf/yTUA8NByV2T6ZgHJmjzXUppwgHjW5R/On1+LboaLEBrXcDOwi5aDgHi5zzvT
	yUCmyfcJtLDFizw8qTn44JsCBcvH1H7+qTV3evTQ0s1Y9eOjPkfIewA2FDPtDxku
	KBc5is6OgcyYTVtF+hbJp08B0eCB+OxkXJsoOakYQXAC/DlkQP2cvQ90ZQL/K0Pz
	s6rRN/jvTa1MeRnnZR6R80OwaYfpw4XfVA7DttMUHA8jcg4ByZMoV9CnRyrsI1da
	Jbt3bw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa221h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1784089eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956907; x=1794561707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
        b=iYZ8YJ2HGyFH5qCB3AHIwltBaUFxpuhuxwbhbH48RKmKPfcJCfjWJLdv4yZu/0Tini
         kZE/6nKMwPlk+YOeTXQbIM7AfAvogDlFz0LWUaH8pOaErc7gEfZQ16y+oAtNlq9VfGRD
         dbOzEpkxWBrowIomW9kea1t+6yKvSKIL7Ue2Ra+O2D8wpzF37IIrk1q4AOhiEJOPUd+7
         /R3m74zU0zVfba1FCkZnzl982cbAqfxL7LugffoQzgKuxJvcJgD7MwEqFFYFKhE4IE/4
         M+HxHSQk814YLnONrnBEYTYOePovLe1glJ6E7sKFDCn9kS1QKr6+VjaFbS63616Ztsqe
         KfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956907; x=1794561707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
        b=dXXHFld7a8SuHP/2t7Svfg5g04hYNd4djGckyvAS7iTfkg7QWR/s86Fv6MJm7qB/Zg
         1A64lfknVcvIebJT7bXkTKF/dVhxJ9lAqkL6lAuaCAb7waqzwQeb5hnnTW9gm9Rnfo6f
         /kVkZTf4CBe+0Lb3Nzb8wwyziN6OfZyx1lKt4roY0sdFLZ+IT2+yc8wD/EdUrMAmZty1
         CYPtUJi5PVo7hFYjwHd0Q4pKVzNTFUgX0EXV0ewfB+4RHuba7jL6m0qoPYYnBF07zMZw
         +adjj3oY8dtY404JMa3o1ChrXSKdRX6WKDg/ZaCEBm3ZmvoQBvHv9Myjhjz4567etAY+
         dQXg==
X-Forwarded-Encrypted: i=1; AL+hErG/MQi526mzROWhFC4NpdrouN5x4r11qC49OHtC0aw4hQsci/i1HVKpucz+WquSVXNKFkafnVRVbf09gZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DpPuGwZHOtcQdA49ex4YRwICMSr3Afg9iaC7Y5OBQBq71iwFI
	QGg/WzJVs93MGk5mH/ovhYaA7i8qGJIZVNnoH5R1df27/LUMOxwb9SKY4JiQS22ATb4H0lLbgZK
	uJxTGbtb5VDsY6qpsPBPggLnHabR6JSEipMKFCrycXfOEeWnsNNzbmnAmgRlhevdmPoI=
X-Gm-Gg: AYBFou2Ze6smBYDkWFHrNOmLrHXz6ZeI4AUn+yI5PjU+QLIhE34Qfhaq/PxYp7IGDj7
	FOSw1FtxJJpDz6rF06BU/SaKFNBnVMsAFt62FCMktbu+jBC3XibY9Cjlis57CiiW4EMhhLeCPJG
	LtL2lyG5JNihkn6aJHWcWLxGvBLiE8z779eLWcsLESs5kYGABbF+cltHvHa2jPDAXsJje2XwdZx
	jrt+lBo/2AuqDsIt2mom2dvnYusGZGKkXzSfTwoJR4PCk6NtaIHz76rJDbRTnp2RsBvLRxvBVz0
	irReonAkSBSakmSRxlENB+QldwaFenYcaM0MwS+Snoo5s041Ih4XJsdc7lmd3IMLraQ/wGETjuS
	bgzDyBzMa0wgtu8DoDeZOR7pF70BIHWBwNZt+MGW/CTiNbeZb/ZYb+w0PeKDi2PnqR0SZNfu1Ga
	vKCN/UW4rjAmBVdDytaGQ2JzS2uV1xe35odvZSnjn7nnl0juqjJk6lr9+rm97nwp5H56hlztBF5
	gJ0OA==
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr2886623eec.21.1793956906821;
        Fri, 06 Nov 2026 01:21:46 -0800 (PST)
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr2886579eec.21.1793956906180;
        Fri, 06 Nov 2026 01:21:46 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:45 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:58 +0530
Subject: [PATCH v8 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
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
Message-Id: <20261106-08-dts-v8-9-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c2b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GVWKzDYot3hTMZ8E5o4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX8b2ut3afVJNS
 0tWY7sWSFDb2uiH6Y1Fr6V1VldfRYgJww3llS3scTzhhY5oULDfHgeiLMLy+z8j1gmY0+AJhzUq
 06m98kgGfB1eZSe64Frdnu1mbz4tl0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX33O748VXmOGy
 wTJLmwbpyiuWop9iUg4kazZw0qxjito1kjVT8vVftJBehYeCIoYT+4xmfQ5O0h+dpBPX3eUvla3
 mF5Ze7BBlYSbntq2xgNRlpZtzn0rwyaT5eXs/m7LI1oDUJpmsiHIekQMbeaglOcts+3CsFn2QuB
 oJKWP1K8BQhf6RjbaUkX3RkoOdcVpdXDcPdPCiYKMGmpWnLZgITeJDAWn77ipmZfqhgXmegCPuE
 wkxyBFeznfJP0VVJZjFbpeji9ohdgaMU6qRitTfejhf6fzh+oB6MVZNhHkS+25Kd2Jbu7PXIRM4
 4hexLmoea6UOm/8TcX8vOgCJIdZSWJKGM3KJB3LA1RNM+dBTZ5mihLFTNnq2Q0Z3d4JQLuXdMum
 wEHm6O3iWNf2OcY3fRDvDf1MlHtAgeVUUC6tv26ysSP1YJNS5qUq+CdxIKRF/nbdoR6nbrwpq5P
 9PLXQL7XWJ2iqgQY4iw==
X-Proofpoint-GUID: XgiuYpB6L1LOmaDtuFhQ3A-K9d6LKPiM
X-Proofpoint-ORIG-GUID: XgiuYpB6L1LOmaDtuFhQ3A-K9d6LKPiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 47 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index b32daa7c1559..8068dd0d2119 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -191,6 +198,15 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-pins {
+			pins = "gpio20", "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index e4a696a65e55..35cd55881969 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -160,6 +160,14 @@ opp-300000000 {
 		};
 	};
 
+	i2c_opp_table_32mhz: opp-table-qup32mhz {
+		compatible = "operating-points-v2";
+
+		opp-32000000 {
+			opp-hz = /bits/ 64 <32000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -435,6 +443,45 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

