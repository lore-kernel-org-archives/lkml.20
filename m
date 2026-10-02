Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B0222173D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933591; cv=none; b=fxXFQYijU1qJKYux11YP3YSTpjY2QT7+VWeBfi0OjATz5K2d1TN3wAJuz6JPg61EA8nWJEStwIk8fATEpK2cevtbMdmnyRvSC80gDvKHCORuJXjM6XZBPsEd5qmnqJkj+v7aV1UWulJ5z2Gemt34z3p4pfEWEI91JAHzVSR607U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933591; c=relaxed/simple;
	bh=AH0m3kFWajIKYGQY4UZbm1AQR08JXhLorxO5umRamqk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NhPwPp6Q9WyJKFTKeo4Kc3IRdojUI58MT8inZf56H1SXbdhurx90mm4tY5h3if/0kx2w4xKbJwD7/t2IxHnRozuyj1h6BQleoSrinqcSGtQsa+qEjsaQIDe+oA1gyPmqnMkCP3eMkA9dWsJ8/mh2vyIafIsJwX0lNixAWCOgh+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPM8cRse; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPM8cRse"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so35664245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790933588; x=1791538388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0wsq9A5ot0gZZjvcSqMlEZrZfsvaATto0gHW6reAGhA=;
        b=BPM8cRseB0u+c/jIKsZV8T9pPaBo6efV/K3HeUElHI91rg/L7e64Cxub9s0D1HoJsL
         cqNaPuF/p40Jf4/w2S4cjRHOEscdF/ex6YPqyj6LnRGfuqNgasaFTD2X8GPuyQqBK8h6
         H4XHhsHo7WTRiH3VqLleDZXBUmSo7aIuhBd1UuLrdy2l65OhH0Oo/7F5exNVluFW1egN
         YqANvySlF+/3lHGFavqS7j8yxaeOZZTgoSCqJ6mGRtkEfJv1XEMntlDyY8K8lbaG6UBn
         BnVlgTKyOAFrGTgsLM5vTTtF6N+9iDBDUlRPEI3UMRS8KmHZDJgVTsq+ChpDIKLXnGdK
         24Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933588; x=1791538388;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wsq9A5ot0gZZjvcSqMlEZrZfsvaATto0gHW6reAGhA=;
        b=oUb40279sECJ0wK+Fi6T2mzV+P/24/m8bAl7KkXXje0EoXMLGtbZpOmY79sHoRRdSl
         WHd93HyFo/16h5qNjfYCrUiRdbnzK4jhpLACrXtU70zRB46M1b/bvjwycJozt4iu2UY/
         8CeAST8T9NnvX6LhZ36BKCyTBVuwoTRK4PO2QxRR9VgxCh1s5zMtKfNlBFS9qiMKr9Bn
         Qx2/0WJLaSpefs7G7EW6OXCLTgHp5ETLPoBFRuA4EQ3RY7vDBC2TXWItiGNY1OZiH+mM
         9Z7ca76DbdrrhrvMXmDR1dW5DFUfwo3nph0moyvW2gfr/ImsU8pF+OK2qCopNIUYIdT1
         bakw==
X-Forwarded-Encrypted: i=1; AKwUvBxNxJ4doxLMQ6ZQkOykHidP5dJ4B8kfpNiuN8nJaTa+d0S8H/g+URypC0YVqhj6N+r6ergwvsNvHOOLz5c=@vger.kernel.org
X-Gm-Message-State: AFuF++liEv46xvpN2J+N+KufpnrF7w/2TGi+oG7fPvBf+ki/v6WWk+TN
	FZ/prHxssG978cAO3oC2LfMS8KIJDtGPLHM09+D/WfNtHhX+AuyYvKw2
X-Gm-Gg: AYBFou1gl5n+yl52vuYhYh/aIqjUoglHAbrFlqghESk1JZOcov/3ARa8UaQqV9nXrAP
	GZ1Qli+1cf/lQFFq7zuf0DFmjRWzGgKk6fmLr8amePXko4Wq3NvX39kdOj+G0vaz5yddCHwnqZk
	rffLiaw8UJz/5fim2C69/lsAQpNhsZgrxK+MQ4AZ/ywGo6cs6/nhpAyP1yRj6Y+P1rxEsQzvmzm
	9sw5yM0TrkOoNaKcLzTamNarEPA5aye4GLRhwETgMZrubN2TnrMqc64pPj5pB+rzS4Ad+0PH37G
	LTYpff8ZnF0TG1KCRhKjQ/bzCEntWbwDDjDD2HTmpci2ckjmQ/+NVI/8hLe73e+kHnkAlzRlOtz
	lPwc4HSJUY1YX0YmgRq6SWW26aTcwp2CkKhfBrLNlzeYvrozEFjTa1tNKsqYR3tsrcvtVubX00p
	iSu8h75Z5+xo1BWsOqvDHdPxHkhq/cyD4IjxYek6Dyu40rT/pGlJaaWUF0lc4U8B2q2OcQs+NuF
	px9WMRXfQ==
X-Received: by 2002:a05:600c:5490:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a0275858a3mr45858065e9.31.1790933587387;
        Fri, 02 Oct 2026 02:33:07 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02773ba02sm63589545e9.12.2026.10.02.02.33.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Oct 2026 02:33:07 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:33:02 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Pedro Fonseca <pedro@fonseca.com.pt>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Unlock for command abort polling
Message-ID: <20261002113302.3fe23d24.michal.pecio@gmail.com>
In-Reply-To: <20260824095944.1c8335fa.michal.pecio@gmail.com>
References: <20260824095944.1c8335fa.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 09:59:44 +0200, Michal Pecio wrote:
> xhci_abort_cmd_ring() requests abort, waits for the CRR bit to clear,
> drops xhci->lock and waits for the Command Ring Stopped event.
> 
> The CRR wait timeout is 5 seconds as suggested by xHCI 4.6.1.2, which
> means that if the xHC fails to complete the operation at all, we poll
> with the lock held and IRQs disabled for several seconds. If any other
> CPU tries to acquire the lock, it will spin likewise. IRQs get delays,
> drivers log errors, tasks freeze, it's a mess.
> 
> So drop the lock earlier, before waiting for the CRR bit. It should be
> safe - the sole caller sets cmd_ring_state to CMD_RING_STATE_ABORTED
> before calling us, which will prevent others from ringing the command
> doorbell and interfering with the abort. Queuing new commands during
> this time poses no danger, and if the command we try to abort actually
> completes concurrently, existing code already needs to deal with this.
> And in my testing it does - it's trivial to trigger this on ASM1042,
> where Address Device can't be aborted, but it completes as soon as the
> offending device is unplugged, including during abort attempt.
> 
> Note that the lock still covers reinit_completion(), so it won't race
> with complete() being called by the event handler. And works are not
> reentrant, so another timeout can't expire while the lock is dropped.
> We will configure timeout anew when restarting the ring.
> 
> One other difference is that now we also drop the lock if abort fails.
> This too should be harmless. Commands queued during this time will be
> released like any other pending commands. If the aborted command does
> complete before we regain the lock, it's a waste, but not regression.
> 
> Reported-by: Pedro Fonseca <pedro@fonseca.com.pt>
> Link: https://lore.kernel.org/linux-usb/16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt/
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> This has been annoying me and various others for years, only the latest
> incident is listed above.
> 
> I expected a nightmare of race conditions, but after finally taking a
> serious look I think it really is quite simple. It helps that the lock
> was already being dropped and existing code seems to handle it fine.

Hi Mathias,

Any thoughts about this one? Seems we haven't got any response from
Pedro, but the patch worked for me (and it solves an annoying bug).

>  drivers/usb/host/xhci-ring.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 8b0c27d6f12d..44a0f89110a1 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -494,7 +494,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
>  	struct xhci_segment *new_seg	= xhci->cmd_ring->deq_seg;
>  	union xhci_trb *new_deq		= xhci->cmd_ring->dequeue;
>  	u64 crcr;
> -	int ret;
> +	int ret, completed;
>  
>  	xhci_dbg(xhci, "Abort command ring\n");
>  
> @@ -521,25 +521,27 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
>  	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
>  	 * and try to recover a -ETIMEDOUT with a host controller reset.
>  	 */
> +	spin_unlock_irqrestore(&xhci->lock, flags);
>  	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
>  			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
> -	if (ret < 0) {
> -		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
> -		xhci_halt(xhci);
> -		xhci_hc_died(xhci);
> -		return ret;
> -	}
>  	/*
>  	 * Writing the CMD_RING_ABORT bit should cause a cmd completion event,
>  	 * however on some host hw the CMD_RING_RUNNING bit is correctly cleared
>  	 * but the completion event in never sent. Wait 2 secs (arbitrary
>  	 * number) to handle those cases after negation of CMD_RING_RUNNING.
>  	 */
> -	spin_unlock_irqrestore(&xhci->lock, flags);
> -	ret = wait_for_completion_timeout(&xhci->cmd_ring_stop_completion,
> +	if (ret >= 0)
> +		completed = wait_for_completion_timeout(&xhci->cmd_ring_stop_completion,
>  					  msecs_to_jiffies(2000));
>  	spin_lock_irqsave(&xhci->lock, flags);
> -	if (!ret) {
> +
> +	if (ret < 0) {
> +		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
> +		xhci_halt(xhci);
> +		xhci_hc_died(xhci);
> +		return ret;
> +	}
> +	if (!completed) {
>  		xhci_dbg(xhci, "No stop event for abort, ring start fail?\n");
>  		xhci_cleanup_command_queue(xhci);
>  	} else {
> -- 
> 2.48.1
