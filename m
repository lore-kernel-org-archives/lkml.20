Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1DC42E413
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798147; cv=none; b=Y8pBJRTt2AqTy91BdUP2YzjjQwF3ysgGNQXFipfUUfCs6c823yu5OGAz03noGlrczEKatogWZznL/Z1Wbz137hCkR7tlsxK3TcYqKvxo7kMtxDr/kcvV/4gkpmY9iRnaztk1KF/EGOGZmCB5InUvsQPOdxcWz6496HWGzqkhkYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798147; c=relaxed/simple;
	bh=3GAp9LEi+XPdnIRjwFTLkTSW+RwPiGUICRV2vRHrRfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9HuJVhRqxtS2sdax9qsHkT31GX+MwlAHQ0JWQZV7kLG2GEw0SR1fIFtkwZKAvCvYSPsbJDJqqzJ84rdG4C2IMYmAoL/9ytJb0lgg8YvCmChpJHwxjIZH1I1c6r8YAgeUkMDR7BhAGIspMVK/BYrPLHgT3Nnkfkvfov5ExBNysA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AmhXzFQH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AmhXzFQH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 052A81476;
	Mon,  7 Sep 2026 09:22:17 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1D8A3F528;
	Mon,  7 Sep 2026 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788798140; bh=3GAp9LEi+XPdnIRjwFTLkTSW+RwPiGUICRV2vRHrRfE=;
	h=From:To:Cc:Subject:Date:From;
	b=AmhXzFQHN8/N0R9P39kcMiEmRyxaaj/BOobegu+Ut6gA8IAdyt8av0drmBwLaNpE1
	 cZrCz8yTVUTstCj/wyUysRHvh0ym3eecTweI2FLomH/rxtDbIe3MgZxrCEYxfGGklx
	 +fH889sIFgW6qFKGMNDq4eJ648Qs0gCoJ69oW0EI=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	pavan.kondeti@oss.qualcomm.com,
	tabba@google.com,
	aneesh.kumar@kernel.org,
	mark.rutland@arm.com,
	sdonthineni@nvidia.com,
	steven.price@arm.com,
	gshan@redhat.com,
	yuzenghui@huawei.com,
	kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 0/1] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Mon,  7 Sep 2026 17:22:03 +0100
Message-ID: <20260907162204.1479401-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This single patch teaches the arm64 fault handling code about Granule
Protection Faults, introduced by FEAT_RME. This was posted with KVM CCA
support series, but split from that, to allow for other users of GPF.

The immediate user is KVM CCA, where the host may fault if it accesses
granules that have been delegated for use by a Realm. However, the fault
handling itself is architectural and not KVM-specific. It should also be useful
for other FEAT_RME users where an access to secure memory or root memory can
result in a GPF.

GPFs during a page table walk are treated as kernel bugs, while non-page-walk
faults can be reported to userspace with SIGBUS. The patch also allows existing
exception-table fixups to handle known in-kernel accesses such as
load_unaligned_zeropad() while private memory remains mapped in the linear map.

The KVM CCA v17 integration branch is available here:

[0] https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/kvm-integration/v17


Steven Price (1):
  arm64: mm: Handle Granule Protection Faults (GPFs)

 arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

-- 
2.43.0
