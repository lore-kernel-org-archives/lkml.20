Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552480;
	b=XKaDPFMcebmBuOEAUCaWOYZUjZaL4OKdXkEpyMToZMlQI3sioixoZ4327SzLVQzZuE0O
	 zMQKyZHGj2NY7orlCDrPgmKaXxwiXSkcp7jKJUEWtK/DG/g8wxH6rj8XwhAML/aHOK4px
	 FC3Cusc9jafLz/AmgHV8begY1cmcEsQBopWH7V7ZtxY912GS3dJJwh9rIJsMjXOZ/80rJ
	 ZSwpQ6k7sd8oih54GiGIBvQC4VxVBKIg1gEuD7At5N+pLuvbTrS6NCrq2UVfAtRkmS3yk
	 82tQiWKGfpHOOzL/q/I6DZVzqFCzsZMUE3CMiV/H4DEh+qCA8Hkvyzigseq184gbRKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552480;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2V+tV4ewaynofE8kPco4QPP/Avu9AgLsEkRfsCohWsI=;
	b=142WiTD4BRMgA6iB+Z+Bn+rDWo9aRHe3coPMyV4+h8q01tflnqcNwUqoJUTX4m9uBZAZ
	 /KKqdK/Jx1BWZ8y5WBI3LS4dEy8xjn2+nONDaFT7JIpufHIy6eTZ8uuFZp4o1UwcZQvEu
	 1auJR4Z3t8v5zJa4G7Rjw1X8hraZmlWQKyYg9i8WZNAfauAD5VYuYBD8EmjIMu/R36yw/
	 yJYmAhtraUFCY5RUZ2i0IfbWqP12pfXz9eO3gi6HjnpxB/pgM0UUf7X+bcE/N5GFXxoTa
	 x9W1aiBrfoyr2TsV+zYo4cKMmTGLZWx/Oq92ri2JzOggk5V6l72Y2iQY7TmvtJiUW7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sCJ9eEuX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869A2606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sCJ9eEuX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C066616F2;
	Thu, 12 Nov 2026 22:47:55 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EFBB3F85F;
	Thu, 12 Nov 2026 22:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794552478; bh=5i7fDyuQrBPfqbfudFwvrfilL8nz8d+trbu034WceBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCJ9eEuXBnkpPB+5xYYSTJZKQIv2FyOza6IduZmLGvxBm/AjRigGwtWQ0bh8UmagQ
	 TbYwfJoXNo+ZuQpa2iGOFgo5MFSasfVKaJiXzi8QljIpJh8j533RoyPp5LSAlsh8rA
	 wz0XuEGtjc868dTQbbtg4WNXfApl4kI2T02vXAYo=
Date: Fri, 13 Nov 2026 12:17:55 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V4 0/4] arm64/mm: Convert pgtable READ_ONCE() as
 pxdp_get()
Message-ID: <ikp346hhtfkswk4gabydkaxgtuvoygrj75clezzv25r2j7t6gz@q32fppupesvt>
References: <20261105043403.3326445-1-anshuman.khandual@arm.com>
 <vtaekdnpxd5avhpv3hlmeswwq5raf57ila2qyilxvddu3w5nnq@lkenzauzv7hy>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vtaekdnpxd5avhpv3hlmeswwq5raf57ila2qyilxvddu3w5nnq@lkenzauzv7hy>

On Fri, Nov 13, 2026 at 08:58:51AM +0530, Anshuman Khandual wrote:
> On Thu, Nov 05, 2026 at 10:03:59AM +0530, Anshuman Khandual wrote:
> > Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> > pxdp_get() helpers which platforms could then override when required. These
> > accessors on arm64, will help in ensuring page table accesses are performed
> > in an atomic manner while reading 128 bit page table entries later. But for
> > now they just default to READ_ONCE(), thus preserving existing behaviour on
> > current D64 translation a well.
> > 
> > This is similar to generic MM where all atomic accesses have already been
> > converted from READ_ONCE() into pgtable level specific accessors.
> > 
> > These are preparatory patches for D128 enablement, although standing their
> > own for D64 translation as well. These patches are split from earlier D128
> > V1 series. There are no functional changes here, and besides mm kselftests
> > do not show any regression.
> > 
> > https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> > 
> > This series applies on v7.4-rc1 and have been hosted below for reference.
> > 
> > git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v4)
> > 
> > Changes in V4:
> > 
> > - Dropped all pxdp_get() platform overrides per Catalin
> > - Moved pmdp_test_and_clear_young() and [pud|p4d]_offset[_phys]()
> >   helpers inside arch/arm64/mm/mmu.c to avoid build problems
> > - Updated all commit messages as required
> 
> This series has run into some KASAN fault issues during boot with 5 level
> pgtables but also unlike Sashio suggestions these would require more code
> churn to fix. Please find the details below.
> 
> https://lore.kernel.org/all/ohyhflzuoxdemccemutoosmj5hsfwylrlt6tvnyehulerk7gf3@ada6wu4zrzkp/
> 
> NOTE: somehow Sashiko had dropped LAKML from the thread although it shows
> up in MM list.
> 
> Given the above scenario, I would suggest falling back on the V3 series,
> that defined and override pxdp_get() helpers for arm64 platform. Although
> similar to generic MM default fallback, they prevented code movement into
> arch/arm64/mm/mmu.c file causing these KASAN issues in the first place.
> 
> https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/
> 
> V3 series apples cleanly, builds, boots and also clears MM selftests on
> v7.4-rc2 as well.

The following upstream commit had changed pxdp_get() arguments as 'const'
(since V3 was posted) which would now require similar changes to be made
in all platform overrides for pxdp_get().

48bd5dc504cc ("constify arguments in default pxdp_get()")

Hence will repost V3 series as V5 after changing the arguments as 'const
pgprot_t *' if there are no other conerns.

> 
> > 
> > Changes in V3:
> > 
> > https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/
> > 
> > - Added overrides for pxdp_get() and replaced remaining READ_ONCE()
> > - Updated all commit messages as required
> > - Dropped previous tags
> > 
> > Changes in V2:
> > 
> > https://lore.kernel.org/all/20260922061638.3967467-1-anshuman.khandual@arm.com/
> > 
> > - Rebased on v7.3-rc4 along with all latest dependencies
> > - Updated commit messages per Ryan
> > - Added tags from Ryan
> > 
> > Changes in V1:
> > 
> > https://lore.kernel.org/all/20260903060657.2717457-1-anshuman.khandual@arm.com/
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Linu Cherian <linu.cherian@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-mm@kvack.org
> > 
> > Anshuman Khandual (4):
> >   arm64/mm: Use pmdp_get() for PMD accesses
> >   arm64/mm: Use pudp_get() for PUD accesses
> >   arm64/mm: Use p4dp_get() for P4D accesses
> >   arm64/mm: Use pgdp_get() for PGD accesses
> > 
> >  arch/arm64/include/asm/pgtable.h | 38 +++----------
> >  arch/arm64/mm/fault.c            |  8 +--
> >  arch/arm64/mm/fixmap.c           |  6 +-
> >  arch/arm64/mm/hugetlbpage.c      | 10 ++--
> >  arch/arm64/mm/kasan_init.c       | 18 +++---
> >  arch/arm64/mm/mmu.c              | 97 ++++++++++++++++++++++----------
> >  arch/arm64/mm/pageattr.c         |  8 +--
> >  arch/arm64/mm/trans_pgd.c        | 14 ++---
> >  8 files changed, 108 insertions(+), 91 deletions(-)
> > 
> > -- 
> > 2.43.0
> > 
