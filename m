Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507949B210
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144441; cv=none; b=ZB7my2khxAXQtXwY8mTBO+QZmu1xyWdtfgNFotWpEMHpefmA7e6/7sSGRYHH3XWEp9n7ppBYf/Rh99ZC0OfZfUmpjgSxwi2dIc1IQPN6BIuQC917bglYWc385+TpX2295ebK4kOizGTN0NRFkChZPJdLOCzbTiJFzCMLP/yZQm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144441; c=relaxed/simple;
	bh=msCS5tCKdjtIEc2/jXg5PZJFqnLBA0ZMyQ3RC0Rf5xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoZ25GCfzSTgfFBf54XLanDrqRKdhO5prXtzU+cpWUy8Q4G4AMAZUzhfy1gicVRtysIG4Gm67wJl7kql0xQIg8ajOncS2gtLUMXYIizqF2Ks6tLV+QvZH2OuqAHFolqI2wgOrwBdbkn4UD1Qk1sJMa1DJWT70ell+SVNDgZGCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRKUvGVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRKUvGVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECFD1F000FF;
	Fri, 11 Sep 2026 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789144439;
	bh=6W0lMrOglM3ZrRlDWL8dh3teSU0pXkZqsr+VimgF2RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bRKUvGVl2nMVS0xG5tDBvi1PSTwbbkDdlC4yggWT+BTrCBFjSt0awW4kRDNMdXoYT
	 VSy+K/YMI9gYu/jenVXoTe9+sn6l3fWHF+tLwSfEHrUWypsiBDFnyCY/fwwCfeN2oP
	 WeXh7/s8FvQccLsyoNEz3vvLANX7VGQAPIU+untQJGxUaUhLpEt6pnkUcsfuIXmRdb
	 WAb8sp9zd8XiIiwKfXTMDudPtBAt8XUgQ+05aW9o1WcN7e5UHmBLxfhguVJO5Ha1m6
	 +3CUDqx6MaBMbKeWKiZ7a8hks+x5ee8G1oIPE9dhUiew/8jnsTv6H+RaRne6B87dNC
	 /RYxPnpGgg1dg==
Date: Fri, 11 Sep 2026 11:33:56 -0500
From: Serge Hallyn <sergeh@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/amd_node: Fix PCI device reference counting in
 amd_smn_init()
Message-ID: <aqQtdHUN3NVQI9yu@shallyn-amd>
References: <20260903154325.74343-1-yazen.ghannam@amd.com>
 <apnMZINAYLpwkcS2@shallyn-amd>
 <20260911030303.GCaqNvZ3QRcCLSmzja@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911030303.GCaqNvZ3QRcCLSmzja@fat_crate.local>

On Thu, Sep 10, 2026 at 08:03:03PM -0700, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 02:37:08PM -0500, Serge Hallyn (AMD) wrote:
> > On Thu, Sep 03, 2026 at 10:43:25AM -0500, Yazen Ghannam wrote:
> > > The local "root" pointer is a temporary variable used during the device
> > > search. Therefore, refcount related to the search iterators should be
> > > cleaned up after the search is complete.
> 
> Ontop of this:
> 
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Thu, 10 Sep 2026 18:43:33 -0700
> Subject: [PATCH] x86/topo: Initialize AMD nodes per package
> 
> Sashiko reports that
> 
>   If amd_num_nodes() evaluates to 0, kzalloc_objs(*amd_roots, 0) returns the
>   truthy ZERO_SIZE_PTR (typically (void *)16).
> 
>   Because ZERO_SIZE_PTR is not NULL, the subsequent check for !amd_roots will
>   fail to catch it, resulting in a divide-by-zero kernel panic on the very
>   next line during the __init boot phase.
> 
> Make sure topology_amd_nodes_per_pkg() doesn't return 0 - the AMD nodes per
> package count can be trivially 1 if detection fails just like the rest
> of the max* and num* packages topology attributes.

May not be worth it, but should we also add a num_nodes == 0 or
ZERO_OR_NULL_PTR(amd_roots) check, in case as code churns we
end up with another way for amd_num_nodes() to return 0?

> Closes: https://sashiko.dev/#/patchset/20260903154325.74343-1-yazen.ghannam%40amd.com
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  arch/x86/kernel/cpu/topology_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/topology_common.c b/arch/x86/kernel/cpu/topology_common.c
> index 6845e3c63fbb..7a7442981594 100644
> --- a/arch/x86/kernel/cpu/topology_common.c
> +++ b/arch/x86/kernel/cpu/topology_common.c
> @@ -14,7 +14,7 @@
>  struct x86_topology_system x86_topo_system __ro_after_init;
>  EXPORT_SYMBOL_GPL(x86_topo_system);
>  
> -unsigned int __amd_nodes_per_pkg __ro_after_init;
> +unsigned int __amd_nodes_per_pkg __ro_after_init = 1;
>  EXPORT_SYMBOL_GPL(__amd_nodes_per_pkg);
>  
>  /* CPUs which are the primary SMT threads */
> -- 
> 2.53.0
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
