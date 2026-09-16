Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D6472F62
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548384; cv=none; b=qUINOQRtuu61xvMQW1cGMlU4DbA/9FaVwHOC3UzB6ZGOTNCnvcqB2OO4vpabs9c6NfxDqQbEepf+SM8ejUhbw4F4yaOI5LZHS4RHNJS1y90yPKKukh38ekPhFOWVE9G3LsBDPSAdQZksZI+GfK6x6XzVzZ/mapjSYloOqFDy2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548384; c=relaxed/simple;
	bh=TVDGxY7b9X8J5O6v3/wXzGtnmgPSWcVewApf2YI2SYM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kOKAra+jZYJD8FuZ3yBC7dbHJbhRaGutB1xVdDOBGqpdZxW2oOlve4NeV0OS7yydpFAPBcYFwYSNoKYcXr6jg0ai56G+xI8a7udIoOLA17OzGGVYjL7g+OqDVMNQOOd8mbeAE5dQV4Ru1sgcxQSaPuMiKWBgj6BGJfVRlqW2rOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JUUdEWfW; arc=none smtp.client-ip=91.218.175.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JUUdEWfW"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TVDGxY7b9X8J5O6v3/wXzGtnmgPSWcVewApf2YI2SYM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789548379; v=1; x=1790153179;
 b=JUUdEWfW23EfHdz2R4C8Vu1w2tDUhNtLR+9LqMGFnEsF0CIiHffYdaljdrABaOleFVIGhBtY
 OKEQQlkcerBLNxOkLcY9KtOsT9mw8g0pHGcIEGdvZ9VL7uRowQRWRVi0K901UX9lwJzWkpugtmO
 Gf8lLeC8D4inkpO8CnjiVj8w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 93c2e6536672d7bf;
	Wed, 16 Sep 2026 08:46:19 +0000
X-Mizu-Trace-ID: 93c2e6536672d7bf
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] fixup! mm/sparse-vmemmap: introduce
 CONFIG_VMEMMAP_OPTIMIZATION
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260916083627.2145779-1-songmuchun@bytedance.com>
Date: Wed, 16 Sep 2026 16:45:57 +0800
Cc: David Hildenbrand <david@kernel.org>,
 Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6A2BDF6D-96D2-4771-AB3F-7E702B01FFF2@linux.dev>
References: <20260916064341.1825793-2-songmuchun@bytedance.com>
 <20260916083627.2145779-1-songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 16, 2026, at 16:36, Muchun Song <songmuchun@bytedance.com> =
wrote:
>=20
> The section-based vmemmap optimization infrastructure is guarded by
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it can also be used by
> ZONE_DEVICE users that set dev_pagemap::vmemmap_shift. Introduce
> CONFIG_VMEMMAP_OPTIMIZATION as a common config for the shared
> infrastructure.
>=20
> Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
> ZONE_DEVICE when the architecture opts in to DAX vmemmap optimization,
> and use it to guard the generic sparse-vmemmap state and helpers.
>=20
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Qi Zheng <qi.zheng@linux.dev>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
> Note: When folding this fix into
> "mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION",
> please use this commit message for the resulting patch.

Hi Andrew,

Sashiko found a configuration issue in patch 1 [1].

MSHV_VTL sets a non-zero dev_pagemap::vmemmap_shift for VTL0
memory. However, VMEMMAP_OPTIMIZATION is currently selected only by
DEV_DAX or HUGETLB_PAGE_OPTIMIZE_VMEMMAP.

With ZONE_DEVICE=3Dy and MSHV_VTL=3Dy, but DEV_DAX=3Dn and
HUGETLB_PAGE=3Dn, VMEMMAP_OPTIMIZATION is therefore disabled.
__vmemmap_can_optimize() always returns false in this configuration,
so VTL0 memory uses an unoptimized vmemmap despite its non-zero
vmemmap_shift. On common x86-64 configurations, this can consume up
to about 1.5% of the mapped VTL0 memory for vmemmap metadata.

The report is correct. The fixup in the parent message moves the
conditional selection of VMEMMAP_OPTIMIZATION from DEV_DAX to
ZONE_DEVICE. This covers every ZONE_DEVICE user that sets
dev_pagemap::vmemmap_shift while retaining the architecture opt-in
through ARCH_WANT_OPTIMIZE_DAX_VMEMMAP.

It also removes the DEV_DAX dependency on ZONE_DEVICE that patch 1
added solely to satisfy the Kconfig dependency of
VMEMMAP_OPTIMIZATION.

Andrew, could you please fold this fixup into patch 1,

"mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION"?

[1] =
https://sashiko.dev/#/patchset/20260916064341.1825793-1-songmuchun%40byted=
ance.com

Thanks,
Muchun=
