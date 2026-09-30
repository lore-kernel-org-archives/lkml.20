Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F464CB8A8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768967; cv=none; b=q/5zoWqye03jwsCEYXgxG0/pg7KmKliqd9Nc97oqZs8/Ut5CMkD0AlmZk7mVBf7rT+6peQcHhzpqZVVeT4g7TwIe4JtJVRlNo/cIIBHS8W9APmWGIZxyhm9q7tKZHSJc0C1EmFuCrbQKnKS858Irfq6uRDn9iw8WS5iXVSTBf1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768967; c=relaxed/simple;
	bh=9TYbxqQUeB+TEAbrGkcxMgP0jMpjNw7Wfhnhbk3XKwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrEoASKXkZxzOykYBjIK3pKhQagYrNh+QcuS0OaRjLfFvDjHtOawpkj0z4dzjZjnRhelkPTTkR2MrB2RfA88JRqPCeXva9lSArTpCFlCIzWD6Lt61TyqAILbhsTmj+h+HyYwXhwwBwXga2jEun33QVxterCBIX76atiGXhu0+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUw9FttE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTmmIH2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUw9FttE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTmmIH2n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7Q7x2019495
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xhvDnXnYUywbshUOF5SOWvHemuGJb04wLX7CIQ3HYU=; b=KUw9FttErVkLLw0k
	Fxn40tsnbqCe2Tvu5aCEi13z5lK3DtrwrSc5ASym8PgorUrEa+f3rmB9vQkrM3Ef
	XW6A0uEgvgmtXHye6BHU3imZfxwI/ENDyaku4SfKQTPuh+PYyyNUMPxEdr/aesdv
	eJWrt8eVo4bwSrYiZpRfN/ZIw8acSYEI4FdiO78IWzTgO8V8aXDyYuaNs8gELggt
	HQbOUB6hx4gTL2MdxWghT8nxunkP4BnFaFmC7b3e4ptiia3Z6pM0Vty39gSBnIt1
	P3dkzO7vUv7t4yz1DzcH9qpslq4iHgZWwG7WyVKYfDslnI5f7PT6rEp6pSV4yeGi
	ZaZD4g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c13vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:49:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-882359f93ccso2978336b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790768964; x=1791373764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xhvDnXnYUywbshUOF5SOWvHemuGJb04wLX7CIQ3HYU=;
        b=MTmmIH2nsyGWXGSQ2bxQ2QtXpRDWXSI5GEC9XQmv2kl3hJinGkpHVKog7ceF5z3+VE
         3GZxpkCznF7/QRqiUAKZvNX7dTMnpeVgbdsTSORYISLrMwbJQfGlX27ETqlAnibzz6ld
         gqA6nXen1Ca0Io+eJVOyNAKyOxHQgJP/TQ7nt0xhvZ1w/BcVsgs2gQFPGELdai576FtI
         M6+fySgseZtdFETkT4Hb1tTGInnd7XNAIT/IlmXmD+oJVEZmcg4L7TqN7A7zLEpZT67h
         /tvFvKCpScb93LkVEcb3YXI5/Q5LFsy8qWA44o47gggrxpBFZIxl67/g5VOQiJt4oiDo
         6U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768964; x=1791373764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xhvDnXnYUywbshUOF5SOWvHemuGJb04wLX7CIQ3HYU=;
        b=w2Y+lsWFbTXlE+dIDR6ymK6mY7RQiUozNfbZohFxzFvm3C1gSSTBw9TwKoTsP2wanB
         UI4pdTE04vOy8jJlUsNLt/7LTWyprzc6cFE0O3WkoN8AgAnNfaLVUN4MzUyQqKvczu+M
         CziAejoqtT6HS34a/nAWtk2UaarHTDwOPE3xlAHTirW3fVzw0TCDIoE5vFvHa5m2CL21
         tLBs5RyRbd/mzDwRYZJMGBUvGzam1UREWOLoc9F7U50v7snUJhN9diWd/cGoXpdn+T7X
         R4l5krpNZOSdynIuIIasKLU1Whk4VBtxpJQm5bO8XVcJNzWWRSe3RSpEYn7ipvNvgwnZ
         aAtg==
X-Forwarded-Encrypted: i=1; AKwUvBxk+HPcD1lcGuusLAqacrEVVSaSwIWFs6k3FIKHtZeMFFSzdpRdYlj8a9FbQHTCmIEWdp+zCoJxk+DT7tQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k8J0FmtBNpprromTdPVByopJthDxARspzsR/seLpr+qXRAe+VS
	N9srJj3D9zm4Unq5iDnhkf262IUKjv73aYClM5IQkWSZ2xVPoE+EVqtMZETwlREnGmWYVVxct0l
	tHvEVIWgjYHCtzajNc7aw1pul1SVX6iQnUnZ08QG9DUQ5SujVMPLQwmC7/3OumdDqGt4=
X-Gm-Gg: AYBFou2YcLAGhHGsk+1I3azuP9/unwm1PYi3rkgKF6wVAA+5PdJCwXmP6sy4vGRv9UL
	WPtfrOBzECBoMJyg5TW3S71GZpmgg+W6KnS2mCGMFsFQzNSt1SwFANdmRbWfdIP51otjiVNmpTq
	uJ+WKAlPv09kS3Jwrd6w3u/IkMMJ4K3o88kOOVLukxQAqYkuqqaBmYkFyFG+PiLXUh7V/dBvyeu
	PciqyzPU44nGnzTzr3G5XHcv0tdbWy/hMylVyveqehaltg1w8g19WC2/jQiSZanpVc8oGV8KAHA
	MZSBXcVbYpVOIy/YCyWeKAMsa8ulwhPr3gvEhnPI8nerCa9lyhKEdn4iR4IhEOENEQqWSEdOAXN
	Uhz4YxJrTxmV4Cw==
X-Received: by 2002:a05:6a00:ad03:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-8874f2e36e9mr852615b3a.48.1790768964167;
        Wed, 30 Sep 2026 04:49:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad03:b0:87c:e6aa:30e4 with SMTP id d2e1a72fcca58-8874f2e36e9mr852592b3a.48.1790768963683;
        Wed, 30 Sep 2026 04:49:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm53163b3a.46.2026.09.30.04.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:49:23 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:19:04 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-el2-v2-2-f0822be5aaee@oss.qualcomm.com>
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790768950; l=3244;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=9TYbxqQUeB+TEAbrGkcxMgP0jMpjNw7Wfhnhbk3XKwk=;
 b=P4dOC3xFqOSqDABiql6i5zoc3/30SWw3IGb0Fz2kVC9HVmhoWXxgPFUBXIS7gmuTj9sIpc42N
 ej26jk9Hj1EBlGkMolx1tfQ/PruXxxreKqDGD7FyPu/cUCmRiHWBDyg
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX7tqWPHebXuPh
 tudpISYhgTU+2JL3IKEugBqD9+Kp8orGQaBm/QpAs1Hh/TTFub32Bb206nQHQ2jJq+5cRHGOh1c
 +yGpHHrWNOOvR/dWhNhpD8EEZIzrsgU=
X-Proofpoint-ORIG-GUID: JqSOt_AQFSR7HWJs2KZ58B-0iJy2ATc6
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abcf744 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=f9U2glbQm_qsoaKGCbYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: JqSOt_AQFSR7HWJs2KZ58B-0iJy2ATc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX+icxH2CGv97r
 jPBNcR/vF5D/V/zhrFE5lHpxF3ycDh02NzR15eYeWwWKX1YaYfFthc8Js2OohtoOKxho0QMX7fL
 irOUeZ1LqoN8XNGQmBvLpVzjKFjpGnPVHbPUjHn0gEVMJ8PYOTFgK7ydbLK34neTEz1z5FyG+XJ
 A7bwG+JLYglJKIPlfygi+2c8b4VgUP/0VeqvqM32MjXb1x0P+GFKlITytEVnyCSaSjQTY98l8Tf
 hyP6OGNzgF3/jmv6uRcoulBxXf2qf1c3UviKZMR5Z30+gjbscP5g7SkKjNphclxCH9W4mUEqV5C
 h+lKB3Hzg1eDKdlry6doJWueT4E3AY/VJAytzL6zsjlXI7UlQq571KYFk9PEJGx4koCFeAlP62f
 LMJ9yQeNhhmxkOFoegLpinAeLxSnswY4pYk9zL4DRLsAE1YSlt4z296hDya6y9Pps0Job6oDRAT
 c0NPG3nsYqArLklGAKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..634914b8f229 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -367,9 +367,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
@@ -377,6 +388,7 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..d2f3186bd47d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};

-- 
2.34.1

