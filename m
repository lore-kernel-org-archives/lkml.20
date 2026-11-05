Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898708;
	b=DKFjDFSI4rj0InvQcmf0/jdM5B1AIRcnlODfW1xNj6iBk5jiKBEySXrreMPFhwjaP351
	 fFXtzLygbUW33z/bCX1wuGaeKIqx1pAX8RJLPpRv+onTUnhpZoO26FD9gygmqYAuUGLDy
	 BUtsP5g1i7cuKtO+4o498F+z2jwY2mOA1h12m4LIQ+rfHXtPB52LPS5xP9r7UboAvJevT
	 QuqQC2GQm2rzFvJLr+O0ygfHcHkMazUXBC+pD38igJn19N08Aah0MEUjPnRA3zWQWAjAE
	 Frx8h/zq/XJDDBXgzunF4AED8uH1bfWXKWOguUF1HnkOxOIBM/pNi6j8Ik50UzpO57g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Sbc9C6Rc9wkCFWvmv7LEdnH0vSQxoeiF89aNLuF1pRc=;
	b=CpG/lrFJv5d3CefCz6hs+3qvqQrYDs3JY3u+gTSS10N0p7/NvnOtH83hFr0P9WgVHtSy
	 95INWKZTlr11VU5QQfg7pVIsMphxQZCty/EL674C9lSGByJ9qD8Lhx/xr+qf5optEJ3jI
	 O/uqWBvaBV776aBcGVvQdFhAcx0cJoLOMFfVhlokeaRQZcKq1bzP3ICHrP2Jx1luCmvzF
	 h0YWqF7v7kxAqMVZjsVJjnp+YtKv//Mn2QbY+cdCqm+x9lqUnrI7qVzrttaw4DKRQ+WpP
	 hwFVx/AjhfgroxInpPMNnTaRFDAaQve03PwgnXBvYyNuW4pbuXC8La+YHamlRxbDlXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=IwkDhyiU;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBE5606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBE5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=IwkDhyiU
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91e7fc8265aso24993686d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793898707; x=1794503507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sbc9C6Rc9wkCFWvmv7LEdnH0vSQxoeiF89aNLuF1pRc=;
        b=IwkDhyiUXVD5jHVJdOfnkICuZZojhv5AMc25xbfMZaDiIJ4V8aYvmLpidKeRA00xJ3
         70V2P4IX3OtG3DqyfNzm434LqyZ3UsWib6y3jBc0AcSDPJk/pHxTbwyA+yhA4RrQ5DEx
         lXSArirEsLyn3X3VhRXA4bVEcbG/HvllPUBMUcT3sMVuN3uX/KXFqDUiV4Kisg8BPVMN
         48r1OruO9OqOBs3nJEDPP051C5b7xWnEdGIgG6DXTxT3ArTy3pahRNzXPX1Y5PM2KzZZ
         0aUdWVGd8opR6txfXemKK3lNm9o7nnRpFAYqw0F6jGRaxtHm7kW7KfWbyB96PbdHPTHI
         Qk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898707; x=1794503507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbc9C6Rc9wkCFWvmv7LEdnH0vSQxoeiF89aNLuF1pRc=;
        b=tECQRUpv4xKD2cVzCmeFsMV/3XS0pExuAj5M3NiLA15n2O2kojNC39vzP9yW7ycC8U
         7kcjTP/BF1QqQIqKPFpI+PrEGA99gBrKHpMeOabwkPHSvuNeN0SVP4u5gKo/jqYXDYrd
         mVXXK6U1qRR5YjDNfaUJRkKG2pYRNu+M/fI2+5bxH5WpPqfTe5Esp5kZbgvou0pQ9Gsg
         bo5m6Fo0RsuePTOv7MvIbG53fbL7WSeLqL7Y7I/gqeF+JjBCaqpWYwYoxy0dQaNXyJ5+
         4JrWM/IS0wSjRwP94CxqoyzBaNprh1a+F0KSWUGycPZhmmZrbHub/vY3vQyFXm2/OLk6
         wzsg==
X-Forwarded-Encrypted: i=1; AKwUvBzd3HH9LJep+Uca0WpSyXWWSnh3k0XyfYO+mPUBxhPXniXFt+l9JHaTSFbB021mPXn914wbnHFq5G2UiKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pa7kttifKt2vN1cAlH4/7hMOkLDoo4s1rph7fPCGLBT78rkpZ
	73md/aIaEjfjjIbNnRpFo/QrOxhfR7Y10wKQB1s9FuZL5r5uspBejvZB/M0HuV0MzA==
X-Gm-Gg: AYBFou0JDTpqRButvrvLe0kQc+6FXaPsiWVeIRnkUmvNB6wfxm7hRmKFf0LabteamJ8
	KfkUtmPlQijNawyDyGDhKsGFjCyESHooRGjmgb46K9gb8IT7NXNVXVP1zQ9MuACVQusgBbC8lr3
	DGLi0j/zy8WEs5DPg+gtbpDbNsNnC9F62HhmIKjIPuePfYIWU99BjSii1IWNhV55K/CqXVSKUXr
	mAusHPfbP7Axvv/MAMnKcS7HlzqzyXRS/PsH+6rSeOtmgqtI/1kgWpzTeWasbKthgKHAWe6Gxi3
	b7CIt36Ll/rRdvDfmTeeL+206UWj15DmaSDMiqq/LqfMznJCR67f2ckJo43/YYZ3/TnwR46uO2+
	W2cjdIXVVk7GCIoEJlDxqKmKDXYAz+eoTtw1ZcKJMATUh69k+JogHTW40CZGJ1Xm1k4TXVUMjX7
	oqT1nOXSyv5RDN4xfwjz4Aw0fRuzJS2AvRMdpwkezZ+Y0eCznJh4N0OCz/3gn0eBNnn/gFXWO/V
	rwmYomhZVMYnRuAnjFfp/la/1ioKy6TKB9XOQagcAR0/F9iOND8Vpi/ZLm/T/AT0GHHLc7c7hj9
	bPl5ZLsATZIqkal7RK3Qta35Abk7
X-Received: by 2002:a05:6214:311b:b0:91e:9230:6430 with SMTP id 6a1803df08f44-91e9230653emr58823886d6.40.1793898706605;
        Thu, 05 Nov 2026 09:11:46 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c742sm265606d6.11.2026.11.05.09.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:11:46 -0800 (PST)
Date: Thu, 5 Nov 2026 12:11:43 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: usbfs: Require claiming a hub interface for hub
 class requests
Message-ID: <d0c16945-29ce-48c5-abe5-2d2c6b562d51@rowland.harvard.edu>
References: <20261105054333.7811-25031212351@stu.xidian.edu.cn>
 <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>

On Thu, Nov 05, 2026 at 02:56:27PM +0800, YuanZhe Liu wrote:
> Hi Alan,
> 
> v3.  v2 had two problems, both pointed out after it went out:
> 
>  - a hub in a composite device matches the hub driver by interface
>    class, not by device class, so testing bDeviceClass alone missed it.
>    The check now looks up the interface the hub driver uses, whichever
>    way the device matched.

The USB spec forbids hubs to be composite devices.  You can go ahead and 
match by interface class rather than device class if you want, but I 
don't think it will make any difference.

Similarly, the spec forbids hubs from having more than one configuration 
and one interface.  Sashiko warned about devices violating this 
restriction, but I don't think we need to worry about them.

>  - USBDEVFS_CLAIM_PORT hands userspace a single port while the hub
>    driver stays bound; that is what the ioctl is for, and v2 made it
>    unusable by requiring the whole interface.  Requests for a port owned
>    by the caller are allowed now.  That needs a small helper in hub.c to
>    test ownership, which is why this touches three files.

We don't need to allow requests for claimed ports, do we?  

USBDEVFS_CLAIM_PORT doesn't really give userspace ownership of the port 
itself; rather, it gives userspace ownership of any device connected to 
the port.  For example, userspace shouldn't be allowed to suspend the 
connected device by sending a request to the port.  It has to use the 
runtime PM mechanism to suspend the device in the usual way.

> On whether this closes the window completely: it does not serialize the
> transfer, and it is not meant to.  check_ctrlrecip() runs under the
> device lock and do_proc_control() drops that lock before
> usbfs_start_wait_urb(), so an in-flight request is not ordered against a
> claim being released.  What the check gives us is that whenever a
> request is allowed, the hub driver is bound, so the port has no device
> for xhci_free_dev() to free.  The memory safety itself comes from the
> xhci hunk in the other thread.

Right now usb_hub_release_port() and usb_hub_release_all_ports() do not 
synchronize with outstanding URBs sent to a child on the port.  They 
really should.  (This means killing current URBs and preventing new URBs 
from being submitted.)  Fixing that can be a separate patch.

> With the port owner exception above, tools like uhubctl that send
> SET_FEATURE(PORT_POWER) to a hub without claiming either the port or the
> interface will still get -EBUSY.  Do you want an exception while
> privileges have not been dropped, or is losing that use case the point?

Well, it _is_ kind of the point.

The only program I know about for manipulating port power settings is 
one I wrote many years ago; it is careful to unbind the hub driver 
before changing any settings.

If we want to allow this sort of thing (changing a port's power while it 
is under control of the hub driver), the right way to do it is by adding 
a new command to the hub_ioctl() routine.

If people complain about regressions from this decision, we may be 
forced to make it a special case, which would require it to be 
integrated with the hub driver somehow.

> Whether this should be marked for stable is your call.  The missing
> check goes back to the initial git import (1da177e4c3f4) and the ioctl
> that can race with it arrived with 0837e7e5270b, so I did not add a
> Fixes: tag; I also left out Cc: stable because this changes behaviour
> for userspace.  The stable candidate is the xhci_hcd fix in the other
> thread.  If you would rather see this backported, tell me which commit
> you want named and I will resend with the tags.

Given the potential for bad interaction with user programs, I recommend 
not marking this for -stable.

Alan Stern
