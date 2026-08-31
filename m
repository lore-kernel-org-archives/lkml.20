Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446A344052;
	Mon, 31 Aug 2026 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173378; cv=none; b=Z2zvP/qR6GMvQ5An/10ybqVglg/YcnaXs4b79aMKTAzsmcsFuvE6BITMW4xujKhkNClXfK/7mPtIOnRdzhipWaFWxxuJEOQpSf/r0HXjMAj025EZNkoqU2qJAurr1ggBPi7Lkr2PwsrO67V5M3CkhKGdUG86XcOMIv9jhKF0kIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173378; c=relaxed/simple;
	bh=3FId75RguOXkoy+hMm3CXNMwd3NlzxdzUHJfDdxB0tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEpsTz0Y+Aq5ydzkJkflHV1jRplc8wBsB8shJfHZ1nldpI3UCo4eLP8RjMV9GRwXWAcQ6KNP/lCboVx3J08gzZhIRhquhCvf1uf3JC//waEJWR+OjouN9Le9bj29ZTd3K95gCi20KiKhieei+K+kn+VLZrbx7aEbONoV6i8iGAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J6tFDubr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J6tFDubr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230E71F000E9;
	Mon, 31 Aug 2026 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788173376;
	bh=dGZMmYxlE0Q6G1ojXbMZ6FFFpGyMYtPXFOtEqlSpkWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J6tFDubroYUmq1h8tI7u0PCiM7HSYY2S2XSmPLDounhsj9Ksc52FS6h+4/AAZ/sIK
	 6LNWwm1YUXez2fLADVMpA3XowwZCcuBwY3U4nCp13WJ+ZRzlgpiqhCcZsR4/3d+3hb
	 GclUakpYDt8ec/qQGoNzSQ5DcLd6SeBNkLujBaf4=
Date: Mon, 31 Aug 2026 12:49:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Huang Wei <huangwei@kylinos.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Bartz <alex@alstergee.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: do not register UCSI on Lenovo
 Legion Pro 7 16IAX10H
Message-ID: <2026083158-preview-replay-0157@gregkh>
References: <20260826034658.2170407-1-huangwei@kylinos.cn>
 <20260826133118.3327816-1-huangwei@kylinos.cn>
 <apVUOYIMOMBVpXWB@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apVUOYIMOMBVpXWB@black.igk.intel.com>

On Mon, Aug 31, 2026 at 12:15:21PM +0200, Heikki Krogerus wrote:
> On Wed, Aug 26, 2026 at 09:31:18PM +0800, Huang Wei wrote:
> > The EC firmware of the Lenovo Legion Pro 7 16IAX10H (DMI product name
> > 83F5) has a broken UCSI implementation: GET_PDOS returns no source
> > capabilities, GET_CONNECTOR_STATUS reports an incomplete RDO, and any
> > UCSI traffic disturbs the EC's autonomous USB-C Power Delivery
> > negotiation. With ucsi_acpi bound, chargers connect only briefly and
> > then drop, and voltage_now reads 0; with the driver blacklisted, the
> > EC negotiates full PD contracts on its own and charging works normally.
> > 
> > The problem is unaffected by BIOS updates up to Q7CN78WW (2026-04).
> > The AMD sibling Legion Pro 7 16AFR10H (product name 83RU) reportedly
> > uses the same EC firmware, but it is left out of the quirk until the
> > failure is confirmed on that model.
> > 
> > Skip probe on this machine, which is equivalent to the blacklist
> > workaround the reporter verified to restore charging.
> > 
> > Reported-by: Alex Bartz <alex@alstergee.com>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221142
> > Tested-by: Alex Bartz <alex@alstergee.com>
> > Signed-off-by: Huang Wei <huangwei@kylinos.cn>
> 
> I'm not sure about the dev_info message. Otherwise this is good:

Should be dev_err(), right?

> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> > ---
> > Changes in v2:
> > - Add Tested-by tag from Alex Bartz, who verified the quirk on his
> >   machine (out-of-tree build, runtime module swap, PD charging held
> >   across the reload).
> > ---
> >  drivers/usb/typec/ucsi/ucsi_acpi.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > index 18286d3e9cc5..9f36f8cfce4a 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> > @@ -173,6 +173,21 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
> >  	{ }
> >  };
> >  
> > +/*
> > + * Platforms with a completely broken UCSI implementation in firmware.
> > + * Do not register UCSI at all on these machines.
> > + */
> > +static const struct dmi_system_id ucsi_acpi_ignore[] = {
> > +	{
> > +		/* Lenovo Legion Pro 7 16IAX10H: broken EC UCSI firmware */
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83F5"),
> > +		},
> > +	},
> > +	{ }
> > +};
> > +
> >  static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
> >  {
> >  	struct ucsi_acpi *ua = data;
> > @@ -199,6 +214,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
> >  	if (adev->dep_unmet)
> >  		return -EPROBE_DEFER;
> >  
> > +	if (dmi_check_system(ucsi_acpi_ignore)) {
> > +		dev_info(&pdev->dev,
> > +			 "UCSI implementation in firmware is broken, ignoring\n");

This shows the hardware is broken, make it dev_err() so that someone
notices it and can pester the hardware company to fix it.

BUT, if the firwmare ever does get changed, this will still fail, so
shouldn't this all be triggered on a version/range of broken firmware,
and NOT just on the whole platform itself?  Otherwise if it is fixed,
this code will be wrong.

thanks,

greg k-h
