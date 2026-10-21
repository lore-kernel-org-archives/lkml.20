Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590427;
	b=pFb+m3NfaKRwkZmb0MXsOgJ3mRaP/N6PfwkMVU6LyHOBrYAeHOtM2c08oSCyu3AJOxsq
	 CWuQo4NsfQ6qLK1C4q1ywnT2f2+NNsMC6AG9vAI3unH+byV1rRhLmAeowAVIN4I0oELIl
	 58JpidrNoF5RL7fFNB4bldkE0LdmX08LRRGcjXgh3LIC4Ef2ivHXikadx4pRECI2MmQPM
	 6YwcvjsNeMspP8PvdzH3rCgBkROawjtdj9Dwd619l0zGNMiSgteNU3HouDO59GcMwV3WB
	 bxXDzE9gjZ/XKZDpOYwqFVtDinR/798E4yWRCyHq/CKN6DavVN10GfUrGaR+LygtaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kgtGQJbzPRUfHlejZQbNysmTaQQPZRXn9ZZAO+5WyiU=;
	b=E+Pk6Aqtj39iqn4qVx5J7MCREX0Kq2nJaDCsKfg6Ue0PtoCfPX9j5sRh1gUGU1IFmNyu
	 7L98tDLyNmzZWdHgqIsIz6uNF7jFBgSm6xD8a27ifViloZGTrzHzcuzhLw3YBCKq1dd/4
	 o+srNIL/L0qLMn9YhYHZLke/p1pskbYWhFqyXjPXsRG7Lfe+zrITIhDHVf5xYo7DuKns3
	 xfpdsQ9/DfSmWixZmlELBoSEISDp04zyh/dt96SKOiZnrEdtJNUt6+tr1v6WwUDmMOZgM
	 FJRfVlsqAJd7HXYWuWwA1+o2aaQ1VQFiPPHwHltNr+ZhW3rdo3myWwZaX/iVDWw9qcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Ldjnfx1t;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F606606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F606606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Ldjnfx1t
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f259cdc86so72531185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792590425; x=1793195225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgtGQJbzPRUfHlejZQbNysmTaQQPZRXn9ZZAO+5WyiU=;
        b=Ldjnfx1t/qfbMvCpjtlUf1T23Q41lFuGDI94teAPX/Idd8dibdqldK2px3JKb3K1ZM
         vBOtzE2m7UsJ0NSSNrGl0OpSpINMVJ+qVxcP58wE9VF0VWRdq/NFLN8Qjy/PRFB30GK9
         HoxWjPT05NUVaM2AnCVp8lZj6X5bysDdmLCg0oAzHpZsmjkCFtn+I2mSSJ9M2ymw749/
         GpfJGghRc2KwOh8tS4aixS2/biA3AT70i9WbmbXKH22kMsNd62U7VO/5e2mQ02OQEscw
         5Z8jUxZAxNC13YcBuvRNWl8b5CPNkb2XiVuE9NgJvjLcr0y+RSUcwbe2gJd9coV5ZGon
         ejBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590425; x=1793195225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgtGQJbzPRUfHlejZQbNysmTaQQPZRXn9ZZAO+5WyiU=;
        b=jAj5GW/y858rdc++oesOm1ycVj6D6i1FiEYejttxN/0O0jOiqIpGu/Lh8eXA2W9CeU
         4SMorbxIpVb1YkZpXXgJOGdK5FWq/+0wg9lIqxK+6kIoHyi0ASWedINik5yRX+9ZYp/H
         J2LcKr0BlmPEqwmlrNaPVCL5TLjpOsV6xcJZE+6G9891pZx6ZiolCDJf0AX2RR+KEett
         vbY8EqM79JJ3gqgq82oSEIpHsdSdvD7ENaA/QtH56uYbNDhFI+WqV2IcKrdnJOg8nsED
         nVyGRt7/pVvW+aYXlWvHfPl3BxnqyNd/vx1PemXEJvP+aviJKyAyTuVtNKB73L0/K07v
         k1Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzRfrAXKLrOQrvcOu6Ou17wFF+oEpkPUrm9J4KyjJMDNI6EfoE2RiJotziZ5IsVSDOScMSFUFoHx2cfr5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8Yy9qttEOCpqDJd8svoePde+rzfL3OAXneUgQZFX/88vy1fRh
	YJFAosMK+ILbQTBnJ7Whz+w3XzAwXFRzroQsaiVGgRhi0+nguNaAGdSVzwiLIfA3Hp/m/o9NYEE
	2sm90YA==
X-Gm-Gg: AYBFou1l/5lNoWSS8Wulsz/8mdwieKfw2kZwD1c/CdlBrU+rdaIwTtRswqtY/AHoppc
	N0L3dehJP++wsLI+iCAdqnivJywejHKhu0pNO4y9XrqDq7vDltrIBcpNG69+4ACly2AwEE3dFRY
	fPj9g8Gi5/wLoAEe8461Sv4H08DRQhfwjNG/UXhZrOfPNWe/pjWQdMRJmuMlbHGuOVTlFQzweiI
	4WQgfgpxdSk5djL1o+MXGphGYzHBZ5jxH19oENzyqdm/KVqIebVeEKJkXp99aCW/KwSOSvc/mld
	4uYoUnO/JUTdplaO8QWVZj8/sTM5ObHjBhedw/a+qDuMFQQNqP9p/spuwuismVFbyUq8shFOED9
	hD3jDVV3rm6BOwzsihx2E0DVq1E/ttVIe2nvHdESTT0+IhkuUTo6cohfxqUr5rzwMPNyJC+FN2T
	4kZMHU538s5ZvKmNgNbg6GPHkovbzaofbr3uodSoAR+AeA59J7D6M4za+S1uIUkjjO51jDuhrIK
	IyW7bO/6ZzXPUe1jerKbNWchUAxuzNvp+cy5JB0THQGPXma90No7O+GRb3m8UoUvc2gq/Y1sg==
X-Received: by 2002:a05:620a:4496:b0:93e:c12c:f121 with SMTP id af79cd13be357-93f57fe2729mr420063685a.77.1792590425021;
        Wed, 21 Oct 2026 06:47:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e2a60fsm257587685a.41.2026.10.21.06.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:47:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:47:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Cole Leavitt <cole@unwrap.rs>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: hcd-pci: Do not disable an already disabled device
 on remove
Message-ID: <c9cb1c9d-1dab-4a18-af70-636770dbaa64@rowland.harvard.edu>
References: <20261018164134.134106-1-cole@unwrap.rs>
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
In-Reply-To: <20261018164134.134106-1-cole@unwrap.rs>

On Sun, Oct 18, 2026 at 12:41:02PM -0400, Cole Leavitt wrote:
> suspend_common() calls pci_disable_device() and resume_common()
> re-enables the device. If the host controller is hot-removed during
> system resume before its ->resume() callback ran (for example pciehp
> handling a Thunderbolt/USB4 dock or host router that did not come back),
> usb_hcd_pci_remove() drops the enable count a second time:
> 
>   xhci_hcd 0000:b2:00.0: disabling already-disabled device
>   WARNING: drivers/pci/pci.c:2198 at pci_disable_device+0xac/0xc0, CPU#9: irq/128-pciehp/225
>   Call Trace:
>    xhci_pci_remove+0x89/0xd0
>    pci_device_remove+0x4a/0xb0
>    device_release_driver_internal+0x19e/0x200
>    pci_stop_bus_device+0x63/0x70
>    pci_stop_and_remove_bus_device+0x16/0x30
>    pciehp_unconfigure_device+0x96/0x170
>    pciehp_disable_slot+0x66/0x100
>    pciehp_handle_presence_or_link_change+0x62/0x190
>    pciehp_ist+0x14f/0x1d0
> 
> (usb_hcd_pci_remove() tail-calls pci_disable_device(), hence it is not
> in the trace.)
> 
> Only disable the device if it is still enabled.
> 
> Fixes: a0d4922da2e4 ("USB: fix up suspend and resume for PCI host controllers")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
> 
> Notes:
>     Tested on a Lenovo ThinkPad P16 Gen 3 (Core Ultra 9 275HX, JHL9580
>     Barlow Ridge host, I226 Ethernet), in daily use since 2026-09-17.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hcd-pci.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index cd223475917e..ae5175fefd91 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -348,7 +348,13 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>  	usb_put_hcd(hcd);
>  	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
>  		pci_free_irq_vectors(dev);
> -	pci_disable_device(dev);
> +	/*
> +	 * suspend_common() disables the device. If the controller is
> +	 * hot-removed during system resume before resume_common() had a
> +	 * chance to re-enable it, there is nothing left to disable.
> +	 */
> +	if (pci_is_enabled(dev))
> +		pci_disable_device(dev);
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
>  
> 
> base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
> -- 
> 2.54.0
> 
