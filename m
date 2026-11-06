Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958664;
	b=AX/DGy5BVedkdtlz+QGkJwGXnJcUib/TQm0NoLsIgG2yo/zcZbrvSETTeOILqM8YiBvd
	 ZAjINyhVanr8pbuhu6e3+Vzf8wzBJAgw8fGlViNrjyWDXOY2UuEwitey2vBI3GLkij8s1
	 0W0tb/WE9tgdedXXoeFFyZoC8i7I92mhBVjRWXIVHDL5y5Faf0hXyOMchwd7Hh2mGx9TW
	 V0kF3WQWPZni1HqYQEcwbhehAOJxTG8QbAyoERG/sz4yIQ23Ljor3ZWydjig0eYmlefGN
	 rBedWC8CMo3Q6S0IRbRrDsoDON1XdgZ3iT6oyCoh5sLgvSNPTY3OD8EiAcSNQz6KZ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vQBnTQDeqPWib9HYEy/76nQqVu/AgiIe/ITMno6I1Ns=;
	b=d+WjV3uu1pFFo77YI4IN3LgM5HYbe3Hk2Rh4Z2NEObME7xBv75U+ngdvQ0fYqHT3+v6T
	 j3oONtzmu0y8KT0wEy1um7cg8Hv80z7BIzvEu8W0nToVNkY5BhpV+ZAmupowwXlJ5oIe3
	 cJpeEbzko4JavLvXQViJ/ooNXPI54g6k2l05sjPYnmexxb16AO1IbZ2b6VXatSaIJ2ad9
	 7f+ZOfOXvyhA7N4vNvjhebT5fXtR0sMUGjYFLEkW4zRh6nsMhZRYWYBpkQom2UExsL2LR
	 FfHFFCBVvf5XD+34sRmcnmjKsVkZhV9yusuDHqbrPFKa3plEw5gPcjALZXA+4KENcoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYY0QYHf;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB4606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FB4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYY0QYHf
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so447948f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958662; x=1794563462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQBnTQDeqPWib9HYEy/76nQqVu/AgiIe/ITMno6I1Ns=;
        b=qYY0QYHfvwNgzBac0451gF21eaCM3pK7oCeOQyEt4slf1JpxRNomaS4qVWQMbcnkqp
         j4jSn6fcIGVAucK0eb6HqE0aXCiGtWoZbEHIm1T2AFBTYeZhus4ahf83jMU/a+8rq/cg
         empsweZSO3DbMUia2kJyQPcomGyMGC92/8jcLqFL0TXv+2kH8Ctz6FxuYuuqmuesiWvi
         6HSYC+7UC6dOW2hzSHuBokB7Xu0I7wM8XZCTdhQEXdHYIMM7emtLRSGHdeiB/68SN/Ht
         tfrd02vpVFZ2PcqEhO2o/oPIh10zOcV4xRiNfQzy3UZuQdn80aEXT07bAhpha1WG65Ss
         /CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958662; x=1794563462;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQBnTQDeqPWib9HYEy/76nQqVu/AgiIe/ITMno6I1Ns=;
        b=vNThF3uuuYZusX8RkpaRypZpaTpVqayQc9IRQ7MvUYRvA2iWBqLd/EEOJsqsH6HhHw
         Zab9mV8pJF7zA+tCbkoSzq4LooWQeUoQWL2nVOcHLQwwSIoVfHclE/oOHJbQmt/x+a1z
         PwUc8o2r+2J7l3S/aRF9KXSMFZwfKmXl5ZQwgza4uQxhBz59FxNyIjJI6M1ZI0yTtECl
         HtjPY0uvCKu+V3wh19he2bPbOB3updkSDRHxRA6gzodA+dEwe/dDxuD7iPEHD+nOOlEB
         sJHuQtbZTEWW7sPORLvaES8fmKWIkOxys2Al8KBk9zPpjcwZDppoBU5NeolKWon4FHb0
         tiqA==
X-Forwarded-Encrypted: i=1; AL+hErGlTFxxM9HzL0v1JjNEFeWT2l4sftO9x9+LEHRKjvYtbXY9+X8Hw5aElTn4+ZiMJu1rmQ5/6ZrRp0Q7sq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+wwsLc1I5VOYvhjj6cc5Fseiid4I0j7uZeIABC7oS/CU011sp
	vAjfRcK9aT5TcLKsEsXxp/XOLCq6MCKJRtEyYjBdOvUA78dhofgGuzY8AP/1WY2K
X-Gm-Gg: AYBFou0bKuGcqMpheo2JxUdU9iaEFV4emJBG4VFKikivSdVcuQfzaPgkT8u2V0pSMYw
	SfABJfI6aT4AgeeSs9xqIGyoiTitrKjaZO6AnEwRGm3bryaC/ha2B6SgtGt8TUfZHN9K3JnCSw0
	PCleD3mHqnzDc9p2ImjlCP9bpuhgOPjYX0Q4DVLjXtNKe2uTLC+c+ShNgww7bDMb3AATM85aQy9
	v6l/uvX1g0Cu1tHKZzzk9dB6Yw1V+1gkUDStmPAHWzMSzTSxMZnRUo3HqBILeMdJ72w0snCIyJS
	XqU4/EHyYevRK2/GT2yG4TtOdJQfYk9AJA5ZuzfAMPJgAnyy/1UNANyvAD4QJPmxbSBhtfkf9BR
	Xm8VZGZ02D8qbu8smskJBLbQpruZo/QaNjv5oF1PxYDakf4KHGHTMzHqsRpFISU6L+7h4rX9bP8
	4ZV4gdBpyfwrRDZdHtkCCxgSMBbIpVHZ981NdhbJByzgheiA2EjPghWLwqvrKmYbF1yjmqwR2kR
	2cFbbOenkXE+tfFfQJJEbHZRUBlxgU48Lb/9cSf6IwpOMg5lNvxUen2CNqyqlftvFROMoZZAij2
	/DKcKxis2QsElWCPLM97suIB516DvaUmyb5RX/o=
X-Received: by 2002:a05:6000:40df:b0:492:3982:a80c with SMTP id ffacd0b85a97d-49276977cacmr4368036f8f.29.1793958661695;
        Fri, 06 Nov 2026 01:51:01 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63accsm2813516f8f.17.2026.11.06.01.51.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 06 Nov 2026 01:51:01 -0800 (PST)
Date: Fri, 6 Nov 2026 10:50:56 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] usb: usbfs: Require claiming a hub interface for hub
 class requests
Message-ID: <20261106105056.4601f826.michal.pecio@gmail.com>
In-Reply-To: <20261106091048.4056-1-25031212351@stu.xidian.edu.cn>
References: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu>
	<20261106091048.4056-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  6 Nov 2026 17:10:48 +0800, YuanZhe Liu wrote:
> check_ctrlrecip() requires the matching interface to be claimed for
> requests addressed to an interface or an endpoint, but requests
> addressed to the device or to a port are passed through without any
> check.  For a hub that means userspace can send hub class requests
> through usbfs without claiming the hub interface, while the hub driver
> owns the ports.  Port requests use USB_RT_PORT, whose recipient is
> USB_RECIP_OTHER, and SetPortFeature(PORT_SUSPEND) is one of them.
> 
> That is more than a policy question.  The request goes to the HCD, and
> it can run concurrently with userspace releasing the hub interface
> through USBDEVFS_DISCONNECT_CLAIM, which unbinds the hub driver and
> disconnects the devices behind it.  xhci_hcd tracks the device behind
> each port and issues stop endpoint commands for it in its port suspend
> path, and it ended up reading a freed xhci_virt_device.
> 
> Require interface 0 to be claimed for every non-GET request to a hub.
> The hub driver matches devices by device class or by interface class,
> but a hub has a single interface either way, and that is the one the
> driver holds.
> 
> Userspace can no longer change port settings while the hub driver is
> bound.  USBDEVFS_CLAIM_PORT hands over the device behind a port, not the
> port itself, so a request that pokes port state is not safe for a
> claimed port either.  Programs that used to do this have to unbind the
> hub driver first.
> 
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
> Hi Alan,
> 
> v5 takes both points.  is_hub() is tested first, and the comment now says
> that IN requests are safe because they do not affect the hub, while OUT
> requests need the interface claimed, instead of talking about recipients.
> 
> I will hold the URB synchronization patch for usb_hub_release_port() until
> this one is settled.
> 
> YuanZhe
> 
>  drivers/usb/core/devio.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index e191934623c7..6d69a993c0f1 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -878,6 +878,23 @@ static int findintfep(struct usb_device *dev, unsigned int ep)
>  	return -ENOENT;
>  }
>  
> +/*
> + * Return true if @dev is a hub.  The hub driver matches devices by device
> + * class or by interface class, and a hub has a single interface either way.
> + */
> +static bool is_hub(struct usb_device *dev)
> +{
> +	struct usb_host_config *config = dev->actconfig;
> +
> +	if (dev->descriptor.bDeviceClass == USB_CLASS_HUB)
> +		return true;
> +	if (!config || config->desc.bNumInterfaces < 1)
> +		return false;
> +	return config->interface[0] && config->interface[0]->cur_altsetting &&
> +	       config->interface[0]->cur_altsetting->desc.bInterfaceClass ==
> +			USB_CLASS_HUB;
> +}
> +

Does this really belong in devio.c?

If anyone thinks that the trivial "bDeviceClass == USB_CLASS_HUB" isn't
enough (Alan seemed to believe that it is, but hub_id_table has matches
for interface class too), then perhaps this should be placed in hub.c
near the ID table, so that it's more likely to be kept in sync?

>  static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  			   unsigned int request, unsigned int index)
>  {
> @@ -891,6 +908,18 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
>  	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
>  		return 0;
>  
> +	/*
> +	 * A hub driver owns the ports and the devices behind them.  Letting
> +	 * userspace change hub or port state behind its back, for example
> +	 * with a SET_FEATURE(PORT_SUSPEND) request while the hub interface is
> +	 * being released, is not safe: the request is passed down to the HCD,
> +	 * which may walk per-device state that is being torn down.  IN
> +	 * requests are safe, they do not affect the hub, but OUT requests are
> +	 * only allowed when the caller has claimed the hub interface.
> +	 */

Seems overly specific to this case. It isn't safe in general: it could
confuse the hub driver itself, disrupt functioning of child devices and
their drivers, or break HCDs relying on core serializing any actions.

> +	if (is_hub(ps->dev) && (requesttype & USB_DIR_IN) == 0)
> +		return checkintf(ps, 0);
> +
>  	/*
>  	 * check for the special corner case 'get_device_id' in the printer
>  	 * class specification, which we always want to allow as it is used
> -- 
> 2.34.1
> 
