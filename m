Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABDD44BCBE;
	Mon, 14 Sep 2026 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386217; cv=none; b=OJHZdhwM2jkwS5M6QrLRhEybvOoohYBlUxigBmxPMQI2CKJhEInc8Qx69dR70Ouye6he0C/hTuqkESGjA9QbyKL8j1Ru0tyF0vMn84ApABpqHo26ktMYFD5uxrIUmFuO7HuoRoo8XN4dn7IgQjk+A1IOQplx92deOLyq9VFt0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386217; c=relaxed/simple;
	bh=q4BhcJySF6+1PdW+DrGkGB84eT31IqdH4u6lnpAcdRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYKl+REldTHe/x2/8zfJjDsARDbx7Kg/HFBcaIWy7QMfUSBWHzRckmfBtIIwdFEtEqkKvb8WUqiWzAU7ila7DW0HMWWGzW0nDnzxcwWXHSSw/6r968OOMNRFMHBMw4VScrwmmWt1SSUSkfnmwnPUm3u3SqFWobNdNwTqfwzeROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geQz/wM3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geQz/wM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386216; x=1820922216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q4BhcJySF6+1PdW+DrGkGB84eT31IqdH4u6lnpAcdRU=;
  b=geQz/wM30/cZmuzxGEBExoJjt2E87YalaiRiafjbOdyhwZwiyjO7W0Jv
   WT1nZ5tHvFEFghcZmGK85MFDyECyam5/dr0D/yJsnauBw1SOHLsVSKNol
   YvM66F0qt1P7TmAv9tazDjJ7dQZCohtVpOPB4bp+qnCmPVyM9gxHxi5Ad
   jBB4h8xqHGHmvzh2XEae4MW6KFhJBrDgprv8wP7nwCDomzlE/yK3NYjeK
   TK22s6Jcvm9GjqWctyYlR8EGshfyF2CmIEl9VNfi5y0QyTB3jPU9cwe7E
   bC48QpHK+uqOZEeDIcVz84tdgRtVs7GGnqnDMdTCkBmu+wd7EUMlqat28
   Q==;
X-CSE-ConnectionGUID: 87+I27GbQfCPW01qQ6JKjg==
X-CSE-MsgGUID: 2fsdqEl8TRmZD1Oco1KGfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="101253459"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="101253459"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:43:36 -0700
X-CSE-ConnectionGUID: oLOXy/lTSXmyuZbnmf7Teg==
X-CSE-MsgGUID: txnpKeY+QKWQUo6qI0pC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="268330116"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 14 Sep 2026 04:43:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8BED499; Mon, 14 Sep 2026 13:43:33 +0200 (CEST)
Date: Mon, 14 Sep 2026 13:43:33 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: fix use-after-free of the kthread
 worker on port unregister
Message-ID: <aqfd5Xm99P4BaTSp@black.igk.intel.com>
References: <20260907183041.8253-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907183041.8253-1-royalnet026@gmail.com>

On Mon, Sep 07, 2026 at 08:30:41PM +0200, Igor Paunovic wrote:
> tcpm_unregister_port() destroys the port's kthread worker first and
> calls tcpm_reset_port() afterwards.  Since the Discover Identity retry
> mechanism was added, tcpm_reset_port() calls
> mod_vdm_discovery_cancel_delayed_work(), which does
> kthread_cancel_work_sync(&port->vdm_discovery_work).  That dereferences
> work->worker, which still points at the worker that
> kthread_destroy_worker() has already freed:
> 
>   tcpm_unregister_port()
>     kthread_destroy_worker(port->wq)      -> kfree(worker)
>     ...
>     tcpm_reset_port()
>       mod_vdm_discovery_cancel_delayed_work()
>         kthread_cancel_work_sync(&port->vdm_discovery_work)
>           __kthread_cancel_work_sync()
>             raw_spin_lock_irqsave(&worker->lock, ...)   <- freed memory
> 
> KASAN report on 7.3-rc1 when unbinding a fusb302 port (RK3588):
> 
>   BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x10c/0x210
>   Write of size 4 at addr ffff00010122ef04 by task bash/8349
>   Call trace:
>    _raw_spin_lock_irqsave+0x10c/0x210
>    __kthread_cancel_work_sync+0x60/0x408
>    kthread_cancel_work_sync+0x20/0x48
>    tcpm_reset_port+0x18c/0xb80 [tcpm]
>    tcpm_unregister_port+0x104/0x2f8 [tcpm]
>    fusb302_remove+0xc8/0x200 [fusb302]
>    i2c_device_remove+0x7c/0x288
>    ...
>   Allocated by task 112:
>    kthread_create_worker_on_node+0x14c/0x2c8
>    tcpm_register_port+0x288/0x3918 [tcpm]
>    fusb302_probe+0x604/0xc88 [fusb302]
>   Freed by task 8349:
>    kfree+0x260/0x558
>    kthread_destroy_worker+0xa0/0x130
>    tcpm_unregister_port+0x74/0x2f8 [tcpm]
>    fusb302_remove+0xc8/0x200 [fusb302]
> 
> With CONFIG_PROVE_LOCKING the same unbind shows up as
> "DEBUG_LOCKS_WARN_ON(lock->magic != lock)" in __lock_acquire, followed
> by an oops in the unbinding task, which then exits with interrupts
> disabled and the following shutdown hangs.
> 
> The work itself cannot be pending at that point: kthread_destroy_worker()
> has flushed the worker and the discovery timer is cancelled right before
> the cancel call.  So just remember that the worker is gone and skip the
> cancel in that case.
> 
> Tested on an Orange Pi 5 Plus (RK3588, fusb302) with KASAN: unbinding
> the port reports the use-after-free above without this patch and
> nothing with it; the port binds again fine afterwards in both cases.
> 
> Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Assisted-by: LLM

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a8cd1959c426f..e47d674c2ae00 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1756,7 +1756,8 @@ static void mod_enable_frs_delayed_work(struct tcpm_port *port, unsigned int del
>  static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *port)
>  {
>  	hrtimer_cancel(&port->vdm_discovery_timer);
> -	kthread_cancel_work_sync(&port->vdm_discovery_work);
> +	if (port->wq)
> +		kthread_cancel_work_sync(&port->vdm_discovery_work);
>  }
>  
>  static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
> @@ -8961,6 +8962,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  
>  	port->registered = false;
>  	kthread_destroy_worker(port->wq);
> +	port->wq = NULL;
>  
>  	hrtimer_cancel(&port->vdm_discovery_timer);
>  	hrtimer_cancel(&port->enable_frs_timer);
> -- 
> 2.43.0

-- 
heikki
