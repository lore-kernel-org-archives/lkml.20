Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8844A3852;
	Wed, 30 Sep 2026 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765392; cv=none; b=nJkDsaVIILDISg0m8YwQYw8N4piLJjAQV2NHYvVCEt2tNCsj44/1hVtD/b4qRidFZlrY2KaptQSY+Vfky3JZtgeoBNPz8OREz6qtMmt0/Sye7F2XPCCCzCDBYQ8SSgs1Bc7ORbm72Fr5dooiG6jtpsIrEq3fG2OyWeItiWy8kv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765392; c=relaxed/simple;
	bh=Jz0/8ZHw/kkdqwFZK0OizVEpGXP+LoJhxCfXO4qOcSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuXQgiBjfk20ASuCmyR10V/ohcXGtsj28mowAYv5nqPbzx39zeiBqQa2z8Ee+TjqR4pcavhKsUw3xEioHlCsh+8HDSLdX6Glt6iDDX19KBOrCet1aI8u0mD6GxkfWrT+n8Nq48DJ6rZyd/6gBguDLL75vf5YUJDqVoWcbtK1A8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RkMfxicT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RkMfxicT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B331F000FF;
	Wed, 30 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790765384;
	bh=LknKOLWSgRmkchGwYCTBmhEW31ADjKPwu2ueY29P57A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RkMfxicTF4kBdg7duvlizPLIh9Xd4nbijZ3ZrNO7dzc2/juzCuTNFstEpgHZwNRz/
	 eCAwumNvu1mZNHfd4mwKaCu/XP2W3ZsVtrevVthlJMDTwfJ1hN1C1k0AXcRfQZt7tQ
	 WVz4DIUrLBeA73nYL4LOc3LgLwwi1APlpJswVYwE=
Date: Wed, 30 Sep 2026 12:49:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Pieters <davidpieters1978@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: quirks: add USB_QUIRK_NO_LPM for ELECOM DEFT Pro
 TrackBall
Message-ID: <2026093012-paralyze-amniotic-65b8@gregkh>
References: <CAJ3h-bO00mynmttgf3UxVtqM=S8Q=Tf56Ts8SEqmPEM9dc4czg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ3h-bO00mynmttgf3UxVtqM=S8Q=Tf56Ts8SEqmPEM9dc4czg@mail.gmail.com>

On Wed, Sep 30, 2026 at 02:40:34AM -0700, David Pieters wrote:
> The 2.4GHz wireless USB receiver of the ELECOM DEFT Pro TrackBall
> (056e:0132) and its wired counterpart (056e:0131) fail to handle USB
> Link Power Management (LPM / USB 2.0 L1 sleep states) during initial
> enumeration on modern USB host controllers. When LPM negotiation occurs
> at boot, the device stalls and fails to register any input events until
> it is physically unplugged and replugged.
> 
> Applying USB_QUIRK_NO_LPM prevents LPM negotiation and allows the device
> to initialize properly at system boot.
> 
> Signed-off-by: David Pieters <davidpieters1978@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 1234567..89abcdef 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -350,6 +350,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* Corsair Strafe RGB */
>  	{ USB_DEVICE(0x1b1c, 0x1b20), .driver_info = USB_QUIRK_DELAY_INIT },
> 
> +	/* ELECOM DEFT Pro TrackBall (fails on USB Link Power Management) */
> +	{ USB_DEVICE(0x056e, 0x0131), .driver_info = USB_QUIRK_NO_LPM },
> +	{ USB_DEVICE(0x056e, 0x0132), .driver_info = USB_QUIRK_NO_LPM },

Shouldn't this be in sorted order?

And isn't this a v2 patch?

thanks,

greg k-h
