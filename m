Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1135245C6E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794497; cv=none; b=ig3xp3U+M9a8BYSzwq4Xgr7VhHPbLRl1J1AkN0PJoCPFQbj6UcvNt+QTZrJG3OvnP+TMWigqCbByWl/nrLd/6PGbO5Bh2eMWYgeOiRHV6zT0OrwciaHkg4v27LcURhYK+serYnZ+w/Dig+65+nREBGHvWql/kFR9dyu291KutzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794497; c=relaxed/simple;
	bh=LZS/jB8OxtaqSVmy3Xx+Qc2sxRaxkntLWpMwitP5IxU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HIdSnoKOBcv2yRK+EX2OXPoQA5v6J1yQO33o9za9RYQGlBy4bmMufeXH1ge6BPJqAUaXV6jWHTkzRLv2hN6MfSJnuhKm2sGiHBmtInuiCVqh8hpmXFLcUpfGDZx4Le2UAXV4oZtINBDZ5H+kFx6uBMlCnw8ZbAj1LiEqaner6sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZejEHbz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZejEHbz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a01933b584so13991065e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791794492; x=1792399292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+LcstUTzsAifjpiCuc4yYJc0qp8/5t8Xu98Ew8WwFTE=;
        b=CZejEHbzVZz0tt8zcwuqVxh/jy+JLksEGjpJSzWFtoVqEj+soILRtkvC7hGj7kfqai
         N+P0KBrYLspyuQC3Wilaut/G6dr0B8YGPHzwXFOUkl73/0NCj4BUjDY138wBAVbnQt39
         /uz2lD4eg5FnUMKhlrgLc3KVMG1jOIPDKbymdXZhNX/5yMTIvkD+li5yzLqiobcsybEV
         IEy+p9ZYbUnamUGMPopxZ+wK4oC//dAXmZs3aro8ottFa3yDQ5K7oUAzh/uun51D9uSp
         EaIhQrKeFDis4+gz7Fl6yG+wluUuzDE+ai/HVO0aznxJCDzKtLOrXlLrtEUitHz+MCeJ
         Acdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794492; x=1792399292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LcstUTzsAifjpiCuc4yYJc0qp8/5t8Xu98Ew8WwFTE=;
        b=Pz9u9PbUpiE0gnxjiYNqjhjzBa8VnYutVdt7oIPsBLJNWXVJky3QcRX0Ql/Z4fanx4
         Yb+T0YovuE4PZdIS88i0PpzkHF8SdUf2A08DtZnFoZ+dAXWUne+MMa+gnr+tp3YKSWSy
         ERo2/o3kc/lCiqkQT7Kl4cRabQzvE5odzt3JlVPM1FRzgO+Let9KCTux6Y8IcX/9+NcG
         sqfsAlPIQSe8LFrty4G/Qz8lQwP0EYOhSPvV3fPAuZCmT34223vrEh5sscNDHdaObOgd
         zk4pZ/ct+1uwou0BrZuXmAJ7Ozq9HwCCYlG41wk9vNUdA932ltgos4ok+eQ20qnk7dNp
         P/kg==
X-Forwarded-Encrypted: i=1; AKwUvBw6jtuhwheQ1Z+BB8SPQdLMI2/heZ2ca+GKNsxoNqkWDGkrtoa/MD2bJVwFCqyAqsIdDUF2x6RIF+w/npQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsYCOGBg0IvRQKcILoKPSy9uiz4C0KE3qFvFpGjfqfS5nB6eQf
	aE9xR0QiqOAcaUb6o0rQk03R9KxerYI0/REL5+T5SF5EPowAwz7dMc/k
X-Gm-Gg: AYBFou3IgZ3stmKalVd7u1XaqJsX2wFfmrQX8s8cqULl+N3qLkvZUjj45zKDzzd9EaF
	J3bZCZvFmJLJ9RB4NpacCdbnWT+s19+xGFTRS73xVf63FaRGqaIo+j/DOJh9WqFrPVS7aw2gM8k
	qnkAKTezcNHoyAxRRsow5NPBM/VFp/nL7AjPfsvr2SISqEt88rH3BpR1OU5684FvRIjq95lttm3
	cHFzZBwWeFpV9lYHHUp9o8QNWwKZ1Ddowj1gBvZMbVUvz9q0USZnq/XzGe2LRfLGZ3EmNWYuuxr
	3Y7AAZV6B7kfdg0HSrHAqHl3vf/HPVCyhYw+Lu3v3yBG139Pwij8OP7RTl1cUj9Fkf8JijbIZ/P
	TvQT2JCHlQToT4NiyImtNriyw6sAg3Axt1YX1zwirKA8vQGHyu6hf/HlcbTOSH+KXtcEIaRTl1L
	kToqHEo3FWsXO1Z/8G0OxCquXdJ+vgFQjwnBOYwYbzeOUjwVviP0dS1B+92XeXAaV7cPOW/3X0n
	MmP6A1h2jbIal51KX/r
X-Received: by 2002:a05:600c:a088:b0:4a0:333:253a with SMTP id 5b1f17b1804b1-4a18e49c331mr165974065e9.14.1791794491863;
        Mon, 12 Oct 2026 01:41:31 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm300091885e9.10.2026.10.12.01.41.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 12 Oct 2026 01:41:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 10:41:22 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Yiyu Zhou <yiyu@yiyuzhou.io>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: give back halted TD when skipping endpoint reset
 after disconnect
Message-ID: <20261012104122.0af52938.michal.pecio@gmail.com>
In-Reply-To: <20261010064407.11030-1-yiyu@yiyuzhou.io>
References: <20261010064407.11030-1-yiyu@yiyuzhou.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Oct 2026 23:42:19 -0700, Yiyu Zhou wrote:
> Commit 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
> disconnect") makes xhci_handle_halted_endpoint() return early when the
> root port is disconnected, and commit 7e0ef4332ed9 ("xhci: avoid xHC
> endpoint changes after disconnect or link error.") also sets
> EP_DROP_PENDING there, which keeps the doorbell from being rung until
> the device is reset.
> 
> The callers rely on xhci_handle_halted_endpoint() to take over the
> halted TD.  For example, finish_td() returns right after calling it,
> expecting the TD to be given back once the Reset Endpoint command
> completes.  With the early return, nobody gives the TD back.  Its URB
> stays pending until the submitter times out and unlinks it.  Every URB
> queued on the endpoint afterwards never starts, because the doorbell
> is blocked, and also has to time out.

Before 7.3 there was a similar device flag VDEV_PORT_ERROR which stuck
until the device is reset or deleted. It only applied to USB3 devices.
URBs were left hanging, but nobody cared, because disconnect() handler
of the class driver would unlink them.
 
> Devices that disconnect and reconnect themselves during enumeration hit
> this.  A PFU HHKB Professional HYBRID Type-S keyboard (04fe:0021) drops
> off the bus about 300 ms after its first enumeration, while usbhid is
> still probing its third interface.  The probe runs in hub_wq, so the
> disconnect is not handled until the probe returns.

But probe breaks this scheme, it seems we do have no choice but to stop
being lazy and give back the URB right there.

Regression occurred when the mechanism has been generalized to USB2 by
also looking at the PORTSC.CCS bit, even though the problems it tries
to solve have been unique to USB3 so far.

But this change seems sensible, because a USB3 port may autonomously
exit the Error state to Disconnected on receiver termination loss, see
xHCI 4.19.1.2.6, and PLS changes to RxDetect. It may even reach Enabled
before software intervention; seems we should look at PORTSC.CSC too.

(On a USB2 port, like this keyboard uses, such race doesn't exist).

And since xhci_irq() clears these per-port flags when USB3 link comes
back, there is no guarantee that the permanent EP_DROP_PENDING state
will be latched on the lost device. Whether the HW bugs caused by link
loss will still be happening on the "new" link is unclear; I only know
about Renesas: it doesn't mind and actually recovers on reconnection.
But the device is reset, which may or may not catch some xHC off guard.

Not sure if going back to a sticky per-device bit wouldn't be better.
One downside is that we need to flag all affected devices, which means
a loop in IRQ. Not great, but there is never more than 255 devices, so
maybe a few microseconds at worst. Likely not enough latency to break
anything, and it saves some repetitive checks in other places.

I could cook up a patch like that, I think it would make things easier,
as there is no need for those very similar checks in urb_enqueue() for
example, as seen below. But let's see what Mathias thinks.

> On a root port the HID descriptor request and its four retries in
> hid_get_class_descriptor() each wait for the full 5 second
> USB_CTRL_GET_TIMEOUT:
> 
>   [57685.006036] usb 3-2: new full-speed USB device number 24 using
> xhci_hcd ...
>   [57685.291304] hid-generic 0003:04FE:0021.0017: input,hidraw1: USB
> HID v1.11 Keyboard [PFU Limited HHKB-Hybrid] on
> usb-0000:00:14.0-2/input1 [57711.221083] usbhid 3-2:1.2: can't add
> hid device: -110 [57711.221613] usbhid 3-2:1.2: probe with driver
> usbhid failed with error -110 [57711.221842] usb 3-2: USB disconnect,
> device number 24
> 
> The re-enumeration that follows can stall the same way, leaving the
> keyboard dead until reboot.  Behind an external hub, where the root
> port stays connected, the same keyboard recovers in about 300 ms, as
> it did on the root port before these commits.
> 
> Keep skipping Reset Endpoint on a disconnected or inactive port, but
> give the halted TD back right away, with -EPROTO if no error status
> was set yet.  The endpoint is not restarted until the device is reset
> or dropped, so the ring dequeue pointer can stay where it is, as
> xhci_invalidate_cancelled_tds() already assumes for cancelled TDs on
> such endpoints.  Also refuse new URBs on an endpoint with
> EP_DROP_PENDING set, like xhci_urb_enqueue() already does for an
> inactive link, so they fail right away instead of timing out.
> 
> Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
> disconnect") Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes
> after disconnect or link error.") Assisted-by: LLM
> Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>
> ---
> Tested on v7.3-rc6 on a System76 Galago Pro (Intel 8086:51ed xHCI)
> with the keyboard plugged directly into a root port, including twice
> right after resume from suspend.  On every hotplug the keyboard still
> dropped off during the probe of its third interface, and it was
> re-enumerated with all three interfaces bound about 0.3 s later.
> Before this patch, the same sequence hung usbhid for 26 s, and often
> left the keyboard dead until reboot.
> 
>  drivers/usb/host/xhci-ring.c | 24 ++++++++++++++++++++----
>  drivers/usb/host/xhci.c      |  5 +++++
>  2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c
> b/drivers/usb/host/xhci-ring.c index ec278a9f9540..82190380831d 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -979,6 +979,24 @@ static int xhci_reset_halted_ep(struct xhci_hcd
> *xhci, unsigned int slot_id, return ret;
>  }
>  
> +/*
> + * Mark the endpoint to be dropped instead of reset, and give back the halted
> + * TD now, as nobody else will.  The endpoint is not restarted before device
> + * reset or drop, so there is no need to move the ring dequeue past the TD.
> + */
> +static int xhci_drop_halted_endpoint(struct xhci_hcd *xhci,
> +				     struct xhci_virt_ep *ep,
> +				     struct xhci_td *td)
> +{
> +	ep->ep_state |= EP_DROP_PENDING;
> +
> +	if (td)
> +		xhci_td_cleanup(xhci, td, xhci_urb_to_transfer_ring(xhci, td->urb),
> +				td->status ?: -EPROTO);
> +
> +	return -ENODEV;
> +}

Not sure if this is big enough to justify a new function, and the
comment partly duplicates existing comment at the call site.

>  static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>  				struct xhci_virt_ep *ep,
>  				struct xhci_td *td,
> @@ -993,10 +1011,8 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
>  	 * Can cause host hang.
>  	 * Device will be reset to recover an inactive link, so don't do anything */
> -	if (rhub_port->link_inactive || !rhub_port->connected) {
> -		ep->ep_state |= EP_DROP_PENDING;
> -		return -ENODEV;
> -	}
> +	if (rhub_port->link_inactive || !rhub_port->connected)
> +		return xhci_drop_halted_endpoint(xhci, ep, td);
>  
>  	/* add td to cancelled list and let reset ep handler take care of it */
>	if (reset_type == EP_HARD_RESET) {
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c28..491a541b57b0 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1691,6 +1691,11 @@ static int xhci_urb_enqueue(struct usb_hcd
> *hcd, struct urb *urb, gfp_t mem_flag ret = -EINVAL;
>  		goto free_priv;
>  	}
> +	if (*ep_state & EP_DROP_PENDING) {
> +		xhci_dbg(xhci, "Can't queue urb, ep halted after disconnect or link error\n");
> +		ret = -ENODEV;
> +		goto free_priv;
> +	}

It would probably make more sense to log the conditions which set this
flag then every failed submission attempt after the flag is set.

This is the aforementioned "very similar check", because a few lines
prior we have the related test for rhub_port->link_inactive.

>  
>  	switch (usb_endpoint_type(&urb->ep->desc)) {
>  
> -- 
> 2.55.0
> 
