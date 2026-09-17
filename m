Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A2C45041C;
	Thu, 17 Sep 2026 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645977; cv=none; b=LfrgehwYfTBXPajjkwJjcbmrZ7Duya+RWCsti+MegzhrdZekszR42ts5rcS4Ht+eAEdsIyPYWK1clqLvbOGMoFTC9hpMdrbjv0IKNdBnDGA7GRa/ozXpMSMsLMeReUJMy/rYi9JAPdGbPM2iJM3SBtJ8C93ZH6QUteTi43A6Kqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645977; c=relaxed/simple;
	bh=6DZwOywmLCmxldQCAPmN+CEVBFVbwD8U2OuiFHh+iBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsZigX5btOhCWTU40ZbJW1x27z/h0boikdhMDwMem/bnxDFui4pSXvYomtvF6QLxhIXzTTu/rVPhzR0bk3aXnzQCg0gqGRPlwW3Msi7TVwLKRKJG9qgn66mGs9VxRGM/YoqVTd6BwbgERTfLPzBMO9OmJ8MEYpZsGa86ZkNIxSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boDkEukG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boDkEukG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645968; x=1821181968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6DZwOywmLCmxldQCAPmN+CEVBFVbwD8U2OuiFHh+iBY=;
  b=boDkEukGY/sNwm6TkyRAFdbEIusk5Sopuq2F/oC5KdrAX3OlbZp+FjLF
   6F/MXGI5SV5kIC1Uq0x8u0TshWnyOWVzguMVt7TNzzsfJI/xQ8HiEuZmm
   4xZQkzdqNnAW8Y9NPhppH9sDmAPxfVi/YmdYlEaBLoegRC0sEh9z6JZv2
   lMcj+IIszQb98FZHONc4gAzfIfV5hAPsS4TRK59MCg4kc1gF4c+Pvx9iU
   +GjvgpR7r2v7VToiAli0CPBOkeFhXquzK3VWRtkdqvbTYSf4iBvXyOv6c
   9oUblke5aSz7XCGr3v4ZnCNK8MN2QKcMd/a/1K4pTS2XPqApZdalahmHW
   w==;
X-CSE-ConnectionGUID: XNpp9JYoSli0B2vibz0r0Q==
X-CSE-MsgGUID: ZLiRGNbET9GRMGSBeSWRVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90076778"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90076778"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:52:43 -0700
X-CSE-ConnectionGUID: wkXVoG4lQUacyzDslXyuFw==
X-CSE-MsgGUID: CC3aSRjfSSaqXfYvyBBH/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275691779"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:52:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E578011FB34;
	Thu, 17 Sep 2026 14:52:38 +0300 (EEST)
Date: Thu, 17 Sep 2026 14:52:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: the Surface Pro 11 rear sensor is
 mounted upside down
Message-ID: <aqvUhvk22ZZLnhwD@kekkonen.localdomain>
References: <20260913153526.80287-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913153526.80287-1-lsa.uz@pm.me>

Hi Sergey,

On Sun, Sep 13, 2026 at 03:35:32PM +0000, Sergey Lebedev wrote:
> The Microsoft Surface Pro for Business 11th Edition with Intel mounts its
> OV13858 rear sensor rotated 180 degrees and declares it in neither the SSDB
> nor a matching _PLD, so the rotation reads as 0 and every frame arrives
> inverted with nothing to say so.
> 
> Add it to upside_down_sensor_dmi_ids, the table that exists for this class
> of firmware. Matched on DMI_PRODUCT_NAME as the rest of that table is; the
> entry only takes effect when the ACPI HID matches too, so a machine of the
> same model that shipped a different rear sensor is left alone.
> 
> Measured on the machine. Before:
> 
>   camera_sensor_rotation  min=0 max=0 value=0
>   libcamera: Property: Rotation = 0
> 
> After:
> 
>   camera_sensor_rotation  min=180 max=180 value=180
>   libcamera: Property: Rotation = 180
> 
> and the front sensor is untouched at 0.
> 
> This makes the kernel report the mounting truthfully, and that is all it
> does. The pixels are unchanged: capturing one static scene through
> libcamera with the property at 0 and at 180 and correlating the vertical
> brightness profile gives +0.995 the same way up and -0.781 flipped, so
> libcamera delivers the same buffer either way. The sensor has no flip
> controls, so nothing is corrected in hardware either.
> 
> An application that reads the property can now rotate; one that ignores it
> still shows the image inverted. That is a userspace matter and is not
> addressed here.

This commit message of a trivial patch is exceedingly long, please shorten
it. See examples of similar patches, for instance.

> 
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
> Written 2026-08-31 against a variant of upside_down_sensor_dmi_ids that
> takes a struct with a match type and an id list. No such variant exists in
> media/next, so the patch could never have applied and was never sent;
> rewritten today in the form the table actually uses, and measured.
> 
> Applies to media/next on its own and on top of
> 
>   https://lore.kernel.org/linux-media/20260913142034.5632-1-lsa.uz@pm.me/
> 
> which adds the OVTID858 bridge entry the same machine needs.
> 
> A second machine reporting the same DMI product name independently reports
> the same inverted image, in three different applications:
> 
>   https://lore.kernel.org/linux-media/20260913144127.17995-1-germanpapulindez@gmail.com/
>   https://lore.kernel.org/linux-media/20260903080854.16266-1-germanpapulindez@gmail.com/
> 
> I have asked its owner to confirm the string and to say whether any of those
> three applications turns the picture the right way up once the property is
> set. It would surprise me if they did.
> 
>  drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 7e65491faf..a5de450284 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -192,6 +192,14 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
>  		},
>  		.driver_data = "OVTI02E1",
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),

Let's aim to keep these alphabetically ordered.

> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> +					"Surface Pro for Business 11th Edition with Intel"),
> +		},
> +		.driver_data = "OVTID858",
> +	},
>  	{} /* Terminating entry */
>  };
>  
> 

-- 
Regards,

Sakari Ailus
