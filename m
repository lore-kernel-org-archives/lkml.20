Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B201E413789;
	Thu,  3 Sep 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431097; cv=none; b=Vr26Y8qPzVOJ7W7O3ifioFz8cji1O6nerfYJ7ShxBly6D8y33KT3zZF2xW6HDGdBhcmEtSP5GF7sCO+Vq/PBLCJI02efYEJcmY7+kh5YO7xJ6/E0eimk8ZTbn5y2HU30Dnc0uFgcahvr7d5s3+TwDAX9FIsaGMmafH0HgsvEcAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431097; c=relaxed/simple;
	bh=LHFRkKSUyRypbEzGD3KKH1HJBqcfUrjD/NoAiieS0YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKTWIdCLKtc/4gEMqjUjTAGjPY/gsPOKA0CAPof8ga8QuUA2WRCRGeQIBjrdtKU2KP/13zrqgPIHUh9c54n9v89WQW0IRQyOSTWSPudOtfr8v5EcE0ZKIiyrJK/+LibKgK8nc6L6ofjwRtFJT9Wj6agGzDVCmY0ZfXtR42DRVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/6UGafh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/6UGafh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442941F00A3A;
	Thu,  3 Sep 2026 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788431091;
	bh=uKSC3WH3tRk3/QVmtaHUrsq3OcUMiXqgCVYTZfItvgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j/6UGafhFLze3IF39HuhR0yLS/+YgvqAKIoCsEwLjVroDwn//4ne75x3ukL9/wXzC
	 UPPZF02rZPdUhzIg0UsHtCe7wLvMx1mOZlSs5V+MjFQ7SOYX5LqLX/oI9h+Pp5uW03
	 toXhB8bO9hywagV4ijxSI8bdZJTMXEewuqNdpTEXjmfS8WRCM0WeogHh5YMXrVoVkf
	 XEM6Gel2kvZpreFSobtDvdgBh/rqRgEp0/rMX/76e40JuOjJ9XvuwPwge2HMmgD09T
	 6uNUSP+L0t8SIkpN4bO3WFjBAQbz1Yewr4Ef+S2NY3esQbiQetpPVDTJNQXeQSbpN1
	 wNJp55Y0Uz3Ug==
Date: Thu, 3 Sep 2026 11:24:47 +0100
From: Lee Jones <lee@kernel.org>
To: a0282524688@gmail.com
Cc: Ming Yu <tmyu0@nuvoton.com>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v7 04/10] mfd: nct6694: Rename driver to nct6694-usb and
 update Kconfig
Message-ID: <20260903102447.GL2133376@google.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-5-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821033505.4017901-5-a0282524688@gmail.com>

On Fri, 21 Aug 2026, a0282524688@gmail.com wrote:

> From: Ming Yu <a0282524688@gmail.com>
> 
> Rename nct6694.c to nct6694-usb.c to accurately reflect that it
> implements the USB transport backend.
> 
> Additionally, introduce a new MFD_NCT6694_USB Kconfig option and convert
> the existing MFD_NCT6694 into a hidden core symbol. The core symbol is
> now automatically selected by the transport drivers.
> 
> This Kconfig and naming restructure aligns with standard MFD transport
> abstraction practices, paving the way for future interfaces (e.g., HIF)
> to be seamlessly integrated.
> 
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
> Changes in v7:

No changes or you forgot to populate it?

> Changes in v6:

> - Split from the monolithic v4 patch to follow the single logical change
>   principle.
> 
>  MAINTAINERS                              |  2 +-
>  drivers/mfd/Kconfig                      | 31 ++++++++++++++++--------
>  drivers/mfd/Makefile                     |  2 +-
>  drivers/mfd/{nct6694.c => nct6694-usb.c} |  0
>  4 files changed, 23 insertions(+), 12 deletions(-)
>  rename drivers/mfd/{nct6694.c => nct6694-usb.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 040df7bfb24f..89d7339f3613 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19356,7 +19356,7 @@ S:	Supported
>  F:	drivers/gpio/gpio-nct6694.c
>  F:	drivers/hwmon/nct6694-hwmon.c
>  F:	drivers/i2c/busses/i2c-nct6694.c
> -F:	drivers/mfd/nct6694.c
> +F:	drivers/mfd/nct6694-usb.c
>  F:	drivers/net/can/usb/nct6694_canfd.c
>  F:	drivers/rtc/rtc-nct6694.c
>  F:	drivers/watchdog/nct6694_wdt.c
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782..5506a0adf3ec 100644
> --- "a/drivers/mfd/Kconfig"
> +++ "b/drivers/mfd/Kconfig"
> @@ -1164,19 +1164,30 @@ config MFD_MENF21BMC
>  	  will be called menf21bmc.
>  
>  config MFD_NCT6694

So what does this do now?

Will there be another core symbol soon?

> -	tristate "Nuvoton NCT6694 support"
> +	tristate
>  	select MFD_CORE
> +	help
> +	  Core MFD support for the Nuvoton NCT6694 peripheral expander.
> +	  This provides the common APIs and shared structures used by all
> +	  interfaces (USB, HIF) to access the NCT6694 hardware features
> +	  such as GPIO, I2C, CAN-FD, Watchdog, ADC, PWM, and RTC.
> +
> +	  It is selected automatically by the transport interface drivers.
> +
> +config MFD_NCT6694_USB
> +	tristate "Nuvoton NCT6694 USB interface support"
> +	select MFD_NCT6694
>  	depends on USB
>  	help
> -	  This enables support for the Nuvoton USB device NCT6694, which shares
> -	  peripherals.
> -	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> -	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> -	  PWM, and RTC.
> -	  This driver provides core APIs to access the NCT6694 hardware
> -	  monitoring and control features.
> -	  Additional drivers must be enabled to utilize the specific
> -	  functionalities of the device.
> +	  This enables support for the Nuvoton NCT6694 peripheral expander
> +	  connected via the USB interface.
> +
> +	  The transport driver uses USB bulk and interrupt transfers to
> +	  communicate with the NCT6694 firmware. Enable this option if you
> +	  are using the NCT6694 via a USB connection.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called nct6694-usb.
>  
>  config MFD_OCELOT
>  	tristate "Microsemi Ocelot External Control Support"
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index dd4bb7e77c33..48caac64f3d8 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -124,7 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
>  
> -obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> +obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
>  
>  obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
>  
> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694-usb.c
> similarity index 100%
> rename from drivers/mfd/nct6694.c
> rename to drivers/mfd/nct6694-usb.c
> -- 
> 2.34.1
> 

-- 
Lee Jones
