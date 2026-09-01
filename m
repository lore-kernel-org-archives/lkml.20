Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E19B3BF689;
	Tue,  1 Sep 2026 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259670; cv=none; b=UibdI31PjvDY3VBhbaZx6dFhwXodN5nWE6QzM4/ci6KWlh3lSx+Fr2vq+u0R7+fa/hvArGiHJBes8tUPhoB1c8K0cNfU8GXLiu3KkGie5fssnwebSLGkoZWOw0H8Sa8GbwMgLBv8lFImoRc3Wam16G0gjEpTo4Q126eoAkN7MYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259670; c=relaxed/simple;
	bh=q2JvQdr6crZRD4DNd93St3OZ1cQFlsrmN1lfl8zEVQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9cbWkEcYdtbYUS+XRQlTEs6c5ev2eV+hSsC/7yzLEsRCobUYQMIxVuCH7H7nUaqWsvB+2BQm/5KjwpBTpo2Iu204wuku8jTFu5kh9l62hrDsMryBPoZMn5rm2APhh23NXvmPl79DoDNN2v5LqfrYjwRcN9qqZOltL4fmwsCl/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyBrjTKu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyBrjTKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788259666; x=1819795666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q2JvQdr6crZRD4DNd93St3OZ1cQFlsrmN1lfl8zEVQg=;
  b=fyBrjTKuUsLi3+eiNir7ESoKqc1lEtDuCYiuaZ164Re52cn+JXgvoD0Q
   qjDL95vVzfbBmkzTjKzR+8DifvaLXol/8cUGKcHRQGUAbf97YgK8gw52s
   jdpWdKT+hdboBOBDW586/x4GZMPTJ/CPfhNHMtkbVQB8I2oYwdxAaDlXS
   Oh9NMpNL6pLiSMMa33gDp5DHD7/qQ4TdZy06TiXX7yPq8EjgFaivwZonH
   mp5eM5N1ZuY+jOnRL+eLvmP/wkfStiIbvR3Wmuaj8XXLgSgSuu42sQbf1
   4gKwQr4kjIDDDJ9ccjD6QC5f3rPnCxLP6h/n5HVxtx/aQZumyAwjri4BE
   g==;
X-CSE-ConnectionGUID: gJEsZdl6SYyqo2u6XXYqpw==
X-CSE-MsgGUID: AJ3iLmbxR5GfSSJ6yMdjmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88694811"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88694811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:47:44 -0700
X-CSE-ConnectionGUID: CpqH3acLSAebWkYT+amb9g==
X-CSE-MsgGUID: agypK9fJSK6p8tmKh/C2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="273243135"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.216])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:47:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2DA20121BD8;
	Tue, 01 Sep 2026 13:47:37 +0300 (EEST)
Date: Tue, 1 Sep 2026 13:47:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: ipu-bridge: reuse the software nodes on
 rebind
Message-ID: <apatSYqXbqVSGBo3@kekkonen.localdomain>
References: <20260831094257.29398-1-dmanresa@gmail.com>
 <20260831140304.45940-1-dmanresa@gmail.com>
 <20260831140304.45940-3-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831140304.45940-3-dmanresa@gmail.com>

Hi D.,

On Mon, Aug 31, 2026 at 04:03:03PM +0200, D. Manresa wrote:
> The software nodes registered by ipu_bridge_init() are deliberately
> never unregistered, and the intended design is for a rebind to reuse
> the already registered nodes. That reuse path however only exists for
> the case where the IPU device kept its secondary fwnode link, which the
> fwnode graph check at the top of ipu_bridge_init() detects: then the
> function returns early. When the link is gone, ipu_bridge_init()
> unconditionally registers the IPU HID software node again, which fails
> with -EEXIST on the sysfs name (the node from the previous bind is
> still registered) and the IPU driver fails to probe.
> 
> That is exactly what happens when the IPU PCI device is removed and
> re-scanned: device_del() unsets the ACPI companion, and
> set_primary_fwnode(dev, NULL) then clears the ACPI fwnode's ->secondary
> pointer, so the fwnode graph check on the next probe finds no endpoints
> and falls through to registration. Observed on a Surface Pro 7+ (IPU6):
> 
>   echo 1 > /sys/bus/pci/devices/0000:00:05.0/remove
>   modprobe -r intel_ipu6_isys intel_ipu6   # ipu-bridge unloads too
>   echo 1 > /sys/bus/pci/rescan
>   modprobe intel_ipu6
> 
>   sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
>   intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
>   intel-ipu6: probe of 0000:00:05.0 failed with error -17
> 
> after which the cameras are unusable until reboot.
> 
> Add the missing reuse path: if the IPU software node is already
> registered, look it up with software_node_find_by_name(), point the
> device's secondary fwnode at it and return success. That is all a
> rebind needs: the sensor, IVSC and VCM links live on devices that
> survive an IPU unbind, so nothing has cleared those.
> 
> software_node_find_by_name() takes a reference on the node it returns;
> drop it right away since the node is kept alive by its never dropped
> registration.
> 
> Assisted-by: LLM

Which one?

There's also an extra newline here. (No need to resend if you just provide
the info.)

> 
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Signed-off-by: D. Manresa <dmanresa@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 4de42ed..6fa1c3c 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -930,6 +930,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
>  int ipu_bridge_init(struct device *dev,
>  		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
>  {
> +	const struct software_node *ipu_node;
>  	struct fwnode_handle *fwnode;
>  	struct ipu_bridge *bridge;
>  	unsigned int i;
> @@ -940,6 +941,29 @@ int ipu_bridge_init(struct device *dev,
>  	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
>  		return 0;
>  
> +	/*
> +	 * The software nodes registered by a previous ipu_bridge_init() call
> +	 * are deliberately kept registered when the module is unloaded, and
> +	 * the sensors' ACPI fwnodes still have them as their secondary
> +	 * fwnodes. If the IPU software node is already registered this is a
> +	 * rebind, e.g. after the PCI device was removed and re-scanned,
> +	 * which drops the IPU's secondary fwnode link. Registering the nodes
> +	 * again would fail with -EEXIST, so instead reuse them and just
> +	 * restore the IPU's secondary fwnode link.
> +	 */
> +	ipu_node = software_node_find_by_name(NULL, IPU_HID);
> +	if (ipu_node) {
> +		fwnode = software_node_fwnode(ipu_node);
> +		set_secondary_fwnode(dev, fwnode);
> +		/*
> +		 * The node stays registered, it does not need the reference
> +		 * software_node_find_by_name() took to stay alive.
> +		 */
> +		fwnode_handle_put(fwnode);
> +		dev_dbg(dev, "Reusing the previously registered software nodes\n");
> +		return 0;
> +	}
> +
>  	if (!ipu_bridge_ivsc_is_ready())
>  		return dev_err_probe(dev, -EPROBE_DEFER,
>  				     "waiting for IVSC to become ready\n");

-- 
Regards,

Sakari Ailus
