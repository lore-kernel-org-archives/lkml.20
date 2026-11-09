Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224356;
	b=sheU258dJcY9Gv0e4IsverG0suE4oQz7E+ezzqpVUs729803fE/86wkrkBkstp+nPP0H
	 obcigBZ2enZSMAKgys1nGAQf78lglYHN9rBARXT9rp0kFfr56NLashdzwCvBZ00PxWYAa
	 Kjh6S7Vp8UO/5cfa7vT3juE1xJB9IL7nXoZwZcle/3pm6DhCPWRF4xNOYv661ZPmikQlU
	 dj58Zv+Rgw5+v6US25ArgjoDUKnT0vIOna8AxBOyRjYqVXI9/iWDteAWA9o20itAd52JG
	 B3jLWdKtrwrsUTa1CzmFGq/E8BpguQku0RPNzSRXoqQAvTYoWDmCyJ+rikKd5A6qv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224356;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eq61sWRYzrivcrYrCNupb/+PaqZUcH+6TeQg5Ei2qqI=;
	b=rWk+QKeRQtoxroBPbnNTRFhVr6cZdM4mkgUjl0gGlkXVJYnPVt6WZT9rnNhYjs4U/Ch0
	 MS+w7JZNgEVxy3Yv6Tg4Ye7tNWlKka5HTk/cwRizLcs9w/mQiG3LviaXXY++wN7ctkOFS
	 sBmVzPw/x1qLqfpLIodb5GdBglNgAwmk+SepTGiLZbtu7hhegxYOQFZRgxc/uYl1fHhUH
	 BuUq0UFlLwiMq1L3HaE9haqqpClY4id1TjTn5yr9nURy4OV9cSNtc6XUeKHLcu6hsctz/
	 aEsQhdKB/9wyhjvV8c1kuBw5FrD8n6fUa1fJgUOKFcxBYVPO/soVWekKDNdnWKyZx2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5VA3X2X;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A23606A326;
	Mon,  9 Nov 2026 11:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A23606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T5VA3X2X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794224355; x=1825760355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=28dn8Z9BTHpktjmUfDQVXWTsYLxAtBNV0LRkkfndp1I=;
  b=T5VA3X2Xpyl0jkq5FCw4dwjBJxNa3z0JxPLm/Vodj1iiVOhTdVsivpbc
   crWNw6dMFLpaD0+Ev/e8HuAvJ2Ro3ByKUsr+GyGgr6E3inLfV9BenIcFn
   Wm2q7eGkj1ngneKkbAmk+Squslko/qqY5WbgAqsOMshiulQHTnXBwu62J
   38BQM0/Pwe5Mf2HglPLqfdnerfn0BR8wuMYd8vA7LfgIeoQCPquKvDjSV
   301Thgbm3kW4QQfZ3R38TfOJwgzYqBqH6n/LYy2KctEelTIIOXikKldBy
   DRcZORzgQuqH1mNiMjTvemd/YJyPzM7oDa5FbQ7ZjG02HLlXdYMiQADEg
   Q==;
X-CSE-ConnectionGUID: EH1y06QYTUGb8l01ezvoCQ==
X-CSE-MsgGUID: 68dpbHpxRbOgEL/ZLVkIaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2933045"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2933045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:39:15 -0800
X-CSE-ConnectionGUID: KsBzyTehQSO6N/c0yLHEkw==
X-CSE-MsgGUID: uePV1NF3RnqQc51dLGor1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7719555"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:39:11 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3C9D4121B96;
	Mon, 09 Nov 2026 13:39:08 +0200 (EET)
Date: Mon, 9 Nov 2026 13:39:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	"D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: ipu-bridge: Add the Surface Pro 9 and 11
 infrared illuminator
Message-ID: <avGw3BRVvisX4P5k@kekkonen.localdomain>
References: <20261109093353.3757-1-lsa.uz@pm.me>
 <20261109093353.3757-5-lsa.uz@pm.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109093353.3757-5-lsa.uz@pm.me>

Hi Sergey,

On Mon, Nov 09, 2026 at 09:34:50AM +0000, Sergey Lebedev wrote:
> On the Surface Pro 9 and on the Surface Pro 11 with Intel, the infrared
> illuminator is driven by the VD55G0's GPIO 1, which strobes it during
> the exposure. The ACPI tables do not describe it, so the sensor driver
> finds no st,leds and offers no V4L2_CID_FLASH_LED_MODE.
> 
> Give the sensor's software node st,leds from a DMI match, as the
> upside-down quirk gives a rotation. dev_properties gains an entry for it,
> as a sensor can also have a lens-focus reference. The software nodes
> outlive the module, so the property name goes into struct
> ipu_property_names and the GPIO numbers into struct ipu_sensor, where
> nothing points into the module image.
> 
> Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> v3: no change.
> v2: the st,leds name and GPIO numbers live in the bridge's own
> structs, as the software nodes outlive the module (Fernando); the
> Surface Pro 9 is added (Fernando).
> 
> D. Manresa's ipu-bridge series changes the same lens-focus line;
> whichever of the two lands second needs a trivial rebase:
> https://lore.kernel.org/all/20261026082549.662885-1-dmanresa@gmail.com/
> 
>  drivers/media/pci/intel/ipu-bridge.c | 68 +++++++++++++++++++++++++++-
>  include/media/ipu-bridge.h           |  6 ++-
>  2 files changed, 71 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index c99c85b7e6f..8d2025acf7a 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -283,6 +283,42 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
>  	{} /* Terminating entry */
>  };
>  
> +/*
> + * Sensor GPIOs that drive an illuminator, for machines whose ACPI tables do
> + * not say which. They reach the sensor driver as its own leds property.
> + */
> +struct ipu_sensor_leds {
> +	const char *hid;
> +	u32 gpios[IPU_MAX_LED_GPIOS];
> +	unsigned int nr_gpios;
> +};
> +
> +/* The infrared illuminator, strobed by the VD55G0's GPIO 1 */
> +static const struct ipu_sensor_leds surface_pro_ir_leds = {
> +	.hid = "SMO55F0",
> +	.gpios = { 1 },
> +	.nr_gpios = 1,
> +};
> +
> +static const struct dmi_system_id sensor_leds_dmi_ids[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 9"),
> +		},
> +		.driver_data = (void *)&surface_pro_ir_leds,
> +	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> +					"Surface Pro for Business 11th Edition with Intel"),
> +		},
> +		.driver_data = (void *)&surface_pro_ir_leds,
> +	},
> +	{} /* Terminating entry */
> +};
> +
>  static const struct ipu_property_names prop_names = {
>  	.clock_frequency = "clock-frequency",
>  	.rotation = "rotation",
> @@ -292,6 +328,7 @@ static const struct ipu_property_names prop_names = {
>  	.remote_endpoint = "remote-endpoint",
>  	.link_frequencies = "link-frequencies",
>  	.clock_noncontinuous = "clock-noncontinuous",
> +	.st_leds = "st,leds",
>  };
>  
>  static const char * const ipu_vcm_types[] = {
> @@ -563,6 +600,22 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
>  }
>  EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, "INTEL_IPU_BRIDGE");
>  
> +static const struct ipu_sensor_leds *
> +ipu_bridge_get_leds(const struct ipu_sensor_config *cfg)
> +{
> +	const struct dmi_system_id *dmi_id;
> +	const struct ipu_sensor_leds *leds;
> +
> +	for (dmi_id = dmi_first_match(sensor_leds_dmi_ids); dmi_id;
> +	     dmi_id = dmi_first_match(dmi_id + 1)) {
> +		leds = dmi_id->driver_data;
> +		if (!strcmp(cfg->hid, leds->hid))
> +			return leds;
> +	}
> +
> +	return NULL;
> +}
> +
>  static void ipu_bridge_create_fwnode_properties(
>  	struct ipu_sensor *sensor,
>  	struct ipu_bridge *bridge,
> @@ -570,7 +623,8 @@ static void ipu_bridge_create_fwnode_properties(
>  {
>  	struct ipu_property_names *names = &sensor->prop_names;
>  	struct software_node *nodes = sensor->swnodes;
> -	unsigned int i = 0;
> +	const struct ipu_sensor_leds *leds;
> +	unsigned int i = 0, d = 3;
>  
>  	sensor->prop_names = prop_names;
>  
> @@ -624,10 +678,20 @@ static void ipu_bridge_create_fwnode_properties(
>  	if (sensor->vcm_type) {
>  		sensor->vcm_ref[0] =
>  			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
> -		sensor->dev_properties[3] =
> +		sensor->dev_properties[d++] =
>  			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
>  	}
>  
> +	leds = ipu_bridge_get_leds(cfg);
> +	if (leds) {
> +		memcpy(sensor->led_gpios, leds->gpios,
> +		       sizeof(sensor->led_gpios));
> +		sensor->dev_properties[d++] =
> +			PROPERTY_ENTRY_U32_ARRAY_LEN(names->st_leds,
> +						     sensor->led_gpios,
> +						     leds->nr_gpios);
> +	}
> +
>  	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
>  		PROPERTY_ENTRY_U32(names->bus_type,
>  				   V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
> diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
> index 3ef94c2b767..7383bdf5a45 100644
> --- a/include/media/ipu-bridge.h
> +++ b/include/media/ipu-bridge.h
> @@ -12,6 +12,7 @@
>  #define IPU_MAX_LANES				4
>  #define IPU_MAX_PORTS				4
>  #define MAX_NUM_LINK_FREQS			3
> +#define IPU_MAX_LED_GPIOS			4
>  
>  /* Values are educated guesses as we don't have a spec */
>  #define IPU_SENSOR_ROTATION_NORMAL		0
> @@ -136,6 +137,7 @@ struct ipu_property_names {
>  	char remote_endpoint[16];
>  	char link_frequencies[17];
>  	char clock_noncontinuous[20];
> +	char st_leds[8];
>  };
>  
>  struct ipu_node_names {
> @@ -178,8 +180,10 @@ struct ipu_sensor {
>  	const char *vcm_type;
>  
>  	struct ipu_property_names prop_names;
> +	/* The software nodes outlive the module, so these values live here */
> +	u32 led_gpios[IPU_MAX_LED_GPIOS];
>  	struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
> -	struct property_entry dev_properties[5];
> +	struct property_entry dev_properties[6];

Can you handle dev_properties as ep_properties is handled now? I recall
there were patches that also did something in the area, related to keeping
all memory allocated when ipu-bridge is unloaded.

>  	struct property_entry ipu_properties[3];
>  	struct property_entry ivsc_properties[1];
>  	struct property_entry ivsc_sensor_ep_properties[4];
> 

-- 
Regards,

Sakari Ailus
