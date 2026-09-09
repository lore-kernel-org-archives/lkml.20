Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1A3998B4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977888; cv=none; b=XTHDfNHqrydBIaAtXRy/1zPvfhvE87MU+lsdwvJ0cD8WAm5CSSRRN8row8eTUv9uqSv1GHvllmkHWf/X8r/jloiJ1gDhrx6jzSE2nSoUROs33JsW6yRxZCOehpuHb0H7TnIwNgmkqDQsEvSpTcuGKOQVYQreZ2ve16wNeDS7GW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977888; c=relaxed/simple;
	bh=a5KoTsru4QeX3ourrXoG/HiW8Ls4AkpUlsNfQy7SGEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rVqtDIVFjJ6lTs6PoWTgNTBPmymBJdpcsuZZxdHonsXNb4v2txr/J0VwSMwKql93xtx3blsxfmjU8SvIE9q4UaujhvEMO+elDWjgspcrrxP6jqBulQg+ijtegzxbuOA1xMhrilWLxIu+pQXyGJOZGiO+kS6mltzngQ1+0cANFTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hdjrczZf; arc=none smtp.client-ip=95.215.58.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hdjrczZf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=a5KoTsru4QeX3ourrXoG/HiW8Ls4AkpUlsNfQy7SGEw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788977884; v=1; x=1789582684;
 b=hdjrczZfkw2I5j0slrseLFrL0HLbRNdtQMFQrsNdzs1bYi1PYj8Tjts37DA6V9VJp7HsbDBE
 gqTGEV5KgS4kurpr3VBG0GruXhEvKyTmyOTlL/SjpO7Lybk0tvVNiNmK9wY329ZL5cjWMmleOqu
 7L1Y0TMcv1+gqiBUoDXBAtLc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7a7c3fb00e682847;
	Wed, 09 Sep 2026 18:17:54 +0000
X-Mizu-Trace-ID: 7a7c3fb00e682847
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@kernel.org>,  Lorenzo Stoakes <ljs@kernel.org>,  "Liam R. Howlett"
 <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>,  Mike Rapoport
 <rppt@kernel.org>,  Suren Baghdasaryan <surenb@google.com>,  Michal Hocko
 <mhocko@suse.com>,  Jan Kara <jack@suse.cz>,  Tejun Heo <tj@kernel.org>,
  Dennis Zhou <dennis@kernel.org>,  "Matthew Wilcox (Oracle)"
 <willy@infradead.org>,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org,
  bpf@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] writeback: report a Tasks-RCU quiescent state per cgwb
 drain pass
In-Reply-To: <20260909-cgwb-tasks-rcu-qs-v1-1-967a7754771f@toxicpanda.com>
	(Josef Bacik's message of "Wed, 09 Sep 2026 18:01:07 +0000")
References: <20260909-cgwb-tasks-rcu-qs-v1-1-967a7754771f@toxicpanda.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 09 Sep 2026 18:17:45 +0000
Message-ID: <7ia4ik4ep9va.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Josef Bacik <josef@toxicpanda.com> writes:

> cleanup_offline_cgwbs_workfn() drains a dying cgwb by calling
> cleanup_offline_cgwb() until it returns false, with a cond_resched()
> between passes.  On a CONFIG_PREEMPTION kernel that cond_resched() does
> nothing: _cond_resched() is a plain "return 0", and under
> PREEMPT_DYNAMIC the full and lazy modes disable it.  Since commit
> 7dadeaa6e851 ("sched: Further restrict the preemption modes") those are
> the only two models on the architectures with PREEMPT_LAZY support,
> arm64 and x86 among them, so the drain loop never reports a Tasks-RCU
> quiescent state.
>
> A worker draining a cgwb with millions of attached inodes runs for
> minutes.  On a 6.18 arm64 host in lazy mode the cgwb worker drained one
> dying cgroup's writeback domain for over 11 minutes.  A BPF program
> unlink (bpf_trampoline_unlink_prog -> bpf_trampoline_update ->
> unregister_ftrace_direct -> ftrace_shutdown -> synchronize_rcu_tasks())
> waited on that grace period while holding the trampoline mutex, 42
> tasks queued behind it in D state, and the hung task detector fired at
> 614 s and panicked the host.  Any BPF or ftrace detach during a long
> drain inherits the drain's length.
>
> Fix this by calling cond_resched_tasks_rcu_qs() so we do not stall out
> anybody who calls sycnrhonize_rcu_tasks().  We put this in a do { } while
> loop because if we have many small cgroups cleanup_offline_cgwb() will
> return false and we will never call cond_resched_tasks_rcu_qs(), creating
> the same problem.
>
> Fixes: c22d70a162d3 ("writeback, cgroup: release dying cgwbs by switching attached inodes")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/bpf/9d444098-7c03-4163-af12-bd0a79a51443@paulmck-laptop/
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  mm/backing-dev.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index cecbcf9060a6..18e999053bae 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -910,8 +910,9 @@ static void cleanup_offline_cgwbs_workfn(struct work_struct *work)
>  			continue;
>  
>  		spin_unlock_irq(&cgwb_lock);
> -		while (cleanup_offline_cgwb(wb))
> -			cond_resched();
> +		do {
> +			cond_resched_tasks_rcu_qs();
> +		} while (cleanup_offline_cgwb(wb));

Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks!
