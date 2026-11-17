Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920337;
	b=KpYgTdrYm6eG4WXDzqMCDwWiNM/+QfIbZbJ8wOS+J6FVsZr1ECuB7cSHBAwAlqrU1joP
	 Kda3hwfINMEh7te173+eFHBr5J60pj8Rq8u5rDBRrkZVprdPwISFzKN2vyNeGtcfJ4kjh
	 Dw8bVlcJBTqxk5E71LC0u27yTGyl+KdcVBuBahlZkNHFRvKhlpHofJ3iyHwz+BG5rKiDp
	 5DNhhSty//gZlFUkPbscsJTf3hp+yi45xw5gebr/5TPJPilir/m3Tw9i+s3HTR7fuwmKX
	 nEnOPRyx7XX09RLoQKKHwKd7SYXZXi5Ar/UBwjuWs1nmNAB264Qef+xi/rmiA/6w0FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920337;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ETzbJC1in5IC+3NOvYSae2SmX1J2Sy51B7KWOSdFkgY=;
	b=0/nSSSORQpUUo6meUBWjI244QTlsw45XLzPd0WuIt9tBzmS/Xi1C/ZhJdgHa5WtCFwdA
	 yTYX7Ch1i08xGzEuTRh6ySyOTXgM5ePmhfFvXJbVkgPZFWARbRW/dnAizPgjVXKU8Y8V7
	 CPQ2WkDqdwQ82Gwb/C90CHIhbNmDkw0zVCm/oIC/9x6nasnW1uQx6uQbKH0Y+uKiuR8wm
	 q2jDejSShiFv7MYm3Im4u6TexpoxGiisADQ6yKSAgFjzMTAsriGW6xWZRZEVu2u6pambH
	 k4Pq0NcSfXtEO9wLEt45a2jk+8Ey1bkOsyzqGGK29dc1ctduljpwjc+nKv5TRPeG3OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWlTI+fv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC5606A885
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWlTI+fv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A998B1F000C4;
	Tue, 17 Nov 2026 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920337;
	bh=ETzbJC1in5IC+3NOvYSae2SmX1J2Sy51B7KWOSdFkgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GWlTI+fvDTelDZPIAmzsRdV3Urdoqx0eju+4Y3GnlL89x+Gbtfvjm4dit4iRkqmaj
	 qmm1sGb7GTc18rJr9sUs+07VCIUml2jwFQ9p6mJcB0dXMUdWY74i5lOTlADLUJhu24
	 xmkwtHlinCcdKIavvtegVokXmj9ZakiZx60LuQLUEHPHEzo7OJqy/dGQF2sbrhim7Q
	 etzqv4qYcGHFsfVHa6sqh8iO1mGeh5fW8TUfyA+LTgnsDSwOfFItMyPInTiCEzFf6u
	 RE6253NkVC6SbL2f6qYZxxbk1lBofC+aIAubOPjNT5rREsyVSsevjk0Jr6VE8t6ajE
	 iFdcb6oZsO1bQ==
Date: Tue, 17 Nov 2026 12:58:48 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Muhammad Haris Awan <m.harisawan@icloud.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fork: mark memcpy() in dup_mm() with data_race()
Message-ID: <avxJKzw9JLrSZTlR@gremlin>
References: <179489519663.1444496.15875846661591982934@icloud.com>
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
In-Reply-To: <179489519663.1444496.15875846661591982934@icloud.com>

On Tue, Nov 17, 2026 at 10:59:56AM +0500, Muhammad Haris Awan wrote:
> KCSAN reported a data race between dup_mm() copying oldmm via
> memcpy(mm, oldmm, sizeof(*mm)) and lru_gen_del_mm() modifying
> oldmm->lru_gen.list when an adjacent mm_struct on the shared
> mm_list->fifo is removed under mm_list->lock.
>
> oldmm->lru_gen and oldmm->mmlist are protected by mm_list->lock /
> mmlist_lock (or updated locklessly via lru_gen_use_mm()), not
> oldmm->mmap_lock. Because struct mm_struct uses __randomize_layout and

Firstly what on earth does __randomize_layout have to do with anything?

Secondly, ef694e2d2101 takes the oldmm mmap_lock so what you're saying here is
wrong.

The problem is that you end up manipulating a neighbouring mm in the list.

> mm_init() immediately reinitializes these fields on the new mm, wrap
> the memcpy() in data_race(), matching dup_vma() in mm/vma_init.c.
>
> Fixes: bd74fdaea146 ("mm: multi-gen LRU: support page table walks")
> Reported-by: syzbot+c6e1b1b32ff2fc3b7d60@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c6e1b1b32ff2fc3b7d60
> Signed-off-by: Muhammad Haris Awan <m.harisawan@icloud.com>

Given you're a complete newcomer to mm I do have to ask if you used an LLM, you
should mention that somewhere in the commit message or at least below the '---'
by convention.

And it's vital that you understand everything you submit as per
https://docs.kernel.org/process/generated-content.html

So what work are you doing with regard to KCSAN, data races and mm lifetime that
led you to this? And what expertise are you coming to it with?

> ---
>  kernel/fork.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5efceb8d5..14ac9a070 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1539,7 +1539,12 @@ static struct mm_struct *dup_mm(struct task_struct *tsk,
>  		goto fail_uprobe;
>  	}
>
> -	memcpy(mm, oldmm, sizeof(*mm));
> +	/*
> +	 * oldmm->lru_gen and oldmm->mmlist may be modified concurrently under
> +	 * mm_list->lock / mmlist_lock or locklessly via lru_gen_use_mm(),
> +	 * and mm_init() will immediately reinitialize them.
> +	 */

I really don't like this comment that is begging to bit rot.

> +	data_race(memcpy(mm, oldmm, sizeof(*mm)));

That's _really_ horrible.

That's now making it so any race that matters is ignored in a _super_ sensitive
part of mm, because MGLRU decided it was a special snowflake.

But I'm confused as to why in 4 years nobody reported a KCSAN issue with this?
Surely something increased the likelihood of this race?

In any case, this is MGLRU's fault. It's abusing the mm data structure and doing
something it shouldn't.

So any fix should be there. Similarly for other mmlist users.

Or really, given this seems to be a one-off, spurious, KCSAN report, do nothing
until it becomes clear this will be reported more than once in 4 years? :)

>
>  	if (!mm_init(mm, tsk)) {
>  		mmap_write_unlock(oldmm);
> --
> 2.56.0
>

--
Cheers, Lorenzo
