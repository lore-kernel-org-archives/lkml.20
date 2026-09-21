Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB826FDAC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958743; cv=none; b=fBJw+rSm3XSHqwyoix75jrgtJ2P+ZMEFOftaNIQs4TYO0ZMb9nsGjBA5SgD7QTiL1eKRmEDlcyXtPJBnIYbF0uX2mKJmVbCTSvX14cNkUhOKZPd0eqnbg2RbN10GD31Gow4qrPzNxMVnnHo421GiaCwJUa//RSlkN5f24CElt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958743; c=relaxed/simple;
	bh=2qfdbYQNX/N3ZfWzI315wo3jwV56btoMnFOsrOYQ0Bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t606IjP8SiKQAyvgy0pN2aWyoPVkCy2x5MrClmEY8qs6Yv8F/5i9+KrsTlflsYi0dyCGx0McZr9ZqyRV1JSZbact/SKiS1jx48o8UPDOUgxoCVNFfIL28Kh5zPXs7tpqhFt9qUoRG3NmX/FlCiMgYBA8C0kaQ7GSFBpNAOLnsL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Zp3XpuxT; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Zp3XpuxT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789958738; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Hnw8ne9q9bP5EaHXGLaBqF6A8SqedkV9dNxVUYN6TMU=;
	b=Zp3XpuxTgR4u3G2rY5dRUxnPz7v1F8Qbh753+Ci1GByKI8C98/EmFLRrhgSJ2ZPkg9knPHq2i1oWa79fC3dqG31Y7TMJcaJheL3aVs9N7GnEh26PtHuXiquK4Vd0HhjUvpdj93CJuGJml7f5mAE8yNA0CK8nBYdOJBLMeJ/Vwto=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XBHKT4s_1789958735;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBHKT4s_1789958735 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 21 Sep 2026 10:45:36 +0800
Message-ID: <fe49c311-582b-4ee2-8d17-42a758351570@linux.alibaba.com>
Date: Mon, 21 Sep 2026 10:45:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/shmem: don't release a swapin-error marker as a swap
 entry
To: David Carlier <devnexen@gmail.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 kasong@tencent.com, bhe@redhat.com, chrisl@kernel.org, baohua@kernel.org,
 nphamcs@gmail.com, shikemeng@huaweicloud.com, hughd@google.com,
 syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
References: <20260920155002.1030454-1-devnexen@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260920155002.1030454-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/20/26 11:50 PM, David Carlier wrote:
> A failed shmem swapin frees the swap slot and leaves a PTE_MARKER_POISONED
> entry in the page cache. On truncate or eviction shmem_free_swap() passes
> that marker to swap_put_entries_direct(), which warns because it is not a
> swap entry. There is nothing left to release either way.
> 
> Skip the release for non-swap entries, as every other caller already does.
> 
> Reported-by: syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=23b25ba3c6bf971f9c57
> Fixes: ac2d3268284b ("mm/swapfile.c: remove the unneeded checking")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>   mm/shmem.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b572c60f2af8..94f2c59c8cfc 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1184,6 +1184,7 @@ static long shmem_free_swap(struct address_space *mapping,
>   			    pgoff_t index, pgoff_t end, void *radswap)
>   {
>   	XA_STATE(xas, &mapping->i_pages, index);
> +	const softleaf_t swp = radix_to_swp_entry(radswap);
>   	unsigned int nr_pages = 0;
>   	pgoff_t base;
>   	void *entry;
> @@ -1200,8 +1201,9 @@ static long shmem_free_swap(struct address_space *mapping,
>   	}
>   	xas_unlock_irq(&xas);
>   
> -	if (nr_pages)
> -		swap_put_entries_direct(radix_to_swp_entry(radswap), nr_pages);
> +	/* A swapin-error marker holds no swap slot, so just drop it. */
> +	if (nr_pages && softleaf_is_swap(swp))
> +		swap_put_entries_direct(swp, nr_pages);
>   
>   	return nr_pages;
>   }

Makes sense to me.

But another issue caught my eye. Since we already call 
shmem_recalc_inode() to decrement 'info->swapped' when handling poisoned 
entries in shmem_set_folio_swapin_error(), shmem_free_swap() still 
returning 'nr_pages' for poisoned entries would cause a second call to 
shmem_recalc_inode(inode, 0, -nr_swaps_freed), thus triggerring 
WARN_ON(i_blocks) in shmem_evict_inode().

I'm not sure if you've observed this warning. IIUC, shmem_free_swap() 
should return 0 for poisoned entries.
