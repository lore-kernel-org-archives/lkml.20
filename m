Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC2443AA7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789804; cv=none; b=alVpZjsiweTVgRYrnePgphTibd4dqu9kRYlpBGPAEMZvUPlMfoWs7UEDEG/ShGszvP2J7mF7hW1ydLEksi05iGfcNT3m1H/RuEsOmwfgy6ICYN6ekRAIc6uk20kgyH1Ed2y1qrkLk7gAynsdRQxL3aAcALX3ewYBGrBtvmhyrrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789804; c=relaxed/simple;
	bh=FOch9b7+w5KNwJ642MAwVqCdr8QNGw05Updh5FF0AvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTIdO1BkPVJXUFV4/2mQxvqcdHDGlJrP1qmuFqv+iJT3DCR1CYRuxrcIsOTOQolW56VFMVF2OAwGynDIxvN+yNjb+yHxnP3UBQvFTY6gaJ98GCDsMTj7PFEFr7nB2cKSm1n4E/3xPebsNTu07x7zXZSQITjItRyfLvUzd/QA73E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ypt9RBAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsugdO7W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypt9RBAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsugdO7W"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55or2751193
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHR2axNXIQFsXfSKOD8UvVz6O5+e53z3FnNarxH13PU=; b=Ypt9RBAhJtUZdcq2
	3a4UMj6n5Xg84XKE86UEJmzMX3ykeYUi4zgkZV5UStYcyLH4RJOWVFkA0Nni6uWz
	oymGL+OXem244xjHjzS3yB7cxlQ/LuDZ1pOnwwaj9ywk3adGFRzqgopTvNTAUwrk
	PgZ2lmTB6C60pnRNUBqSuKidWUQItBBvM1c0cUPUDsIVlKgI0WET7Psu5274sY4Z
	QBDemauwCWXoAKJrctZwJexontVMKLVgGQXigeyaFBzG66ryRAdkavVPSSr3dmKw
	Taf++1YJLArI9c/nqFvmsdCRoVc2zrz3xU1M4NTiBGCtmlJUlmt5R1oMmlNe7YLZ
	MHZ4ew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed7km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so8217306c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789801; x=1792394601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHR2axNXIQFsXfSKOD8UvVz6O5+e53z3FnNarxH13PU=;
        b=NsugdO7WSjpZ+b2rMbMcbvdiEqaQgQ6PqxM830dziOilJiIwn3DaxYMdlbHUdumk1D
         5wvL7QGN4N89xu0q9Jkqg1aXXpfQ3fIZxrhltbv84rAq6XuuTO3ceskR2Pe8LQfOUrvK
         5JMrxm4P+fAzdFeg3RwZELE+4Cqrr3ojzWGvJhcdscwA4rZy3bT0w6K0CGBhyqL6M78H
         J0MpIxXrbmiTooDF9F+2/FnZSBk+NplZAuQ/cAl7t9/V7pb3LgG9Ody9/MDwCLHMYBXc
         8NcR+gfFHQRKPq6/fd6zKu6SNpEUel2P0u/mO7j5gA2nj6AUdiIvvnFFtWO3Iv5TSZB4
         dNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789801; x=1792394601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHR2axNXIQFsXfSKOD8UvVz6O5+e53z3FnNarxH13PU=;
        b=y/8F/MuqeVtGzwfDWirJmozospQPhQ51fiGKAL+N8/roFDXWFMbJZsueRViB+rU5jT
         NIrcKkLHXf9piUtHuyNXBRwPhx627jrBnEIfhnuomBJtDJEp93iGHdaDhBwzuBS/SXcN
         dap9F7wyk1AeiWCfk8AP1O8RjIKG4qW+GrRHGm4kR5KGatjVH2aAMlHJNx6ioPtd8Wid
         H7kBcq1BSvuDPZinj6+kxx3D0qzf6iRH4q6KCLPsaJQ6/x6IzIB22XveCZe4CgHet+XQ
         DYZBOlGNiiSeW+0YU+rCqyqWwfao64jGLsbGjd41a0bZynqoSOCCET4hdyQpNTP2TWRg
         XIHg==
X-Forwarded-Encrypted: i=1; AKwUvBxUX8SrYjgqXbYjMqXkfIThCkV/flX8WSTBuypjueFenClb8rybc1/2I/1lmCqqEPCYImhQ7KVSSfLqeMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOxwADKayn6mmIiEF/yR8Yi7ytEeO5h8/EOpgiIi8kHtNcQ2Im
	gZ3bLSCDFtkl6lve7QsbQvQNDkezzZSZNt7d0I+U9mANoxlHMXYmcdgKFgrixmv5ed4qRBL8KHm
	VtxuR9SlLNSNS7dB6/5hqIYHNGuMgBJ2S24tC7lnyRrZ2CK2mecgzGhA1hmn51qGlurYI3ZgYVX
	A=
X-Gm-Gg: AYBFou3cdH13+uDsmv4/dgjdGaJitZK/yc+N5gOjzWu+0weLJv+83Q+MWbSDk/eB5fV
	bq615Tg0E2qgUC77yHQOGtXvrEvI+Ckp+dI/BWen3L79JMHclXWeGVp390arV2niCKY0N9z7ONT
	oTBRa0qTwUil+72YRELVj2suy0Bed35YHIbwsYcWdypQzhR7VgogfrprquUJnzQ0sKlRFYj3KM5
	CT4827g0zdQ8bYXbVWC170lt61fJ7kkH5H96LpIWuK8pGYqlz4mMWGSvRdBOUY+NkVexX50zcvH
	GbYsnp6lrfyQiWFtjGpBnVD8eW8jPaHi+lyrhQ2DEtmGHKCsLJAE82wWaLA5DNcTlalO+K0cUkH
	K2yJ9eVVBFzP3G2H2Yg5l8tmSGeYAwEvPE5OX2voOiMguVaazvO+U21btnmcPNmeEWnonmhQYJP
	Qgw3sZVdzIlU864M/pSfi33yDkVA7X
X-Received: by 2002:a05:701b:291b:b0:14c:aaa0:941c with SMTP id a92af1059eb24-16a64ba421cmr11652161c88.35.1791789801479;
        Mon, 12 Oct 2026 00:23:21 -0700 (PDT)
X-Received: by 2002:a05:701b:291b:b0:14c:aaa0:941c with SMTP id a92af1059eb24-16a64ba421cmr11652127c88.35.1791789800794;
        Mon, 12 Oct 2026 00:23:20 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:20 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:03 +0530
Subject: [PATCH v7 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-3-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX+0ue7DSYtGOy
 mutFOmsZoZNBdhzSsjudnUOAxO5gQHZUrtbCEROcxVe7znNeqh2CJFd6wCvqr0JiNmpP2zs1fV4
 G6iyVNwMXM/y2JVekS3A55HlFVsSwJYSrvWdzRqWei7W4OPheLZ8uW5UKtEOV+lmWFZ7GzQnwTC
 j9eIC6xEAOGeF92/tqpzut87wq0hVLvrwPX3mAkq5VrIGUQqfWRr2B6ssMdnLzFFOPXokSlgDbl
 hhBdw5ZC+GSwX5dCEQyBUwb9DMeCqWHuHrOnTe1VZTv0tY+BAS5C2kLSeZ1WIEN4976ZhQgCLC3
 LGLb4l84fqA+GvXS7DLkCD6fAxgkkQRFM08em5HBDGrWBcR65mRCNRo2Nu/n17U7PkPMoJv0vDV
 JRDtc6tPI7v5DiTTgb+Wa7gs7asYBZxknnOrRt8OsJXI4POVJMvd/SRr7FiqSVbJxK188A0K+Oo
 pR2AwLHbOLPjO53PWMA==
X-Proofpoint-ORIG-GUID: QdJBHI5-MJMkZxIha94XfFqxww8stOc-
X-Proofpoint-GUID: QdJBHI5-MJMkZxIha94XfFqxww8stOc-
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8aea cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vH_i_heqKRWij10IjioA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXyszKSMzZMpXl
 8MF7kDxzzbqjUZrQ+bq6AI2SYA1O86bEVgjtbdOyydVtJFUICdA290hahxK1/BLdal+r4e/C45n
 pwV1mJ5hANLjEeTt5jJ/tXp4eTxm4eo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add a DT file for the RDP504 NAND variant and include it in the Makefile.
Enable QPIC NAND for the variant, and enable quad mode for it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..94ab6355176f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,7 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 30c8560822b5..67f62c1acddb 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -91,6 +91,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

