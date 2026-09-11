Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A03DC861
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165557; cv=none; b=rB6ZPZyyaE+k25hNIOltu5ttJD2RryzedzjbWI1FBNogvxmLnl2yAOHsCjoYoEyOCGn90fCqNQE4y7nUEhfsjRm9gacZaQg9ChYUZWrFwRomkEiiGeJz/iIRCUcJWPjtF1kInMS+TN+FJtBcO+ZEjEI3SUZQUCcms/zbO0ZkQ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165557; c=relaxed/simple;
	bh=ZL2A2cFHlRhAKSuQ9oyrYwVIfm2ZzCci0b8JvPtYKrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LCYwl9ecn8m113yTH8UMx7AXoDYDg+bii81EDVTyiDv70x8D8P4X/SICVyqYBpfDgngtTjExX2ZhDXWedbaiAAeblj2hb2z8UBpn9CU5mxVEZc08LsB+rTut/3V7iSUH3xR8VyQT2i2f2iRGScGYZD2mM+5q+HAx+VAmMkmldtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nz4fFmc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XluIJ+te; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nz4fFmc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XluIJ+te"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BJSxHA840073
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zrkXTFmlVQPcnpPC8U/nG2
	oDFHYiPrW26FCuVN6FIbM=; b=Nz4fFmc+3q+4nYFt4RGFkV8rHsuq9n7y0j/sT9
	6RBjPxeI7LETEmQx0wMaKjK5zN9HbHV3qWtGgXdaQweVtAvJkoy4jfQfBPurC9OE
	D4TGEi930v87yr864sGf8EI6Q/b8ssQ3er447C2YMnr6PoLar8y6GbBe2vUWIBZd
	U56U7UP7axarq8JU/UwW12/Hl84C2Fv5RAhwkmxmaCUBAo3PVdTWR64T0ZCuodKv
	xUcth9ZfBDiqv14PkaEVnDycK8PVEVVrGSCQNCLXi2gtaEZtiGZisYXhOO2jatss
	ZvV32ym29jvOUiMKwHMtmnzqPov8GqH/aWsI+9SAzEZ+XJlA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmqub0hr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:25:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1328756a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789165547; x=1789770347; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zrkXTFmlVQPcnpPC8U/nG2oDFHYiPrW26FCuVN6FIbM=;
        b=XluIJ+teK8PgecRI6E4g7itV0x1ylRj7WB/XH5wmbeqCR4Bf/OCtXn6U38P4D7RyXW
         7bBbgu3TSddTN+tkmLQLQnpFC/3+w78Bp1UtSUp3Xdsoq8xFj3OPjx0Umc3my5V2sFfy
         nIA8GRfPGIn3G8HE/KIjdwPwFPmxcSQg7Zizqhi+hVzcNET7bBcvmdtO2jDid42UOXYC
         fjKZVLlyXq9+FuI+SCE7knjdh4b1KHnqMZ18r2hiK4hXWweY+2ZXB3/fdc1kzdr26BJI
         fvuU0iJZVOo9ZTF6F7rqp+qwMxj8Yygl92KQ9/rDZEeyipa81XtI3R1vzpjFKsPDVXM/
         AH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789165547; x=1789770347;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zrkXTFmlVQPcnpPC8U/nG2oDFHYiPrW26FCuVN6FIbM=;
        b=dfmImmDemlBm1K3/yDOvHPsUbAu+TDOxOdken7O1cKiq/fZJ+l6KXlMjjVPnKXJJ3j
         TCwLtz3UmErG1qj78Hb1FlV7oWzWIRW707AfFrG+4T88GIjUF1317dF/bI/MMVyP7zXW
         N+UTx7KwmB1whd5G3qpV/opuO9D0JkPrpuRjZrqe02pv1t4cK+cBGeS4BgXm3UoFbWxF
         IVXKM+7/uIUytFbE6batlqd0UyJrdFyoRz/MGm7pWJEIlZHauUry/C/m6iQMHW/j2WzK
         KcsvWrsfOfOZoXJNE6ulSNadhfAcW4SQls393u+95IfU7gqVVoM0icjNp1oJFXlSilbD
         8WJA==
X-Forwarded-Encrypted: i=1; AKwUvBysHSg0HU4LAP0QXtPe1d+uLaiSKZ3hbS68SGeUXpSPfbxuY6Kfkcvv8d/FQYLna89GJo9dlNChlZ+TKx4=@vger.kernel.org
X-Gm-Message-State: AFuF++k9c5V6E6C3Qqx9jw2uyi7y42ztKTpNELwbGb6VqMn+Ws/g0N95
	/85rw9SUIGYJDr72ArPAVU6XKneunzDocuAlwBJgCZ+E6gEDxt5vZR9OHDFntGhsIoDF0uOxBfC
	kHiXZbGPLF9v1SOpKC4LeET1NkVIn3akWEki1MC4H9bnE3SfYnEyFg6q52O6r2JXqvic=
X-Gm-Gg: AYBFou1bVjg/V0I9AvZJWvV7Cbmsl1WFHJFGAOyRNHFEjRapKsgO4YmxtlMDy/xyoUV
	scVls3DajxSoBsOHBwk+rEHM9KQPjqFh+hMOCLsxIltgYHxpwe2gobnPaXKr/gTprQXK2yL4BzQ
	GLLN/c1CRIMY5TiYE3bmvxS4b2p98GoW+NvQEKrHiBBgbFoIuWZrvZT6A38XxKne6hfdoGgFRL3
	puluYBkTuOVk7UeozOaFBzUaSNeNUeLNBYkCzKtTkzrATUDGgSFiJ804ondUrM3I0C4Llv0WAFM
	pIqJWXQ80VTgN4q6G1CS2Ar/0zIz6kvbEuwr1SWZ1bFp8kUzBQJfL9Q7eo64Om91lCgf3KDrIEK
	81URoHLlCLAj83Leel3f3NcEd+BMzSsk=
X-Received: by 2002:a05:6a21:138e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3db0e48256bmr382367637.28.1789165546950;
        Fri, 11 Sep 2026 15:25:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:138e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3db0e48256bmr382332637.28.1789165546468;
        Fri, 11 Sep 2026 15:25:46 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm9213321eec.25.2026.09.11.15.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:25:45 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:55:38 +0530
Subject: [PATCH] iommu: arm-smmu-qcom: Skip fault-info reads when suspended
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-priv_call_runtime_handlers-v1-1-fc0c3a17523f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOF/pGoC/yXMQQqDMBBA0avIrA3EGCt6FZFg49hOiVFmVAri3
 Zu2yweff4IgEwq02QmMBwktMaHIM/DPIT5Q0ZgMRpubbgqjVqbD+SEEx3vcaEaXsjEgi6qnsrJ
 1Za22GtJgZZzo/Zt3/d+y31/ot+8RrusDGsMagn4AAAA=
X-Change-ID: 20260912-priv_call_runtime_handlers-7f3547544040
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789165542; l=3706;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ZL2A2cFHlRhAKSuQ9oyrYwVIfm2ZzCci0b8JvPtYKrc=;
 b=wtl28Fbdd6qYisueH5Nk753b3YTVUJyX0jmUcgObLW99BpkEMzkerPCmXfpJNlpCsF2blsOhf
 aSlOmE9xVBnB3e3iXcUCRaQvOyaulsDfn9heSVcHUyAhbNIgn7IHefe
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNyBTYWx0ZWRfX0qchH4RvZfH4
 aZQYzRvinl2+KvyXWUH0B531+8AmNilDTSlMBoBwFbIuBjz/5m84ilhAGE8uotkktkoQOwqjgoe
 ZGwbIJgUOfWFGGAayLD7jEPzGrHOiBE=
X-Proofpoint-GUID: V5f7a8pUvyYSyb3mxX-lc6yT7LmQlGXw
X-Proofpoint-ORIG-GUID: V5f7a8pUvyYSyb3mxX-lc6yT7LmQlGXw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNyBTYWx0ZWRfXz1BlLgFFyVUW
 cH7CPextstwb42IlNSa1AmA8SLiz6SLvVmXcUvYFnjWY8epL9N40EZ/M93f7q91vcsuVAqtR/Y7
 Cnpdp+qMlglFI8ujT0uB0J9VBaR5B0mAYDWCjuJgYxANV7SnwtzBJJJr0cfSOyMWceYqtsRUJfs
 0kowYWE+nEPy3Gk7FwgkQ72go0hIdBd3yhn7CD6aM9MxSPtSJBo3iO3Ox7BDZ5eABrkSjL0C58r
 yuAanLdY9sSzljeVlnh3GeWyDub7c5Q+uGkjU7S2j/+WOMuWse2P0dnAEI+gLopaXSJJWoK6nox
 ua/0KyEsG3ZgBDa0+/cGCrr27QphLTTBLbEZ1F8o5N7zQ6/ayvDKQi1Y8xxhVOqa1o+hB4Q4eoD
 x84AK6L+bDZe5WCCkuxPNQROCClyryEfPidFWIaflr+gL/YsME7Vd++5+C7BSFu4FUSrRUrBh4h
 H/uNFaCZ1hb2xmQ20Kg==
X-Authority-Analysis: v=2.4 cv=LqsHWXdc c=1 sm=1 tr=0 ts=6aa47fec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FyyklSoAK86a5T4BgM4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110317

qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
holding a runtime PM reference. A fault is raised while the SMMU is
active, but the GPU may drop its power vote before the threaded fault
handler reaches the callback, allowing the SMMU to runtime suspend.

Accessing the SMMU registers after suspend has started is unsafe and
may cause subsequent register accesses during runtime resume to fail
with a NoC error and an asynchronous SError.

Use pm_runtime_get_if_active() to keep the SMMU active while collecting
the fault information, and skip the register reads if suspend has
already started.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
holding a runtime PM reference. A fault is raised while the SMMU is
active, but the GPU may drop its power vote before the threaded fault
handler reaches the callback, allowing the SMMU to runtime suspend.

The failure sequence:

  GPU context fault
          |
          v
  qcom_adreno_smmu_get_fault_info()
          |
          | GPU drops its power vote
          | SMMU starts runtime suspend
          v
  SMMU register access without an active RPM reference
          |
          v
  later Adreno PRR private-interface operation
          |
          v
  pm_runtime_resume_and_get()
          |
          v
  arm_smmu_runtime_resume()
          |
          v
  arm_smmu_device_reset()
          |
          v
  SMMU register access
          |
          v
  NoC error / asynchronous SError

Use pm_runtime_get_if_active() to keep the SMMU active while collecting
the fault information. If suspend has already started, skip the register
reads instead of accessing the SMMU while it is being powered down.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..b1787a4ba0d3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -129,6 +129,18 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 
+	/*
+	 * A fault can only fire while the SMMU is active (GPU is issuing
+	 * transactions). Use get_if_active so that if by a rare race the
+	 * device has already suspended, we skip the register reads rather
+	 * than triggering a cold resume which would call device_reset and
+	 * destroy the fault state we are trying to capture.
+	 */
+	if (pm_runtime_get_if_active(smmu->dev) <= 0) {
+		dev_warn(smmu->dev, "get_fault_info: device not active, skipping\n");
+		return;
+	}
+
 	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
 	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
 	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
@@ -136,6 +148,8 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+
+	pm_runtime_put_autosuspend(smmu->dev);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)

---
base-commit: f61bb3920fa8cb44b84d32e0fa9fbaab4eb00c80
change-id: 20260912-priv_call_runtime_handlers-7f3547544040

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

