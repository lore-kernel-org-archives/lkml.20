Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832152;
	b=sgZA0XkrzWnJ6G3wyMeu6mN8OzfYbTEdjUuLSgm+mBcvehG30kkq3Ah/c4n+q0PbKqDr
	 wuAFKpgbwYj+cimi/fy6MI8wKPR76CX5Hplj45XcBDlq3zw7jIkIrxMBQGRmS4lUNGWmh
	 6HHdrxY905l7KyhZeAbheq4w5Om5+8n0QNEiriZ6IXW3x576fc2Hg8XObov89/kKmpK3U
	 RefILRKCzfW48am82HGOJRkyCXfD5iQOdxsPVheWAcGndpxmQZF3F5GPUS5R6cyOCJe7H
	 kQBGJzFHCicHyO9Bg0Fm5BVY+44g4EfNkqKdZY1Y4nWViT+qLcZID5gXD5Jfuxr9DPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832152;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wpWkwmVFLtWokZAX7hCdhUBC4VjT9NDRGRupPUibasU=;
	b=gtwBftZFKdOqDsi3p5NoemsTtskGMoBV38zMWBNQq9mmwjuC+XTiATlYIkVD9Wyv2X7s
	 OthDPu0caR7Zm3vwVcHigLmvekW2LmXjcGT6QiLmfHiWzsKApKt/qManMHDTbNsenTur7
	 2YSW89zy2EUJvsTUpSetN21WXKh/HmSZ9TpSyfjHV4RnX+MxP8owq6dIfBy4ek2jLTkrr
	 smiFhWxsi+QkpYk0UKw8+Izyn/LhH3pLnWt7iNpBLX1I/IL+Py1WhpyiPe5z6AdF6gWkA
	 BY+Tys966OnrAGy5OQMcU8eEfOiWUst2gahKJxRcXBx2qX3YtxbfObAkLpjXRC7jloA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="dR5N/aMC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B5606A31B;
	Wed,  4 Nov 2026 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dR5N/aMC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39B11F000C1;
	Wed,  4 Nov 2026 22:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793832151;
	bh=wpWkwmVFLtWokZAX7hCdhUBC4VjT9NDRGRupPUibasU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dR5N/aMCqO28kHbE7meCsnmz5lRYUVFofuQvRV2dyA1Sgkq5SMGf6DajH9kqZLuVJ
	 t5iBuAsZl/i2JSPr9DyozcQkOJzKN1m8LbiR6YmkEAAnHo20teYLbec7iP5GRKXBEi
	 tZIea4nkgnpHSHd672SyxXqFuX5EMWMHNsKXztMk=
Date: Wed, 4 Nov 2026 17:36:07 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adam Simonelli <adamsimonelli@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: visor add vendor/device IDs for PalmSource devices
 from the PalmUSBD.inf file in Palm Desktop 6.2
Message-ID: <2026110443-gore-briar-2fa1@gregkh>
References: <Wihw1vdISi-GVjWnM45KnA@gmail.com>
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
In-Reply-To: <Wihw1vdISi-GVjWnM45KnA@gmail.com>

On Wed, Nov 04, 2026 at 05:10:46PM -0500, Adam Simonelli wrote:
> >From fed0bc0868dd1e0dfe98ec84fcd7c1208cb076c3 Mon Sep 17 00:00:00 2001 
> From: Adam Simonelli <adamsimonelli@gmail.com> 
> Date: Wed, 4 Nov 2026 16:56:50 -0500 
> Subject: [PATCH] USB: visor add vendor/device IDs for PalmSource devices from 
> the PalmUSBD.inf file in Palm Desktop 6.2 
> --- 
> drivers/usb/serial/visor.c | 6 ++++++ 
> drivers/usb/serial/visor.h | 4 ++++ 
> 2 files changed, 10 insertions(+) 
> diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c 
> index 5706c46c49c2..5a289c566ba6 100644 
> --- a/drivers/usb/serial/visor.c 
> +++ b/drivers/usb/serial/visor.c 
> @@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = { 
>                .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
>        { USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID), 
>                .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
> +       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID), 
> +               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
> +       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID), 
> +               .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
>        { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID), 
>                .driver_info = (kernel_ulong_t)&palm_os_4_probe }, 
>        { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID), 
> @@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = { 
>        { USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) }, 
>        { USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) }, 
>        { USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) }, 
> +       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_1_ID) }, 
> +       { USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICES_2_ID) }, 
>        { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) }, 
>        { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) }, 
>        { USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) }, 
> diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h 
> index 622d639ce74e..0f86bd06c4fe 100644 
> --- a/drivers/usb/serial/visor.h 
> +++ b/drivers/usb/serial/visor.h 
> @@ -32,6 +32,10 @@ 
> #define PALM_ZIRE_ID                   0x0070 
> #define PALM_M100_ID                   0x0080 
>  
> +#define PALMSOURCE_VENDOR_ID           0x13e8 
> +#define PALMSOURCE_DEVICE_1_ID         0x0600 
> +#define PALMSOURCE_DEVICE_2_ID         0xff00 
> + 
> #define GSPDA_VENDOR_ID                0x115e 
> #define GSPDA_XPLORE_M68_ID            0xf100 
>  
> --  
> 2.55.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
