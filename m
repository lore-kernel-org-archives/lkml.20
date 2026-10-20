Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486031;
	b=oH3+KaxXKAfjycDZLNnjfil8IjOwqQbT4YgsPDr8bqlz/zm5RAU2DS9zD8Gv4oajkPmm
	 Syd5e9kwIrjKSDVSOPG79wq0QEHW3en70WemnqcqWyH9P5CJB9bzWIxvcNpB2oXGxYmYj
	 KCY3v/Ubot3dI2sxyJ2M8c9Z0liA12FINs5jeWCTNMfPkMKXMKmZPhtyvvrtvSfPDhNim
	 cInpw9r2bd2Abe2m8y9pOkB/QVpxKaCiyOQ+ww5uir/LCjXW0e/FT5Pm1z7dXDKckRn/a
	 xc78nIHOa5+hc28GXSCgqlEQ8L6zB6z6duef/OhwXUgykh9u1yW6riRjXljfqr2UmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486031;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=o8jL9+xqK4LJj7BKge88qreAePQ3lh/N/cSVmh2Ciyc=;
	b=tvANl3sY9rX2TsiE+FQ6t08ZMgJaHQCCssyUGAxMywFI4w4lGFPEDPS7wkPwmtVcmZeN
	 6eoAdwAjFtbKXRZLJymoPlMXZRL2k4vllF8WQldvB072Z1qR4zRyQ0zUmWQ0vic3CI8iS
	 ANlzES5AhntRNVxzii6Ajfucvd3SMzlo1l4Yf2DvMV8uCx7BDh7e/oTZEi+MPtcUxNSIo
	 qA7qwUkwCfE5zk6FZJkyGZZMeZU26Al0izDMLzANQvaMGy3eLL3VApORZoKKe0TYdmh1J
	 JeWhJ9RDXIoEpIu6sJOB+7qRXog2geN1TLroK4sNjePS4w++zU0qmRAuVmAPSFNc4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aTyHgKdQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300E606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aTyHgKdQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC5B1F000C4;
	Tue, 20 Oct 2026 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486030;
	bh=o8jL9+xqK4LJj7BKge88qreAePQ3lh/N/cSVmh2Ciyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aTyHgKdQbCeZMl4qnEalSfONfzkg+pOWAJVo9pu//fpm5DvhUilKGpqE24MGZUWjz
	 e8wxDLjsEt2LRRovfsWbp6+ueCLXRemNDU6ru5LyLo/RdmMYkehj0hdY/BfezN0SIR
	 6rXorPnoRbg0Gq6FTNKawXTYNP/YCIN+XKqwFxrqJX7TBPK+xsgnC8/CNv2AEYMna+
	 IWr1p90dtow6W/Zi6KWUYe/5p/IQxNtKZ+ys4kpDRpBKPU7GTg8+cvWjOZzISVxAgz
	 9gqz1fIOsSgPv5CPQan0og26oJfnPuQtRw2OFs282EWySnp6PYyV2TdjEAQH5EC+u/
	 yMkpHFF5r+KMg==
Message-ID: <23623534-a163-4ffa-8538-b5aff7daecaf@kernel.org>
Date: Tue, 20 Oct 2026 10:47:07 +0200
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
Subject: Re: [PATCH] hugetlb: retry private VMA locking when unmapping folios
To: Daehyeon Ko <4ncienth@gmail.com>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261015170551.2656546-1-4ncienth@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261015170551.2656546-1-4ncienth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 19:05, Daehyeon Ko wrote:
> hugetlb_unmap_file_folio() takes a reference to the hugetlb_vma_lock in
> vm_private_data when its VMA trylock fails. It then drops i_mmap_rwsem and
> waits for the lock in the established order.
> 
> That fallback is only valid for VM_MAYSHARE VMAs. Since commit
> bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs"), the
> trylock can also fail for a private owner VMA. Its vm_private_data contains
> resv_map | HPAGE_RESV_OWNER, not a hugetlb_vma_lock. The fallback then
> performs a misaligned refcount operation and treats reservation-map list
> fields as an rwsem.
> 
> Private reservation maps have no stable VMA backpointer. Drop i_mmap_rwsem
> and restart the interval-tree walk when their trylock fails. Keep the
> referenced fallback for shareable VMAs.
> 
> On a system with a pre-provisioned hugepage pool, an unprivileged
> reproducer racing mprotect() with hole punching triggered the refcount
> warning followed by a general protection fault in rwsem_down_write_slowpath
> on v7.3-rc5 and 6.12.111. With this change, a v7.3-rc5 KASAN+LOCKDEP build
> completed 1,000 rounds and 64,000 hole punches without a warning, lockdep
> report, oops, or panic. The reproducer is available privately on request.
> 
> Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> ---
>  fs/hugetlbfs/inode.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 7611a8470ea265..9a676228e2070a 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -402,6 +402,17 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
>  			continue;
>  
>  		if (!hugetlb_vma_trylock_write(vma)) {
> +			/*
> +			 * The referenced fallback below is specific to the
> +			 * hugetlb_vma_lock stored by shareable VMAs.  A private
> +			 * owner VMA stores a tagged resv_map pointer here instead.
> +			 */
> +			if (!(vma->vm_flags & VM_MAYSHARE)) {
> +				i_mmap_unlock_write(mapping);
> +				cond_resched();
> +				i_mmap_lock_write(mapping);
> +				goto retry;

That looks like we can just live-lock now?

> +			}
>  			vma_lock = vma->vm_private_data;


This whole function is a mess.

I have the following AI fix in a queue-of-fixes to go through and send out.

The description is a bit mouthful, but the fix itself looks much cleaner (just skip the
write-lock for VMAs that don't need it):


Does that make sense?


commit 12a35d8ee3e638129080c2bb13c0a35c873b5257
Author: Josef Bacik <josef@toxicpanda.com>
Date:   Thu Oct 8 06:55:26 2026 +0000

    hugetlbfs: fix unmapping a folio from a private vma

    hugetlb_unmap_file_folio() unmaps a folio which is about to leave the
    page cache from every vma that maps it.  Where it can not get the lock of
    a vma with hugetlb_vma_trylock_write(), it takes vma->vm_private_data for
    a struct hugetlb_vma_lock, gets a reference to it, drops i_mmap_rwsem and
    sleeps on its rw_sema.

    Since commit bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private
    VMAs") the trylock can fail for a MAP_PRIVATE vma that owns a reservation
    map, too.  The lock of such a vma is resv_map->rw_sema, which every fault
    in the vma holds for reading, and its vm_private_data is the address of
    the resv_map with HPAGE_RESV_OWNER in bit 0.  kref_get() and down_write()
    then work on the bytes of the resv_map, one byte off.

    A private vma maps a folio of the page cache after a read fault.  Three
    threads of an unprivileged process are enough, on a hugetlb memfd: one
    reads a page through a private mapping, one writes to another page of
    that mapping, one allocates the first page with fallocate() and punches
    it out again.  ftruncate() and MADV_REMOVE do as well as the hole punch.

      refcount_t: addition on 0; use-after-free.
      WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x6a/0x90
       remove_inode_hugepages+0x49d/0x530
       hugetlbfs_fallocate+0x4bf/0x5f0
       vfs_fallocate+0x13d/0x330

    On x86-64, saturating the "reference count" stores 0xc0 into the first
    byte of resv_map->lock: the next fault in the vma spins in region_chg()
    for ever.  down_write() either takes a list pointer, shifted by one byte,
    for the owner and dies of a general protection fault, or spins with
    interrupts off on what it takes for the wait_lock, in both cases with the
    fault mutex and the inode lock held.

    Leave the lock of a vma that is not shareable alone, as it was before that
    commit.  That lock keeps faults out of the vma until MADV_DONTNEED has
    freed its pages.  It is not needed here: the caller holds the fault mutex
    of the index, so nobody can map the folio or replace it by a copy, and
    i_mmap_rwsem, held for writing, keeps the vma in the file's tree and its
    page tables in place.

    Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
    Assisted-by: LLM
    Signed-off-by: Josef Bacik <josef@toxicpanda.com>

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index d21dbcdc705ed..02cec281ceba5 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -401,6 +401,19 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
                if (!hugetlb_vma_maps_pfn(vma, v_start, pfn))
                        continue;

+               /*
+                * Only a shareable vma has a struct hugetlb_vma_lock.  The
+                * lock of a private vma lives in its resv_map and keeps
+                * faults away from MADV_DONTNEED; it is not needed here:
+                * the fault mutex holds off faults on this index, and
+                * i_mmap_rwsem everybody who zaps or frees page tables.
+                */
+               if (!__vma_shareable_lock(vma)) {
+                       unmap_hugepage_range(vma, v_start, v_end, NULL,
+                                            ZAP_FLAG_DROP_MARKER);
+                       continue;
+               }
+
                if (!hugetlb_vma_trylock_write(vma)) {
                        vma_lock = vma->vm_private_data;
                        /*

-- 
Cheers,

David
