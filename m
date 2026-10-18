Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ACB2836F;
	Sun, 18 Oct 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355736; cv=none; b=o6rmY99DmbLJ4k+Hrae6E5nPE22lM76Y6cqtcNpidjifPcNj0oZNQT9YW+YRoGiH3eASBwRa+dhSBt25WRHwc4dm65nngpehJoB/dQzfc3e+l6zh5b1Yf3O6SeysWINKAVHrNrNl3yB7mU/7W4/Un3LOK9pyIjn9+j5sOupZ0Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355736; c=relaxed/simple;
	bh=SclcYBZPUU5rwsTipGUDYC7OlOe/UT+RSTp/C4qQffw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSeDlLRAuguln7Qbq1Tpgo16mefIw6oEtSs/8a+T87Vq3eMr/yjDwfn99mK6dL5l6MyYw6tvd+kL0J/NcyDF/WAXgXP4gJkVcabtvjLTy2MPuokmm3sIB+WS+ks/MevZysMSl5oqH3NGBiLVhhQWk0FSAKlScr9ZqJZgWUZWvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ActKFuNS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ActKFuNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792355734; x=1823891734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SclcYBZPUU5rwsTipGUDYC7OlOe/UT+RSTp/C4qQffw=;
  b=ActKFuNSw4n/X18IKx6xKIG1ESkyFYFNa0pGioFW7ZK8EGe3nGuWulro
   4AddYNY72E9UjeLMj+OIKnnpyPKIbqFvyHYK/nYTub0uhyGetL6wK6V7C
   P8KBgt9qYMEkp3/RFVLFdoLHXjlHtpSu+Ojfiw3BTFpGemqu9MZJji4W+
   Ns+aYqVrcf9UpOyg4XJgWo2nO0swAn9JE/LQPayiO/nroRjLzH5Fges0b
   pqbMgIcENKDZQlLETFsc0ohe+cVzpo/cALorUgMpTgvUWOOSoB4rnKm/W
   iWiQWg//hglGBxcfoTYooorUD6obL71nY3JBFZfgTYJdJ2EF23EWesa2z
   A==;
X-CSE-ConnectionGUID: rW7OkhphT0CPEP7X3wv7MA==
X-CSE-MsgGUID: F27JN/bNTK2lDSBKHfK37w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="932164"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="932164"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 13:35:33 -0700
X-CSE-ConnectionGUID: K7suMM8QTOGVG0Pu0sL8dw==
X-CSE-MsgGUID: ZJKR/4szToin6jrlrfogoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4211004"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 13:35:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 670211203AA;
	Sun, 18 Oct 2026 23:35:37 +0300 (EEST)
Date: Sun, 18 Oct 2026 23:35:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: geocausa@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov13858: Add device tree support
Message-ID: <atUtmQzZ_KWVcIJl@kekkonen.localdomain>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
 <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com>

Hi George,

On Thu, Oct 15, 2026 at 10:48:20PM +0100, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The rear camera of the Surface Pro 11 with a Snapdragon X Elite is an
> OV13858 on a four-lane D-PHY link, described in the device tree. Add an
> OF match table.
> 
> Parse the endpoint as other sensor drivers that serve both ACPI and DT
> do. Wait for the endpoint if a bridge driver has not created it yet,
> require four data lanes, and require both link frequencies, since the
> modes switch between 540 and 270 MHz. The IPU bridge entry for OVTID858
> lists both, so an ACPI machine with that entry probes as before. Without
> the entry the sensor now waits for the bridge instead of probing into an
> empty graph.
> 
> Tested on the Surface Pro 11 (X1E80100), with an out-of-tree CAMSS
> capturing raw frames over CSIPHY1, CSID0 and an RDI interface:
> 4224x3136 at 29.95 fps at 540 MHz, the colour-bar test pattern intact,
> and a scene captures.

Please describe what the patch does here. Nearly everything above should go
to the cover letter.

> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>  drivers/media/i2c/ov13858.c | 62 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
> index 83eefba..587ee38 100644
> --- a/drivers/media/i2c/ov13858.c
> +++ b/drivers/media/i2c/ov13858.c
> @@ -1713,6 +1713,57 @@ static int ov13858_power_off(struct device *dev)
>  static DEFINE_RUNTIME_DEV_PM_OPS(ov13858_pm_ops, ov13858_power_off,
>  				 ov13858_power_on, NULL);
>  
> +static int ov13858_check_hwcfg(struct device *dev)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	unsigned long link_freq_bitmap;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver.
> +	 * Bridge drivers doing this also add sensor properties, wait for this.
> +	 */
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> +	if (!ep)

You can omit this check -- v4l2_fwnode_endpoint_alloc_parse() does it.

> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "%u data lanes are not supported, only 4\n",
> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		goto out;
> +	}
> +
> +	/* The modes use both link frequencies, so both have to be allowed. */
> +	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +	if (ret)
> +		goto out;
> +
> +	if (link_freq_bitmap != GENMASK(ARRAY_SIZE(link_freq_menu_items) - 1, 0))
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "link frequencies %lld and %lld are both needed\n",
> +				    link_freq_menu_items[1]);
> +
> +out:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
>  static int ov13858_probe(struct i2c_client *client)
>  {
>  	struct ov13858 *ov13858;
> @@ -1725,6 +1776,10 @@ static int ov13858_probe(struct i2c_client *client)
>  
>  	ov13858->dev = &client->dev;
>  
> +	ret = ov13858_check_hwcfg(ov13858->dev);
> +	if (ret)
> +		return ret;
> +
>  	ov13858->clk = devm_v4l2_sensor_clk_get(ov13858->dev, NULL);
>  	if (IS_ERR(ov13858->clk))
>  		return dev_err_probe(ov13858->dev, PTR_ERR(ov13858->clk),
> @@ -1845,10 +1900,17 @@ static const struct acpi_device_id ov13858_acpi_ids[] = {
>  MODULE_DEVICE_TABLE(acpi, ov13858_acpi_ids);
>  #endif
>  
> +static const struct of_device_id ov13858_of_match[] = {
> +	{ .compatible = "ovti,ov13858" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov13858_of_match);
> +
>  static struct i2c_driver ov13858_i2c_driver = {
>  	.driver = {
>  		.name = "ov13858",
>  		.acpi_match_table = ACPI_PTR(ov13858_acpi_ids),
> +		.of_match_table = ov13858_of_match,
>  		.pm = pm_ptr(&ov13858_pm_ops),
>  	},
>  	.probe = ov13858_probe,
> 

-- 
Regards,

Sakari Ailus
