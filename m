Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CFD4EC648;
	Thu, 15 Oct 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066521; cv=none; b=t8cZqJRPxqmOT40Bci8+WHzY3LI+W97W5j2F9BVR4udsYVWHKHy5VPEqR2JnKitR1z/TOSPMs/C+xb+nKR2PvdtjNsORcuqHIRKnQEpgOmrMxZwtvec4fiv46+iLff/D5FlbnEeI4uxZ9IMn3qqXDNYQw8VhimnN3LZj0GHoRnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066521; c=relaxed/simple;
	bh=e3zwtlUcU1rH59SkIp3e5S+rQQeZdA/m0g9/lILqkek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlFQsyPJffjXaf9z4hDvitD1Vzko76Cksm1xOgCWigByh9fkNWAZsz93Bmo/Nw5ddVL5yaIBBAe+uJuHMerGclubp3pm5aZ1B9gERthEEg2I5wL8dSQqkavHGbEdzSw1QFNutdMXomc8hu0Py6c8GRfGybiF3GYbIasuECNieFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRJa7nmD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRJa7nmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279371F000C4;
	Thu, 15 Oct 2026 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066520;
	bh=vPpt4fQvcgT1ZyswqvuqO6QWS+d1ip3iJohS7kPIumE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iRJa7nmD62jJ330OWPgWqTv1juyVwXkFN17U5kH4SQNBnFHwDxR1BmcNNlOWbal2O
	 2QvqIZgQJoq5Jno5aNVLlnalBTO3WlSYemXlwrXABk9K8YmYnMCgdgMEr4yBH4d2tQ
	 O1tt+D6CBn7w64BnmRqpU2R3hLklxLEWEvO4wEQePXs8YEdSY3Xe8BmtP7nTG8MkCd
	 Zvzlz8HRuUvKlZEvueB/vlN50XxyGEYR+JsroFG4XCuRvmIKcm5j7IwgBdkcjGIGOU
	 XojilYX/dYEZy1LraEYKcqZ0s3xgCY0f0iWxh8LrLoU7R2+R5aggnDSoaBPS99r9lp
	 47JyIYWtGEqMA==
Date: Thu, 15 Oct 2026 12:15:17 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
Message-ID: <atDD1RHZylPRZtP8@google.com>
References: <20261008134056.3816556-1-akuchynski@chromium.org>
 <20261008134056.3816556-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008134056.3816556-2-akuchynski@chromium.org>

On Thu, Oct 08, 2026 at 01:40:55PM +0000, Andrei Kuchynski wrote:
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
...
> +/* Delay between mode entry/exit attempts, ms */
> +static const unsigned int mode_selection_delay = 1000;
> +/* Timeout for a mode entry attempt, ms */
> +static const unsigned int mode_selection_timeout = 4000;

Couldn't they be macros?

> @@ -421,7 +427,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>  		memset(&desc, 0, sizeof(desc));
>  		desc.svid = USB_TYPEC_TBT_SID;
>  		desc.mode = TBT_MODE;
> -		desc.inactive = true;

Why this is removed?  Per 1aede0698167 ("platform/chrome: cros_ec_typec:
Disable tbt on port"), it disables entering TBT mode automatically.

> @@ -940,6 +952,31 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
>  		goto err_cleanup;
>  	}
>  
> +	/* Once all partner alt-modes are added, we should also trigger
> +	 * mode selection.
> +	 */

For multiple line comments:

    /*
     * Once ...

> +	if (is_partner && typec->ap_driven_altmode) {
> +		bool usb4_mode = (port->caps.usb_capability & USB_CAPABILITY_USB4) &&
> +			(PD_VDO_UFP_DEVCAP(port->p_identity.vdo[0]) & DEV_USB4_CAPABLE);
> +
> +		if (usb4_mode) {
> +			ret = cros_typec_enter_usb_mode(port->port, USB_MODE_USB4);
> +			if (ret < 0) {
> +				usb4_mode = false;
> +				dev_err(typec->dev,
> +					"Unable to activate USB4 mode, port: %d\n", port_num);
> +			}
> +		}
> +		if (!usb4_mode) {
> +			ret = typec_mode_selection_start(port->partner,
> +							 mode_selection_delay,
> +							 mode_selection_timeout);
> +			if (ret < 0)
> +				dev_err(typec->dev,
> +					"Unable to run mode selection, port: %d\n", port_num);

Wouldn't it need to go to err_cleanup and return the ret?  Or, if they
aren't considered as errors, dev_warn().

> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> index 66c546bf89b53..116329dd113f8 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -41,12 +41,16 @@ static void cros_typec_altmode_work(struct work_struct *work)
>  {
>  	struct cros_typec_altmode_data *data =
>  		container_of(work, struct cros_typec_altmode_data, work);
> +	int ret;
>  
>  	mutex_lock(&data->lock);
>  
> -	if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> -			      data->vdo_size))
> +	ret = typec_altmode_vdm(data->alt, data->header, data->vdo_data,
> +				data->vdo_size);
> +	if (ret) {
>  		dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->header);
> +		typec_altmode_state_update(data->port->partner, data->sid, ret);
> +	}

Wouldn't it need to update the state even if !ret?
