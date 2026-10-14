Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925A53E2EA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987105; cv=none; b=iqTeYrxfI4MVttBdepUs7PwPrGUx4ITaYikuMOhaLs4aeunN+UUdjmj9R3feXesAu7a+Z5WRZi6YJvZjuTgcFVXEeQhmYPFyJA+mC3qNaWuoaIjCEQpuEdaC1VHqoU0HtAXl84N+f5IAY1oJR1wrt9LDOsN93gtH91hCcBGNBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987105; c=relaxed/simple;
	bh=LWCUpSrITIIEDftZ75DOHJWGCZ757vVbZJ8RBzy8kWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NQbASg6hR88Fb1IzdQN1eImgMaUFICjmY/4b7CNgrVFku6faQgwH8/PDMVtGMN9/WzIjKOdAq+LnvjWvW5zW0iHeerQGaJVInuLfibnQuWxYDCRF3kBGTyTkI8bXOeNLdQ1PHBxmtvnb5+ua7eWmCWzN5HMG+SB2FLcOVvZoCP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VW9byVGz; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VW9byVGz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791987096; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=F4CY7eqCTmwF5gqCh81nQww38TakuMfoYmXy36eh0Uo=;
	b=VW9byVGzpNM7ySmibTE1DJlQJ/OEEJpcElDYvY/7XDd8RO9JuLtloTD2eXnCDxO1tFwHOCk7byHUzB3yvprIBJTVW8Zft1ZIsBHjSN0EvSWE+oi8LgtjWBVz1GIw/qbSsu/3mRnNYPqJQUrH67WGgaCvM+7oAhWtGX9rLn/weGY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XCp41-T_1791987092;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCp41-T_1791987092 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 22:11:34 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	gsh517025@gmail.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v2 0/4] iommu/riscv: Add irqbypass support without MSI page table
Date: Wed, 14 Oct 2026 22:11:20 +0800
Message-Id: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

The MSI page table is an optional feature of the RISC-V IOMMU
specification. Hardware without the MSI_FLAT capability has no such
table, and MSI writes from devices are translated by the second-stage
page table like any other DMA.

Since the second-stage page table governs where those MSI writes land,
forwarding is still possible without an MSI page table: map the guest
IMSIC GPA to the host IMSIC HPA in the second-stage domain and device
MSI writes reach the vCPU's interrupt file directly, bypassing the host
MSI path entirely.

This patch implements irqbypass using second-stage page table, so it
is a functional supplement for IOMMU without MSI page table.

This series is based on Andrew Jones' v3 irqbypass support series [1]

[1] https://lore.kernel.org/linux-riscv/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/

---
Changes in v2:
    - Following Jason's and Shuai's suggestion, the atomic PTE replace operation
      is moved into generic_pt as a new replace_leaf op (new patch 1), and the
      riscv driver now uses it to repoint the guest IMSIC GPA mapping instead of
      walking the second-stage page table in the driver (patch 3).
    - Link to v1:
      https://lore.kernel.org/linux-riscv/20261008140001.94508-1-fangyu.yu@linux.alibaba.com/

Fangyu Yu (4):
  iommupt: Add replace_leaf to atomically swap a leaf OA
  iommu/riscv: Extract IRQ forwarding payload validation
  iommu/riscv: Add guest IMSIC GPA mapping helpers
  iommu/riscv: Support IRQ forwarding without MSI page tables

 drivers/iommu/generic_pt/fmt/riscv.h      |  47 ++++++
 drivers/iommu/generic_pt/iommu_pt.h       |  65 ++++++++
 drivers/iommu/generic_pt/kunit_iommu.h    |   7 +
 drivers/iommu/generic_pt/kunit_iommu_pt.h |  54 +++++++
 drivers/iommu/riscv/iommu-ir.c            | 178 ++++++++++++++++++++--
 drivers/iommu/riscv/iommu.c               |  43 ++++++
 drivers/iommu/riscv/iommu.h               |  12 ++
 include/linux/generic_pt/iommu.h          |   4 +
 8 files changed, 401 insertions(+), 9 deletions(-)

-- 
2.50.1

