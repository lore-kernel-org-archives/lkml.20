Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013567;
	b=KHYn/9UDsMqUjXiMTBCZ6af0uildl1bN2g1uBPmbdngHO/TPfJs4ZXQydGMFoSjc/JNs
	 WpESwk3JGsBzjuOXj7IQzSaJin+Re3uXv4TqqWxqxSTHsPmNHeRIxxukAawm9HjKSBZ3/
	 ehaBOGWqRObg9AijpfD5+84knCPhQ8ZeadO5F6WbHA4kgekfPO57c8H3FhrjDVqs+a3JB
	 aPAmHEtJnR2DGKwwJhFT8C523P+AtLZpyAXXvI73ORZ96VA4ZK8TUZhzbDpCOo8iILxgC
	 0Vw8eR6rTmkfpRubAzHClc1ztsPDVDrRbiJ4yxkswV9HNLeXqRs9djacYE5V67+/VoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013567;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ym2rUG4N9q5Vuz2Zf+g/cQPodhMY2XS2XpRVAbz6x2o=;
	b=p4AkynAD6PnRQBleGmwMRGi4k9QhLxdI46VmDAc2OsJeJ6D1FONfABtYhqXWff/yy6Zl
	 hE8Dn1mVKs1vxIUZalpok1mLcHHTQ4gkAv4Az5gLgw0ic8GdmoBgJ6uIoRWdMndsrZCF8
	 46iscbA8MJDgd6gkItJXIg2ASENd1mfpbk7xU50hkYxNNDpmfbU94DCJdIpEkyD5u/1wK
	 PzIryl8I5x2GN0wH54G5WUZFH6CzwXb3/fHbTiv8HilbTO/m9P6NSB5oBfNoMOCECKJA2
	 ULBeqP/7sIrzAYEDw1Qz+/3kpxBLap/VgLvEJMGe+q2WCYQqVLCkSnn72CE/s1NcZTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Naie0bLo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99781606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Naie0bLo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6723F1F01453;
	Mon, 26 Oct 2026 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793013567;
	bh=ym2rUG4N9q5Vuz2Zf+g/cQPodhMY2XS2XpRVAbz6x2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Naie0bLom6KB1rvZiawwhNtlk55RBj7K9WkrJ62mpDzmd9p3ZjTeOhiy9/BYmyqqo
	 SnNRmD9w2Kz+0bSLQRlg8Tui85D5ZH0652mrSWRzXhTB5K+jIu9ma16QMmKAtXShM8
	 DPHVOy6h8rmnPLxA+itKXfRJjJHDY/UsAnutAKmXMCh/pi+/jNoUCmRv2nSkUKchq5
	 iXCcTfsHnUyFmxEe5kxR3+PmC4oYX1reUzFTklfn/oI4jh476Y8y6Z0tz31GJGBHpW
	 nDNDalO8lQY5sWzN7TmhP8cMk8olsxCglZgxn5aDh4gDUCv7xAUOoqxZ9Y1YxDVIeV
	 uaJorTDd45ugg==
Message-ID: <c021e641-f415-48bc-badd-d340d70dd850@kernel.org>
Date: Mon, 26 Oct 2026 11:59:46 +0100
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
Subject: Re: [PATCH] mm/migrate: move NR_FILE_THPS on cross-node migration
To: Ridong Chen <ridong.chen@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261025110209.4105994-1-ridong.chen@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261025110209.4105994-1-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/25/26 12:02, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> When a page cache folio is migrated to another node,
> __folio_migrate_mapping() moves the per-node and per-memcg counters
> that are keyed off the folio's node: NR_FILE_PAGES, NR_SHMEM,
> NR_SHMEM_THPS, NR_SWAPCACHE and NR_FILE_DIRTY.  NR_FILE_THPS is not
> moved, although __filemap_add_folio() charges it to the source node and
> filemap_unaccount_folio() takes it off whatever node the folio lives on
> when it is removed.
> 
> Commit 0b52c420350e ("mm: fix shmem THP counters on migration") added
> the NR_SHMEM_THPS case but not its file-backed counterpart.  Now that
> ext4, xfs, btrfs and erofs can all have PMD-sized page cache folios,
> migrating them via NUMA balancing, mbind(), migratepages, demotion or
> memory offlining leaks FileHugePages on the source node and underflows
> it on the destination, in both /sys/devices/system/node/nodeN/meminfo
> and memory.numa_stat.  The global value is unaffected, which is why this
> went unnoticed.
> 
> Reproducer, on a 2-node QEMU guest with THP set to "always":
> 
>   1. read a 256M ext4 file through a MADV_HUGEPAGE mapping while bound
>      to node 0, so its page cache is 128 PMD-sized folios on node 0;
>   2. move the mapping to node 1 with mbind(MPOL_MF_MOVE);
>   3. unmap the file and drop its page cache.
> 
> nr_file_hugepages in /sys/devices/system/node/nodeN/vmstat after each
> step (in units of PMD-sized folios):
> 
>                     without this patch     with this patch
>                      node0     node1       node0     node1
>   1. cached           128         0         128         0
>   2. migrated         128         0           0       128
>   3. dropped          128         0 (*)       0         0
> 
>   (*) the counter has underflowed to -128; negative values read as 0.
> 
> Without the patch the 128 folios stay accounted to node 0 forever, and
> every further round adds another 128.  The same happens to the per-memcg
> per-node counter: after step 3, memory.stat of the cgroup shows
> "file_thp 0", while memory.numa_stat still shows
> "file_thp N0=268435456 N1=0".  With the patch both are 0.
> 
> Move NR_FILE_THPS together with NR_FILE_PAGES, using the same condition
> filemap_unaccount_folio() uses to take it off, so that THPs in the swap
> cache are left alone.
> 
> Fixes: d68eccad3706 ("mm/filemap: Allow large folios to be added to the page cache")
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
> Note: prepared with help from an LLM-based assistant (Kiro, claude-opus-5.5).
> 
>  mm/migrate.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 7bdcdb57652f..d55f576a2579 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -700,6 +700,10 @@ static int __folio_migrate_mapping(struct address_space *mapping,
>  				mod_lruvec_state(old_lruvec, NR_SHMEM_THPS, -nr);
>  				mod_lruvec_state(new_lruvec, NR_SHMEM_THPS, nr);
>  			}
> +		} else if (!folio_test_swapbacked(folio) &&
> +			   folio_test_pmd_mappable(folio)) {
> +			mod_lruvec_state(old_lruvec, NR_FILE_THPS, -nr);
> +			mod_lruvec_state(new_lruvec, NR_FILE_THPS, nr);
>  		}

Looking at filemap_unaccount_folio(), I was (once again) surprise about the
different handling.

Key is that we might be migration aonymous folios in the swapcache.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>


-- 
Cheers,

David
