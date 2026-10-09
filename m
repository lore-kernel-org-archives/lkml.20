Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AA4E50D7;
	Fri,  9 Oct 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546272; cv=none; b=epsvIFkcOfr9rharyUWZNreWAUTR0dpH+fKhKMncx0UB2dHYtV3+9lYpx7wqh65N8q3k8iD0qLN+uTmWmCcuzS+aEQCiNHdI3orSkKM4Q6v5y/0X17hA2GitK3qshTECUw+5Ik6QqXtqQPRDklD+p4DouQFMZ8N3YhFA7n3HN18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546272; c=relaxed/simple;
	bh=TFe6ratGAWSGPk8lq/znVCcKhncDY2ITq4xTs3UQDII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqyYk4A9s4jp1dzEY0bgEwzIlZUMIGwuCt3SqSjVo1zSPrRbfIGFylHsAjX+idYEU5y4CrHNSv93M1tcWAPxO+jhrqpzjcpGto5fTLNOAX3dz/ggYE9bcT5oup4nwu0cxip93eR4sF9LbEwJVvxw98ywDt2VNjDMwPgH1XSv5ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meUlrgnX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meUlrgnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791546253; x=1823082253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TFe6ratGAWSGPk8lq/znVCcKhncDY2ITq4xTs3UQDII=;
  b=meUlrgnX3fxwV2Gvfrq8mIzimOVs4T4UREY4CoVbqQAi7Lu3HNUywGW+
   sCtrwejM5MhX791sk+bvXUCCNVp9T2P5yWZok5OT4oWwnsUL/1V06r4BE
   CG4Wu21/ANj2PV/hAMwrjhr5W7oQcHoxShxMSy/0egVlqGFUF9GOBb4wy
   A4CxqqTmu4pAD4xSGvE9v1e5eMH8arrLj3wLncJy/F9Ohc7z9nFpTeaLw
   Nor/uJ4GSkZJt3lZbmiNw2Ruux62hm34mKisXqT74UnGq3uoEsJ3RrGPs
   kcMw12UNC+HkDggoSFoU2RXG23s3n1Bod26fc4udcAKh9v1tXigLhk4cl
   A==;
X-CSE-ConnectionGUID: t3QHlYP+TiSH94pVaIvKxA==
X-CSE-MsgGUID: bZDj+QClQRO1tjBubZNI7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="248774"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="248774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:44:11 -0700
X-CSE-ConnectionGUID: ZHwS2gisSDWlZElOakjP8g==
X-CSE-MsgGUID: vskpS8dnQ2+v0gYwFH/Cjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="307958"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2026 04:44:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B964399; Fri, 09 Oct 2026 13:44:08 +0200 (CEST)
Date: Fri, 9 Oct 2026 13:44:08 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: 8967858b87@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Add quirk for ASUS ROG Zephyrus
 Duo 16 GX650PI
Message-ID: <asjTiL1AneXlRrpY@black.igk.intel.com>
References: <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>

On Fri, Oct 09, 2026 at 02:41:19AM +0400, Aleksei Berezin via B4 Relay wrote:
> From: Aleksei Berezin <8967858b87@gmail.com>
> 
> On the ASUS ROG Zephyrus Duo 16 (GX650PI, BIOS GX650PI.314) the firmware
> loads the EC-based variant of the AMD CPM UCSI SSDT ("CPMUCSI"). Its _DSM
> read function only copies MESSAGE_IN and CCI from the EC into the shared
> mailbox and never fills in the VERSION field. The only code that sets the
> version (M31F) lives in the "UCSIPLT" SSDT of the I2C-based variant, which
> is present in the firmware image but not loaded on this machine.
> 
> As a result ucsi_register() reads a zero version and the probe fails
> silently with -ENODEV, so neither Type-C port is registered and no
> typec, usb_power_delivery or ucsi-source-psy devices are created.
> 
> Reuse the existing zero-version workaround from the Acer Nitro ANV15-41
> quirk and assume UCSI 1.2 on this machine. With this change both ports,
> the PD partner and the UCSI power supplies are registered and report the
> connected USB PD charger correctly.
> 
> Assisted-by: Claude Opus 5.5 iasl
> Signed-off-by: Aleksei Berezin <8967858b87@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 5697ccc24..c8e6efdba 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -196,6 +196,13 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
>  		},
>  		.driver_data = (void *)&ucsi_acer_ops,
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_BOARD_NAME, "GX650PI"),
> +		},
> +		.driver_data = (void *)&ucsi_acer_ops,
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
> 
> ---
> base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
> change-id: 20261009-usb-next-98711bc6d682
> 
> Best regards,
> --  
> Aleksei Berezin <8967858b87@gmail.com>
> 

-- 
heikki
