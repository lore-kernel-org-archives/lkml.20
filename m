Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208886;
	b=XBCBKCOCw05Yoi6Umn1iG8VlQ5N8+rY1Oh8JqrFUqdA9MnLv7D78bSYTIqYDo8CYg76k
	 QH1Sbywuv7w2LdNG5tdEpeMK+uO/3W5afRLzUiP3LpOU7rl0hkli55SoNuMuYlWXSz2UP
	 TBr7YebLV8FB2462qJsMjfB1OlNYcu9wzhHFI5QBlK98y+9qewb4iE7sTXKI+y06FyGtu
	 WnG7PnVMMWsbeARc6kP8vTzvExdE91sQa9OAZA/zA8QVkZTRhko1d/2/a8/WNusGjR5l2
	 DL94ubEVY8rNJp3KmF8maybF8hqKwDyBEvWYkDDrGrUcibeqp6JDc4xTEOScOVV6lkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208886;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z8flGgLCDZXbO2V4x4lmH9yUfLyn0i0Q2d4UVX084Co=;
	b=BD7Ds38aL70Extpzt0F90MxII87Iq7ETl4A+i7eENhaOSSytOTYaw86H+5FY6AhwCNf1
	 S196Yv53kzMpqBwsZ7leuTWRTqqQTFNxO5qx92ne3wyhmnyLNlF+oUgJ0GiqbtN1jvqD+
	 dixuLU9iYf+5MGoTtjNQZ/PIvGgoKmxlh6sSazV317K/h0zbv7dcNCxvxTqZMnVaTGQGL
	 vWu6rLy0OCKk+AyoLZNiOl+gqH5TpmtotoD/GkJzHdcSyslKE1n6KmCGYHnPw3mCJoeFm
	 iTjjWuPBeMVIATA4a/RC4pURx4I69ns6qsHEurDzzX58iwsW5eflrFgUskxnx0IPQtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVkMwS0i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1BF606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVkMwS0i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E288B1F01825;
	Wed, 28 Oct 2026 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793208885;
	bh=Z8flGgLCDZXbO2V4x4lmH9yUfLyn0i0Q2d4UVX084Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FVkMwS0i9gFLnjZmbALjT4X5TtDyAro1eVMx+qWzl/LukXvRXHHz37drdsan6B6WL
	 kFDIDAt6LDChf8EXGQzoChXsJep1VYmeAkl7voyQm38178kRQAivV8zUbdhS2JBOyF
	 mtF/x+1zYCWcgu3nN5QgjFfOJG3Fy9cbg3YNhkTZKJNsl72+iQrCRQayeZmNeZPweC
	 JbUhtXKZsfxQmX5oA+bx6KFVM29fUrpIHLhs8MFnPki6y4dWav/ErWg1+vkgB/1QQt
	 3sRUo4tPlnkTwZM+jt4ei6lAiaPSEHmSRFYrPiKls85hPFylUzDvJC9t8sEa95BtcZ
	 OmWxx3ULD/jMQ==
Date: Wed, 28 Oct 2026 17:34:43 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v8 00/15] f2fs: support & optimize large
 folios for writable files
Message-ID: <auIyM-RmQE3rx1XL@google.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>

Hi Nanzhe,

I applied this series on top of the latest mainline having page private patches
where I had to clean up some conflicts. Could you please check dev-test branch?

Thanks,

On 10/28, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> This series supports large folios for most readable/writable files
> in buffered I/O paths, including normal files, block-layer encrypted
> files, and atomic files except for inline-data files, compressed files,
> and quota files.
> 
> It also extends f2fs_folio_state to coexist with f2fs page-private
> flags and to handle large folio write path and partial truncate of
> large folios correctly.  A valid large folio always carries a
> f2fs_folio_state at its folio->private in the current implementation.
> 
> Benchmark details can be found in the RFC v2 cover letter:
> https://lore.kernel.org/r/20260622160830.324455-1-zhaonanzhe@xiaomi.com
> 
> Changes in v8:
> - 01/15: add a sanity check in f2fs_folio_has_ffs(): if a large folio
>   carries non-pointer private data (PAGE_PRIVATE_NOT_POINTER), report
>   it with f2fs_bug_on() and return false instead of casting the value
>   to a struct f2fs_folio_state pointer.
> - 03/15: cache sbi before dropping read_pages_pending, so
>   f2fs_finish_read_bio() no longer uses F2FS_F_SB(folio) after a sync
>   reader has been woken up and may have released the folio.
> - 05/15: clear the dirty bits of the whole folio on success, otherwise
>   post-EOF subpages (e.g. fill_zero() with FALLOC_FL_KEEP_SIZE, or a
>   block migration beyond EOF) keep the folio redirtied forever;
>   - recheck cp_error after f2fs_balance_fs() or the trylock_op() backoff
>     dropped the folio lock, and drop the folio instead of writing on a
>     filesystem which can no longer checkpoint;
>   - reset the per-folio submitted counter for each dirty range.
> - 07/15: since the whole valid range below will be marked dirty, a large
>   folio whose subpage was invalidated by a racing collapse/insert/punch
>   hole is not usable; after folio_lock(), unlock it and return
>   VM_FAULT_NOPAGE (-EFAULT) so the faulting access is retried instead
>   of dirtying the stale subpages.
> - 08/15: keep PAGE_PRIVATE_GCING on a failed GC write which redirties
>   the folio, and clear it only when no dirty subpage is left; mark the
>   target subpage dirty in f2fs_defragment_range() and
>   f2fs_migrate_blocks(); and submit the cached bio before unlocking a
>   large folio in move_data_page() to avoid an AB-BA deadlock with
>   WB_SYNC_ALL.
> - 15/15: make redirty_blocks() large-folio aware: allocate the
>   f2fs_folio_state and mark the cluster range dirty.  This is mainly
>   for the chattr +c (FS_IOC_SETFLAGS) case, where the compression flag
>   is set on an inode that keeps using large folios until it is evicted;
>   since F2FS_IOC_COMPRESS_FILE is already rejected for large-folio
>   mappings, this hint state is only reachable through chattr +c.
>   Without this, F2FS_IOC_DECOMPRESS_FILE and
>   F2FS_IOC_RELEASE_COMPRESS_BLOCKS would find no dirty range and
>   silently skip the rewrite.
> 
> Many thanks to Chao for the detailed v7 review; several of the fixes
> above are folded in from his suggestions.
> 
> Changes in v7:
> - 01/15: realloc the f2fs_folio_state in f2fs_get_lock_data_folio() if
>   it was released while the folio was unlocked.
> - 04/15: on an atomic buffered write repeat if folio was unlocked, check the 
> COW block before reserving it again, so inc_atomic_write_cnt() is not called twice.
> - 08/15: clear PAGE_PRIVATE_GCING if large folio has no dirty sub pages
>  when f2fs_trylock_op() fails before any write is submitted in f2fs_do_write_data_page().
> 
> No other functional changes.
> 
> Changes in v6:
> - Rebased onto the f2fs dev branch (fd106ada4dee).
> - v5 12/16 ("f2fs: wait for folio writeback before ffs_detach_free")
>   is dropped, because the lkp warning reported by [1] was caused by a
>   write_pages_pending leak on the GC truncate path.
> 
> - Improve large-folio support in the f2fs_do_write_data_page() path used
>   by GC:
>   - 05/15: use __folio_start_writeback(folio, folio_test_dirty(folio))
>     in both the IPU and OPU paths, so a single-subpage GC write does not
>     clear PAGECACHE_TAG_TOWRITE while other subpages are still dirty [3].
>   - 05/15: add f2fs_ffs_put_write_pending() as the common writeback
>     completion helper; do_write_block() only ends writeback for order-0
>     folios.
>   - 08/15: move the write_pages_pending increment from move_data_page()
>     into f2fs_do_write_data_page(), take it only after
>     __folio_start_writeback(), and drop it on every error path.
>     move_data_page() no longer adjusts write_pages_pending or clears
>     gcing on error [1].
> 
> - 02/15: compute bio_offset/bio_len against the folio actually added to
>   the bio [5].
> 
> - 05/15, 06/15: fix the order-0 dirty accounting leak in the cp_error
>   path [2].
> 
> - 10/15: allocate ffs before f2fs_truncate_read_extent() [4].
> 
> - 11/15: move the existing truncated-page handling into
>   f2fs_clear_truncated_page_state() and reuse it for the subpage-aware
>   large-folio writeback path, including the -ENOENT/NULL_ADDR case [2].
> 
> Link to v5: [6]
> 
> Many thanks to Chao, Daeho and Jaegeuk for the reviews, and to the
> kernel test robot for the report.
> 
> [1] https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
> [2] https://lore.kernel.org/r/6be679d1-d8ab-41b3-9975-1f1bcd552579@kernel.org
> [3] https://lore.kernel.org/r/fc101bc7-6ece-4a30-9e19-9b32376489a8@kernel.org
> [4] https://lore.kernel.org/r/36220ef3-5b00-4aa1-ad11-60b10857a886@kernel.org
> [5] https://lore.kernel.org/r/atA8dsZ35E6wTMD6@google.com
> [6] https://lore.kernel.org/r/20261014064445.2835813-1-zhaonanzhe@xiaomi.com/
> 
> Nanzhe Zhao (15):
>   f2fs: extend folio state for large folio write path
>   f2fs: carry subpage offset and count in write IO
>   f2fs: support regular file buffered writes on large folios
>   f2fs: support atomic file large folios buffered write
>   f2fs: support large folio writeback
>   f2fs: account large folio dirty data at block granularity
>   f2fs: prepare mmap write faults for large folios
>   f2fs: make GC migration large-folio aware
>   f2fs: optimize small block size large folio read
>   f2fs: support partial uptodate large folio read
>   f2fs: handle partial truncate of large folio dirty subpages
>   f2fs: fix zeroing paths for large folios
>   f2fs: handle block cloning within the same large folio
>   f2fs: allow large folio support to writeable files
>   f2fs: make compressed files compatible with large folio
> 
>  Documentation/filesystems/f2fs.rst |   10 +
>  fs/f2fs/checkpoint.c               |   40 +-
>  fs/f2fs/compress.c                 |    7 +-
>  fs/f2fs/data.c                     | 1550 +++++++++++++++++++++++++---
>  fs/f2fs/dir.c                      |    2 +-
>  fs/f2fs/f2fs.h                     |  182 +++-
>  fs/f2fs/file.c                     |  269 +++--
>  fs/f2fs/gc.c                       |   51 +-
>  fs/f2fs/inline.c                   |    3 +-
>  fs/f2fs/inode.c                    |    4 +-
>  fs/f2fs/namei.c                    |    1 +
>  fs/f2fs/node.c                     |    2 +-
>  fs/f2fs/segment.c                  |   13 +-
>  13 files changed, 1869 insertions(+), 265 deletions(-)
> 
> -- 
> 2.43.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
