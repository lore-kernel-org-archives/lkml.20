Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913685;
	b=Yl/AgkOPORIhVW6PdDwREx8lYi5bJhedas+63f+nKB7NxWntg2FAoXNx3fJlrTptiQsm
	 byJl1HQrt0sMOMHXkoWW5BsIt9CDzAFtPbtnh4L7wUbtREO8oIzqsmqhRunre+PacUeaD
	 KJV9Y0HFyHGx0GapFIGVYntRr/O/83F5h88NCPT7PeUUQ9NUfFqGmlRZci6AAPayM9tJd
	 xp+A2Lziv/LGstjnMYCk9CtpV+XivEwVjEzKcyyGCaOa1a3uZg/cul9wlla5vgZThlYFV
	 KnTDdGg1TN8rxt5Hh0w6Vu7tTqjJ1VpTbD5eZ/iWI6rX5k9Jq9rfux78bfX/24zWZhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913685;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9mJdv7IBp1vrnjWhiM2rfjqM7TJq9bWvqxtxczIfylA=;
	b=efFuPrvyIxA/gFh8FyhLVaUVLOFUTnWLPW1H0cfn4wTdkFAG/sRGxB7u7EgBOyVZQPDa
	 vQ5/98PPW6w/+5PHxWC3z48KoNoEVi39BDuJcewJSr5ZESUPyAoR4I2PhODPeApvK32C8
	 tf4pWm4+2MhJQ9nYkkGAzrMdHoGHuC8f7Smt2ZksETTqFVdWnKETfXM85GRNmurOJrRNR
	 WPsIRKSQe4Zft24M2UyJpX4pwHup7JS5E/IgdxSoHBSELKyOIhrvO+kSxbjWzN/rOoUHZ
	 TH98+kyZkWeuf3pu28cdVA7ULnHx1PC3iLjfmE92Cbmdk6XrnXd2+sN/LV/p63+RXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQDj9ygf;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B2606A31C;
	Tue, 17 Nov 2026 11:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E23B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQDj9ygf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794913684; x=1826449684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XIQlG/YLXOmj1bStuA+OXVwGx1sc0S2A+g81QmG0bUY=;
  b=WQDj9ygfchjAuskiic2re2P157AFrd6twseYJ4IuXIJ2ENWEyfZo4VE5
   9Leg98I7BOUipX5GsVO8rY/0WUcf/x4jhJM0GhnP5Xa7+Bj8cHUKTbCaX
   p/SLNxgxCHbIx9vJu7u69ZQreIpg43yWMf6ljkjbsNqGD/72BtKIJ6yCO
   6vB4mawBycu/2+1NZpM/w4nfwuolGPx5wy7kryikMMwoc23Dz2WImACMP
   +FpBl0AHh5hFsXs3dRbdJTKp6dmVfxsqZA3meCzGKsw+Jg7AOXt5ST6ZX
   t4oraBWyKrCPSKCRaw7enyEzyU8vr3YF/F168HLSshf03yz0R687hi3mj
   A==;
X-CSE-ConnectionGUID: B+vsGtbnR0CPS/pqmAb3IQ==
X-CSE-MsgGUID: IpzIEo5BRCiOgZoxWdINbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3670703"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3670703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:08:02 -0800
X-CSE-ConnectionGUID: 9ujJLLBfRGmhz7fhh6vguw==
X-CSE-MsgGUID: jYOuMPHxSTalBIGogOP17Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9867989"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2026 03:08:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 4503099; Tue, 17 Nov 2026 12:08:00 +0100 (CET)
Date: Tue, 17 Nov 2026 12:08:00 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jacob Procee <sn125164@gmail.com>, Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <avw1kOqmrUii-msr@black.igk.intel.com>
References: <20261112113005.16418-1-sn125164@gmail.com>
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
In-Reply-To: <20261112113005.16418-1-sn125164@gmail.com>

On Thu, Nov 12, 2026 at 12:30:05PM +0100, Jacob Procee wrote:
> On Apple Silicon the Type-C PHY and the dwc3 controller behind a CD321x
> port lose their state during s2idle while the plug stays connected, and
> the CD321x does not raise an interrupt on resume. xhci notices the lost
> state and re-initializes the host controller:
> 
>   xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
>   usb 1-1: USB disconnect, device number 2
> 
> but the PHY is only ever programmed from typec_mux_set(), so a device
> left plugged in (here a FIDO2 security key) never comes back until it is
> unplugged and plugged in again.
> 
> Re-initializing only dwc3 after resume does not work: tearing dwc3 down
> also powers off the PHY, and nothing turns it back on, so xhci then
> times out ("Host halt failed, -110", "can't setup: -110").
> 
> Instead, make cd321x replay the plug on resume when a partner was
> connected: mark the plug as changed and queue the update work, which
> then goes through the same sequence as a real replug (role none, mux
> safe, mux back to the partner's mode, role back on). Queue it on
> system_freezable_wq so it runs only after all devices have resumed.
> 
> Tested on a 14" MacBook Pro (M1 Pro, j314s) with a backport of this
> change to the Asahi 7.3.3 kernel: a USB-C security key left plugged in
> re-enumerates right after "PM: suspend exit", where it previously stayed
> gone until replugged. Unplugging the device while the system is asleep
> also works: after resume the role goes to none, nothing is brought back
> up, and replugging it later enumerates normally. This mainline version
> was build-tested only (W=1, checkpatch --strict clean).
> 
> Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
> Assisted-by: LLM
> Signed-off-by: Jacob Procee <sn125164@gmail.com>

Looks okay to me, but as this is a fix, you should CC stable:
https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

Sven, would you be interested, or would you have time, to maintain
this driver?

Thanks,

> ---
> checkpatch flags the Assisted-by tag (non-standard signature, 'LLM' is
> not an email address); the format follows
> Documentation/process/coding-assistants.rst.
> 
>  drivers/usb/typec/tipd/core.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 02539378ffed..2ec380124532 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -164,6 +164,7 @@ struct tipd_data {
>  	bool (*read_power_status)(struct tps6598x *tps);
>  	int (*reset)(struct tps6598x *tps);
>  	int (*connect)(struct tps6598x *tps, u32 status);
> +	void (*resume)(struct tps6598x *tps);
>  };
>  
>  struct tps6598x {
> @@ -911,6 +912,21 @@ static int cd321x_connect(struct tps6598x *tps, u32 status)
>  	return 0;
>  }
>  
> +static void cd321x_resume(struct tps6598x *tps)
> +{
> +	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
> +
> +	guard(mutex)(&tps->lock);
> +
> +	if (IS_ERR_OR_NULL(tps->partner))
> +		return;
> +
> +	cd321x->update_status.status_changed |= TPS_STATUS_PLUG_PRESENT;
> +	cancel_delayed_work(&cd321x->update_work);
> +	queue_delayed_work(system_freezable_wq, &cd321x->update_work,
> +			   msecs_to_jiffies(CD321X_DEBOUNCE_DELAY_MS));
> +}
> +
>  static irqreturn_t cd321x_interrupt(int irq, void *data)
>  {
>  	struct tps6598x *tps = data;
> @@ -2014,6 +2030,9 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
>  		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
>  				   msecs_to_jiffies(POLL_INTERVAL));
>  
> +	if (tps->data->resume)
> +		tps->data->resume(tps);
> +
>  	return 0;
>  }
>  
> @@ -2040,6 +2059,7 @@ static const struct tipd_data cd321x_data = {
>  	.reset = cd321x_reset,
>  	.switch_power_state = cd321x_switch_power_state,
>  	.connect = cd321x_connect,
> +	.resume = cd321x_resume,
>  };
>  
>  static const struct tipd_data tps6598x_data = {
> -- 
> 2.56.0

-- 
heikki
