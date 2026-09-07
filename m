Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D67471CE9;
	Mon,  7 Sep 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782925; cv=none; b=kNLVn7c4FR5jOQefxM7T4/qX3h99NThoaZDqslPCZQGplgvbbmRC0RcldJsb+bVmVFEci9tb/ZbDcbe393jJBZCGukpIkPuErpdZ68kWD8buhS+Rd/rFBi1oMk+JPYYEzCCO9rx11OTynAvOJ+8GugLwhR8VhBjG5NYVhwghkac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782925; c=relaxed/simple;
	bh=74FzT5xvhYQ9YWQapkVwrpxd0VrXliCap1qsp2bOkRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h38/0pFkcg8DrChqQgvLy4vlm46cRE4SaXCweWJnTbR9XrJkhsjcCU9aLfanMKSadN1dZ2I49rsb/WMmaWS3EDwMm62WCtf90CK6i6uFZlsGfMmxrFmH7cjwL8cnHTgo3+aqpZr+3ut0orHm0vO0PLDe8m5X9XPOLryVSj64ubQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/N7lN3S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/N7lN3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788782924; x=1820318924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74FzT5xvhYQ9YWQapkVwrpxd0VrXliCap1qsp2bOkRA=;
  b=a/N7lN3SVZNjpEfMrSb7r3xcPd9te3Kx4h2pumdAo7ilL/tWViiRT+5k
   1rcvJ/1s/NnHsVtpe0Jip42AX+FUAQTublW/lS3SHpTyYAWgyLF9ncEQA
   eOYDKGNpAbHHoBPHgPGPmXERBf4AqYo2Ya879P1hqzusQ2ThThJq6oFTE
   k8WX1kYPMHWsAnLFA9VcpSfLwJlJh7SzKuCuxxIvBXG2QTghmoUgMw9tF
   xs1vaN/qpIB/l+mmAhTwK6yVsNTOMm0TFcdllb+EK9bDiZRJbaFKvsBHm
   seFR7H6i0LR3YahLJexScQMLBXcCZrgzFqtdLAwpoGbnz+wUrXyI2uxEe
   A==;
X-CSE-ConnectionGUID: C/0mK1JrRAOJDGbGUdIYIg==
X-CSE-MsgGUID: OVI+C7MeQPWIPokUiMusbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89029412"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89029412"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:08:43 -0700
X-CSE-ConnectionGUID: 41fBlsJpReCUVNx4ojz0SQ==
X-CSE-MsgGUID: DwKU8ZnWTHK6Dp2R8UC6xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="272623748"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 07 Sep 2026 05:08:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 4A79E99; Mon, 07 Sep 2026 14:08:40 +0200 (CEST)
Date: Mon, 7 Sep 2026 14:08:40 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tipd: Disable mode control for CD321x
Message-ID: <ap6pSJbx_HNPerOs@black.igk.intel.com>
References: <20260906-b4-tipd-mode-ctrl-v1-1-71032eaaa452@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-tipd-mode-ctrl-v1-1-71032eaaa452@kernel.org>

On Sun, Sep 06, 2026 at 02:24:00PM +0200, Sven Peter wrote:
> Apple's CD321X firmware controls which alternate mode is entered and
> cannot be influenced from Linux. Set the no_mode_control capability to
> accurately reflect this to the typec subsystem.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 522f56742aa9..8fdb37e288b4 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -151,6 +151,7 @@ struct tipd_data {
>  	irq_handler_t irq_handler;
>  	u64 irq_mask1;
>  	size_t tps_struct_size;
> +	bool no_mode_control;
>  	void (*remove)(struct tps6598x *tps);
>  	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
>  	void (*unregister_port)(struct tps6598x *tps);
> @@ -1242,6 +1243,7 @@ tps6598x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
>  	typec_cap.driver_data = tps;
>  	typec_cap.ops = &tps6598x_ops;
>  	typec_cap.fwnode = fwnode;
> +	typec_cap.no_mode_control = tps->data->no_mode_control;
>  
>  	switch (TPS_SYSCONF_PORTINFO(conf)) {
>  	case TPS_PORTINFO_SINK_ACCESSORY:
> @@ -2015,6 +2017,7 @@ static const struct tipd_data cd321x_data = {
>  		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
>  		     APPLE_CD_REG_INT_PLUG_EVENT,
>  	.tps_struct_size = sizeof(struct cd321x),
> +	.no_mode_control = true,
>  	.remove = cd321x_remove,
>  	.register_port = cd321x_register_port,
>  	.unregister_port = cd321x_unregister_port,
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260906-b4-tipd-mode-ctrl-80835d9e3f72
> 
> Best regards,
> --  
> Sven Peter <sven@kernel.org>
> 

-- 
heikki
