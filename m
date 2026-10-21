Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601768;
	b=ViYT22JqpKC2GMBFbD+bnZRIJWpP/LMjJDVz8EVyHLMNgm4rWC84OjsfUEQwJVCfqe9M
	 ccmNG0x66E1P9XJJ6bFthhdGt6rPz+otWZVINfGFsQNv+cU6etGPvCEVpZl7v7lcK6uIp
	 TZVvEK7TimbWvdMxd+RKocg72nhotI0dOMjQSQWmtJgu7BHlmI6RhHrgMtrla2Av0LWOp
	 IkKYgHvPKm2nSKxo6UzqfgJgUE9YpfteXbBKB9T3IPXReoTZd+0N2LGNxOuyULq2Ymi8F
	 mDALZDf37L6WPrDwkry6xbdLEMK17MF81AfLWByMYNf9K0wy4QU6kPGaQ80jmrlVD1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BqFxca6gK6ThfbYRhXakalZoTDjV2OaXfqMDjTk93C4=;
	b=0zF0OjcHwRTpGASy0RVTGXr8jJ0KVXlg3vJN7KAR4KDObfof1TSzEiVOM1MnzqMwZO4G
	 y/gXKihwr9G7HGO/ANzP4YJr1+1erN+AIQ8M2ERVRlnbxh1nruB0iVc3T+IbK/Bm96Zf1
	 /eNI2tolJS390VcGqxCJ6XA70xARI+m4hd+z9clW1UEKrKVNVMatrvd0tg7dKKIqaHHNv
	 qWd7FI5PkHilEjCUo6Pm5nE9wDLMkHWfQQnR2OQs5U2lUqrgMUTBF//NY0Y7sARyCJroi
	 Jj0Lk5KpZpymWTzghyb2GoKjy7fX8LvWCTFP73PfI7AwT6PmMzkbs2m83ICeSWGXBZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b47HAwz/";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB260A3804
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68EB260A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b47HAwz/
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so2318528eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601767; x=1793206567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BqFxca6gK6ThfbYRhXakalZoTDjV2OaXfqMDjTk93C4=;
        b=b47HAwz/VVcj8i8Dk6rywlLjp4QPLVE9QU/sIDpiX4l5uicFU6+OyIDhEv6/jeqZc3
         gDnlsX41vd9jS8QBqF5eWd0LEL7ObgKGc+mFe1J17hRYjevyusHa4RG6Bou9yDFMB+7H
         1ZX2qmpzbQuFCAWRa4FS1QfTA4DnlBvO1ZgiAtM3Z5SowmDDqNG29VsiLXZc/XgUQ5O+
         iAp/OmcJB+abmkYlNO2Nkk26Eh1FNrHWcRmxaaCR3H2KFKajAHxrDVISqotylsi7Xs3W
         PysGqH5xjgqIys5FyNfXPc0mTOYqh01SIjH96t/1KQEVQMDj4hztLVadfGy6lOdAAt1j
         XNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601767; x=1793206567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqFxca6gK6ThfbYRhXakalZoTDjV2OaXfqMDjTk93C4=;
        b=YTrAlnO6AfiCp3OYzEC62OIZ3xQPGi+Ob6gXH29NGxxHCsQFPBk4Gymx4nIuOglkKF
         psIkVzFp3CF1V3ViRU23gqpnBpvkSf1D1h/pVfG43cMdlaNlcAtFV5le99Nvd/sNdCCO
         zrtY5O+OkNySLcSJSz+O32jWTAep38BsBr/E0V9q45K6pJQtXbXqFnpRFMlwjPTXPiEv
         vcLaOz9twEVzByOBwqzztPVWFgq5C6R7XuW4RCrVDqHxojOIUkzY16m7TKfGYxkUWutw
         3QJ2tRuN0eJ+6a3O1QIs8aZDyJDomfY+jkIr+Xyd27VVMWYVbXpwF35w2ORxTS32YOQE
         hdJg==
X-Forwarded-Encrypted: i=1; AKwUvBzdEbykA2w+H/oYgzmsPPmc3jYmnYtMqfRZ5fpW6pByRbXSE1G54vbFDGnqUniVXpYC21e4ZyCnlB8rJT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsg/GvP6utSHuHfRXGbtdeTW0FpTGe6JUfIOlf8mUXXi4zAAjX
	ITRiQU3ULwATcvjHB3MIKqGjMZZ5WTT3AOLF6cGHN64DBRHhmo36yZ9F5oc8xw==
X-Gm-Gg: AYBFou13e7+s20OqQZurzfdxm7eaBYh1IZz76V7LjMDEzr6vh0TLoH9bJSrcjwO1gC9
	WTpPe/Lq1M57HgEQUhOLgeRUcDU2hPKrTAQVG3VtEWI8yZ6XgxcZmn24maXuljN2cgj9n3ljp2V
	YFXvqqMhYgr9oT5LFarPVi6H3OG13ErokhgVgoQk4HjjwOi99l29xlO1v4B9M7eED/xStJ4nUYm
	NWOX7FySaroT1SXXXaPlzPh/6tHTZgHfqfRcZn99atFmrh5VVbk/Z5ph9M8yNVMJIcAk4x330Hg
	tVV0iGbxLEVbAcyiBJtzpjjxZzz6g+Gy2syZWtXgk/1cZ1Bitkx8WKxGYhMle0erXx/2gH5+UC3
	3RLO9HpHg0WR42UGFPeYpHkvNO5QUTH8cYry2wG2SwTupXiHvj8K98vauLhontGFaC2E+WaYqQn
	jvX/MRiG0ZmARLWDejT4IwOxKW6Cxi4mJsRAxAD5TsZSwk+XTwowYiHptLUOwrBhSjNO8CtrBpw
	ga2ysxyGY/dZ6eJO16UBdtqxCAcjo9//nvOJcn1jK8BBWdAQP7aPe219V85n4pMnU6UqPkVcFCb
	0NRH5zRvcB7MMXYlG1TlOA==
X-Received: by 2002:a05:7022:1709:b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-190a051ddf3mr2928490c88.3.1792601767120;
        Wed, 21 Oct 2026 09:56:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm7935669c88.11.2026.10.21.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:56:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:56:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 3/3] Input: soc_button_array - convert to software nodes
Message-ID: <atjuDNi0_SXs4y2d@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-3-dmitry.torokhov@gmail.com>
 <CAMRc=MfZg36BULXh3n-ce_x_4B_xOn3Jp4Jgo5BN1LsB2FqaTw@mail.gmail.com>
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
In-Reply-To: <CAMRc=MfZg36BULXh3n-ce_x_4B_xOn3Jp4Jgo5BN1LsB2FqaTw@mail.gmail.com>

On Wed, Oct 21, 2026 at 05:11:32AM -0500, Bartosz Golaszewski wrote:
> On Wed, 21 Oct 2026 03:50:01 +0200, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > Convert the driver from using legacy platform data to using software
> > nodes for registering 'gpio-keys' devices. This allows us to
> > transition away from platform data and use generic device properties.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/misc/Kconfig            |   1 -
> >  drivers/input/misc/soc_button_array.c | 134 ++++++++++++++++++--------
> >  2 files changed, 92 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> > index 169768e3d5bb..a2984c1048f3 100644
> > --- a/drivers/input/misc/Kconfig
> > +++ b/drivers/input/misc/Kconfig
> > @@ -906,7 +906,6 @@ config INPUT_SOC_BUTTON_ARRAY
> >  	depends on KEYBOARD_GPIO && ACPI
> >  	depends on X86
> >  	depends on GPIOLIB
> > -	select GPIOLIB_LEGACY
> >  	help
> >  	  Say Y here if you have a SoC-based tablet that originally runs
> >  	  Windows 8 or a Microsoft Surface Book 2, Pro 5, Laptop 1 or later.
> > diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
> > index 8d782ef4f78b..aa7838b864c2 100644
> > --- a/drivers/input/misc/soc_button_array.c
> > +++ b/drivers/input/misc/soc_button_array.c
> > @@ -14,9 +14,11 @@
> >  #include <linux/acpi.h>
> >  #include <linux/dmi.h>
> >  #include <linux/gpio/consumer.h>
> > -#include <linux/gpio_keys.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/machine.h>
> >  #include <linux/platform_data/x86/soc.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >
> >  static bool use_low_level_irq;
> > @@ -59,10 +61,10 @@ struct soc_button_data {
> >   * gets called with the lid open (e.g. on boot and on resume), it sets the
> >   * irq-type to IRQ_TYPE_LEVEL_LOW. Where as the gpio-keys driver programs the
> >   * type to, and expects it to be, IRQ_TYPE_EDGE_BOTH.
> > - * To work around this we don't set gpio_keys_button.gpio on these 2-in-1s,
> > + * To work around this we don't set "gpios" property on these 2-in-1s,
> >   * instead we get the irq for the GPIO ourselves, configure it as
> >   * IRQ_TYPE_LEVEL_LOW (to match how the _LID AML code configures it) and pass
> > - * the irq in gpio_keys_button.irq. Below is a list of affected devices.
> > + * the irq as a device resource. Below is a list of affected devices.
> >   */
> >  static const struct dmi_system_id dmi_use_low_level_irq[] = {
> >  	{
> > @@ -131,18 +133,31 @@ static const struct dmi_system_id dmi_invalid_acpi_index[] = {
> >  };
> >
> >  /*
> > - * Get the Nth GPIO number from the ACPI object.
> > + * Get the Nth GPIO information from the ACPI object.
> >   */
> >  static int soc_button_lookup_gpio(struct device *dev, int acpi_index,
> > -				  int *gpio_ret, int *irq_ret)
> > +				  bool active_low,
> > +				  struct software_node_ref_args *gpio_ref,
> > +				  int *irq_ret)
> >  {
> > +	struct gpio_device *gdev;
> > +	struct fwnode_handle *fwnode;
> >  	struct gpio_desc *desc;
> >
> >  	desc = gpiod_get_index(dev, NULL, acpi_index, GPIOD_ASIS);
> >  	if (IS_ERR(desc))
> >  		return PTR_ERR(desc);
> 
> This GPIO is requested for a short time and then released. Do we run into
> a risk of the actual target user requesting this pin at the same time and
> failing? We don't support shared GPIO pins for ACPI yet (though I want to
> add that eventually).
> 
> I know this has always been like this but I'm wondering how it works exactly.

The soc_button_array driver controls instantiation of devices that
consume these GPIOs, so there is no concern of them being consumed too
early.

> 
> >
> > -	*gpio_ret = desc_to_gpio(desc);
> > +	gdev = gpiod_to_gpio_device(desc);
> > +	fwnode = dev_fwnode(gpio_device_to_device(gdev));
> > +	if (!fwnode) {
> > +		gpiod_put(desc);
> > +		return -ENODEV;
> > +	}
> > +
> > +	*gpio_ref = SOFTWARE_NODE_REFERENCE(fwnode, gpiod_hwgpio(desc),
> > +					    active_low ? GPIO_ACTIVE_LOW :
> > +							 GPIO_ACTIVE_HIGH);
> 
> Sigh... I hate it and it looks hacky but I also don't have a better idea. :(

Thanks, that is quite common reaction to the code I write ;)

-- 
Dmitry
