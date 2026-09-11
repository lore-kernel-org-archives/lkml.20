Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E1642E8DC;
	Fri, 11 Sep 2026 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125135; cv=none; b=Vf2GOI5jt26zJQwhLOnYjw+mw2M3rM4fJecH9C3moLfZtrujdisoMlMrxSVh4DZHjOBVn6TPK6k/2ahGRAdVFPd2fdtTldRx4W4jN7f/as8uNMbvk/5Ao9us6v4sG4sL3sfSXr8HgYzP04eWJGt70sXGnmnybfh38Bsyphxa5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125135; c=relaxed/simple;
	bh=hBIuk1LuvXOzzNpwC6P/xmvJnP8c4FVBB7STCewnrEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdpEONwg/6Lp9GAMcOHkLI2qDGRCUm4/aZUG7uAhTn6vldUTX9S3YKp6vGIT7hVoJEb05wxmNJa7FucvfLbEANGrqFrkYHO4s7P2rpgRRAO0dlmRejYxMihfvYKICJOjogmrN2e+n1XyAtRC3Lkh9hsb/kVg43SGHStqD0QAZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZ0P1Wow; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZ0P1Wow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125131; x=1820661131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hBIuk1LuvXOzzNpwC6P/xmvJnP8c4FVBB7STCewnrEA=;
  b=ZZ0P1Wow2nLJU1bx2/BfBgIIsR88s5BzdMBFQu2TQ04vMdeWqROT0qrT
   oDDtXXNpiy0YCBhY8AM87xzWxB/sHIfZiqeRZh3Y7ZevgreLUwbYIDEHP
   YzVPqUEthRUIWxFykRKsVTo22Na3VOAXWiZ6xoDW/qZYREwVGjBLWHzeV
   s4oSlIw9Enb7DfjoN+g1andU0KgakI26Hfrc6Yd6tOhSqD3kBpc4bRDwZ
   ZRbnm0nDMEvmEoiFs7EqjtCdRgXJXgOKdU10b5Z2Mut/0zCjnGszbqy2F
   0YHZsHZoKCxdkaDa0WbBOCZ1TB/WS4S1kpGXvyLwGlIbZlg5WIcq1fVwB
   g==;
X-CSE-ConnectionGUID: ls72ydMXSuyZY02YSGjqtg==
X-CSE-MsgGUID: wIj4hgNwTN+Ua8ykQtviYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89716208"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89716208"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:12:06 -0700
X-CSE-ConnectionGUID: W5nQ0RYeR7eUGNamAG4/DA==
X-CSE-MsgGUID: s7r2QSHYSUyV/bXw2HoeYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="272396366"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 11 Sep 2026 04:12:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 01A6699; Fri, 11 Sep 2026 13:12:03 +0200 (CEST)
Date: Fri, 11 Sep 2026 13:12:03 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pannarat Wiriyaarritham <pannarat.wiriyaarritham@danielcorp.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro
 ANV15-41
Message-ID: <aqPiAwbVWQ1Owwdy@black.igk.intel.com>
References: <20260910023338.31816-1-pannarat.wiriyaarritham@danielcorp.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910023338.31816-1-pannarat.wiriyaarritham@danielcorp.dev>

On Thu, Sep 10, 2026 at 09:33:37AM +0700, Pannarat Wiriyaarritham wrote:
> The Acer Nitro ANV15-41 exposes a functional UCSI ACPI PPM but
> reports a UCSI VERSION value of zero.
> 
> ucsi_register() rejects a zero version with -ENODEV, leaving the
> system without registered USB Type-C connectors.
> 
> The PPM works correctly when using the UCSI 1.2 layout. With UCSI
> 1.2 assumed, both Type-C connectors register correctly and USB Power
> Delivery negotiation works.
> 
> Add a DMI-specific UCSI operation for the Acer Nitro ANV15-41 that
> substitutes UCSI 1.2 only when firmware reports a zero version.
> Preserve any valid non-zero firmware version.
> 
> Tested on an Acer Nitro ANV15-41 with BIOS V1.51.
> 
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Pannarat Wiriyaarritham <pannarat.wiriyaarritham@danielcorp.dev>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 34 ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 18286d3e9..5697ccc24 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -121,6 +121,33 @@ static const struct ucsi_operations ucsi_acpi_ops = {
>  	.async_control = ucsi_acpi_async_control
>  };
>  
> +static int ucsi_acer_read_version(struct ucsi *ucsi, u16 *version)
> +{
> +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> +	int ret;
> +
> +	ret = ucsi_acpi_read_version(ucsi, version);
> +	if (ret)
> +		return ret;
> +
> +	if (!*version) {
> +		dev_warn(ua->dev, "UCSI version is zero, assuming 1.2\n");
> +		*version = UCSI_VERSION_1_2;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct ucsi_operations ucsi_acer_ops = {
> +	.read_version = ucsi_acer_read_version,
> +	.read_cci = ucsi_acpi_read_cci,
> +	.poll_cci = ucsi_acpi_poll_cci,
> +	.read_message_in = ucsi_acpi_read_message_in,
> +	.write_message_out = ucsi_acpi_write_message_out,
> +	.sync_control = ucsi_sync_control_common,
> +	.async_control = ucsi_acpi_async_control
> +};
> +
>  static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
>  				  void *val, size_t len, void *msg_out,
>  				  size_t msg_out_size)
> @@ -162,6 +189,13 @@ static const struct ucsi_operations ucsi_gram_ops = {
>  };
>  
>  static const struct dmi_system_id ucsi_acpi_quirks[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
> +		},
> +		.driver_data = (void *)&ucsi_acer_ops,
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
> -- 
> 2.55.0

-- 
heikki
