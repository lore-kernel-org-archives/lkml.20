Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0E244E64A;
	Mon,  7 Sep 2026 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777246; cv=none; b=tDAajxXSpKEst7kTarrN4H1b1f2zUUmob1gLapqzR1KpIcP3HUiI/ulM5+nT4R/zphVvpvJUeRGkRukPZ1b518bw5tqo4vIyXBswgnY4JePDpHew40kRb6j+7r4lU0/dBmh5WzPgZXijqqiPyXX7nLVMkZq0iBZwemN4VvIDbzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777246; c=relaxed/simple;
	bh=3cPmyVolUVKKcMKyHEbIzIHCelurjUCy03RhElvfnbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxdTXxf2yACLJyieNiih/1XXrOW6biYPDXE9T3u/H0uWi35SnGeNNtReXJbn+2i1sLFiN6X98DdG/vpPCxx/LgFy9dYLdTVAAzNr0oV/rDinCT+7+e7Q7YoCJDAnGtosUTLMkWTXKTIutw/BapgGXZtrfRPEL5iatooL+CDAahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYb/zd2O; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYb/zd2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788777244; x=1820313244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3cPmyVolUVKKcMKyHEbIzIHCelurjUCy03RhElvfnbY=;
  b=kYb/zd2O2lEmYfjM1shegvV7xtEh0aPGaqYwv22L570TPiwEerxCMon4
   xYW5hQjJX+pNhXmt0+miKAx7NznTfj0s7bXkCfSf/yP60lMcJHHTCT4QW
   4tycH9Yykz4ULYqXwnOehDLK0f5P4pjPBy/RAWbbtVsOBe0FVOO5Un1jp
   uzMc6wJ/VioNy/NRiLp1wEOPks0/Z0P+rOptX4sLLyFlQ0olLMH0l15J5
   bpQQdg9Z0aL1tinEeGl073cUUJEfphShK6hVOA6V++e35t8QS/EGEDtsG
   4HYB3qphrmhOZ2mtwAP0jOqbgNNHoF90M/eEAlAWC8s1UsThknBrSAhCl
   g==;
X-CSE-ConnectionGUID: iNlrTn5VSO+qc8fuwybdMw==
X-CSE-MsgGUID: ZaaIfOmXTjmXLiaQG5QOJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106547735"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="106547735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 03:34:03 -0700
X-CSE-ConnectionGUID: PbfNLXK3QKWjpMe8KvISFA==
X-CSE-MsgGUID: ySZzf8TETXujOVeH/f2kZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="308906537"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:34:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 547E499; Mon, 07 Sep 2026 12:34:01 +0200 (CEST)
Date: Mon, 7 Sep 2026 12:34:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Bartz <alex@alstergee.com>
Subject: Re: [PATCH v3] usb: typec: ucsi: do not register UCSI on Lenovo
 Legion Pro 7 16IAX10H
Message-ID: <ap6TGRUl_PzUU512@black.igk.intel.com>
References: <20260826133118.3327816-1-huangwei@kylinos.cn>
 <20260902090531.2134150-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902090531.2134150-1-huangwei@kylinos.cn>

On Wed, Sep 02, 2026 at 05:05:31PM +0800, Huang Wei wrote:
> The EC firmware of the Lenovo Legion Pro 7 16IAX10H (DMI product name
> 83F5) has a broken UCSI implementation: GET_PDOS returns no source
> capabilities, GET_CONNECTOR_STATUS reports an incomplete RDO, and any
> UCSI traffic disturbs the EC's autonomous USB-C Power Delivery
> negotiation. With ucsi_acpi bound, chargers connect only briefly and
> then drop, and voltage_now reads 0; with the driver blacklisted, the
> EC negotiates full PD contracts on its own and charging works normally.
> 
> The reporter confirmed the issue on BIOS versions Q7CN44WW and
> Q7CN78WW (2026-04); it is unaffected by the BIOS update between them.
> The AMD sibling Legion Pro 7 16AFR10H (product name 83RU) reportedly
> uses the same EC firmware, but it is left out of the quirk until the
> failure is confirmed on that model.
> 
> Skip probe on machines carrying the known-broken BIOS versions, which
> is equivalent to the blacklist workaround the reporter verified to
> restore charging. Matching the specific BIOS versions rather than the
> whole platform ensures that a future firmware that fixes UCSI is not
> wrongly skipped.
> 
> Reported-by: Alex Bartz <alex@alstergee.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221142
> Tested-by: Alex Bartz <alex@alstergee.com>
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Add Tested-by tag from Alex Bartz, who verified the quirk on his
>   machine (out-of-tree build, runtime module swap, PD charging held
>   across the reload).
> 
> Changes in v3:
> - Use dev_err() instead of dev_info() for the skip message, per Greg
>   Kroah-Hartman and Heikki Krogerus, so the issue stays visible until
>   the firmware is fixed.
> - Scope the quirk to the BIOS versions confirmed broken (Q7CN44WW,
>   Q7CN78WW) instead of the whole platform, per Greg Kroah-Hartman, so
>   a future firmware that fixes UCSI is not wrongly skipped. New broken
>   versions can be added to the table as they are confirmed.
> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 18286d3e9cc5..2708b5f90718 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -173,6 +173,35 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
>  	{ }
>  };
>  
> +/*
> + * Platforms with a completely broken UCSI implementation in firmware.
> + * Do not register UCSI at all on these machines.
> + *
> + * The Lenovo Legion Pro 7 16IAX10H (DMI product name 83F5) carries
> + * broken UCSI firmware in BIOS versions Q7CN44WW and Q7CN78WW; the
> + * reporter confirmed the issue is unaffected by the BIOS update
> + * between them. Match only the BIOS versions known to be broken so
> + * that a future firmware that fixes UCSI is not wrongly skipped; add
> + * new versions here as they are confirmed.
> + */
> +static const struct dmi_system_id ucsi_acpi_ignore[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "Q7CN44WW"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "Q7CN78WW"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
>  {
>  	struct ucsi_acpi *ua = data;
> @@ -199,6 +228,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
>  	if (adev->dep_unmet)
>  		return -EPROBE_DEFER;
>  
> +	if (dmi_check_system(ucsi_acpi_ignore)) {
> +		dev_err(&pdev->dev,
> +			"UCSI implementation in firmware is broken, ignoring\n");
> +		return -ENODEV;
> +	}
> +
>  	ua = devm_kzalloc(&pdev->dev, sizeof(*ua), GFP_KERNEL);
>  	if (!ua)
>  		return -ENOMEM;
> -- 
> 2.25.1

-- 
heikki
