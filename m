Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969365;
	b=QS4/fK+syRUwXQ9suUCZlWl1Vlyw6NtVKqf1jjHXylch0wxv73eX/vugv4zrLuIeom3e
	 oUF2pY2NjYe6RMqq5wZ88UK8t1Ls7RAHxAM02Gnv/xM8qkhmmd7KczNf1ddIn/C6ISlrA
	 XBymGyosZAy6y/tspsENKMEdF4oUPXGBtL+EN2Tz3caITpvt6lsoKPx+M7hWPZCQtlnJQ
	 V98Y2jFGHvmCr+W+iLTX8ivVUhOajgpN9ImHhDUMQVSn5VZr4N5WuWhzIjbgf14Wpfyhb
	 DIRCM5fNBwwdlL1kbgPhT9wu2fIts7kHGeYN4CbuUiw8JrjT8tztB/zQhqEvmNSBHvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969365;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aWYA3HOlAgYAoj0EA05QmOrQHMLTgMY6Em1JDzHAFEE=;
	b=rYstRwCWvQf56CAuOw4JVM/crFR3+LXeK0C24IpjDlgWuCNFJTZLXLNZyjKQv2NjKZhQ
	 wDHYNpL912yETFsQ1Uk9tFle3dOKZzedOtKj2HH6rTpPizBDNUnIqniP30CIvjrvWFuBu
	 leyGvmO64GOlCCUVbeeUjGUDhK3mmZev8Sp+2A9UjzzUkbAPd4HGnmXLGUKktXPwPk2xB
	 hCQ5Fl0vNkJEBsDHagoa9Dp5KV+LaJQnfXSUunIQpOUMmTza1TocYBIqv4bTZ0g6yxg3P
	 soLgn4SYM2rkhMSx3G9InR7mmsrJhgVHT8/+44OSvXf/YSpHeGd/pjFw9ucDzyUVgWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YSg7ihsX;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F998606A326;
	Fri,  6 Nov 2026 12:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F998606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YSg7ihsX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793969364; x=1825505364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KJHH4ztMaKDc+dgK/SwlHTdb4i0Oq8m/K0ceqqeR3sE=;
  b=YSg7ihsX93IQ4a0rHOGaazHZztA6UVEMraeA0+k19u200d0Skct1pqGO
   YxyoptENK89IcxXayAEfc7Jq9AvavQB8hSLx+FoKLXuXUCmpe82bsdL2q
   g98kjO8pYQ9u2tInaxJLa+fbVUysv1kOwBzRhNQqkmFI2wlAF38nmj1B9
   oVKtgQD28yO182eoayDADtuuM9x9QQEMoLnuQOoQxypDe7axETVVPPiR8
   fp58ev8WFP7xQ2YV1SXJFezICJ68H5y5h0BTa572SXypM8ezCo0O7AW+B
   rLRDcajfejeTHngOT2PUlKY54j+lvOmNf5JsNbJKy7f51p4HSwLNJvLKE
   w==;
X-CSE-ConnectionGUID: rqJkN79YQp2N6cyPw1lOsA==
X-CSE-MsgGUID: zRWY5rbjRN6zCw6KvdBuCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2658238"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2658238"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:49:24 -0800
X-CSE-ConnectionGUID: lSXEGoUOTnq4otQThcT8lw==
X-CSE-MsgGUID: Dw6XDNCQTQCvbVvXZohIeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7629652"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2026 04:49:22 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D5FD599; Fri, 06 Nov 2026 13:49:20 +0100 (CET)
Date: Fri, 6 Nov 2026 13:49:20 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH 11/19] usb: typec: tcpm: don't wait for the VDM discovery
 work
Message-ID: <au3M0An1DKvfuce9@black.igk.intel.com>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-11-b9751ddb9c7c@linuxfoundation.org>
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
In-Reply-To: <20261027-llm-usb-v1-11-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:51PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> mod_vdm_discovery_cancel_delayed_work() calls kthread_cancel_work_sync()
> with port->lock held, and tcpm_vdm_discovery_work() starts by taking
> that lock.  This is fine as long as the caller runs on the kthread
> worker of the port, like the work.  But tcpm_reset_port() is also
> reached from tcpm_tcpc_reset(), which tcpci_irq() calls from its
> interrupt thread.  If the work is running, it waits for the lock while
> the holder of the lock waits for the work.
> 
> Use a flag instead, protected by port->lock, which is set when the work
> is scheduled and cleared when it is cancelled.  The work returns at once
> if the flag is not set.
> 
> tcpm_unregister_port() calls tcpm_reset_port() after it has destroyed
> the worker.  Commit 98d00deb6ae4 ("usb: typec: tcpm: fix use-after-free
> of the kthread worker on port unregister") put a test of port->wq in
> front of the cancel for that case.  Nothing is cancelled any more, so
> the test goes.
> 
> Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
> Cc: stable <stable@kernel.org>
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef5210..600e820a7b93 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -542,6 +542,7 @@ struct tcpm_port {
>  	struct kthread_work enable_frs;
>  	struct hrtimer vdm_discovery_timer;
>  	struct kthread_work vdm_discovery_work;
> +	bool vdm_discovery_armed;
>  	bool state_machine_running;
>  	/* Set to true when VDM State Machine has following actions. */
>  	bool vdm_sm_running;
> @@ -1768,15 +1769,20 @@ static void mod_enable_frs_delayed_work(struct tcpm_port *port, unsigned int del
>  	}
>  }
>  
> +/*
> + * Called with port->lock held, which the work takes, and not only from the
> + * worker: the work cannot be waited for.  It does nothing unless it is armed.
> + */
>  static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *port)
>  {
>  	hrtimer_cancel(&port->vdm_discovery_timer);
> -	if (port->wq)
> -		kthread_cancel_work_sync(&port->vdm_discovery_work);
> +	port->vdm_discovery_armed = false;
>  }
>  
>  static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
>  {
> +	port->vdm_discovery_armed = true;
> +
>  	if (delay_ms) {
>  		hrtimer_start(&port->vdm_discovery_timer, ms_to_ktime(delay_ms), HRTIMER_MODE_REL);
>  	} else {
> @@ -7295,6 +7301,10 @@ static void tcpm_vdm_discovery_work(struct kthread_work *work)
>  
>  	mutex_lock(&port->lock);
>  
> +	if (!port->vdm_discovery_armed)
> +		goto unlock;
> +	port->vdm_discovery_armed = false;
> +
>  	tcpm_log_force(port, "%s state [%s]", __func__,
>  		       vdm_discovery_state_strings[port->vdm_discovery_state]);
>  
> 
> -- 
> 2.56.0

-- 
heikki
