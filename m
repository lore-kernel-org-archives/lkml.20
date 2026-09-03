Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BC503BC9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464249; cv=none; b=WGw/N6e0ApGb1wcn886I0llWb3722CV7y5EWAoGcbmo1Ruqlmug8JPfBsIstd/C1dsTFm4TLqb9gebKSMcSvPwzt5cwqsbyaROoSuEAAbd7CPbs9Lx3Uii4yGUsybGHAPepSxTyH6GVVvE8CkcX4Q5Y2GKRJ7bgztMohOG2OwmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464249; c=relaxed/simple;
	bh=7P71vfV6TGRSWO5Ph95BWYoYAghMjlmDhfu0zx19MdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+ZXkd8i/HHYxKzBRUepKthS43j0DADIvoPdXdnbor6HAbTD18OyVsmoFeYA6BdvpMTat7LdekLhSoYSbNDQ2JyEpeNE+3OHigBv1ziRUvhX7li7gcPFsNeHaKv6I3JvT6BUdAAfRCcdqWDR4aSzYJpkeq/Rpxq41F/3TTPzcLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAVdB/QS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAVdB/QS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E531F00AC4;
	Thu,  3 Sep 2026 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788464231;
	bh=jql59ClQWkoNVj3NF58JNBkqUlOhjlPVDT4hvMeit+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lAVdB/QSZgvYzSvUShpiHOr1EbYAu0ha+PSkaZ5L0fng2wZyWZ/OmYAGJQ56jouJm
	 MYIigAfak7bCLR5KDmHWzxasPGDkaR9coTW8SyT05JoppVkVAJAGdK/h+Imw5f/NeX
	 6rNQvQ5t73HvWv5yecW5q8bf+73x0eSPbtUf5nXowijWE8Jp3JVleDzWZjJSYmN7e7
	 gpY2Xp7L7zevW3QPc6FSGPvGTHm+KL8EhC9mB793+exFGrAHssUXdTl15fv2C/SHjl
	 ELSz4Gpy+Q2W04tu9nvms/GVXtmUvO7LSK9TqdOalVdmUAckfxcC8YIRVeP/rXxB5v
	 tpIG1COr0LDjg==
Date: Thu, 3 Sep 2026 14:37:08 -0500
From: "Serge Hallyn (AMD)" <sergeh@kernel.org>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/amd_node: Fix PCI device reference counting in
 amd_smn_init()
Message-ID: <apnMZINAYLpwkcS2@shallyn-amd>
References: <20260903154325.74343-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903154325.74343-1-yazen.ghannam@amd.com>

On Thu, Sep 03, 2026 at 10:43:25AM -0500, Yazen Ghannam wrote:
> The local "root" pointer is a temporary variable used during the device
> search. Therefore, refcount related to the search iterators should be
> cleaned up after the search is complete.
> 
> Use the __free() cleanup macro to ensure the refcount is decremented
> when the temporary pointer goes out of scope.
> 
> Additionally, increment the refcount when caching a root pointer. This
> ensures the in-use refcount is separate from the temporary search
> refcounting.
> 
> Finally, drop the redundant "root = NULL" before the second search
> loop. The pci_get_class() iterator always decrements the refcount of
> its "from" argument, so the first loop can only fall through with
> "root" already NULL.
> 
> Fixes: 0a4b61d9c2e4 ("x86/amd_node: Fix AMD root device caching")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260806160159.230453-1-jason.andryuk%40amd.com
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Thanks.  FWIW,

> Reviewed-by: Serge Hallyn (AMD) <sergeh@kernel.org>

> ---
> Link:
> https://lore.kernel.org/r/20260824175003.335196-1-yazen.ghannam@amd.com
> 
> v1->v2:
> * Add SoB from Mario.
> * Remove redundant pointer reset.
> 
>  arch/x86/kernel/amd_node.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index 762585775b5a..b7926ba3610a 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -251,7 +251,7 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
>  static int __init amd_smn_init(void)
>  {
>  	u16 count, num_roots, roots_per_node, node, num_nodes;
> -	struct pci_dev *root;
> +	struct pci_dev *root __free(pci_dev_put) = NULL;
>  
>  	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>  		return 0;
> @@ -262,7 +262,6 @@ static int __init amd_smn_init(void)
>  		return 0;
>  
>  	num_roots = 0;
> -	root = NULL;
>  	while ((root = get_next_root(root))) {
>  		pci_dbg(root, "Reserving PCI config space\n");
>  
> @@ -299,14 +298,13 @@ static int __init amd_smn_init(void)
>  
>  	count = 0;
>  	node = 0;
> -	root = NULL;
>  	while (node < num_nodes && (root = get_next_root(root))) {
>  		/* Use one root for each node and skip the rest. */
>  		if (count++ % roots_per_node)
>  			continue;
>  
>  		pci_dbg(root, "is root for AMD node %u\n", node);
> -		amd_roots[node++] = root;
> +		amd_roots[node++] = pci_dev_get(root);
>  	}
>  
>  	if (enable_dfs) {
> 
> base-commit: 7755fae2ea370ee914797c5bcca922836a818c3d
> -- 
> 2.43.0
> 
