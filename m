Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783757;
	b=z9Idfvp4VpRAKNaMDjZR03HBPoGBfGFoluT/e+u2HKb2WK9hC1e/v5/O59DfPhGlw8Xc
	 AuTHsAo99f/vSxZnjBnPrEfFT52N5KQf3tEBMPlc9jBQRedgkbxTMIq6uxUjMVZi2e5ar
	 OzNdxmK0EngDkuc6AENSOZoKYwyuNSgt6/nGQ0nOR1xJV7Z25/DNtICpL4O90Ml+sEaEL
	 6jE/iAdZ5kdn7kcmVew2NUgdv47Q+ljItNlSRkw5BhzrybsEs9qzRXVRaJ0ZwCo/W7lyP
	 tQV7XTxrJbh6qhGQCNWKrBhFHUexYXjBVa38u48hfNpHijD2Ia63k7eg2JDd1VJJlRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783757;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BKZLVviTPAasAjwZ45EGIXC3/piLCHzV8MWKFs7dwkw=;
	b=2O90I1UobaeC6no05YZWgupi/OIPg7AvMHjb7X1m1P4A7UINpI0//jC3u84NLU8M0faY
	 eVd4TuD4Mk6jF02uhsJ3J7l2ECH+d5FJ6Ku9Py7F01aTaEZKl2ULZGqJ/vHDJyFxcGUX/
	 NFzeKCdSEqH6EMpMPA5ZXMWy+OAdWBtJL5zXRZO9xitnlfoHJaxSn47gA5QvaGsCh5qvx
	 zin5ZsEvTfg84v7IXCb1dQ8SGqx1vj59/6ZA9t4V4c26mbsxO9fdFkrT01Cw19geB2q1z
	 H3QxjNz7Ve5jyresFjkoLhYsjDN6yNjnlsEC8l2gbQlIoG6zOuufxBdKA2q7xNf8rGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bp4qHMkT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E3606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bp4qHMkT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B30D1F000C4;
	Sun, 15 Nov 2026 23:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794783756;
	bh=BKZLVviTPAasAjwZ45EGIXC3/piLCHzV8MWKFs7dwkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bp4qHMkTiNj7pmttT1qqyHNc4XUALCOQme1pxy97DELSmauGpY8OHEOEOXwe88oxd
	 2p49Pmf6HAbXoToz2UD4hiIrKvPimcaS7e7mMURp6QJ0acdfa52nujWu0QZB86A5ht
	 fxrPXsMOS5TspEmmeByCuQVnC9SSeJYkYGjJQ5OyaC1zDCbtT+RtBqBMgVAgtuX3/e
	 1nwTuclZU704ljAniyO/APpKW2eDKz3kWYYaB/Q75CyC4ADuKN6kAig+oRebPTRffZ
	 XW/89g0GkODfl72N7cSO+iHlHcaZ78ETJs/4tqG3nUqpA8yL4mmZ7aMCj2LDGMNaU2
	 +OL3OKt1fBoOA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: zippermonkey@icloud.com
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	bruzzhang@tencent.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com
Subject: [PATCH v6 0/5] mm: batch TLB flushing for dirty folios in vmscan
Date: Mon, 16 Nov 2026 07:02:31 +0800
Message-Id: <20261115230231.21194-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
References: <20261031-batch-tlb-flush-v6-0-190539839eec@tencent.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Oct 31, 2026 at 6:35 PM Zhang Peng <zippermonkey@icloud.com> wrote:
>
> This series introduces batch TLB flushing optimization for dirty folios
> during memory reclaim, aiming to reduce IPI overhead on multi-core systems.
>
> Background
> ----------
> Reclaim calls try_to_unmap_flush_dirty() before writing out each dirty
> folio. When writable TLB entries are pending, this triggers a flush.
> On systems that use IPIs for TLB shootdowns, frequent flushes can add
> significant overhead.
>
> Approach
> --------
> Collect dirty folios into a folio_batch, releasing their locks while
> collecting the batch so swap faults can progress. Before writeout, try
> locking each folio again and recheck writeback, mappings and DMA pins.
> Keep eligible folios locked, flush pending writable TLB entries once,
> then page them out. Process a final partial batch at the end of the scan.
>
> Changes
> -------
> Patch 1: Extract the folio activation block at activate_locked into
>          folio_activate_locked().
> Patch 2: Extract the folio-freeing path (buffer release, lazyfree,
>          __remove_mapping, folio_batch drain) into folio_try_reclaim_free().
>          Group retained folios, deferred frees and the reclaimed count
>          in reclaim_folio_state, local to each shrink_folio_list() call.
> Patch 3: Extract the pageout() dispatch state machine into folio_try_pageout().
> Patch 4: Extract the TTU setup and try_to_unmap() block into folio_try_unmap().
> Patch 5: Implement batch TLB flushing logic. Dirty folios are accumulated in
>          batches and a single TLB flush is performed for each batch before
>          calling pageout.
>
> Testing
> -------
> The benchmark script uses stress-ng to compare TLB shootdown behavior before and
> after this patch. It constrains a stress-ng workload via memcg to force reclaim
> through shrink_folio_list(), reporting TLB shootdowns and IPIs.
>
> Core benchmark command: stress-ng --vm 16 --vm-bytes 2G --vm-keep --timeout 60
>
> ==========================================================================
>                  batch_dirty_tlb_flush Benchmark Results
> ==========================================================================
>   Kernel: 7.0.0-rc1+   CPUs: 16
>   MemTotal: 31834M   SwapTotal: 8191M
>   memcg limit: 512M   alloc: 2G   workers: 16   duration: 60s
> --------------------------------------------------------------------------
> Metric                 Before        After             Delta (abs / %)
> --------------------------------------------------------------------------
> bogo ops/s             28238.63      35833.97          +7595.34 (+26.9%)
> TLB shootdowns         55428953      17621697          -37807256 (-68.2%)
> Function call IPIs     34073695      14498768          -19574927 (-57.4%)
> pgscan_anon (pages)    52856224      60252894          7396670 (+14.0%)
> pgsteal_anon (pages)   29004962      34054753          5049791 (+17.4%)
> --------------------------------------------------------------------------
>
> Suggested-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Zhang Peng <bruzzhang@tencent.com>
> ---

Hi Peng,

Just a quick update: this patch is still on my radar. I ran a
quick perf test while building the kernel. Without your patch,
try_to_unmap_flush_dirty() accounted for 1.75% of CPU cycles.

I guess there could be workloads where try_to_unmap_flush_dirty()
accounts for an even larger share of CPU cycles.

# Children      Self  Command  Shared Object      Symbol                      
# ........  ........  .......  .................  ............................
#

     1.75%     0.01%  cc1              [kernel.kallsyms]  [.] try_to_unmap_flush_dirty
            |          
             --1.74%--try_to_unmap_flush_dirty
                       try_to_unmap_flush (inlined)
                       |          
                        --1.73%--arch_tlbbatch_flush
                                  |          
                                   --1.70%--flush_tlb_multi (inlined)
                                             __flush_tlb_multi (inlined)
                                             |          
                                              --1.69%--native_flush_tlb_multi
                                                        |          
                                                         --1.68%--on_each_cpu_cond_mask
                                                                   |          
                                                                    --1.62%--smp_call_function_many_cond
                                                                              |          
                                                                               --1.23%--csd_lock_wait (inlined)


With your patch, the CPU overhead drops by roughly 7x:


# Children      Self  Command  Shared Object      Symbol                      
# ........  ........  .......  .................  ............................
#
     0.25%     0.00%  cc1      [kernel.kallsyms]  [.] try_to_unmap_flush_dirty
            |          
             --0.24%--try_to_unmap_flush_dirty
                       try_to_unmap_flush (inlined)
                       |          
                        --0.24%--arch_tlbbatch_flush
                                  |          
                                   --0.24%--flush_tlb_multi (inlined)
                                             __flush_tlb_multi (inlined)
                                             |          
                                              --0.24%--native_flush_tlb_multi
                                                        |          
                                                         --0.23%--on_each_cpu_cond_mask
                                                                   |          
                                                                    --0.21%--smp_call_function_many_cond
                                                                              |          
                                                                               --0.14%--csd_lock_wait (inlined)

     0.00%     0.00%  fixdep   [kernel.kallsyms]  [.] try_to_unmap_flush_dirty


Overall, I think this is a good approach. I'll be traveling soon
and will return to this patchset for more testing and a thorough
review in about two and a half weeks.

Thanks
Barry

