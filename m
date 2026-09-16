Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA8F4AF142;
	Wed, 16 Sep 2026 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554473; cv=none; b=K65ahm40CiBX05YtKGjMQos0zgT1AiJnCWEIPAY/g4oOpN5B5OkgBieD7MR74/zATI4bxLhPgag9XWfACM3iuKcUcDaeSLjaIqml1V1yBZWca374PEQRSr8bXKdlZ2Wc5NxwwJpv85Ie4QnDmTV6xK1cR2LQe/p+4/qV51fkWrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554473; c=relaxed/simple;
	bh=wXreIP3tC205f3nPQFVedjNw6ICCrCqnjkjAc3ffaGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxKHtvcojKC9DY/kBFs2dfyjzZZ7xled5rbDGid3KCvTxWN47Ts0heij0cI0DxEPIwQeG1mc0l2fG0SPzuSn4DioqD3nehzH/K28RbgUr5HNFsSdc2ZwrfW9Nw1Gj0IcvmogMgD9WrtZSjfyTqSLqH+Ch1YPEaXvtnvB1khN3ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFNwsPtB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFNwsPtB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8AA1F000FF;
	Wed, 16 Sep 2026 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789554455;
	bh=x4jHf775ozqpKeid93D9RRDJNOOQZz0wUt4rIU/B1rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFNwsPtBe/BjLRWY4fpK1iXFneo/VYdGEknGosnm5IdOVtgRCU6z65FrAVKakj4Rf
	 0GUPB0aE2X98KztSAjIJnOGXqE7iEZ/CewPW+ktFsFLfcuz8iYIApqgu+TM4l/CxYy
	 GUyzYIq2UMPXC4IpF9isKXnl6i/dADhXrwgjbnoyXXOYj5GT4ykU4K21qilrHqkroG
	 xFJ6SQ5feeabbEd2rFxEMr4bOcH1a5/LNwon7awpRWkdqLk4k7qz9V/4STFqIhCHgz
	 BVNakNYgW38m0iNu1HEDnJ7Epdj2BcbIa+5KEG2MN6ag8Vnw/myJzYkqIB1xu6GRuz
	 uqgY0erNP1JNQ==
Date: Wed, 16 Sep 2026 11:27:32 +0100
From: Lee Jones <lee@kernel.org>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS usage
Message-ID: <20260916102732.GJ11487@google.com>
References: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>

On Wed, 16 Sep 2026, Maria Lisina wrote:

> The DebugFS API is designed to handle errors gracefully.
> Any explicit checking on return values is considered an anti-pattern.
> 
> This patch removes unnecessary error checking and converts
> intel_lpss_debugfs_add() into a void function.
> 
> While at it, this patch also clean ups legacy and deprecated usage
> of S_IRUGO macro and debugfs_remove_recursive() function.
> 
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
> ---
> Changes in v5:
> - Changed the goal of the patch to DebugFS modernization.
> - Refactored intel_lpss_debugfs_add() into a void function.
> - Removed deprecated macros and functions.
> - Removed dmesg message completely.
> - Link to v4: https://lore.kernel.org/r/20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com
> 
> Changes in v4:
> - Keep the dmesg messages, instead check whether DebugFS is initialized
> - Link to v3: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com
> 
> Changes in v3:
> - Fixed commit name and description.
> - Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com
> 
> Changes in v2:
> - Fixed function name in comment section.
> - Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com
> ---
>  drivers/mfd/intel-lpss.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 63d6694f71457b2e09d238af0a9bfb897a169a64..1a61ef1a62b3e8a2777f357d5c4605d5d57d9532 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
> @@ -142,28 +142,25 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
>  	lpss->idle_ltr = readl(lpss->priv + LPSS_PRIV_IDLELTR);
>  }
>  
> -static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
> +static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
>  {
> -	struct dentry *dir;
> -
> -	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
> -	if (IS_ERR(dir))
> -		return PTR_ERR(dir);
> +	lpss->debugfs =
> +		debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);

No need to line-wrap for this.  Use up to 100-chars to prevent this craziness.

Why continue if this returns an error?

>  
>  	/* Cache the values into lpss structure */
>  	intel_lpss_cache_ltr(lpss);
>  
> -	debugfs_create_x32("capabilities", S_IRUGO, dir, &lpss->caps);
> -	debugfs_create_x32("active_ltr", S_IRUGO, dir, &lpss->active_ltr);
> -	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
> -
> -	lpss->debugfs = dir;
> -	return 0;
> +	debugfs_create_x32("capabilities", 0444, lpss->debugfs,

Does this accept a NULL pointer or an error in parameter 3?

> +					   &lpss->caps);

You should always align to the '(' but in this case, don't wrap at all.

> +	debugfs_create_x32("active_ltr", 0444, lpss->debugfs,
> +					   &lpss->active_ltr);
> +	debugfs_create_x32("idle_ltr", 0444, lpss->debugfs,
> +					   &lpss->idle_ltr);
>  }
>  
>  static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
>  {
> -	debugfs_remove_recursive(lpss->debugfs);
> +	debugfs_remove(lpss->debugfs);

Please explain why this is required?

>  }
>  
>  static void intel_lpss_ltr_set(struct device *dev, s32 val)
> @@ -432,10 +429,7 @@ int intel_lpss_probe(struct device *dev,
>  		goto err_clk_register;
>  
>  	intel_lpss_ltr_expose(lpss);
> -
> -	ret = intel_lpss_debugfs_add(lpss);
> -	if (ret)
> -		dev_warn(dev, "Failed to create debugfs entries\n");
> +	intel_lpss_debugfs_add(lpss);
>  
>  	if (intel_lpss_has_idma(lpss)) {
>  		ret = mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,
> 
> ---
> base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
> change-id: 20260913-intel-lpss-debugfs-eff3580d1295
> 
> Best regards,
> -- 
> Maria Lisina <sekoohaka.sarisan@gmail.com>
> 

-- 
Lee Jones
