Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984B25B09D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128844; cv=none; b=C96tEVsdNPdCXegb/71Hk2YcnYht3fstp1gbzs6oTBdvdDEobcYjfewTple+4vjbl5eFJ+MBAmoNz7UATCzAaJlzYWtTMTLIABbElNguiLsbwuq8zRbq3prSn3zab0IPRxd1y9bH5eLqEa8Gp5ABxeHJUDneLrgiMZdQtKfT56A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128844; c=relaxed/simple;
	bh=70T2B2n+xVdM168VjtN1sJ/JyWMZZkut9BxQbalkGcM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lSgDW+V4od0IeNvgjgliaYSqzu22wQkYdZmEBmdsGc0/Cabm3/gVRM3v4xJbx5Z3LsU9R08vK8BgzfWI6LPZMSKccfBe3gvlfgw7NiQRuUNwVIy+HezLH7PRq8UldnPQ0LstpQOw1fdCoxHcLVOsWqqP5qW73HvCfbUHRhLakXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T0gr4/Nz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T0gr4/Nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521371F000FF;
	Wed, 23 Sep 2026 02:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790128842;
	bh=xgnbZsTT2zcayHjjrB3oBDdwR1L3daWcHEyuUmxEqnk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=T0gr4/NzgHZOuAxvv+LRhMyimhsIk6HOCvaWDuDBnT046lrvNapYf632JUmo/2saz
	 2zo6NKareBqVAc4QotDpYKkXYKQLutCSvDkYJnyM/N1I++IwSaLzM3Hts5WGKl8hj7
	 VxbUnSPdS1dUNkiIfiHHU4vbveXIDe9quUmagP8U=
Date: Tue, 22 Sep 2026 19:00:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: <david@kernel.org>, <muchun.song@linux.dev>, <osalvador@suse.de>,
 <aiqi.i7@bytedance.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>
Subject: Re: [PATCH v2] mm/hugetlb: fix overbroad MMU notifiers for unshared
 PMDs
Message-Id: <20260922190041.d5d983ba6fb1475e40568eea@linux-foundation.org>
In-Reply-To: <20260922090749.24905-1-lizhe.67@bytedance.com>
References: <20260922090749.24905-1-lizhe.67@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 17:07:49 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
> PMD sharing is possible. That is only needed when huge_pmd_unshare()
> actually detaches a shared PMD page table, because clearing the PUD
> invalidates the whole PUD-sized virtual address range.
> 
> For hugetlbfs hole punch, and similarly for other hugetlb unmap paths,
> a shared mapping can pass the "PMD sharing is possible" range test in
> adjust_range_if_pmd_sharing_possible() even when the hugetlbfs file has
> never actually had any shared PMD page tables. KVM then receives a 1G
> invalidation for a 2M operation and zaps unrelated secondary mappings,
> so the guest has to fault them back in.
> 
> Avoid this by remembering, per hugetlbfs inode, whether PMD sharing was
> ever established for the file. Set the flag when huge_pmd_share()
> successfully populates a shared PMD table. For the hugetlb unmap paths,
> skip the conservative PUD-sized notifier expansion while the file has
> never seen PMD sharing.
> 
> The state is intentionally sticky and file-wide. Once PMD sharing has
> ever happened for the file, the unmap paths keep the existing
> conservative expansion. This avoids the no-sharing case without adding a
> page-table walk to every unmap.

Oh.  It's not feasible to figure out when PMD sharing has ended and go
back to never-seen-sharing state?

> On a Redis-in-VM workload that punches cold 2M hugetlb pages, this patch
> improves P99 QPS stability while punching pages, reducing the QPS
> degradation ratio from 7.09% to 1.45%.

How realistic is this test?  IOW, how much benefit can people expect to
see in real-world usage?


> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -921,6 +921,9 @@ static struct inode *hugetlbfs_get_inode(struct super_block *sb,
>  		simple_inode_init_ts(inode);
>  		info->resv_map = resv_map;
>  		info->seals = F_SEAL_SEAL;
> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
> +		info->pmd_sharing_seen = false;
> +#endif

This could use a slightly modified hugetlbfs_set_pmd_sharing_seen() and
remove the ifdefs.

	hugetlbfs_set_pmd_sharing_seen(inode, false);

Not very important.
