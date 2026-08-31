Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE9348C70;
	Mon, 31 Aug 2026 12:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178355; cv=none; b=am56Y+EmEyDlwnbMlMQP4QvwVig6AmRQIS4tHv2XTHmYgm7I7uotZc28OuRl+Y2AUxhm0YUn/9pbxJHZQxKc+CPyXXMLLmL7PZCVtevnogJjOj+cJms/s2AQUozCK09yndIaZwuS5s+cFRPod3A1oCfXZlT+KcQsKXiVdV+trxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178355; c=relaxed/simple;
	bh=U8EVMnxv83kL6cvauMKQhcfhGM1b7G2bSohUqrcQNmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdf7mQwERaZb5ABdqK8qjdGaUlO5UwE917yJNL9WEDMSsxyrSzHKkKb648hpxS+uLquhS3/Q//QSr2WqYlXHCERLu/RSJCmxHwnzQlJytkiKlKHkfzbc5J4aETD+kDIhs5qfePY3LaNDQ+F/JdfzGRvKcWZr37wcoMjtPus1roc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INWwh+8o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INWwh+8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788178353; x=1819714353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U8EVMnxv83kL6cvauMKQhcfhGM1b7G2bSohUqrcQNmw=;
  b=INWwh+8opvnDbHdAAkvdWwg6w5Gpt0SyhgkmoRtK6k8j7FCNFDWVzMyy
   5iaoc467Q9SP70LyFKDb/iOjrcvcfVR6i7t9EF5+s9UXlNs6UApxap5zC
   nW+5E4jGelDitpUO48L9KFx767MWqt2ba+BsppJxi9gyKYdkMoR4U+60R
   k6FTAqdm464QjpPFbVfLNxHCSELKk1/kusBHtgF4fmPWg0CqrtyQpawKU
   sQO86gkdGVmZP8ciqG0RcxUa+bEdpvHTDZ2drrlTx7nl6etPQnCmNT2Gq
   U14loTx4HlX1DQWl2T43cw+K4zsgLfG/dkzQKH0Ebr35myO/+XTlQPspw
   Q==;
X-CSE-ConnectionGUID: 3lLQASoYQ0W+JHrnSkePFw==
X-CSE-MsgGUID: +RCW2KLTR3a+qNLgROjQuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88607427"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88607427"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:12:32 -0700
X-CSE-ConnectionGUID: 13QC92q6TDWbPLHAy2xw9g==
X-CSE-MsgGUID: 3vKqWdYTT6OKkbtFlo9lIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274046685"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.140])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:12:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 29D1E11F7F5;
	Mon, 31 Aug 2026 15:11:37 +0300 (EEST)
Date: Mon, 31 Aug 2026 15:11:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ipu-bridge: reuse the software nodes on rebind
Message-ID: <apVveTVtPTGZ15J7@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com>
 <20260831094257.29398-1-dmanresa@gmail.com>
 <20260831094257.29398-3-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831094257.29398-3-dmanresa@gmail.com>

Hi D.,

On Mon, Aug 31, 2026 at 11:42:56AM +0200, D. Manresa wrote:
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
> device's secondary fwnode at it and return success. Restoring the IPU's
> secondary fwnode is all a rebind needs: the sensors' ACPI fwnodes still
> carry their secondary fwnode pointers from the first bind (the sensor
> devices are not removed by an IPU unbind, so nothing clears those), and
> the IVSC and VCM links likewise live on devices that survive an IPU
> rebind. The previous commit made the registered nodes self-contained in

I'd refer to the patch by a name, but I don't think you really need that
reference here.

> the never freed bridge allocation, so their properties are still valid
> here. The IVSC readiness check is intentionally skipped on this path,
> as the IVSC links were already established by the first bind.

I'd say this is a bit too elaborate for a commit message. Please shorten
it.

> 
> software_node_find_by_name() takes a reference on the node it returns;
> drop it right away since the node is kept alive by its never dropped
> registration, matching the reference handling of the initial-bind path.
> 
> Developed with the assistance of an AI tool (Claude)

Please use Assisted-by: tag, see
Documentation/process/coding-assistants.rst .

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
> +		dev_info(dev, "Reusing the previously registered software nodes\n");

I think dev_dbg() should suffice here.

> +		return 0;
> +	}
> +
>  	if (!ipu_bridge_ivsc_is_ready())
>  		return dev_err_probe(dev, -EPROBE_DEFER,
>  				     "waiting for IVSC to become ready\n");

-- 
Regards,

Sakari Ailus
