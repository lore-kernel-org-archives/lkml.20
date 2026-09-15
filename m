Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBF630146C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466601; cv=none; b=VoZf2KUc0evynozQxvaE8RPAQYAXjrO7MbUsT26agnRbgx5sEHnEX/IMM7IXtF8vTzqgy2txeNjgPG86i8GkQ00HkzGX+CnLEgaICHehBbm/u1kHSGKAAxsuDG41fa/7wzfVbIn664wFjMRD9k+SbFRlyQKOqgkTmdKw6DoFNQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466601; c=relaxed/simple;
	bh=kNt02/GFmWJBN+bBypc90pgrLRyBk/9+FHx8FaNp5E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUanlja/C96eYWuwVLWjo2/SKNCbJr0v/WIzHg++6QrnyPtTjJ+9Xob+k/EH/IrgeIsoZEvaHhyCMxTaAZeNt5jnRFCigwvqHZZgRzAs5nRuzfKNChCqH77Bhy97SwG5u4fVEQGH3TRdJD3ZrtPts7Ilm7UFGvryriWNorQ6M8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F21vvKls; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F21vvKls"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so3037964a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789466599; x=1790071399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54+ke4vRrY6qnnzpuHgV9MO2LfJ20YKm3b1bTQuL+qE=;
        b=F21vvKlslto+esgSQNMi2GO9E+pRCkpm3mS2xJErEGvafogH+QD7bh92xuCEK2XL16
         ASij5upJHmo7A8gv3nsE39DC59wVqCO5f6j8ps53g6fXFBOr5wH+w4S/s9E11Or5OQRR
         EMVFwIrGWn/ieHEtzGS2DU+jHxcHCFCRJM2O8NXMxdR3vTj7hUaZEhsstadH95qFhktJ
         n2MSKrQezLdcHfmFmkeeB6vl4o2gBiQgyXCNQUhWKe1FtqamTqQeac5BrG5OPT9yhCIq
         qBKx8nGaTHb85/mvjbKnrl3u4vyIpdwMRPe1zkDEIfkVlPEckBc9fDHoRcZkzdYuxhmR
         Roqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466599; x=1790071399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54+ke4vRrY6qnnzpuHgV9MO2LfJ20YKm3b1bTQuL+qE=;
        b=t/5NSDz5WKSYxlg01/iuzBoGtse0M2QU7L0wdsRz6Ra0OmrkS5j9So5wUvUTNtiKLv
         r58kSzhazUkFxBxuNT2dOjLfq1TTU6vIU8yk7JywO2fiCkG7mXJcZz3YVK7+mX7KBIHe
         HPhd+YnPyLYvGAjyugRCQ93umVoE8PULduSTMo8FL/ODvMJFxkKdqMUFMc64To8OCtrE
         q6kEloQ5PnQMOY27zvVgKn9JhFQZ4eWUbYvxpLE25U/KBt4vzfqk2OZ1CLIJhufdh8/v
         VYDMgAdY8E/3MeVId1lyx1BcrPZS+/AxN7n24ZIDatKhQh007R+oF3lkm2NzuqMyPdMI
         REFA==
X-Forwarded-Encrypted: i=1; AKwUvBx1l0C0pMPbAi9bibyGh0yHTiUI1g6Z0DyL5Vs4K552xg9liK/tztPxfXldQMgk3vajUUzHO3SE5nFSGAw=@vger.kernel.org
X-Gm-Message-State: AFuF++kp5x7Ck90bQvszs7riXMuNmUfLNrdP5rj5vwLg1iZrNCNCWW3w
	x+2hMQDN/Er2MkqFlZex6vQNYw7CJ2o5N4h/Ag6x24s/knBJokr2wvjk90o17ZhVBmM=
X-Gm-Gg: AYBFou1AtE+/MJcpQ+qtNwvT4CSbVv4IeD3PRBGWzXDCWire65a+YZVVK6KmY3Qx427
	tOFHhjiwtFLmTF/MzHdErtnJIjIi1GIMQBkDiaXbuqTBLB+7lx3Qcq18rCOkRgnNq+STRXBN1RG
	ahv2Q1sqkYDkAv0tExd4qC8N7z0Q6jsAwhCSLsW7Xa7GSY6nWodQL6Xa5Y2Cam6Ghsv4lvQaH4q
	9LjaVQ+W+cTLOl42aqWx77WRARfPS3mhaC7X6D5Spe2BGaqIL+hIHejhPbY9N2YzGfxmah+e4LB
	7ANA+nFhbGBlvJ6AX/fsdnz9A3fIq+zszZJyk2BWigxAR0+WhJiLuH9N+QQY0C9pPXj3tgNYVPy
	m6h8jQYh2CqN37ZWr0qvGfmhKySh23s6rQtZCTDIEqCSdIBj9/HadlLtedCsLkPNpVUjD7OHt7j
	9Ozanq8eS+tQCcLLBJW1nLYsLl2RpFn+ARcvazVSYLNvyqlChhD+Sy0FabPbmRa7PUXpmpkQ==
X-Received: by 2002:a17:90b:4a0f:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39debf7613bmr11610177a91.6.1789466598732;
        Tue, 15 Sep 2026 03:03:18 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm18120652eec.27.2026.09.15.03.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:03:18 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH v2 01/12] mm: xswap support for zswap
Date: Tue, 15 Sep 2026 18:03:06 +0800
Message-ID: <20260915100308.1599989-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913075014.1732524-2-hebaoquan@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 15:50:03 +0800 Baoquan He <hebaoquan@kylinos.cn> wrote:

> From: Chris Li <chrisl@kernel.org>
> 
> Introduce extendable swap device support - xswap.
> 
> An xswap device has no backing storage and no swap data section, so
> it wastes no disk space. Creation is via a sysfs interface added in a
> later patch.
> 
> Zswap writeback is gated on whether a real (non-xswap) swap device is
> active. nr_real_swapfiles counts such devices and is maintained at
> swapon/swapoff only, so the gate reflects "a device exists to write
> back to" rather than "a device currently has free slots". This keeps
> writeback working even when the real swap device is full, and avoids
> a double decrement when a full device is swapped off.
> 
> Co-developed-by: Baoquan He <hebaoquan@kylinos.cn>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> Signed-off-by: Chris Li <chrisl@kernel.org>
> ---
>  include/linux/swap.h |  2 ++
>  mm/page_io.c         | 16 ++++++++++++++++
>  mm/swap_state.c      |  7 +++++++
>  mm/swapfile.c        | 38 +++++++++++++++++++++++++++++++++++---
>  mm/zswap.c           |  7 ++++++-
>  5 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 5658a1634b85..787fe463dcbb 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -207,6 +207,7 @@ enum {
>  	SWP_STABLE_WRITES = (1 << 11),	/* no overwrite PG_writeback pages */
>  	SWP_SYNCHRONOUS_IO = (1 << 12),	/* synchronous IO is efficient */
>  	SWP_HIBERNATION = (1 << 13),	/* pinned for hibernation */
> +	SWP_XSWAP	= (1 << 14),	/* extendable swap device */
>  					/* add others here before... */
>  };
>  
> @@ -356,6 +357,7 @@ void free_folio_and_swap_cache(struct folio *folio);
>  void free_pages_and_swap_cache(struct encoded_page **, int);
>  /* linux/mm/swapfile.c */
>  extern atomic_long_t nr_swap_pages;
> +extern atomic_t nr_real_swapfiles;
>  extern long total_swap_pages;
>  extern atomic_t nr_rotate_swap;
>  
> diff --git a/mm/page_io.c b/mm/page_io.c
> index 88962571cb93..5483c943e3e3 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -248,6 +248,17 @@ int swap_writeout(struct swap_io_ctx *ctx, struct folio *folio)
>  	}
>  	rcu_read_unlock();
>  
> +	/*
> +	 * ctx->sis is set by swap_add_folio() which is called from
> +	 * __swap_writepage() below.  Since we must avoid the writepage
> +	 * path for xswap devices, use the swap_info from the folio's
> +	 * swap entry directly instead of going through ctx.
> +	 */
> +	if (unlikely(__swap_entry_to_info(folio->swap)->flags & SWP_XSWAP)) {
> +		folio_mark_dirty(folio);
> +		return AOP_WRITEPAGE_ACTIVATE;
> +	}
> +
>  	__swap_writepage(ctx, folio);
>  	return 0;
>  out_unlock:
> @@ -480,6 +491,11 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct folio *folio)
>  	if (zswap_load(folio) != -ENOENT)
>  		goto finish;
>  
> +	if (unlikely(sis->flags & SWP_XSWAP)) {
> +		folio_unlock(folio);
> +		goto finish;
> +	}
> +
>  	/* We have to read from slower devices. Increase zswap protection. */
>  	zswap_folio_swapin(folio);
>  	swap_add_folio(ctx, folio, READ);
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index b76eb3d876fd..2eedb7a3d7bb 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -830,6 +830,13 @@ struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t gfp_mask,
>  	struct blk_plug plug;
>  	swp_entry_t ra_entry;
>  
> +	/*
> +	 * The entry may have been freed by another task. Avoid swap_info_get()
> +	 * which will print error message if the race happens.
> +	 */
> +	if (si->flags & SWP_XSWAP)
> +		goto skip;
> +
>  	mask = swapin_nr_pages(offset) - 1;
>  	if (!mask)
>  		goto skip;
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 53bf01d5f7f1..193b08a54908 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -66,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
>  static DEFINE_SPINLOCK(swap_lock);
>  static unsigned int nr_swapfiles;
>  atomic_long_t nr_swap_pages;
> +atomic_t nr_real_swapfiles;
>  /*
>   * Some modules use swappable objects and may try to swap them out under
>   * memory pressure (via the shrinker). Before doing so, they may wish to
> @@ -1208,6 +1209,9 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
>  		 */
>  		lockdep_assert_held(&si->lock);
>  		si->flags &= ~SWP_WRITEOK;
> +		/* Count active devices, not merely those on the avail list. */
> +		if (!(si->flags & SWP_XSWAP))
> +			atomic_sub(1, &nr_real_swapfiles);
>  		atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
>  	} else {
>  		/*
> @@ -1265,6 +1269,8 @@ static void add_to_avail_list(struct swap_info_struct *si, bool swapon)
>  	}
>  
>  	plist_add(&si->avail_list, &swap_avail_head);
> +	if (swapon && !(si->flags & SWP_XSWAP))
> +		atomic_add(1, &nr_real_swapfiles);
>  
>  skip:
>  	spin_unlock(&swap_avail_lock);
> @@ -2959,6 +2965,19 @@ static int setup_swap_extents(struct swap_info_struct *sis,
>  	struct inode *inode = mapping->host;
>  	int ret;
>  
> +	if (sis->flags & SWP_XSWAP) {
> +		*span = 0;
> +		/*
> +		 * xswap devices have no backing block device and
> +		 * physical writeout is skipped in swap_writeout(),
> +		 * but sis->ops must still be set so that callers
> +		 * like shrink_folio_list() can safely dereference
> +		 * ops->flags.
> +		 */
> +		sis->ops = &swap_bdev_ops;
> +		return 0;
> +	}
> +
>  	ret = sio_pool_init();
>  	if (ret)
>  		return ret;
> @@ -3167,7 +3186,8 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
>  
>  	destroy_swap_extents(p, p->swap_file);
>  
> -	if (!(p->flags & SWP_SOLIDSTATE))
> +	if (!(p->flags & SWP_XSWAP) &&
> +	    !(p->flags & SWP_SOLIDSTATE))
>  		atomic_dec(&nr_rotate_swap);
>  
>  	mutex_lock(&swapon_mutex);
> @@ -3277,6 +3297,19 @@ static void swap_stop(struct seq_file *swap, void *v)
>  	mutex_unlock(&swapon_mutex);
>  }
>  
> +static const char *swap_type_str(struct swap_info_struct *si)
> +{
> +	struct file *file = si->swap_file;
> +
> +	if (si->flags & SWP_XSWAP)
> +		return "xswap\t";
> +
> +	if (S_ISBLK(file_inode(file)->i_mode))
> +		return "partition";
> +
> +	return "file\t";
> +}
> +
>  static int swap_show(struct seq_file *swap, void *v)
>  {
>  	struct swap_info_struct *si = v;
> @@ -3296,8 +3329,7 @@ static int swap_show(struct seq_file *swap, void *v)
>  	len = seq_file_path(swap, file, " \t\n\\");
>  	seq_printf(swap, "%*s%s\t%lu\t%s%lu\t%s%d\n",
>  			len < 40 ? 40 - len : 1, " ",
> -			S_ISBLK(file_inode(file)->i_mode) ?
> -				"partition" : "file\t",
> +			swap_type_str(si),
>  			bytes, bytes < 10000000 ? "\t" : "",
>  			inuse, inuse < 10000000 ? "\t" : "",
>  			si->prio);
> diff --git a/mm/zswap.c b/mm/zswap.c
> index b9948d4657d2..064970a4393f 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1000,6 +1000,11 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
>  	if (!si)
>  		return -ENOENT;
>  
> +	if (si->flags & SWP_XSWAP) {
> +		put_swap_device(si);
> +		return -EINVAL;
> +	}
> +
>  	mpol = get_task_policy(current);
>  	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
>  				       NO_INTERLEAVE_INDEX);
> @@ -1545,7 +1550,7 @@ bool zswap_store(struct folio *folio)
>  	zswap_pool_put(pool);
>  put_objcg:
>  	obj_cgroup_put(objcg);
> -	if (!ret && zswap_pool_reached_full)
> +	if (!ret && zswap_pool_reached_full && atomic_read(&nr_real_swapfiles))
>  		queue_work(shrink_wq, &zswap_shrink_work);
>  check_old:
>  	/*
> -- 
> 2.54.0
> 
> 

The SWP_XSWAP flag and nr_real_swapfiles accounting look correct. The writeback guard 
in page_io.c (both swap_writeout and swap_read_folio paths) properly short-circuits 
xswap devices, and the zswap writeback gating on nr_real_swapfiles ensures writeback 
only fires when a real swap device is active. 

No issues found.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu

