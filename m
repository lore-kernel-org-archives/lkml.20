Received: from one.firstfloor.org (one.firstfloor.org [65.21.254.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494CB4CCDFC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.254.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296740; cv=none; b=j2GW4os+SYSvVtIyRD1owokvIFYG0V7Qu0FPRjMFfO4Z32r3tTXx/jjzv0kfw8XXit5FHcZ/EeB+1XelGA+dgB2xfJwabcamwrgv1Maf1frqyqBrwVu9Yi78Wj4XxwXIVNFy10tWDP8dzSLqaFz4bYXYdJnmXljORTv0zXfNfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296740; c=relaxed/simple;
	bh=mikHWBVHwPIngy7AjWPfkAKPtZLQnacwYBEPka6Yk9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uT1x+Hfe0aW6Qe6TDZuWzFhuboudfREQlPJmd8/xCyIoBLSkFkYCSPich/2eAM8MxqSoaBnVPEM0FTa0j8jCnzPSendfphVuGsLhXqpvd9oGq/O+3sO/l7pq2TrSXeMs/u08cES9SjfQ62VXOiwEeU+YMrH+yIHJVicy9SXUcGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firstfloor.org; spf=pass smtp.mailfrom=firstfloor.org; dkim=pass (1024-bit key) header.d=firstfloor.org header.i=@firstfloor.org header.b=R6K8JbWq; arc=none smtp.client-ip=65.21.254.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firstfloor.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firstfloor.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=firstfloor.org header.i=@firstfloor.org header.b="R6K8JbWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firstfloor.org;
	s=mail; t=1788296728;
	bh=mikHWBVHwPIngy7AjWPfkAKPtZLQnacwYBEPka6Yk9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R6K8JbWqPrEfWCqyPS5qBeb05fyg0HokwPX9IsOBMDQ/m/EKW+jTOYGFey1m0RLm4
	 AqjKbFyIcO/fHJlzrKCRr3kjmnfGgYDh+uHpIeFIHN4lRmWQL1pOKPT8wwGi4j2Sab
	 FTO0DYwmstnvXSeeGcZNs5Wm3NVzA7NO6bl8OP6k=
Received: by one.firstfloor.org (Postfix, from userid 503)
	id D61A95EA51; Tue,  1 Sep 2026 23:05:27 +0200 (CEST)
Date: Tue, 1 Sep 2026 14:05:27 -0700
From: Andi Kleen <andi@firstfloor.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Andi Kleen <ak@kernel.org>,
	akpm@linux-foundation.org, liam@infradead.org, jannh@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RCU safety for vma maple tree walks
Message-ID: <apc-F_D5mWwWL74i@firstfloor.org>
References: <20260831143511.1133029-1-ak@kernel.org>
 <apWUsc-a6k1YkuMv@pedro-suse>
 <apXXgimKxgJl57qo@firstfloor.org>
 <apXaTN6o5YaEO8FR@lucifer>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apXaTN6o5YaEO8FR@lucifer>

On Mon, Aug 31, 2026 at 08:55:37PM +0100, Lorenzo Stoakes (ARM) wrote:
> I mean what actually modifies the maple tree nodes here?
> 
> __split_vma()
>   -> vma_complete()
>     -> vma_iter_store_new()
>       -> vma_iter_store_overwrite()
> 
> Right?

The crash was on the walk, but yes the modification likely causes it.

> 
> But I see:
> 
> 	if (vmi->mas.status != ma_start &&
> 	    ((vmi->mas.index > vma->vm_start) || (vmi->mas.last < vma->vm_start)))
> 		vma_iter_invalidate(vmi);
> 
> Which calls mas_pause() which sets mas->node = NULL.
> 
> So I mean, presumably you are saying this doesn't work correctly or this
> criteria is wrong, I can't really see how else there could be a problem here,
> could you explain exactly what's up here?

I can't explain it currently, but yes something wrong with that logic
is a good theory.

I have a (somewhat garbled) processor trace log of the failure, but
it doesn't quite have enough information to untangle it completely.

The original bug also happened in a very memory constrained environment
(4GB guest), but it's somewhat hard to reproduce it in a setup
that still has enough memory to do useful debugging.

I'm currently working on the reproducer on the vanilla kernel.

So far I made some progress to get something that looks closer to the
original trace, but I need artificial sleeps at the vma allocation point
and it still didn't fully reproduce the original scenario yet. 

There was actually one crash with a different
signature, but I haven't analyzed it so far [1].

The WIP stresser that forces something that is close to the 
uprobes is here: 
https://firstfloor.org/~andi/madvise-dontfork-stress.c

> Also why is the solution to insert a whole bunch of RCU read locks everywhere so
> we can keep on accessing a node that we've already decided to free?

I may have an old school understanding of RCU, but I was always
thinking that the rcu read sections are needed for any readers with
preemption. The walker is clearly a reader.

But I guess in this particular case it's not true because
the writer lock and the invalidation is enough. It still seems a little
dubious with all the preemption cases, but at least I cannot see a clear
hole.

> 
> I mean surely the solution really ought to be simply invalidating the iterator
> right?

Yes I guess. It would certainly be simpler.


> 
> Also again, could you share the patch you've applied to the kernel you're
> actually seeing this bug in, given you haven't reproduced it even once with an
> upstream kernel?

Sure it's this patchkit on l-k that adds some new functionality to
uprobes: https://lore.kernel.org/lkml/20260831150651.1134594-1-ak@kernel.org/
(or for more information
https://lore.kernel.org/lkml/20260831150651.1134594-16-ak@kernel.org/ )

I don't think it actually changes any core VM locking or really how the uprobes
interact with the VM code, but it changes timing and makes it easier
to have some obscure DONTCOPY VMA setups. The actual VM code is not
changed.

The code that changes the core uprobes behavior is 5/19, but it can't really
be fully exercised without some of the later patches.

Also the posted version has some issues (at least Sashiko pointed out 
some real problems), but I don't believe it affects this.

-Andi


[1]


[   66.689807][  T532] BUG: unable to handle page fault for address: ffffebde00477288
[   66.691116][  T532] #PF: supervisor read access in kernel mode
[   66.692227][  T532] #PF: error_code(0x0000) - not-present page
[   66.693267][  T532] PGD 0 P4D 0 
[   66.693841][  T532] Oops: Oops: 0000 [#1] SMP KASAN NOPTI
[   66.694596][  T532] CPU: 1 UID: 0 PID: 532 Comm: madvise-dontfor Not tainted 7.2.0-1-debug+ #2 PREEMPT(full)  967bbfd33d6729a809cf8db6188ec03a118152c4
[   66.697960][  T532] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
[   66.700523][  T532] RIP: 0010:qlist_free_all+0x93/0x130
[   66.701296][  T532] Code: c2 4c 01 f2 0f 82 a3 00 00 00 48 c7 c1 00 00 00 80 48 2b 0d b7 c9 34 03 48 01 ca 48 c1 ea 0c 48 c1 e2 06 48 03 15 95 c9 34 03 <48> 8b 4a 08 48 89 ce 83 e6 01 48 83 ee 01 48 09 f1 48 21 ca 31 c9
[   66.702949][  T532] RSP: 0018:ffff8881097a7478 EFLAGS: 00010282
[   66.703474][  T532] RAX: 0000000011dca450 RBX: 0000000000000000 RCX: 0000777f80000000
[   66.704728][  T532] RDX: ffffebde00477280 RSI: ffffea000447ad40 RDI: 0000000000200000
[   66.706497][  T532] RBP: 0000000011dca450 R08: 0000000000000001 R09: ffffffff9a58ccfe
[   66.708160][  T532] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
[   66.709799][  T532] R13: ffff8881097a74b0 R14: 0000000080000000 R15: ffff888111eb5d00
[   66.711393][  T532] FS:  00007f2990b12780(0000) GS:ffff888228ea7000(0000) knlGS:0000000000000000
[   66.713158][  T532] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   66.714486][  T532] CR2: ffffebde00477288 CR3: 0000000103565005 CR4: 0000000000f70ef0
[   66.715595][  T532] PKRU: 55555554
[   66.715972][  T532] Call Trace:
[   66.716320][  T532]  <TASK>
[   66.716629][  T532]  kasan_quarantine_reduce+0x19a/0x250
[   66.717190][  T532]  __kasan_slab_alloc+0x6a/0x90
[   66.717706][  T532]  kmem_cache_alloc_noprof+0x214/0x6b0
[   66.718285][  T532]  ? vm_area_dup+0x2b/0x970
[   66.718763][  T532]  vm_area_dup+0x2b/0x970
[   66.719211][  T532]  ? msleep+0x1b/0x30
[   66.719625][  T532]  __split_vma+0x32e/0xbb0
[   66.720086][  T532]  ? __pfx___split_vma+0x10/0x10
[   66.720596][  T532]  ? __pfx_mas_prev+0x10/0x10
[   66.721095][  T532]  ? lock_is_held_type+0xfa/0x1c0
[   66.721613][  T532]  vma_modify+0x1a50/0x24e0
[   66.722087][  T532]  ? __pfx_vma_modify+0x10/0x10
[   66.722593][  T532]  ? lock_is_held_type+0xfa/0x1c0
[   66.723110][  T532]  vma_modify_flags+0x2ed/0x4e0
[   66.723594][  T532]  ? __pfx_vma_modify_flags+0x10/0x10
[   66.724144][  T532]  ? mas_prev_slot+0x328/0x1d30
[   66.724655][  T532]  mprotect_fixup+0x226/0xb90
[   66.725142][  T532]  ? __pfx_mprotect_fixup+0x10/0x10
[   66.725696][  T532]  ? mas_prev_slot+0x328/0x1d30
[   66.726195][  T532]  ? lock_is_held_type+0xfa/0x1c0
[   66.726706][  T532]  ? mas_next_slot+0xa7a/0x20a0
[   66.727200][  T532]  ? lock_sequence+0xd7/0x180
[   66.727676][  T532]  do_mprotect_pkey+0x81d/0xb40
[   66.728167][  T532]  ? __pfx_do_mprotect_pkey+0x10/0x10
[   66.728702][  T532]  ? rcu_is_watching+0x16/0xb0
[   66.729193][  T532]  ? do_syscall_64+0x203/0x6a0
[   66.729696][  T532]  ? lockdep_hardirqs_on+0x95/0x140
[   66.730226][  T532]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   66.730811][  T532]  ? do_vmi_munmap+0x159/0x2e0
[   66.731226][  T532]  ? __vm_munmap+0x1dc/0x360
[   66.731635][  T532]  ? __do_sys_mincore+0x4b6/0x6c0
[   66.732129][  T532]  __x64_sys_mprotect+0x78/0xe0
[   66.732616][  T532]  ? lockdep_hardirqs_on+0x95/0x140
[   66.733140][  T532]  ? do_syscall_64+0x83/0x6a0
[   66.733611][  T532]  do_syscall_64+0xf6/0x6a0
[   66.734068][  T532]  ? trace_hardirqs_on_prepare+0x13d/0x190
[   66.734650][  T532]  ? lockdep_hardirqs_on+0x95/0x140
[   66.735185][  T532]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   66.735786][  T532]  ? do_syscall_64+0x221/0x6a0
[   66.736264][  T532]  ? rcu_is_watching+0x16/0xb0
[   66.736746][  T532]  ? rcu_is_watching+0x16/0xb0
[   66.737233][  T532]  ? do_syscall_64+0x203/0x6a0
[   66.737721][  T532]  ? trace_hardirqs_on_prepare+0x13d/0x190
[   66.738302][  T532]  ? lockdep_hardirqs_on+0x95/0x140
[   66.738820][  T532]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   66.739924][  T532]  ? do_syscall_64+0x221/0x6a0
[   66.740457][  T532]  ? do_syscall_64+0x203/0x6a0
[   66.740934][  T532]  ? trace_hardirqs_on_prepare+0x13d/0x190
[   66.741518][  T532]  ? lockdep_hardirqs_on+0x95/0x140
[   66.742038][  T532]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   66.742638][  T532]  ? rcu_is_watching+0x16/0xb0
[   66.743115][  T532]  ? do_syscall_64+0x31/0x6a0
[   66.743582][  T532]  ? trace_hardirqs_off_finish+0x13d/0x190
[   66.744172][  T532]  ? lockdep_hardirqs_off+0xb3/0x100
[   66.744717][  T532]  ? do_syscall_64+0x64/0x6a0
[   66.745212][  T532]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   66.745834][  T532] RIP: 0033:0x7f2990c22667
[   66.746301][  T532] Code: ef e8 dd f9 ff ff 84 c0 75 b9 31 db 48 83 c4 08 48 89 d8 5b 5d 41 5c 41 5d 41 5e 41 5f c3 0f 1f 44 00 00 b8 0a 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 79 77 0d 00 f7 d8 64 89 01 48
[   66.748156][  T532] RSP: 002b:00007fffb8fba1e8 EFLAGS: 00000202 ORIG_RAX: 000000000000000a
[   66.748885][  T532] RAX: ffffffffffffffda RBX: 0000000000004000 RCX: 00007f2990c22667
[   66.749575][  T532] RDX: 0000000000000001 RSI: 0000000000004000 RDI: 00007f2990af6000
[   66.750260][  T532] RBP: 0000000000000008 R08: 00000000ffffffff R09: 0000000000000000
[   66.750942][  T532] R10: 0000000000000022 R11: 0000000000000202 R12: 00007f2990af2000
[   66.751948][  T532] R13: 0000000000020000 R14: 00007f2990af6000 R15: 0000000000000001
[   66.752777][  T532]  </TASK>
[   66.753093][  T532] Modules linked in:
[   66.753516][  T532] CR2: ffffebde00477288
[   66.753935][  T532] ---[ end trace 0000000000000000 ]---
[   66.754496][  T532] RIP: 0010:qlist_free_all+0x93/0x130
[   66.754503][  T532] Code: c2 4c 01 f2 0f 82 a3 00 00 00 48 c7 c1 00 00 00 80 48 2b 0d b7 c9 34 03 48 01 ca 48 c1 ea 0c 48 c1 e2 06 48 03 15 95 c9 34 03 <48> 8b 4a 08 48 89 ce 83 e6 01 48 83 ee 01 48 09 f1 48 21 ca 31 c9
[   66.754505][  T532] RSP: 0018:ffff8881097a7478 EFLAGS: 00010282
[   66.754508][  T532] RAX: 0000000011dca450 RBX: 0000000000000000 RCX: 0000777f80000000
[   66.754509][  T532] RDX: ffffebde00477280 RSI: ffffea000447ad40 RDI: 0000000000200000
[   66.754511][  T532] RBP: 0000000011dca450 R08: 0000000000000001 R09: ffffffff9a58ccfe
[   66.754512][  T532] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
[   66.754513][  T532] R13: ffff8881097a74b0 R14: 0000000080000000 R15: ffff888111eb5d00
[   66.754515][  T532] FS:  00007f2990b12780(0000) GS:ffff888228ea7000(0000) knlGS:0000000000000000
[   66.754517][  T532] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   66.754518][  T532] CR2: ffffebde00477288 CR3: 0000000103565005 CR4: 0000000000f70ef0
[   66.754524][  T532] PKRU: 55555554
[   66.754526][  T532] note: madvise-dontfor[532] exited with irqs disabled
