Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E976379C42
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597984; cv=none; b=P7Et2S+TNkQX29obOR3v1qC7SfYMcA4pzUTug5DnaLNB8Y8zSnKwMO390SU7xhCT0TX1Hz8CyhYDLpUwqIVJ/tM7kwmFPqpSKrPg89r3i4/h2z8LK0sNrx1VTnQiRVUGuyZfTL8rj7bTGFraJHplhu1YWUt62qJU/k5YoKCigi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597984; c=relaxed/simple;
	bh=+odSPGHMvNELUkeAuN53FWH8WbosA6kggeCd89bJGhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLGlnoQpTCTVYmlQ7exCvpszrmg5zRancrtOQdR6NitHjwgy4GRTs2qLslHmEwyeJYZnwdncMEsPGIoGoEBiUfRqe5i2leCTT4YoUwcrv8pUIzSWbbNtEXouDcjVkMRieEljrCb5j0h+VghKQ37WF0cnnhXipI//+OJXOAHkngU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdzZPRu9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdzZPRu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63181F000FF;
	Mon, 28 Sep 2026 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790597982;
	bh=Ohwros3KJBzi0jPBOqdA6bXPhNWwE/XNWT6NGKqiiJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YdzZPRu9Nn0yBypW8uscTyI+AB2opAITNSPrdORh14BQox3KliXHTMyLZ4Wz+B6+q
	 1C5kScmdm4wfBDFaiKHL45jdU/6w8SaNSwndJvzeUkMK+KAhlnBCHWuaD1fMn5Zs5F
	 khkw5V70JKFEQzQxfgRzkarMvRCPP1ZAGEvxP/EfQhqMy48Woofn8hrdotzix5/xf0
	 I8bqdgjebm8rMHCn2sxnURIKQ3wrGD9Q2DmqPtIDUWk9dnrfrXi2Tw1LxCCTZLlQtf
	 A7194sOUxY85lTZBouNzAO69mlSBlkGZBRNxPSWiMwiHfng1cxXzHwVn8r6gg8QDWY
	 r83xww0IIyJHg==
Message-ID: <e72f2134-94d8-41c8-a859-b12357222d95@kernel.org>
Date: Mon, 28 Sep 2026 14:19:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch v4] mm: vmstat_kunit: add synthetic benchmark for vm stats
To: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Sarthak Sharma <sarthak.sharma@arm.com>
References: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <cfc1edae-8aaa-8fd0-95de-af3d4774c6dd@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 22:39, David Rientjes wrote:
> From: Christoph Lameter <cl@gentwo.org>
> 
> Add a synthetic benchmark that can be used to measure performance of VM
> statistics.  This is used to analyze any improvements or regressions in
> functions that are frequently used in hot code paths.
> 
> The test is run by KUnit or doing modprobe vmstat_kunit directly.
> 
> Sample output:
>  KTAP version 1
>  1..1
>  KTAP version 1
>  # Subtest: vmstat
>  # module: vmstat_kunit
>       1..3
>       # vmstat_test_inc_dec_zone_page_state: 10000 ops: inc_zone_page_state -> 8 cycles (4 ns/op), dec_zone_page_state -> 9 cycles (4 ns/op)
>       ok 1 vmstat_test_inc_dec_zone_page_state
>       # vmstat_test_interleaved_zone_page_state: 10000 ops: inc/dec pair -> 17 cycles (8 ns/op)
>       ok 2 vmstat_test_interleaved_zone_page_state
>       # vmstat_test_count_vm_event: 10000 ops: count_vm_event -> 4 cycles (2 ns/op)
>       ok 3 vmstat_test_count_vm_event
>  # vmstat: pass:3 fail:0 skip:0 total:3
>  # Totals: pass:3 fail:0 skip:0 total:3
>  ok 1 vmstat
> 
> Assisted-by: Gemini:gemini-3.8-flash
> Signed-off-by: Christoph Lameter <cl@gentwo.org>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
> v4:
>  - included sample output in the commit description
>  - switched to NR_MLOCK which is display only so no side effects
>  - remove unnecessary "rem" variable
> 
> Once we're happy with this change, I'll apply the same treatment to the
> proposed pgalloc and slab tests.
> 
>  MAINTAINERS             |   1 +
>  mm/Kconfig              |  11 +++
>  mm/Makefile             |   1 +
>  mm/tests/vmstat_kunit.c | 157 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 170 insertions(+)
>  create mode 100644 mm/tests/vmstat_kunit.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b2eb2a7a89a..de09076d91b9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17161,6 +17161,7 @@ F:	mm/ptdump.c
>  F:	mm/sparse-vmemmap.c
>  F:	mm/sparse.c
>  F:	mm/sparse.h
> +F:	mm/tests/vmstat_kunit.c
>  F:	mm/util.c
>  F:	mm/vmpressure.c
>  F:	mm/vmstat.c
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 604c58199acb..2d021fb5ace6 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1511,6 +1511,17 @@ config LAZY_MMU_MODE_KUNIT_TEST
>  
>  	  If unsure, say N.
>  
> +config VMSTAT_KUNIT_TEST
> +	tristate "KUnit test for VM statistics" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to test and benchmark the performance of VM
> +	  statistics updates (zone page state and VM event counters), which
> +	  are used frequently in hot memory management code paths.
> +
> +	  If unsure, say N.
> +
>  source "mm/damon/Kconfig"
>  
>  endmenu
> diff --git a/mm/Makefile b/mm/Makefile
> index e7245cb88c66..3d4f2c43b8d3 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -147,4 +147,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
>  obj-$(CONFIG_EXECMEM) += execmem.o
>  obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
>  obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
> +obj-$(CONFIG_VMSTAT_KUNIT_TEST) += tests/vmstat_kunit.o
>  obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
> diff --git a/mm/tests/vmstat_kunit.c b/mm/tests/vmstat_kunit.c
> new file mode 100644
> index 000000000000..899c957091d1
> --- /dev/null
> +++ b/mm/tests/vmstat_kunit.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * KUnit synthetic performance benchmark for VM statistics.
> + *
> + * (C) 2009 Linux Foundation, Christoph Lameter <cl@gentwo.org>
> + * (C) 2026 Google LLC, David Rientjes <rientjes@google.com>
> + */
> +#include <kunit/test.h>
> +#include <linux/mm.h>
> +#include <linux/vmstat.h>
> +#include <linux/timex.h>
> +#include <linux/ktime.h>
> +#include <linux/math64.h>
> +
> +#define TEST_COUNT 10000
> +
> +static void vmstat_test_free_page(void *arg)
> +{
> +	__free_page((struct page *)arg);
> +}
> +
> +/*
> + * Test 1: Sequential inc_zone_page_state() followed by dec_zone_page_state().
> + * Net change to zone counters is 0.
> + */
> +static void vmstat_test_inc_dec_zone_page_state(struct kunit *test)
> +{
> +	struct page *page;
> +	cycles_t time1, time2, time;
> +	u64 t1_ns, t2_ns;
> +	u64 inc_cycles, dec_cycles;
> +	u64 inc_ns, dec_ns;
> +	unsigned int i;
> +
> +	page = alloc_page(GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, page);
> +	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test, vmstat_test_free_page, page), 0);
> +
> +	/* Benchmark inc_zone_page_state() */
> +	time1 = get_cycles();
> +	t1_ns = ktime_get_ns();
> +	for (i = 0; i < TEST_COUNT; i++)
> +		inc_zone_page_state(page, NR_MLOCK);

Just curious, could some compiler optimizations here change the picture, and
doing the average would not actually be representative? Not sure if a barrier()
would reliably avoid that.

Maybe not relevant today, but I do wonder if we should take care that it stays
that way.

Applies to all cases below where we loop.
This looks much cleaner to me, thanks!

-- 
Cheers,

David
