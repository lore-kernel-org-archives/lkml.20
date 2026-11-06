Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976851;
	b=RSt2yQ/EQWVIXKE1IOrvIZBD9UkyHtFHh4UofkbnsGFkmEpj3B5HGbPjj6V+0P+1bXcf
	 xx5tz4iYbLYKjY1Wnwvus99l24YO/NDfggIi0e6yJe17qPQWEjwkiU870Bt7guqfSU7vj
	 Lazn5A6ZLpHwaDQmEpktLpZf+fUyynBO+w4G3GX4iVU2rnvvT2WIlpHl22fQ05StENGSb
	 dQT6X917UMcrqWtv2e/FChLdVDwdFmcXklWe4UwdfxXlIY1wZZ3jlAO5hXRXwm7NLuxFt
	 iInyHl1B0OC1rfbxQAZqxvC6TYxm6NHRcyycC6bSFJu5Ki8pF4NqS/jvN0L4QqqQ1FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976851;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=O3YmW0BbhxwcbBCPm1vGZAcOKmRX7wdgt/lQRqqF2Jk=;
	b=bMutFe5rv19r9VOlUCGwvzQ1R14vFMaSksxQXv+TgpjWpLk43W91Kyqx/hskUfbxxLts
	 09zyQNlxMjFd4N1F/lscLwhFRyKm4SMJ9ZVRp62MZR9uqgP0ufwkzYtorJeaO1HWiElTe
	 BqrZE5woqd1ajX1pBFOWzePtLADaXN5UWXr0rhHN7CFEULZCH056Vutqw/a+SBu8BF6qa
	 Ofo9KXm+8eKuHMAw9AKbVxC5ZjkiLvorXxwTaFshW8+u/rtke6yaXETjXAlee4NPWPQYJ
	 gM0lJOVmQwGa6gwZoV6cUjGfdBNdqjtAcpvg8+KE7IaMBL/FRSCMCAp3ddp1JBQHxOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LtEPX2k3;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD7606A329;
	Fri,  6 Nov 2026 14:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FD7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LtEPX2k3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793976850; x=1825512850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZuBdw5DmXTfIFkI82MvJcqrcC6PuDLNBfHrf3a8NSnw=;
  b=LtEPX2k38ftzb3iZmgk5ly7YTziC6Aod8gyM68e5AT2y10CVrnDsD6uY
   keUWP2EavwwM4vVi3XydxqrggmlBnAwZa5082A1C+pryMWO/uiW03p37a
   3NMU/dctJEu6XUSioDVkMhhdy1Bm2CcUFLBoOBAfFza7RkWWTAyRhyxqy
   j8r2d+Ak/4ZJAdmeT6kh2bNrHhCC9Mn1j0YVbgEEx2ZgGRIQ8QXElzzaA
   853uzodDrJ6ZWH2UJPwG5OnhzSfZFPa1TVKWvm30mkP9B09vf94H5PeNp
   fUguy6LmhxFrfteHpQoV5voaREbNta+Bfw/f9Mh31MpVfF0DSj3gTQ49l
   w==;
X-CSE-ConnectionGUID: dgHERlRYQ9Cg3WtfJRXYLw==
X-CSE-MsgGUID: ND1tkqSYTCeiIjuab9I2vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2678410"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2678410"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 06:54:10 -0800
X-CSE-ConnectionGUID: PfkvRGDlRJiFi2SaS6w1VA==
X-CSE-MsgGUID: iNJCUPdoThSSQUyyxzSTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9056552"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 06 Nov 2026 06:54:09 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5C2BE99; Fri, 06 Nov 2026 15:54:07 +0100 (CET)
Date: Fri, 6 Nov 2026 15:54:07 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH 14/19] usb: typec: mux: it5205: fix oops on accessory
 modes
Message-ID: <au3qDw094t54vE_a@black.igk.intel.com>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-14-b9751ddb9c7c@linuxfoundation.org>
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
In-Reply-To: <20261027-llm-usb-v1-14-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:54PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> typec_set_mode() passes a state without an alternate mode, and the USB
> and accessory modes (TYPEC_MODE_USB2 ... TYPEC_MODE_DEBUG) start at
> TYPEC_STATE_MODAL like the states of the alternate modes. TCPM and UCSI
> set TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG when such an accessory is
> attached. it5205_mux_set() then reads state->alt->svid: plugging in an
> analog audio adapter is a NULL pointer dereference.

Please just explain here that the code is accessing state->alt->svid
without first checking does state->alt exist.

Then make a note that state->alt is NULL if for example TCPM sets the
mux to an accessory mode TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG.

> The numbers must not reach the switch either: TYPEC_MODE_AUDIO has the
> value of TYPEC_DP_STATE_D. Without an alternate mode connect the
> SuperSpeed lanes for TYPEC_MODE_USB3 and disconnect them for the rest.

I think what that is trying to say is that this driver needs to handle
the mode value separately with the "normal" USB Type-C modes and the
alternate modes, because those values overlap, right?

> Fixes: 41fe9ea1696c ("usb: typec: mux: Add ITE IT5205 Alternate Mode Passive MUX driver")
> Cc: stable <stable@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/typec/mux/it5205.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
> index 2ab2ba6a3cbd..00d5bd55e423 100644
> --- a/drivers/usb/typec/mux/it5205.c
> +++ b/drivers/usb/typec/mux/it5205.c
> @@ -92,13 +92,19 @@ static int it5205_switch_set(struct typec_switch_dev *sw, enum typec_orientation
>  static int it5205_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
>  {
>  	struct it5205 *it = typec_mux_get_drvdata(mux);
> +	unsigned long mode = state->mode;
>  	u8 val;
>  
> -	if (state->mode >= TYPEC_STATE_MODAL &&
> -	    state->alt->svid != USB_TYPEC_DP_SID)
> -		return -EINVAL;
> +	if (mode >= TYPEC_STATE_MODAL) {
> +		/* USB and accessory modes: not the DP pin assignments */
> +		if (!state->alt)
> +			mode = mode == TYPEC_MODE_USB3 ? TYPEC_STATE_USB :
> +							 TYPEC_STATE_SAFE;

So now if the mux is set to an accessory mode, this function returns
successfully, even thought the connector is not actually in that
accessory mode?

Return -EINVAL in that case?

thanks,


> +		else if (state->alt->svid != USB_TYPEC_DP_SID)
> +			return -EINVAL;
> +	}

-- 
heikki
