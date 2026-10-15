Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB353E2EF;
	Thu, 15 Oct 2026 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079852; cv=none; b=merca9hD7Ww6vSpbeKmTP86k2eCkddXtXWba7oSVlnp9pz2zaKPhhPnlVA56xbDTbIJ0neRQnWQjXoLzWY2b5qFvW8ZzxQ0EDNQciN+qnL5OMdyNx/xKPDV9Mo0NVRscLFps8NdFKeBbib60rEQTvFUyc6AqO0EpYPM2B1Mp6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079852; c=relaxed/simple;
	bh=uR1TuhV5arWQc5zcayum5XtqClJONqPn0sN9uGFNZgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQWbzZVbJ17aNiOX2K2kzAJT5adjfVm1hCs1B0PZfJ//uiCw33sZKl1NFuSyU4EXG6K8O9hgPcvMWUjseuCoy6Ghvl04W84T8QZpfSiJypIz/laJ2mimvY8UiKoPGo55FNA2OdGWKUm9tFRDEQdS6N086rihfUfrGCzJF4Zbceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ga8OFkIN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ga8OFkIN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B51B1F000C4;
	Thu, 15 Oct 2026 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079832;
	bh=/ARl9fUokhS1I2rIwEo42HdiHZLCCNWj/RrtMzn+6d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ga8OFkINkhIcxjfwEJRpcSPEoreXwCGbxoiP6WDDxuoV+Rok01pnGsOucAAhi8GBS
	 Ie4Czd+HCpp5W9yqc3Smt35cXoKPe1MaCYviUByNdaCR4s9051pK5GXg5u1T9kwsJ1
	 CwL77jhE9JKVfyTb7FdCV+uNRj0PZAQac2DmXSc97WQoS3t/2Xu2pSZ6Kkqawfjx+/
	 s7fzhgawuJGfleTbMDUEv90GIkPpbk5/HeQBDLkLoF34V5ikSzl2OD3T32Of2juCvR
	 eOoDbx1IYXBfZLTY7GgSloEKl/TYJg+/DfJRDMI3CkUbr5BuqKjOafSuQxTopCL21r
	 MH/Jv4H3y7YHw==
Date: Thu, 15 Oct 2026 16:57:08 +0100
From: Lee Jones <lee@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>, mfd@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] mfd: ls2kbmc: Fix stop_machine() function's retvals
Message-ID: <179198419934.839288.12713994676834542149@kernel.org>
References: <20261007235635.GAasbcM53RNcTVfnu3@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007235635.GAasbcM53RNcTVfnu3@fat_crate.local>
X-AI-Review-Draft: <20261007235635.GAasbcM53RNcTVfnu3@fat_crate.local>

On Wed, 07 Oct 2026, Borislav Petkov (AMD) wrote:

Please review, explain or fix the Sashiko review(s).

> Hi,
>
> see below.
>
> It is totally untested because I don't have the hardware but the issue should
> be clear.
>
> Maybe the retvals should be tweaked, to denote even better what fails in
> the function when it happens.
>
> Thx.
>
> ---

If you want to provide additional context, please add it below the ---
separator below the tags section.

> stop_machine() takes a function to run @fn of type cpu_stop_fn_t as its
> first parameter, which returns an int. That int is either 0 on a success
> or non-zero on failure.
>
> The ls2k_bmc_recover_pci_data() function returns "false" instead to
> denote a failure, presumably, which gets promoted to a 0.
>
> Add proper negative return values to denote the different failures
> encountered.
>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  drivers/mfd/ls2k-bmc-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe..306e444a592a 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -268,18 +268,18 @@ static int ls2k_bmc_recover_pci_data(void *data)
>  	}
>
>  	if (i == 0)
> -		return false;
> +		return -ETIMEDOUT;
>
>  	ls2k_bmc_restore_bridge_pci_data(parent, ddata);
>
>  	/* Check if PCI-E is connected */
>  	if (!ls2k_bmc_pcie_is_connected(parent, ddata))
> -		return false;
> +		return -EINVAL;

Is this an invalid argument, or did the link fail to come up ('-ETIMEDOUT' or
'-ENOLINK')?

>
>  	/* Waiting for U-Boot and DDR ready */
>  	mdelay(LS2K_BMC_RESET_WAIT_TIME);
>  	if (!ls2k_bmc_bar0_addr_is_set(parent))
> -		return false;
> +		return -EINVAL;

Same here.

Wouldn't '-ETIMEDOUT' or '-EIO' be more fitting after waiting for the
hardware to become ready?

>
>  	/* Restore LS2K BMC PCI-E config data */
>  	pci_write_config_dword(pdev, PCI_COMMAND, ddata->bmc_pci_data.pci_command);
> -- 
> 2.53.0
>
> -- 
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

-- 
Lee Jones
