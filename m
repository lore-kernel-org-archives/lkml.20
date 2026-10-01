Received: from mta0.migadu.com (out-129.mta0.migadu.com [91.218.175.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC213C9EF3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869547; cv=none; b=Ualm/dbeU2eIPv1MtNuqCN/xMcsD7MuiaAgBTlRLMD0i+st4xAlckYYX99MX1Vm+g68eR2yVYiBAqugvJJxpLNvnmK9DNEkUB2DUD6KHTzhKEUl0tyq0GblEAUVdGsEnUsmFKHHGPczIfecMnC1PqFp4khSP8Q0Wzkd1SHSfFQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869547; c=relaxed/simple;
	bh=JOy7DkelCAeiC88nHfcYGEwixQThCGsgfdS2goti7zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5+K9aubmI/AQ1fQJbg0isSxfC5hdEq3NWUY+GPZGTkeahQpdGMXxESG2ZQk8hIStSZdugy0vb/loKHMLX4T84oYLIlJZxFkVz7pL160DGE0EXJfx8XqITxZKRb9joXuqcpj6N2nz+kEyyzepSLWn4oWHGPNUOwJlpmDgabPO/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YFaUIhte; arc=none smtp.client-ip=91.218.175.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YFaUIhte"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JOy7DkelCAeiC88nHfcYGEwixQThCGsgfdS2goti7zE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790869542; v=1; x=1791474342;
 b=YFaUIhte7dfArGHra6wbDTlhEK1SEX3zH160EA5Dvjq7HOgA14xtI4gQbUWwNaI+GGbSMJeb
 tIso/aVRxtUVH8c5RWWZyBNB28cG4/QP43Kux66rKYSxFhhHfmEeT5We5sUvHPnk0mW9JY5ggRY
 hRcsnlAtPqe0DKgPMTb2Ls94=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8ca44e7eeceaf043;
	Thu, 01 Oct 2026 15:45:25 +0000
X-Mizu-Trace-ID: 8ca44e7eeceaf043
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	pfalcato@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pan.deng@intel.com
Subject: Re: [PATCH v2] mm/vma: don't remove VMA from rmap if pgoff unchanged
Date: Thu,  1 Oct 2026 23:45:11 +0800
Message-ID: <20261001154511.23931-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
References: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Sep 30, 2026 at 06:53:36PM +0100, Lorenzo Stoakes (ARM) wrote:
>When updating a VMA, vma_prepare() unconditionally removes it from its rmap
>interval trees under the rmap lock, and vma_complete() reinserts it before
>releasing the lock.
>
>This is wholly unnecessary if its page offset (file rmap) or anonymous page
>offset (anon rmap) is unchanged.
>
>So, track whether they will change in the newly introduced
>vp->file_pgoff_unchanged and vp->anon_pgoff_unchanged fields, and use them
>to determine whether to remove the VMA or not.
>
>The rmap lock keeps things safe as no rmap walks can concurrently occur
>during the operation.
>
>Additionally, some architectures (arm, parisc, nios2, csky) have dcache
>flush rmap walkers which take only flush_dcache_mmap_lock(), which is
>likewise held across the operation.
>
>If the VMA remains in the tree, it's necessary to keep the augmented
>rb_subtree_last field updated to reflect its changed range.
>
>Provide mapping_rmap_tree_[pre, post]_update() and
>anon_rmap_tree_[pre, post]_update_vma() (replacing the existing logic in
>the anonymous case) to handle both the changed and unchanged cases.
>
>For the anon rmap case, with CONFIG_DEBUG_VM_RB set, avc->cached_vma_last
>is also updated when propagating in place.
>
>When performing a VMA shrink or a split where the VMA is the lower one, the
>page offset cannot change, so set the flags unconditionally in these cases.
>
>When merging VMAs the page offset is unchanged only in some cases, so
>update init_multi_vma_prep() to set the flags only if the page offsets
>remain the same.
>
>Finally, while we're here, also update expand_upwards() similarly.
>
>These changes ultimately result in less rmap lock contention.
>
>Pan Deng reported results using the UnixBench/excel benchmark on a 2-socket
>192 core, 384 thread x86-64 system for v7.3-rc4 with/without the patch
>applied:
>
>Execl Throughput, index score:
>
>                    avg    %stdev      min        max
>  v7.3-rc4        3511.5     0.44%    3494.5    3543.4
>  + patch         4069.0     0.48%    4047.4    4109.5 (+15.9%)
>
>Average wait on file rmap lock in ms, 5 runs per kernel:
>
>               avg      %stdev     min       max
>  v7.3-rc4    9.470     2.91%     9.070     9.820
>  + patch     8.420     3.34%     8.100     8.770 (-11.1%)
>
>Profiling data obtained during the operation highlighted the file rmap lock
>as the primary source of contention.
>
>Suggested-by: Pan Deng <pan.deng@intel.com>
>Reviewed-by: Rik van Riel <riel@surriel.com>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

Wow, pretty cool stuff. That's a nice speedup!

[...]
>+static void anon_rmap_tree_update_inplace(struct anon_vma_chain *avc)
>+{
>+#ifdef CONFIG_DEBUG_VM_RB
>+	avc->cached_vma_last = avc_last_pgoff(avc);
>+#endif
>+	/* Propagate all the way up the tree. */

Nit: propagate() can stop early when rb_subtree_last is unchanged ...

Maybe:

/* Update the subtree maximum and propagate any changes up the tree. */

>+	__anon_rmap_tree_augment.propagate(&avc->rb, NULL);
>+}
>+
[...]

Acked-by: Lance Yang <lance.yang@linux.dev>

Hammered it with VMA churn (split/merge/mremap/madvise/fork) + concurrent
rmap walks + hwpoison injection. Nothing complained :D

Tested-by: Lance Yang <lance.yang@linux.dev>

Cheers, Lance
