Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B535AC3B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969046; cv=none; b=NsIyoJyrN9f4MWY9rqBemYP3HYNJi5F/jbFZy1ufEDNwF4xFqFjDW4PXSp838FPR+XON6R/28qQJ7dwYkbbCvcBDwcSjS4t5D0LIXqt76lF727bD+aQ3bFzbqgJqFZHYnJyH8dB3TEhI9W5Cron0RmWDsfM85mS1txbd5xrD93U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969046; c=relaxed/simple;
	bh=auZJr2SkeRn8HhZlmY+Gcgh7DZ9Dy87FyOPOIlDak4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SryfX8cnPxx0NXDaDEOWjKlR47C28Av9Nft4uicfzO4Gj+3nP2bonIuQVWC8tYvsBJABACmhyPywwNR7vbJgGRfiVxAhpc5gZkA5n1iyhMFXZxMj5GhxXv29H1qk8WmnX+wZ84Jjs11+8m1cM7mBu9klHK+AG4j1xzzeWEu0hk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGSX/Kbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGSX/Kbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339B21F000FF;
	Fri,  2 Oct 2026 19:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969044;
	bh=o3DcXBfUguoi60aMXCNeicGNJ5nj03dbbSlS/dsM2Sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BGSX/Kbts2HyomUYIll1ZSW1Dc6xBceYErF3oCIvBLGsnn+9W/iL8dUWzD10Xxshv
	 ZN83CvovSLCevLrxWllAASgTHRUTKqmEDI8r3B61oraf+GBHIM9rlNJra3/KUEcZwc
	 Gj3mYj5JVSkng+Z1vgJR2AZoiHbPmGwRvgg3WWugxxYNsWyLXNycxtqZyemtlKslJv
	 Xr3zyVh84R34zkPGPo3zG7qHoDMJZ6WRceBLfPeQHeWmJJ2QYxjRNGKEp5Z65cWpBM
	 UoaqMSQstAgxR6XPvPEi1TRTfgUaDiaxDCVp7Kq3iHcgWMIx1HNSyd6TRyX8eGGm+w
	 vWH/q2umXu0wQ==
Message-ID: <b63f546b-ee92-46c3-85bd-bc64dbaae367@kernel.org>
Date: Fri, 2 Oct 2026 21:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/14] mm: shmem: allow THP support determination at
 folio allocation time
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
 <f74ada750d1910f8ea7e55955eb0c330747b93d4.1789695931.git.luizcap@redhat.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <f74ada750d1910f8ea7e55955eb0c330747b93d4.1789695931.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 03:45, Luiz Capitulino wrote:
> In order to enable THP support in shmem today, besides the user
> configuration required, the CPU must support PMD-sized pages. This
> is the case because of the following has_transparent_hugepage()
> usage:
> 
> - shmem_parse_one() and shmem_parse_huge(): Check if THP is built-in and
>   if the CPU supports PMD-sized pages
> 
> - shmem_init(): Since the CONFIG_TRANSPARENT_HUGEPAGE guard is outside
>   the code block calling has_transparent_hugepage(), the
>   has_transparent_hugepage() call is exclusively checking if the CPU
>   supports PMD-sized pages
> 
> While it's necessary to check if CONFIG_TRANSPARENT_HUGEPAGE is enabled
> in all cases, shmem can determine THP size support at folio allocation
> time. Therefore, drop the has_transparent_hugepage() usage listed above
> while keeping the CONFIG_TRANSPARENT_HUGEPAGE checks.
> 
> Additionally, we need to check if PMD size order is supported in
> shmem_getattr(). Use pgtable_has_pmd_leaves() for that.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>  mm/shmem.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 776dff8a848e..930657d05375 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -690,7 +690,7 @@ static int shmem_parse_huge(const char *str)
>  	else
>  		return -EINVAL;
>  
> -	if (!has_transparent_hugepage() &&
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
>  	    huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
>  		return -EINVAL;
>  
> @@ -1524,6 +1524,8 @@ static int shmem_getattr(struct mnt_idmap *idmap,
>  	generic_fillattr(idmap, request_mask, inode, stat);
>  
>  	orders = shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0);

I'm curious: why is that not handled inside shmem_huge_global_enabled() ? If PMD
order is impossible (well, okay, it is possible, but we simply cannot map these
things through PMDs), I would expect that we never list them as "enabled".

(while shmem could allocate PMD folios, it would have to map them always through
PTEs. I think this would be possible through some changes, but we can defer that
to some future work).

-- 
Cheers,

David
