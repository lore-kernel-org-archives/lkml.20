Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787DA455608;
	Fri,  9 Oct 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545677; cv=none; b=qC6jXtQPY/DrUw9NIX+mKYaPgBEghMEZW+PbAdSGmHlMs+JRyJNyillpKd6IntSmnSfsZ4x+TcdoaB18vbkpSeQL68HzAZKTFdfigTQm7i37fly5h4rPYhHBDtgEPcdObh2aViTphkRQ4YC/DrPmMwxJvYcfYhE7t91oc+dKga0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545677; c=relaxed/simple;
	bh=23b+zMkoh21et9kZDWEatciOLiUCPhucuf8ggqLjtWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MV0vv/NLxryZZtCPvt3NfOgSu14AHtiy1B8JZjPkRvtx268aso5HQC3Jl/y2rY8kNeVc1BK8qvxb+SJ2jDoaLAYcn69YxwXHx/NJzNtXyInOJr00oymM4KC44bGkP/tWDPHBj908QL1CFySF43Qysr4dIDBRU+EAfGBsWA7+Wmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDKTETq0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDKTETq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545661; x=1823081661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=23b+zMkoh21et9kZDWEatciOLiUCPhucuf8ggqLjtWI=;
  b=CDKTETq0R98n+3bkkQDmHXQ1aNtz83foW3AlcDA+2iDCLrbqQJxifN+/
   1DK81rF6VpfFFUBFqXRbQsgsyCFVZMWpPoibo2vSeVk/S7Q7M44Xsw4ci
   v/roW2X6a4+zjsjuH+q/WuVbmwTpNz9SEJz6bz6Yq7+uwdsKatE6gkCpB
   0b5DEHTvJ4mCZ6bUCzEGmoY02dCjKrFLemnN1oiZQV04alLZAdjWOZUKq
   UbXjYAbZb2TvDSK1k288+TGoTMM2SQHPNCIfW7lOZwYXSpjeFqddh2SN4
   8wryPS7E3qhvjxUiXhI7hUKfCVyvsh42oKqN6DqNOTYH9PHs7oZYr3K5a
   A==;
X-CSE-ConnectionGUID: FFrbvvT5R82UWJMKf9V/nQ==
X-CSE-MsgGUID: A/vU0DfrTRWLTGL/uN8w2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="354790"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="354790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:34:20 -0700
X-CSE-ConnectionGUID: ChLf54pMSAimHBfbbRpbQw==
X-CSE-MsgGUID: dhoTSWDDTq+Q7i1RthTJwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="612454"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2026 04:34:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 41E4F99; Fri, 09 Oct 2026 13:34:17 +0200 (CEST)
Date: Fri, 9 Oct 2026 13:34:17 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v2 3/3] usb: typec: tcpci_maxim: implement
 get_current_limit
Message-ID: <asjROWLXYbDhw8Si@black.igk.intel.com>
References: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
 <20261004-max77759-icl-typec-v2-3-866caf9e7d9a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004-max77759-icl-typec-v2-3-866caf9e7d9a@google.com>

On Sun, Oct 04, 2026 at 03:41:01AM +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Implement tcpci_data::get_current_limit for tcpci_maxim driver to report
> a value of 500 mA unconditionally. This is the max current a configured
> USB 2.0 device may draw per the USB Type-C Cable and Connector
> Specification r2.2, Sec. 4.6.2.1. This helps set a current limit and
> thus enable charging for the cases when a port is connected to a non-PD
> Type-C port partner advertising Rp-def. This is until a mechanism for
> USB core to communicate the current limit to the TCPC driver is
> implemented.
> 
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> index 998693a61839..e6f825931ba0 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -482,6 +482,20 @@ static bool max_tcpci_attempt_vconn_swap_discovery(struct tcpci *tcpci, struct t
>  	return true;
>  }
>  
> +/*
> + * This callback is used by the TCPM to determine the current limit to set when
> + * Rp-def is advertised on the CC pins. The actual current limit comes from
> + * other subsystems such as the USB gadget/host stack (USB 2.0/USB 3.2) and
> + * BC1.2. As a workaround, report the USB 2.0 current limit of 500 mA to enable
> + * charging when the device is connected to a non-PD source advertising Rp-def.
> + * This can be removed once a mechanism for the USB core to communicate the
> + * current limit to this driver is implemented.
> + */
> +static int max_tcpci_get_current_limit(struct tcpci *tcpci, struct tcpci_data *tdata)
> +{
> +	return 500;
> +}
> +
>  static void max_tcpci_unregister_tcpci_port(void *tcpci)
>  {
>  	tcpci_unregister_port(tcpci);
> @@ -523,6 +537,7 @@ static int max_tcpci_probe(struct i2c_client *client)
>  	chip->data.check_contaminant = max_tcpci_check_contaminant;
>  	chip->data.cable_comm_capable = true;
>  	chip->data.attempt_vconn_swap_discovery = max_tcpci_attempt_vconn_swap_discovery;
> +	chip->data.get_current_limit = max_tcpci_get_current_limit;
>  
>  	max_tcpci_init_regs(chip);
>  	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
> 
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

-- 
heikki
