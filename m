Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708E13F4101
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735032; cv=none; b=uXKriqO29Y0DboJUABd83RMlYbJ1LQxHHnRQ2nNB7Zu06xX+uY+Bh92F5YSpVp7KgAdKfo9o9f2z/dbCKboukbDxwFvQ8lHNUD5IOkcJcNTPkVfCqw6NT9acYmrmLMLiSvcdb1c6ua4Y0EEpk+1bOgmViSMiw+q92rhhWs87wPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735032; c=relaxed/simple;
	bh=x0Hsjck6fwiGjBmD4BTaV7uSs3/mId3DYyzS6qMGzL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PJO1lyOoRCTvtNRZ5KVVUYYWRKi0b7WBPtZKFxzp8q9zp4G9lFoukMJ2zHKBG820B3yh7v/ZPF0CoWhSg8leDadpPd+Khlg5v/wIvj0r2BvyvJ1vP1kgqJ/4o2CRGfjY3DkyEjGbbXoHm3mwr/AI98EoB8MqZ1kxpN4w222etqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQTDllXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dwccf3pu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQTDllXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dwccf3pu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3cJw3208450
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KoSwLOQDyVXoDI2yhKSH9B
	n+jDhW3ogPztYMI41HL68=; b=FQTDllXs467UR0k+K2OouqMmsFcIwTuKH9izjj
	dIla+1/HZr705lDnkgUXV969U86Spn9H9aIuTnDIvg+OQ3lyco689jGfpFh3smVY
	sp62YS83kSal1nX3LUnN1l2mCPJx5UxsGPQ8YVdkp4RRxuMNloSRKVg718eP4upJ
	Ik+c5NmCcxR++A4VmFGL/yXs0XX8CCJ6/awiVPidKi6fSLNOFrhXPWPvE/CpmHCt
	saxWU7LAla+qTWJcwdXYXoHtepUPjBNNOi/LhxvylaTyK0xR4ABFiN1pMG3UL7fy
	scZhvS3X8TuvT7rBNV8e6ZxppGGSVT48Rb90TU2ZEB4pKZ3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dghrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:37:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so1197890a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789735028; x=1790339828; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KoSwLOQDyVXoDI2yhKSH9Bn+jDhW3ogPztYMI41HL68=;
        b=Dwccf3puoStN4Xj3xHFnz4RhyEpscn27E3uiXx/uD5morWYndXSHexkGfwEtxUtwyT
         0eWrKcr/WydSE7AjvZ3tUyhDAXiKvv1VeU72MxsmxF2nnWQxOirFmh5/3fh9XStIFGFN
         p3OW2UsluWB8KOyetO++4QZ/pn/9hoF0mfRsPosmG6DBXXqTgUEF1zq5pOjuWYT70SKo
         Nt9SfouN2Vg7E1mvVnA+utz/sOr6/PMskPTOpSQHeIagRDY+Dao6BYUiItyCoGbZAtDb
         bqJXIdFecx1CWtCuV/EiSyTCbGszIeDaMVl73mogVlZrvO7RF3NSixEzR4spSPni/af3
         TO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789735028; x=1790339828;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KoSwLOQDyVXoDI2yhKSH9Bn+jDhW3ogPztYMI41HL68=;
        b=VSmmMBDPcNcY//fHIyl+qerxsIS5K1fwg8lqHTSurr/0n7G2PX45Ay8DaiqYbdmqDu
         QiRwI2Jwe7H7ysUD+Yi4cp3WLUndyKHrDeDBR4FRwdM9+6TY0RVgYz13V7mnC4YAAp8u
         0AgRSCkuEbG3Nepigif4tpAByTEv1x+KEp0dAhtvg/Ge6Dspi2hh2kq87IUdAZTNtvwu
         81d7/Wd61SbFMibI0n71Hbn5+XzB/P7S8eU00Q0liNDwtHmk1P5iKon8+GzsRJol7G0i
         DkO5hp3PjHrH1XA+iLVmxj2N9YjOiJzUaxuvXp84r3E46TEJCmAlizPqg0j7GuUMM+rr
         XbjA==
X-Forwarded-Encrypted: i=1; AKwUvBw9KoNhPn39JAJt/OX4NyPXEuhapnDmg/UvMnIAe0XvxGfY0eT1njJ8eRUdNHpP6wFqTAvpYjquGXsTItg=@vger.kernel.org
X-Gm-Message-State: AFuF++luDOIwvYGxWOKllcID9oAue/IHa0x0YXon6Y3JcD8GQ0TiA47G
	jY68rMG/JqBh/ToMAew5BA97MVkS3MA3xc9f2DGv/5Ysvpz6Jf9LtfLuRbm+h9r9yzWO8k9VJ5T
	GXFq1TIH/49lNFXN/ofNnIU53/nqC+BhnPgPvVny+jdADFHFE83odOuEKjSXDGDu0Ub4=
X-Gm-Gg: AYBFou1N+D6oViUIfy/DBbhgzY4I9VU+QwCosC2bvhoUzlg3u0WE30aTqtqi1XeE3wA
	rzayq2FHVrY3sS1YmHvBCmYvzNSFPc50gf9YqhC8U2bctRrZGfEjjPfpV/7HE6cGYUbsLDQUeSB
	GTxskfsE5f88PJWLGG3pULIe2q/zEfE91FuO2UW1JlHtKItZccOesG55PgVyZAX9Ru+mDrt/x8I
	lf/E2dKSfQwongQMw8NbfUyjExKO0eLW3u1LdnwpO1iPKcjNInaVhoZBR8S/nJi3T9aAvaHTzwg
	BZUtGYMrV3i7uUBmoE79L7aXhuYLrGrsOnB0GeFMtBL+jFl/nwwCIwK+sw1FxgOb5XYRM4JKGgk
	LzkQfCSoE9q3elA==
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr9995094a91.12.1789735027886;
        Fri, 18 Sep 2026 05:37:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr9995035a91.12.1789735027437;
        Fri, 18 Sep 2026 05:37:07 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a53a70bsm3104829a91.11.2026.09.18.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:37:06 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 18:04:17 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc
 SMMU mappings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMkvrWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ML3eKMzOyiRN3UHCPd1EQLSzNLYwvTZONkJaCGgqLUtMwKsGHRsbW
 1AP0o8qpcAAAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789735023; l=3512;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=x0Hsjck6fwiGjBmD4BTaV7uSs3/mId3DYyzS6qMGzL4=;
 b=Rvg5PIljTCvCMPgrHbv6vNzUiGtOwYMQ32DsDb/VPRbkx96JaJt6R0iupYGN4i2e2/KzlabW9
 TAoHahDSX/tCCAABjiGA7ppZcyk2+GuUdR7QGrJTCqAsh/figQ0Uiro
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE3NyBTYWx0ZWRfXzCpGnkYt+Np+
 /1qquP5nopaHmO5bMGnKhgmrP+Mg43m1es0zY4enfhQVm+ltjUGfj9/wh2DCE5GhleHRvHJGO+i
 PobW62LcgNGYLaTkeuy24dmOZ7P4WoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE3NyBTYWx0ZWRfXzy+GfJp8pIcv
 uuyotAYfgJTIWxmJJmBIf9ZifV+o1jfbLKQkFF4FNd9Fisvs433ghN4AJDTVg+Zt4CFia6j3uAb
 v9aBjLp4d9vSwmS6pG5mNiLgiIRMf/mI5U2PTrA4gswObM4h6LHsrBJAFoTTGqX98T6IPJwFy6p
 3V+wBJoywjJBce289M5DPLLNbrZNUQaJFkoYOV6VOiE9ZiOEqWR8VRcM+esMRSkk1WB/e28ZKQR
 hbatO5S5vMXUf6YCc/dcifDxrHt4SSf1BIXmCyX3PElwQg+GkpoUEr2/eWA+Bc75KXlaM74KOsI
 7Fc5shMWDyhd8G+wnfDrd1Z8v71VQFRsc0KCuJRTs5ppTv8GT6NKnRCexnO+qqhI61P7gQaDMLo
 g8xZ5fDu3mElwqdZ1qu/YiwTOo8gjokF0YOdFOWLL22uoz0YwyL56MuGuhxyCj0MBr/rz9noWjr
 lOjvzEqNWGJDpsa8O0g==
X-Proofpoint-GUID: HZR62OLaxl-KPG98cLSeXGA6YkvjGWLG
X-Proofpoint-ORIG-GUID: HZR62OLaxl-KPG98cLSeXGA6YkvjGWLG
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3074 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=f9U2glbQm_qsoaKGCbYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180177

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

Komal Bajaj (1):
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-el2.dtso
---
 arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5c19f945c785..686d37cab02f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -359,8 +359,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
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
+
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
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

---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

