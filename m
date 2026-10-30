Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358843;
	b=zBRzmAkLlf8mXOqWf/tt+gpHBc2aQRLDXdZfLXiA4sCCs+fj6qVGKCWfsZ6RnBjibLQn
	 28fL+TAzt/Gb7+bBEqdeGYMRzl5BvdknzQfsXKZ3HHS1Yjetgfc6/9MZY1OuX1GUZ6hvU
	 g9y85Fo5J8P+AXbPqPcGqqxshE6dhB2eDtemznp6AgVXmEoMtYbGX92dCHYYgxLvJnwaQ
	 cjVGvgAGUYm3tZuRB0xLYqNlnEkyx/4Xa/JUNMnNwsfymxZsNG0MHtlN+1H1+qeDdBuGq
	 4zZ+jthmWONDYEsSpgGsI2tCdY3Ru77lZKfK8SgPxRbasJl68zhXyz9xw5Lc87/KwOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358843;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0dxLnqnKHk7JrwJj1lgccrPmrlsj56UqJLmrfHHcnT0=;
	b=ViAWBjQ6cYVHlQTSV0LDRqE2tnbJQ5Kh9Yzuz7x+E//i5Ev5OxKfwOKv663LFsEnZYqw
	 yQyUsXc9RI6o6ot+FoTRhOubzbMevV0D6zVkT3ngZRjADVt8Lrz7QmbTef+p5siteFtvf
	 7COhgeq1o3vofS23vBK+QDdvTAuhPXv1/YzRvqXaEUOdDP24po/6rQJn585OSwWt8O/Ni
	 XGlVNcFfCAFbgRD80uQ9im7E2hSlBpKKVwyIDxcACwjk7Mjd/JTpjX3LHd0idqmRblNVq
	 n9q++GrdSnqO3nFyk9kFjXtCAhiOB0jeb/GP/JtRfWCwCjyc1bXDM+MfrkkyDpCqptg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=z6nUozFi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A26606A31A;
	Fri, 30 Oct 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=z6nUozFi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F3D1F000C1;
	Fri, 30 Oct 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793358842;
	bh=0dxLnqnKHk7JrwJj1lgccrPmrlsj56UqJLmrfHHcnT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=z6nUozFi30L3ho7OJ1Zk0ppl37/A2DCvJ9ZRsLf3nc6kO9PJnKFydNTwGlrYyPO3V
	 XOWrbUxUzSfe4RQRgrWkYwrYGf+stBciqpIN/fvleM9Lm7Ntd8MTglMoNeK5jIu6S3
	 4zOxUJwR9W8+u9tfVjCaDVzLKmsug6fwwrifFIis=
Date: Fri, 30 Oct 2026 12:13:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: amine-ayaou@hotmail.com
Cc: nkapron@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: legacy: ether: fix RNDIS for Windows hosts
Message-ID: <2026103022-skeptic-deskbound-3471@gregkh>
References: <MRVP191MB2786AD66C3EAB9F32E5B84F9EF6D2@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM>
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
In-Reply-To: <MRVP191MB2786AD66C3EAB9F32E5B84F9EF6D2@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM>

On Fri, Oct 30, 2026 at 10:17:06AM +0100, amine-ayaou@hotmail.com wrote:
> From: Amine Ayaou <amine-ayaou@hotmail.com>
> 
> Fix RNDIS for Windows hosts by adding Microsoft OS 1.0
> descriptor that allows Windows to identify the RNDIS function.

No, please no.

RNDIS should NEVER be used, it's not required by any shipping OS that I
know of these days, do you?

Why do you want this?  And are you really still using the "legacy" USB
gadget drivers?  If so, why?  What is preventing you from using the
"new" ones?

I ask as we are about to delete these legacy drivers and I don't want to
have anyone add new features to them.

> g_ether currently advertises its RNDIS configuration using
> the legacy NetChip VID/PID and the RNDIS control interface
> class, subclass and protocol values provided by f_rndis
> (02/02/FF).
> 
> While the Linux rndis_host driver still recognizes the legacy
> 02/02/FF RNDIS interface descriptors, modern Windows hosts
> do not bind the RNDIS driver to g_ether.

modern Windows hosts know that rndis is a lame protocol and should never
be used :)

Seriously, it's a broken one, there is no security for it and it's only
good for very very old desktop systems that never were updated to a
modern operating system.  And even then I would argue it shouldn't be
used.

> Notes:
>     g_ether's RNDIS is useful when a network interface via USB
>     is needed early during boot, before a filesystem is available
>     (e.g., nfsroot).

useful for which side?  What can you do with this "during boot"?  And
you are connecting to a nfs windows server with it?

>     Alternatives for having a network interface via USB during
>     boot are configfs and g_ncm.

YEs.

>     Configuring the gadget through configfs requires userspace,
>     which is unavailable before mounting the NFS root when
>     no initramfs is used.

Then use an initramfs :)

>     NCM (g_ncm) is not an option on hosts that only provide
>     RNDIS support.

What hosts exactly are that?  And why would you connect to them?

>     Tested on BeagleBone Black with a Windows 11 host
>     (Version 10.0.26200, Build 26200)
>     RNDIS automatically bound with the patch.

And did your nfs server on that host work properly?

Sorry for the rant, but I really want to delete this stuff as it should
never be used anymore...

thanks,

greg k-h
