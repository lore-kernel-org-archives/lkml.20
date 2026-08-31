Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800FD3F1ADA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182873; cv=none; b=Ei2iz8g/4NVPctD98qHPDaVdrK4isMoXaTeYgtf8oeiI8JJA8ACvQnh/oOBeZQTpsfdaKNa8rpjovaQZCgY4Bxodnw+UFn8kU/48RMJxGYTNBdAPeuYtnMfbUnXHF7OmZk+YadWFT4GssDDZVBGcEP68n3NLTpRzTmlqkJu71W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182873; c=relaxed/simple;
	bh=86Is2Lnqdt2mJh7KJh/1HjNBIV/BzWYekW3uEVCFH7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPSYjSoajbEQGzGuwviP0C4Gw8VmUsaFonZTSmwnEp9RjRXVm6jtOSO3yJJCJlXJp3UnZgMB1l1yLULoyb6cIzncbSD+Kn4T7hqCGSCMJh6tDVlzW9nqB39Oa6ue5WpTMUQziYpMoAiOb/ShCd3dBYcVU79uQsbOWhdJopSAcg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4/B18RG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4/B18RG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644B61F000E9;
	Mon, 31 Aug 2026 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788182872;
	bh=agjsrWF0V9C9oS5Bhar4854ibGBp1WvgI5DDxyJUu/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T4/B18RGcw1gFmQ6ryKfrRMJuSbinyHhovZm8pAQGvsyB/bhxRk0Z5uDd3S3y8oZR
	 4SowP+GnzVaUUsRoDVubMeSkb3irQk4bKu9IPGkvTq2YA+SZ7vCkkPAhOaNdAR1FzI
	 lbfc3qsEDTvY/VaL3KIl+jQq7hjmosOAX9GpGnjgV9+PMM5m01qxNFrDg7SZQ0ep5k
	 eDNom+hQuZqwVhnOI1H7jOR2maGVZ09stImlLIA8RVm2K0+kRxmP6RE0O0Wlu8mWJ1
	 aGMQp+NoTK9vG+7fcybtyt9OPGYgpvvv8AfudqcLE6JbYfUVpSRiIOisFo9pNy+hoe
	 MoCX4vsoY5nXg==
Date: Mon, 31 Aug 2026 14:27:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Taha Sezer <tahasezer.is@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, vbabka@kernel.org, 
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: vmpressure: scale window size based on machine memory
Message-ID: <apV_VwQx-7qXks_a@lucifer>
References: <20260831130316.448-1-tahasezer.is@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831130316.448-1-tahasezer.is@gmail.com>



On Mon, Aug 31, 2026 at 04:03:16PM +0300, Taha Sezer wrote:
> The vmpressure window size is currently a compile-time constant of
> 512 pages (2 MB with 4 KB pages), regardless of the machine size.
> On large machines with hundreds of gigabytes of RAM, this small window
> leads to excessive false-positive pressure notifications due to the
> higher absolute reclaim activity.  Conversely, the fixed size is
> already appropriate for small machines.
>
> Scale the window size logarithmically with total memory at boot time,
> following the same approach used by calculate_normal_threshold() in
> mm/vmstat.c.  Total memory is converted to 128 MB units and fls() is
> used for cheap logarithmic scaling.  The multiplier is clamped between
> 4 and 64, yielding a window range of 128 pages (512 KB) to 2048 pages
> (8 MB).
>
> This resolves the TODO that has been in the code since the original
> vmpressure implementation.
>
> Signed-off-by: Taha Sezer <tahasezer.is@gmail.com>

Hi,

Since you seem to be relatively new here and you're making a fiddly change to
core mm, I do have to ask if you're using an LLM here?

If so please follow kernel process and disclose:

https://docs.kernel.org/process/coding-assistants.html
https://docs.kernel.org/process/generated-content.html

Note especially:

	"You are expected to understand and to be able to defend everything
	you submit. If you are unable to do so, then do not submit the
	resulting changes."

In general we recommend new contributors to do smaller changes first
without the use of LLMs to gain understanding.

And if one of your very first patches, it should really be to
drivers/staging/ where you can learn the basics safely.

In general, we aren't really interested in wholly generated patches except
from those with established understanding of the subsystem.

Thanks, Lorenzo

I also note that this is the 4th patch I've seen trying to do the same
thing from a new person.

It seems LLMs are honing in on TODOs like this, so I may send a patch to
just delete the TODO to prevent this from happening:

https://lore.kernel.org/linux-mm/20260724054305.516126-1-cui.tao@linux.dev/
https://lore.kernel.org/linux-mm/20260715143646.15828-1-gaikwad.dcg@gmail.com/
https://lore.kernel.org/all/20260227221555.29969-1-mcq@disroot.org/

In any case, LLM-generated or not, this is a vital heuristic that would
need significant real-world data and justification from somebody with
intimate understanding of this code, which I'm afraid isn't the case here.

> ---
>  include/linux/vmpressure.h |  2 +-
>  mm/vmpressure.c            | 60 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/vmpressure.h b/include/linux/vmpressure.h
> index b4d13457b..09111f5bd 100644
> --- a/include/linux/vmpressure.h
> +++ b/include/linux/vmpressure.h
> @@ -51,7 +51,7 @@ extern struct vmpressure *memcg_to_vmpressure(struct mem_cgroup *memcg);
>  extern struct mem_cgroup *vmpressure_to_memcg(struct vmpressure *vmpr);
>
>  /* Shared with the v1 vmpressure block in mm/memcontrol-v1.c. */
> -extern const unsigned long vmpressure_win;
> +extern unsigned long vmpressure_win;
>  extern enum vmpressure_levels vmpressure_calc_level(unsigned long scanned,
>  						    unsigned long reclaimed);
>
> diff --git a/mm/vmpressure.c b/mm/vmpressure.c
> index 9629240d7..f88bafb71 100644
> --- a/mm/vmpressure.c
> +++ b/mm/vmpressure.c
> @@ -13,6 +13,7 @@
>   * (tree=false) socket-pressure path that runs on cgroup v2.
>   */
>
> +#include <linux/bitops.h>
>  #include <linux/cgroup.h>
>  #include <linux/log2.h>
>  #include <linux/mm.h>
> @@ -31,10 +32,63 @@
>   * As the vmscan reclaimer logic works with chunks which are multiple of
>   * SWAP_CLUSTER_MAX, it makes sense to use it for the window size as well.
>   *
> - * TODO: Make the window size depend on machine size, as we do for vmstat
> - * thresholds. Currently we set it to 512 pages (2MB for 4KB pages).
> + * The window size scales logarithmically with total memory, following the
> + * same approach as calculate_normal_threshold() in mm/vmstat.c.  On small
> + * machines the window stays small for responsiveness; on large machines it
> + * grows to reduce false positives from the higher absolute reclaim activity.
> + *
> + * Sample window sizes (SWAP_CLUSTER_MAX = 32, PAGE_SIZE = 4K):
> + *
> + *   RAM          fls(mem)   multiplier   window (pages)   window (bytes)
> + *   -----------------------------------------------------------------
> + *   <= 4 GB      0-4        4            128              512 KB
> + *   8 GB         6          6            192              768 KB
> + *   16 GB        7          7            224              896 KB
> + *   32 GB        8          8            256              1 MB
> + *   64 GB        9          9            288              1.1 MB
> + *   128 GB       10         10           320              1.3 MB
> + *   256 GB       11         11           352              1.4 MB
> + *   512 GB       12         12           384              1.5 MB
> + *   1 TB         13         13           416              1.6 MB
>   */
> -const unsigned long vmpressure_win = SWAP_CLUSTER_MAX * 16;
> +unsigned long __read_mostly vmpressure_win = SWAP_CLUSTER_MAX * 16;
> +
> +/*
> + * Initialize vmpressure window size based on machine memory.
> + *
> + * Use fls() for cheap logarithmic scaling, following the same approach
> + * as calculate_normal_threshold() in mm/vmstat.c.  Memory is measured
> + * in 128 MB units so that the window starts growing once total RAM
> + * exceeds a few GB.
> + */
> +static int __init vmpressure_win_init(void)
> +{
> +	unsigned long mem;
> +	int multiplier;
> +
> +	/*
> +	 * Convert total pages to 128 MB units, matching the vmstat
> +	 * convention: mem = totalram >> (27 - PAGE_SHIFT).
> +	 */
> +	mem = totalram_pages() >> (27 - PAGE_SHIFT);
> +
> +	/*
> +	 * fls(0) == 0, so for machines with < 128 MB the multiplier
> +	 * is clamped to 4, preserving the original 128-page minimum
> +	 * (SWAP_CLUSTER_MAX * 4).  The maximum multiplier is clamped
> +	 * to 64, yielding a 2048-page (8 MB) ceiling which prevents
> +	 * excessively delayed notifications on very large machines.
> +	 */
> +	multiplier = clamp(fls(mem), 4, 64);
> +
> +	vmpressure_win = SWAP_CLUSTER_MAX * (unsigned long)multiplier;
> +
> +	pr_info("vmpressure: window size set to %lu pages (%lu KB)\n",
> +		vmpressure_win, vmpressure_win << (PAGE_SHIFT - 10));
> +
> +	return 0;
> +}
> +core_initcall(vmpressure_win_init);
>
>  /*
>   * These thresholds are used when we account memory pressure through
> --
> 2.53.0
>

--
Cheers, Lorenzo
