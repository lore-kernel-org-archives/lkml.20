Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CF145FFC2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793970; cv=none; b=ujfX32O1iSZtstgVJZsoW15KuWvRGJNetIVHRISUj8+uaZAKNN/8ia21cTVJKyLjPEdVVBmDuET+c26qiaaBNrxuWuk0tQmQ9/Q+s6bbBH9QSxbQfyc84z/aRqCzh53/9mQx53KEr4ZjOzwBUOpe9YOzMNOvKIVlnvbzgiibvlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793970; c=relaxed/simple;
	bh=mdZEiXnEcF1Ehzi2mtklDaI5cuB2rt2/NDVg1wust1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkdW/qDMtCgExEHyuwi2OLXcRlHbJjyD+H+8BmUTH35IhcHpvHl+uBWO4gL0UKuvYBt/s5WtK1xuVWNdwyoELeXTLSsDgggD2WCsWd5tFOEpCC8GsRFKiZEtW8zhY1aPWDhcf5dy8N/VBajMbrUmRfE7bcUYzhMQS35nJqwUsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7QUWlyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYJFJr5y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7QUWlyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYJFJr5y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Kcq41592787
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=; b=K7QUWlyRUT+LOQ6E
	gzgbxW1FFixrNWZKFdrryhvcatNJ/xhJqwGeB85KQOk69TiLOYAoM5a1cCrpnvLP
	Zhm3QnAA9ElYeV5bs9qID/ExekdsaOKtwbOfYf1O/utjs143fC1dCkJUfHHEp1cp
	6X4hSpUhx6f395Eeub0eo1ogiV7qKVcksR1iaGxFSeMqOO+NyDcTaVscHHE8Vp8l
	5D20CREjZ9EQNhqoXjRDeJCDSshhCYRU1JE+Vq+ylwWEg6xyMZZAsPjqAD9wGJXW
	sA+e0TzDLgyLQ+nrQ6WIVYa4y/RpeefQfu7sCaMZSrdJyGfPz2sC2wEqPGE16eMi
	fkCzIQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0skk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1196393a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791793967; x=1792398767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=DYJFJr5ymuPvw1NB3ugxGfMgoOgK+sWJ/BjRfkwRcm/nV+HFjHh7oPfA28NCK1K3h9
         BQLT3iFHCBMhNTA7O3XO7K5+XZMZBqQfwzaw+BamCLfvb3vFlqoAt9b66sC5EXaqOrvm
         zQeLvCNgg//Xlm8aIShbGRud8t5WW14t3Z3nlGuhbbJWmCha/qifU+GQSXIj/zLEYstk
         y/dvqEepaDdn6JF7r/Jz685W+PnTjovYwECrr4RcUERONtj/v+Xlv7E+Cd/RzR703wcd
         7GuZ5KX70fSBzC3rPH1kzn/ugO0TYbuxi8aJ64rNkBsX/+lI3VS/zG5bPN4lp/UEdcOb
         LYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793967; x=1792398767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=o7VFmW3s5kA9mod3DqsCcNVpxEu3gRuszRIIgwkitLiw780o+MQzEcc5rKXidnmii6
         Q2pqvA8pzWuXyNBMPFI8iOJnPIDb6jQa0SQ6eS0FRUc5qpyJHVykNBtISq4l12eYfFyQ
         gm23YaFhMkzyViPRBrZ5SLflYIzzolq49sJwYH5mpBdX0895thvTpl59/AzaKlXlOx9M
         /Nc8Ko7uXlKb+DgGwb21g+RRhLITA5gt8lgNu1JfxoW7fj5Guc6D3c8RKVSBppRFmy0F
         9o4jGSZ/RYpt2bo5DF62phF2BIyYm2bOU3Nv1QFYflOTD4PvsUhz2gM3ZQiaB63Mih7B
         nU5g==
X-Forwarded-Encrypted: i=1; AKwUvBxf75BLA+e9weSp8+Ag7g54FchTKygsQOUppABd2GKNekvXO0cW7AAtLzt4gmC1SDv9QfD6tR3CLBoMA6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbGT77eGohx0csBUpxjGtBKH1gnGrG3ujodx6hO4JEVq3xXrcg
	7uHWmSh77N/YpWzVSKhNw3qnbdqzqUPRdanqEnyrFbqvZ7P1sOWKnQKCoWhKoVjDYuxgX8n8meG
	FYoL0GiyTRXBcuKEHenlf63uiQHmA06jn6VOqLuKnbA0e/B3X9Ki4gsqL2pqqeL9KaDk=
X-Gm-Gg: AYBFou0ijGuoWiX0onrOaUdkzRtn/6QOSOIWUqADQ0GvhyTKqS8oR7q9hb67Aro95YI
	DAtxBIzXsNobStZKvtS8llW8jzdhtkDB5OilxeIMEtvFzrnk931oLnv/b/HBi4uciJ+Ap7DawHa
	8ne2+16BlDcoa1g973cg5vjqQbk+kV6Hi2198BrGnMQC/iOqGDBVQPFCFMfUtaTZvsCH4FTi7Wz
	NL/UcOCxUh3LOjuoH+GnKe+TzmpQ0o5Dr3pmgH0AheMjr3e9kqJsXV0BWQ90rE8AV2dVicOUJpV
	3BNHb4gM2D0vu6ORlR2PZ0F7RY1XxGAODHE+NZsk7JiMGnE+tnCNpl1FIH+EHjeCj1QbL6CXORq
	Rb8QwWLlNZGQmvYU8yk7fXT3f7RPOfTneHKUVZ/3MRpLhU1Dp1A==
X-Received: by 2002:a17:90b:2ccb:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ab3afd2c4cmr7349152a91.54.1791793966602;
        Mon, 12 Oct 2026 01:32:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ab3afd2c4cmr7349138a91.54.1791793966135;
        Mon, 12 Oct 2026 01:32:46 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm15749423a91.0.2026.10.12.01.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:32:45 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 01:32:31 -0700
Subject: [PATCH v3 2/5] arm64: dts: qcom: Add header file for IPCC physical
 client IDs for Maili platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-maili-dts-v3-2-8b499e7b9a52@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791793957; l=2377;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yWrLgn4BhUP2Li9oQYTGa5Fv7Hp9QVFrMuhqbxh5MWU=;
 b=+sPX23MBatF+CEC1JMVRkIZe3QRFHLhgsDQCOa7yS0fXC6sMX6WH5hCpVj1RcyBWGDUcfkuGA
 x/pMXugRq+vBLfKAgpn294a67YSK5NbDuM8k8tai2k3nIWsrMuL80k9
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc9b2f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KM9v1C0ZMMhQZhCIbx4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX6lg+rN377oO4
 8JZIuA+/5bn7CoaPevg5LG8trcq+xMZ0mSfRJtcC7rYOCgb93Ntf4W9NAsModYIAGOgkpn/nC2K
 x8p0lJdUmF4sa3GgHa8EITj/ockK450gA5fAI7zql9TjNXXW/ZDd/2dHFIU2nF9UIJ3QS2m7KMY
 PvKPt5UEYVTdgFX2kL6KBiTx3By5WBUWQ04PMP1LbaUto6kMpO/VP9x2nFawEM4NJUdIAs+vxEy
 /XVXVOOgAyDArm74AqNkun9P130rdhNpRy1pGa4DqS1CkW+5hunMug12mCcd3Ql06TZ8am+og5H
 8ssJZDGSOZPrIg+gTUbqUM+mosBbam5SYY3wdhXNPmrK5VaPHwMYCsVIW9fY/AlJKMpfCttumay
 Z8WOiMRUiS8aND5ZIKGbrqycFY4PPiBDFFP02XXNGi+CC09LjCA1hksyJ4ELUPkZT6YIeLlFYPk
 eZsAO0Dl8kN8Bygt2aQ==
X-Proofpoint-ORIG-GUID: tAqIfX_bn-sYHt7UhLAOUinXmagM9L4m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX7fCVuuPxec2a
 iCN5aZ9i8nOuuMASqofbT4xjaefeYsBhikdEW36VFMCnm9r23HbXO7VPFvx60/XRiGkfG+haE96
 SGyt86DPTH48AAEtmCGJdaOM+LvQjnE=
X-Proofpoint-GUID: tAqIfX_bn-sYHt7UhLAOUinXmagM9L4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120033

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Physical client IDs are used on Maili Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-ipcc.h | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-ipcc.h b/arch/arm64/boot/dts/qcom/maili-ipcc.h
new file mode 100644
index 000000000000..7cf66d20e9c1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/maili-ipcc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_MAILI_MAILBOX_IPCC_H
+#define __DTS_MAILI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_WPSS			17
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+
+#endif

-- 
2.34.1

