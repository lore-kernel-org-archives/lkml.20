Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908792;
	b=Rw4gtR/NpCLwfy73wf6uyQ/D10VfGPQ1pKIqQTLm7XKFf5Kl72H3++MQPsD4+JRxGHYE
	 zdZV/mhEYM5+19c8Di9ZbBFqcWCZ7q8eNsjLVUHRIvMnec+52WMVx7mdjv/b7JemWHD0J
	 D0PgC+4Rj4JOz3XR/VZMlNsESGjz/NZwDFam5Ju/bcjDM7zB7S23wrdvSahdMACAh6vOv
	 knkOa4UCCSmdLYG6bJHffOacAasN+3MnFF9rgpvG97U/d1ZE6VxN5TlBczOY5Wy9J41Vi
	 QmmHGRE423rOgHPdijYOFSy9X4ASa07TkpiEkfEFfuMIU5FXlAGViTpVk07AhuCL4hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908792;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iDwQbHlEpWaBUPvCAiLh/bEWUDIU/lF2tFc6FzFvoGU=;
	b=1oA7td6pBnhJ3fmSIswu3vQr9/SPCjlES+tDlLgzIHUiFBD6vnV1rlue1lj0RBEEhyvi
	 ldjLB6eckKndbIZQSktQiLadmRJRRzRoZcYS/IeOqMbCmNf2hJfDYBQMoP4sLnm8Fi3gD
	 K1qX/sLsgoAGXgs0JQhQoX3lQbPJAu87Tqs/aSHTqZDCGB713E6ezAAXIgWS/v/GXrIUD
	 gJpe9CvyeNfVKzLOlK41NWkAqdfdjd/LiWnJKVVbcvsFEcfsi082RQ47kgLwkFL8IWLZb
	 gpOYgYTUNEd++H+yEaBCyv7cAraCayluxhgEBAz7TeEyDgdFl62QLhY6FkwxNtXYm/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kcSsR/nS";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D954606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcSsR/nS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B0E1F000C4;
	Tue, 17 Nov 2026 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794908791;
	bh=iDwQbHlEpWaBUPvCAiLh/bEWUDIU/lF2tFc6FzFvoGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kcSsR/nScJvke0MU54aHsXdSOEoc0ZxnN39JOKfEvNqMPtKgTwCrNGMghsxBBFs/B
	 tWbFOc/sxHg8sYyL9SNL6NiVyW1HhMeqLGl9sjqIa3KupK51H4B5ANDE1Tlmu21Rcs
	 FzRUjLzHVWAOj0Cxz3Ij7u1DaUbNI7PXleM05nIW9fRpSdd3aT4jrXFm9US3TXiO9D
	 pEof8wKYyxxt49SVe4oUYPgh+BvALkcLnmLV1PZ8rqI4hjW0aZZGzRDqAMctoR2T6p
	 q9EPhSxxMc3yY9fXYT+fddFg4MCx9ET+hBFxJMNs0BbJBtlMV+SgQRTIx4Rf7RpFHH
	 y9u0et5N+mb5w==
Message-ID: <d463af46-13c3-47f7-8b26-702a8edcd140@kernel.org>
Date: Tue, 17 Nov 2026 10:46:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/migrate: drop the fault lock and wait killably for
 migration entries
To: junho.cha@xcena.com, Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261117-junhomax-fix-mm-migrate-killable-v1-1-f6e7b135a159@xcena.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261117-junhomax-fix-mm-migrate-killable-v1-1-f6e7b135a159@xcena.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 10:26, Junho Cha via B4 Relay wrote:
> From: Junho Cha <junho.cha@xcena.com>
> 
> A fault that finds a migration entry sleeps in
> softleaf_entry_wait_on_locked() until the entry goes away.  So does a
> fault on a device-private entry whose folio is locked by another
> thread, since commit b570f37a2ce4 ("mm: Fix a hmm_range_fault()
> livelock / starvation problem").  The wait is in TASK_UNINTERRUPTIBLE
> and keeps the mmap_lock or per-VMA lock held throughout.
> 
> That is fine while a migration takes microseconds.  It is not when the
> migration is slow:
> 
>  - The wait cannot be killed.  The signal_pending_state() check in the
>    wait loop never fires, because TASK_UNINTERRUPTIBLE contains neither
>    TASK_INTERRUPTIBLE nor TASK_WAKEKILL.  For example, if the
>    migrate_to_ram() handler of a device-private folio waits for a
>    device that has stalled, every other thread that faults on the page
>    sits in D state, and the only symptom is a hung task warning.
> 
>  - The fault lock is held across the wait.  This matters when the
>    migration itself runs without that lock, as for move_pages(),
>    compaction or memory offlining.  A writer that arrives in the
>    meantime, such as munmap() of another page in the same VMA, waits
>    for the migration to finish, and faults that come after the writer
>    queue behind it.  migrate_to_ram() is called with the fault lock
>    held, so for device-private folios only the first point applies.
> 
> Making the wait killable alone is not enough.  A fault that returns 0
> is retried, so a kernel-mode fault from a uaccess routine would fault
> again on the same entry, return at once because the signal is still
> pending, and spin until the migration completes.  The fault has to
> return VM_FAULT_RETRY so that fault_signal_pending() can end it.
> 
> Handle the fault lock the way __folio_lock_or_retry() does.  Pass the
> vm_fault to softleaf_entry_wait_on_locked() from do_swap_page().  On the
> first attempt of a retryable fault, drop the fault lock before sleeping
> and return VM_FAULT_RETRY, or return at once for
> FAULT_FLAG_RETRY_NOWAIT.  A FAULT_FLAG_KILLABLE fault sleeps in
> TASK_KILLABLE, and if a fatal signal ends a wait that still holds the
> lock, drop it and return VM_FAULT_RETRY.
> 
> Dropping the lock there is safe.  The wait entry is queued before the
> ptl is released, and the entry can only be removed under that ptl, so
> no wake up is missed.  Nothing after that uses the vma, and
> folio_waitqueue() points into a global hash table, not into the folio.
> 
> Callers outside the fault path (hmm, userfaultfd, huge_memory) and the
> PMD and hugetlb waits pass NULL and keep the current behaviour.
> 
> Tested by holding the migration entries for 8 seconds, with a delay
> added after the unmap step of move_pages() and in test_hmm's
> migrate_to_ram():
> 
>  - SIGKILL to a process waiting on the entry, from user mode or from a
>    write() that copies from the page, ends it within a millisecond
>    instead of after the migration.  The same holds for a thread waiting
>    on a device-private folio.
>  - munmap() of another page in the same VMA no longer waits for the
>    migration.
>  - Without a signal, the write() completes after the migration with
>    the right data, using under a millisecond of system time.
>  - hmm-tests results are unchanged, and lockdep reports nothing.
> 
> Signed-off-by: Junho Cha <junho.cha@xcena.com>
> ---

Hi,

I assume

* this was not hit in the wild but found with an LLM.
* Most of the code and patch description were written with an LLM.

Correct?

-- 
Cheers,

David
