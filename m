Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670234;
	b=zI515ZiwfXyHmBWsTjvxEaoL2NYVo21wDXFV/hwOFcvN4XIHYTtsUyka8UFlZqmumeL8
	 l8SHKegVgwWcfj9wc/vXCKN4r3OfF0PikYUCfbySA96s/JgBsEHurh3j0L3W5KbZ7CCVX
	 gQ7qKby+laz7CTsxFEoCeKOjGq5V96F24+ocqjgEnG3akskstVcP9KMHNAH5WN++f7Frc
	 KMvooND0uhn2T8hLEUluzEc9FIxQ3Fc4kvcO/xz0JnJoa/VyLlXiVxJjJA72QKQG0CDft
	 syMqxfuNtts2gYOg1ttl55eM1hmot8M9r2ud0NYcT9dIWuFD/11I2R7Ke7F9k+a7MGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
	b=U6tQ71DS+XRB7kTIG4G1KA4eI/Yl7kfhW/xPl3TRTerJd75UTPvwUkuxJ46TldKbJoua
	 XVwxV7GY0bwuI0s3RYBVXJPM4hip7oiTSB3LJgsbZmKDqXT+ZkDDf8s468J6B0/xHZq/9
	 fLzGYlYw1w2XirtKBmRwaE5b0aQEt5Md1cBVA64m4/1qxq5C0keZaBasehqBHropwoXeC
	 8pX+QTFzYDeQFE0D0X+irHdO2xUUVCpRGTVuLxLFYgsRdPia0+6zLHmyOpkuRflZiJZ1B
	 l7FbdlOaRex9+z5xGiFfOCMvEHJDig4p5MRrM0lTJuVn8b3YQpceNtWnaOP+vJhHI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDfUdMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuXCzIeF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92C606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E92C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDfUdMD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuXCzIeF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA04Uq1963368
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=; b=RTDfUdMDYIJpOVU/
	LuSA8ohkpGW1wxiLOWMK7mgD3qs4PK7KkkM0htvf8iNzhlrCRYvsycaksRuSqBK3
	i8kN0RnL1zd0A345THiSss7c0aR+UMCd0WHXeWS55DFd7Q+nIVTN6Bs22kfHMn+w
	WZPPgKs1O0wf1LzSPko3A9cbQpFJsws81Y0MG9ZrUvF0cZtK4D5FXyy1AGUZh30Z
	5kb70XBwqips1e4UxJF9WKunutQ0uBpe4D5cTzvHjATIHfwhqj5Mz+/X2oKryVHz
	LVBlP/JKYuZrtrVcMgFsNtZ8yYNBMzPQqio7oQpIIIHGbky3GUTDQ3a73ZpkB4Ly
	F7ttgg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ajy5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso2687352eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670233; x=1793275033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
        b=XuXCzIeFVJs/+8JCS3sHZb9aqIFI3TNt4ckou0D46cc1j6DY0oDnRu1G28/wl5ZMvX
         VF8MK6E/Rj+d8hlqKf4ShSjH1xRpd9pRfikA7rfIoqr/I74+Ees1muJRb3+RYwf8hqSW
         2sM4eqJLQAQsjv4bd2QKMuxLpQeC/zsg2RGvW61H84J7O6rD1/MGOD6SoMrJnlQgzSVB
         XYeoeqq/hh7InUK0zUUbAJs9c6ZQ6UJwEhKisb3Tj18jQqTbEub6Cd7CRlbNNZPYJ4Xg
         +CQg/JFZbaN73X/4kJUVbDNJ1PW4joe4jiYK0UiUNP8xNFhZAXYoVpRI2y9jzFuwxrvz
         NEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670233; x=1793275033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
        b=QD59cOcbJh4L9TPRfNpzzJMNAO2AiJXB0e8DlYz6pd2Pizr4ht4gV1w2TqaFWc8tR4
         O1OkkCCBmstsVfoQdmgLED0EKN6pP2v+K06pwoSZ/X2JWkhMrqERMfYzIdOW4oV5am19
         r+wCgEdC/Qe24Ww6+P45+XqFCAVt0DYTDyXulXJwNN8CFAcPisxAt3IbWaz19NY2a3A4
         rIZviguXM0UfOoTblND3zlfbu5iWJrbkPI4KUC//2yX+CfaztTBwyPov4s962+9YAkY8
         PuGq0/+T18colrqhRnGraeNVH49HR+Ph5P7VWhnQJ3hlF4G3S2EwOIHDzuuKjrVr4snN
         vL0w==
X-Forwarded-Encrypted: i=1; AKwUvBxH3KclbAEA0AEl81WGptGzPtV1VcxESq7Y5JQdIIvdhE4OD5wxjwaiH/1fC2e+YRZHdctqiDk9L7z/kZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO5YmHX/eYv/o6eNTpgg1itFJU0iLXdiWIuAtOSIZPt9jCjP9h
	/W64IFKzeWg3PGlCiQIqqqE+FUfK/+CHOZL3reryixwCFGTJYM54xCtprCDT92aE/fBbW9KvqTX
	9/9f3WENbySf1HrAABb/03WlEH3euO50fV+QbbJJkQXhMUhhyuI67CaTC+zYi5F6V8W0=
X-Gm-Gg: AYBFou10GEOj87FtXt2iJQPMkAwRogKxJ/vx/A/zrXt5B5hjLsA6cZxe9Lx096mYSGI
	I5ZvkTlzpnDFHSM19xl0hllZNyKir6Q7qrtuOXzUKTXjV7SxokPrzZAlyKOJEyM5J1YtiNcVnx4
	toFAp47GQnf8UiSWTKxpfdC7N02WCqieMxFmz1buDZJcyKgBKYQkbkQCqeeXrN0LFap9CPrzFH7
	AWHJKOypiwjvyUxSw33YY1W3t8cx817Z5iD04bkPxgGQxASl/frTKrSvibfbl2g/9LpvqPAFhRb
	qNKG1/iVWpCtdMP50zvQX2A2UHiNbnrWblA+zm3Nnlf1s986sPSLS4ZxTJ1728KmBn1xEI/Y7i5
	MxGSh3QML0dpSdw4L9PlR99SV89s57l8GPhw=
X-Received: by 2002:a05:7022:485:b0:18d:9eec:e0be with SMTP id a92af1059eb24-190a0612732mr9083353c88.2.1792670232705;
        Thu, 22 Oct 2026 04:57:12 -0700 (PDT)
X-Received: by 2002:a05:7022:485:b0:18d:9eec:e0be with SMTP id a92af1059eb24-190a0612732mr9083313c88.2.1792670232128;
        Thu, 22 Oct 2026 04:57:12 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:11 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:01 +0530
Subject: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
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
Message-Id: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX2WESt4uJOIHl
 /LybacRt0IaONIbKUwoOAXZysJtP5ZYIkkCK4qM8omXHlc40XJFewClzlfKj1u2e1cQPVVjTCxW
 jcDYv/q2u9Njz/ghAfBhbZ+a/m999P5d76KsprsCezy0NXbn4dLO1uPakm77zJEfGPnGmSWL5K8
 p6QxXWOrUuxG1B9R8/trvhAtnPUeDXVixbwjroL7upLZjVhoTyYU8NCup/FMw1coXCErFMUSwk4
 HtXx2+yKsbUvu1WCySDrNDWah9iAmyOI61A7ZC7uLxlUnufX5hs2DLEKdwlRyN1mrqL8o2ZWriv
 TywXt3WXq9NsR7DqW4teOvcAO2J6eheog0akHtoKAruvigz9m2NSXXGzu0KAuLwHSGaVf8rC8+J
 906hwsHy90xguvhK7hwKviiKGSq/kbvrPXfpYq3mcWguMPCu5Z+EzxTYustBJzz5Mz+xC3c3hjb
 vuP34Mgbk2b2O77SUMg==
X-Proofpoint-GUID: qvWagY-ydxBKNzZGeSXZ5D4EIJIE92yG
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9fa19 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dPIVYjRPlg6xE4C8lnEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: qvWagY-ydxBKNzZGeSXZ5D4EIJIE92yG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX5rAnAPp2Bnrd
 HrOdxJyjnXoEq/llJ3xXXdFfXTHxhgd5bD8gE1Ab/KMGEDWzHpIbm6HwQNKTr5mOPbijlVmx9Ub
 89vbzxR6LeLwZI6Zz6dU+qbtO3J5pzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

Add the SoCCP (System on Chip Control Processor) remoteproc node and
its SMP2P configuration at the SoC level in nord.dtsi, and wire up
the clock and power-domain dependencies shared by all Nord embedded
variants in nord-embedded.dtsi.

Move the SoCCP compatible to nord-embedded.dtsi to fix binding
errors reported for the Ride board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 10 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 56 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..11317eb45e57 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -430,6 +430,16 @@ &remoteproc_cdsp3 {
 			     "nsp";
 };
 
+&remoteproc_soccp {
+	compatible = "qcom,nord-soccp-pas";
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..441bfb003f77 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		smp2p_soccp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_soccp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1587,6 +1609,40 @@ uart13: serial@a98000 {
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			memory-region = <&soccp_mem>;
+
+			qcom,smem-states = <&smp2p_soccp_out 0>,
+					   <&smp2p_soccp_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,nord-trng",
 				     "qcom,trng";

-- 
2.43.0

