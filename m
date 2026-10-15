Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0A38E5FE;
	Thu, 15 Oct 2026 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080826; cv=none; b=oyETUkDNZnIZW6ZAP+RfUpxBwSo+H/u56ecwTkG5E/Ypx78+e6RNKax+hMV8knSIhzyWgDD+GB6nn/De/bYwPJnHJaRDtpv56LfAInizmiUdl2KXjZpEpkpC0fE9srEB9EooWweHgN0BCB55ffiRM0H55BgG+a/7D7+WeGbF6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080826; c=relaxed/simple;
	bh=/JnQt+lEFqU+ghrjXhV9H/uwBnc71mgHxYV392sJwWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmMYykrMSv/oMIymrdNvQmx2MB/M1YmIFx5ZeYxJqZkNJ75gb6Dj48LnWf1+mQime5oAHEo0d9VQVtoaY3vRsW4U4D2IKO7Ea0F+3UTvJ4D7SYefkIwTbdXNV3RQN57nmw1B2yOmonjYrX0FKnxq5oLRyB1JuDr4e0gfseSvsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2PS2yaV3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2PS2yaV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDABB1F000C4;
	Thu, 15 Oct 2026 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792080810;
	bh=9zmTQv7iIkVn5qjU1IFeXJwrJCAFyfypv9SfxhOHlJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2PS2yaV3wE2OWvYj9icP9sqPnxM/FxyBZxszJXUcViCBkCphHYAgKdDa533cFvV3c
	 lzPQjLgoeNRbf16TQPIpCbV/GrjbIjhQKpxwtlAaalPzkAkv7ch/7PavjaCOR6807m
	 1WvRNMzf5S/21pdXBMR6rcGCvH8TIduglquhrL04=
Date: Thu, 15 Oct 2026 18:13:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Neill Kapron as USB Gadget maintainer
Message-ID: <2026101509-slighted-tinsmith-9c14@gregkh>
References: <20261015152458.3541767-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015152458.3541767-1-nkapron@google.com>

On Thu, Oct 15, 2026 at 03:24:57PM +0000, Neill Kapron wrote:
> Restore the USB GADGET/PERIPHERAL SUBSYSTEM entry and add myself as
> maintainer to help review and maintain USB gadget drivers, core
> framework, headers, and documentation.
> 
> Signed-off-by: Neill Kapron <nkapron@google.com>
> ---
>  MAINTAINERS | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e8a4b5c90b..16560ddf7b7b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28220,6 +28220,28 @@ S:	Maintained
>  F:	Documentation/usb/ehci.rst
>  F:	drivers/usb/host/ehci*
>  
> +USB GADGET/PERIPHERAL SUBSYSTEM
> +M:	Neill Kapron <nkapron@google.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Supported
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> +F:	Documentation/ABI/testing/configfs-usb-gadget*
> +F:	Documentation/ABI/testing/sysfs-devices-platform-_UDC_-gadget
> +F:	Documentation/driver-api/usb/gadget.rst
> +F:	Documentation/usb/functionfs*
> +F:	Documentation/usb/gadget*
> +F:	Documentation/usb/mass-storage.rst
> +F:	drivers/usb/gadget/
> +F:	include/linux/usb/composite.h
> +F:	include/linux/usb/func_utils.h
> +F:	include/linux/usb/functionfs.h
> +F:	include/linux/usb/g_hid.h
> +F:	include/linux/usb/gadget*
> +F:	include/uapi/linux/usb/functionfs.h
> +F:	include/uapi/linux/usb/g_*.h
> +F:	include/uapi/linux/usb/gadgetfs.h
> +F:	tools/usb/ffs-*
> +
>  USB HID/HIDBP DRIVERS (USB KEYBOARDS, MICE, REMOTE CONTROLS, ...)
>  M:	Jiri Kosina <jikos@kernel.org>
>  M:	Benjamin Tissoires <bentiss@kernel.org>
> -- 
> 2.56.0.385.gd3acb90ef8-goog
> 

Yes!!!  Thanks Neil for agreeing to do this.

For others, we talked this over at LPC this year in person.

thanks,

greg k-h
