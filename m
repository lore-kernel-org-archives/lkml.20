Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323994C67F3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349435; cv=none; b=F1Nda7P255AmCLGLiOw9GM4eD51etklt5AeXlLimiP7qOcZ0KovevOzbaTUkI2O4pKByTYuousjC/reyqrLD+/49hNuYU7at92Xr6HUXL7Cbwuj1qAVR9ox7eTbDAqB/Mxz0PMXey8m38WVlEz81HmJiUXxACJtgbWEi/WTUPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349435; c=relaxed/simple;
	bh=a8vqGXEeEMCI9dFW1UkMZObdhlWKuZeejaEuGB4Zzrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FYP8vWgXqHqz0FBvKO75nhvH3eNWYuudQx6L9qJQEKPGghbb89Jh2CU83VydJo2m2IRTZ6h47UVy20CcWebnv0zntupww8giqIca05x/0mxWwoSmxVwk3ATaQaLY7+Yuxn0mgz3r/QrxYK+oWwH6dtaXXxtLBT5HePoGkkFtk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VuIyr7d5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2a2dBwC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VuIyr7d5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2a2dBwC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PEHpr1600190
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UhcJd91SmA5edbXD2iwXlkUxZSO0+0I604B
	mJXkJ+Gw=; b=VuIyr7d5TvqQxI7ccIpadKBEEbOssZgdNk+FQSNn/XZZnu9MTD3
	61n1Wtw/t7KqLnWkAt+75wCJG4wtKdyr2rNvEpcu6FSNi3O/u15CJDAwyMEfNx/V
	zHQmLnwpPO9Y/Om1d8aY2WduzpHic4TPa8pzO330heVxCLsPWi2PgWjk4Ajn9yTW
	J5U6l2NmjKQD5Z8annSlIzJB2z870KO2FqZay4cfSHP3As8Ng+QpAR33D3NcKL3K
	n50KMITUeiG9NNVsSGe3/BcriYtVL7a+bO0MQbulm95k+gmAZXTqatqU/ZwqB2gc
	qok/ajYS9Cl6cEX/XzYlZJZ7M95Gh14k5rQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsw0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7915a83539fso920690137.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349422; x=1790954222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhcJd91SmA5edbXD2iwXlkUxZSO0+0I604BmJXkJ+Gw=;
        b=O2a2dBwCIJzouFEBEUjXRh1JcX5kS4z/AVv0jLq0VC2TH3jJqmN/EFQMx+g9ED/SOe
         bzIaHSZV8LZ5prmbM0DBSNLvi8Lq75SBHug6/KoOHJC1E1G+MKJSnNBEhuoTy2sfvFLs
         t79SbhmjW2t6nRZIgPfG0oUL0J/ZbP+f7ojm1qP785rV5T41stiD1/8rrYv2bRNYiJhw
         kq4tWIyrl0bAG3o40zcwHT+aLxsSYLGCDSvglL85XGx00ix3+lEkKVXPwYIgfTtuAjMg
         5S3m1rHRip+5YgXmQxZS7W8Anm4cBTsM/+tH41IUQ41mYr05BCRKEUGc2clVC8zAZBRL
         WWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349422; x=1790954222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhcJd91SmA5edbXD2iwXlkUxZSO0+0I604BmJXkJ+Gw=;
        b=hgHDwQyvQXBo/5rp+ztwiJ5JV09mPHu84l42B2J1HTWrFAUl0LKkq5N5Kl3K35h44H
         KbvnI6/qgI+HUKSlmKTGLdmDthybSd/MtHKcDnxvP1qRKaDZq4LyxckdOJqwX0vJuHJZ
         JEYLwuMhbEB1pPJLJz7b44OPzS5+aFijiNR1QD06zc4JDHt3KpgMYcZ3ev8B4zSGE6tT
         alsRFrxsvaBOEIN8rICBrDrKwRtkyrWku4RnjgAxmCE+rVl7U4fzpEr+ZiC7ys3cDj+A
         fhgV2PBYLnTHpE/4PlpLS38+/DpVNMEG6VLojH+jkNvoas7Lp0d/EOq5OlkaIaxeYdIW
         g6ZA==
X-Gm-Message-State: AFuF++lpO5q3A7OFg6pc7Us6xaIlHEgkzUYdDkdN+9zDFbCEpTapD3Ca
	9lDD0qXqbapS9jnIRrTsvgHb7aCCiZED4q9eZHv6vlECPQWW77khFrUGMHLRqGJtMB+6GKVK9lL
	wiGK8PqDkL/xuU5X6UpnQeZq3AqKEMG622PbLTV7ui5rwQbfzjzaGec8tswd4QyaafEI=
X-Gm-Gg: AYBFou08FWZ0TJWE6bBPi2hKULD61FY/UUwiA3upA0mj2e/9m8vQoNd/UQ7gNA3bZQ0
	1+r2xMMZR+D95X9fo7h1oMEwne2mcnzTgtLbLpnBb4kn4qTb3H+HrpBeGyatORSCoK5kwJwEd55
	I5j5wWHTs14lbslFsfffhaoxAp/l53YfxbcPSDYeTL/IBr1vIBRxFsDU4OsyXRieiwPFSu245Lj
	MlmWxwkWqpowqENbbggUs28tVFqFjZv6ZVhpJ0YIm547cm1zR1tzNtEtzMp0VhyVIaBoJcz3umD
	uCta+zy0wvS06BUzKWoB9DUUszG/5glOvn8c2e2YAeyXqCYWw2pGR8E6lQiRB6CpE0H+3XDaw+s
	aFh0NAUcGNhyQSaw5bHmkQ0Q+ilLq4Vhy1GcZNQ==
X-Received: by 2002:a05:6102:4188:b0:7a6:dfec:3643 with SMTP id ada2fe7eead31-7af1ebf3435mr3192941137.27.1790349422143;
        Fri, 25 Sep 2026 08:17:02 -0700 (PDT)
X-Received: by 2002:a05:6102:4188:b0:7a6:dfec:3643 with SMTP id ada2fe7eead31-7af1ebf3435mr3192914137.27.1790349421589;
        Fri, 25 Sep 2026 08:17:01 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a76fsm8049157f8f.7.2026.09.25.08.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:00 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 00/16] iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO
Date: Fri, 25 Sep 2026 17:16:43 +0200
Message-ID: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _PHgsq9LbL9Yt-j4FbtS4qy6sbxOzEFe
X-Proofpoint-ORIG-GUID: _PHgsq9LbL9Yt-j4FbtS4qy6sbxOzEFe
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab6906e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kPzB1T93wNrnoFBju0gA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXx4sz4OXwiZZM
 pDPSxEcXykuYJtiAnOlboGE7agZG2hhbNScjqxmShVHhmxV6DyDITYuE6gy4v4+B2q8u4w2CXoA
 iHeMXY+MSy6XCqh3h+qAq6bLXDJ7vyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXxWprqxV260So
 dzGJnwPll8Zs57AGh7bb4leJzfv9yNE2GPGs8o/QY49C+iYtVS1oPeWLu0Y+jrAHi0of0+xviDF
 D6MelwJmoLh86sl/BjI8IgLThTlg0fzL71Pvpt8GFsXbNuXL/se/MZ8t6+XPHDArM5nHh8PwOz1
 2BVMptM51ELVKGovv4K1lPhl50Ivl3pRUKSuSyJwBO12D3cbZGXWzgJCLxD6O8UFUui5+7LYJOt
 kHoFZX4ENnaanjzgxta6ba5kDq43heJmB7/YIl+87W5s2QjwbJMarY9dP+CnFE5hUrsokXiMPOI
 +2MZePv5jIQZGWXz/Ar2CmDkaiMtc7eGnYsmaV5tQh6xwWCnpEojB0uargoEnT2BkFaDm5qsoJC
 kYW49vvEmm1MlJ9g20sCNHoXbW8L8dKZIV+pF7hODSBMu5JTxyqhEchNWswWohMjxq5OQUiQ/gT
 Vb/w9zkXdglCIdaTdvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060

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
list of MSI targets as one contiguous IOVA range. That resulted in v5[3],
a complete redesign around that approach. This is v6, which just has a few
minor updates to v5.

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

Unlike v4, v5 and v6 have no RISC-V IOMMU IRQ domain, no domain-local
IMSIC mapping table, and no IOMMU lookup during MSI composition. The IMSIC
IRQ domain owns the target list and message composition, while the IOMMU
layers only provide the mappings. Devices which do not need IOMMU MSI
translation keep using physical MSI addresses through the same IMSIC path.

The series also carries the remaining plumbing needed for RISC-V PCIe
device assignment through VFIO/KVM: VFIO type1 and KVM_VFIO are enabled
for RISC-V, defconfig enables IOMMUFD/VFIO as modules with cdev
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
[3] https://lore.kernel.org/all/20260831145943.313726-1-andrew.jones@oss.qualcomm.com/

v6:
- Rebased on latest linux-iommu/next, dropping the now upstream
  cache-coherency capability patch
- Picked up some r-b and t-b tags -- Thanks!
- Addressed Anup's comments
- Moved the SW MSI window from 128 MiB to 16 MiB to avoid kvmtool's
  guest IMSIC window, and documented the limitations of using a fixed
  window in the patch's commit message


Andrew Jones (13):
  iommu/dma: Prepare MSI physical address lists
  iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
  iommufd: Split software MSI map lookup and allocation
  iommufd: Bound software MSI mappings to the reserved range
  iommufd: Prepare software MSI maps for address lists
  iommufd: Install software MSI map ranges atomically
  iommufd: Prepare software MSI installation for address lists
  iommu/dma: Introduce iommu_dma_prepare_msi_list()
  iommu/riscv: Reserve an MSI IOVA window for iommufd
  irqchip/riscv-imsic: Add MSI address list
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
 drivers/iommu/riscv/iommu.c                |  20 ++
 drivers/iommu/riscv/iommu.h                |   4 +
 drivers/irqchip/Kconfig                    |   1 +
 drivers/irqchip/irq-riscv-imsic-platform.c |  24 +-
 drivers/irqchip/irq-riscv-imsic-state.c    |  54 ++++
 drivers/irqchip/irq-riscv-imsic-state.h    |   3 +
 drivers/vfio/Kconfig                       |   2 +-
 include/linux/iommu.h                      |   8 +
 include/linux/irqchip/riscv-imsic.h        |   6 +
 tools/testing/selftests/vfio/Makefile      |   2 +-
 22 files changed, 646 insertions(+), 127 deletions(-)

-- 
2.43.0

