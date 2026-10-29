Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311325;
	b=5GIQKnEipr0l+QjMcoORiw3K6/yXR7TF9Q3llJzQFyGBuvU1gXLcLOm4ozasI2CSVmxA
	 Vwv0GXVV7Fwrzf+19wcr5zI/c5ZIxbXFCuapuvWEkIzy+UunvxpnB53C9yR+HtZcSpHrB
	 MJ5WIreI6wzOIINX5a/buySNyfZjeiTwZBqfAlFa64+rsTP//NSZynYFOcOqZDhb6IKen
	 sdim0USyk2C3shUis+mjPR+o9lLah1zcc8GoJLoO6prl2z3K7S0U/QPZ8e3LuE24Z7L+s
	 mi8McJ99/7l7IWVphe/NzfGNKJdWt6FxS8muBGTJqrtCT4pNnn37atno5Qo08U5XxBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311325;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JYxKhJ5Nqkl6cTQISRdnvK/P3JV5rSsFOheg672wUag=;
	b=IRIXmCHJrtyD7yad9rNOjdDTEDTwYRRM1N7ZzSy++HnMvbw5w+04onUUOVr9CofQZ179
	 XDpT12YEKJGCGTWBG+AQ8uaze1E8BiQskRLP9MOOLBPu9zZGzjfc4vSvdoTGJmc3Y2DIP
	 iRgr1xSLYOBwLnhQ43BopLHjHZM4Vv6mUdpsd/2xOKg/6M2dRYRpjrC0soOvQwlb2B0TR
	 BpjrmkTsG0QFvgHRhfcVZbg1b5iMoEe4t4DFn8OA4CL9myKbBKeVVoYNTH2Kw418jKDJy
	 DbLfyqY8lCibRDM1yTWDbCE2TNfcXaMmxYs3LkHVSsQjCtkJCvHCBDFG25cdp8gsSFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lJySD+DX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2861606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2861606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lJySD+DX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82D115A1;
	Thu, 29 Oct 2026 15:02:00 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D42E73F59E;
	Thu, 29 Oct 2026 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793311323; bh=JTrK1XlB+5p23F0LNcaqj0VtA4gzIX+/IaVVmpuGrl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJySD+DXukQaaFPs6Wft5kbYJLMizH8HdgBLh4ByuYeQJrehaf5/st9zCdP6UBi7W
	 Lg37Jqt+mfkQGHfkp4C9a2WJMk+TA9g0DmVWhrFD2+sAlxUu2RQJiV3/IOJcSLg2aK
	 9ulhF40slKJxrq2eEaEeZB1DvqUZxUlc2EzRYxus=
Date: Thu, 29 Oct 2026 22:01:59 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
Message-ID: <auPCV6VdMEz4uZkK@arm.com>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
 <20261021110700.493315-3-fuad.tabba@linux.dev>
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
In-Reply-To: <20261021110700.493315-3-fuad.tabba@linux.dev>

On Wed, Oct 21, 2026 at 12:06:58PM +0100, Fuad Tabba wrote:
> When KVM_ARM_MTE_COPY_TAGS copies tags into a page, it marks the page as
> tagged. For a hugetlb folio the flag covers every page in the folio. If
> the folio wasn't tagged yet, its other pages are marked as tagged with
> their previous owner's tags still in place. The stage-2 fault path then
> maps them into the guest without clearing them. The ioctl's read side
> also copies them out to the VMM.
> 
> Clear the whole folio on its first tagging, before copying in this
> page's tags.
> 
> Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/guest.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index b01d6622b8720..cda655fbff657 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1012,6 +1012,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		void *maddr;
>  		unsigned long num_tags;
>  		struct folio *folio;
> +		unsigned long i;
>  
>  		if (!page) {
>  			ret = -EFAULT;
> @@ -1042,12 +1043,14 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  			/*
>  			 * Only locking to serialise with a concurrent
>  			 * __set_ptes() in the VMM but still overriding the
> -			 * tags, hence ignoring the return value.
> +			 * tags. A hugetlb folio is marked tagged as a whole,
> +			 * so its first tagging clears every page.
>  			 */
> -			if (folio_test_hugetlb(folio))
> -				folio_try_hugetlb_mte_tagging(folio);
> -			else
> +			if (!folio_test_hugetlb(folio))
>  				try_page_mte_tagging(page);
> +			else if (folio_try_hugetlb_mte_tagging(folio))
> +				for (i = 0; i < folio_nr_pages(folio); i++)
> +					mte_clear_page_tags(page_address(folio_page(folio, i)));

I guess we could have skipped the actual page we are going to copy into
but not worth it.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

>  			num_tags = mte_copy_tags_from_user(maddr, tags,
>  							MTE_GRANULES_PER_PAGE);

Something Claude spotted and unrelated to your patch. A malicious VMM
using memfd (not guest_memfd) and MAP_SHARED could construct some
mapping so that the VM slot is !PROT_MTE while the same page is mapped
in the VMM with PROT_MTE. try_page_mte_tagging() (or the folio one)
above set PG_mte_lock but a subsequent fault on the uaccess to VMM
memory will attempt to zero the tags and wait (forever) on the page
lock. Not tested to prove it.

If you get bored and want to fix it, I guess a copy_from_user() into a
local buffer and then setting the page tags.

-- 
Catalin
