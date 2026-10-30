Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397047;
	b=J3hd33m0czTVOmNDRD9yK2UUpksSKkLTjuaJl5BIjYopPgC0hKjDCmdSXDpGIURNLt9t
	 n8wR4mUSzjNPODeWSNZ6QBe5vutNR6ruzWTZTT2lHrZKwoQm0vtZZ6NOEfAmsI/bnAQmQ
	 CuLNrinOU9E755I5z5eNvuNs7FZ+JQloF6OdAaofsj/cFIj0amfsHom0UJ2YhjgZxXxQy
	 pXHPTUnlIFi3MJP4b6iuBuQyACFlobLNbuBCfWi4IBeikyg13WVvikvqgRsWaPlCfEFkr
	 JRXzrhlwa0f9BCUUP4yTlSsC9YiIkCFAUSB0r+o9KXqFFcH8jCkS6EzAI4aERMcfbkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397047;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OVcS62BaI3sjhixYFhPqAdLP8a3jioqhovkbocOoVJ8=;
	b=D9chEUXV/HmgFXjiKlJN+dP+YWmdKTn5F5MKBpruwXrj0EmCTUyjEwnR+ZJd0wzjT5t9
	 bGJUfqK6kGF5OahkabppYQGxIxqNz81YMsTAK1uUnJB9g0pxbGZ/htgGT2KJiPUvRW2C/
	 g1211PSiu7rbjgZJ1rX6yc1D4OwThLxMHdOw8QqPuPmrjCYf+N77BSms55FzvwqUBVbp9
	 YqSspdCNNdsgkzQoXTYNg0nbuqNoI8ibr9QRSnT+kM67gXD/AAm4IvvxCwVZfpraba4o/
	 LMM8EcorxIjHs9dlDKxMhsWw6ZUyCAlHBEc3fs+Rm1rDyAirV0uZO80Z827uw4AiAlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfKnWU8s;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfKnWU8s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793397046; x=1824933046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w0qW73nQ9x5qUSCd7VLYRdM3VlclXZny98CZJXS2y4I=;
  b=OfKnWU8sF38aSmlIL6wFTczh1rLumG77f9wt4Wfluymv6kvgwLpS0xqh
   ZG0/B6icUbwi20hKcL9lBV57ckRWaD0fwRwkNAdVLiRdWqPmi99SZ3H17
   9cKCOcVTaF88BB6bQguXVTMvBxZ0S2WlWs5lZum1O7K5j8AocZ6+c8CDG
   UZ/eSabssB88GNlIjutRKUULkPKxwYw8gPiThcKpqnSoKjwu9ubJxHX5r
   MV+lJHISBzB7dhEmCSaFsia+AWY/1BdZVv2OfnEIxmOWP/g37c5LX48GJ
   K6ArXXvuvyFsuVnaR6k2p+y/zEBTeoag7JTiLt6LZhqH5kaKGapnL8nKw
   w==;
X-CSE-ConnectionGUID: b+7KsPTDSlO8YIOb9RDXbA==
X-CSE-MsgGUID: gsFEXb+5TjqoRBM6onQhnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2263519"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2263519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:50:46 -0700
X-CSE-ConnectionGUID: 1JzG/cpPRpaUsfid781jTA==
X-CSE-MsgGUID: UgFVYaNMTFycr7ZsFZX+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5544051"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:50:46 -0700
Date: Fri, 30 Oct 2026 14:50:38 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Dave Hansen <dave.hansen@intel.com>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/bugs: Replace RFDS model checks with VFM ones
Message-ID: <hk4lfzdilnx3km43tiglbpweyva4bfz3s5onaplwxjjj2vjxfd@bbjczdgxezqf>
References: <20261030195214.1284995-1-sohil.mehta@intel.com>
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
In-Reply-To: <20261030195214.1284995-1-sohil.mehta@intel.com>

On Fri, Oct 30, 2026 at 12:52:14PM -0700, Sohil Mehta wrote:
> The RFDS vulnerability check uses raw model numbers to identify Alder
> Lake and Raptor Lake. Most Intel-specific code has already moved away
> from x86_model checks, but this one got added recently.
> 
> Replace the x86_model checks with VFM ones to make them more readable.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> ---
>  arch/x86/kernel/cpu/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index c7352827f491..8d7bd8bb7b18 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1392,8 +1392,8 @@ static bool __init vulnerable_to_rfds(u64 x86_arch_cap_msr)
>  	 * both Core and Atom CPUs. Mark unaffected when Atom CPUs are not
>  	 * present.
>  	 */
> -	if ((boot_cpu_data.x86_model == 0x97 ||
> -	     boot_cpu_data.x86_model == 0xB7) &&
> +	if ((boot_cpu_data.x86_vfm == INTEL_ALDERLAKE ||
> +	     boot_cpu_data.x86_vfm == INTEL_RAPTORLAKE) &&

I missed that when adding the patch. Thanks for fixing.

Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
