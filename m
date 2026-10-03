Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3B62F3632
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988659; cv=none; b=eMuV/rWDPErcC0HUvWtK7qW1vuv9EF1V0cdbVvgH0BzV2XDwkd6GbndzcYxu7CfWCkAJnif7dkgsM0yDK1LfnJ2ebZ54IJFQXT9psxlQZ50cBIADyKKlwx/QP0JCdL+xRvSzL0VKRqi06mRaDGhYKvBG3fgC2Bp5KFMynkPAesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988659; c=relaxed/simple;
	bh=fHvmDL9Rg8az1wjENxOyw+dnD1gJ5gazjd6XWh7FwO4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I9YMHwbHqppdZPFNEEYR/EqOIZt9sOdOap75N2OW63LWSJ+MqrxkyHLwL/hIqWda6zq+OYO+89avEwSmXtelaDLtxa/sfc0igNTYce84BRa3CW9NLcMAnvJqXFYTZto0N8abyCIj1td+pdnWc2peHBdS40vrQikWXYOeLhxTYI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yxca4qjA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yxca4qjA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d3b445a84fso5385ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790988654; x=1791593454; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhiZmVtW9NaeDOXqJJN58cJlU9iYxcpc0LuITj+6LgU=;
        b=Yxca4qjAaI2twGmy4uijY+rLdxqDwa6ba06Dp6zINchIDQqOy3Loxen1J+2TfSO85J
         UWLKE4xQmYRklXCpVy8RCMC8DvNGZDgWIskF9Vlk/rpMm2jE4efd/1GjotOvVU9gdKTk
         FlzNplGdM6Yuqy03byCjN+uTS6/W4K2M8I5KajEG/KiqCQXrJQfy1Uq4hckBLbSehgTs
         pHkzhIHHZiQw6nCKHkwnNdECWsG61mjAorntBWbzmJYi4UBh/6uj4dnkQlIaaSR83cv2
         PWM7T9DVtVBRYN0kqZf1Cq4sbaG57nqq5A3zPiOE9LrUmoC21OZeVuXtFvjhP5Z4xBWZ
         OrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988654; x=1791593454;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhiZmVtW9NaeDOXqJJN58cJlU9iYxcpc0LuITj+6LgU=;
        b=xLCebxuEEF7FDZabxcdT2/Wl1vM3K+Ayug4p4xIinNXUcZvLte8Ovmz6TMdeztqzXk
         mbHBTCv+n/DQOJaKsZa9kRCIQQ+TGBy9Xn2H/cn05kMkqk/8R3u6RQVkNwb8jLB7wFQO
         jeNgJUT4/jwinWkv3z2gkW3OGgriZSroc8DstubGtk7Ke4sGwJm/Jgrq9/gaEDZT+CNu
         iiPvG1TygnqippwDFNG3QXjIwWI/Xpx0O5ePQ/Qw+/fOd97OE94tMXl/gNY+LPyCZtUw
         FZ7o40g9MqjogOnCrEqm0wXOFpypIenSIyAOvEupJnx9cCsgVcex0SwbqqRbxZVzSQGZ
         5nCg==
X-Forwarded-Encrypted: i=1; AKwUvBxPwvgRvP8MTT0yj15TCSQSyBvRJ0d2wGeOKHXvuhDKBWrjZRWNbuYJRSROP1HQLuaUW450Bjr/0hfMs/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4+duhXYkBZ7rx8PEXk4DCQ4m3xQyn0Yi797ifTgVu33K8rqzM
	49j4fYoUGhEP/VRJrthlp8NkfpabC4qBKihz2jaYb5Z7nyWgDRp4Umm1gjDvbdI6Dw==
X-Gm-Gg: AYBFou2ukzmMPCdP10mmlcTRztcxf3+oiXbWx8OAmOdjwySTrekVZ4BCw4+DB6U2GsW
	xfZJZ7mlEjyzqxntpXszysSOodAhCDDnh0p9uLGf+ie+rLzD2A9YAsaHY30ynZPw8B0OJc67q8z
	2WMS2OU2OGF6d3mjTmGPgFLHHFZWsEu2qYKaoNga5kO9Nly7c9uXcYoCj0Vt88xfOZzfXq2qoeZ
	PdpfWy8d3sA4yGFdEaaAm8//sK/FzSrxFUMSMMlSruRo/bTSyy/gQLeqYk6BWN5KJpaiTzcQ5nS
	ushZuulrUX+1zZDoKKD5pkGxNoWnUTEXTSqXkMET7UFsv63zI8t8m45ufMXU4ksJnFPi/tXv3bv
	p4CJb0Jq/fGSZf2xMsl04pp5T4z/VmGc/T1EdZxbRQlaGPp7qvk1Imm1mj3r+agXIabnTPhR9Pj
	8HbhiaRGSIqJ4BrG19bSV6+W2lAPsgjhHotZmrDmBjkZiQjNYc/fRR374CG/wwoMeVHrBxp5I72
	NFwjM83k5miggLXMfSoSzH5Y3lUPaOVBtO2vhVCb5MWOpjkoGm9EgogCetGNw/gSrcK7FS7iXV7
	x3/pA3psXI3VawIN0g8EGhBdU1PPmI/pB+jOLhVR4wJ4lpwMhz51Is4BBiaCmEjxddi+ogL4cA6
	uDdKVTRJixSYynEk=
X-Received: by 2002:a17:903:2312:b0:2e2:dfb8:8184 with SMTP id d9443c01a7336-2e5339613f9mr1485685ad.11.1790988652992;
        Fri, 02 Oct 2026 17:50:52 -0700 (PDT)
Received: from [2a00:79e0:2eb4:9:b188:21e:8df9:36e4] ([2a00:79e0:2eb4:9:b188:21e:8df9:36e4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d661ef5sm781639a91.5.2026.10.02.17.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:50:52 -0700 (PDT)
Date: Fri, 2 Oct 2026 17:50:51 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>, 
    Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [patch v4] mm: vmstat_kunit: add synthetic benchmark for vm
 stats
In-Reply-To: <e72f2134-94d8-41c8-a859-b12357222d95@kernel.org>
Message-ID: <915d8d8d-1813-3585-9cfb-acb536188a1e@google.com>
References: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com> <e72f2134-94d8-41c8-a859-b12357222d95@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2026, David Hildenbrand (Arm) wrote:

> On 9/18/26 22:39, David Rientjes wrote:
> > From: Christoph Lameter <cl@gentwo.org>
> > 
> > Add a synthetic benchmark that can be used to measure performance of VM
> > statistics.  This is used to analyze any improvements or regressions in
> > functions that are frequently used in hot code paths.
> > 
> > The test is run by KUnit or doing modprobe vmstat_kunit directly.
> > 
> > Sample output:
> >  KTAP version 1
> >  1..1
> >  KTAP version 1
> >  # Subtest: vmstat
> >  # module: vmstat_kunit
> >       1..3
> >       # vmstat_test_inc_dec_zone_page_state: 10000 ops: inc_zone_page_state -> 8 cycles (4 ns/op), dec_zone_page_state -> 9 cycles (4 ns/op)
> >       ok 1 vmstat_test_inc_dec_zone_page_state
> >       # vmstat_test_interleaved_zone_page_state: 10000 ops: inc/dec pair -> 17 cycles (8 ns/op)
> >       ok 2 vmstat_test_interleaved_zone_page_state
> >       # vmstat_test_count_vm_event: 10000 ops: count_vm_event -> 4 cycles (2 ns/op)
> >       ok 3 vmstat_test_count_vm_event
> >  # vmstat: pass:3 fail:0 skip:0 total:3
> >  # Totals: pass:3 fail:0 skip:0 total:3
> >  ok 1 vmstat
> > 
> > Assisted-by: Gemini:gemini-3.8-flash
> > Signed-off-by: Christoph Lameter <cl@gentwo.org>
> > Signed-off-by: David Rientjes <rientjes@google.com>
> > ---
> > v4:
> >  - included sample output in the commit description
> >  - switched to NR_MLOCK which is display only so no side effects
> >  - remove unnecessary "rem" variable
> > 
> > Once we're happy with this change, I'll apply the same treatment to the
> > proposed pgalloc and slab tests.
> > 
> >  MAINTAINERS             |   1 +
> >  mm/Kconfig              |  11 +++
> >  mm/Makefile             |   1 +
> >  mm/tests/vmstat_kunit.c | 157 ++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 170 insertions(+)
> >  create mode 100644 mm/tests/vmstat_kunit.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3b2eb2a7a89a..de09076d91b9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17161,6 +17161,7 @@ F:	mm/ptdump.c
> >  F:	mm/sparse-vmemmap.c
> >  F:	mm/sparse.c
> >  F:	mm/sparse.h
> > +F:	mm/tests/vmstat_kunit.c
> >  F:	mm/util.c
> >  F:	mm/vmpressure.c
> >  F:	mm/vmstat.c
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 604c58199acb..2d021fb5ace6 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -1511,6 +1511,17 @@ config LAZY_MMU_MODE_KUNIT_TEST
> >  
> >  	  If unsure, say N.
> >  
> > +config VMSTAT_KUNIT_TEST
> > +	tristate "KUnit test for VM statistics" if !KUNIT_ALL_TESTS
> > +	depends on KUNIT
> > +	default KUNIT_ALL_TESTS
> > +	help
> > +	  Enable this option to test and benchmark the performance of VM
> > +	  statistics updates (zone page state and VM event counters), which
> > +	  are used frequently in hot memory management code paths.
> > +
> > +	  If unsure, say N.
> > +
> >  source "mm/damon/Kconfig"
> >  
> >  endmenu
> > diff --git a/mm/Makefile b/mm/Makefile
> > index e7245cb88c66..3d4f2c43b8d3 100644
> > --- a/mm/Makefile
> > +++ b/mm/Makefile
> > @@ -147,4 +147,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
> >  obj-$(CONFIG_EXECMEM) += execmem.o
> >  obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
> >  obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
> > +obj-$(CONFIG_VMSTAT_KUNIT_TEST) += tests/vmstat_kunit.o
> >  obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
> > diff --git a/mm/tests/vmstat_kunit.c b/mm/tests/vmstat_kunit.c
> > new file mode 100644
> > index 000000000000..899c957091d1
> > --- /dev/null
> > +++ b/mm/tests/vmstat_kunit.c
> > @@ -0,0 +1,157 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * KUnit synthetic performance benchmark for VM statistics.
> > + *
> > + * (C) 2009 Linux Foundation, Christoph Lameter <cl@gentwo.org>
> > + * (C) 2026 Google LLC, David Rientjes <rientjes@google.com>
> > + */
> > +#include <kunit/test.h>
> > +#include <linux/mm.h>
> > +#include <linux/vmstat.h>
> > +#include <linux/timex.h>
> > +#include <linux/ktime.h>
> > +#include <linux/math64.h>
> > +
> > +#define TEST_COUNT 10000
> > +
> > +static void vmstat_test_free_page(void *arg)
> > +{
> > +	__free_page((struct page *)arg);
> > +}
> > +
> > +/*
> > + * Test 1: Sequential inc_zone_page_state() followed by dec_zone_page_state().
> > + * Net change to zone counters is 0.
> > + */
> > +static void vmstat_test_inc_dec_zone_page_state(struct kunit *test)
> > +{
> > +	struct page *page;
> > +	cycles_t time1, time2, time;
> > +	u64 t1_ns, t2_ns;
> > +	u64 inc_cycles, dec_cycles;
> > +	u64 inc_ns, dec_ns;
> > +	unsigned int i;
> > +
> > +	page = alloc_page(GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, page);
> > +	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, vmstat_test_free_page, page), 0);
> > +
> > +	/* Benchmark inc_zone_page_state() */
> > +	time1 = get_cycles();
> > +	t1_ns = ktime_get_ns();
> > +	for (i = 0; i < TEST_COUNT; i++)
> > +		inc_zone_page_state(page, NR_MLOCK);
> 
> Just curious, could some compiler optimizations here change the picture, and
> doing the average would not actually be representative? Not sure if a barrier()
> would reliably avoid that.
> 
> Maybe not relevant today, but I do wonder if we should take care that it stays
> that way.
> 
> Applies to all cases below where we loop.
> This looks much cleaner to me, thanks!
> 

Thanks all for the feedback, answering all three emails here.

Andrew's questions are spot on and his assumptions are correct.  This is
the first of three tests previously posted that measure the execution
times of critical mm functions.  This is the simplest of the tests, the
others are for lots of concurrent allocations through the page allocator
and through the slab allocator.

It's anticipated to be used by developers to measure the impact of any
core changes that would end up causing workload performance issues since
things like vmstats, page allocations, and slab allocations are all hot
paths.  It could also be used to detect regressions over time, from
kernel version to kernel version, independent of development use cases.
So it could certainly be wired up to the kernel test robot.

We've carried this internally in our own test suite since Christoph
posted them back in 2009 :)  We can build with the tests enabled to
measure the impact of any changes in these areas.

The "pass:3" is an artifact of moving this test to kunit, the tests
themselves will not fail and we're only interested in the ns/op.

DavidH: I don't think the compiler can fold or merge the loop bodies, the
compiler shouldn't be able to see through the call to the exported symbol
and actually needs to call it 10,000 times :)  I don't think barrier()
adds anything.

I should make this test depend on CONFIG_VM_EVENT_COUNTERS, however,
otherwise that loop is going to be pretty fast.

If there aren't any concerns, I'll send out a v5 with that change.
