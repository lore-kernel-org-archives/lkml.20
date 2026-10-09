Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B43BE179;
	Fri,  9 Oct 2026 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537468; cv=none; b=TkCXfc+t/yxlMX6q/1MUyJ5ru12K4LZjRARFM3B0RaFJrrOnWxg6elq/3XmdPRWo2a7rSvQbhsGvSQMsPPQKik0Th7ApRRzjnMSAyUIeDE2VbTlSc9okZe0w5VkkC+Wi9Xe1Gav/EBog+T8vn1tDkaIqb8vg3DiiPzO91F3cTNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537468; c=relaxed/simple;
	bh=vB9ji3Per3CAmv2LaZy/qK4O0gLdZGMkcigemv+yhtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfZvH6yrPZaC9RH5AnL7oTEXIZZXZw7bL3t5JrQHv5LUHAVMyStbJrS/xFkS4h4WBikBocZLQVHGGnhsufQ31mu1AsXJoUd+E3TlIu+er5tO3JH6g1xncYWqrubuV0wvmqQ4ZvAOkq+ZADpEbLDx7NUGG9C2hrBV91AcN5bH8yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJrim2HW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJrim2HW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791537466; x=1823073466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vB9ji3Per3CAmv2LaZy/qK4O0gLdZGMkcigemv+yhtM=;
  b=WJrim2HWQR+1PSMe5p5hloL8NRdfY6dxGdN3DJQJWwvLxFTNw6XRrKsI
   1piTnHcl2IESou+zHk1B6cL0WEhF/rAknyeKnaskloP01mbuAlykizfUA
   I2k63j13kQNdKPymvMf1QCfvSEhIYCQcs6VSBBN9syT509VtAXuCIMeB0
   Ar290ze3L9qMsc3FYEf/k+Ce8fTqS/kUz7dVrbskBFYJoAoYhCm6Vxmze
   0z25fUgwBS2i3gDtBGDBYj3NV5Us/xXaBcRC4LkQI/q73LZvf4BL5XOw2
   E14b3DEBTOJj0pcZxqC/JV5R7WFW6Rx3A3u2oGwNUBsEEB1JphhsV1Ifd
   A==;
X-CSE-ConnectionGUID: 4O2TdbIKTlSvRrVt+yRZgA==
X-CSE-MsgGUID: 33sNNFAkS2e/xVO96P5KQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="211724"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="211724"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:17:46 -0700
X-CSE-ConnectionGUID: VQpG49v6TZWd1Qk5jvEwag==
X-CSE-MsgGUID: jBMACb+kRBmyVCz5t3apLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="260461"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:17:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ACD8E11F9E8;
	Fri, 09 Oct 2026 12:17:45 +0300 (EEST)
Date: Fri, 9 Oct 2026 12:17:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: ipu-bridge: don't reference the module
 image from software nodes
Message-ID: <asixOSLSO9ePgc9D@kekkonen.localdomain>
References: <20261008132614.2456716-1-dmanresa@gmail.com>
 <20261008132614.2456716-2-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008132614.2456716-2-dmanresa@gmail.com>

Hi D.,

Thanks for the update.

On Thu, Oct 08, 2026 at 03:26:13PM +0200, D. Manresa wrote:
> The software nodes registered by ipu_bridge_init() are deliberately
> never unregistered: sensor drivers and the fwnode graph keep references
> to them, so they are left registered when the ipu-bridge module is
> unloaded and a later rebind is intended to reuse the already registered
> nodes.
> 
> For that to work, nothing reachable from the registered nodes may point
> into the ipu-bridge module image. Most of the data already lives in the
> dedicated, never freed, struct ipu_bridge allocation: the property name
> strings in struct ipu_property_names are character arrays copied into
> the per-sensor struct, the node name strings are likewise character
> arrays inside the struct, and the data-lanes array is a struct
> ipu_bridge member precisely so that "it survives if the module is
> unloaded along with the rest of the struct". Commit a20c843c9bc4
> ("media: ipu-bridge: Keep the clock-noncontinuous property name out of
> rodata") moved the "clock-noncontinuous" property name there as well.
> 
> Two references into the module image remain, though:
> 
> 1. The values of the "link-frequencies" endpoint property point at
>    cfg->link_freqs inside the const ipu_supported_sensors[] table in
>    module rodata.
> 
> 2. The name of the "lens-focus" device property is a string literal in
>    module rodata.
> 
> Both dangle as soon as the module is unloaded, while the properties
> that carry them stay registered and readable. In practice, after
> unloading and reloading the IPU modules on a Surface Pro 7+ (IPU6,
> ov8865 + ov5693 + ov7251), re-probing sensor drivers read poisoned
> link-frequencies from the surviving nodes and fail to probe:
> 
>   ov8865: failed to find 360000000 clk rate in endpoint link-frequencies
>   ov5693: supported link freq 419200000 not found
> 
> where 419200000/360000000 are exactly the values the bridge had
> originally published for those sensors, i.e. the properties no longer
> return their original contents. Depending on what happens to the freed
> module mapping, reading the properties can also fault. Similarly, a VCM
> lookup through the "lens-focus" reference can no longer match (or
> faults) once the property's name pointer is dangling.
> 
> Copy the link frequencies and the "lens-focus" property name into
> struct ipu_bridge, next to the data-lanes array kept there for the same
> reason, and make the registered properties point at those copies, so
> the nodes survive module unload intact. These were the only remaining
> references from the registered nodes into the module image (the
> sensor->vcm_type pointer into ipu_vcm_types[] is only dereferenced
> during ipu_bridge_init() itself and is not reachable from the nodes).

This commit message is exceedingly long considering what the patch does.
Please remove non-essential information in it.

> 
> Assisted-by: LLM
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
> Signed-off-by: D. Manresa <dmanresa@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 14 +++++++++++---
>  include/media/ipu-bridge.h           |  9 +++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 3739c4a..b9779c3 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -623,7 +623,8 @@ static void ipu_bridge_create_fwnode_properties(
>  		sensor->vcm_ref[0] =
>  			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
>  		sensor->dev_properties[3] =
> -			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
> +			PROPERTY_ENTRY_REF_ARRAY(bridge->lens_focus,
> +						 sensor->vcm_ref);
>  	}
>  
>  	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
> @@ -636,11 +637,17 @@ static void ipu_bridge_create_fwnode_properties(
>  		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
>  					 sensor->local_ref);
>  
> -	if (cfg->nr_link_freqs > 0)
> +	if (cfg->nr_link_freqs > 0) {
> +		u64 *link_freqs = bridge->link_freqs[sensor - bridge->sensors];
> +
> +		memcpy(link_freqs, cfg->link_freqs,
> +		       cfg->nr_link_freqs * sizeof(*link_freqs));
> +
>  		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_LINK_FREQUENCIES)] =
>  			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
> -						     cfg->link_freqs,
> +						     link_freqs,
>  						     cfg->nr_link_freqs);
> +	}
>  
>  	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
>  		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
> @@ -1112,6 +1119,7 @@ int ipu_bridge_init(struct device *dev,
>  
>  	strscpy(bridge->ipu_node_name, IPU_HID,
>  		sizeof(bridge->ipu_node_name));
> +	strscpy(bridge->lens_focus, "lens-focus", sizeof(bridge->lens_focus));
>  	bridge->ipu_hid_node.name = bridge->ipu_node_name;
>  	bridge->dev = dev;
>  	bridge->pci_id = dev_is_pci(dev) ? to_pci_dev(dev)->device : 0;
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 3ef94c2..a49f37f 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -203,6 +203,15 @@ struct ipu_bridge {
>  	char ipu_node_name[ACPI_ID_LEN];
>  	struct software_node ipu_hid_node;
>  	u32 data_lanes[4];
> +	/*
> +	 * The software nodes registered by the bridge are deliberately never
> +	 * unregistered (see ipu_bridge_init()), so every string and array
> +	 * they reference must live in this never freed struct rather than in
> +	 * the module image, so that the nodes stay intact if the module is
> +	 * unloaded.
> +	 */
> +	char lens_focus[sizeof("lens-focus")];
> +	u64 link_freqs[IPU_MAX_PORTS][MAX_NUM_LINK_FREQS];

Can you move this to struct ipu_sensor?

>  	unsigned int n_sensors;
>  	struct ipu_sensor sensors[IPU_MAX_PORTS];
>  };

-- 
Regards,

Sakari Ailus
