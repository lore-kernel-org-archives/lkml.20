Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052613;
	b=Q+g2dZNtoJVFVFxUy5btYQuGrSBU+7Sbew1xu3GGiTunDMt5MAKsGna8Z+B6lg5fxrtu
	 myZqcsGCdErYgD7ZFdHY7Rka5U4AD5Cw04Yh+csg63mwdgoi4AiK4bp6wMWLpOt0Lp6Mj
	 vC+LeNQn4y3vnARavaRBDciREqEQOF0cOoDGaq1NXwLgFZjJjS80JjNtcIQFH7im0y4Fr
	 FL28tNVMW1hEkraaYIMgADKVH9vwUdfLNuc1Lvq5j1co61r77quIR95XIlEGH0P+Es9NR
	 oQv/wSnHG4BtbHb7xwnthjRK56I4lWuur5U6X9oYtnuktxB4IU9DdGhH8MfkmeWGL0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052613;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UOg2Mle0JED6ygtBQsjN7jI6KmcP34Y/hwE5Npk6l7E=;
	b=WANmA/a3T16qiN/OBfdqHtH0fsubIxa/aZo2aUbWdBhtlUdL9yXbaObHqkyZ1wYZa+pl
	 QSFJGp/MdfNN4Fj3mVGBmzKpSZL6QRFf/sfH6ZB9gw1zqFhzRlseLmzoFEqOFsTh8yjuS
	 q+ZSpIbTgQ/1jvbeqZsArYqgtIbvaGxksAIhxKWKjqLjefzqzEu6H+iUVSFs5W5kn5SIy
	 LbpzlZ7Ns7WD9Uoiws7Cnvcpnj4r3gRH+oTxoOGjN88aX74jBRTyGTu7OwoDGL0K2OSmh
	 V6yCVZGdr3VdhMiqok3fhnSYOxcTu1OXsY9m17tbGexceO35rV6R9xlodKT4YoVk8+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZK22DQkc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB1606A326;
	Sat,  7 Nov 2026 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZK22DQkc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FE41F0089F;
	Sat,  7 Nov 2026 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794052612;
	bh=UOg2Mle0JED6ygtBQsjN7jI6KmcP34Y/hwE5Npk6l7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZK22DQkciAQav1sv4yN3DTkixk23XN5AEkolqRQIzxZ8TAitEm2U28t3G3JPSiIca
	 rkGZxBImtU9VMU3Mx3mDhrzwyJqu5AE0R7RMdcbsYi/aDDWxsdGOrRxqtJJauqEGMn
	 Oey5CyzwTdSvqc31kDHKWmZdPEJYbdPu+MSJBcUw=
Date: Sat, 7 Nov 2026 06:56:50 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Adam Simonelli <adamsimonelli@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: visor add vendor/device IDs for PalmSource
 devices from the PalmUSBD.inf file in Palm Desktop 6.2
Message-ID: <2026110738-gathering-disarm-491d@gregkh>
References: <20261106233301.3267777-2-adamsimonelli@gmail.com>
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
In-Reply-To: <20261106233301.3267777-2-adamsimonelli@gmail.com>

On Fri, Nov 06, 2026 at 06:33:02PM -0500, Adam Simonelli wrote:
> PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource
> devices. While PalmSource only developed the PalmOS, and never made
> actualy hardware, as it was Palm Inc. made the Palm hardware, there
> is a bootable ROM containing PalmOS 6.1 that can be booted into RAM
> on the Tungsten T3. When this ROM is running, when plugged in, the
> device will then present the PalmSource vendorid that is defined in
> the INI filem and the deviceid then becomes PALMSOURCE_DEVICES_1_ID
> the PALMSOURCE_DEVICES_2_ID is also defined for completeness.
> 
> Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>
> ---
>  drivers/usb/serial/visor.c | 6 ++++++
>  drivers/usb/serial/visor.h | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/serial/visor.c b/drivers/usb/serial/visor.c
> index 5706c46c49c2..18c586d552d7 100644
> --- a/drivers/usb/serial/visor.c
> +++ b/drivers/usb/serial/visor.c
> @@ -75,6 +75,10 @@ static const struct usb_device_id id_table[] = {
>  		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID),
>  		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID),
> +		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID),
> +		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID),
>  		.driver_info = (kernel_ulong_t)&palm_os_4_probe },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID),
> @@ -133,6 +137,8 @@ static const struct usb_device_id id_table_combined[] = {
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TREO_650) },
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_TUNGSTEN_Z_ID) },
>  	{ USB_DEVICE(PALM_VENDOR_ID, PALM_ZIRE_ID) },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_1_ID) },
> +	{ USB_DEVICE(PALMSOURCE_VENDOR_ID, PALMSOURCE_DEVICE_2_ID) },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_3_5_ID) },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_4_0_ID) },
>  	{ USB_DEVICE(SONY_VENDOR_ID, SONY_CLIE_S360_ID) },
> diff --git a/drivers/usb/serial/visor.h b/drivers/usb/serial/visor.h
> index 622d639ce74e..0f86bd06c4fe 100644
> --- a/drivers/usb/serial/visor.h
> +++ b/drivers/usb/serial/visor.h
> @@ -32,6 +32,10 @@
>  #define PALM_ZIRE_ID			0x0070
>  #define PALM_M100_ID			0x0080
>  
> +#define PALMSOURCE_VENDOR_ID		0x13e8
> +#define PALMSOURCE_DEVICE_1_ID		0x0600
> +#define PALMSOURCE_DEVICE_2_ID		0xff00
> +
>  #define GSPDA_VENDOR_ID		0x115e
>  #define GSPDA_XPLORE_M68_ID		0xf100
>  
> -- 
> 2.55.0
> 
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
