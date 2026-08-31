Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93511241686;
	Mon, 31 Aug 2026 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171327; cv=none; b=W7/jgEjO+oxLUtMyxOBgAdBt7XbcXreTglgpT/sm8D+6L475o/kvgddMmTBuTFS5tWBYb3gatYSTMa9cXiGRydQLNMUCHpIwAvZW0yNbMS+5sqiZg+pMt90WN6jM7C6bWYFgrwDQGCOOoQafylMsuwUjsDgTssmInFXFidOzRv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171327; c=relaxed/simple;
	bh=IXG+GKUyyJjrxe9twLgNYgPzeEFT4c+gyE7g5/OFmDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWoWzg8oNuPKvHHai3Ukz7At0DYQJZGNFpqyxWrcFBZzwyT6m3qjgZLlW7do1WJdgVApwZ96ykqRj/cMxGvH5Hl9SPCyNmzSkTnxTxt2MhYNPd7j86emkRDN/CqyIlo+Lc01+30RohJLGfjBZspHqICcV8nHrnm+f5VYdo/n6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhuP+gAq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhuP+gAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788171325; x=1819707325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IXG+GKUyyJjrxe9twLgNYgPzeEFT4c+gyE7g5/OFmDw=;
  b=JhuP+gAqMi83crVfRPjw1hn5BktkI9EQVoWVu9wawSbnH/NyDlhdyOb0
   95ZGYEZp38QeSf4rY+afLL04PH4PHZKPZlebi+UPdGApHkkLfIYGkUkp0
   Cxk0cEco2DrmsW8za8c64BSRFwkJCPQTBKxD6clKtI5zXIHzgDVBU8odo
   oiz3x4fP6cCxxuqfN4MhqPlydNJBRz6DNr7EEwO9nKhb2Otcjhw7KD8Mg
   QxyuBrfwekbaULGc0oeV+Mfk4nd2XlImb+1h52vmPQ3A7wpZIEdiMjXtJ
   wGzluOYtucnpt3RmNFgb+TajmCxiSnepXbYExHZmp3tfwmHMwEmeFbh85
   w==;
X-CSE-ConnectionGUID: BGwg7DYbShmzOGdKc4coeA==
X-CSE-MsgGUID: YFm8US73TU2WInn26lbALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99238311"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99238311"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:15:24 -0700
X-CSE-ConnectionGUID: RuryocMyTQ6u3/7Updke9Q==
X-CSE-MsgGUID: /tD+9s2cTDSJppAAFmHccQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292261761"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2026 03:15:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id A00F499; Mon, 31 Aug 2026 12:15:21 +0200 (CEST)
Date: Mon, 31 Aug 2026 12:15:21 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Bartz <alex@alstergee.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: do not register UCSI on Lenovo
 Legion Pro 7 16IAX10H
Message-ID: <apVUOYIMOMBVpXWB@black.igk.intel.com>
References: <20260826034658.2170407-1-huangwei@kylinos.cn>
 <20260826133118.3327816-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826133118.3327816-1-huangwei@kylinos.cn>

On Wed, Aug 26, 2026 at 09:31:18PM +0800, Huang Wei wrote:
> The EC firmware of the Lenovo Legion Pro 7 16IAX10H (DMI product name
> 83F5) has a broken UCSI implementation: GET_PDOS returns no source
> capabilities, GET_CONNECTOR_STATUS reports an incomplete RDO, and any
> UCSI traffic disturbs the EC's autonomous USB-C Power Delivery
> negotiation. With ucsi_acpi bound, chargers connect only briefly and
> then drop, and voltage_now reads 0; with the driver blacklisted, the
> EC negotiates full PD contracts on its own and charging works normally.
> 
> The problem is unaffected by BIOS updates up to Q7CN78WW (2026-04).
> The AMD sibling Legion Pro 7 16AFR10H (product name 83RU) reportedly
> uses the same EC firmware, but it is left out of the quirk until the
> failure is confirmed on that model.
> 
> Skip probe on this machine, which is equivalent to the blacklist
> workaround the reporter verified to restore charging.
> 
> Reported-by: Alex Bartz <alex@alstergee.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221142
> Tested-by: Alex Bartz <alex@alstergee.com>
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>

I'm not sure about the dev_info message. Otherwise this is good:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Add Tested-by tag from Alex Bartz, who verified the quirk on his
>   machine (out-of-tree build, runtime module swap, PD charging held
>   across the reload).
> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 18286d3e9cc5..9f36f8cfce4a 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -173,6 +173,21 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
>  	{ }
>  };
>  
> +/*
> + * Platforms with a completely broken UCSI implementation in firmware.
> + * Do not register UCSI at all on these machines.
> + */
> +static const struct dmi_system_id ucsi_acpi_ignore[] = {
> +	{
> +		/* Lenovo Legion Pro 7 16IAX10H: broken EC UCSI firmware */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
>  {
>  	struct ucsi_acpi *ua = data;
> @@ -199,6 +214,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
>  	if (adev->dep_unmet)
>  		return -EPROBE_DEFER;
>  
> +	if (dmi_check_system(ucsi_acpi_ignore)) {
> +		dev_info(&pdev->dev,
> +			 "UCSI implementation in firmware is broken, ignoring\n");
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
