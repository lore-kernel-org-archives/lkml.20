Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AA24D0CED;
	Fri,  9 Oct 2026 11:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545595; cv=none; b=c4GCv+nqs9ncb1WpdXXQwW8gzgSbG5UrGdKlsXECOaQyiFfzIF++WlEyLbvsRr/YE8BlBg41GreIERrB/620lb8juTiY7w7PVQR4H+gGnFEesCLZPTfIZUg7dXd3Y0V3231GRM2F49HN6vdte0rLiomRrZr/21rK1An/TB9PuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545595; c=relaxed/simple;
	bh=TUfHdGa8/sZdEYwjjcHynpuXt8blul/cREq1riEroyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGuvi+lcKmF6u4WPkCPEJYwUJL0AC+LhUAaCxRfmBfEL1QQK+vUWLGG4D4fWuCpCiNTg72b+Qguteka+CgX7i/0sVhVWyhb767i1s3L0oPFvIU8oDtQWGApYNpn0aUCyh6mKMI83aEVPZ7x/TsuGH4SnxE8HNFDZw2naN/u2PgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5K8HBr7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5K8HBr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545584; x=1823081584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TUfHdGa8/sZdEYwjjcHynpuXt8blul/cREq1riEroyQ=;
  b=e5K8HBr7Z/KbA+oioRpK7S/p2ASu3tpft1I/BVwU+ki9lYEnxlxHk894
   WYalllq9ciwWcBuagzTxSFxwtWPJTy/o/WJqZ9+w538DUQuXsFiLn5R8N
   Z/IxT4+5SmfI8vQGI39s6YTxWSqmrFBpiRlsksuvUdtzFPVhCtXtIQEmn
   rZyfIWhExLGlFSwaqUJxBHQFad9m/KsniITeUnHI79SuYe89/BByOzMl+
   Zr1+wtc7Wo2ySG4dNo/i8TqSA1Xw2B2T8o5btcGD7AMJZRVBicrymlzyC
   sIgdUNfeTt9PsbkWgNBfeOF9RUrS0LEeYkOVJLrJndfLarMHLnaoUONfc
   A==;
X-CSE-ConnectionGUID: tZb7hOT7TreUQibke7YyLw==
X-CSE-MsgGUID: Mx0wvkSyTUKBd7qgWKC/xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="229775"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="229775"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:33:04 -0700
X-CSE-ConnectionGUID: /ifEVjkoSBu2rl67NeRHmA==
X-CSE-MsgGUID: enFB2cQTSDmQMU2yhQAhXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="259893"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 09 Oct 2026 04:33:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0EEDE99; Fri, 09 Oct 2026 13:33:01 +0200 (CEST)
Date: Fri, 9 Oct 2026 13:33:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v2 1/3] usb: typec: tcpm: only call get_current_limit()
 for cc=Rp-def
Message-ID: <asjQ7d0rjEX9B4-z@black.igk.intel.com>
References: <20261004-max77759-icl-typec-v2-0-866caf9e7d9a@google.com>
 <20261004-max77759-icl-typec-v2-1-866caf9e7d9a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004-max77759-icl-typec-v2-1-866caf9e7d9a@google.com>

On Sun, Oct 04, 2026 at 03:40:59AM +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> tcpm_get_current_limit() folds the default label into the
> TYPEC_CC_RP_DEF case, so tcpc_dev::get_current_limit() is also called
> for CC states that do not advertise Rp, such as TYPEC_CC_OPEN,
> TYPEC_CC_RA and TYPEC_CC_RD. Its kerneldoc has always scoped it to
> cc=Rp-def:
> 
>   @get_current_limit:
>           Optional; called by the tcpm core when configured as a snk
>           and cc=Rp-def. This allows the tcpm to provide a fallback
>           current-limit detection method for the cc=Rp-def case.
> 
> A chip driver has nothing to interpret in the other states. Therefore,
> split the cases and report 0 when CC is not an Rp.
> 
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 2d6b14aa2085..cb69d6a7ce5a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1279,12 +1279,14 @@ static u32 tcpm_get_current_limit(struct tcpm_port *port)
>  		limit = 3000;
>  		break;
>  	case TYPEC_CC_RP_DEF:
> -	default:
>  		if (port->tcpc->get_current_limit)
>  			limit = port->tcpc->get_current_limit(port->tcpc);
>  		else
>  			limit = 0;
>  		break;
> +	default:
> +		limit = 0;
> +		break;
>  	}
>  
>  	return limit;
> 
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

-- 
heikki
