Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4EE445AFC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938308; cv=none; b=W5i6eLEHFPrt1rX2ZM+Zq/cM7ItWSwTyI3t5IRSAp7XCk9gVSjWb3Huu2Jjgew+utv7SVOs7IL4hQIPQn5wEWMwYo4+CZpdA4ukjb1+2U9Z+A8amhCgXwpFjdzay0aVtFOIt3xalbA9B0pLMzYUShHLPQrYtz9hPgUA5Of58Gc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938308; c=relaxed/simple;
	bh=OkjxaRLJy5vZSBb3DPyIXUEufZt+oie60RVNJO/DP/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DnljF/Koz7QsmoEXBeXOj5pT9y/3CzMIPcevwRp3Zlw2IOQrX9FpriCEPBO6OgBPv9BuNTSPjo1uiKRC8c3x97comtT53Ky5hV6lZjLn4ohE+yHAthatgt91VDxbESt59ZGwIMdFBteIqwIPX17sCVvUx74dRj+tb4fbwjCA8ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E2vkiFfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ecp28sYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E2vkiFfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ecp28sYm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6892a5dt1189208
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 07:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKz+YP8l1s3KlVjoBZ1ZvLrV4giiMsdkxqVH1DtuhHA=; b=E2vkiFfGc5h+NBXK
	6MCeqW4IAtnS1LPTE6IsxtlOO0FP2ffjt+4FJoZA8qVuPFc+6keh/CBUuJRsyHFP
	bRKxMMoOUfS5V/O1z8TvSYiVM9REK4qJYq0OMXMalZdQ7ex2FA1kv+w8rcVUi1sZ
	3x1kG3gQcvfCoMrMPWhrgV6uVhkHVA3yChUe/CcMtBVJI8qfkEtlNdiKze6GVk7a
	FYPOfazO3PHI+zV5OJlJqPWY9bR2HaIJQyjypcgX3HVgm5/yMWz6mos+qu1iBbmf
	Zl5yxsLwfYzQleLOXvXmPYDpgmqPWlZ5y6nLtHrPi54fZXuvVHr0U2F1qBuyUqFF
	gyP6xA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm105c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af92138f9so8550681a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938304; x=1789543104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKz+YP8l1s3KlVjoBZ1ZvLrV4giiMsdkxqVH1DtuhHA=;
        b=Ecp28sYm3VOHNFlCf51SHy0tHYwCg1m/FK61x6Lb0W5J/RD8rrKVZQ3nqOGTDfn8wj
         xUdI+PyBe3hx84gu8p2969jDrPwcLm1TxJGaSlpDb4VC8oJmDn/jrHnO4gSiSD0jCnX8
         97ew8eCZ+P2U+L5IF46mUKc6qsvQXfH1vfe5T5VyrAGnDGKBIgPFQqT1WJp2QV9TFuM8
         7c59zuoYSuIzjnwxw0tie2SyKMiKBHw3oud27CIWfo47nmODyhhlQ/7RQUAtqNHZplPL
         4e5KgCXIBhnYLD+iW/8asSzcY1uLfPwFfd+0qvj2OlCb8qLErPKg9n7jabq6ErXg8Axd
         HCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938304; x=1789543104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKz+YP8l1s3KlVjoBZ1ZvLrV4giiMsdkxqVH1DtuhHA=;
        b=URRPTPLL0PlyV4DivWXDAGpqp98QZXZhgDg9Nlg5JsG06VtvoBSN4f3GiPwagnCTTn
         KomPJbs9NOB4P5w7DLYmQ66xiOAQ7+NP/m4Pw/oX9LbYPl2dOhjsGCKmAgGmncFrI2+V
         LgsBTSmeIQS+oQJ8bin7PcReLjrrPCFd9IESPGn3o3erdZorpR96eZJOASe89rpN/+0k
         3jjv1zcstCG20BPShL5P6HZfhlxH0RxVbIhCuZe0OaXZcB37ypy3F5D0UsACwujvp31P
         0X3YPNXJApuvP3Wi+jaFP7wJdwD9tDoxzgcYwH1WlfQCRvPMpHVLZ8jFIg7JTsncE/4D
         uwAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1fIMsUw1EL/gMaKBqDkXWfIiMUI0nSxFv9fsUtJfpPlfaXZcSEZ6sVj0sA1kNNybAjgTPOoLQ86uuCZA=@vger.kernel.org
X-Gm-Message-State: AFuF++mIlscAwO/olro+i/k/Pt8K7WIuVajDEwyLSpnF47P/v41sSeOj
	LAlqwQrqQx3cktvsJKxWgRsM65JlT+6Xrf1f8vVoc7sQbD/UesbSRSj5KyVj/aOaU/kQuxEHb7s
	1odU4ZnZfx5y4uYgc1njgEItGiU+ZtGSyK6Xe0s4miNM4vH4TPSyaZunaYoJhxqdFCoY=
X-Gm-Gg: AYBFou0cJNE9mA43ry2/Gg0GIZNj/iU8R+S1MChdeXebnJQbQQqqOp7Bk6DSVfYSsR+
	Go+dhLicghrKa6NSxu7dnZX9DDSb7LfLpVBWOkq9sWiusQxi0+l0Rb0vCGz+ajWci28UTG2Zmnt
	mcMgzc4BRfvG/WAVRZCOwlkHek37WP0M9DxmxfrBuUIgr4zJPm0FlrvAcikFS0hgir7Zq2TlJF2
	QHVfuvP0M0Ers3uM8tKxMBM6mghKt05TSiy6ZHOwWc410Zw1ftAIaU3bkJrclSgtdhP69e0RENH
	s0UAOrKvd2WlAJY+iqzAdVxiKqAN/nDhcPgRiDsyYrklupf5s/vekoo8aq3Y9+RjYpCsxOg7oiy
	SbzxUnzPkX0QLjqi9eNN35ljNrnZxhx0aqDCBbyzPgQy3AUWjBpLuGWX+FwYAOkSF
X-Received: by 2002:a17:90a:7784:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39b2b1f52c4mr23703505a91.26.1788938304089;
        Wed, 09 Sep 2026 00:18:24 -0700 (PDT)
X-Received: by 2002:a17:90a:7784:b0:39b:2b1f:4511 with SMTP id 98e67ed59e1d1-39b2b1f52c4mr23703452a91.26.1788938303381;
        Wed, 09 Sep 2026 00:18:23 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:21 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:16 -0700
Subject: [PATCH v7 3/5] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-3-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=2954;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=OkjxaRLJy5vZSBb3DPyIXUEufZt+oie60RVNJO/DP/k=;
 b=BTcuFEtiJ/wsJCMyFLUJqw+0w00Jie4WfDlLGZ0ag1CoWV83tfmm65CFqdthlYqa8ULn9JblH
 DiGU8fPnKiuC01b1azvkQZEgCY30aWnrFhU5ckgh8S+Jr6bHhHiEMCa
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX4zqDzJKkLuW/
 n2ba3BSZWXyZT+KB6DihZV9WkJEcGc1/hqqU8MLEyz3B8hKvMiKXWhOOFcTvyRmeo/ECWVlzWqy
 D+0yVec5fnC9PxvX+VpMu6J/lF1T66g=
X-Proofpoint-GUID: n7YuNLrz9jAgpNTfD4A4n1tdLmz6sRma
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa10841 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mCez9LKK-YWkVuwSxDUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: n7YuNLrz9jAgpNTfD4A4n1tdLmz6sRma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX/iOSCT/eZXcI
 zFaCVWjGf80y5EXqTfBrmd/+6KqD4RGtgF4qhy/vEDFCN7ighx9GbxC0EDusaxyQhj1liRdZiH7
 1C5G+J0rltADQOsJzQA6hysoYgeffEhWOfco8jIw8YO/LjUJxbREz2fLzvvDUU7RbqOIen8+Km1
 a7ozWzg0StpHJMb2uK9OFLUe1zf12g0T5R6d4TabrEFsAfC7ZqKVoUCKEOm1Us2PZIMyek2qPTX
 hd/+aa3X2vauGRAkpON4GAZNShBtCcNv3Pr1/pVOjeqKac4dvgsh9nZ/605Fy4w3nQxz2M73i+W
 qWw87ml7ltlZqd3ZloDrk0fySqtjk+HfBepd8ophaV79egProQmymFxBfTvjivNrIuYk6Qil0wT
 /pC8VNkU5SjKp0K6jIqcuLpegGMP/PbngOIFtIGnRhBiyMB720KbMh+duJzH9c6/y2z3DDO1Kuj
 NfWdoyH4M49utT31XFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090081

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Kalambo uses the same QREF topology as Mahua through the qcom,mahua-tcsr
compatible TCSR block. Connect the QREF and refgen supply inputs to the
corresponding CRD LDOs so that the reference clocks for the PCIe and USB
PHYs can operate.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6c2ac11133ca..e52f8a23d37b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -45,6 +45,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..9149cf6ad94b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

