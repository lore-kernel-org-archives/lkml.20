Received: from mta1.migadu.com (out-48.mta1.migadu.com [95.215.58.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800148F84A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396270; cv=none; b=MrYKu5dvhsxw1eEKPqgjCdl9iEmsWUgm+KMAB1NOEjZLKsQINDVi1Gr/vvT7vQae9fN/t8n8LaANkuo1rLQfntQ+4WOClAyzojDB0Xwj1gNvgJh/4gXNUbbJy3CciHAIbtBSyeJ5S1ql+YCOlJgdI+rR5gOtTH2x2pvL6qUJll0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396270; c=relaxed/simple;
	bh=hjF8tZ7rA6iLI0wdX17D/6yLew+0TeKbdr1X0twuh94=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eTqvIVSFU+yvvn37L+32nzik2PzX7Lvs2LrFrFdpsY7K5ozYj+cbDef7lccXM5hEWsfWTrNQ25U8SsPRwqGqQrIyraDqgv+z8m4quUSuF2IWYa2JNiKHBzaxPjITnj4D2D4G9KenQQNAliDNss4VX53gC9ZCjVpcJmXnGTxxxcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lIGxj7Mi; arc=none smtp.client-ip=95.215.58.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lIGxj7Mi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hjF8tZ7rA6iLI0wdX17D/6yLew+0TeKbdr1X0twuh94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792396263; v=1; x=1793001063;
 b=lIGxj7Mij5RFMLv6ysso3EZicJKMD0fiibM4JQVtcJXN3SXgCzkD1zzdKQr57NrBMRRT0ftQ
 HQqeCrKzBgMZPyVPMc3fTj7rjlHV6n7ty8DSrT5QCdl5Lv7iCRdIhIOqMGMEASSlF6XVH3vI5As
 2qwqiQi8GAECFL1Sx2zl0MJE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e63287af24581460;
	Mon, 19 Oct 2026 07:51:02 +0000
X-Mizu-Trace-ID: e63287af24581460
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
In-Reply-To: <4a7ad39d-fee6-4390-beff-d40ecf49cbdc@bytedance.com>
Date: Mon, 19 Oct 2026 15:50:48 +0800
Cc: Qi Zheng <qi.zheng@linux.dev>,
 osalvador@suse.de,
 david@kernel.org,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BEADD50D-94AA-4B05-B9AD-136E37247FDD@linux.dev>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <FA455F0C-0A46-4B5B-AB50-E9968001D2C9@linux.dev>
 <4a7ad39d-fee6-4390-beff-d40ecf49cbdc@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 19, 2026, at 15:37, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
> Hi Muchun,
>=20
> On 10/19/26 2:50 PM, Muchun Song wrote:
>>=20
>>=20
>>> On Oct 16, 2026, at 18:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>>>=20
>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>=20
>>> Hi all,
>>>=20
>>> Allocating PMD-sized HugeTLB pages at runtime can become slow or =
fail
>>> as physical memory becomes fragmented. Reserving HugeTLB pages at =
boot
>>> avoids this problem, but keeps unused pages unavailable to ordinary
>>> allocations.
>>>=20
>>> Live upgrades are one example: they need additional HugeTLB pages =
only
>>> during the upgrade. HugeTLB already supports CMA for gigantic pages,
>>> but reserving a CMA pool for 1 GiB pages can fail when physical =
KASLR
>>> and other early reservations leave too few suitable 1 GiB-aligned
>>> ranges. At runtime, 1 GiB allocations can also fail when pages =
cannot
>>> be migrated out of a suitable contiguous range.
>>=20
>> Yes, that's our use case at ByteDance. Allocating a 1GB HugeTLB page =
from
>> the CMA pool is more prone to failure than allocating a 2MB one. To =
improve
>> the probability of successful allocation, we typically configure the =
CMA
>> size to be larger than our actual requirement, keeping a certain =
margin to
>> handle cases where temporary kernel operations (such as DMA) prevent =
successful
>> migration. For 1G HugeTLB pages, since the margin must be an integer =
multiple
>> of 1G, the extra memory configured as headroom is also relatively =
large,
>> making it less flexible than 2M pages.
>>=20
>>>=20
>>> Extend CMA support to PMD-sized pages so their backing memory can be
>>> reserved at boot while remaining usable for movable allocations =
until
>>> needed. This relaxes the reservation alignment requirement and =
reduces
>>> the contiguous range required per allocation.
>>>=20
>>> The series adds an optional @<page-size> suffix to hugetlb_cma and a
>>> separate PMD-sized pool. For example, on x86-64:
>>>=20
>>> hugetlb_cma=3D4G hugetlb_cma=3D1G@2M
>>=20
>> Different sizes of gigantic pages already share a single HugeTLB CMA =
pool.
>> Given that, why not let 2M pages also reuse this same pool? Would =
that make
>> the overall code implementation simpler? And if it does make things =
simpler,
>> should we go ahead and do it first?
>=20
> Sharing the pool would simplify the implementation. My concern is that
> small PMD allocations could fragment the default pool and prevent =
later
> gigantic allocations.

Yes. However, the premise is that there has to be a mixed-use scenario.
I'm not sure if this kind of mixed usage is a common scenario.

Of course, we don't have much experience to draw on, because on most
architectures there is generally only one kind of gigantic page, and
prior to this, mixed-use scenarios could not arise.

Therefore, I think that before the need arises, a simpler design is
easier to maintain.

Thanks,
Muchun

>=20
> 32M allocations can already cause this, but 2M allocations can block
> the same number of 1G-aligned ranges with much less allocated memory.
>=20
> Thanks,
> Qi
>=20
>>=20
>> Thanks,
>> Muchun
>>=20
>>>=20
>>> This reserves 4G for the existing gigantic-page pool and 1G for the
>>> PMD-sized pool. Existing unsuffixed parameters and gigantic-page =
pool
>>> sharing are preserved. The new size follows the architecture's PMD
>>> size rather than being fixed at 2M.
>>>=20
>>> The preparatory patches introduce per-pool state and prevent =
recursive
>>> CMA allocation during migration before enabling PMD-sized =
allocation.
>>>=20
>>> Thanks,
>>> Qi
>>>=20
>>> Qi Zheng (5):
>>>  mm: hugetlb: add explicit page size to hugetlb_cma
>>>  mm: hugetlb: group CMA pool and reservation state
>>>  mm: hugetlb: track CMA reservations by page order
>>>  mm: hugetlb: avoid recursive CMA allocation during migration
>>>  mm: hugetlb: enable CMA allocation for PMD-sized pages
>>>=20
>>> .../admin-guide/kernel-parameters.txt         |  39 ++-
>>> include/linux/hugetlb.h                       |   4 +-
>>> mm/hugetlb.c                                  |  80 +++--
>>> mm/hugetlb_cma.c                              | 328 =
++++++++++++------
>>> mm/hugetlb_cma.h                              |  11 +-
>>> mm/mempolicy.c                                |   2 +-
>>> mm/migrate.c                                  |   3 +-
>>> 7 files changed, 306 insertions(+), 161 deletions(-)
>>>=20
>>>=20
>>> base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
>>> --=20
>>> 2.54.0


