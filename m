Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA13CF039
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749923; cv=none; b=KAtKQO2K6o+4uI18+1HVrwam+Iz7HQU4+AksbBlpb4FCG7a2BPeFRZyd8EKN9QG2ZnDxH+BFtSfvmB1BRnjsOASZYZj0hqpjyM5+ZaZ+gBT6EankL0n+45HPdS1yioJuOSKYeOQh4+IFJ9IPkgVZpfwFlYOaRaI6BLkQz9xBMIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749923; c=relaxed/simple;
	bh=GxqbH1CHSJlspzWNldegvj4CiglyOW0Gfg60hT5MZPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mPqbEeNLPEyWofI8VS/BHLeN9EcZlJtusDrysHFiZWfo5ao4kPFOSPFE1KUBTxqMFN0T32bDcqYrSg8/fccDxPFA94IbS5Rrc6KPsRJGO5CK4axmIYYF/CXs43IlRwg1JopBbzJLLG3m5u/s85gkCopVBJ1PRJdxyd5ChCeIs0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Skbhn1uE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcEnL6zx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Skbhn1uE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcEnL6zx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6GrZW2899505
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5Elp4C05nM48nzcrjsWZIc
	niOHlR2V1fdy2kVz45OFo=; b=Skbhn1uELKzP5gIrpXAzXaDFfRZkGoEefnNdQs
	fKY0BtcGPa+YbVamkoBG1ZL2p2ANgv/j6KOY4IYlK/m1Guwlx0JiZ8Oe86GMlzhY
	2Zz+waeCkhmCwvvRI0sUYNVou9OxO6TGOpDwwz+4VpYcBmex9/nJXooo7PaOPwxr
	HFp1zdsQOkllTbC167ernPcuLDUsDx5Lfd7FLizvTcQO2mSTTqaabP826RRRN3QT
	NfPVUotZwF/yGFxZuvLQtvaWeEcTGXeEyUdwpJzTclOSKbL3W2hGN9JAkq885LIF
	kqtvPCifr+jrOg6+hAjIsI3cK1MFVWLh+HW4BvS35V8Gx/Jw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1401s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:31:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so5601197eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749914; x=1791354714; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Elp4C05nM48nzcrjsWZIcniOHlR2V1fdy2kVz45OFo=;
        b=HcEnL6zx4Fj0uCBXoAI3fu7ZSAVq+qHw1ynykePDyeT67ezLMgHu067tZt6YFoOzYn
         y+HltRV3cASo6n7JuaNAv/RtbP/AfKbaT6kSzvoZPlqHFhLL5KHDKSc3VrX13cj2pFCZ
         DXHZwA0Aw00mWfH1ZH62YjOm4E6PNO+3mkQQvR6qUY375tbJfksBDEm+AC0Rw2200T5t
         MbbiBpHOJwAhPP3i6QupAz0/4ApPz+tHKPaChvwcmszjXlFqWOhZfCQaLfVHa8tUUsHs
         YesIb6Ko+nq0UaUpym/7302VzP8Akif7HgSJxr9pSe0u5vPixTNAmNCD6yusILhVxrix
         B3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749914; x=1791354714;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Elp4C05nM48nzcrjsWZIcniOHlR2V1fdy2kVz45OFo=;
        b=hMM4YfNxAuxwv0lPtCMJ0gD1mPPuay+dkOFslKvdQlmxOArdMMNptYjtoMNhKMkk4t
         Altia8aRY3ITOUIkj0IjGq4SVW/hubgZiwJ6cN7JqdLKlV6AqFwTRlmREUwrdfOHpfpi
         59zNHocQ1aQlPR8AJSS8WDCo4WIbe5x20wXbVVjfCe9aNw6I3RJZQBS0kLTPpSUR3w9T
         V/D0Oz5lgRuJygVgvJEaP33wmNH5WECquM1RsuRV6j3SGvohvz9DE71I9hkf+716qAUr
         6hSVCgAuB7ZuPsvk4X08M6JDDGyMdLqIRzQww40O3B+s4PcTK/C2EFvtIKsg5VwQYTrr
         J78Q==
X-Forwarded-Encrypted: i=1; AKwUvBzon2pspYP+A74gEbD3wicQIbQ7NDEnJ7RJvA2sAkYrUlz0/XTMn8IPTU/BrMnJ2aV8roXKHq+Xp/N9Xbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgEz0nSwuUsLphgE4i3F+a1ZyqARYqLROjBU3dX/+So+8ERWig
	aITi/RFPmW9D5zhUQZR5ggbNxRgDIzuItRi/O3j41dudo+k/dsSX8kwawnXJPgK0+xyCU1zV22a
	Y56Z980oJ428FQAG/22P+SMHdGURYjbEo6uVGi5ITlZpXV4yWDkPXiu8GyY9AhmUrR7k=
X-Gm-Gg: AYBFou27PIqcDI6Fhg28JJW5H/H7T2Qytn3Jg+yuB1SYtLoJKX/xrz998Xls2k8zPOM
	/D7t+cEW1CX/b3JzyxNOHkcWbJ7bljQ8mRZQ+iSnDW4c3j8lyQDyDN60F4ulQBNw6AvQiNU4HYb
	oGv7KgxQDpho/TnPxiOiC6ucPeKVymxDQH6Zk07gPAxrTXhKJPbK/Kt+DbPK3NxUrI2dcHc6L3y
	WbVzrT7dv6SS7EsGWqQPkdE4c/Ce0djHG+fenN11sLRqEPGIagxmbdUrx1LYXN4UtErDEsxAkKd
	TxhjCwcZHaQrHGsqWa+MZ0nEjGAptnxntIYTFo4sRvWOciOyBOwb/m3kk1FUWARMcSfx/urjwT5
	5c/XDwxH5BGcI2Fi+SyRmbQJQCfLElzaK/9Ttmqd9oxJvqtTxVNU=
X-Received: by 2002:a05:7301:4b12:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34cddd83c25mr696807eec.39.1790749913578;
        Tue, 29 Sep 2026 23:31:53 -0700 (PDT)
X-Received: by 2002:a05:7301:4b12:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34cddd83c25mr696758eec.39.1790749912904;
        Tue, 29 Sep 2026 23:31:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: Introduce Maili platform device
 tree
Date: Tue, 29 Sep 2026 23:31:22 -0700
Message-Id: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqsvGoC/02NQQqDMBBFryJZN2IiVeyq9yguJslYB9S0GRtax
 Ls3EQrdDDx4/80mGAMhi0uxiYCRmPySQJ8KYUdY7ijJJRa60k3V6U7OQBNJt7J0dXvGWjnAAUT
 yHwEHeh+tW5/YAKM0ARY75kJeZ20kXn34HB+jyvIvrv/iUclKgtVGmbYxg+uunrl8vmCyfp7Ld
 ES/7/sXJEe5dMAAAAA=
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749911; l=3112;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GxqbH1CHSJlspzWNldegvj4CiglyOW0Gfg60hT5MZPo=;
 b=Gchh2FhbMf9DJyVf4XHt6oL+dM0246wPlkIffdjg7FLhHl53oxdcWzso7K499JOwFnxDk6ry9
 T8K6dtqIx7fCCoQe91C1/i5dvkCYy91yGojJS8UL0WPTSW7FBLOWwxC
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX+XjvUoCV5f0V
 M+hIM9yvUpYQmXGoUPL+kD88lf1Bb3pDLmVCjW62NlUPomdEVLTLXvO4Urxf0GLpuk59KqkOwfk
 sayWfVvAN3RzQcqR2rgYGU2XuQ7OpbQ=
X-Proofpoint-GUID: 7FDNaH_zjMSBoOZ-ASbjWzpsDA3fu7kC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX93UhFQ/PVFwH
 zX2DyvLd7JwxYXq7M6yNybCxWvNMszIUUOwznxxPr2qicGJZGfHYPzaNUq1dws2pnfn9LyGoPO9
 cP49zF698+K5/02cCUrPYlTQG5Br7AE3sTWVLsn9GLUh1Yl58aqoZJ6S0WinRDw7y3+88FwzwkN
 vzgz+dgWUl9NKqf6OtL4+j+TWmXt8LIWcEONaS2p40WWpdkDmJLqS/h7dJGFf/LPdhUnWLTv5Zv
 FOdXwaaGpp7DSkXD0WhZaPP5sRGr3yOYrWOoB+fdNW3d7cE5IeThSEWhyy/c2GoN4VfBPSq50KU
 z4TXfcfDBX3Ne+T3c0OmJ4824JXYVbz2jAJR1jgnDLwPkOWTC5SWBcOXtQFA3E1jka5P7ym+Cgk
 kdBGx1mKQoiGXmLoOjpNfQ3m9fhmO17eRiv7/iPGgxUygnHzP6xe1rbwhFqwLetmL6bJlP0jHHU
 dhCJAvR05XnhrL/K3Bw==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcacda cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8 a=_I6dFAXXm9IZ1C54fn0A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 7FDNaH_zjMSBoOZ-ASbjWzpsDA3fu7kC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

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

binding dependency:
ufs-phy: https://lore.kernel.org/lkml/20260917080622.824253-1-nitin.rawat@oss.qualcomm.com/ - reviewed
cpufreq: https://lore.kernel.org/lkml/20260907-maili_initial_clock-v5-1-e79bb6b93a49@oss.qualcomm.com/ - applied
spmi-pmic: https://lore.kernel.org/lkml/20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com/ - applied
qup: https://lore.kernel.org/lkml/20260901-maili_gpi_binding-v2-1-c10dd2324a09@oss.qualcomm.com/ - reviewed
pcie-phy: https://lore.kernel.org/all/20260917-vdev_next-20260916_dt-v4-1-e2f22f67646e@oss.qualcomm.com/ - reviewed 
gpu-smmu: https://lore.kernel.org/all/20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com/ - reviewed

For convenience, a regularly refreshed linux-next based git tree containing all the Maili related work is available at:
https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/hawi-maili?ref_type=heads

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
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
 arch/arm64/boot/dts/qcom/maili.dtsi             | 6956 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmg1110.dtsi           |   57 +
 arch/arm64/boot/dts/qcom/pmh0104-maili.dtsi     |   57 +
 7 files changed, 8098 insertions(+)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260929-maili-dts-d375e31daefa

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

