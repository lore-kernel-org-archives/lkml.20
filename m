Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033936;
	b=DRAxM2QyQimv5DkmfvPmnWPPfN4oaQ8AceDOGaZo65WXg1pJzOIJs/OX3wh2NA+nDrUF
	 zRazy/fojWsAhVrEwnSuKOtzIaQEbkthWDP+hIgFkTi2sH5nXVg62w8Js9Ca1DZQa8i7d
	 C7nusqblecPjfxK6iyGcY8pnBOcT8DGZgq8SVEOLjO/fyjMDTH18hnFEEyEsxIuCn6kAf
	 ax29tKm07YB3LKVbCRkyDJ0W4sxV3kv+hVE9u3AHuBc23fQImnITdgh6OtUxT1NJqWrPO
	 85R2oVsQBVqRUTyOIebssSYMlSM0Jmh3RCUHao5r3JppTm1df0dHgdMbGwxKjpsn7FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033936;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=p0Q+aPh9FXmspSlImRXpx816BsnlvW0umQZjVoRPYEU=;
	b=pciDiNqiuC+P8MEcOCoeOnqepLPQ6XVvRoKuizAjWr1fYNaXVf7RXyFtrj/YWoEf1PV1
	 xCdlXHqyMgwjCovQie0vCK7pOdSTS4vYI24UGJe8vfQxa2XhcOsWtkb10DWpRr5jBLEGh
	 G7xW+moO4BtoMDuSd9QIMMKw4iJfSxIaOPZZcAamKtR5qBFhiOmiAasRd/61UrVprmKW8
	 mSvtkezM7MIEIA/GnCx2fajjem5DlBwIRtbtU2uGOHLM9m4ioYHmPEXh9j2hj3W/rWmp4
	 ePBiXAx3QGlfclmm2vjB5UZIEamvCb4R/ykUaNwhaYaNOyBEDKEqytP5HNA+ZrEhhuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PLiMgy2m;
	arc=none smtp.remote-ip=91.218.175.85
Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11A606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA11A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PLiMgy2m
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l8FwMw+tmHQ7yeBnzjT9XdJgKx4elexMVrnBE3P9GII=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794033932; v=1; x=1794638732;
 b=PLiMgy2mkCsCeBwAzcCbel54H98GbsWHqYUPAwA5TRiOgHIetnjEEAApj6O5kb7uV3oKEhxR
 LGsMaFY4sLqQldb0T6GTheqink0+up+b5DfPjNWpu057NaTIe9xJfNGONa4kUuFMRghIbI0vCPD
 uLnvROtZzHXdMzbJHO5d1TDk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c05da5992c7d8cdf;
	Sat, 07 Nov 2026 06:45:29 +0000
X-Mizu-Trace-ID: c05da5992c7d8cdf
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
Subject: Re: [PATCH v2 13/20] arm64: Support hugetlb vmemmap optimization
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-14-jthoughton@google.com>
Date: Sat, 7 Nov 2026 14:45:11 +0800
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
Message-Id: <CAF9824D-CDC5-48E6-A1F6-840CB299EADB@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-14-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> Support HVO if HW AF and BBML3 are supported. These are the required
> features for the vmemmap to be modified in place.
>=20
> On arm64 systems that do not have the required hardware features to
> support HVO, the HVO sysctl will not appear, and any attempts to =
enable
> HVO (either via the command line or via
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy) will have no =
effect.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> arch/arm64/Kconfig               | 2 ++
> arch/arm64/include/asm/hugetlb.h | 7 +++++++
> mm/hugetlb_vmemmap.c             | 4 ++++
> 3 files changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b51d23a62c92..e4c87487bc7f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -92,7 +92,9 @@ config ARM64
> 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> 	select ARCH_WANT_FRAME_POINTERS
> 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || =
(ARM64_16K_PAGES && !ARM64_VA_BITS_36)
> +	select ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
> 	select ARCH_WANT_LD_ORPHAN_WARN
> +	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM

Because vmemmap optimization depends on compound_info_has_mask(), before
enabling HVO on arm64, its vmemmap start address needs to be aligned to
MAX_FOLIO_VMEMMAP_ALIGN. Therefore, a prerequisite patch is required.

Thanks,
Muchun

> 	select ARCH_WANTS_EXECMEM_LATE
> 	select ARCH_WANTS_NO_INSTR
> 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> diff --git a/arch/arm64/include/asm/hugetlb.h =
b/arch/arm64/include/asm/hugetlb.h
> index d038ff14d16c..938d7896a31e 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -11,6 +11,7 @@
> #define __ASM_HUGETLB_H
>=20
> #include <asm/cacheflush.h>
> +#include <asm/cpufeature.h>
> #include <asm/mte.h>
> #include <asm/page.h>
>=20
> @@ -65,6 +66,12 @@ extern void huge_ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> 					 unsigned long addr, pte_t =
*ptep,
> 					 pte_t old_pte, pte_t new_pte);
>=20
> +#define __HAVE_ARCH_HVO_SUPPORTED
> +static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
> +{
> +	return system_supports_bbm_through_af();
> +}
> +
> #include <asm-generic/hugetlb.h>
>=20
> static inline void __flush_hugetlb_tlb_range(struct vm_area_struct =
*vma,
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index c1c736dd08b9..fabf2b25fe59 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -85,6 +85,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct =
page *head, unsigned long start,
>=20
> 		/* Make pte visible before pmd. See comment in =
pmd_install(). */
> 		smp_wmb();
> +		/*
> +		 * On arm64, this requires BBML3. Its support has =
already been
> +		 * checked.
> +		 */
> 		pmd_populate_kernel(&init_mm, pmd, pgtable);
> 		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
> 			flush_tlb_kernel_range(start, start + PMD_SIZE);
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20

