Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024B74C14;
	Wed,  2 Sep 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331350; cv=none; b=o7eD+9skS5Zgh9cioLhwTVsieWMbTTy0TGIPTwJiPbXdyzcTlfIoQ8aYoRH1iIZkmjKcN2QknRPskmPJ/eSyegmTIWh544MLmGCbKGybiRIa03cPlxS2hf7LN4gNWVeDukIp9OaTHTJ+PvTQ0lh0Bd2/BjeYsfCpqBBMGyx++Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331350; c=relaxed/simple;
	bh=amqDykEJ+YIOzWDmfKdiUT8HOxd9fxxWFi/81ysfLMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qr25Ie/SJeh57rmWSH/SE2IaUJe8S4g6lAhjRNZP09HMwTQh4kBUKGBPH0N19WDEefWys3DAOOXP8NmYoI7v44Y54H2rCxmwNxCpJAl/0nNGbhD/NisWO6VsTvHmKLzA3nII5CXdISq5M6hvxiZDkMPaleyB579N+RJHfRHG7YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bd7phMYn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bd7phMYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788331348; x=1819867348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amqDykEJ+YIOzWDmfKdiUT8HOxd9fxxWFi/81ysfLMo=;
  b=bd7phMYnnEUkCCpQyfHbiaIPtGkjZIt8Mm+/2CMvE06Z2N8YCg1OWlgO
   m9bGMskA3gzdkNItLPCTGhdI8puhhQQSBan2xdyYQu6RtIGXHjvTCGgkB
   yzlhQpZGfqjVbdPt/NlBwcxfcinCW+CHAQ28umsRto0Uoi/pDM8iCjIOT
   B+l8ax7wxGTzNi1gfJOd0GQWAjcMLmlwWJPrKY6BhuEcelhA+GHSRk9S1
   Av8jc0EOn8RbDhFM/5gKu5h5elmkPmrHMnR5zM1qAjU8QflTneIEjgQn2
   NQ5yAJufo6YXyHbYCEYHYetCWIoFDnt02P7lugjbn3kEVrp2ogsvWE69+
   g==;
X-CSE-ConnectionGUID: rT0DEzr+QjKxsf+XC5DvWw==
X-CSE-MsgGUID: RjsXAcKwS+6LLbksemQeuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88705286"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88705286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:42:27 -0700
X-CSE-ConnectionGUID: Dc0hfOE7Q3WuPNA7jhALHw==
X-CSE-MsgGUID: ic/NZeeKSNGFfzUEwnRo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266079584"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:42:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 227B01218BD;
	Wed, 02 Sep 2026 09:42:22 +0300 (EEST)
Date: Wed, 2 Sep 2026 09:42:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: ipu-bridge: Match sensor configs per IPU
 and add config flags
Message-ID: <apfFTqPGCUB1m--R@kekkonen.localdomain>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-6-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831181858.325109-6-fernandorimoli11@gmail.com>

Hi Fernando,

On Mon, Aug 31, 2026 at 08:18:57PM +0200, Fernando Rimoli wrote:
> Some sensors need different treatment depending on which IPU they are
> connected to, so the sensor's ACPI HID alone is not always enough to
> describe what the bridge has to set up.
> 
> Add an optional IPU PCI product ID and a set of flags to struct
> ipu_sensor_config, along with an IPU_SENSOR_CONFIG_MATCH_FL() macro to
> define such an entry. A config naming a PCI product ID only applies to
> that IPU and takes precedence over a generic config for the same sensor,
> so that a sensor covered by both is connected once, through the more
> specific entry. Existing entries are unchanged and keep matching any IPU.
> 
> No flags are defined yet and no entry uses the new macro, so there is no
> functional change.

There's quite a bit of irrelevant information here.

> 
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 31 ++++++++++++++++++++++++++++
>  include/media/ipu-bridge.h           | 29 +++++++++++++++++++++-----
>  2 files changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index cd3c36d44..38ad3e54e 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -8,6 +8,7 @@
>  #include <linux/dmi.h>
>  #include <linux/i2c.h>
>  #include <linux/mei_cl_bus.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -853,6 +854,32 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
>  	return ret;
>  }
>  
> +/*
> + * Whether a sensor config applies to the IPU the bridge sits on. A config
> + * naming a PCI product ID only applies to that IPU, and takes precedence over
> + * a generic config for the same sensor, which is skipped so that the sensor is
> + * not connected twice.
> + */
> +static bool ipu_bridge_config_matches(const struct ipu_sensor_config *cfg,
> +				      struct ipu_bridge *bridge)
> +{
> +	unsigned int i;
> +
> +	if (cfg->pci_id)
> +		return cfg->pci_id == bridge->pci_id;
> +
> +	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {

Is there really a need to go through the entire array for each entry? Can't
you simply arrange the entries with a pci_id before the generic one?

> +		const struct ipu_sensor_config *sp =
> +			&ipu_supported_sensors[i];
> +
> +		if (sp->pci_id && sp->pci_id == bridge->pci_id &&
> +		    !strcmp(sp->hid, cfg->hid))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
>  {
>  	unsigned int i;
> @@ -862,6 +889,9 @@ static int ipu_bridge_connect_sensors(struct ipu_bridge *bridge)
>  		const struct ipu_sensor_config *cfg =
>  			&ipu_supported_sensors[i];
>  
> +		if (!ipu_bridge_config_matches(cfg, bridge))
> +			continue;
> +
>  		ret = ipu_bridge_connect_sensor(cfg, bridge);
>  		if (ret)
>  			goto err_unregister_sensors;
> @@ -948,6 +978,7 @@ int ipu_bridge_init(struct device *dev,
>  		sizeof(bridge->ipu_node_name));
>  	bridge->ipu_hid_node.name = bridge->ipu_node_name;
>  	bridge->dev = dev;
> +	bridge->pci_id = dev_is_pci(dev) ? to_pci_dev(dev)->device : 0;
>  	bridge->parse_sensor_fwnode = parse_sensor_fwnode;
>  
>  	ret = software_node_register(&bridge->ipu_hid_node);
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 61e10cef1..d12e51336 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -17,13 +17,27 @@
>  #define IPU_SENSOR_ROTATION_NORMAL		0
>  #define IPU_SENSOR_ROTATION_INVERTED		1
>  
> -#define IPU_SENSOR_CONFIG(_HID, _NR, ...)	\
> -	(const struct ipu_sensor_config) {	\
> -		.hid = _HID,			\
> -		.nr_link_freqs = _NR,		\
> -		.link_freqs = { __VA_ARGS__ }	\
> +/* Flags for struct ipu_sensor_config */
> +#define IPU_BR_FL_NONE				0
> +
> +/*
> + * Sensor config specific to a single IPU, identified by its PCI product ID,
> + * with flags describing what the sensor needs on that IPU. Where both a
> + * specific and a generic (IPU_SENSOR_CONFIG) entry exist for the same HID,
> + * the specific one takes precedence.
> + */
> +#define IPU_SENSOR_CONFIG_MATCH_FL(_HID, _ID, _FLAGS, _NR, ...)	\
> +	(const struct ipu_sensor_config) {			\
> +		.hid = _HID,					\
> +		.pci_id = _ID,					\
> +		.flags = IPU_BR_FL_##_FLAGS,			\

Please don't assume a flag; setting multiple flags also doesn't work this
way.

> +		.nr_link_freqs = _NR,				\
> +		.link_freqs = { __VA_ARGS__ }			\
>  	}
>  
> +#define IPU_SENSOR_CONFIG(_HID, _NR, ...)			\
> +	IPU_SENSOR_CONFIG_MATCH_FL(_HID, 0, NONE, _NR, __VA_ARGS__)
> +
>  #define NODE_SENSOR(_HID, _PROPS)		\
>  	(const struct software_node) {		\
>  		.name = _HID,			\
> @@ -132,6 +146,9 @@ struct ipu_node_names {
>  
>  struct ipu_sensor_config {
>  	const char *hid;
> +	/* IPU PCI product ID this config is specific to, 0 for any */
> +	const u16 pci_id;

In later patches we already get two extra entries per sensor that only
differ on pci_id. How about making this a pointer to an array? Zero
termination should be fine here.

> +	const u32 flags;
>  	const u8 nr_link_freqs;
>  	const u64 link_freqs[MAX_NUM_LINK_FREQS];
>  };
> @@ -177,6 +194,8 @@ typedef int (*ipu_parse_sensor_fwnode_t)(struct acpi_device *adev,
>  
>  struct ipu_bridge {
>  	struct device *dev;
> +	/* PCI product ID of the IPU, 0 if it is not a PCI device */

All IPUs are PCI devices. ipu_bridge_init() should fail if a device isn't.
I think I might just omit the check.

> +	u16 pci_id;
>  	ipu_parse_sensor_fwnode_t parse_sensor_fwnode;
>  	char ipu_node_name[ACPI_ID_LEN];
>  	struct software_node ipu_hid_node;

-- 
Regards,

Sakari Ailus
