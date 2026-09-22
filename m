Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79449E12B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108349; cv=none; b=Dac1cAcRZeWJ48MYvamwuz1nzT2iw4bBIs9jL4rzQWjulGc1q0j6Y374br9RT7OFgUOWCqWLezr5DT4Y+mNqvkd9YG+n2YGJSdZqPUzZUpUFmOrDx3eBxZGbPwltWtVP1ko5E9CGDRN3Kj7xav8PURRbKeSYjlJ+/BWkfLUsfLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108349; c=relaxed/simple;
	bh=nZv0omdQd7xZAaPLxEICv5XcKhxWVLNSS6XQFdQOA8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A42XgDomcjOj6MxbOZznUkyWpmrKUVJGSf5ObK/ME6dxAzn4UT61W5eCxWH+mbApZYsoim5OOehR2eMHxSzDwTYGV36BGjM76uZ2TAMPj+R9X9NKyi7fBnsAk/7GHzfTWp5quZhguKutUaHQsZfU0HLXlk+hRE6Sp/ArBHpnVsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuGR2w28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgCUWW1j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuGR2w28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgCUWW1j"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Bjv1873680
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=inb0TTDzgD+s+0QPNuwcXL
	9Q/H4tt2RhIb2hDSuNaVE=; b=WuGR2w28JqLn0d7H9bIcTVmhMnfeKETn3qq+IU
	YRuqDJ5CSpEO1YfTAYerBuv7fQfkb4HNpKpkNaT2HfplRB/zSGQevjdzpK6pSkjJ
	jt6IIL+6/SavoVGPuQZdWYE8ejo85kf9x29nBlSMtPBdm2KTJ1ZGr/BVieA9HwGy
	x23Wz1yopHvDVi6WlgXij7yHsUvrf+vY+N3rd9ZngwKsDIEwa2F9IRyQ7Dej9Rsg
	2hildVSg7JQ41Nyd24uKr12GM7NdEu4b/vMDfqWRB9UnI7uLWJj2M2RrZEBMAIA1
	RILsn800Jiy5Efq5RD6hs5+UBpL81cWqXqQ0khfZMhfXaUng==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4tx14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:18:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33bee712354so204729eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108338; x=1790713138; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=inb0TTDzgD+s+0QPNuwcXL9Q/H4tt2RhIb2hDSuNaVE=;
        b=XgCUWW1jYPNcnzTyAnGlaDvOa836trEY0lhtY65zoIqmT5cOjdwRz3s0fXhPAYI1+k
         8jOHZqxUat6Z0GO00W4MKH1diIoqKJ/NCQTOpG+9gaiVR4zFA9NipWcczCQyrwXNPbrl
         Sz0hUhkteZoUVc/uW8pfxQR0BoR5AkERVFu4nRUXmijUNfgAz0uGCW36kak6/fza9suQ
         SUFwsX04cnwr4QtbDvlhFHcx79YrVApaIFkfz+KUeZwlfCc2wStcznoggzrtNxqh0wE3
         w+jvY/eNzT/5oxtqP2SfYfdlQIL2ZGCl92jkPi13Ru4kE1kTGOfl0oZ82Am5jDBGacFX
         ga6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108338; x=1790713138;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=inb0TTDzgD+s+0QPNuwcXL9Q/H4tt2RhIb2hDSuNaVE=;
        b=PBRiJLtf4uOefkFi35Q0FUGnAWCpZwRn7cvlTETuwUH4iDOyWOna46jdLYL3/W90f4
         ABpmZ/D/FOav0mLX6nqDGNzlat1+WVOANVa05xKCZWU09zUFGBmigt4Rm9uQ6xgAATEI
         tl/b5xapqNtDAZyjC/xx7cZqOA7/vahLyPmJYuXao4dOgF2q+pZHcA5KXrCb0+PvmLxh
         vAeKDvWUBnmPP8rrVoTUxSIEYxgf4st6s/NGOjlZuwXu458wHVA7lW8Qvh2PcdW1FgoL
         8gU1qZuu9qGHk0yZCCYn6DjVYnpFcgdLYLp03b86L/P+yBMtKoygZAOQOFADGRBSyUiM
         EXJg==
X-Forwarded-Encrypted: i=1; AKwUvBxJHXffqg+kxdSBRnPdESPj3yFBtes7+Y9ZgBZJWDUqdS5xl6epb2UsaNbDRepawOEdnPsF3ahSpgOydhU=@vger.kernel.org
X-Gm-Message-State: AFuF++lKJD0BwYhlSwkDdpgKpKNqhPD4RVuKytqhhda8ZWnvnFPh5auj
	bisNAdp344rMVCioDi8P2RbBJkgiKXWzhAts4E/SEo9443QS3HH2bwkucRGV+Xnhfx6ne0BGute
	4HzZqintN8MEXbBr4uFyzU8JgqzBiTtjS4BQ7NAAZ3M6imG78dOBPuwHsXF56Phn/7PU=
X-Gm-Gg: AYBFou0Q5va7X8ZAIGdbQClNaR1dkCIHqSzISH+8FoBqqGU7zrqCjNHgJT8AvZTHKim
	nlC28cL6gM1MWgG6aso4J/CtYEvHgJsyHKB+9KxyfdT8wP5lMlfw3CehdDgkdjvaCZN2IGQpdeU
	Wq7smR8X5voeRs8oB8YodMjJ5jILJyOKgiSFOjchuDN7TP+YG1aAzx6zRtxox/yT4VYYB9PuW+W
	cZI32+NDeTOOxTbFkkoI+FZXFU0IsUxKZbcLSPliM8CLIfiYwTzh1Cp1fnGb9O1+gehzbWqn1nD
	I4LwdeYBcIS790VGKjU+W6qfd3Xg4r42Ptllu2o3LpRXXl12lUUL4ua/CscZo6ipVEEkRQhvK30
	rP7oS5hBF5rjbHcisiBJOC7jL+g==
X-Received: by 2002:a05:701b:4209:20b0:143:298e:913b with SMTP id a92af1059eb24-144f9189922mr449943c88.45.1790108337994;
        Tue, 22 Sep 2026 13:18:57 -0700 (PDT)
X-Received: by 2002:a05:701b:4209:20b0:143:298e:913b with SMTP id a92af1059eb24-144f9189922mr449905c88.45.1790108337137;
        Tue, 22 Sep 2026 13:18:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:18:56 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: dts: qcom: Introduce Qualcomm Hawi platform
 device tree
Date: Wed, 23 Sep 2026 01:48:34 +0530
Message-Id: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvismoC/52NwW7DIBBEf8XiXBAL2AarqvofVVRh2NSkdRwDT
 itF+fdiJ1IP7amX0c5q5s2FJIwBE+mqC4l4DilMx2LgoSJusMc3pMEXTwQXDTdC0MF+BuozPU0
 pUwvO7JXnEnVPSuUUcR++NtzL7ubT0h/Q5ZVxT0Scl7KTb7Gfma66jQCnMbnXiNZT0fpGG5St6
 +vuLFbCiCnZe+Fxa2hegxQgDBMtSGgVBTou75gGNh0G+zylxObFfrhpHFmRp78xBhTXSoJgUoM
 o9/8wGgCKypoJ0+gW2hWzAeYcfgN6m5Cun5C7qnbKK2hMw1VPdtfrN5E4KoOfAQAA
X-Change-ID: 20260922-hawi-dt-post-a1c9f4d03e8b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=3516;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=nZv0omdQd7xZAaPLxEICv5XcKhxWVLNSS6XQFdQOA8M=;
 b=ATXWYTdBsF/WDKUEdXK1BNjMqC5pl5BXiDr9u7CTf1GpYaKV7gsFoD+HRHgQcag/ZIrWHoZO6
 zFIl0DauTSCBpMvj29uWUJW+3EYnykCF15keIQgBOm2eWu0STXyQZmc
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5MyBTYWx0ZWRfX7jrhWBA3HVTT
 TfkSMV4Zt94Yj6sW61lNIfl0QMcV6ubG39Cz/LIxOZkaTZudJz3fu3d2hHbqI/7gJ5X34PqCCI+
 WsAtLUYxL3fNeJqwpYadn5ot1s524+FkAaXm4sq2Io7Se2otU8+03/LtEGIp1WqCytlH4HrBhhd
 hbsswqekawFQB2Kv5N/4H6Va9cWSICQjzQg30Jdzq6ZjDbMxkrAp4oCXlhA3Cc6Sr37e2lSQBHP
 fh+oe9enyTrQRoiYOjKgoPwDOmV6G0WqZQ/04Uu5yhm7RZ9n5MP+ecpccp0ZR1PwFqWfKbY15qt
 OFk3cgSEOqgfhjOAZhtfh2Iws+iqgO72obs2kBMcrSRoJ6qGp1Ze1SD49Rzm34bR8bV3Mzsp2q4
 PGMC9+HSp5bZ7siXYdhvJqeYQlBvR23/M9wLvKykymJxvr+o7bCJa04FKZzmHcprofOkyYFkcsu
 agmr8RnUKiVO5qyRDcQ==
X-Proofpoint-GUID: 3kCd3_EiXSG-Dpuj61NsJVeBxOl9oiGF
X-Proofpoint-ORIG-GUID: 3kCd3_EiXSG-Dpuj61NsJVeBxOl9oiGF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5MyBTYWx0ZWRfX3tyM23e5pcxW
 +DgmNqtd5abQuIgL9V0EPHNDQC0Uzt0XXOPFftorSmLEoW2B6Dc9IQ3SO2vJBk++ATXRPVX/J5J
 8wZnShK+MIjtx4OCzeTiE8hkVm07L/g=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2e2b2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eXJStwgN-W4ek1F5OGsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220293

Introduce the Device Tree for the recently announced[1] Snapdragon SoC
from Qualcomm: Hawi

[1]
https://www.qualcomm.com/smartphones/products/8-series/snapdragon-8-elite-extreme-gen-6-mobile-platform

Series contains patches covering Oryon new CPU variants binding, IPCC header
and base Device Tree for the Hawi SoC, MTP (Mobile Test Platform).

Features added and enabled:

- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC/RPMHCC/VIDEOCC/GPUCC/CAMCC
- TLMM
- Interconnect with CPU BWMONs
- QuP with UART
- SMMUs
- RPMHPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- CDSP, ADSP with SMP2P, Fastrpc
- BUS with I2C and SPI
- USB2/USB3/type-C
- Modem and SoCCP
- SDHCI
- random number generator (RNG)
- TSENS
- PCIe

Series dependency:

- Series is based on next-20260921
- USB binding : https://lore.kernel.org/lkml/20260811160835.2968717-1-mojha@qti.qualcomm.com/   (Reviewed)
- CDSP driver data and its binding: https://lore.kernel.org/all/20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com/   (Reviewed)
- For Modem binding - https://lore.kernel.org/lkml/20260805132129.2713174-2-mukesh.ojha@oss.qualcomm.com/     (Reviewed)
- Boot up dependency : https://lore.kernel.org/all/20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com/  (In Review)

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Mukesh Ojha (4):
      dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU compatibles
      arm64: dts: qcom: hawi: Add header file for IPCC physical client IDs
      arm64: dts: qcom: Introduce Hawi SoC
      arm64: dts: qcom: hawi: Add base MTP board

 Documentation/devicetree/bindings/arm/cpus.yaml |    3 +
 arch/arm64/boot/dts/qcom/Makefile               |    1 +
 arch/arm64/boot/dts/qcom/hawi-ipcc.h            |   61 +
 arch/arm64/boot/dts/qcom/hawi-mtp.dts           | 1000 ++++
 arch/arm64/boot/dts/qcom/hawi.dtsi              | 6847 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmh0104-hawi.dtsi      |  103 +
 6 files changed, 8015 insertions(+)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-hawi-dt-post-a1c9f4d03e8b
prerequisite-change-id: 20260910-rsc_read-27d689e37cb5:v2
prerequisite-patch-id: 76c7708564fe28e2b9bfa7037fede190059efdcd
prerequisite-patch-id: abfa9de0466722476fdd75d14ec75a362d6dbd27
prerequisite-message-id: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
prerequisite-patch-id: 8e93d1f80fb9570d7e77b9a1bed4c66957a9584b
prerequisite-patch-id: 3247ca257cbfefdd381431b6cc957ac1de9535c2
prerequisite-patch-id: d0da917632a377ad57777719217a3a833885e316
prerequisite-message-id: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
prerequisite-patch-id: ccb139f7eee9b87fb8d03720b846a01534960fe2
prerequisite-patch-id: b62a4d66221428ef7a141a9b3ff38fb087d6a092
prerequisite-message-id: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
prerequisite-patch-id: d29faa9849aa39f544b8959a02f1f45e9aeda5e7

Best regards,
--  
-Mukesh Ojha

