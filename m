Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8577748383B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392626; cv=none; b=tI0JukeZsvZbUdwtKXgLMlwnW1PLSewEi4TMCjKEL4DsxxAMUNVO8PTPCPN3s7wlrZYwqEr37U4WdxjM4qnQu9eweBmnCF6l/qeJM2/FcnAwfzxnISZP5xJRGq5T/PbdL8JMMZD9htMwpkdJM9m65WPrePtghRStueM/qYeS5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392626; c=relaxed/simple;
	bh=5gBGyOmGG2XT0r7pd95Im9pzr7GBNEl4HR2v/rxZFt8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=F3tsGmAX2lLm/zhCxN6H/QJW8Y4f3mQtV+bvRut/8ujrrV95NVvsda6FWDocabj7r2qdB9Lc7QlWMu8AFE91yDAXnug3nE3QTMUp/RcsU4AP1gi9GKaFm5q3dxK91n6UK5gZ4H0SSuIIQ7O3Axz3awbBf3ffMtQRMtUrJdeXLAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ge8c+ySl; arc=none smtp.client-ip=95.215.58.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ge8c+ySl"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5gBGyOmGG2XT0r7pd95Im9pzr7GBNEl4HR2v/rxZFt8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792392619; v=1; x=1792997419;
 b=ge8c+ySl/QZdIM8YLPoSa6N7sPXLc72uzbQ5n6xzPL7yourDoGb7mW/NyIsUdCBc2PrFQpQ/
 VrMnT2XmQ1JD+V6t+TngNTjkKoOCumrX5sXjEtXCjAq7ciQTCE47tGlyjJnPToc3NWhdj2qjXa6
 P5HfioMhnwBb8Xz2xeMyrI7w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 99e215486e67a95b;
	Mon, 19 Oct 2026 06:50:17 +0000
X-Mizu-Trace-ID: 99e215486e67a95b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 0/5] mm: hugetlb: add CMA support for PMD-sized page
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <cover.1792136742.git.zhengqi.arch@bytedance.com>
Date: Mon, 19 Oct 2026 14:50:00 +0800
Cc: osalvador@suse.de,
 david@kernel.org,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 16, 2026, at 18:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
> From: Qi Zheng <zhengqi.arch@bytedance.com>
>=20
> Hi all,
>=20
> Allocating PMD-sized HugeTLB pages at runtime can become slow or fail
> as physical memory becomes fragmented. Reserving HugeTLB pages at boot
> avoids this problem, but keeps unused pages unavailable to ordinary
> allocations.
>=20
> Live upgrades are one example: they need additional HugeTLB pages only
> during the upgrade. HugeTLB already supports CMA for gigantic pages,
> but reserving a CMA pool for 1 GiB pages can fail when physical KASLR
> and other early reservations leave too few suitable 1 GiB-aligned
> ranges. At runtime, 1 GiB allocations can also fail when pages cannot
> be migrated out of a suitable contiguous range.

Yes, that's our use case at ByteDance. Allocating a 1GB HugeTLB page =
from
the CMA pool is more prone to failure than allocating a 2MB one. To =
improve
the probability of successful allocation, we typically configure the CMA
size to be larger than our actual requirement, keeping a certain margin =
to
handle cases where temporary kernel operations (such as DMA) prevent =
successful
migration. For 1G HugeTLB pages, since the margin must be an integer =
multiple
of 1G, the extra memory configured as headroom is also relatively large,
making it less flexible than 2M pages.

>=20
> Extend CMA support to PMD-sized pages so their backing memory can be
> reserved at boot while remaining usable for movable allocations until
> needed. This relaxes the reservation alignment requirement and reduces
> the contiguous range required per allocation.
>=20
> The series adds an optional @<page-size> suffix to hugetlb_cma and a
> separate PMD-sized pool. For example, on x86-64:
>=20
> hugetlb_cma=3D4G hugetlb_cma=3D1G@2M

Different sizes of gigantic pages already share a single HugeTLB CMA =
pool.
Given that, why not let 2M pages also reuse this same pool? Would that =
make
the overall code implementation simpler? And if it does make things =
simpler,
should we go ahead and do it first?

Thanks,
Muchun

>=20
> This reserves 4G for the existing gigantic-page pool and 1G for the
> PMD-sized pool. Existing unsuffixed parameters and gigantic-page pool
> sharing are preserved. The new size follows the architecture's PMD
> size rather than being fixed at 2M.
>=20
> The preparatory patches introduce per-pool state and prevent recursive
> CMA allocation during migration before enabling PMD-sized allocation.
>=20
> Thanks,
> Qi
>=20
> Qi Zheng (5):
>  mm: hugetlb: add explicit page size to hugetlb_cma
>  mm: hugetlb: group CMA pool and reservation state
>  mm: hugetlb: track CMA reservations by page order
>  mm: hugetlb: avoid recursive CMA allocation during migration
>  mm: hugetlb: enable CMA allocation for PMD-sized pages
>=20
> .../admin-guide/kernel-parameters.txt         |  39 ++-
> include/linux/hugetlb.h                       |   4 +-
> mm/hugetlb.c                                  |  80 +++--
> mm/hugetlb_cma.c                              | 328 ++++++++++++------
> mm/hugetlb_cma.h                              |  11 +-
> mm/mempolicy.c                                |   2 +-
> mm/migrate.c                                  |   3 +-
> 7 files changed, 306 insertions(+), 161 deletions(-)
>=20
>=20
> base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
> --=20
> 2.54.0
>=20

