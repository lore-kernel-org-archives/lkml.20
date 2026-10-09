Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943044908DB;
	Fri,  9 Oct 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537648; cv=none; b=txLwRoCQIp5TGYyvUVDLqYEyTVbJr+vs7j/haaXFvhvX+WyFdp2IFGlEmgWOQHIiqu8aEBcaEgjvctUmnBBDHLONdr+8aXXWVmWfKYm9jYeBFWlY94GjIRa3M1XPip3/lCF9K/V4WSPtukAQdRrjEIt5RMiIceK8nXDOIlV+wPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537648; c=relaxed/simple;
	bh=ezOnOWeLOhhEY+nDjZ0CF5hvs6z4Z/GZeaWMjywhtdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idtXHTwqv84xovHRV4WX8TCJFjVsni3SHsdECugAxXo2mmJ5S/0M9hBIvDEggvtPyAn2vJkkRUiblCUUSpFkFCqkGL4Mj8Xv9NwHvqDjn6cOuFfu/Z/mxPM5c55kynqrKpL9ZaFmbn3L8oO58zd++i0PdZQM1X52Et0i1LI10oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNghjdUu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNghjdUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791537647; x=1823073647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ezOnOWeLOhhEY+nDjZ0CF5hvs6z4Z/GZeaWMjywhtdU=;
  b=PNghjdUuMLLvQQKPnyWIkE5eFE72Yl4gGz3rakgroguJC+kehJ3rV4iB
   XhvniFNiYx7HM+RsoW14iNyKMfylBBcFpbrH/p5EYI0wDnUCBYSMTFhTX
   /iogrbN26RVNXB72UV+08bdxoyr+YXnyjpp0ACtrHkDYsc13Ymg+ooH0w
   ZebJkd94wbPg+aly6Yt6k4Xf756eAZGJKerNFhegh0cchDg+2euaHX4Hv
   K/UH2aPXS1Zwztf1iPWEqTqKC644rC0Qnhn4NVTWyvQdwGE882wLQAqMi
   0uUvDowqvmIDtTlpMo0fSusDRfSUdSXnB/nS0lVu09yqHJcmcUcAXgYCe
   g==;
X-CSE-ConnectionGUID: SstSlrXRRq2+bytWRhCJ/A==
X-CSE-MsgGUID: TC8xHhoKQhCr05FxeBEF6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="341919"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="341919"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:20:46 -0700
X-CSE-ConnectionGUID: dRoMxbbTR0W9zZHjtlK++g==
X-CSE-MsgGUID: wqg2A/OpSmCwiasMVVjtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2012226"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:20:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E4861206CF;
	Fri, 09 Oct 2026 12:20:46 +0300 (EEST)
Date: Fri, 9 Oct 2026 12:20:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: ipu-bridge: reuse the software nodes on
 rebind
Message-ID: <asix7qsLHUG027pU@kekkonen.localdomain>
References: <20261008132614.2456716-1-dmanresa@gmail.com>
 <20261008132614.2456716-3-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008132614.2456716-3-dmanresa@gmail.com>

Hi D.,

On Thu, Oct 08, 2026 at 03:26:14PM +0200, D. Manresa wrote:
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

Same for this comment, please clean it up.

> 
> Assisted-by: LLM
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Signed-off-by: D. Manresa <dmanresa@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index b9779c3..f0fadc0 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -1099,6 +1099,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
>  int ipu_bridge_init(struct device *dev,
>  		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
>  {
> +	const struct software_node *ipu_node;
>  	struct fwnode_handle *fwnode;
>  	struct ipu_bridge *bridge;
>  	unsigned int i;
> @@ -1109,6 +1110,29 @@ int ipu_bridge_init(struct device *dev,
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

This, too.

> +	ipu_node = software_node_find_by_name(NULL, IPU_HID);
> +	if (ipu_node) {
> +		fwnode = software_node_fwnode(ipu_node);
> +		set_secondary_fwnode(dev, fwnode);
> +		/*
> +		 * The node stays registered, it does not need the reference
> +		 * software_node_find_by_name() took to stay alive.
> +		 */

Rather than this, it'd be more useful to say why, if you are to add a
comment.

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
