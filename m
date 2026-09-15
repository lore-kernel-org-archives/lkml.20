Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10FC19F40B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499256; cv=none; b=lR4y+Q4HLXKVQFkowd0c5pWdom+yyVWISf+C7m6Pb5UaJ8SaSoXvTzrFD+bwJ7xrAeio47V52pFLzDqFO332m0o/Ek4b7737yvj0OMcm0zp9dXq2xrG3Enewu2foXfkmNd09wlZzhbMWKvx7Grtamh1BhSPMWy/PgSb+Z62ba4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499256; c=relaxed/simple;
	bh=GhNTHQzPRiisgzokdgY32xBke/TrrFxbAbQP+Yr1pdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8heDL+YcmGZt9AUw+OvN6g3u4U+PAuzc6XjmlzUSbknk+mQ2mA4zwsvf29vhS7sVMEM6zTVpXpLFpafzZTPreYOG0acE9GHyP/dcR6Q5Z1tCNR9Sfk1yXMuMS5xGAezbAiOWzpLU4Xu8ARUBoyCKZUgUY4BdbF2jeEzyx9Nhg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGlWztQB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGlWztQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EC51F000FF;
	Tue, 15 Sep 2026 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499254;
	bh=7fPCxiu6U8QK40Q3XmQXoHl4cq3jLJA6d9PyynTvehg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OGlWztQByZ1IcTvyRt1Fyvu/R6WRkXmFWCutogovhPr9h+oTM1pWz7aQAO7aMziI0
	 AJ22WrBfT/b83+67rCi5xEnU6B1SFR53PuCyPj5anoqh8WLiaoJjLOJWAg7Q7/bf0/
	 gcJIwpR4udgeq+eYg2ZPgij5OqM+l6mNFLjUbxvrc8Kzp+IsN2Iv9JMCA7LtDiIiej
	 NOhwrLuHRex07iIIN4y4UdvokRYqY79UhfVHn9cR81OD+tfJVkXXoO7J5ybe+eD8eA
	 hBRw0VRJ81XbqFj6YKNhzbe324pGSr+hZJHrfORMBKci6papX8XpVtC+RAXv6giLXT
	 J7U+FpyrNnY1A==
Message-ID: <0532c0b6-7e09-4309-8f9f-ced9f5036245@kernel.org>
Date: Tue, 15 Sep 2026 14:07:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/amd/node: Release reserved config regions on init
 error
Content-Language: en-US
To: yolezz <yolezz.secret@gmail.com>, yazen.ghannam@amd.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
References: <6bd2cad5-65ef-4f3d-a146-d91f120c86ad@amd.com>
 <20260915180543.112708-1-yolezz.secret@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260915180543.112708-1-yolezz.secret@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/15/26 13:05, yolezz wrote:
> In amd_smn_init(), if pci_request_config_region_exclusive() fails or
> if kzalloc_objs() fails to allocate memory for amd_roots, the already
> reserved PCI config regions are left allocated.
> 
> Use a __free() cleanup helper to automatically release all reserved PCI
> config space regions on error exit paths.
> 
> Fixes: 83518453074d ("x86/amd_node: Add SMN offsets to exclusive region access")
> Signed-off-by: yolezz <yolezz.secret@gmail.com>
> ---
> v4:
>   - Remove unnecessary braces around the kzalloc_objs() error check (as suggested by Yazen Ghannam).
I have no more concerns, thanks.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>>
>   arch/x86/kernel/amd_node.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index b7926ba3610a..a1db03d3777b 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -239,6 +239,22 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
>   	return root;
>   }
>   
> +static void amd_smn_release_config_regions(u16 *num_roots)
> +{
> +	struct pci_dev *root __free(pci_dev_put) = NULL;
> +
> +	if (!num_roots)
> +		return;
> +
> +	while (*num_roots && (root = get_next_root(root))) {
> +		pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
> +		(*num_roots)--;
> +	}
> +}
> +
> +DEFINE_FREE(amd_smn_release_config_regions, u16 *,
> +	    amd_smn_release_config_regions(_T));
> +
>   static bool enable_dfs;
>   
>   static int __init amd_smn_enable_dfs(char *str)
> @@ -250,9 +266,11 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
>   
>   static int __init amd_smn_init(void)
>   {
> -	u16 count, num_roots, roots_per_node, node, num_nodes;
> +	u16 count, num_roots = 0, roots_per_node, node, num_nodes;
>   	struct pci_dev *root __free(pci_dev_put) = NULL;
>   
> +	u16 *config_regions __free(amd_smn_release_config_regions) = NULL;
> +
>   	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>   		return 0;
>   
> @@ -261,7 +279,8 @@ static int __init amd_smn_init(void)
>   	if (amd_roots)
>   		return 0;
>   
> -	num_roots = 0;
> +	config_regions = &num_roots;
> +
>   	while ((root = get_next_root(root))) {
>   		pci_dbg(root, "Reserving PCI config space\n");
>   
> @@ -315,6 +334,7 @@ static int __init amd_smn_init(void)
>   		debugfs_create_file("value",	0600, debugfs_dir, NULL, &smn_value_fops);
>   	}
>   
> +	config_regions = NULL;
>   	return 0;
>   }
>   

