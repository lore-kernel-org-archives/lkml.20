Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912197;
	b=x/Cpi41nvNPdRjsINqoE5KCoTwgKGLBhuC8Gkv7Jp7q11vDGRwH7ead4ZPoiYYGDneeB
	 +HbkSAA2oudwYgiWPEgWKdtPP14mt5rHIQkYomVTQjWOtWTRhgLtwQw4ZlKCrg8kMd/SE
	 /srq2BmKevGd/Snqa1JKh3IpJukzs+DeGmEpwtsDpuIunp41slT1D5yth3FRyuyfCXtpb
	 OEe7DnxjNiDNQyKuXKkAmqyfLwODXJacsJ5nFTNz8DlJs+FQ7kis848WUg5xxfHtN2Bku
	 qIiz2Jah3PWf76zqRUXb2c97NO4FTCOv5EjYOfCa8Gl/l7acwwZW8HHptmWcKm3l5Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912197;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6Bx6aGWAfxN03v1MCMPsA0sS0oGqYFrxfyvjdLje8lg=;
	b=UsFAAvBN6U9TxLJPLjXPhSAlJugW21dYk5lsskWHjwGcKoky7N0UABzaGYR/GtBJOenq
	 pti3cG474LUYue+ilccz4+TwhJVh0kOaGuJy+xAQC3RNTKTBPqpsEWrBT4+Q+dpJZk72H
	 zot4WcUjKBdyAUoy40x+MyFF0KwKDKY1pwp1MA6WzzAd0CHuB4B/pZt71kncTUgc6/p3o
	 KSE2pGTIdZ8KoM4oiRaWw1u2l+UpAloxion4dfYTNsMEMgWFIOxcHF6lJom/+DFwubh2i
	 +Qi5M9/lCfKuxgyUpDYtg5alR/05XtXXZD7AwI/3929mqi4AdB5LBObdjSTLYw7Nf/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PA3h6R6d;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87497606A31C;
	Tue, 17 Nov 2026 10:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87497606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PA3h6R6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794912197; x=1826448197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+rZ70jL9NuYsutro/ekKRtcwGGOxbC6WYytJj8x+/8=;
  b=PA3h6R6d/VRwHZrSA3hU2ErZ+cR1nv3MLnk43Q3GimPsiWDVx2irWz1d
   +u7nzZkTdWPf71gh0ZMhNJioX/DKZVPAaja6FO4YVcL3ASa8M4tB7faAU
   Yr4SghX6FY/vJnmSFpFhYPLPulU7ehYoKg4j7ph5d44f8xQAwgRjMzryv
   aDhr0ZOFBEG0Y3PGKrElc3LyRMluYujZrgswP0t5jZUdCb9Y9xJsPSqMI
   GfUgEfJbzbd3/DlbqE5ayhWhakCn8P4wnGSCEY3mkFTcvIgm2ZJEXUtTc
   XR2xdcngyOp/exXwiYeepbcKDOZ1Y29LhpJb7fkYOsdK5M4HwyezdA5NQ
   g==;
X-CSE-ConnectionGUID: 7YQcWJuaQ5SlvNI7iuWIPw==
X-CSE-MsgGUID: u8SaPZSbSZK1graYWmtGNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3600973"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3600973"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:43:16 -0800
X-CSE-ConnectionGUID: Nzqs3jYXS5GkPf0gSVdZKA==
X-CSE-MsgGUID: 3cq5BzNoSAaTy3999ZO3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9742331"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 02:43:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 22A2C99; Tue, 17 Nov 2026 11:43:12 +0100 (CET)
Date: Tue, 17 Nov 2026 11:43:12 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: aiyengar1990@gmail.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/2] usb: typec: fusb302: Toggle with the default Rp
 current
Message-ID: <avwvwBLFBHCc36dc@black.igk.intel.com>
References: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
 <20261112-tcpm-attach-reboot-v2-2-b4bc6ca83490@gmail.com>
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
In-Reply-To: <20261112-tcpm-attach-reboot-v2-2-b4bc6ca83490@gmail.com>

On Thu, Nov 12, 2026 at 08:23:34AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> tcpm_start_toggling() programs the Rp current that tcpm asks for, which
> is the current of the source PDO (Rp 3.0A on boards that can source
> 3A) when the port starts toggling from Unattached.SRC, and the default
> current when it starts from Unattached.SNK after a detach.
> 
> A Genesys Logic based USB-C to DisplayPort cable connected to the
> Orange Pi 5 is often not detected after a warm reboot: the FUSB302
> toggle state machine raises no interrupt with it while it drives the
> high Rp current, but finds it within seconds once toggling restarts
> with the default current after another device was detached.
> 
> Toggle with the default current, and switch to the requested one when
> toggling stops on a sink, before tcpm is told about the attach, so the
> sink sees the configured level from the start of the connection as
> before. tcpm does not set it again after attach on every path (not on
> ports without PD, for instance). The Rd detection threshold used for
> unplug detection follows the restored current.
> 
> The FUSB302B datasheet sets the toggle up the same way: under "Toggle
> Functionality" the processor writes HOST_CUR for the default current
> before it sets TOGGLE, and a HOST_CUR change after attach is applied to
> the CC line immediately ("HOST_CUR Changed After Attach").
> 
> Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Looks okay to me, but you need to CC stable:
https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

But let's wait for comments from Badhri to the tcpm patch.

Thanks,

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 3319f6a2b0c9..44aa05fd4ba2 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -97,6 +97,7 @@ struct fusb302_chip {
>  	/* chip status */
>  	enum toggling_mode toggling_mode;
>  	enum src_current_status src_current_status;
> +	enum src_current_status toggling_src_current;
>  	bool intr_togdone;
>  	bool intr_bc_lvl;
>  	bool intr_comp_chng;
> @@ -942,10 +943,19 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>  	}
>  
>  	mutex_lock(&chip->lock);
> -	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
> +	/*
> +	 * Look for a partner with the default USB current advertisement.
> +	 * Some sinks (seen with a Genesys Logic based USB-C to DisplayPort
> +	 * cable) present an Rd that the FUSB302 toggle state machine does
> +	 * not detect while it drives the high (3.0 A) Rp current, so they
> +	 * are only found when toggling starts from the sink side. The
> +	 * requested current is restored when toggling finds a sink.
> +	 */
> +	chip->toggling_src_current = cc_src_current[cc];
> +	ret = fusb302_set_src_current(chip, SRC_CURRENT_DEFAULT);
>  	if (ret < 0) {
>  		fusb302_log(chip, "unable to set src current %s, ret=%d",
> -			    typec_cc_status_name[cc], ret);
> +			    typec_cc_status_name[TYPEC_CC_RP_DEF], ret);
>  		goto done;
>  	}
>  	ret = fusb302_set_toggling(chip, mode);
> @@ -1357,6 +1367,13 @@ static int fusb302_handle_togdone_src(struct fusb302_chip *chip,
>  			    typec_cc_status_name[cc2]);
>  		return fusb302_set_toggling(chip, toggling_mode);
>  	}
> +	/* advertise the requested Rp current now that a sink is attached */
> +	ret = fusb302_set_src_current(chip, chip->toggling_src_current);
> +	if (ret < 0) {
> +		fusb302_log(chip, "cannot set src current, ret=%d", ret);
> +		return ret;
> +	}
> +	rd_mda = rd_mda_value[chip->src_current_status];
>  	/* set polarity and pull_up, pull_down */
>  	ret = fusb302_set_cc_polarity_and_pull(chip, cc_polarity, true, false);
>  	if (ret < 0) {
> 
> -- 
> 2.55.0
> 

-- 
heikki
