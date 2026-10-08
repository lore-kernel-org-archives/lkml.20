Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CFF375AC4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454572; cv=none; b=k1GrK5QWPeaXV1nvYlXFOwxjCtpEueu/Qqmh+UnwAJka7JXT0+yj1HIbsLi8Nsp9mtZukpQf5ALp3IdE3fdOOvhf8hC/nCJX1gzz9aUQu1YKaNzRFxftZjBZT2msL0schlDoo2/CJtf9m3aD0G9kDnKXbJcJzeq+q70Euda+xHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454572; c=relaxed/simple;
	bh=e4wh8k5S9G0ULPslHxGFjvETPiXMDjfoHfIlUwB5f0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcxqrzN56hgk+WbI18h3pKv9nS5z349/odZwnTf42UTY12YLsqDRex4y42ImBzjnix20w7JBTaiIKloBZGM2RC8kRfhiOL0H2rM2nJGgzDKnwtd78taHj0q5SsvXQz+i3lqm1DfnGJe1BWf7cUXcSDdFwVxuP58a/Z4FqzjAkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MjCtSS5Z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MjCtSS5Z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so24173575e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791454570; x=1792059370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8etGjMJEeVxrETmezgIDHyTK7amt3qspU/qe6Xo8zl8=;
        b=MjCtSS5ZppmmoQiK32B2etd8AUOfdp/Mey4MKj6HjFkEnknGFKna6YDju/beRZYg14
         QnvCaf5combpVGv2EhI7zLrCQzTjPjUKC29f3SFQ7YkLOK4ztDtQIeqPrib6Pm+OS9qX
         zYeUtcAOvYRj5uU0IZZMdb4kPxATITZOQiLO0Hrqe9cecyRBdEOQ0yYdB8Cyo+dPSv0v
         5YVgeSfUcAWAVD0Bo/g1UPNZ43o5+rCiUH1Yvpcx4GcczTftkhw6JsDUS0O/1SFK1qKW
         YuiWMDBvzEaBXyL9q5ZfZpeRljMViOHv8OSfx8P4C+/xJHc/s0Ok3SiLjbYgjPbAaH6k
         gG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791454570; x=1792059370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8etGjMJEeVxrETmezgIDHyTK7amt3qspU/qe6Xo8zl8=;
        b=V8xvabA210tG4obM1rmsh8rWcjDWAUHe4zwYiAT0KAHYXwB+y1bKaNjnma3N4f5u1C
         Jur+gxq/zuBLqEY2djOU90klBp5YIwhyK6mfBZVA/ztSvc8J8C7xaCAWqmS/jephekAX
         v7E5nxoJkB3PfC6Y7iKxnwVimPWJn5VToFDy49FsU3Po8lWVtY2WJEMRymZO3cqSHaCo
         acAa90sfRSg4ID1xF6w+A5qfr1VyPNnlSVueUZrkFHJQ/KEpYoQHH7SO8bnIlO+n9V+C
         usOP9mAxpcS2LlRBFn02xTfHRIK/169IoHUPctnc65T4OCwnEcp2ohJLhOhzZFE7FId4
         ozEg==
X-Forwarded-Encrypted: i=1; AKwUvByZ61BuGw/dDXUwxiH59zE9mzOuQ7SzvnNUC+d7wu+AE+Ml5iX1RQbBPCHfzwZLWPZiZFAUgWtFTLOfJV8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKY/DLgTPSHGhAX306fXV/CtTGqtIlwYPSUFIiaaY+3ciBN1U1
	uahBHswMh+jLmqvT8Uas3EcZHO65lY0K/2Jeq54Hub4osR5+YPfxMx4gsCJ7T6xWq1g=
X-Gm-Gg: AYBFou3kDpzaD4/5hMUgMMDih83mmlGSUGyVAJaN2wyeD2QZq0HYP06TgKUO7NoBIUx
	DUwUkdqmYRiUYuJPHacdb3NGn4klCFZxXjoQ5aeHU2+HiEuo6e+75miw31rXh0hp2PqVxbTAT7i
	sRUg6NL7eyODSdWuoUupSz/2Se39WNLdjOr+JbI7NoovFSjltZEVSkP811xaVwYHf4BqgalkOfo
	/zJLp7/3uIiBVzlmB7CHq2gtNKfPYLhew6w+LQ00yh+Aani/Fy2WojYO+//3lCrGZ57HfricGaI
	DUj9WRZ3NlupbJA5I764MNmuXuZwIjuPFRpT/dIdgMAfhoPoqaePQ6iejZ0Ru3UhIty5feo3b5s
	Gw7cCF3fT6fOHkg1BPlUg6HJ/xOGm3G6T73zQlIeb1w15SPy4UINl6TFNf1Tq+A3ZQCs9sHNwq5
	iRaqD/dWh0YE4LE7CqGrUIJvwT0wy8gzPVqa+R0AOUv5fUjd1rE0+vGGg2OOpqJ+UsmbdKD4d8W
	iVNR8ZwbRjVdbH6/R0IZ7oHBL7ZU99hUrK4b/NgCZ8=
X-Received: by 2002:a05:600c:3ba7:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4a18043b426mr99970595e9.20.1791454569556;
        Thu, 08 Oct 2026 03:16:09 -0700 (PDT)
Received: from ?IPV6:2001:a61:13be:f901:8903:c5f1:e7c8:72f0? ([2001:a61:13be:f901:8903:c5f1:e7c8:72f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843bd060sm75338045e9.14.2026.10.08.03.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:16:09 -0700 (PDT)
Message-ID: <f713829e-0fbc-4ce6-9508-9d015c85e614@suse.com>
Date: Thu, 8 Oct 2026 12:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] usb: xhci: Add support for eUSB2v2 1024-byte bulk
 packet size
To: pawell@cadence.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
 <20261005-eusb2v2-packet-size-v3-1-fde610a3c47a@cadence.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261005-eusb2v2-packet-size-v3-1-fde610a3c47a@cadence.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.10.26 10:18, Pawel Laszczak via B4 Relay wrote:
> From: Pawel Laszczak <pawell@cadence.com>
> 
> The eUSB2 v2 specification (bcdUSB 0x0230) introduces support for
> 1024-byte maximum packet sizes for Bulk endpoints in High-Speed mode.
> However, an eUSB2v2 peripheral will revert its internal maximum packet
> size back to 512 bytes after events like a bus reset, disconnect, or
> deconfiguration.
> 
> To support 1024-byte bulk transfers on capable hosts, add a new
> is_eusb2v2 flag to the usb_bus structure, populated via the HCCPARAMS2
> E2V2C capability bit in the xHCI driver.
> 
> When an eUSB2v2 host configures an eUSB2v2 device, issue a specific
> SET_FEATURE (USB_DEVICE_BULK_MAX_PACKET_UPDATE) request during device
> configuration to switch the peripheral to 1024-byte packet mode, and
> allow the xHCI endpoint initialization to accept up to 1024 bytes for
> HS bulk endpoints.

[..]
> +int eusb_update_max_packet(struct usb_device *udev, struct usb_host_config *cp)
> +{
> +	struct usb_host_config *config = cp ? cp : udev->actconfig;
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct usb_interface_cache *intfc;
> +	struct usb_host_interface *alt;
> +	struct usb_host_endpoint *ep;
> +	bool has_bulk = false;
> +	int i, j, a;
> +	int ret;
> +
> +	if (le16_to_cpu(udev->descriptor.bcdUSB) != 0x0230 ||
> +	    !hcd->self.is_eusb2v2)
> +		return 0;
> +
> +	if (!config)
> +		return 0;
> +
> +	for (i = 0; i < config->desc.bNumInterfaces; i++) {
> +		intfc = config->intf_cache[i];
> +
> +		if (!intfc)
> +			continue;
> +
> +		for (a = 0; a < intfc->num_altsetting; a++) {
> +			alt = &intfc->altsetting[a];
> +
> +			for (j = 0; j < alt->desc.bNumEndpoints; j++) {
> +				ep = &alt->endpoint[j];
> +
> +				if (usb_endpoint_xfer_bulk(&ep->desc)) {
> +					has_bulk = true;
> +					goto found_bulk;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (!has_bulk)
> +		return 0;
> +
> +found_bulk:
> +	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> +			      USB_REQ_SET_FEATURE, USB_RECIP_DEVICE,
> +			      USB_DEVICE_BULK_MAX_PACKET_UPDATE, 0, NULL, 0,
> +			      USB_CTRL_SET_TIMEOUT);
> +	if (ret < 0) {
> +		dev_warn(&udev->dev, "eUSB2v2 1KB update failed: %d\n", ret);
> +		return ret;
> +	}

Why not handle eusb2v2_mps_active here?

> +
> +	return 0;
> +}
> +
>   /*
>    * usb_set_configuration - Makes a particular device setting be current
>    * @dev: the device whose configuration is being updated
> @@ -2123,6 +2188,15 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>   	if (dev->state != USB_STATE_ADDRESS)
>   		usb_disable_device(dev, 1);	/* Skip ep0 */
>   
> +	ret = eusb_update_max_packet(dev, cp);
> +	if (ret < 0)
> +		dev->eusb2v2_mps_active = 0;
> +	else if (cp && le16_to_cpu(dev->descriptor.bcdUSB) == 0x0230 &&
> +		 hcd->self.is_eusb2v2)
> +		dev->eusb2v2_mps_active = 1;
> +	else
> +		dev->eusb2v2_mps_active = 0;
> +

You are effectively duplicating the logic of eusb_update_max_packet()

	Regards
		Oliver

