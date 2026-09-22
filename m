Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CEE4F68A4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073361; cv=none; b=PFBrFqIZJKyafWzyXU2UtBu1pknbOCYloMHKgSwI3WjQcvpHbchZNoEJElIofTOWTr7qnIOBP44PMox7DA64V5MHQ12TcJKS15p1HAbLrbgna0lyt/19t0Ap0vonNNHMYzut77d18ADbIiLzXdm/a/hG/yy4ljrO6xGbo6Nid/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073361; c=relaxed/simple;
	bh=uqBkLz67ZOu2nNeeqt8Br4W1TsfCl6u7EOZTQAS/kuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l92xqOKIgjANN6QUZto8QSKwgWfFNw1kE1P7MnX+luRVFbp70bpwj7vi3C5JbWfbzL66GGkkr8cslTmtOn4XuwBz1GCTlF5w9DBFRkM07bafBwYNtCmMjwdeqE5W9J4C9u5e34AIp6EzCvC296ZovbhgNJSw584pRfwcWy1OS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HR70KYPf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyPZrWUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HR70KYPf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyPZrWUr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9FMok1842586
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qOZslFZQ/7/obmDCD7/GwhHesO88X1BWMhGggNF0i0=; b=HR70KYPf6sbIQRTe
	QFO8tgZuvez90Hzzx+FM6xT5EumPFGJoTR1a/U/xxBvj0MFdKoVIByHMGpQpmZaB
	OSUDNCCtTjpbh0jJjd0ssR9kPfT9OVL0w3R9297vgEsA4ul+UZ5krXQaniXS2r23
	AJUY7/Wa8Wf/wNPiUKR2VwlZVSMardvAdO29UwGjehipghF4ibeX3qBTibV5PCAS
	ciLbCnYLypMKKtUM33GORsSMmWl2wJ7caJldjOc6kyyPqR+1zhLHv04eAUcJNTNx
	aX2EEl5ILqLJ4OzxdmEeKPaWF44YAUEVyP15bopLBhxUf7bILHjq3/1HY9Al+d2s
	NahINw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj111gu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:35:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so5935044a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073349; x=1790678149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qOZslFZQ/7/obmDCD7/GwhHesO88X1BWMhGggNF0i0=;
        b=CyPZrWUrVY8bkozQFNrQWAO2hDFCaXLvlmBnlqEVC+e1xYXJcxupJVsk3v/0uE4kUd
         sM/uUjsUH19FgkEXvd0GQGZ8HPh0azMIcV7GvxfSc7+AkRYNS+VbvlC8QLf77bd7uXfl
         W87PXQb87wsYLcj5vFHQFuDZwstTIjw2NfhIrXe5F804u4zoLuv5CHhfpMB1HsVK+UYg
         g0WpqiPUqTxLqJDXMWKyIlepZHImil3OCYYg0jMWPkyN3wur0oT9Wbs9NFuXWolPztak
         eHo1t5V0F73zTYfgdhwgFSPSPvOEYnEhqLIGkyAImQxzc8ofjs1ybXMEBko0QitldDyq
         WGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073349; x=1790678149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qOZslFZQ/7/obmDCD7/GwhHesO88X1BWMhGggNF0i0=;
        b=AnUpH/KLXxiJWfLSe/4H0tH5bdkdyfFPitm63xpYxvGdbSwXZI9kDBRUKCoqZCt/pi
         WFOkfcl0xotaMfuRW1f6HMwZ/K2n+87BXxbxC4+bMIjoYnPr6v1TJCPoRiIi41NzNW2m
         8wvCv+PxQN3gGFlS3qYFRnII8IeE7jn1/s+P6t9SLXMj3XZXRkhLfG/z7PI3ud5G/Y+n
         gol5cG1SwiR9VEOwojSC+C2o3/eYLmNuDhHbyz50wIhCR8wRQdOZLu62aHzCBn1N1Ze8
         yOsfXHiYxHWNciCHE1qEWn+4UhhQiLG3CJPr2Q6bXnxety+CVO10C8U8ecEj8LUbpXC6
         Ao6Q==
X-Forwarded-Encrypted: i=1; AKwUvByKmccs3jEUnvUaqC5hYeJpM3NRdVOxSs+fy7qezRYMKZlvg1OkrDmaVND/jrmIqauikOV3bJf8Z/gyjGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mg3cBXqQX1mBW+1dEsbsh+pR8OVithujZW3/yBPvQnKG3SSLni
	qNRonyR9tIte7XUm+1QNKt+QaKe65592FQzVz0aVVve2KyQ6bOWmxPZnPn5I8o0OIge99clhdCv
	T4DbbC+8c0a/hxuwxKPxEbmOx0ZHMuhElt2Cn9BMJ2zWGQJ4h3e/Z2m/oJyFal9l8gCs=
X-Gm-Gg: AYBFou1Ez2jhQKAXT/rWcTnh56BqGiuxe80JxuMELZgjZFqXClyLGmyRvxLfRM/vaV3
	peGtQ0aZ9gPMN6dD8dmIUMlPgqk2rAVkLGoi1eIg3OL37gZOrJBPyyWui0q2mNhmuxplpbJo2sP
	yGCYONqGYoT9eJ3kD7Nmoarikrw0GgMJ4nsz593upqaJZ6avA2l4VH+FnY6uslb/PHwwdkIGZPP
	KYG/zvcODRSKj61QXdokINIIr8+r7DwoFU2ZH2XrBbTmcDSNTP2Xm22reMuacPNwsVD178IVHWr
	emWWKdlgx6jYbnU44i2kipc/UpvJMCOzq3f1i0ex2YNw9aGZw6+64EbZfpRl03yWfjTn8UNvy3j
	br8xnXZkcwoFn5FdJDsMQW5rg9MBWeTyuJooZ5B79UrO0XzraKjKpMspff1jWuSo=
X-Received: by 2002:a17:90b:1c01:b0:39e:5c88:ce10 with SMTP id 98e67ed59e1d1-3a072e8a6e2mr767688a91.0.1790073349343;
        Tue, 22 Sep 2026 03:35:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1c01:b0:39e:5c88:ce10 with SMTP id 98e67ed59e1d1-3a072e8a6e2mr767657a91.0.1790073348738;
        Tue, 22 Sep 2026 03:35:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0699aa221sm3670692a91.9.2026.09.22.03.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:35:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:35:21 +0800
Subject: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS
 debug block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
In-Reply-To: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073340; l=19708;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uqBkLz67ZOu2nNeeqt8Br4W1TsfCl6u7EOZTQAS/kuQ=;
 b=tMqnXUyvlyQ5gkPXFBunrXX5VNUbJO5Ixxvr1zrXvLrIEF/E0k1w9iDuEbQ31K0P9uT8jihtM
 yPn+Mq1MsuDAlXr0RRLefRxolazJQgrF8vTA+SMbJO89Yf15sp+wxRW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: SqnvzYlObA-Pi2dyFG8p97VPRDH6Xd5z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfXz3twubW/yNpk
 WAF4QIzPMkGB1eYM8FXyML/9Pbew+C3tnL7NPoMqmWLwFryAupHg8237A6LSUGg3NmJqNOup9Kh
 sghx404ciztKln8yjrTixumLLfD4D0c=
X-Proofpoint-ORIG-GUID: SqnvzYlObA-Pi2dyFG8p97VPRDH6Xd5z
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab25a06 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RxcEU4ttGZRFM8buTTcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MiBTYWx0ZWRfX5R2/cs6vL9IY
 5ustAjDeNcqsjHbgko1AKlSsTJebvGsjNCYyBo5FB2hpEbrDne+1G48rZNHNmRYH7WH1lPt4utw
 ANesCFPuQLBiIXY5GTKK2c4cqvQEe2VH32lwpe9X1OwgI39DikS7dLOKMAnGGDyly+df0d9TvN+
 r8WgWBxvp+qwc54gyJVDY80TiOAVECIVrS7EdAWw+2lLiWLUpgKWmiID1Pd7xdRupqbsMnT61Dg
 i6HGabdMAI27eh7d0MzFWz2Fg5Fd0nzQS2HXPum4G6TMsBmX+4oCfWYV7aDP6FFxBud8Y5nMtXT
 cbsiVfuAj2pRAB5QMUT1HBlWUTKpJOgyVmEoukGExA7Zc547dwqi3BfR7lLg/Tih9YunT6rUPzp
 imKb1QfUlQoSc3BT+WGJH2P/EPXceC4FS3KFmrIHbjqJhAQ/jKm7gWyAqcH/D3tlk8bE89VXexi
 x/Z/WRQVUfGxDLmOyCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220152

The APSS debug block is built with CoreSight devices like ETM,
replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
ETM trace.

The replicator, funnel and TMC ETF nodes in this block are physically
powered by the CPU cluster power rail rather than by a dedicated always-on
rail. Add a power-domains property referencing the corresponding
cluster_pdN domain to each of these nodes, so their power state is
tied to the CPU cluster domain and the runtime PM core can power the
domain on before the devices are accessed and let it be powered off
otherwise.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 884 ++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa.dtsi |  12 +
 2 files changed, 896 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4e35254cdd11..370b6bba2594 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -326,6 +326,210 @@ eud_in: endpoint {
 		};
 	};
 
+	etm-0 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu0>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm0_out: endpoint {
+					remote-endpoint = <&ncc0_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-1 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu1>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&ncc0_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-2 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu2>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm2_out: endpoint {
+					remote-endpoint = <&ncc0_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-3 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu3>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm3_out: endpoint {
+					remote-endpoint = <&ncc0_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-4 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu4>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm4_out: endpoint {
+					remote-endpoint = <&ncc1_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-5 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu5>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm5_out: endpoint {
+					remote-endpoint = <&ncc1_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-6 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu6>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm6_out: endpoint {
+					remote-endpoint = <&ncc1_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm-7 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu7>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm7_out: endpoint {
+					remote-endpoint = <&ncc1_3_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm8: etm-8 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu8>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm8_out: endpoint {
+					remote-endpoint = <&ncc2_0_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm9: etm-9 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu9>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm9_out: endpoint {
+					remote-endpoint = <&ncc2_1_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm10: etm-10 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu10>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm10_out: endpoint {
+					remote-endpoint = <&ncc2_2_rep_in>;
+				};
+			};
+		};
+	};
+
+	etm11: etm-11 {
+		compatible = "arm,coresight-etm4x-sysreg";
+
+		clocks = <&aoss_qmp>;
+		clock-names = "apb_pclk";
+		cpu = <&cpu11>;
+		qcom,skip-power-up;
+
+		out-ports {
+			port {
+				etm11_out: endpoint {
+					remote-endpoint = <&ncc2_3_rep_in>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-x1e80100", "qcom,scm";
@@ -6986,6 +7190,14 @@ funnel1_in2: endpoint {
 					};
 				};
 
+				port@4 {
+					reg = <4>;
+
+					funnel1_in4: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
+
 				port@5 {
 					reg = <5>;
 
@@ -8433,6 +8645,678 @@ ddr_funnel1_out: endpoint {
 			};
 		};
 
+		funnel@12080000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x12080000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_etf_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_etf_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					apss_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@13401000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13401000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@13409000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13409000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_etf_in: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@13490000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13490000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_0_rep_in: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_0_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@134a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_1_rep_in: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@134b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_2_rep_in: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_2_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@134c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x134c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				port {
+					ncc0_3_rep_in: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_3_rep_out: endpoint {
+						remote-endpoint = <&ncc0_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		funnel@134d0000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x134d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd0>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc0_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc0_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc0_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc0_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc0_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc0_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc0_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc0_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc0_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc0_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		funnel@13901000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13901000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@13909000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13909000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_etf_in: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@13990000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13990000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_0_rep_in: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_0_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@139a0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x139a0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_1_rep_in: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		replicator@139b0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x139b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_2_rep_in: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_2_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		replicator@139c0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x139c0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				port {
+					ncc1_3_rep_in: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_3_rep_out: endpoint {
+						remote-endpoint = <&ncc1_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		funnel@139d0000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x139d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd1>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc1_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc1_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc1_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc1_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc1_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc1_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc1_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc1_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc1_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc1_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l2: funnel@13e01000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13e01000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_2_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_etf_in>;
+					};
+				};
+			};
+		};
+
+		cluster2_etf: tmc@13e09000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x13e09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_etf_in: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_etf_out: endpoint {
+						remote-endpoint = <&apss_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_0: replicator@13e90000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13e90000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_0_rep_in: endpoint {
+						remote-endpoint = <&etm8_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_0_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_1: replicator@13ea0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13ea0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_1_rep_in: endpoint {
+						remote-endpoint = <&etm9_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_2: replicator@13eb0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13eb0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_2_rep_in: endpoint {
+						remote-endpoint = <&etm10_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_2_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		cluster2_rep_2_3: replicator@13ec0000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x13ec0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				port {
+					ncc2_3_rep_in: endpoint {
+						remote-endpoint = <&etm11_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_3_rep_out: endpoint {
+						remote-endpoint = <&ncc2_1_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		cluster2_funnel_l1: funnel@13ed0000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x13ed0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			power-domains = <&cluster_pd2>;
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ncc2_1_funnel_in0: endpoint {
+						remote-endpoint = <&ncc2_0_rep_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ncc2_1_funnel_in1: endpoint {
+						remote-endpoint = <&ncc2_1_rep_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ncc2_1_funnel_in2: endpoint {
+						remote-endpoint = <&ncc2_2_rep_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					ncc2_1_funnel_in3: endpoint {
+						remote-endpoint = <&ncc2_3_rep_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					ncc2_1_funnel_out: endpoint {
+						remote-endpoint = <&ncc2_2_funnel_in2>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,x1e80100-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 4348dd3d1dc5..90069c8e1d40 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -8,7 +8,15 @@
 
 #include <dt-bindings/clock/qcom,x1p42100-videocc.h>
 
+/delete-node/ &apss_funnel_in2;
 /delete-node/ &bwmon_cluster0;
+/delete-node/ &cluster2_etf;
+/delete-node/ &cluster2_funnel_l1;
+/delete-node/ &cluster2_funnel_l2;
+/delete-node/ &cluster2_rep_2_0;
+/delete-node/ &cluster2_rep_2_1;
+/delete-node/ &cluster2_rep_2_2;
+/delete-node/ &cluster2_rep_2_3;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
 /delete-node/ &cpu8;
@@ -19,6 +27,10 @@
 /delete-node/ &cpu_pd9;
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
+/delete-node/ &etm8;
+/delete-node/ &etm9;
+/delete-node/ &etm10;
+/delete-node/ &etm11;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
 /delete-node/ &iris_opp_table;

-- 
2.34.1

