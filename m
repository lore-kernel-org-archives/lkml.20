Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8FF32ED24
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968295; cv=none; b=S+8qsPQMotz5jFVH83/+sS7oqilIcqmluMknWCCQl5dP3Xj8Mj2WxU5qqlZmfbWX7mmhEZ/TF/9V5mrlE04sqWb+BcWKaFLRK59oJR4VUpPyIPnuXIr58jUxNFvam/+FSZElwOhkv4hT6ALQoWzEoNhZ608eGgTnQTU2SFzx2hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968295; c=relaxed/simple;
	bh=ucAm/2QLfZNdrttee+pgFwfEQOBs8O/voze0AdcSsbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBbtFm9+JjjkMKKIBzWPZFdAwncUVpbddysrKvjME8AycbJDidHbOzdPG2DWtPRQKjTsrdxQCa4Ur2O5ITl4ScoMnYLRV4zXoE9f3td4rO7ijeoHmsw1xBObDVrV5PEnJIZHuZxI5Tn3VPE0omc2sF6VAYrTi0jVOkog+OEhYtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2uZjQ51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2uZjQ51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A3C1F000FF;
	Fri,  2 Oct 2026 19:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790968293;
	bh=xepjiv98niKg0eR0g6TZAWyusgKSgcyQj0ds3O6lxl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=C2uZjQ51Jdphz8xDCTe/fSF/32tpFJFx0vjUDSdoaiHb0qAbb0G2b1bfsryrQ/Pn/
	 5jXtmI4fD6jGmsStgw/UIWAxCkX52RITB/QLhfy7swkp5kOgud/qG8Ve5IWaxAud8Q
	 Ed81tCq6BrT4/7U/DbRBZ/3EWbhPvYs3jMI6wbCepIJwkDeV3y0IaYk79XGWKkLrS0
	 e4uniPe5HIIEGt3kotlBlzO5mPWV5uc8ESf0vnV2hUAEXLPNKLD15BfpaMF+kYajC4
	 fRVCHrxl3aQ7OW6OYUrdu11E1tdhOjhedYdvqHYS+OlV32z6DRR54aOGqKzljjItpt
	 cby3qki4jXyiA==
Message-ID: <7bd00f36-3f48-490e-ab4c-7ed15be931d2@kernel.org>
Date: Fri, 2 Oct 2026 21:11:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] mm: shmem: shmem_getattr(): set blksize to
 highest supported THP order
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <0f18a45baec44d193f8dbc760ef57c0430e04bdb.1789695931.git.luizcap@redhat.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <0f18a45baec44d193f8dbc760ef57c0430e04bdb.1789695931.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 03:45, Luiz Capitulino wrote:
> Today, shmem_getattr() sets stat->blksize to PMD size whenever
> shmem_huge_global_enabled() returns non-zero. While this works fine
> for the normal THP-enabled case as explained by Baolin in [1], this
> has two problems:
> 
>  1. Theoretically, when shmem is configured for within_size, this
>     could set blksize to PMD size even though the allocation may
>     be a smaller mTHP order
> 
>  2. A future commit will allow shmem THP support to be enabled
>     even when the CPU doesn't support PMD-sized pages. We should
>     not allow blksize to be set to PMD size in this case
> 
> In order to fix #1 and prepare for #2, this commit sets blksize
> to the size of the highest supported order returned by
> shmem_huge_global_enabled().
> 
>   [1] https://lore.kernel.org/linux-mm/6591a74c-7ef9-4614-9ae9-cb2fbed86ebf@linux.alibaba.com/
> 
> Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>  mm/shmem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b572c60f2af8..776dff8a848e 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1506,6 +1506,7 @@ static int shmem_getattr(struct mnt_idmap *idmap,
>  {
>  	struct inode *inode = path->dentry->d_inode;
>  	struct shmem_inode_info *info = SHMEM_I(inode);
> +	unsigned int orders;
>  
>  	/* Fast-path hint; recalc under info->lock corrects any stale read. */
>  	if (data_race(info->alloced - info->swapped != inode->i_mapping->nrpages))
> @@ -1522,8 +1523,9 @@ static int shmem_getattr(struct mnt_idmap *idmap,
>  			STATX_ATTR_NODUMP);
>  	generic_fillattr(idmap, request_mask, inode, stat);
>  
> -	if (shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0))
> -		stat->blksize = HPAGE_PMD_SIZE;
> +	orders = shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0);
> +	if (orders)
> +		stat->blksize = PAGE_SIZE << highest_order(orders);
>  
>  	if (request_mask & STATX_BTIME) {
>  		stat->result_mask |= STATX_BTIME;

Heh, looking into the history of this I stumble over

commit 89fdcd262fd40712da65e922558872a12b203332
Author: Yang Shi <yang.shi@linux.alibaba.com>
Date:   Thu Jun 7 17:06:59 2018 -0700

    mm: shmem: make stat.st_blksize return huge page size if THP is on

    Since tmpfs THP was supported in 4.8, hugetlbfs is not the only
    filesystem with huge page support anymore.  tmpfs can use huge page via
    THP when mounting by "huge=" mount option.

Which is a good read, especially regarding Hugh's comments:

"
    : Sorry, I have no enthusiasm for this patch; but do I feel strongly
    : enough to override you and everyone else to NAK it?  No, I don't feel
    : that strongly, maybe st_blksize isn't worth arguing over.
    :
    : We did look at struct stat when designing huge tmpfs, to see if there
    : were any fields that should be adjusted for it; but concluded none.
    : Yes, it would sometimes be nice to have a quickly accessible indicator
    : for when tmpfs has been mounted huge (scanning /proc/mounts for options
    : can be tiresome, agreed); but since tmpfs tries to supply huge (or not)
    : pages transparently, no difference seemed right.
"

(I agree with Hugh, also I find it odd to indicate for THP something > PAGE_SIZE)

Anyhow, that ship has sailed.

Effectively, I think "stat->blksize" is not that relevant. But indeed, today it
gives us the highest *possible* size we could see on that system.

shmem_huge_global_enabled() does not seem to depend on any runtime toggles that
could change, only on inode properties.

So your change looks good to me.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
