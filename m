Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E237A857
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725481; cv=none; b=XZFCc80tcuUeUl2wr/ANhUVHQFPrBGpNCpV80ktq4OFWruQnQlSCzUz3+l+XZLeRXKyL33BD9ogqXH15Z6IPDslYcxWA1KEhUL/WwhmmiX2IwKBk6/w15fJ+14ZcyDDGTMoUUNLxl84/dLbmfRwKGYquWKlNNHgcyjqTHhlV+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725481; c=relaxed/simple;
	bh=fYQnJwvIDr0lMmuidC0MbYkc/xQ9sa+ACmO8nhT7Um4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tUpx6SLXrH/oW/NUImiIQmS7aAVw6bkOervhXPamFzzFCYACq70MMR01DNGl7x5amfQAMUje2tcGdSdor/G5KGJB/VOyuU+FuimjjdXm0CK9/3lfM18McvPSab+2xUq8nf5cGw2yqoGsDYbfKDG+s+bNo4F8nmTO1pOXMkVwfY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp8AUkEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhasou+z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp8AUkEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhasou+z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dO8I250731
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LlXnTjIgiRIy2Jyv97jSRe2p67ffz+Qkf4E
	Z81jikDg=; b=Wp8AUkEs1A08wHTtaOVeV72N+8IcB3ZCnw0GlOHlmy2nyh7Nteq
	t9s7zXVfOqrod6zkce75XF5naUMh1GlNtqgUUD+nXHkfdCP1EWmVwMohDNUXO5e4
	H5yx1cyuhWOkwRrLdxNjtkgGB7iMXgU085RZIXOlrLCglAuQMu+aUPlQ0S/172J4
	uJOcg67r+M118DGEi4KDjBn1/w1rzSrRNvClJgD3UCg5iEnrEm+avbCJG8RnOzyW
	SEQd5AxN9f1b+gAYHm0KcVVL753N8oF4gZhw3+7c8dDluwygY7o2C7M2bYrTWT9J
	4sgv/vXNvba8BsNWlZfIRPOHnisoQ6qTiaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23909e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:57:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398bb9a6408so168441a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725477; x=1790330277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlXnTjIgiRIy2Jyv97jSRe2p67ffz+Qkf4EZ81jikDg=;
        b=Zhasou+zXH+WlzuvyMt7mP+afAIRjJriHRoOWya4k6sZ5DkGG2IN43MCk7wdILbrWK
         W/VNeQPMRscSh96ErmLvL4OtUo1CQWkKZ0WDi4NGsCBUXd8nPO05DAE84IIR5xHnyEgy
         lUr7NdeWxWi3MfpgknKhIN6W9mHtCPLG5uBiY/i/EWZrlFmabF0Gy2L4hPxnvCSjhh5d
         xK04EKGupMeMBPv9AVdqaqnoAXZP7wOWndIu9wWDLqOapoWXwLRI5incjKp3IcNHvoPl
         pX/keaLy2P+XYTUDG2SY63jHjLMneXjvNvYoqbZB4qkjeBmaZxLkMT9J2BNb6Ve/aqS/
         DTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725477; x=1790330277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlXnTjIgiRIy2Jyv97jSRe2p67ffz+Qkf4EZ81jikDg=;
        b=CWftMB0GKNpAOz3sLmMoYmBJFAb7dSWFLKUmGKw66sk6DImq7D2utHC38zAagaHqj2
         1k2F6KaqgciG2VqfsatBqHtLK8xuksl5l8u0/c7+9ESZeMtuqPT2d7V59JaB9OHGtm2q
         x4ervt8kdPVpeK1y/I7NvRrXnofoLnUEh9pYhOsdXUpCd98mub4MHL7A/v3a4qoIjdse
         gBZABr8n0jflrVtT94E8ZI+PIxDqC3li7nMc8itB8nuIY0BuaP2kxwrph3waav+umIXO
         Dn19hfu0f9KfJImEG/qoCchAjRRWriS/7IjNmveuVMCta2kg41vmp+XiNQhjaGchJszW
         TRGw==
X-Forwarded-Encrypted: i=1; AKwUvBxEicdo64znpG0VBcuPt9ELPEF1W0+RVonSxnM6Nzm5pMoIzh0uI0DoAY1Y01c5/Lz74Yk3quLF33xWKcc=@vger.kernel.org
X-Gm-Message-State: AFuF++l6fZw3910Kq/716IcvH56nIVn94l5R5sBVb0xtGcF0LVHDM91h
	UPjXSIl9S59NUGHXmF1Ss5G1xodeYGsRD52FH4lbOwC+FBd2B2LrvZrlfDQub/vbxynny1f+kqa
	KuAACsKCTfVabJGIcivIq3Bev/okraLVS9cH+VVBK7FmNxZzx1d5cJMDeYcRe0SKYTq4=
X-Gm-Gg: AYBFou23WzSyhx9WZL1F+xfUz+knfh+B+5Uxs2/cig6LMMazzZpnGJUrN/1TWRe9mgR
	drhCooZGMCH8F4uyJVTEU4jp3+xmYSMxbl+XhQMFcf/deIUbT81JgHXXyQwUn0uuWZxZlmVQSaI
	/7zwtSbp0ZsjMM+A3jjKgERwCU5FDl9HaAJf5P8PRbyldb8ZLR6PB6qH6h1xLEku2Wff6AlNgnz
	q8KiqKqO/KffwPSPy8NrTxL8AFqxRIGf6n+icGGDcgkK7sbCEuAEo5PCNLfS0XffgK78WXiUMOS
	kgSlqwShqizAFgp2v0PAVUBbDmlBH616x39wsGAbHAyKjtyL3AEtMgqUSHW/pGQ9F/rheaCDaxo
	O4bQWIxkd+khFLX6ic5ad+LUZ8BczAdc=
X-Received: by 2002:a17:90b:2e0e:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39e598b6ccdmr2978133a91.3.1789725477085;
        Fri, 18 Sep 2026 02:57:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39e598b6ccdmr2978064a91.3.1789725476381;
        Fri, 18 Sep 2026 02:57:56 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:57:56 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v3 0/5] arm: ras: Add DT frontend support for ARM RAS
Date: Fri, 18 Sep 2026 15:27:41 +0530
Message-Id: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX1ZDDnQcEqDK7
 XHVC10Z9McOj9USE5o4fJdTydUHOjKQ//5ecDR2RPOU1IbTVV6747J3l3QpRhf73nPBYVTfPo3V
 ZU3HSTiNuk63Zc/IR4S2TdCkVrLgpGM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX6W4ibn/Ihj4U
 wApU34mCSqJw0hZjodeMxw8o79ZbWR98aRAo8xTlerByxbqbBfaOlHk1j/rL6GUAT4viz94Bk3E
 tAE9OlKwm0lVKju0i0ADLT7eUvoIJng2ehjO69Pg3u4ULb696n3nyKkzV8e+3lzUaFPdg2i1GfM
 slFmfNKThsW8dbBJfNCv0MoyBydU0RdRMwD/fg9WqhJxbApgY6/xfnTLO/R0QFqmDfPo/RN6kJ/
 3ZkKxj/hb0TouLdIin1rue9OOfcjZRfau0w9UI884gnvQJ573XXJIeApypjfZO0E2GZQyKF7DgG
 2qxtx9x66gLfloetNeNO33wzIzZi1YI+xV96BKIVRjWWomB7r1XZmGopmjRni63ca+BG5BaQoBZ
 JFUvvYygOo/RD07B1Vv50nJ/HxtpPnAgI+VBPWwLzOghX32SrjeQu1PL+5H740HGaj+32zm9avR
 H6Pqh4w4PDLNtBhY0RA==
X-Proofpoint-ORIG-GUID: n9pU170QiCvkFnIHhL3K9PjgMJAimX3l
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0b26 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=LRrvzRMqVIShaiPshd4A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: n9pU170QiCvkFnIHhL3K9PjgMJAimX3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180137

This series adds Device Tree support for the ARM64 RAS driver
introduced by Ruidong Tian [1]. The existing driver supports ACPI-based
platforms via the AEST table, this series extends it to DT-based
platforms without any changes to the core driver.

How to test with QEMU
--------------------------
Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
virt machine.  To test the DT frontend:

1. Build QEMU:

     git clone https://github.com/winterddd/qemu.git
     cd qemu
     git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
     ./configure --target-list=aarch64-softmmu
     make -j$(nproc)

2. Build the kernel with:

     CONFIG_ARM64_RAS_EXTN=y
     CONFIG_RAS=y
     CONFIG_ACPI_AEST=y
     CONFIG_ARM64_RAS_DRIVER=y
     CONFIG_ARM64_RAS_DT=y

3. Add the following DT node to your virt machine DTB.  The QEMU
   fork maps GIC error source at 0x017a00000 (SPI 0x0d).

   ras-gic-dist@17a00000 {
       compatible = "arm,ras-gic";
       reg = <0x0 0x17a00000 0x0 0x10000>;
       reg-names = "err-group";
       arm,group-format = <ARM_RAS_GROUP_4K>;
       arm,num-records = <1>;
       arm,record-impl = /bits/ 64 <0x1>;
       arm,status-reporting = /bits/ 64 <0x0>;
       arm,gic-ref = <&gic>;
       interrupts = <GIC_SPI 0x0d 0x04>;
       interrupt-names = "fhi";
   };

4. Boot QEMU with acpi=off:

     ./qemu-system-aarch64 \
       -machine virt,accel=tcg,gic-version=3 \
       -cpu cortex-a57 -m 2G -smp 4 \
       -kernel Image -dtb virt-aest.dtb \
       -append "console=ttyAMA0 acpi=off earlycon" \
       -nographic

5. Verify probe:

     dmesg | grep "DT RAS"
     # Expected: DT RAS: registered 1 RAS error source(s) from DT
     ls /sys/kernel/debug/aest/

6. Inject a CE error via the QEMU MMIO fault injection registers.
   The QEMU device accepts 64-bit accesses only (use devmem with
   the 64-bit width flag):

   devmem 0x090e0808 64 0x40000001

   This triggers QEMU's error_record_inj_write() which sets
   ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
   aest_irq_func() fires, reads the status, and logs:

   arm64_ras: {2}[Hardware Error]: Hardware error from AEST gic.90e0000
   arm64_ras: {2}[Hardware Error]: Error from GIC type 0x0 instance 0x8005
   arm64_ras: {2}[Hardware Error]: ERR0FR: 0x48a5
   arm64_ras: {2}[Hardware Error]: ERR0CTRL: 0x108
   arm64_ras: {2}[Hardware Error]: ERR0STATUS: 0x40000001

Testing
-------
- Validated Processor error nodes/sources for L1-L2 and L3 caches error
  on Qualcomm's lemans-evk, monaco-evk and shikra-cqm-evk boards with DT boot.
- Validated CE and UE injection via debugfs soft_inject.
- Validated GIC and SMMU error sources on QEMU.

[1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
[2] https://github.com/winterddd/qemu/tree/error_record

---
Changes in v3:
 - Changed dt-bindings filename to "arm,ras.yaml" - Krzysztof.
 - Dropped irrelavent nodes from dt-bindings example - Krzysztof.
 - Changed node-name of ras-error sources to generic one - Krzysztof.
 - Updated commit subject text of dt-bindings to drop redundant
   "bindings" keyword - Krzysztof.
 - Drop un-necesarry nodes added in Phandle description - Krzysztof.
 - Fixed reg and reg-names to be same number of entries - Rob.
 - Replaced interrupt property description as suggested by Rob.
 - Defined the order for interrupt-property in bindings - Rob.
 - Dropped re-defining iommu property in the bindings - Rob.
 - Update commit text to be more elaborative and, change the ras node
   name to be generic for monaco DT change - Bjorn.

Changes in v2:
  - Rebased on top of Ruidong Tian's v7 RAS driver series and reworked
    the DT frontend to match the new driver architecture.
  - Moved RAS error source nodes to the DT root, removed the arm,aest
    container node as suggested by Rob Herring.
  - Dropped arm,processor-flags and arm,resource-type properties, these
    are now inferred from the interrupt type and cache phandle
    respectively.
  - Renamed compatible strings from arm,aest-* to arm,ras-* and the
    dt-bindings header from aest.h to arm-ras.h to avoid ACPI terminology
    in DT bindings.
---

Umang Chheda (5):
  dt-bindings: arm: ras: Introduce ARM RAS error sources
  arm64: ras: Add Device Tree frontend
  arm64: dts: qcom: monaco: add RAS error source nodes
  arm64: dts: qcom: lemans: add RAS error source nodes
  arm64: dts: qcom: shikra: add RAS error source nodes

 .../devicetree/bindings/arm/arm,ras.yaml      | 235 +++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi          |  20 +
 drivers/ras/arm64/Kconfig                     |  25 +-
 drivers/ras/arm64/Makefile                    |   2 +
 drivers/ras/arm64/ras-of.c                    | 383 ++++++++++++++++++
 include/dt-bindings/arm/arm,ras.h             |  11 +
 8 files changed, 731 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,ras.yaml
 create mode 100644 drivers/ras/arm64/ras-of.c
 create mode 100644 include/dt-bindings/arm/arm,ras.h

--
2.34.1

