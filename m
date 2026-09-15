Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292A414DF6;
	Tue, 15 Sep 2026 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470151; cv=none; b=B/lN9pCChXwHjip+8VgDkh/8SEjWMqXUY9pP/2fCneTcu8RBgAVMAKCqvuRTP86CPXTQPkHQgHtISQAayVr/50M1B/dgqWoKG2Xue199ZTJqGZ2DADIRVYLE8OKeGVmL/sYyo2zMmHc0iDCyI4BqdaRVjKyCV6GmmQ3u31F5DWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470151; c=relaxed/simple;
	bh=92MIKnp/TTHQa8Xs2dfOtgIzcqG9n9MJs0G5Q6ZbTKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ishg5qAdpJfFL5myszUp8f4upQFN7Rwa6DGo7GsYJGqahNKnuyXq2zCPThi/QjH5iz/LYFBC/8HQaorQSSF06GpOI85fK8GxYt4wS6frZ1PXBxaBJn/Qh+4mB0YPNocDDk7ktuT//IIK9itvKl2jrOcaZGWHAdR9tiykhBqOvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMBXFtxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMBXFtxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A7A1F000FF;
	Tue, 15 Sep 2026 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470147;
	bh=roVqnx458yekmIsFUUpm6pjVlxQu/iijthO0iU8Tzq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UMBXFtxPcBmeAGQ8M5BDp+MVSi36ZVfTorzrMI6vAKMq8DRkWmgjL81X56i/k/cD5
	 WPizUAEDEHn6T/p2KaZ1JcsAbPsbPWFYVSwnx/MyOKwOOeIZtt9JGhFAPykZtXbNyG
	 2Z4q7gQWiY+vnssyyEs3O7exaSHY5LCX4+hX8KLTTnbPHV1yh+sj3tXMACHScktTGk
	 +4T1U+gx8cpYfDTK9C9XQcisx34vaH1HvgvLGvOAeS1PkgqytbCULXUhjJz+VsfP3o
	 GeYij8oeqvL/YJ3WdEdjhmuYMFFUtZTQoAraI3oLlBp9RXStV/tc5/wgHKvDMBMtDn
	 98WyMpb4a6fbw==
Date: Tue, 15 Sep 2026 12:02:22 +0100
From: Lee Jones <lee@kernel.org>
To: sekoohaka.sarisan@gmail.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: intel-lpss: Fix DebugFS initialization
Message-ID: <20260915110222.GA11487@google.com>
References: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>

On Sun, 13 Sep 2026, Maria Lisina via B4 Relay wrote:

> From: Maria Lisina <sekoohaka.sarisan@gmail.com>
> 
> The original code defers DebugFS check with unnecessary warning message
> which also appears when DebugFS is simply disabled.
> 
> Therefore it spams dmesg with these messages:
> 
>   intel-lpss 0000:00:15.0: Failed to create debugfs entries
>   intel-lpss 0000:00:15.3: Failed to create debugfs entries
>   intel-lpss 0000:00:1e.0: Failed to create debugfs entries
>   intel-lpss 0000:00:1e.2: Failed to create debugfs entries
> 
> This patch adds proper checks to intel_lpss_init() and
> intel_lpss_debugfs_add() functions and removes warning message.
> 
> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
> ---
> Changes in v3:
> - Fixed commit name and description.
> - Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com
> 
> Changes in v2:
> - Fixed function name in comment section.
> - Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com
> ---
>  drivers/mfd/intel-lpss.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 63d6694f71457b2e09d238af0a9bfb897a169a64..c2cb58c0f98a996d5a2718956092e74139f2a286 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
> @@ -146,9 +146,12 @@ static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
>  {
>  	struct dentry *dir;
>  
> +	if (!intel_lpss_debugfs) {
> +		lpss->debugfs = NULL;
> +		return 0;
> +	}
> +
>  	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
> -	if (IS_ERR(dir))
> -		return PTR_ERR(dir);
>  
>  	/* Cache the values into lpss structure */
>  	intel_lpss_cache_ltr(lpss);
> @@ -432,10 +435,7 @@ int intel_lpss_probe(struct device *dev,
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
> @@ -539,6 +539,13 @@ EXPORT_NS_GPL_DEV_PM_OPS(intel_lpss_pm_ops, INTEL_LPSS) = {
>  static int __init intel_lpss_init(void)
>  {
>  	intel_lpss_debugfs = debugfs_create_dir("intel_lpss", NULL);

Why not move this and everything else debugfs related to
intel_lpss_debugfs_add()?  Then we can get rid of the awful global
variable, have everything nicely compartmentalised and ensure that we
handle each fault gracefully?

> +
> +	/* Ensure intel_lpss_debugfs stays NULL on error,
> +	 * so intel_lpss_debugfs_add() exits properly.
> +	 */
> +	if (IS_ERR(intel_lpss_debugfs))
> +		intel_lpss_debugfs = NULL;
> +
>  	return 0;
>  }
>  module_init(intel_lpss_init);
> 
> ---
> base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
> change-id: 20260913-intel-lpss-debugfs-eff3580d1295
> 
> Best regards,
> -- 
> Maria Lisina <sekoohaka.sarisan@gmail.com>
> 
> 

-- 
Lee Jones
