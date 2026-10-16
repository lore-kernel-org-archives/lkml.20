Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F63C1D7D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163072; cv=none; b=mZaJtb3YuYNfcWvdj1jMVS16fP4d2a4aC8XQhE2Sg383vQ0/Rtc91Xd23fl2fM0d8L622skmEpJlVJCKEFvxDsXblaCs7qhILLhhKY/R4IPYiF7l5EhUw4cOLKudARL/L0bZjZVyalghKnqrpMXWlWj+HgKwd9UsWYt97f5tD5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163072; c=relaxed/simple;
	bh=gZ8M3YL4vY9/T1pAnpyOkHKYnY0l+cf+z0EF5NoQEA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8JRMb0uIR6AbN8kF9kFgCqIgHA4MNeOqGLUN4OhY3g43rcadBmgHKULMxPOtse/k68RTBpuY8D2OmC6cPKDlaiptWfbSWGxTKd2+tsdxPQvbrUqUU+wQHvBUhILIuj7GbESCqjyzvKPuLIprZOwMYOWSPUENxYvoqJBDB9V9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vw6mGejP; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vw6mGejP"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e63ee7b4cso3310385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792163069; x=1792767869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QjMVhSxuyV4C5Y9lVNWGp1YsEKYu5m2G3O2NV9TfmW8=;
        b=vw6mGejPE0aLkGRv9hs9nCBeabPMPFWvgkNZcGFLmodh06ASEGBJfYYUEYjV8ZLbCh
         jIQBcLFz6AFKLw1eya7jeAZP1bBEFgljLCh5WTClX7it4JazLLpR+YNBfsX8rfhK+RA0
         Bb9hcSbEfxtN51KlPMoYkoGClJkiSfMUXMuLDtBPApKZPWh7E2JA7hYjRUJ0VsChM9mC
         ExHoRsPY46gkY6Rl7wB2EHPFDIHa03N7/mb3414T6DD1IxAAflzIfcR7nRthpWlRSYxn
         V2XCYpuI1bs/MaSou0NilaNYCJB8ng/zJsgvEFuD7wPhAsW+4Kalq3qCPgtZENUhUy7W
         ioRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163069; x=1792767869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QjMVhSxuyV4C5Y9lVNWGp1YsEKYu5m2G3O2NV9TfmW8=;
        b=VMMbW2Lb8X6WfBVq3AuQ1oLfVFl2wGDUNyyqtsRayFo/HRx0HOqKaMrsqCvGtZjWye
         2dv+B178dyPNagolMCWTYTempCnqYbRG3LTJDWDHKl+cB4Nz7bBYH210Bb5Neb5AV4IM
         h1e/crVr08NTzrDMtaeACqsZfx+PoExFliwgJBGsL8KATxbafrv/clK7cBCb51kErAHx
         Ns1rrF/1HoN3MMqwi63cPzjPtZOO7bUiqP8l0QB+/TmPYqJ0KkY/fQl9W3hPp8mOnVyU
         3i1b8yqZ07J7ZtzcHkltN6pl6a0u37Oy/SvvHsKn7nW2HnBzWJA+6h5JZ/ZcOodoMs2p
         wgVA==
X-Forwarded-Encrypted: i=1; AKwUvBzQxawLcY+Xpnj5wJ1aNQIQMq3ioEXyJoE/RDQAWUolAAqBN+NI1WJlVustDnkVVKjGvpibGdmoruu00vM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoENc2LfaGxsjy0KwptAC47ot6fp5uAhK9gZoAiATIAqraXGQe
	PW7zM8sQV4M/V4JXcHCLLw8aPkVM5FfemnQIGLQvaEAMhxRMfpk5Oui7moBoGraguQ==
X-Gm-Gg: AYBFou24vCn9S1geUkF+tprLlDRCZdxOjfH+xAQrAI7SMzginki8ez6lmgW8aPj2FkE
	SyKd7i1lcp1ovYWYn5y1QLagU82Lz2JTM99qLbj+Bp/ChPiZaRSvaGRvfZcryynxCXkcgTcACq4
	gjE/LkXk0VaGzkznOLJesYyB5ipnNtYcrFSOMdKLDG+cU36rfv/jb7mWIdq/7JVoXD562tG/mLD
	qGKrUOScooqmCqLa5LnFUAiV8O8glpsr/bQbNXq8yWMj3UOMsV8jMnao9c5sDXigpk9ZXv0AvqO
	zDDX0xpUVvrtzFCeXrQFV+0JXByfYU4EBY34oGVeRkKsDlriial+TUZwqgpuozHiw0J5GxNA5KJ
	D5gc9u8XezJzM5sM6/neSTac/8oMANo0YbL9FgGwqOxaUaFk3SeekLM9dniVKcgwK7dqONKg/QA
	MJQjtrgVdrrniixANCZK3a+qILyjGRtJfBLY6Axbg6hfGUAuwv94GXce9ghZpI4WJPSUHDq6M=
X-Received: by 2002:a05:620a:439b:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f29e17275mr10664485a.83.1792163068256;
        Fri, 16 Oct 2026 08:04:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1b882asm227739285a.42.2026.10.16.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:04:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:04:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joe Wang <joe_wang@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: Quiesce ASPEED EHCI before halting it on
 shutdown
Message-ID: <7dfc5ef1-a466-4d78-af65-147bee8fe698@rowland.harvard.edu>
References: <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>

On Fri, Oct 16, 2026 at 04:53:07PM +0800, Joe Wang wrote:
> On ASPEED EHCI controllers, clearing USBCMD.RS while both the periodic
> and asynchronous schedules are enabled may leave the controller unable
> to halt. If an asynchronous transaction is in progress when RS is
> cleared, it may run past the end of the micro-frame. The controller then
> clears its internal schedule buffer at the start of the next micro-frame
> while it is already walking the periodic schedule, issues a DMA read
> from address 0x0 and never sets USBSTS.HCHalted.
> 
> ehci_shutdown() calls ehci_silence_controller(), which halts the
> controller without first turning off the schedules. For ASPEED
> controllers, call ehci_quiesce() first to clear CMD_ASE/CMD_PSE and
> wait for STS_ASS/STS_PSS to clear, as ehci_stop() and
> ehci_bus_suspend() already do before halting. This is also the stop
> sequence recommended by ASPEED.
> 
> Quiesce the controller after setting rh_state to EHCI_RH_STOPPING.
> The asynchronous and periodic schedule-enable paths require
> EHCI_RH_RUNNING, so this ordering prevents them from restarting the
> schedules while the controller is being shut down.
> 
> Allow ehci_quiesce() to operate in EHCI_RH_STOPPING as well as
> EHCI_RH_RUNNING. As documented for enum ehci_rh_state, both states
> indicate that the controller may still be performing DMA, while
> lower states indicate that it is not.
> 
> The controller-death path in ehci_irq() also sets EHCI_RH_STOPPING
> and clears CMD_RUN, CMD_ASE and CMD_PSE. A quiesce call in that
> state writes the command register with these bits still cleared
> and polls the schedule status bits using the existing timeout
> limits, without re-enabling the controller or its schedules.
> 
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
> ---
> This issue was observed on a customer host platform using the AST2700
> PCIe EHCI (ehci-pci), and the root cause was confirmed by the ASPEED
> hardware team in RTL simulation. The stop sequence used here (clear
> PSE/ASE, wait for PSS/ASS to clear, then clear RS) is their
> recommended workaround and was confirmed to resolve the issue on that
> platform. All ASPEED EHCI controllers share the same design, so the
> workaround applies to every controller with is_aspeed set.
> 
> The quiesce is limited to ASPEED controllers to keep the change
> minimal for other platforms.
> 
> Tested on AST2700 (ehci-platform): ehci_shutdown() and unbind/bind
> (ehci_stop()) with a hub and USB mass storage under load, no
> regressions.

Under what circumstances does ehci_shutdown() run without ehci_stop() 
being called first?  Is controller death the only possibility?  If the 
controller is dead, will quiescing work?

Is there any real reason not to do this on all types of EHCI controller, 
not just ASPEED?

> ---
>  drivers/usb/host/ehci-hcd.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 3c46bb18c7f3..d984987c8691 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -274,7 +274,7 @@ static void ehci_quiesce (struct ehci_hcd *ehci)
>  {
>  	u32	temp;
>  
> -	if (ehci->rh_state != EHCI_RH_RUNNING)
> +	if (ehci->rh_state < EHCI_RH_RUNNING)
>  		return;
>  
>  	/* wait for any schedule enables/disables to take effect */
> @@ -372,6 +372,14 @@ static void ehci_shutdown(struct usb_hcd *hcd)
>  	ehci->enabled_hrtimer_events = 0;
>  	spin_unlock_irq(&ehci->lock);
>  
> +	/*
> +	 * ASPEED EHCI may never halt if RS is cleared while both schedules
> +	 * are enabled, so turn them off first. rh_state is STOPPING at this
> +	 * point, which keeps them from being re-enabled.
> +	 */
> +	if (ehci->is_aspeed)
> +		ehci_quiesce(ehci);

Don't you want to check whether the controller has already been 
quiesced?

Alan Stern

> +
>  	ehci_silence_controller(ehci);
>  
>  	hrtimer_cancel(&ehci->hrtimer);
> 
> ---
> base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
> change-id: 20261016-upstream_ehci_aspeed_shutdown-9ccffedb2a1c
> 
> Best regards,
> -- 
> Joe Wang <joe_wang@aspeedtech.com>
> 
