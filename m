Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA90C30E85B;
	Wed,  2 Sep 2026 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330847; cv=none; b=MNwqFvFaxucUOVNgzgp84qtB8W0MkxnC7Mm+BB8RtTqiy5prVMD1v6/LkScHpy3JHKwEw6vMYxCQLDHAihHG+PcXlRjHQyWRjl6/iQfkCHvr2VCLfaGOCaa9n88ciI9T20j/e+HH4fEHaNCWYMqLcSjyLcbUcc4CoUu84D39s8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330847; c=relaxed/simple;
	bh=AKLq68YAj8lKqvSaaTGme4OcVxvD+fATv3F5YN3d92o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quIOkfG7cEqJ0mIZnhq0BMtBuBVBPsWtMJyh4A+uHJf5F5ElSvUBsPS1ZHaKMhjPJvJ+DYWqzdnrDqUu4DFIVEmu0s/6bFwRvsrpLH7nkt/INa1gaR+33bea4gSaXBNHgfiQSDeCAzFaVKFFc0aQp+/Qf5VEnvQeVDv1B8B/BMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOgFBul3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOgFBul3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788330846; x=1819866846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AKLq68YAj8lKqvSaaTGme4OcVxvD+fATv3F5YN3d92o=;
  b=UOgFBul3B75phUCS69/mMD/coSOBGyH9p2N0ANCUVM9QeDq0l77onPsM
   jCmn+D/BwWi3Jo6iQFBljSPBuDVVOCKA0wurIUMCLPf7pbvqbohKExCRa
   NJAVRKRa8UsMOgJXkxZVsG9pxWuSpqYlb1UBquILbeHj8tIx6KtOvz/2p
   SBjtvJpezc93bJ4Ei1CR4m7XVNCRomqvHWOqLSmqfBAHhNZpHX6ER998Z
   O57ZWQoSvg/fi03LVI2EqyTV5JvMxMiefi/jflLaA+fs4ihWtuMPTtquj
   XYXhaAnaPAGTu10pqLDXm4ohwHpfsLnBLu0BzXUuK1VW2FFxE8RzvPlnC
   w==;
X-CSE-ConnectionGUID: MiKqaV5ySl6CTiXtFQrxQw==
X-CSE-MsgGUID: rvZNpiICTyy6YNAtmmJxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88655996"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88655996"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:34:05 -0700
X-CSE-ConnectionGUID: nIBMMWc5SGOUJl2GYpmYsQ==
X-CSE-MsgGUID: BJj39WtvQEWlHEqqY1GOtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="271283985"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 23:34:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B9B3F1218BD;
	Wed, 02 Sep 2026 09:33:59 +0300 (EEST)
Date: Wed, 2 Sep 2026 09:33:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: ipu-bridge: Assign endpoint property
 indices dynamically
Message-ID: <apfDVz8nQ43yEl6i@kekkonen.localdomain>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-5-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831181858.325109-5-fernandorimoli11@gmail.com>

On Mon, Aug 31, 2026 at 08:18:56PM +0200, Fernando Rimoli wrote:
> The endpoint property array is populated with hardcoded indices, so a
> property that is only set conditionally has to be placed at a fixed slot.
> As the array is NULL-terminated, such a property is silently dropped when
> an earlier optional slot is left empty: "link-frequencies" is skipped for
> configs with nr_link_freqs == 0, which would truncate the array before
> anything following it.
> 
> Name the endpoint property slots in an enum, size the array accordingly
> and assign the indices through a bounds-checked running index, as done
> for the MIPI DisCo for Imaging properties in mipi-disco-img.c. No
> functional change intended: the same properties are set in the same
> order.

There's a lot of unneeded information here. For simple patches like this
there's no need to go deep in details that can be easily seen from the
code. How about:

Index the ep_properties array dynamically instead of plain numerical values
as is done in mipi-disco-img.c.

> 
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 27 ++++++++++++++-------------
>  include/media/ipu-bridge.h           | 19 ++++++++++++++++++-
>  2 files changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 131c70844..cd3c36d44 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -449,6 +449,7 @@ static void ipu_bridge_create_fwnode_properties(
>  	struct ipu_bridge *bridge,
>  	const struct ipu_sensor_config *cfg)
>  {
> +	unsigned int i = IPU_SENSOR_EP_BUS_TYPE;

You can just initialise this to 0.

>  	struct ipu_property_names *names = &sensor->prop_names;
>  	struct software_node *nodes = sensor->swnodes;
>  
> @@ -508,21 +509,21 @@ static void ipu_bridge_create_fwnode_properties(
>  			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
>  	}
>  
> -	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
> -					sensor->prop_names.bus_type,
> -					V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
> -	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(
> -					sensor->prop_names.data_lanes,
> -					bridge->data_lanes, sensor->lanes);
> -	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(
> -					sensor->prop_names.remote_endpoint,
> -					sensor->local_ref);
> +	sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =

You should use the maximum value of the property index here. Same below.
Right now it's fairly simple, but in more complicated cases it helps
keeping track of the properties.

> +		PROPERTY_ENTRY_U32(names->bus_type,
> +				   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
> +	sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
> +		PROPERTY_ENTRY_U32_ARRAY_LEN(names->data_lanes,
> +					     bridge->data_lanes, sensor->lanes);
> +	sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
> +		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
> +					 sensor->local_ref);
>  
>  	if (cfg->nr_link_freqs > 0)
> -		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
> -			sensor->prop_names.link_frequencies,
> -			cfg->link_freqs,
> -			cfg->nr_link_freqs);
> +		sensor->ep_properties[IPU_NEXT_EP_PROPERTY(i, NUM_OF)] =
> +			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
> +						     cfg->link_freqs,
> +						     cfg->nr_link_freqs);
>  
>  	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
>  					sensor->prop_names.data_lanes,
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 16fac7654..61e10cef1 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -64,6 +64,23 @@ enum ipu_sensor_swnodes {
>  	SWNODE_COUNT
>  };
>  
> +enum ipu_sensor_ep_props {
> +	IPU_SENSOR_EP_BUS_TYPE,
> +	IPU_SENSOR_EP_DATA_LANES,
> +	IPU_SENSOR_EP_REMOTE_EP,
> +	IPU_SENSOR_EP_LINK_FREQUENCIES,
> +	IPU_SENSOR_EP_NUM_OF,
> +	IPU_SENSOR_EP_NUM_ENTRIES
> +};
> +
> +/*
> + * Get the index of the next endpoint property in the property array, with a
> + * given maximum value.
> + */
> +#define IPU_NEXT_EP_PROPERTY(index, max)		\

The macro isn't limited to endpoint properties, how about calling it
e.g. IPU_BRIDGE_NEXT_PROPERTY?

> +	(WARN_ON((index) > IPU_SENSOR_EP_##max) ?	\

How about:

s/SENSOR_EP/BRIDGE/

> +	 IPU_SENSOR_EP_##max : (index)++)
> +
>  /* Data representation as it is in ACPI SSDB buffer */
>  struct ipu_sensor_ssdb {
>  	u8 version;
> @@ -141,7 +158,7 @@ struct ipu_sensor {
>  	const char *vcm_type;
>  
>  	struct ipu_property_names prop_names;
> -	struct property_entry ep_properties[5];
> +	struct property_entry ep_properties[IPU_SENSOR_EP_NUM_ENTRIES];
>  	struct property_entry dev_properties[5];
>  	struct property_entry ipu_properties[3];
>  	struct property_entry ivsc_properties[1];

-- 
Regards,

Sakari Ailus
