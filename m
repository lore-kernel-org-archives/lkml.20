Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2638DC5A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949949; cv=none; b=aQ+9bZDdbO1P4AmITyHEenE9g3m4ngXnxyshi49TBzZdi+pjYPun19AMEG2mqBG4kgFcAHxsexaoKaLgRInu7ijfx606QylHkIeg/OC6j8uWtp38vQ+fDTAi4qStBKgCBzHWBj94jggjIhBhnL9aT7gpY/7Flo5NKKmKMhWdeUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949949; c=relaxed/simple;
	bh=fI7UH0cRznYrCEXOidY+YiApbhPtznwcxrH++8CY+Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXOpPlGB5J35/3gBlDLposkWY+SXgeGqs45Ru2zedN1pXTeQ5//iA3RMQs/JuNhY7lgKJk54ylnC6zbgYrxthNAgBDavGT6wKQalqj1n4lLqLqh/CskwSPR9IyAe6HY6X8bTx8jkASksExUMP454HLaHxmrKoejbDksJHQ46T8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzL9+gmd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzL9+gmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9821F000FF;
	Fri,  2 Oct 2026 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790949947;
	bh=+FshdbFcRS26J+ImTe89KXGx/RtDW93OyZ3S0WO3Vcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BzL9+gmd9N6h8eSey50fAPxWVLPFEb/13hKgPmyMG2b2iMYVub1rGNlA8/cePHWyN
	 oVL5TuXPNTZVMBgtPqejcdFfVtJWAg3LZGUxu9Y/VNwzFFy/Tmk4szJNhz2dUFCQci
	 wYzuF3dOSVwmj83cuo3WaC/+hGVbOAY0qeeTw4jyXUiAw0eqYcZ9rGNPCOCKa15l57
	 ikKCQJu5TBOoArLuRT55AtzXqSgf/JWB6BScEEVMgvpoPU0eHWPl60Jh56gKngGlWI
	 hRx6x/swcOXYDU93xGjyOZ0N6922EFp+jQ+hQvQAvXRCdxH2jWv4glrrFwbHhGa2iS
	 Lx4jJtPz48rcw==
Date: Fri, 2 Oct 2026 15:05:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	riel@surriel.com, harry@kernel.org, jannh@google.com, pfalcato@suse.de, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, pan.deng@intel.com
Subject: Re: [PATCH v2] mm/vma: don't remove VMA from rmap if pgoff unchanged
Message-ID: <ar-53boTrPQijDUt@gremlin>
References: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
 <20261001154511.23931-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001154511.23931-1-lance.yang@linux.dev>

On Thu, Oct 01, 2026 at 11:45:11PM +0800, Lance Yang wrote:
>
> On Wed, Sep 30, 2026 at 06:53:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> >When updating a VMA, vma_prepare() unconditionally removes it from its rmap
> >interval trees under the rmap lock, and vma_complete() reinserts it before
> >releasing the lock.
> >
> >This is wholly unnecessary if its page offset (file rmap) or anonymous page
> >offset (anon rmap) is unchanged.
> >
> >So, track whether they will change in the newly introduced
> >vp->file_pgoff_unchanged and vp->anon_pgoff_unchanged fields, and use them
> >to determine whether to remove the VMA or not.
> >
> >The rmap lock keeps things safe as no rmap walks can concurrently occur
> >during the operation.
> >
> >Additionally, some architectures (arm, parisc, nios2, csky) have dcache
> >flush rmap walkers which take only flush_dcache_mmap_lock(), which is
> >likewise held across the operation.
> >
> >If the VMA remains in the tree, it's necessary to keep the augmented
> >rb_subtree_last field updated to reflect its changed range.
> >
> >Provide mapping_rmap_tree_[pre, post]_update() and
> >anon_rmap_tree_[pre, post]_update_vma() (replacing the existing logic in
> >the anonymous case) to handle both the changed and unchanged cases.
> >
> >For the anon rmap case, with CONFIG_DEBUG_VM_RB set, avc->cached_vma_last
> >is also updated when propagating in place.
> >
> >When performing a VMA shrink or a split where the VMA is the lower one, the
> >page offset cannot change, so set the flags unconditionally in these cases.
> >
> >When merging VMAs the page offset is unchanged only in some cases, so
> >update init_multi_vma_prep() to set the flags only if the page offsets
> >remain the same.
> >
> >Finally, while we're here, also update expand_upwards() similarly.
> >
> >These changes ultimately result in less rmap lock contention.
> >
> >Pan Deng reported results using the UnixBench/excel benchmark on a 2-socket
> >192 core, 384 thread x86-64 system for v7.3-rc4 with/without the patch
> >applied:
> >
> >Execl Throughput, index score:
> >
> >                    avg    %stdev      min        max
> >  v7.3-rc4        3511.5     0.44%    3494.5    3543.4
> >  + patch         4069.0     0.48%    4047.4    4109.5 (+15.9%)
> >
> >Average wait on file rmap lock in ms, 5 runs per kernel:
> >
> >               avg      %stdev     min       max
> >  v7.3-rc4    9.470     2.91%     9.070     9.820
> >  + patch     8.420     3.34%     8.100     8.770 (-11.1%)
> >
> >Profiling data obtained during the operation highlighted the file rmap lock
> >as the primary source of contention.
> >
> >Suggested-by: Pan Deng <pan.deng@intel.com>
> >Reviewed-by: Rik van Riel <riel@surriel.com>
> >Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >---
>
> Wow, pretty cool stuff. That's a nice speedup!
>
> [...]
> >+static void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc)
> >+{
> >+#ifdef CONFIG_DEBUG_VM_RB
> >+	avc->cached_vma_last = avc_last_pgoff(avc);
> >+#endif
> >+	/* Propagate all the way up the tree. */
>
> Nit: propagate() can stop early when rb_subtree_last is unchanged ...
>
> Maybe:
>
> /* Update the subtree maximum and propagate any changes up the tree. */

I think in this case it's ok to be a bit blurry about it :P it deciding not to
unnecessary work is fine but I don't want to put too much in there.

The point is as a simple sign or pointer to help somebody wondering wtf that's
for even if it's not quite the full story!

Hopefully that's ok? :)

>
> >+	__anon_rmap_tree_augment.propagate(&avc->rb, NULL);
> >+}
> >+
> [...]
>
> Acked-by: Lance Yang <lance.yang@linux.dev>

Thanks :)

>
> Hammered it with VMA churn (split/merge/mremap/madvise/fork) + concurrent
> rmap walks + hwpoison injection. Nothing complained :D
>
> Tested-by: Lance Yang <lance.yang@linux.dev>

Thanks, very much appreciated! :)

>
> Cheers, Lance

--
Cheers, Lorenzo
