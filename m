Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AF348C50
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565624; cv=none; b=QbzMUA/EuUHyDR2dwYMYYjOVePbDsXmhXonnhubZ0Fswn9ohfWIEED0pKrJbg7lTGuQBCNHNnkPGmOxay6ANLlTUUvzBH7A+nQPL/0N67PL/tec2voRz9/Je7IcHeOOEp4BTzEnR5Hrf5eE61CoJcyqHfMCR9l3SS8e1+SX3V8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565624; c=relaxed/simple;
	bh=+kOjkpPIp2O0Y2TcarFiCr4rotgxnSe8KeYiGN1+xbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eDdCWb/Vk4WLHvIFsmUMBilZDTqEmU3VsX2Jb7bJWl9ipPgRCMXm487hOoNv3SqcfYtTdRWSsp/0srCHlu1QkvjcgMVC9+5pW4Pra1VBhN1/hM11aLGqnVGm4wEA9tpr0rMCpr/n6BHrTPq3ZPUfOBpoXeZ3TcWSOplsBdr3vxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rr72TvMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8fbZKjH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rr72TvMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8fbZKjH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1cdwB2442032
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Lnkt77Nj/YGUnzV32lk9F6
	YUGD9V84nL5hweolWWiPg=; b=Rr72TvMk8lTQ5yMdpm+GmugIFk0OSsAzLo8YCg
	iDY6nwiqweflNjfAteRG/toYCMWo9HXTvrxHNpsK6ia3lv+qG2RJIbIIajOit+cw
	ixCQj/UcbPfRV6S/uAoP8F0BGUGK7SvyMs9R7MxHoQwHs9NR7muJbl9WUe+3fZdu
	R5Gx65SuGVGRDbsiqv2Zr2Y80nm3QlX3URoRAVJrIOaDCGr73ZAJIy4vZzhpuqj2
	KDP+ZfkarRTckiOrvAENbjWM4o7pb+6WXc2fzzYRLngcLaS2SzWILxJeNYxv4BTG
	qDxaTouTswoGOABLU/asQ4bjkk7BcSWhkukJHezIfboAi4Qg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50scex8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so3559303eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565622; x=1791170422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnkt77Nj/YGUnzV32lk9F6YUGD9V84nL5hweolWWiPg=;
        b=b8fbZKjHiwt2lC6PoBKmhYyaA5OetDKPtoWJxsE45AuHjjOBCcvLfV7Win8xsAiH1D
         vh/A3stOQR7JgHKh3965JpQHUXVnGhTqmrgDrOuQCxwPGICIgBrvryjgqCaUTFyFu4/4
         +8SLlcaA8dvYt8sooDKAHdysCyqEb/0h4RwNZ+cHsu9tdSPe2sufKvrhz88UxnjRSNB7
         CF/zx4puaw5EUAMF8sqw8Z2NXv7REWfAQl4rO1feEkIHVuluxzAg6TX7uQCTyWfetiuF
         QrNEbkyC8K8aMcASVD1I/WH+M/XL5KKcz9j4PGdippI1HnFhzXtNg+PGIIIPi0K9aE46
         HgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565622; x=1791170422;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnkt77Nj/YGUnzV32lk9F6YUGD9V84nL5hweolWWiPg=;
        b=1DHtH2Sraua9bba5X7TyQ6P+kk/tEjQl7iA3gF8IRiIRI+a+OT9vaIxJ2xsxmCkF5x
         O4fsIO6lgZGpXgA0rsUm9/Bx5n4HpPAYPg6r/UAM6ay2F6VJVZtuM9ZfBp1y8Pjt3t8T
         yyjPVA4rqlmwhLxjUR8Y8KsJ6CdmRC+ryNHVH7lWYcArAyNH6IBxyWXYizLdWYVWJESW
         73Kmx9R1N9g3oLCBfR1CblLKW7MmTxgMeGb1HupCuG5Vcae1hlZTdKYhm70T0n3eI0u2
         jdYb3/2MwtNlMynD6by8Z2zeQRabxHNpLRmuYJwnUcIMoo0B2O0tGuU4jfmezs2QQPm8
         j92A==
X-Forwarded-Encrypted: i=1; AKwUvByoj5n9MFCBVgDLm5fQwQ4CIkd1bVLOzDuenHZkHEQoeZHCkGBWbwpbOve/KXRe5o6v/+ykZkbGBlcC2uw=@vger.kernel.org
X-Gm-Message-State: AFuF++kbKpKghN6pCtlMAMv67/1XLzcCnw8qZk0ZjAlSz1n8FPkPd6sH
	UGpyr/bchcTxNTUA51L0BiC/UcjaHpVbH4et32m+ksq1JR1tS5h4chwRQ+VyxZ1qSX17saJtvAU
	YwgMMV2Cu+YJ4TwilQ9+wJ/Kl7wJzAWBi7Wg7mVDKL70t41uG5HnXzNTt65DCTtMALMw=
X-Gm-Gg: AYBFou1SdD/2816KTQ9CChqN/mQgo1EU48Qb8bt2XFILe9ggaiZeco4j6H5z4zVkxSr
	T4+TlSWgdNYxHVgCwVpqWKvIFnnzsb4DWcYsW7xvsXd8KZ01eChwAlMp0jfQ/i3xe0z9NoZUSzP
	l5lRvGpUr2faHJ4jjdhp/EaEiilIgHFInzZk9O9FdHE8wvSBBSUus3Ubk23jNsY+40gfgvpQS3j
	dYf/29gNa/W7jopBmj6WtXHD1/a1qKu0lfNeJYIPw9W/vkqBQYj/Q8wW5tE1NCVbdZ3mlKdw/1o
	ckxBK8Hm8EQcvFCIxqLvr1S5ucT3CuiAxCgZFlOj9PZNRy8LU4sOJrvUEzFYBFrYcTi/ZpMOvwq
	T8Bm/N+o+Ir89vyo/3qDiPZnozG9wf2uBbrNXB0Hzb7CZlRaifQ9b
X-Received: by 2002:a05:701b:2406:b0:144:fe70:dac3 with SMTP id a92af1059eb24-146cec4a0cbmr8573078c88.12.1790565620508;
        Sun, 27 Sep 2026 20:20:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2406:b0:144:fe70:dac3 with SMTP id a92af1059eb24-146cec4a0cbmr8573045c88.12.1790565619945;
        Sun, 27 Sep 2026 20:20:19 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:19 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Initial support for Advantech SOM-DB5830 board
Date: Mon, 28 Sep 2026 11:18:47 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260928-b4-hamoa-come-v5-209048957c20
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX+bsUGDdzioms
 05fYTMTn2qclvoyEDi1qG9rv0WHfgBo/Uyp2LN7/Kni1hJ5Al9tlklljiEOZEvcoqB21yOsc1Qx
 wp/foSRbE5fae5pM8fV2c8OrSM4PI/k=
X-Proofpoint-ORIG-GUID: 9gXeNI17HfpH5p57qyf-hLpRchvQZNG-
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab9dcf6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oqdWaPmN6A6clvLYvxEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX0BXbF2M7jtM5
 pxsA0fRS7mxVgrKZZbOW8LZYLiWRZ1lZ0/SvhplMZhjzI2lttVP2pCjhgp5xa+VEITmgoTeUl3H
 d8TrVfoANiBStvkN5u4fLZBCpsMEDOpR+Scf8z/P9dbXBwyTfx0t6oQnUKFD+D4Zdj8Par3+jXB
 edflQQlF6bmxwJIuUnMOF1eDFccdn85ZE8PllpDmDR/gcz3UEJzgkqpT+mcBsTCY6pSPK5F7URt
 eNF0+tCcnbikiF5Je0xsOeMLJX4CATnlFmfbP2OGuIQbAyI+FCDYmxoJy45ozrM7At4Xtn9sz9Z
 fGIZ4V4LPJ8EVkExIYXa4QVEjhFuqJFF7VubMsDiBz0GIaXQqrqXbtlSIhNysqCcLFA6zorgcu0
 3lCFJ0aY5rBjLz1rS80thfuGxor+q4WPsZX/yuwRs8LahVJTqGQ03t9tiQobeB+f49iPbscrk33
 Xks/65GWrSKm68c/Vgw==
X-Proofpoint-GUID: 9gXeNI17HfpH5p57qyf-hLpRchvQZNG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

Board layout:
+--------------------------------------------------+
|               SoM (Advantech SOM-6820)           |
|                                                  |
|   +------------------------------------------+   |
|   |     SiP (IQ X7181 EVK SiP)               |   |
|   |                                          |   |
|   |   +----------------------------------+   |   |
|   |   |   SoC (X1E80100)                 |   |   |
|   |   +----------------------------------+   |   |
|   |                                          |   |
|   +------------------------------------------+   |
|                                                  |
+------------------------+-------------------------+
                         |
                         |  Plugs into
                         v
+--------------------------------------------------+
|         Carrier Board (Advantech SOM-DB5830)     |
+--------------------------------------------------+

Introduce the device tree, DT bindings for Advantech SOM-DB5830 board.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v5:
- rebase on next-20260925 
- fix merge conflict in Makefile
- Link to v4: https://lore.kernel.org/all/20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com/

Changes in v4
- drop fix HAMOA/PURWA IOT EVK SOM compatibles patch
- rebase on next-20260805
- Link to v3: https://lore.kernel.org/all/20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com/

Changes in v3
- add patch to fix HAMOA/PURWA IOT EVK SOM compatibles
- update Advantech SOM-DB5830 binding and dts
- rebase on next-20260804
- Link to v2: https://lore.kernel.org/all/20260727070758.528-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- update commit msg
- fix binding error
- update pcie and usb DT
- Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Yuanjie Yang (2):
      dt-bindings: arm: qcom: Add Advantech SOM-DB5830
      arm64: dts: qcom: Add Advantech SOM-DB5830

 Documentation/devicetree/bindings/arm/qcom.yaml |   7 ++
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi    |  54 +++++++++++
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts   | 119 ++++++++++++++++++++++++
 4 files changed, 181 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-b4-hamoa-come-v5-209048957c20

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
