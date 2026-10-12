Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A133793A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793963; cv=none; b=u3MaD0vI3+0hRbF2+tTmvEX1PBk0JsMavdXyTc11qFK5RCm1DEi9qpp+krxCnvLy7j+h7/EFWfw9fcUppa+hlb1GvtwrIdb1mif3w697ORogt/V6ikR3fwoJoGYNwdERDFyjpDL3+vQ0rhGCfoFxtz3DST6IAWF62aTqZR8ezJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793963; c=relaxed/simple;
	bh=17TGkrOk+IXG3R2qouvLuEtZDXHHU/tNRL4Qyw+91Og=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fW2SdsA+Z1d9XnU7ubJ/oqS/hQzgiId7bnHbBkXTLusj1hPknVHi5sEMKvgFwOS3DprKoLIy5owue+VSGO5yvK6x6E8ECNmgxyu6WsG02+4+YngklZWwnK2f/LkhbFaqEUb4vwyo10Kn5vGwn5Nz/c5QUYkkTXOrWVJYfcQuSKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv0Mp+bR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgtCQe+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv0Mp+bR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgtCQe+8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KmfS2181482
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HDeVLW5vrcC10CbNGmlYGy
	w8sZ9HlDHmo+AQGRpiE0Q=; b=kv0Mp+bR63YRAC7IU3n+6UmzzsaIb5oOzCHRW0
	8ud8zUXZKH8LtpHsuIxBv1Dz60pskKnP+aFgvaAfzgtZzSzK5aawbgYBchGpI99x
	wNY5F5eA+KNhEYjcATDBY0wz9ke5WJCH7QPZl+zPYRCEXoVSD/FwmIsJKufQ78q7
	TA+nU/28WxzD0Fg5oolfFsDXhTy0TDOTXzorCPe5UJAffrIGED+QoYIv3+bdF5wc
	dMSp97Bs8Aza+ibb/R3D6+EEcDjE2aQHw88asnh9DILNvDzGXLpDbs1hCAVjnrMv
	iK4Tlmx6R8GCLSlnVPe3lW5tuVfpygpQkrzTGTKp/uQt9Y0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rt1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so1493463a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791793960; x=1792398760; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HDeVLW5vrcC10CbNGmlYGyw8sZ9HlDHmo+AQGRpiE0Q=;
        b=MgtCQe+8OoliwbPiedY+CxZcCIdd+Zkzxeb+goU3h3QslODxhIOYR2QXRpw8XI+4I8
         yk2y8FWvmHnxBRKbGIYeFjyftRSC+bjxrPUByJMZqeMRHJcIRBeOnUr+y5j0MvOJJOUS
         HUF5Fl8BOW2zoZO96wJgVyK2PP1QJBBjUE8JLl6rw/JT2OiCYkfVS1UflHzJ9li3k3h8
         CM2Grx6moLClxVOA2HNoInIWaQ+cwQ/0vshgRZXL2dknlk7yjvnc0zV6UrDiEhpf6f1r
         1ZpNUydqJd7GvBUyooK0bwrchEP/DlGhTBUxFcFJIDkjiF/a4D9O17a/cCsfuzzP+pf1
         S9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793960; x=1792398760;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HDeVLW5vrcC10CbNGmlYGyw8sZ9HlDHmo+AQGRpiE0Q=;
        b=k83bYajnQcTX16i+KPpg2Aa2txyErSx4he40LX74ICebUWoEs92MJ+4wUgtN95eHFU
         EjdyU5eTLbGZhhR4LNk4xxFfYcS9oyb+thPUm0f+Vt4gIfXcNTKwRItUfhb0T5HXolRi
         BKBdGBoZ5IBvs6+O6C2Ou4pFdUN+RREHHr7DVi0hnCInwo3hu3c/Y803UVfvIXuNKlqb
         HyJdzOWU5ybQ2FLunJP8T2Lze0a/Q27+lcVcYjRriHfzEsekWwsmJ4GEbOvrUBV31nxk
         7NnYADTzG3H62n8NRDI65tSwCHtlkxQYIaW4BxPs4WRfG4YIMkDjL8JiDTSZXlwqcZjt
         pOBA==
X-Forwarded-Encrypted: i=1; AKwUvBxW6BfBhEGuyAlEGzxDim2dA/ZE0l/uAj6T6fKqYCBbizcUUKhdpC+cc2kpUKXMN6Fhh9kiibCQG8xbYtc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy8IJ1HoJbK53mjwAcNVbK/W8GmxdB6OqoY3p+R8qZVUTqn3sz
	PQwg9Rz7z/xIVGUQ9t84niEO7FFiYvX0JjCdUmUC+drGr4UrqR9OcHHMaEp1EkJaVEBEl4SnzID
	O0pVQ4fsFCSsx4NDOL3YL4rzVwyCCcP9n52GzNb9a0I/kS8uq+A8mEdLlBp5fLbIcstw=
X-Gm-Gg: AYBFou1r7RtdnwU84ki1r7Lvw3S78GHHecvANjLpXYLegA+ynE2i6tJnfFx698YxzC5
	+5aGrJbE2hnc2RDmMFsMSmwU1ZXHGcBK0OCbBMZN8xGqkzBKF/pPLEU+91Ghw03NQF2dTyW18AF
	OP1gbkX6T9XFCC7SI6uGBHluvqfY+qWqBX6IIBn2UKWcQdC315N1n2aR/O8wL4WwhvwfO9Y3ZH5
	j7XxBsT9PtP2aJVriooWPS0klCtVKPWOnsKuax4JbGyd+fvB0ygqivWBLxdKWdthuX+PDH02abQ
	tlt3vBOPmcwjLZiZ1lbPVi2gxH4ktC+mO9QcIxZ3d6UWXWl8aSNVQYeIMvQxDcwojMP2h9Us4Q0
	c3nlIZMZvWYoY9zl8f12wmL9QpdzSn3crYzHBdu48t6QquOMCfA==
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr3166388a91.11.1791793959793;
        Mon, 12 Oct 2026 01:32:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0d:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3abb39f450amr3166379a91.11.1791793959332;
        Mon, 12 Oct 2026 01:32:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm15749423a91.0.2026.10.12.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:32:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Introduce Maili platform device
 tree
Date: Mon, 12 Oct 2026 01:32:29 -0700
Message-Id: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2bzGoC/02NQQ6CMBBFr0JmbUlboVhX3sOwGEqRSYBqB4mGc
 HcLKzc/ecnL+yuwj+QZrtkK0S/EFKYE51MGrsfp4QW1iUFLbZRUWoxIA4l2ZmFk2VaIVaWwg+Q
 /o+/oc7TudeIG2Ysm4uT6vaCktLvWE88hfo/HRe3yEZdW27/4ooUU1pTmcjGFcUVzC8z5642DC
 +OYp4F627Yfcwk3eMAAAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791793957; l=2679;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=17TGkrOk+IXG3R2qouvLuEtZDXHHU/tNRL4Qyw+91Og=;
 b=QvynMEakRHxX9ojhhoEmf7hfq2A+0tYuwdxXteUN1t+6koOKfXglHph7CsJZeTcNo2/gJ9pio
 5z1Lue+kmtbAzgAVU4/b//lIpHbm6mXAU6khcnxOzBG5itjk3Jp/W5x
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: upTI5pg1PT0ksap9UBKgBOx3N9fgEJln
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfXx9geHs1UnjO0
 jGGQyanNGHPLhdl78GEW/Es2fz6hUynZkSCGQK7n9DKmvHIxavhQ+yOVY4n+XPaQoUilgjSB/1s
 kFqClkVk/6RHDj+puaTB7dC2IdIUUbc=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc9b28 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=PSjTE8wPq6y03Cg0TIUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: upTI5pg1PT0ksap9UBKgBOx3N9fgEJln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX9I5G+Hu/ccMw
 XUPHYT6LWmUA3ddgK5Y68bwQBoj6uUkPyuLCb6xfm3xU18xqIHPMxMKrZg/H9N5FN9Yws5RUxwZ
 Sa1t2bbT79SqNS/8F2mL8a6mSEnbvWH7Z3xlSedZZrCv4L2J336peKOctXi8voy2O5LdWDMkA4O
 2QjZ2a05wVLMkrfHDgAyOdp/HNdg/3iLwyNmI+hSS5y8VYx/M0pnRxfeAMrTtFV95Huzd3Pj7pF
 0jKBTj/10iwLCSITdr956Ww5CCqlMaE+JyeM6Rto0gtAiI+/E+exqyJ6OYtoIV7NxArH8uruGZy
 xOchYUwm1wl52ZSvKZn4huDyGcFX7Z+gORrrLfN9s1r4Hrcnp3KlKocm84L8gaZSXhh/E/gyB93
 IPeBv7W2E9WS4ae+okCTx1LM4W9bZj4lyF0/EaCd7JhlVE6yPvx/HQ54XdZfM6AioRsWVZ+a0/q
 Ce4SAiT34aoEKXewZPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120033

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-gen-6-mobile-platform

Add bindings and base Device Tree for the Maili SoC, MTP (Mobile Test Platform) which enables
boot-to-shell with ufs, PCIE, sdcard, usb, DSPs, PMIC related, tsense, bus, crypto etc.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC/RPMHCC/videocc/gpucc
- TLMM
- Interconnect with CPU BWMONs
- QuP with uart
- SMMU
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- cDSP, aDSP with SMP2P and fastrpc
- BUS with I2C and SPI
- USB2/USB3/type-C
- Modem and SoCCP
- SDHCI
- random number generator (RNG)
- tsens
- PCIe

For convenience, a regularly refreshed linux-next based git tree containing all the Maili related work is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/hawi-maili?ref_type=heads

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- fix qup_uart22 gpio function
- remove x2 OPP entries from pcie1_opp_table table
- swap USB QMP PHY vdda-phy/vdda-pll supplies
- patch rebase
- Link to v2: https://lore.kernel.org/r/20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com

Changes in v2:
- fix the size of mpss_mem
- using 2-cell specifiers for iommu-map
- add reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com

---
Chunkai Deng (1):
      arm64: dts: qcom: Add header file for IPCC physical client IDs for Maili platforms

Fenglin Wu (1):
      arm64: dts: qcom: Add PMIC support for Maili platforms

Jingyi Wang (2):
      arm64: dts: qcom: Introduce Maili SoC
      arm64: dts: qcom: maili: Add base MTP board

Yijie Yang (1):
      dt-bindings: arm: qcom: Document Maili SoC and its reference board

 Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/maili-ipcc.h           |   62 +
 arch/arm64/boot/dts/qcom/maili-mtp.dts          |  960 ++++
 arch/arm64/boot/dts/qcom/maili.dtsi             | 6930 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmg1110.dtsi           |   57 +
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi     |   57 +
 7 files changed, 8072 insertions(+)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261012-maili-dts-605d7aa771af

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

