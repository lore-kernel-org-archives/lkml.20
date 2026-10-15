Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B350B48665F;
	Thu, 15 Oct 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058006; cv=none; b=i/aQJcPIFrgpC0vJYgLcHidcWTTECfwGPgn/xEURy+6zTX3FfAidDwx7G2LqXBdRsiLNnXTGCEPkpVT41S0YtLKRa/kICoQBKyq86IvdhavSGMlnJ0Nojufz8x5wx6ef4plTmCQWcU7WWLxAlmNW+TrHLyJL+LTRopJc+QTHje8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058006; c=relaxed/simple;
	bh=pwEm4/2RBhku51g18W4c5ncfp9iaO/+W3jklu4v+Va8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHnBzys5E4IWZ8QEVoKesyQ/xEQQSKcTUKMw/NLw0S/srUSBLOZpUL9YRoyos3oRJNYIA/x8NWn8OLu6VRdSlwvZrPwJ/b7Pyg/+KyDrNOqmnxTY98Hu1ZcjaUBKzycXk8Xwuzr5+fMf3EapwMsfJZ16rufv0orp6TecpdEytDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfSjs0NV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfSjs0NV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439281F000C4;
	Thu, 15 Oct 2026 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058004;
	bh=pWSv0HLiAJoTWLt7uJPRQqYR8RlGcCvdzB2n4hsLLBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lfSjs0NVa2Q7Yoce0HBjO6gAq4xiMOnf48jazkWzuNHu9mMe451E88M/arH5Jf5ZT
	 EBiLaH31kt4glfCU96mV+sdGqiYwFU+FoR+YVVcdoHCTzcOu6uKuVdaAEQMmXLd3BM
	 wUA/4VtkCA8pm7unwTtXb4NedmPqxs6bTVA9n8SGjV6H6GlBGHbWUPYpFu/L7hPIZh
	 j8DwNvXcq2TSgmdSOwKXC1PyC2XA6TdTn3DKC3gh83HxOD3rzRrB5TCrfFJbno9MFt
	 4thOVS3Dp3ETLiKJm2JJYyWKPm3o4/RjhiJirzG/eYY2kMmuKr0F/kPbZDziOJmT29
	 Dytk8Ghkv3WCA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xHI9K-00000006EBG-0xAz;
	Thu, 15 Oct 2026 11:53:22 +0200
Date: Thu, 15 Oct 2026 11:53:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] USB: serial: add generic write control callbacks
Message-ID: <atCikmW89iycQzTp@hovoldconsulting.com>
References: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
 <20260811060501.2307836-5-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811060501.2307836-5-crescentcy.hsieh@moxa.com>

On Tue, Aug 11, 2026 at 02:04:59PM +0800, Crescent Hsieh wrote:
> Some USB serial devices use device-specific flow control to determine
> whether write submission may proceed. The generic write path currently
> provides no way to pause submission based on driver-specific state. It
> also provides no way for a driver to restore its state if URB submission
> fails.
> 
> Add an optional write_ready() callback to struct usb_serial_driver. Call
> it with port->lock held after confirming that data is queued and a write
> URB is available. If the callback returns false, stop write processing
> and leave the data in the FIFO. The driver must call
> usb_serial_generic_write_start() when writes may proceed again.
> 
> Add an optional write_rollback() callback for restoring driver-specific
> state after usb_submit_urb() fails. Call it with port->lock held after
> restoring the generic transmit accounting, and pass it the length of the
> prepared transfer.
> 
> Drivers which do not provide these callbacks retain the existing generic
> write behaviour.
> 
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>

> @@ -171,9 +173,7 @@ int usb_serial_generic_write_start(struct usb_serial_port *port,
>  	spin_unlock_irqrestore(&port->lock, flags);
>  
>  	urb = port->write_urbs[i];
> -	count = port->serial->type->prepare_write_buffer(port,
> -						urb->transfer_buffer,
> -						port->bulk_out_size);
> +	count = type->prepare_write_buffer(port, urb->transfer_buffer, port->bulk_out_size);

I kept the last line break here to keep the line under 80 chars.

> @@ -436,4 +444,3 @@ module_exit(usb_serial_module_exit);
>  	usb_serial_module_driver(KBUILD_MODNAME, __serial_drivers, __ids)
>  
>  #endif /* __LINUX_USB_SERIAL_H */
> -

And dropped this unrelated change.

Johan
