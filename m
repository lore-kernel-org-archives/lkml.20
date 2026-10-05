Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787CD443A98;
	Mon,  5 Oct 2026 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196565; cv=none; b=jEaC06rF4qPRLzEBjGpsN5CE8NdBwNWoWZRH5gr0QlROXu0wHoxbBGHUTyhNrrIOBb38xH95TPJagbdhJmXB/UGSnX+FcilRn/SrWroXUKAdcP/eSh78F+QTsL0HA3DTKdmK7YWb5279aixyQcdqP3jjAffsKEJKx1gKrhlvo1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196565; c=relaxed/simple;
	bh=+Pnp5vYf8CSwmcwTvkKwdomoDPsd4+ZFsdVaZtJa6Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHOCMQOKH2yQfTw/OtYv+sUC1CC+zIXXgByjEU7c6kNtOk6pP0PNeslZ4D9LrhR/ew8HaGiTyCkS/g3/NhXNuP/c+rbQAHs79+OX9iUCZNu9HFQ+zZwsp9alQ/0rotYnpG2ceuH/NRgbRQMoUqkXDZYUePK0UD//C3rXTS7CXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Envfz/I+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Envfz/I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791196563; x=1822732563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+Pnp5vYf8CSwmcwTvkKwdomoDPsd4+ZFsdVaZtJa6Sw=;
  b=Envfz/I+50XjHfgAz56TQIU8+WLCtAwk90GBjTpFTih/DxSZ5RQP+07D
   0ySASwo/wNT7DivsEszmQQqWDljITU9q7Ul3VMbBUorK3vc19xaVN+TKN
   sr11FuA/X9GONbeZRluSnBiTI1yn4GO2csdkSfX/XsWaTDHooKg+HRg2w
   A06z2tIvTKWTMvhfe1WUfauO7WSdG7cLCfGigdRpOKqybOMusYbWx4fs0
   zd9tfqsCuaJ8UBVYmulzHAX1EMDnlV18lO76Ugaz80PFdLLEpG8m1Ca2r
   NAt83jgDaEJ330EzpGDReFdIpfV4T435DK1s1xV6xR3mhP5asidl6FahS
   w==;
X-CSE-ConnectionGUID: AQ/0Cq5fQMuPtAEJr2SRXA==
X-CSE-MsgGUID: P7ynht1yQF6Gx1cF5isAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102025635"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="102025635"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 03:36:03 -0700
X-CSE-ConnectionGUID: uKpirUPySmKAOZDU9kKbXA==
X-CSE-MsgGUID: 8UjFNjzFS0abXxBoCngh6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="281557505"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 03:36:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 108A911F73F;
	Mon, 05 Oct 2026 13:36:01 +0300 (EEST)
Date: Mon, 5 Oct 2026 13:36:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 2/3] media: i2c: Add driver for OmniVision OV32C4
Message-ID: <asN9kKdqf6hY_iCV@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com>
 <20261005071010.7191-3-robertbozik@gmail.com>
 <asNsiKal6GgcqUSK@kekkonen.localdomain>
 <20261005101447.15264-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261005101447.15264-1-robertbozik@gmail.com>

Hi Robert,

On Mon, Oct 05, 2026 at 12:14:46PM +0200, Robert Bozik wrote:
> Hi Sakari,
> 
> Thank you for the review.
> 
> On Mon, Oct 05, 2026 at 12:23:20PM +0300, Sakari Ailus wrote:
> > > +	{ 0x6ad0, 0x00 },
> > > +	{ 0x6ad1, 0x75 },
> > 
> > Are there any gaps in this deluge of 0x0 and 0x75? If not, could you write
> > it programmatically rather than using a huge array?
> 
> Two contiguous ranges, 0x6ad0-0x6bef and 0x6c00-0x707f, with one gap of
> 16 bytes between them; every even address holds 0x00 and the odd one
> 0x75, so it is 720 16-bit registers set to 0x0075. v5 writes them from a
> loop and the table shrinks to 345 entries. I'll verify the stream and
> the image after the change, since it alters the bus transactions.
> 
> > > +	ret = acpi_dev_get_resources(adev, &resources, ov32c4_i2c_res_cb, &ctx);
> > 
> > The presence of additional chips like VCM is very much dependent on the
> > module, and I think we should have parsing of the I²C address outside the
> > sensor driver.
> > 
> > One option could be to stuff it into the reg property in the ipu-bridge,
> > that way it'd work the same way for the driver on both DT and ACPI. In the
> > ipu-bridge, I'd use a static value and provide the reg property for this
> > sensor only (based on _HID). i2c_new_ancillary_device() will only use OF so
> > the driver will need to dig the address manually still.
> 
> Agreed, that is better. For v5 I'd give ipu-bridge a small table of
> sensors whose second I2C address belongs to the sensor itself,
> { "OVTI32C4", 0x3e }; for a sensor in it the bridge adds reg = <main,
> aon> to the sensor's software node and does not instantiate the VCM
> from SSDB - so the no-VCM exception of patch 3 folds into the same
> table. The driver reads reg with device_property_read_u32_array() on
> both DT and ACPI and the _CRS walk goes away with its CONFIG_ACPI
> guard. The property fits into the existing dev_properties slot that
> lens-focus uses when there is a VCM, so no change to the header.

You shouldn't assume there won't be a VCM; please do add an array entry for
reg instead.

> 
> The rest will be in v5 as suggested - the register names, the RGB/IR
> comments, the function name, the error label and the comments; the HTS
> define was unused and goes too.

-- 
Regards,

Sakari Ailus
