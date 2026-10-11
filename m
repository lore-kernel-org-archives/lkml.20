Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37475A79B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791692286; cv=none; b=KwOul2//5gNblR/7ym1rKNNnPxlnRQZE1lqzSbXyH6d+nxbws/L3knt0TTM1ffoF1rfs/DbvwJ6FcnL3gF2IIVV1cGAhpgO8prKQ+M6YA9KBxyPl1yuBBY+kuJ6nvziawv4M5FQFIkfXZiXdt1d/zvNdM1e8Tgfz6PLO6Qheecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791692286; c=relaxed/simple;
	bh=HuhZht6aU5N/F42V6umEixqmRT9L+VT898rtqYBYdNU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Itmcb7drlJPUbOQgPIJZi7FCQr2RJCM9gsemRDN14MCq/PwWfIdkYbJ6l0gzkuK2ZL3jt7YufTHlITid1ZwkaX0DWlaCzcYkNidKggPvE+H/GxVqsskDb/S97e5VWK67Fs1oFtuDVJWkNVfxkZvT7GREcRI+6bhdcJ8tP+4LFzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mOu+5Xo7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mOu+5Xo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D4B1F000FF;
	Sun, 11 Oct 2026 04:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791692285;
	bh=DQXe8ZXbnsxg1+ywX8B2BQaYZQsy0RAAEXJi/kKPUSA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mOu+5Xo7a92z/S/2VGgblZPi8AXguP9JYXkNhHRY8SSbjs2GXb6O2n6o4z54OU7He
	 pWY65IfFS85L+JZpRRHtGWAsiDdg91jaOHoM0RAw4q3AggI5pxqGoxuVYBRzDURHXt
	 uQJeXyjLRxzCGWl3E9+zhqr8BxH1osGXO3YVaxu8=
Date: Sat, 10 Oct 2026 21:18:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Adam Harshbarger <handyhandyman.adam@gmail.com>, I Hsin Cheng
 <richard120310@gmail.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] lib/plist: add a plist_test case for plist_requeue() on
 the last priority bucket
Message-Id: <20261010211804.2d8a5f6180c74b08e18ad48a@linux-foundation.org>
In-Reply-To: <20261011012245.765558-1-nickolai@csail.mit.edu>
References: <20261010181016.44f5e2883b6820bb32c04204@linux-foundation.org>
	<20261011012245.765558-1-nickolai@csail.mit.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 Oct 2026 21:22:33 -0400 Nickolai Zeldovich <nickolai@csail.mit.edu> wrote:

> The plist_requeue() shortcut inserted the node at the head of the list
> when the node was the first of the last priority bucket and had a
> successor of the same priority, with an earlier bucket present (fixed
> by "lib/plist: fix plist_requeue() corrupting order in the last
> bucket").  The CONFIG_DEBUG_PLIST self-test did not catch it: it only
> requeues nodes it has just added, which are always the last of their
> bucket, so plist_requeue() returned early every time, and
> plist_test_check() only verifies the links, not that the shortcut's
> insertion point is correct.
> 
> Add a deterministic case for the failing shape: A(1) B(2) C(2), requeue
> B.  plist_test_check() verifies the node_list and prio_list links and
> the ordering, and the new BUG_ON() checks that B ended up at the end of
> the list rather than in front of A.
> 
> Before the fix the case produces B(2) A(1) C(2) and the BUG_ON() fires;
> with the fix it produces A(1) C(2) B(2).  Verified with the three
> functions transcribed to a userspace harness driving this exact case
> against mainline (fails), the queued fix (passes) and the alternative
> fix I had posted (passes); lib/plist.o builds with CONFIG_DEBUG_PLIST=y
> (LLVM=1 ARCH=riscv).

Thanks.

>  Not booted.

err, it should be,  If this is wrong, we crash every kernel at boot.

> --- a/lib/plist.c
> +++ b/lib/plist.c
> @@ -283,6 +283,25 @@ static int  __init plist_test(void)
>  		plist_test_check(nr_expect);
>  	}
>  
> +	/*
> +	 * Requeue a node which is the first of the last priority run and has
> +	 * a successor of the same priority, with an earlier run present: the
> +	 * shortcut in plist_requeue() must append it at the end of the list,
> +	 * not in front of the first run.  The random test above never
> +	 * exercises this, since it only requeues nodes it has just added,
> +	 * which are always the last of their run.
> +	 */
> +	plist_head_init(&test_head);
> +	for (i = 0; i < 3; i++) {
> +		plist_node_init(test_node + i, i ? 2 : 1);
> +		plist_add(test_node + i, &test_head);
> +	}
> +	plist_test_requeue(test_node + 1);
> +	plist_test_check(3);
> +	BUG_ON(plist_last(&test_head) != test_node + 1);

No, let's not add a BUG_ON for some selftest.  Emit a loud warning and
proceed.  If it triggers, someone will report it.

> +	for (i = 0; i < 3; i++)
> +		plist_del(test_node + i, &test_head);
> +
>  	printk(KERN_DEBUG "end plist test\n");
>  
>  	/* Worst case test for plist_add() */

This goes in my for-7.4-rcX pile, so no hurry at all.



