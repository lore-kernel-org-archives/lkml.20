Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909692;
	b=A3e6UHr7R/AXzG9/HFlMF31pJ9zKE1Pz8EF3zVSDs8Q0b0MlYHH8JcPUkVjWI9qUD/b3
	 Q+uWJsLMI7VYhgx1gC+Rw+FZNmbdCfBOs+1XvEsRqcMpJ9VEaik44HHEqueeZZ52VPZiV
	 aC/rI8FKdIZWZr1aFPKCpp8psxgXCiE9z6cpyzKF0b7fNl18YiVqCsSccI5n+Yi1iXGrx
	 f9qapZTQzJ8F2LktKU+vKc0fiNgD/dKPXXGJTwaHFGiyePTS83gbrcvNXueKAAhkXuZ00
	 X69Hgf95Ni8q25dzKrDRcwCnrmzfUuuJtE9QRRAFkvT1J1NJ2Mu5l8h71e024TQ/Pbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909692;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=et18X4Ng0Fjig9rzTGxRYAn17g6RTdw2MICRTQhTMbM=;
	b=qODuYZ2aPMPBIEIH7mzdaoJE4o8GJq9zJ9y2KQG9mHlIG10kEADvJmQOFOiB0s0BBsPg
	 Ogl4V17oYwlCbdOklQkddcRh9sYdjAfK+xLeAroc913rdUX5rZFEXETcVGaMWw/ID4Aaj
	 5ZxI+KNmDIb4rINoyAkIGxuXOONvUJPHUphZxDhQYwGi3JV3LrZXhksF7h2ZWs6OHBm6u
	 cbrGvGgebVN512IGk9sflJLPrm9nwcynXOEc1tGuSq1DzY526dOWFpwuSImr+KxM7jvZ1
	 YNH4MheODzi+gvwMtHiAUlG2MXpAqFH1gyUK2YLBiTp8nyxRhOMMAKL+8c+4w3x7pug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hjL1zXAW;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC6606A31C;
	Tue, 17 Nov 2026 10:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hjL1zXAW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794909692; x=1826445692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0xcXQ2Wvn+sq++2Vcd1edi+DAfglOLDKAc3j8R6koIo=;
  b=hjL1zXAWSuP9mQZCtCNbGS1P3vUmjsCBGl2ZlBmc9C3AEFNueyhoOXQF
   1W+rHuApMHkCHm4kUrR9DuUJ0x7rQM7ldiWSL+XWGHlHtWJF84DdwcBDV
   QaleACQiaTVNYBEx9HSZyRXuLef1gztIVnw3ZpfSO1CYnCPQNHW4KUBs2
   ZMHV3xOMWEAGt2iB675OoBmDk7FCcCY72l3sf6zVZ+6VOWjvV/+0SfALK
   7foojO/MFdOAseph1fVTThgkjb09Qx/UUf+h5sByEdS0tOAreOnz1H4HU
   vnujYbHpu1nn1JPnmbukt3EirzBfmBuvdi865Fd0zEYuO0Og0Hkv0XabI
   A==;
X-CSE-ConnectionGUID: /QoCpMJQSEKR08JYak0/mQ==
X-CSE-MsgGUID: RzgDzUdZRjCai0RsXjL8Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3569072"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3569072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:01:31 -0800
X-CSE-ConnectionGUID: H6nxC8XwRI+gkfqCjaL85A==
X-CSE-MsgGUID: vqkR13HdRwaoiWFbVMlYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9732962"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 02:01:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3233799; Tue, 17 Nov 2026 11:01:28 +0100 (CET)
Date: Tue, 17 Nov 2026 11:01:28 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: aiyengar1990@gmail.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>, Xu Yang <xu.yang_2@nxp.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Cancel the timers before destroying
 the worker too
Message-ID: <avwl-MUOQA1ucpvC@black.igk.intel.com>
References: <20261112-tcpm-unregister-timers-v1-1-7230fda5612b@gmail.com>
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
In-Reply-To: <20261112-tcpm-unregister-timers-v1-1-7230fda5612b@gmail.com>

On Thu, Nov 12, 2026 at 04:28:13AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> tcpm_unregister_port() clears port->registered, destroys the kthread
> worker and only then cancels the hrtimers. A timer handler running on
> another CPU that has already seen port->registered set can still call
> kthread_queue_work() once the worker is freed, or with port->wq
> already NULL:
> 
>   CPU0                           CPU1
>   tcpm_unregister_port()         state_machine_timer_handler()
>                                    if (port->registered)
>     port->registered = false;
>     kthread_destroy_worker(port->wq);
>     port->wq = NULL;
>                                    kthread_queue_work(port->wq, ...);
> 
> The timers are cancelled after the worker is destroyed on purpose:
> works that run while the worker is flushed can start a timer again
> (see the commit in Fixes). Cancelling only before would bring that
> back, so cancel them on both sides. hrtimer_cancel() waits for a
> handler that is running, so after the first round no handler that
> missed the cleared flag is left; the second round removes a timer that
> a work started during the flush. tcpm_reset_port(), called later, only
> cancels.
> 
> Fixes: ca4d8344a72b ("usb: typec: tcpm: fix tcpm unregister port but leave a pending timer")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206898@kernel.org/
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Sashiko found this while reviewing an unrelated tcpm patch of mine:
> https://lore.kernel.org/all/sashiko-outbox-206898@kernel.org/
> Its suggestion was to cancel the timers before destroying the worker
> instead of after; that would undo the commit in Fixes, hence both.
> 
> Compile-tested only (arm64 W=1): the window is a few instructions in
> the unbind path and I have no reproducer.
> 
> This patch was developed with Claude (Anthropic) as a coding assistant:
> it wrote the change and the commit message, and I reviewed it.
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef5210..c7e0e09b1cbe 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -8987,18 +8987,29 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  }
>  EXPORT_SYMBOL_GPL(tcpm_register_port);
>  
> +static void tcpm_cancel_timers(struct tcpm_port *port)
> +{
> +	hrtimer_cancel(&port->vdm_discovery_timer);
> +	hrtimer_cancel(&port->enable_frs_timer);
> +	hrtimer_cancel(&port->vdm_state_machine_timer);
> +	hrtimer_cancel(&port->state_machine_timer);
> +}
> +
>  void tcpm_unregister_port(struct tcpm_port *port)
>  {
>  	int i;
>  
>  	port->registered = false;
> +	/*
> +	 * A timer handler that saw port->registered still set may queue
> +	 * work: wait for it before the worker goes away. Works that run
> +	 * while the worker is flushed may start a timer again, so cancel
> +	 * the timers once more afterwards.
> +	 */
> +	tcpm_cancel_timers(port);
>  	kthread_destroy_worker(port->wq);
>  	port->wq = NULL;
> -
> -	hrtimer_cancel(&port->vdm_discovery_timer);
> -	hrtimer_cancel(&port->enable_frs_timer);
> -	hrtimer_cancel(&port->vdm_state_machine_timer);
> -	hrtimer_cancel(&port->state_machine_timer);
> +	tcpm_cancel_timers(port);
>  
>  	power_supply_put_system_batteries(port->fixed_batt, port->fixed_batt_cnt);
>  	tcpm_reset_port(port);
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261112-tcpm-unregister-timers-2fd159480999
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 

-- 
heikki
