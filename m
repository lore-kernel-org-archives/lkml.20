Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BDE4AD4AE;
	Thu, 24 Sep 2026 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271411; cv=none; b=so5ncIExNRSertz8Hbv2T2wvvaMtET7ly/TMQ4SzCIMWp8QnCLbFofdbU0UGz/a0E0xakTgRQdx7kMhlv71C6RCe33SbaK1zJ8wvqY9KHvLKr6B1HD8p+YfxPgM5/MEmDEHHRE3Pg543flq9bXeGbt4dXjCStcmI4bo6iF1mg+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271411; c=relaxed/simple;
	bh=18mMiHLh9Cl/1DgV+D8yliNpzSIcXLDEOob2u2BsRX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvCkU1RdBTmwf+sPaw5hEF/ed/uzoZo4UONkSG6wAF2ppF+rMizrDh0OoVNRrZjbHh19fxt0lMHdthSyVOlP7Qtvakat8JcXWvqqdADHI8dmDqM8iCYF2KRmtefv/Pp9WL1gxwtGeDcec+du81KDBQPZvjAPUkSGO+AdR0RsQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JClLHm/7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JClLHm/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA4F1F000FF;
	Thu, 24 Sep 2026 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790271409;
	bh=lW82KOfYpJqn9AJkJA2bViPw92ocPrNpKqvDy+varrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JClLHm/7Fn+UqNf41RJnVdjr0WK8QCAMS5O9kwAx0n+VH/WYZrG/po120ZHS3KOpx
	 kzTU9+BraXv+hU+eOkuProb9ESu15NeMxuZGc6/eUq2ObzGtpwue2N/nG72AzS/3b9
	 7/GmpXz7Pqm5NjP1rh4FNUJ4/lImlsjlcbOCk2KbB42GXHMXa1T4dVIsoIrWl5aE40
	 3gWRP1fGzasVq37wS+UN7b88LDVJgOSFRNTtwRyvhumQCqG6DaDQAvS1Cx/ZCb/t0t
	 B7VUFZ6OvLbGJIvZ0pBfriUAHv6LGZsP6hAgXAruT1jtqpwnK8Qrk0fEkJsnddd836
	 V6N1BXO2ozKdA==
Date: Thu, 24 Sep 2026 20:36:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the mm tree
Message-ID: <arVfqzFi33jwJvel@kernel.org>
References: <arVZKNJKTwEqrFsF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arVZKNJKTwEqrFsF@sirena.org.uk>

On Thu, Sep 24, 2026 at 06:08:56PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the liveupdate tree got a conflict in:
> 
>   mm/mm_init.c
> 
> between commit:
> 
>   a666a70d029d3 ("mm/mm_init: skip initializing shared vmemmap tail pages")
> 
> from the mm tree and commit:
> 
>   85d3615cea179 ("kho: rename KHO scratch to KHO bootmem")
> 
> from the liveupdate tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks correct to me.
Thanks!
 
> diff --combined mm/mm_init.c
> index dc835f753ea9a,24a53d5f0893d..0000000000000
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@@ -29,7 -29,6 +29,7 @@@
>   #include <linux/cma.h>
>   #include <linux/crash_dump.h>
>   #include <linux/execmem.h>
>  +#include <linux/sizes.h>
>   #include <linux/vmstat.h>
>   #include <linux/kexec_handover.h>
>   #include <linux/hugetlb.h>
> @@@ -678,33 -677,21 +678,33 @@@ static inline void fixup_hashdist(void
>   static inline void fixup_hashdist(void) {}
>   #endif /* CONFIG_NUMA */
>   
>  -#if defined(CONFIG_ZONE_DEVICE) || defined(CONFIG_DEFERRED_STRUCT_PAGE_INIT)
>   static __meminit void pageblock_migratetype_init_range(unsigned long pfn,
>  -		unsigned long nr_pages, int migratetype, bool atomic)
>  +		unsigned long nr_pages, int migratetype, bool isolate, bool atomic)
>   {
>   	const unsigned long end = pfn + nr_pages;
>   
>   	for (pfn = pageblock_align(pfn); pfn < end; pfn += pageblock_nr_pages) {
> - 		enum migratetype mt = kho_scratch_migratetype(pfn, migratetype);
> + 		enum migratetype mt = kho_bootmem_migratetype(pfn, migratetype);

-- 
Sincerely yours,
Mike.
