Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033855;
	b=YnKfxx/C4bXHcWp8BxDDgUloWV/Vc0UIAgQbe1loP8fMPVK7OfH/M8qKRWaTn2JPx6TM
	 TL01lHKUmyEzJrmtGi9wpsw6Rzmkcac8sefuwQg92xHmpne4RmtlveSUrLoQ3Omcso60L
	 +MEAPh8ia8W5nPpWjuGOaSWQFbZeNe3I/m2qR8Vl7XlES4CbX8OHn0UwgJgrY/ShTlMd/
	 58TTdXBXTQvDKB5oWW3L+8rbrID2m/koMMMKQkffMcxaVROJSGZtRI/ozKvsk1HCnXnxc
	 /IpihdMe2cGhEHJxOpSrjl1d11+OYd0DIiHNzDdqefhh32RSVKFElDOXyYRYO/pp01Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033855;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=xliLypkGqol0qEpEVa+hTfnI8y9iuSR0fJnpOdphoZo=;
	b=kPyOGqlkvfu6VlLWyNzbNnLNPuWrHs9alLqgG7dkq674xfOy/+RPUYGtFFmaSlg4dltI
	 RBCmrQs5GitcBbRRf6eTgj3PHgLPCkgF0jd4fg516EIcy8Jq2Cv3nyjzA7ZOucKyjWVIW
	 JDADYlZFgae3f/d3eUzliBqN0GUc9S8Cj+TgB9xEiGVA8N1pVASLxQLd6KO/uG+Kg+u4o
	 jKwgP1pf0QOTscrnTnehJMZLcjaEtH/0Mw6Rn2ocEncagXniC+gClQNT/GCKULX7UgZei
	 9UidLxyvnNhJx/lnRYZb+6WT7IQQnJXaDetoyfXz2K+/cx6k8YekCWxYfY2lOmJk2Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pQ0SCBKK;
	arc=none smtp.remote-ip=91.218.175.71
Received: from mta0.migadu.com (out-71.mta0.migadu.com [91.218.175.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FF5606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47FF5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pQ0SCBKK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kGVxC57LJnQRDgXx8D0xd95zTBOZXo4vhbKbkir4GP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794033851; v=1; x=1794638651;
 b=pQ0SCBKKF7yDkPQypqSgjzhBa3VCul4hGS28NKFaCvJ7kGf+XlBoRRMmfzDnIhJDevuOCQ2d
 V/NWfIQMo4t+1jZ4VpyCbdpo3NhceM+djnPUO90G/DCzOGyrM1kpKy+850qChY2uucOR26e60Ho
 oaasVK1+mOQNviKkfI+YTKnY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d37edd97d7e39205;
	Sat, 07 Nov 2026 06:44:10 +0000
X-Mizu-Trace-ID: d37edd97d7e39205
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 06/20] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-7-jthoughton@google.com>
Date: Sat, 7 Nov 2026 14:43:48 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8814E4B3-5A5A-4874-863A-71FC6E4F3B34@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-7-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> For arm64, only some platforms support HVO. Add an arch hook to =
prevent
> HVO from taking affect if the architecture lacks support.
>=20
> It may be the case that arch_supports_hugetlb_vmemmap_optimization()
> returns false at first but eventually returns true. This is the case =
on
> arm64. When this happens, bootmem hugepages won't be immediately =
HVOed,
> but they will be optimized in prep_and_add_bootmem_folios().
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> include/asm-generic/hugetlb.h |  7 +++++++
> mm/hugetlb_vmemmap.c          | 12 ++++++++++++
> 2 files changed, 19 insertions(+)
>=20
> diff --git a/include/asm-generic/hugetlb.h =
b/include/asm-generic/hugetlb.h
> index 635c41cc3479..8d24075d53d4 100644
> --- a/include/asm-generic/hugetlb.h
> +++ b/include/asm-generic/hugetlb.h
> @@ -128,4 +128,11 @@ static inline bool =
gigantic_page_runtime_supported(void)
> }
> #endif /* __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED */
>=20
> +#ifndef __HAVE_ARCH_HVO_SUPPORTED
> +static inline bool arch_hugetlb_vmemmap_optimization_supported(void)

I suggest using arch_support_vmemmap_remap (see [1]), which can also be
applied to FS-DAX.

[1] =
https://lore.kernel.org/all/20260903122128.12264-2-songmuchun@bytedance.co=
m/

> +{
> + 	return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
> +}
> +#endif /* __HAVE_ARCH_HVO_SUPPORTED */
> +
> #endif /* _ASM_GENERIC_HUGETLB_H */
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 3fdb1e4ce1a1..8596a462fee6 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -16,6 +16,7 @@
> #include <linux/pagewalk.h>
> #include <linux/pgalloc.h>
> #include <linux/vmemmap-optimization.h>
> +#include <linux/hugetlb.h>
>=20
> #include <asm/tlbflush.h>
> #include "hugetlb_vmemmap.h"
> @@ -529,6 +530,9 @@ static bool vmemmap_should_optimize_folio(const =
struct hstate *h, struct folio *
> 	if (!READ_ONCE(vmemmap_optimize_enabled))
> 		return false;
>=20
> +	if (!arch_hugetlb_vmemmap_optimization_supported())
> +		return false;
> +
> 	if (!hugetlb_vmemmap_optimizable(h))
> 		return false;
>=20
> @@ -731,6 +735,14 @@ void __init =
hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned in
> 	if (!READ_ONCE(vmemmap_optimize_enabled))
> 		return;
>=20
> + 	/*
> +	 * Architectures may return false here but true by the time
> +	 * hugetlb_init() is called. In this case, although the folios =
will
> +	 * not be pre-HVOed, they will be optimized in hugetlb_init().
> +	 */
> +	if (!arch_hugetlb_vmemmap_optimization_supported())
> +		return;

I plan to add a new helper, section_vmemmap_optimization_disable() [2],
intended to disable vmemmap optimization in the architectural vmemmap
population path. Since arm64 does not support section-based vmemmap
optimization, section_vmemmap_optimization_disable() should be used =
there.

[2] =
https://lore.kernel.org/all/20261107043122.25650-3-songmuchun@bytedance.co=
m/

Thanks,
Muchun

> +
> 	section_set_compound_order_range(pfn, 1UL << order, order);
> }
>=20
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20

