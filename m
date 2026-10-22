Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633666;
	b=3f+mRdoeUhOPsQtRETdQELWXuaTfsR/xY0wUECDII4WCN8phFWrcyciEoP2N8hjOjZ1V
	 feb/3PHO+wnH6gFdvdKJEiWpac0srHiKziAXzn8xr2kyH7aptn6rFKvk4L5KogKTZZh+5
	 +SyoVu145PT551kGlhEgHjYL64cM1yfk1OFmvzjz3kpPG1F9k55fjs7bFtfcQw2U2QJHs
	 AmOIm94p7eK1AyDA0LG+4GkQJjAOvoTzsu1xIzqFFYtMjUB24C2FcLUP6lKjayAjKUV67
	 HTAWHS8nmFfEgnKFm3ZpiDqPLu0JlGZAb7sWYasKDr5T+oBVIb9CTjQCUrrrfr9G0zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gYKqhMNUDqm7sf/jtPqhDcMNm1ldVrzzvJB2Y2KBTPk=;
	b=P0fNB2aRhWJzQ5CZW101xQUuu5+5Bx/hkjY+D+wVAOFsNkw1u8t8SEpzXUww5yRQiWZg
	 TF5VY7zjgLr2TrBmLdJrhRxONOjYvEtCAlAqwjks3g10w+hW7ZxYsVLvFVEZsKpKt8hWr
	 3I5bB/aM6qIAOptsOdWCob9FcVdWTa0OmX0zOWy/BtFXLkXqSRrJRTSbaCWsl+7+0vOSm
	 q1dv9ptyaKJ+7SB9ro/pkLQXYxTRX7QZSGSNBv45UHn3YTdTf5N7Z7MIcfW76UfMc7nw6
	 NJybdD3H2Q/V9rFErps32y/RWrhbfuMfOHzx6MogWqzHJ/Mvare4Ihd2PUOBDnB/+gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=BKYIeId6;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4DC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC4DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=BKYIeId6
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91bbce8b00cso4267306d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792633664; x=1793238464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gYKqhMNUDqm7sf/jtPqhDcMNm1ldVrzzvJB2Y2KBTPk=;
        b=BKYIeId63mWxyc6xDN30NqhLOOLTL1DRlGa3e0Naf/jy7KDx1Z0VuTTHzbUoZzMRs/
         PgT2dIVa/JGQaNooI6ym0Yu8/M03ERvJYWLhG7SJM57fe68Dq0ty5XbIWZc/ClL1i1Sv
         IQ2cRa5MGI7BWy/GMpSUZCBvXX9i5aOKI0ndUD/E0ONi7fDF+IEV7XaSFslChhm6LesL
         rMtP+5WJK0jgexST6q/wWN7z9qjbuCVZQo/4y9SvTxZRcMg3rh+bFjNJrqy0AtKo+meH
         Bd9kkMbB+6aTKmrOiMh5jA4SqzPYJmV6eqKYnSb4xquoSF+l7WmZHn1i5gahrgp7neLv
         w3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792633664; x=1793238464;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYKqhMNUDqm7sf/jtPqhDcMNm1ldVrzzvJB2Y2KBTPk=;
        b=OaAg4oftPtJ6k3qTtFkrQSIHPQLFjLytgPIjcgaRw4GIeIwd3HYcMWy3/la7W9tO1W
         l94GPTySF+99FaKPPmma4R1dcySKJntGWXlPFzB5H3uh/gYU+B5wOzRs8xJUFZngABAM
         0FKBqUiwXxZlO1liUBz+jKjcZChYHKIt+pt1IdIuzN7nrpVxMG5i9vfTv8EUGYREaGrj
         EdREPVyBcjalhuTob9wgyh4PqBcHJVyyqwDYP3Lf0SBEELgIda2guciPb/G6ytJeo1yb
         tCnBkLAhBxQX26uZOGTI8GUnGFKxwoVMZsrNNZb8ik4SmAdi0oS5s18w+0HowC+KOeDM
         uBWA==
X-Forwarded-Encrypted: i=1; AKwUvBzOybJ7gBR+jynUNf/uooa/EQvNn6zoSwWaXPInVCIE5sCg15sWw/Rm6HSR2JyMsX9RfYh/A6jeKDUWd7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeTKVzZIWVUS2EMtdg+soECTzHc/syeq/fj0bgVZtuFoaYTzM9
	pevbQaNdIRPBrHsWe2IGnUlI5kVABuLnvyoA46zEobQRepaq4BC7F9Pgc4qM1ToreG6yaM9Yekd
	HlGn3xg==
X-Gm-Gg: AYBFou1iXYjollrYlOhZ58Bs619ZLjvuGxWccy5KTKCYsAx5tDdgGh/BMhqYl4dcIfV
	AsfPmVEy/XQ7ahRPnV2OP5f5LYTQs0FtcC0kltAB3hIzGrRdTfxGfVI+gKOWBGwpaJkoPq6yPxR
	KTGA1G32tdgl2/OOWcTvHUvirwQyjbjrseWOmJckOSDyPHT5+Hvz1EajMjhoHttZ469rKDuMRvB
	KhN0GLvzs2gOA1Zntvf/SUTC4EN4oWFy9NJqTC8o9iF2bLyr/0txIRdThPV2VEzjYTZAwwp16wD
	v36BDZvUpBzdS+JXlJw7t0KesK5H8q8WrexPLtQFsRDLepbRHy8bc8Z6u7552hPW5/D0LcY1TBt
	T8s0R7oY/6+1T4WlNgvdJrlAdzBxBtcLiqEJIyH9jVKNdi6rT5WYN9UCw7tsvOMHlDv3Qb8KK4U
	xTMUM+Zk0x0zBV+ap/FYFLWVRTA+PKS0xisPIlgotJwYe3Z+LiGvr/GzXlpWAm4KECb4AMxy3ze
	d1mo7TFwCgVq/odqGajMIsB0yoBLPe6yJH1JhZq3fHZ56mUFDDYxVUz
X-Received: by 2002:a05:620a:84c4:b0:93f:16d4:3c0a with SMTP id af79cd13be357-93f6248e92emr176006185a.4.1792633664545;
        Wed, 21 Oct 2026 18:47:44 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e246cesm398743785a.38.2026.10.21.18.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:47:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:47:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joe Wang <joe_wang@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: ehci: Quiesce controller before halting it on
 shutdown
Message-ID: <0acd4f35-4b99-41aa-a9c6-2764a6744c8d@rowland.harvard.edu>
References: <20261022-upstream_ehci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com>
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
In-Reply-To: <20261022-upstream_ehci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com>

On Thu, Oct 22, 2026 at 09:21:11AM +0800, Joe Wang wrote:
> ehci_shutdown() runs from the .shutdown callback during reboot,
> poweroff and kexec, for example when LinuxBoot firmware boots the
> final OS. The HCD is not removed in that path, so ehci_stop() is not
> called and the controller may still be running. ehci_shutdown() then
> halts it without first turning off the schedules, leaving a DMA master
> running while the system shuts down.
> 
> On ASPEED EHCI controllers, clearing USBCMD.RS while both the periodic
> and asynchronous schedules are enabled may also leave the controller
> unable to halt. If an asynchronous transaction runs past the end of
> the micro-frame after RS is cleared, the controller walks the periodic
> schedule with a cleared internal buffer, reads from address 0x0 and
> never sets USBSTS.HCHalted.
> 
> If the controller was running, call ehci_quiesce() before halting it,
> as ehci_stop() and ehci_bus_suspend() already do. Do this after
> rh_state is set to EHCI_RH_STOPPING, so that URB submissions and
> hrtimer events cannot re-enable the schedules, and let ehci_quiesce()
> accept that state: like EHCI_RH_RUNNING, it means the controller may
> still be doing DMA. The controller-death path in ehci_irq() also sets
> EHCI_RH_STOPPING, but it has already cleared CMD_RUN, CMD_ASE and
> CMD_PSE, so a quiesce there cannot re-enable anything.
> 
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
> ---
> This issue was observed on a customer host platform using the AST2700
> PCIe EHCI (ehci-pci), and the root cause was confirmed by the ASPEED
> hardware team in RTL simulation. The stop sequence used here (clear
> PSE/ASE, wait for PSS/ASS to clear, then clear RS) is their
> recommended workaround and was confirmed to resolve the issue on that
> platform.
> 
> When the controller is running, the added delay at shutdown is bounded
> by the two existing 16-uframe handshakes in ehci_quiesce().
> 
> Tested on AST2700 (ehci-platform): reboot with a hub and USB mass
> storage under load, ehci_shutdown() on already halted controllers,
> and unbind/bind (ehci_stop()); no regressions.
> ---
> Changes in v2:
> - Apply to all EHCI controllers, not only ASPEED (Alan)
> - Quiesce only if the controller was running (Alan)
> - Link to v1: https://lore.kernel.org/r/20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com
> ---
>  drivers/usb/host/ehci-hcd.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 3c46bb18c7f3..d9d816eedc66 100644
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
> @@ -356,6 +356,7 @@ static void ehci_silence_controller(struct ehci_hcd *ehci)
>  static void ehci_shutdown(struct usb_hcd *hcd)
>  {
>  	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
> +	bool		was_running;
>  
>  	/**
>  	 * Protect the system from crashing at system shutdown in cases where
> @@ -367,11 +368,19 @@ static void ehci_shutdown(struct usb_hcd *hcd)
>  		return;
>  
>  	spin_lock_irq(&ehci->lock);
> +	was_running = ehci->rh_state == EHCI_RH_RUNNING;
>  	ehci->shutdown = true;
>  	ehci->rh_state = EHCI_RH_STOPPING;
>  	ehci->enabled_hrtimer_events = 0;
>  	spin_unlock_irq(&ehci->lock);
>  
> +	/*
> +	 * Turn off the schedules before halting. rh_state is STOPPING now,
> +	 * so they cannot be re-enabled.
> +	 */
> +	if (was_running)
> +		ehci_quiesce(ehci);
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
