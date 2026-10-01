Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE9D3EAC71
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845023; cv=none; b=kfDEaijVUY4Rngbn0NXe7x9/cCP02wpI7575acXvjn0cF/mPuG+RxQxLsMl4ZHBAu7ws5Khmpwowaar7CmJt9xGyNL2KuZecxC5HdnDnqsWbEzr7aFSvyo86QvJTDURcVz1i8dnwHeCaq0S0DPt89lkURDWC9Q80C/vRgD3/ooo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845023; c=relaxed/simple;
	bh=3zNTBTzTbpwHYWDK0XIAY+iSCQscCOuwOgZRECRF++g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv0EGxJFvtUjXBdd4CXnlm53jvWsjqsnfyJDRTkxAzSfgdrHEO82CMZHRmKiPYNXBJsWQjkDXlhZtJ0I/UVc+nJ6zdrXfQbWOSRlSlfhgB7RkDnoB52mIiTkFMEOZhZ7dz8fuL4uEXhIv3bJiqQeHUcoCHJ3Uxf2xHJIvZSrQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DAaVkpx1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DAaVkpx1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DFA9497;
	Thu,  1 Oct 2026 01:56:58 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D92233F85F;
	Thu,  1 Oct 2026 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790845021; bh=3zNTBTzTbpwHYWDK0XIAY+iSCQscCOuwOgZRECRF++g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAaVkpx1/jOgpspHxz2Bcpp3BaIEEQQGiZpOP7Ft5D9MvVRn7yixwAw5nEn4Q1kRu
	 T5pUxEmM/GohIBxlkl+Tel3R5OJDpL1uoYfmIvOV38VA+o6xhEiVFK3Ms/MNt1mR2B
	 VoAAdBhD0HbDOtfA3qWgdzxbkmYebz5DXCV53miU=
Date: Thu, 1 Oct 2026 14:26:58 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC] mm: Add KUNIT test for ptval_bytes_to_hex_str()
Message-ID: <uweoxvlup5ogme5m356uw4mzlfn32a3iqyme5mpsoun6qylh56@dmjvfbey6oqo>
References: <20260929120530.3394073-1-anshuman.khandual@arm.com>
 <2f7a38e0-1e85-4983-9bc5-adea49f44cbc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f7a38e0-1e85-4983-9bc5-adea49f44cbc@kernel.org>

On Thu, Oct 01, 2026 at 09:45:01AM +0200, David Hildenbrand (Arm) wrote:
> On 9/29/26 14:05, Anshuman Khandual wrote:
> > Add KUnit tests for ptval_bytes_to_hex_str() to verify conversion of 32-bit
> > 64-bit, and 128-bit (when supported) page table entry values into printable
> > hexadecimal strings.
> > 
> > Add a new PTVAL_HEX_STR_KUNIT_TEST option to enable the tests.
> > 
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> > This patch applies on v7.3-rc5 after the following series
> > 
> > https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/
> > 
> >  mm/Kconfig                        |  11 +++
> >  mm/Makefile                       |   1 +
> >  mm/tests/ptval_hex_string_kunit.c | 111 ++++++++++++++++++++++++++++++
> >  3 files changed, 123 insertions(+)
> >  create mode 100644 mm/tests/ptval_hex_string_kunit.c
> > 
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 604c58199acbf..f68bf26b98c83 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -1511,6 +1511,17 @@ config LAZY_MMU_MODE_KUNIT_TEST
> >  
> >  	  If unsure, say N.
> >  
> > +config PTVAL_HEX_STR_KUNIT_TEST
> > +	bool "KUnit tests for pgtable entry string conversion" if !KUNIT_ALL_TESTS
> > +	depends on KUNIT
> > +	default KUNIT_ALL_TESTS
> > +	help
> > +	  Enable this option to check that ptval_bytes_to_hex_str() is able
> > +	  convert given pgtable entry value in bytes into hex strings which
> > +	  could be printed.
> > +
> > +	  If unsure, say N.
> 
> That's a bit fine grained :)
> 
> Could we somehow pack this under another existing / more generic test? We don't
> want one new test for every new function :)

Probably right. We don't need one test for each new function.

> 
> An alternative would be to use mm/debug_vm_pgtable.c to just run 3 tests at
> runtime as well.

Yes - that could work as well given its printing pgtable entries but
those tests would not be KUNIT based any more I guess. Although just
like the existing VM_WARN_ON() check, new tests should be sufficient.

> 
> > +
> >  source "mm/damon/Kconfig"
> >  
> >  endmenu
> > diff --git a/mm/Makefile b/mm/Makefile
> > index e7245cb88c665..d08b8bd01917b 100644
> > --- a/mm/Makefile
> > +++ b/mm/Makefile
> > @@ -147,4 +147,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
> >  obj-$(CONFIG_EXECMEM) += execmem.o
> >  obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
> >  obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
> > +obj-$(CONFIG_PTVAL_HEX_STR_KUNIT_TEST) += tests/ptval_hex_string_kunit.o
> >  obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
> > diff --git a/mm/tests/ptval_hex_string_kunit.c b/mm/tests/ptval_hex_string_kunit.c
> > new file mode 100644
> > index 0000000000000..45c203cfb49ae
> > --- /dev/null
> > +++ b/mm/tests/ptval_hex_string_kunit.c
> > @@ -0,0 +1,111 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <kunit/test.h>
> > +#include <linux/pgtable.h>
> > +
> > +struct ptval_str {
> > +	u64 val;
> > +	const char *str;
> > +};
> > +
> > +static struct ptval_str ptval_u32_tests[] = {
> > +	{ .val = 0x1234abcd,	.str = "1234abcd"},
> 
> Isn't a single test like this enough. Why would we need the other ones?
> 
> So I think this could all get condensed quite a bit (including the test
> functions, a single one should be sufficient if we really only end up with 3 tests).

If we continue with KUNIT framework, probably all three tests are still
required to distingish them but in mm/debug_vm_pgatble.c based approach
a single test can combine all these tests via VM_WARN_ON().

> 
> -- 
> Cheers,
> 
> David
