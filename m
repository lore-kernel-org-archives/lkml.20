Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235447989F;
	Thu, 27 Aug 2026 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840807; cv=none; b=TDuMMM7j+QEbBEasyXC9KsmlJH6QGV28Fi/9fdzdluLXUK4J0x+HqJ7goYh/sQcwEzmRpylcr7RIMLyZ1pcX7kcwV1knBVaJHvSjtl+OMGc8yLI+rgcUJMHxYm6QMoplWPDCgWSXRo/R9kyUFYxvZMIUIKoOC06ZI5KVYLuewSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840807; c=relaxed/simple;
	bh=Ru0l4PHF29l4rw7OpPV0iZi7pIsMNwPPPjv9m9TfRP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LroYVHSd62kdImubGG/CydeM0zmA7vpipb1+knuPHtFsxP+R00Qa5ToZEfY1o1OP7hv/QUdwuV8p9/k/0BMkDPRZwJJszvSyPqNfCaKVdeBi+Nh2I2otRfHYAhNdhFEc7/wEQBHdqPtV0a2DDeQhAjHVB0h4ohb9NZzwY7l7l50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVCPfSYR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVCPfSYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787840804; x=1819376804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ru0l4PHF29l4rw7OpPV0iZi7pIsMNwPPPjv9m9TfRP8=;
  b=HVCPfSYRXj7nD4pC4wm1ujRw12UfdRcCNf9lghZLfRjHKJdL2AHIW19N
   K/PMojp8BKwmF1Nsy6PZxBSHOZRQFTAVDdBjf4A1I1/jkm9XkInFjXPhT
   wuWFIJcsKkbzEFF47V/SpH9tLBDApVeIadIaSxHlxQqcTwvw7m9qypEba
   l9xWDqnxVcGsdUDByk4H4b5KodfBqAlAbzfnlQzOUHxiwWnDj9zN/j7d2
   pZS+B3ftBMitxsNrky/Z9igygEJEQ0sI7cJwIMMvYGE2xpvImhf2JLYUM
   D1c8SuYPZUei6GJwFmaf8rQqw3lIgnEQfUfG7wNZmzEG3XYIkBJurXI71
   Q==;
X-CSE-ConnectionGUID: tWAZJASkTOK3tAbibrHUYA==
X-CSE-MsgGUID: 91QHePESRTi2kOSMjFZgTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105715805"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="105715805"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:26:42 -0700
X-CSE-ConnectionGUID: 0vje0uXgSgy3e1cb8o6J7Q==
X-CSE-MsgGUID: X/IGFMJLQuGDU+4330Sx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="265302616"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 07:26:39 -0700
Date: Thu, 27 Aug 2026 17:26:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] media: atomisp: support the Yoga Book OV2740 link
Message-ID: <apBJHHhAPowUs8Kj@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-6-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826132256.3343451-6-mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 03:22:53PM +0200, Maurizio Casciano wrote:
> The YB1-X91L firmware does not describe the complete camera link. Its
> front OV2740 uses two CSI-2 lanes at a 288 MHz link frequency and sends
> a 1932x1092 BGGR transport frame with 12 pixels of horizontal and
> vertical padding around the 1920x1080 image.
> 
> Allow the AtomISP bridge to provide per-sensor link frequencies and
> padding, add the matching OV2740 mode, and derive ISP2401 D-PHY timing
> from the sensor link-frequency control.
> 
> The register values are hardware configuration facts checked against
> the Lenovo YB1-X91L configuration and physical captures; no proprietary
> driver code or tuning binary is included.
> 
> Tested on a Lenovo Yoga Book YB1-X91L with continuous front-camera raw
> capture.

...

>  #define OV2740_LINK_FREQ_360MHZ		360000000ULL
> +#define OV2740_LINK_FREQ_288MHZ		288000000ULL
>  #define OV2740_LINK_FREQ_180MHZ		180000000ULL

At some point would be good to use HZ_PER_MHZ multiplier from units.h.

...

> struct ov2740_mode {

>  	/* Link frequency needed for this resolution */
>  	u32 link_freq_index;
>  
> +	/* Optional common settings applied before the mode-specific settings */
> +	const struct ov2740_reg_list init_reg_list;
> +
>  	/* Sensor register settings for this resolution */
>  	const struct ov2740_reg_list reg_list;
> +
> +	/* Bayer order produced by this mode */
> +	u32 code;

Check with `pahole`.

>  };

...

> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
>  					sensor->prop_names.remote_endpoint,
>  					sensor->local_ref);
>  
> -	if (cfg->nr_link_freqs > 0)
> -		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
> -			sensor->prop_names.link_frequencies,
> -			cfg->link_freqs,
> -			cfg->nr_link_freqs);
> +	if (sensor->nr_link_freqs > 0)
> +		sensor->ep_properties[3] =
> +			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
> +						     sensor->link_freqs,
> +						     sensor->nr_link_freqs);
> +	else if (cfg->nr_link_freqs > 0)
> +		sensor->ep_properties[3] =
> +			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
> +						     cfg->link_freqs,
> +						     cfg->nr_link_freqs);

Why do we need this? The sensors are listed in the supported ones in the IPU
bridge code. Also, if required, some data can be altered by using driver_data
field in ACPI ID table.

...

> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h

>  int atomisp_csi2_bridge_init(struct atomisp_device *isp);
>  int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp);
> +bool atomisp_csi2_get_sensor_padding(struct device *dev, u32 *padding_w,
> +				     u32 *padding_h);

Better to split logically.

bool atomisp_csi2_get_sensor_padding(struct device *dev,
				     u32 *padding_w, u32 *padding_h);

>  void atomisp_csi2_configure(struct atomisp_sub_device *asd);

...

> +bool atomisp_csi2_get_sensor_padding(struct device *dev, u32 *padding_w,
> +				     u32 *padding_h)
> +{

Ditto.

> +	struct acpi_device *adev = ACPI_COMPANION(dev);

Split the assignment. The current way is prone to subtle mistakes in the
future.

> +	bool override = false;
> +	char *str_val;
> +	unsigned int val;

Try to use reversed xmas tree order.

> +	*padding_w = pad_w;
> +	*padding_h = pad_h;

	adev = ACPI_COMPANION(dev);

> +	if (!adev)
> +		return false;
> +
> +	str_val = gmin_cfg_get(adev, "CsiPaddingWidth");
> +	if (str_val) {
> +		if (!kstrtouint(str_val, 0, &val) && val <= 64 && !(val & 1)) {
> +			*padding_w = val;
> +			override = true;
> +		} else {
> +			acpi_handle_warn(adev->handle,
> +					 "%s: Invalid CSI padding width %s\n",
> +					 dev_name(dev), str_val);
> +		}
> +		kfree(str_val);
> +	}
> +
> +	str_val = gmin_cfg_get(adev, "CsiPaddingHeight");
> +	if (str_val) {
> +		if (!kstrtouint(str_val, 0, &val) && val <= 64 && !(val & 1)) {
> +			*padding_h = val;
> +			override = true;
> +		} else {
> +			acpi_handle_warn(adev->handle,
> +					 "%s: Invalid CSI padding height %s\n",
> +					 dev_name(dev), str_val);
> +		}
> +		kfree(str_val);
> +	}

This is dup of the code, please create a helper to deduplicate these.
Also, what's wrong with gmin_cfg_get_int()?

> +	return override;
> +}

...

>  {
>  	const struct acpi_device_id *id;
> +	char *link_freq_str;
> +	unsigned long long link_freq;

Reversed xmas tree order.

>  	int ret, clock_num;
>  	bool vcm = false;
>  	int lanes = 1;

...

> +	link_freq_str = gmin_cfg_get(adev, "CsiLinkFreq");
> +	if (link_freq_str) {
> +		ret = kstrtoull(link_freq_str, 0, &link_freq);
> +		kfree(link_freq_str);
> +		if (ret || !link_freq) {
> +			acpi_handle_err(adev->handle,
> +					"%s: Invalid CSI link frequency\n",
> +					dev_name(&adev->dev));
> +			return ret ?: -EINVAL;
> +		}

gmin_cfg_get_int()

> +		sensor->link_freqs[0] = link_freq;
> +		sensor->nr_link_freqs = 1;
> +	}

-- 
With Best Regards,
Andy Shevchenko


