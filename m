Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7124A5C43
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188389; cv=none; b=DRKl7zaRsqEbQp2Kig9TSzq74k+WaQl/qhOSmmrorGfBvDoMhDxyZ5s8FiCzesduAoeQBAgv2RpSkRt4V2Hxbc56bx9bWumb4TYR/vpgGB3fAopmBaLsTQpHCXA5tpxilaONLDbDarZ7bx5FJXaRaksT5jfj748Cg+iSefjwrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188389; c=relaxed/simple;
	bh=DjPlLDz2XNVm04woxfQ94FXN2bHH+BeSjwzFmTxHUks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBlXrnjWLIPnpgFgOJGISn9TE+hDBVO8XmX2HuleJnqVSGPwaVDZO/ZKjPefzPsIjURg2pvT0B4ncx3CO6Q3njej2+1LqZslMzvL2CK7nglgAjoU5L+MinrJx/MHWHvOr/gtHJoeHh6W3pKjkj5Z8KsBQCFuva3nhAJoymxBwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jx8EdU2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq7VNbIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jx8EdU2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vq7VNbIZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETPAX3703665
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Tkl8tnadHtPrcVG8m6n51ANnk/CuKRldgYo
	l5hl0s1Q=; b=Jx8EdU2C7BlzsajnXjzQUJ/T1Xbm8yScJHCgWeXIewES/PdnzPO
	hKFw8xl1Lh3viBbGKgdOu0e/CzpW69VxkFAYpqFu/rbTYugJsHxRj4nppA9xnnUY
	yKdYwShoasTCaqEVt9h8BZHTDTeNDfQROwY+HYMbhh08PZqOzU1eb4EcbbKH6b57
	6LJ4oG44c+ZMyigAHvmJAfk8eJcJQ+uu1HoknJuYKuOv3+PyWPRszmiup1oeOCVW
	l3FzEsOtVZdxPuS494UOti7ObCnHEJspeBgiwOC0+OcCs2A/WZb2DwHCkJWlCVQF
	qTJx4N5XmgF6/9fDQ3LXMUoxKKqTyUTPVDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yasc67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec3146553so863873285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188386; x=1788793186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tkl8tnadHtPrcVG8m6n51ANnk/CuKRldgYol5hl0s1Q=;
        b=Vq7VNbIZRVg+Plq1bSoLLntRGuJL0vhCzJBg/Fubg3VFRBWa1e+hpI6sFmlH8XvA6/
         LjQNTaM5Q1FcCMJnilmCZ0v8ugL2BSGnLsLFtdy/gGKHQl9ZwnAtQCn+xwM1O0swBXQo
         /Po7Ix14JxmzdPY5vU9oUMey5vxZ9Rjl9rJkTxpf07mJlqLcVDnGPa8cAKlQHiv31v+y
         b+ebooCnxTayfMt06iQK4MtxE/FlP8DKP14See1xLQFFcjPCiX0Q/TuU6dCbY7xViwmS
         zqC8o1D3aKXAnE4HIxUyha6Le/Zx4TyhkrT8S9jyU2PCNjwJWxd6+V+cy4Eeiu/At0q3
         tLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188386; x=1788793186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tkl8tnadHtPrcVG8m6n51ANnk/CuKRldgYol5hl0s1Q=;
        b=VvOrzwCR8Q/8FJk9+z/y7J6ebmpCuxA0oaOW0SHfs70Oia1NIbMT97Uam5CdhqYPoJ
         yzpsgdP5wMiaemEALsggYA50H1MUkC6wBqhDMSJUZf3MilZsvqQF43xwxLJFnDLNEfO8
         MZvWe8AIEDB7sVVJYWAk/xzVEFQe5EbB+C8V5iuN9PVvfc6SA9LDnRVhSgJKQRuPiyLZ
         hJ64etfRjNn/A7RQx+5Gfh4a7gi5u8/WRCLQqhOO0SiSFEh14Kb9H7Cy2x68WFRBmlXH
         858yHSc30dmf8pP90YuhcfrJzKncOwLZ53yVKlGJju8KCHvHS/Iek1/ORwzNgtB633A+
         Wveg==
X-Gm-Message-State: AFuF++krefC6xtVdh0p/jn++S4CuO5bG3l6vfJfaAKU/nFMn42uNZqh0
	aclC0IliHxVQj2rd28J3GqeH7w+TFgrmYiqHPzvoQ3PjTX1qbFO6dCfHhBb+A7cWdR4TGorxRU9
	DnPfSpbFcGNcDyMu7KDcUBcPjXYydgSAYsL9XyZGE8vY6OUNHEoGJ/8pBEhSTKjlmiaI=
X-Gm-Gg: AR+sD10SFxRbgDyNoRbzUStMs1oO3KRysMgHFhE0GekxqQ+r0QHrWcuBQyhE51WA7YR
	mni/wHpm6xOETOb0cVW3Afx/XysiTXg/Bl58tKhHk1eJn0VU0nJl3l1wbnrxAHRWKfGE3j+ZMjX
	muc4i0IkEj7ORbp/B/1QjkC1xYaOqgo9xS1yphjYcmaZlIKO7ejGU5x6HaGPf8VEsx1IWN1KnhP
	nnl+dilRheV81diP4Dw1LyfXp3gkgVATNlWkNV2rpnLqmjKBaxh5wqjd3mBCLZBlR5XS8Yg7A8c
	PcQ8ZnLLeN0y1oniN9mIvw25271wIz2Q0kaRj9TkLHoSivHKi0W86HW9+ZKaf7PTw6gE0S7LnQ/
	bVSLa+SN6XnJt1Wcu1zPpXU44uPsiLZhsFes=
X-Received: by 2002:a05:620a:11ae:b0:930:f723:35f5 with SMTP id af79cd13be357-939138ffc48mr2409149185a.20.1788188385877;
        Mon, 31 Aug 2026 07:59:45 -0700 (PDT)
X-Received: by 2002:a05:620a:11ae:b0:930:f723:35f5 with SMTP id af79cd13be357-939138ffc48mr2409142785a.20.1788188385383;
        Mon, 31 Aug 2026 07:59:45 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48440e08b43sm1608652f8f.22.2026.08.31.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:44 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 00/17] iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO
Date: Mon, 31 Aug 2026 16:59:26 +0200
Message-ID: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX+sKz210fQE0h
 YS3DnUeJE5dk7OfjqOEfhA9m7cHDWLEBQV05F0oK5u2ETashLlSU3c9TWx5DMZTxjqZjBuHgjqE
 Nj5RCxU6l3boF8rruabm7XOVyxGfELY=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZZtlPswqtT560II7qJwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX10z1b1d7xgGJ
 V/FKN/w0nCpZ6IQ5kJfcaJYV8k+dh+mVUGMyfkdq1aRXwjJX0Q8thbSQBxd7nuxZ7YwwaOiQfNT
 0pmKLwTtlpcEBGOTSbIxQXSUDw2VmjNa6vxAKkSrGE+5LA6Fo9jJQRtrhlvu6rw/0HI25wBpQOK
 geU2m1x8LeD/n010NNJxPSMk0+ytp60S36x+YHnMN7qpQ2FTgzhGHTuTlEvWFQrbu7QB0O9wsD1
 Bwtpi5bRWU7PC1BFw64dz7EGAm8drwEKZjZkAMKgFTOHtQTVt2nR4T2ShJrdHjdXFA57C+2cxEv
 Vhq4Tolwi1vVh43Pp+lHAmpBQNQadt7Dd9YUrVVDEfC9YKQVt/jVZCbZZx+T5u74lw0+nM7P+R9
 wiB3OHTOhDjfqcz6Z1NjADmyOBl4J+cDzD7JrmwofBkDuwjIBAxFMdYucX4LCZJFdvtpfsaD/PX
 bNPfA+HQVLOi7wZDQSg==
X-Proofpoint-ORIG-GUID: Lw7BCtIxnjmGElzZ1S4biwd8iDgBy6eD
X-Proofpoint-GUID: Lw7BCtIxnjmGElzZ1S4biwd8iDgBy6eD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

This series adds MSI remapping for IMSIC so a device's MSI target gets
translated the same way its DMA does, allowing RISC-V to enable IOMMU_DMA
and paging domains by default.

v1[1] used get_resv_regions() with IOMMU_RESV_DIRECT_RELAXABLE to identity
map IMSIC pages, but that was rejected as only a workaround. v2 through
v4[2] instead introduced a RISC-V IOMMU IRQ domain which pre-mapped every
possible IMSIC target and maintained a domain-local PA-to-IOVA table. The
v4 discussion with Jason identified a simpler way to handle the RISC-V
requirement that the MSI target address changes with interrupt affinity:
extend the existing iommu_dma_prepare_msi() model to prepare an ordered
list of MSI targets as one contiguous IOVA range. v5 is a complete redesign
around that approach.

The IMSIC driver now builds an array containing the supervisor IMSIC page
for every possible CPU, indexed by logical CPU number. When allocating an
IRQ, it passes the complete array to iommu_dma_prepare_msi_list(). The new
API maps the ordered physical address list into one contiguous IOVA range
through either DMA-IOMMU or iommufd, then caches the base IOVA and mapping
granule in the MSI descriptor. MSI composition can therefore select the
target for the current CPU with simple arithmetic, including during an
affinity change, without allocating memory or consulting IOMMU-owned state
in atomic context.

DMA-IOMMU extends its existing per-page MSI cache to recognize and reuse
complete ranges. iommufd grows its software-MSI bitmap on demand, bounds
allocations to the reserved MSI window, and prepares, installs, rolls back,
and replays a range as one unit. This keeps the descriptor's contiguous
IOVA valid across iommufd paging-domain replacement without exposing a
partially installed range.

Unlike v4, v5 has no RISC-V IOMMU IRQ domain, no domain-local IMSIC mapping
table, and no IOMMU lookup during MSI composition. The IMSIC IRQ domain
owns the target list and message composition, while the IOMMU layers only
provide the mappings. Devices which do not need IOMMU MSI translation keep
using physical MSI addresses through the same IMSIC path.

The series also carries the remaining plumbing needed for RISC-V PCIe
device assignment through VFIO/KVM: the RISC-V IOMMU reports DMA
cache-coherency capability for coherent devices, VFIO type1 and KVM_VFIO
are enabled for RISC-V, defconfig enables IOMMUFD/VFIO as modules with cdev
support, and the generic VFIO/iommufd selftests can be built for RISC-V.
The RISC-V IOMMU specification does not provide MSI data validation, so
VFIO device assignment requires the applicable allow_unsafe_interrupts=1
module parameter. Direct MSI routing to guest interrupt files (irqbypass)
is not yet supported by this series and will be posted separately on top.

LLM-based coding assistants were used during development for code
exploration, patch review, test execution, and drafting and editing
commit messages and this cover letter. I reviewed and finalized all
resulting code and text. Per-patch Assisted-by tags are omitted in
light of ongoing discussions about simplifying coding-assistant
attribution.

Thanks,
drew

[1] https://lore.kernel.org/all/20260508212339.381933-1-andrew.jones@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260820214150.545737-1-andrew.jones@oss.qualcomm.com/

v5:
- Completely redesigned MSI remapping based on the v4 discussion[2]
- Replaced per-target mapping with iommu_dma_prepare_msi_list(), which maps
  an ordered physical address list into one contiguous IOVA range
- Reworked DMA-IOMMU and iommufd software MSI mappings to allocate, cache,
  install, roll back, and replay complete ranges
- Moved host MSI remapping into the IMSIC IRQ domain and removed the RISC-V
  IOMMU IRQ domain and domain-local PA-to-IOVA table
- Made the IMSIC driver publish a logical-CPU-indexed S-mode address list
  and derive each composed target from the descriptor's cached IOVA base
- Fixed the VFIO selftest architecture check to accept both riscv and
  riscv64

Andrew Jones (14):
  iommu/dma: Prepare MSI physical address lists
  iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
  iommufd: Split software MSI map lookup and allocation
  iommufd: Bound software MSI mappings to the reserved range
  iommufd: Prepare software MSI maps for address lists
  iommufd: Install software MSI map ranges atomically
  iommufd: Prepare software MSI installation for address lists
  iommu/dma: Introduce iommu_dma_prepare_msi_list()
  iommu/riscv: Report cache coherency capability
  iommu/riscv: Reserve an MSI IOVA window for iommufd
  irqchip/riscv-imsic: Add S-mode MSI address list
  irqchip/riscv-imsic: Support IOMMU MSI address lists
  riscv: defconfig: Enable IOMMUFD and VFIO
  selftests/vfio: Allow building on RISC-V

Tomasz Jeznach (3):
  iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
  vfio: enable IOMMU_TYPE1 for RISC-V
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch

 arch/riscv/configs/defconfig               |   4 +
 arch/riscv/kvm/Kconfig                     |   1 +
 drivers/iommu/Kconfig                      |   2 +-
 drivers/iommu/dma-iommu.c                  | 117 ++++++--
 drivers/iommu/dma-iommu.h                  |  13 +-
 drivers/iommu/iommu-priv.h                 |   7 +-
 drivers/iommu/iommu.c                      | 109 +++++--
 drivers/iommu/iommufd/device.c             |  20 +-
 drivers/iommu/iommufd/driver.c             | 315 +++++++++++++++++----
 drivers/iommu/iommufd/hw_pagetable.c       |   1 +
 drivers/iommu/iommufd/io_pagetable.c       |   9 +-
 drivers/iommu/iommufd/iommufd_private.h    |  51 +++-
 drivers/iommu/riscv/iommu.c                |  32 +++
 drivers/iommu/riscv/iommu.h                |   4 +
 drivers/irqchip/Kconfig                    |   1 +
 drivers/irqchip/irq-riscv-imsic-platform.c |  25 +-
 drivers/irqchip/irq-riscv-imsic-state.c    |  54 ++++
 drivers/irqchip/irq-riscv-imsic-state.h    |   1 +
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/iommu.h                      |   8 +
 include/linux/irqchip/riscv-imsic.h        |   6 +
 tools/testing/selftests/vfio/Makefile      |   2 +-
 22 files changed, 657 insertions(+), 127 deletions(-)

-- 
2.43.0
