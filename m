Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910030DD00
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749923; cv=none; b=L17HZes7SJc0A4rGh/bl9ayLBEzSxQFv/hBTjY0tbpik6r+2iRXRdlnI64dfuEjr5MP1hlRMM8d7hZpR87QsHHaB7VMh5/EuMiLI68iQXO3SXFYfv2dWfoDbzX7zfZQpDeKfYD1Ru7ZS8dXqntq57ZFDlFEaIpj3orqbjv5nNu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749923; c=relaxed/simple;
	bh=mdZEiXnEcF1Ehzi2mtklDaI5cuB2rt2/NDVg1wust1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGWRtqCZ7Wz0yhSqwxEaIZSagzAVyXGGxSdRj8eOavFZq2+5G1AM4iVy3Q5XI5OrhQN228BOA8XgYIgrXW3YsP9Xq41fGnpXwq8DyWw2XG2dPP9Uv0eIie8utbeurZRB/kKq89KiqNQ7qaq9kNeQ/rrQP1/P/tOz48lkxS15I+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZwDn2ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/Y/fgXQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZwDn2ud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/Y/fgXQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U2PHVV1522376
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=; b=PZwDn2ud/5UDT3Wi
	iMVCBXhIXjgaBmjSaezgIGsamG2c07QfQSyzVZZHTa1TsjipvNniGPkDCjvCbYAC
	4QLFsd2/vW0YISLZPYJfHmwE6PG1Q7pUKn0XxAogT93GnDtAP0we12GVm3Dj6OZc
	IMoQBlhf3UGseHi4EXSSe8S46SoCLrcf04Q0uHbUOLmrSi2wkn92Kfk5nxqr0+de
	hKktvN+QF/cY8qu+sikj4dJnJRRRkrwjA4hUtnZ1l9tMTaQSYu+FdzDqgYo+dIOB
	Cbn5dv+XJj4uWsuVRp8FpX7ymOTtLUN1bvrYBP0gMWuUcKNofpfogOcd6VA408a8
	iyu+4w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjgx1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34344599f01so4168353eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749916; x=1791354716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=T/Y/fgXQncHcAe6RhxXVWlOiBBXJKBFE9iOkNrLXGrlOMbKychscZVhFhYoWeaBZtm
         7A8oOJBIHXkp89KLQBdU21dL1zOwR3QnxquGCgPf8bAZ1dAw/Z8htJbkhbdUQ0I6w+7F
         5H0Tm9LkF1THzixvygE0Hmmjy87bhU4xdG/0KPBPkQBCaY3BMuxHZxLMJIri7hObl2/4
         7XlC4Te4fTM7A8sjcOkMr5whkA+fcMOH3D5qx+ukic8R2b+zBYcNVW1bzaMX0xRoV04c
         BIwt6IerxDrGCq2bSTrl19xhSoOV2vQ2W6cp6pDEdKqvkwaF1Sz2JZkZctfbTS9fJFWv
         dJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749916; x=1791354716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=LTs2ZOLnapoQqlPuvlEwvtcyibUA5a8/OzYl557TdvgUzAGoYAFF/7XNnBZyMQvm1q
         MexJAXa8fmNUEt3zQFATRuqXln4E8hKkBu3cuOgQ5BlDIl18mnegVL8KQ6lbfr5y21P7
         5GsAx7c4GiKOO4X9rJ9AgUhgDSXT3iaplBAqnqgWvtupjZpWiLBo8yT5vfFYcBVXKPBD
         P7uRxzi+E++HN6os32aCCSb2RFME9ZbtN1lhYVMOP8tMYSBw2veKprmEZdEBFBEQniFH
         CaxHC1h4JxFcpUVYHete2x2Tfqe4q0zGAf/UaVXs/mEzkbIrmEecb+PYbYoqnqFVdkys
         1F+w==
X-Forwarded-Encrypted: i=1; AKwUvByKU417Gwpe/FOR1sKIpcSDX/0OHHD3ZmvbSIyqGpn1lymymorUUqU5lwNOCkXW2X/4iQ02eLlK2tWLf8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLynmGOmSA8b4FJ5FSzuvtkDGvPGPq+TXvq7lam2Otb3Sn4GEBn
	NVYZrTSXzZ6ZzKlNZpWpuJSMfbHDXf2ZgPsthnaQwPQSzc0bG8Ir5/fsfdxXSCMHB9cc7/oTnYs
	i+1tmJf4XIncIHqcjovaifNTAbuEqwSvxF22R8VNL8JMYRFGX7iIra8ng9lOjd62mZn0=
X-Gm-Gg: AYBFou2ft61P4/T/Mx/vE0wJu9gN4bE1f8wAbJ3sevd7EHGo81vBeXB64297j3UXtJE
	mNb7mm/yFTcXChzqjwXQaBnT860Grv1nLkZ0baiBi16kh1PinlQWaBPjV8S0oJ5aCggD8b9hhRP
	O+Hqx/hq0IfiNbvtEsmySzPIFEZRfSSdI6iuGzO6/oK/w2Q/kBqZj+4NgffIxW1WxeeqNi1PEu1
	Xgxq9jCHcsW99K8R8nYqIgdbDs2S4d7U6oKkPkqIk15zwmDAaEKrrPjcy6Gwvn69XNiqfGhxop5
	zXz8R2kJ0xznt0YUzWPzRgu+Vj9VL3XIILkX0YDSF1s48dDT7S+sfd/aCNdjQ/SlfnPu1NbFHMC
	Qiao/w4vb+C8URUaOmqTp2ascZJNYEeeB4td7sCjTWohgv1spWaA=
X-Received: by 2002:a05:7301:4714:b0:341:85c0:91ca with SMTP id 5a478bee46e88-34cdc3c942emr754297eec.22.1790749915226;
        Tue, 29 Sep 2026 23:31:55 -0700 (PDT)
X-Received: by 2002:a05:7301:4714:b0:341:85c0:91ca with SMTP id 5a478bee46e88-34cdc3c942emr754266eec.22.1790749914616;
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:24 -0700
Subject: [PATCH v2 2/5] arm64: dts: qcom: Add header file for IPCC physical
 client IDs for Maili platforms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-2-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=2377;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yWrLgn4BhUP2Li9oQYTGa5Fv7Hp9QVFrMuhqbxh5MWU=;
 b=RiFdQ/bNy/bMhhNHLnMHYAu9LUbjdtaOLbdnqBXqorS6UldSg9RuugFG35G1mqlPC82DBZYTc
 mXhRAhSYdC8BXLirWXB+bIu0mUorBMeuwgpxNSlkMDcOuZ8t/D1Np1c
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX5v0t/IdXhueu
 iKspYdhuaJffzbUo72r3fh1JyigX5eNu69UvdzqcjU+7gxu24EKjqot20UR8sQVJiG3+8/prSql
 WZG62zE4PfFx9yrC9p0TxYNOAf0JHuk=
X-Proofpoint-GUID: 8zVmafgm4zbu5lGYZU7BVa6A482uT0T4
X-Proofpoint-ORIG-GUID: 8zVmafgm4zbu5lGYZU7BVa6A482uT0T4
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcacdc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KM9v1C0ZMMhQZhCIbx4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX5QLu69DVquPl
 h3fpe3UkUeDG7hBb5tp7NRajdNOCI/49ZZvtWM4MB2ynXy+eucLMSjISxiJqFf7S9LjpeNiJxgg
 uF+mMYg3lmNcOBEHcfJNxXf/5jlgNHGlbN7uv4HLvRoTcxzuN1hnH58ntWi9o+8fO537rEDhp7q
 KKXVPenEvaAVzjHeRGYiitXcU1R9blhiEbPfav5I8N6xhy8/VH58XStI+miXzQEIdte7Dl1qnna
 nvyIClF8CaDCp8Bo7KcKpNRmooA+3bOcUo6A3NiDvQfMefi6oamDscv4k7N2yrGOJ2wS5n616wK
 1sexHgq8DijkqQ3J1rX3VkWf+Kt9fYfKakadoLuElkrGmNcmmsZTQok1kfeklVKp8ZJJ3YjB2Iv
 HOeMoNMYuz3gaMezoAk0ktbzbKxhkVFoPQGcRT5D2Q04wmYQOfOtGWAQ/P39pEdR4D1/GCM2c8X
 MzCR2snAKoKpwSFXrMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

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

