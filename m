Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898335;
	b=5eF7CgB+jQ00WBBP3OtIiC8Ts/QnXyl1ZllmXBcJCQWe5s/snoiNswyWILKCfWRfg4yD
	 OG9gZAkoezYZAmujzexLAhQVGOKSfV31vpsD5rb+XJdgNR4c2MnCe3y0l98qzjuHF8AKM
	 O8JVvrwEGo7cHDR3sUDqUqOjv8FQhtIDjZaIhVSF5HQ3LMJpWuAkxMl5FyQP08pnIyd60
	 SAiPow9N0nv4mx9EQwwWOc2M26SnBLvjL/M2e6Y1cpWrmjUQyUm/K55vu8O6MSq527KOi
	 mxWvnB9bcq8dBiFyC3auHdpn1EfmGC72dW//DY+OlILGA8ddBCA8LCfmnCkfZLgLeog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
	b=Ps1y1H17HPPk2Qc0fgAr35hd7jIohdRs/Nt4ruCl6/F15aVu7xhLD7UKIRWnZXqwoNY9
	 Yqo5tLGgX9e5Be/nhHD9tzurr73P425Rxx22ZSFdaKqdBF5KQjqrG8PiX+ypRCTX5J2g/
	 peo1zZ6LtFoIBouopBbwhW5E5uzqd1iPQfDKCuHD5O9ieflbDx7PCSakg38H0MQCgcDea
	 6+9LE0D+CB2uZtsjVIMUiyhSzTTLh7mxi8Muw3xkKQcCCzUcXqk7ADBBP3BpsCwuJL8Fa
	 HXMCqHa6mKI4fQSpga4+WKvI3HTP1SIZrk8GFxQZxddbcy/eW+QHOQsvATPg6diURzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezhGUhXo;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87043606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87043606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezhGUhXo
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36d6765756fso2607115eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898335; x=1794503135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
        b=ezhGUhXoIUl09y6+rx0VThMrADfNJzLtbjELvheIq2XUjEVn+F/n+Ri2C53TV9L6Aq
         JdGhkEmCnwmkPVTv0OB6x5RGwGBQJHUjt1KyKJv1eSBurgKo52RA3J8/QRIyxJZsDOQU
         n7s5HLJdofzUUsrlUP5HhN1OEHjO1pTWgNUtwsTp5+pkRYp1fI+C+uqlY+LxQRirvNrb
         Ex3MFhTRMHWMTtME2TIEuo7EsT/3ZplABIXud7NOWlPeo0lDAdVbld/IOwaCZ8vfz4uj
         z22wAGLVFJBUWinFMtheNWfoQbFjMbEjptQEjYgl4R/mPdYwQwSpcnETlWlj/Aj3CrCr
         m0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898335; x=1794503135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
        b=DA4hO/SieDsxsyYnCubaVfbUik/HtPOO59BUNmPhairkkCv4l5uMHodAyo9WStGq1Q
         pjO6ycU4aAfNA8TKqH+cHjfuGs+zrou4mSTU+xz0RkqTEPk78YZin21d0HrGmHQUwqov
         pWSNAs6QrQuRu2s3eatDmWdqyzrmXcdCqI9lofK0ygtD8AQhaYrgL59pNBbUDVrKgoxR
         5FO+Aoq9Hu95sQSHac9BQIeka7mUM+xR6OdnxXT16Z5Spa2cmSM8qm0ooDLrFHDOS5te
         ADmthvY4dD0w21OVgXSbw6KvwrHCpcDIG7QT4QH3rGvmDrOPI0k3pr3k7YXhvLGgQ1wr
         RKPg==
X-Forwarded-Encrypted: i=1; AKwUvBwz8+alg+YnAM+o0m0cVYuGVML3SqFw/YzNiM3SxRSiyJe1kWe9mOxfi1brkpZ5im7FIdwKfYrJV4O5Xoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3/Rv77Qn2oq0GGWNPflTq4lU+hGAYL9+4jVxopIBsJFmRUgyg
	8McLvC4I7TA+n4M0Qj/URRNRYt62v0YI0oS8yWbrMlZlmuksVq5Fjflc
X-Gm-Gg: AYBFou0suILpGzskJkYWTi0sbJqk7YZKQwfnARqNi6e+yXs+uwpD9+3uu9EUqfRLwU9
	/4sonKT46/1c9vLJM1PXLbLFfY2lNqibolfGH5XdyB26XSCqA6SHMAFBhSDms/+MYMVlcfq5Nuk
	y9bB1NZEYd+P+/La2cMg8WM6Wpyl3yKsvE8y3V2TFRkwqPNDdh8KtzbFV08wSZ1gtAOmo/k8YM+
	mO5KFOjpLjGLocw8dhuxiBVSgYJr7vdU1/KYezpbGS1UEz4dPIB3tML/72UaWOvA8Dv12mtj5iS
	rTjECtIW/H+nzzBHDw6fsnD5y2Eiop3rbwsaOd8LAc9rMuAdI+HSozpnTSL3ZoPXqrV7qRgWXyl
	7x6Ki332tdkNgRXlVIOi4G1l2aVlRmVLJbDsH1CHbYLb53GJgKVPsNHRyIUEHgHALecVEQKa7Ft
	Zfxz1tJkduWUvffQ7bSwfFuT8i1e7KJ30jywiniUbHw+5fD+6a94/ozN9QL+vEOvrGhbmFCZybT
	izsLAQpqSg3cTlb2rD4WtMiuaczIfrQ2QGOWr7xRwmHgVSxyPCLY7QNCPURBJxh2ft3YJcK8gKW
	RO+P/WV9TnJUrmWkyKayTT9eGTgCNcNc7pAevo4ukffjBZj2XmLUS/NvH2JdNOZ3LZFRHXTf0qU
	kFqVZp6F9kKSrVFI=
X-Received: by 2002:a05:7300:fa0d:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-36d7feb8e1amr5835338eec.11.1793898334471;
        Thu, 05 Nov 2026 09:05:34 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3989670sm23943795eec.25.2026.11.05.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:05:33 -0800 (PST)
Date: Thu, 5 Nov 2026 09:05:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 02/17] Input: serio - attach manual drivers through the
 driver core
Message-ID: <auy2plYVi723Qt42@google.com>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>
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
In-Reply-To: <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:15PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Manual serio binding connects a driver before driver core can admit the
> device. A rejected binding therefore arrives after functional setup.
> 
> Keep the port ID check and use device_driver_attach() for the existing bus
> probe path. Driver core then serializes admission and handles probe failure
> before publishing the binding.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/input/serio/serio.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> index 54dd26249b027..604440244c1ca 100644
> --- a/drivers/input/serio/serio.c
> +++ b/drivers/input/serio/serio.c
> @@ -81,28 +81,10 @@ static int serio_match_port(const struct serio_device_id *ids, struct serio *ser
>  
>  static int serio_bind_driver(struct serio *serio, struct serio_driver *drv)
>  {
> -	int error;
> -
> -	if (serio_match_port(drv->id_table, serio)) {
> -
> -		serio->dev.driver = &drv->driver;
> -		if (serio_connect_driver(serio, drv)) {
> -			serio->dev.driver = NULL;
> -			return -ENODEV;
> -		}
> +	if (!serio_match_port(drv->id_table, serio))
> +		return 0;
>  
> -		error = device_bind_driver(&serio->dev);
> -		if (error) {
> -			dev_warn(&serio->dev,
> -				 "device_bind_driver() failed for %s (%s) and %s, error: %d\n",
> -				 serio->phys, serio->name,
> -				 drv->description, error);
> -			serio_disconnect_driver(serio);
> -			serio->dev.driver = NULL;
> -			return error;
> -		}
> -	}
> -	return 0;
> +	return device_driver_attach(&drv->driver, &serio->dev);

I am not sure how safe it is, serio (and gameport) have pretty elaborate
structure and locking rules because they can recurse into themselves (to
support case of Synaptics touch-pads with pass-through PS/2 ports).

But this call is for user-initiated probing anyways, I am not sure if it
even needs "trust" handling.

... And I even thinking if we really need to keep these custom
attributes or if I can rip them out in the future ...

Thanks.

-- 
Dmitry
