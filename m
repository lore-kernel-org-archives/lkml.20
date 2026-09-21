Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44201421239
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988109; cv=none; b=kJhzAFauzV2Vcj9ob/vrejbP7R9eYu0ZWOVZlyNBblwa9osAmXn8qa7ZkVpocQ2uGCjKw7C8I5GZbmTUw/InsLNJQHJXi4mD5KkGVZZSk+roh/Gzs1ab9EB5D2i11ZH/xL5uG86c5h2n6bxUWfKNoLEuG31ssYBsyzsY5Fi8uUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988109; c=relaxed/simple;
	bh=VeIsaNzzDd9f9NeJzVh3EXPEgrmVN3PnEqsJPHZMPRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asGXtp8TsrjSOukFfRrWrZ1yZaioflERIVpgoPKkJYz2E9zgc7NGIYENVOFcHFG6EhUQ/zb+KJlsJsVQPcsCiYRnlCBkcqbf0pWQJu7tKNErZKW07UQZW9SFBVJ+E408UZB1VvXIhPC2NO5B/28lw4Mm1p5m8buKgoAyPmEcB/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TcrqUl2G; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TcrqUl2G"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B091570;
	Mon, 21 Sep 2026 03:55:03 -0700 (PDT)
Received: from [10.57.83.12] (unknown [10.57.83.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1D1C3F86C;
	Mon, 21 Sep 2026 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988106; bh=VeIsaNzzDd9f9NeJzVh3EXPEgrmVN3PnEqsJPHZMPRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TcrqUl2GOeCmADC+jcCe/JsSC8+pdpNPcZ+lZEqkLwHaF82/grSesMT2K8TGrEkh8
	 Qc3oT/5ZQjSahcQhuvh7uXmdSxiUefczLAMViYr1PQ+k3g3NIwl+tJWn304rX67Hed
	 cHuJUz2DRzDomCBX+TgkYOUQ70K+qqdbA41d7D/k=
Message-ID: <9aed35be-a411-4d9d-805c-03c836e9e56a@arm.com>
Date: Mon, 21 Sep 2026 11:55:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260903060657.2717457-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260903060657.2717457-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2026 07:06, Anshuman Khandual wrote:
> Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> pxdp_get() helpers which platforms could then override when required. These
> accessors on arm64, will help in ensuring page table accesses are performed
> in an atomic manner while reading 128 bit page table entries later. But for
> now they just default to READ_ONCE(), thus preserving existing behaviour on
> current D64 translation.
> 
> This is similar to generic MM, where all atomic accesses have already been
> converted from READ_ONCE() into pgtable level specific accessors.
> 
> These are preparatory patches for D128 enablement, although standing their
> own for D64 translation as well. These patches are split from earlier D128
> V1 series. There are no functional changes here, and besides mm kselftests
> do not show any regression.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> 
> This series applies on v3.7-rc1 but after applying the following patches

I assume you meant v7.3-rc1 here?

> related to pgtable entry print standardization posted earlier.
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/

This applies.

> 
> https://lore.kernel.org/linux-mm/20260901065454.1906343-1-anshuman.khandual@arm.com/

This fails:
---8<---
$ b4 shazam 20260901065454.1906343-1-anshuman.khandual@arm.com
Grabbing thread from
lore.kernel.org/all/20260901065454.1906343-1-anshuman.khandual@arm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
  Added from v3: 3 patches
  Added from v2: 3 patches
Analyzing 14 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Will use the latest revision: v3
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3 1/2] arm64/mm: Move __check_safe_pte_update()
  ✓ [PATCH v3 2/2] arm64/mm: Standardize printing for pgtable entries
  ---
  ✓ Signed: DKIM/arm.com
---
Total patches: 2
---
Applying: arm64/mm: Move __check_safe_pte_update()
Applying: arm64/mm: Standardize printing for pgtable entries
Patch failed at 0002 arm64/mm: Standardize printing for pgtable entries
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: arch/arm64/mm/fault.c:160
error: arch/arm64/mm/fault.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
---8<---

And as a result I can't apply this series. Any tips?

Thanks,
Ryan


> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> Anshuman Khandual (4):
>   arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
>   arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
>   arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
>   arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
> 
>  arch/arm64/include/asm/pgtable.h |  6 ++--
>  arch/arm64/mm/fault.c            |  8 ++---
>  arch/arm64/mm/fixmap.c           |  6 ++--
>  arch/arm64/mm/hugetlbpage.c      | 10 +++---
>  arch/arm64/mm/kasan_init.c       | 18 +++++-----
>  arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
>  arch/arm64/mm/pageattr.c         |  8 ++---
>  arch/arm64/mm/trans_pgd.c        | 14 ++++----
>  8 files changed, 66 insertions(+), 64 deletions(-)
> 

