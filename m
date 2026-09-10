Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC7846F495
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043082; cv=none; b=e6hftY/94b8ev+F/uYGasNfU9sSRLcoEBikuvRxzQ5/9RoCEl55OU9ExkqdWNEeYc283Kw+BJJ7XcKNT9VL9udHz+mv3H5iv+fysxjJH/Jjrf4hRexcPyv8XeXK2PjNXK+3r2ru/QeOtJ7hcW/uEgQSc7L79ny4dh4yC83GVToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043082; c=relaxed/simple;
	bh=GFOrvC5JOmP6mNwTrdnlmMT7EnPqV7lFYaNWtrh71k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwO35a1bwGIlFroHrCDhGqXSVpZUakJU8+66XDcXOK0xWtMe2G3GVQTEhs9cA4RRHVdBuuLnRaf/AtgU25JwtRDhfpvuQYMJzK19KsN4U4yfTrsL6fRyVZrtW2XM+0Y+jJ7MdMT2y5HVtxYA0jYM4Y3kmjEh16zggQ1alYl1JI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAylqr2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAylqr2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDC01F000FF;
	Thu, 10 Sep 2026 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043079;
	bh=tFXanxfg2e/r0PAU+w9eHkzd/M9HljlYUur5VUSIyvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eAylqr2E1mZJj3022fXOx8zMyUZz/OAVirsKOq+4mLRozSFatRNLqZkGCiUwtpW1o
	 TEDSsaZBnJhjmeJv05xveM3GVDTgecuXhltaw8tP0YAFENTjIJNXHZV8d99mYskiCU
	 XFvVL9ppBxQbMl50qP86KyTr3QVvzVpSX5d4xso9jTKdgRQlN8Y0l34X+RTK4MJBSO
	 s9gT1FJr9+uWZUF2Gw1DQbnEeJj3He+KIXJJPy9DnQBqsAwnOe84NOjUwhHfAwB88t
	 Uww98gGPYHybU6h1mZZd2hJx/yABVRdtTLtVKteeFuRq2WOkTtJ5BAB5j7F8gG+2fa
	 a84XvpTqRVQyw==
Message-ID: <9c4a267c-921a-482a-91d1-6e84f611e7d5@kernel.org>
Date: Thu, 10 Sep 2026 14:24:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 1/6] lib: introduce hierarchical per-cpu counters
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Martin Liu <liumartin@google.com>, David Rientjes <rientjes@google.com>,
 christian.koenig@amd.com, Shakeel Butt <shakeel.butt@linux.dev>,
 SeongJae Park <sj@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Yu Zhao <yuzhao@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Mateusz Guzik
 <mjguzik@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Aboorva Devarajan <aboorvad@linux.ibm.com>,
 David Carlier <devnexen@gmail.com>, Josh Law <objecting@objecting.org>,
 linux-mm@kvack.org
References: <20260901182857.26690-1-mathieu.desnoyers@efficios.com>
 <20260901182857.26690-2-mathieu.desnoyers@efficios.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260901182857.26690-2-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 20:28, Mathieu Desnoyers wrote:
> This series introduces the hierarchical tree counter (hpcc) to increase
> accuracy of approximated RSS counters exposed through proc interfaces.
> 
> With a test program hopping across CPUs doing frequent mmap/munmap
> operations, the upstream implementation approximation reaches a 1GB delta
> from the precise value after a few minutes, compared to a 80MB delta with
> the hierarchical counter.  The hierarchical counter provides a guaranteed
> maximum approximation inaccuracy of 192MB on that hardware topology.
> 
> * Motivation
> 
> The purpose of this hierarchical split-counter scheme is to:
> 
> - Minimize contention when incrementing and decrementing counters,
> - Provide fast access to a sum approximation,
> - Provide a sum approximation with an acceptable accuracy level when
>   scaling to many-core systems.
> - Provide approximate and precise comparison of two counters, and
>   between a counter and a value.
> - Provide possible precise sum ranges for a given sum approximation.
> 
> Its goals are twofold:
> 
> - Improve the accuracy of the approximated RSS counter values returned
>   by proc interfaces [1],
> - Reduce the latency of the OOM killer on large many-core systems.
> 
> * Design
> 
> The hierarchical per-CPU counters propagate a sum approximation through a
> N-way tree.  When reaching the batch size, the carry is propagated through
> a binary tree which consists of logN(nr_cpu_ids) levels.  The batch size
> for each level is twice the batch size of the prior level.
> 
> Example propagation diagram with 8 cpus through a binary tree:
> 
> Level 0:  0    1    2    3    4    5    6    7
>           |   /     |   /     |   /     |   /
>           |  /      |  /      |  /      |  /
>           | /       | /       | /       | /
> Level 1:  0         1         2         3
>           |       /           |       /
>           |    /              |    /
>           | /                 | /
> Level 2:  0                   1
>           |               /
>           |         /
>           |   /
> Level 3:  0
> 
> For a binary tree, the maximum inaccuracy is bound by:
>    batch_size * log2(nr_cpu_ids) * nr_cpu_ids
> which evolves with O(n*log(n)) as the number of CPUs increases.
> 
> For a N-way tree, the maximum inaccuracy can be pre-calculated based on
> the the N-arity of each level and the batch size.
> 
> * Memory Use
> 
> The most important parts in terms of memory use are the per-cpu counters
> and the tree items which propagate the carry.
> 
> In the proposed implementation, the per-cpu counters are allocated within
> per-cpu data structures, so they end up using:
> 
>   nr_possible_cpus * sizeof(unsigned long)
> 
> This is in addition to the tree items.  The size of those items is defined
> by the per_nr_cpu_order_config table "nr_items" field.  Each item is
> aligned on cacheline size (typically 64 bytes) to minimize false sharing.
> 
> Here is the footprint for a few nr_cpu_ids on a 64-bit arch:
> 
> nr_cpu_ids  percpu counters (bytes)     nr_items       items size (bytes)     total (bytes)
>     2               16                     1                 64                    80
>     4               32                     3                192                   224
>     8               64                     7                448                   512
>    64               512                   21               1344                  1856
>   128              1024                   21               1344                  2368
>   256              2048                   37               2368                  4416
>   512              4096                   73               4672                  8768
> 
> There are of course various trade offs we can make here. We can:
> 
> * Increase the n-arity of the intermediate items to shrink the nr_items
>   required for a given nr_cpus. This will increase contention of carry
>   propagation across more cores.
> 
> * Remove cacheline alignment of intermediate tree items. This will
>   shrink the memory needed for tree items, but will increase false
>   sharing.
> 
> * Represent intermediate tree items on a byte rather than long.
>   This further reduces the memory required for intermediate tree
>   items, but further increases false sharing.
> 
> * Represent per-cpu counters on bytes rather than long. This makes
>   the "sum" operation trickier, because it needs to iterate on the
>   intermediate carry propagation nodes as well and synchronize with
>   ongoing "tree add" operations. It further reduces memory use.
> 
> * Implement a custom strided allocator for intermediate items carry
>   propagation bytes. This shares cachelines across different tree
>   instances, keeping good locality. This ensures that all accesses
>   from a given location in the machine topology touch the same
>   cacheline for the various tree instances. This adds complexity,
>   but provides compactness as well as minimal false-sharing.
> 
> Compared to this, the upstream percpu counters use a 32-bit integer
> per-cpu (4 bytes), and accumulate within a 64-bit global value.
> 
> So there is an extra memory footprint added by the current hpcc
> implementation, but if it's an issue we have various options to consider
> to reduce its footprint.
> 
> Link: https://lkml.kernel.org/r/20260227153730.1556542-1-mathieu.desnoyers@efficios.com
> Link: https://lore.kernel.org/lkml/20250331223516.7810-2-sweettea-kernel@dorminy.me/ # [1]
> Link: https://lkml.kernel.org/r/20260227153730.1556542-2-mathieu.desnoyers@efficios.com
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Dennis Zhou <dennis@kernel.org>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Martin Liu <liumartin@google.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: christian.koenig@amd.com
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: SeongJae Park <sj@kernel.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Miaohe Lin <linmiaohe@huawei.com>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Yu Zhao <yuzhao@google.com>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Cc: David Carlier <devnexen@gmail.com>
> Cc: Josh Law <objecting@objecting.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> ---
>  .../core-api/percpu-counter-tree.rst          |  75 ++
>  include/linux/mm_types.h                      |   4 +-
>  include/linux/percpu_counter_tree.h           | 367 +++++++++
>  init/main.c                                   |   2 +
>  lib/Makefile                                  |   1 +
>  lib/percpu_counter_tree.c                     | 702 ++++++++++++++++++
>  6 files changed, 1149 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/core-api/percpu-counter-tree.rst
>  create mode 100644 include/linux/percpu_counter_tree.h
>  create mode 100644 lib/percpu_counter_tree.c
> 
> diff --git a/Documentation/core-api/percpu-counter-tree.rst b/Documentation/core-api/percpu-counter-tree.rst
> new file mode 100644
> index 000000000000..196da056e7b4
> --- /dev/null
> +++ b/Documentation/core-api/percpu-counter-tree.rst
> @@ -0,0 +1,75 @@
> +========================================
> +The Hierarchical Per-CPU Counters (HPCC)
> +========================================
> +
> +:Author: Mathieu Desnoyers
> +
> +Introduction
> +============
> +
> +Counters come in many varieties, each with their own trade offs:
> +
> + * A global atomic counter provides a fast read access to the current
> +   sum, at the expense of cache-line bouncing on updates. This leads to
> +   poor performance of frequent updates from various cores on large SMP
> +   systems.
> +
> + * A per-cpu split counter provides fast updates to per-cpu counters,
> +   at the expense of a slower aggregation (sum). The sum operation needs
> +   to iterate over all per-cpu counters to calculate the current total.
> +
> +The hierarchical per-cpu counters attempt to provide the best of both
> +worlds (fast updates, and fast sum) by relaxing requirements on the sum
> +accuracy. It allows quickly querying an approximated sum value, along
> +with the possible min/max ranges of the associated precise sum. The
> +exact precise sum can still be calculated with an iteration on all
> +per-cpu counter, but the availability of an approximated sum value with
> +possible precise sum min/max ranges allows eliminating candidates which
> +are certainly outside of a known target range without the overhead of
> +precise sums.
> +
> +Overview
> +========
> +
> +The herarchical per-cpu counters are organized as a tree with the tree
> +root at the bottom (last level) and the first level of the tree
> +consisting of per-cpu counters.
> +
> +The intermediate tree levels contain carry propagation counters. When
> +reaching a threshold (batch size), the carry is propagated down the
> +tree.
> +
> +This allows reading an approximated value at the root, which has a
> +bounded accuracy (minimum/maximum possible precise sum range) determined
> +by the tree topology.
> +
> +Use Cases
> +=========
> +
> +Use cases HPCC is meant to handle invove tracking resources which are
> +used across many CPUs to quickly sum as feedback for decision making to
> +apply throttling, quota limits, sort tasks, and perform memory or task
> +migration decisions. When considering approximated sums within the
> +accuracy range of the decision threshold, the user can either:
> +
> + * Be conservative and fast: Consider that the sum has reached the
> +   limit as soon as the given limit is within the approximation range.
> +
> + * Be aggressive and fast: Consider that the sum is over the
> +   limit only when the approximation range is over the given limit.
> +
> + * Be precise and slow: Do a precise comparison with the limit, which
> +   requires a precise sum when the limit is within the approximated
> +   range.
> +
> +One use-case for these hierarchical counters is to implement a two-pass
> +algorithm to speed up sorting picking a maximum/minimunm sum value from
> +a set. A first pass compares the approximated values, and then a second
> +pass only needs the precise sum for counter trees which are within the
> +possible precise sum range of the counter tree chosen by the first pass.
> +
> +Functions and structures
> +========================
> +
> +.. kernel-doc:: include/linux/percpu_counter_tree.h
> +.. kernel-doc:: lib/percpu_counter_tree.c
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6d815f6440c9..dff5fd1c1b06 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1462,8 +1462,8 @@ static inline void __mm_flags_set_mask_bits_word(struct mm_struct *mm,
>  			 MT_FLAGS_USE_RCU)
>  extern struct mm_struct init_mm;
>  
> -#define MM_STRUCT_FLEXIBLE_ARRAY_INIT				\
> -{								\
> +#define MM_STRUCT_FLEXIBLE_ARRAY_INIT									\
> +{													\
>  	[0 ... sizeof(cpumask_t) + MM_CID_STATIC_SIZE - 1] = 0	\
>  }
>  
> diff --git a/include/linux/percpu_counter_tree.h b/include/linux/percpu_counter_tree.h
> new file mode 100644
> index 000000000000..828c763edd4a
> --- /dev/null
> +++ b/include/linux/percpu_counter_tree.h
> @@ -0,0 +1,367 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
> +/* SPDX-FileCopyrightText: 2025 Mathieu Desnoyers <mathieu.desnoyers@efficios.com> */
> +
> +#ifndef _PERCPU_COUNTER_TREE_H
> +#define _PERCPU_COUNTER_TREE_H
> +
> +#include <linux/preempt.h>
> +#include <linux/atomic.h>
> +#include <linux/percpu.h>
> +
> +#ifdef CONFIG_SMP
> +

Would it be possible to document here how these values are determined?

Without that, ...

> +#if NR_CPUS == (1U << 0)
> +# define PERCPU_COUNTER_TREE_STATIC_NR_ITEMS	0
> +#elif NR_CPUS <= (1U << 1)
> +# define PERCPU_COUNTER_TREE_STATIC_NR_ITEMS	1
> +#elif NR_CPUS <= (1U << 2)
> +# define PERCPU_COUNTER_TREE_STATIC_NR_ITEMS	3
> +#elif NR_CPUS <= (1U << 3)
> +# define PERCPU_COUNTER_TREE_STATIC_NR_ITEMS	7
> +#elif NR_CPUS <= (1U << 4)
> +# define PERCPU_COUNTER_TREE_STATIC_NR_ITEMS	7

... I'm confused why two separate statements share the same number.

(should we simply drop the "elif NR_CPUS <= (1U << 3)" in that case?)


I do wonder whether there is an (easy) way to encode this into a formula. I
assume you tried and it got too hairy :)

-- 
Cheers,

David
