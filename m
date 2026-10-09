Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E930D4A7C80;
	Fri,  9 Oct 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545630; cv=none; b=RiopQTgStgV1pQ+r4Z9/sQj8ZiHdILEKkBeGIei221g2++doraFuh4AH+wFCoOC7JnuLkc57zatbVG9z3RmusuP6/IMFmAmGpd+oDWWWmP1X/nVB5l8GosN+D7f4u9J32unWrV8N+DK6N+hqSC2ybWo0tMVzjGZ5Bua/1+bDSIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545630; c=relaxed/simple;
	bh=5HPtR1yRL9FvJ9qsKJj/vk/FMV0i8XNX6bQbvS5t0O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn8o79p/F889LMGOuroo4sQKwv/R2OVwmRU6M/kfjSYtYsX4HDPfSI+e6lgSl7XGgGacOkgCiL0tFtZCq0+vmfZAkyfJR4QK47QCbjMfejdtvMdKq0J55Cy0XBZLLhVeRZYSRBzMDGtwQVfLfZPCk41BY5C0urx9BzIjMJoY0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVNVIe7C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVNVIe7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545619; x=1823081619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5HPtR1yRL9FvJ9qsKJj/vk/FMV0i8XNX6bQbvS5t0O8=;
  b=YVNVIe7CPSEYL1f6TA19y0fmR2XZo/U5OahnGwctH7lQDVGJ6tl+lqHC
   cGnEbbiMu0LxUBgQAyQM+eQvpARECoc98t+8jBf4OXHbWJUJqzwSXTkBC
   lVMoAPYx9Yiwt0Frj2EnCgjk1/ujlLHij+7G3y6/Hc2GMtCCFBCyitS5Q
   6v6q+8hB+Z37LabMrvAtr/gV38z3Wmgmjc3NV0ej/aYcfMoBtTaTuxF2o
   2jzg2s0V1lJxfsId2ZH8ZvzXQdn7H2PhYqctYwEwHjIzepVdu0eR/Uc6M
   6M3c0WO2VRedhNf6TRdJiOXektuUD7B97GopQAZmg3fi3eZo2Z4BcF4xd
   g==;
X-CSE-ConnectionGUID: +PHFHQYfR52GVJSAWGeGQg==
X-CSE-MsgGUID: YkrkPwDqQiab9mJw6qgFDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="229898"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="229898"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:33:38 -0700
X-CSE-ConnectionGUID: MBjBO+RFT2m8mnfg0PN3tQ==
X-CSE-MsgGUID: a6e3mOleSGiXfRifypD70g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="236188"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2026 04:33:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 79DD699; Fri, 09 Oct 2026 13:33:35 +0200 (CEST)
Date: Fri, 9 Oct 2026 13:33:35 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v2 2/3] usb: typec: tcpci: implement get_current_limit
Message-ID: <asjRD28ogxDOtory@black.igk.intel.com>
References: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
 <20261004-max77759-icl-typec-v2-2-866caf9e7d9a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004-max77759-icl-typec-v2-2-866caf9e7d9a@google.com>

On Sun, Oct 04, 2026 at 03:41:00AM +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Implement a callback for tcpc_dev::get_current_limit. This acts like a
> conduit to relay the current limit information from chip level tcpc
> drivers.
> 
> This does not introduce any functional changes for chip level drivers
> that do not implement tcpci_data::get_current_limit.
> 
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 14 ++++++++++++++
>  include/linux/usb/tcpci.h      |  6 ++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 6717ac914c6a..f1bc1ac0a556 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -250,6 +250,19 @@ static int tcpci_get_cc(struct tcpc_dev *tcpc,
>  	return 0;
>  }
>  
> +static int tcpci_get_current_limit(struct tcpc_dev *tcpc)
> +{
> +	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
> +	int ret;
> +
> +	if (!tcpci->data->get_current_limit)
> +		return 0;
> +
> +	ret = tcpci->data->get_current_limit(tcpci, tcpci->data);
> +
> +	return ret < 0 ? 0 : ret;
> +}
> +
>  static int tcpci_set_polarity(struct tcpc_dev *tcpc,
>  			      enum typec_cc_polarity polarity)
>  {
> @@ -861,6 +874,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
>  	tcpci->tcpc.set_cc = tcpci_set_cc;
>  	tcpci->tcpc.apply_rc = tcpci_apply_rc;
>  	tcpci->tcpc.get_cc = tcpci_get_cc;
> +	tcpci->tcpc.get_current_limit = tcpci_get_current_limit;
>  	tcpci->tcpc.set_polarity = tcpci_set_polarity;
>  	tcpci->tcpc.set_vconn = tcpci_set_vconn;
>  	tcpci->tcpc.start_toggling = tcpci_start_toggling;
> diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> index 9b46a6bc762c..580fbdac7ede 100644
> --- a/include/linux/usb/tcpci.h
> +++ b/include/linux/usb/tcpci.h
> @@ -205,6 +205,11 @@ struct tcpci;
>   *		swap following Discover Identity on SOP' occurs.
>   *		Return true when the TCPM is allowed to request a Vconn swap
>   *		after Discovery Identity on SOP.
> + * @get_current_limit:
> + *		Optional; Called when the port is a sink and CC=Rp-def to obtain
> + *		the current limit. Chip level drivers can implement their own
> + *		detection and return the limit in mA, or 0 when it cannot be
> + *		determined.
>   * @set_orientation:
>   *		Optional; Enable setting the connector orientation
>   *		CONFIG_STANDARD_OUTPUT (0x18) bit0.
> @@ -228,6 +233,7 @@ struct tcpci_data {
>  					     bool capable);
>  	void (*check_contaminant)(struct tcpci *tcpci, struct tcpci_data *data);
>  	bool (*attempt_vconn_swap_discovery)(struct tcpci *tcpci, struct tcpci_data *data);
> +	int (*get_current_limit)(struct tcpci *tcpci, struct tcpci_data *data);
>  };
>  
>  struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
> 
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

-- 
heikki
