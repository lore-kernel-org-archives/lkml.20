Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E953D0D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174800; cv=none; b=DIU0HDBiSIvM4L6yCrQBFZhjBM9A1GlsHIiq03WrxEaChBtlkZLc937x0WtcFE5clwZjfwzFeU5+Ix56OfcIzKbweuaqoZNEfoIX6t0Y9moVe7HEe5vmkt1sYFI9my5fb5kd39PM4C92/UCNYQzmbTWKty12LhwmB+0nhndo4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174800; c=relaxed/simple;
	bh=XwpjmJluvtoDZaA6MKdbJZybCqPcUBUalWYslDZI7Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6DWOaEupKZjclEc1CFdfqzlunjVXGDDqRVopiSAFDo9acRXUYBasiMHFtvLzURltOAbKVjNDyz71tS6jjpai/omxhQu33rQqq4y5ZEbk/drEpQ2A40OAAmoWkI5USVujpiuzF320yceIqt2plDgR4PSJkW6jrQzSkPrWveKM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDMDuTgT; arc=none smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDMDuTgT"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso794983a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174798; x=1790779598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j2hU/V/9OkaoLGgLOfMT38LPn29XKPRospCOIHDkyow=;
        b=CDMDuTgT1GXqI4KOrqwClYKloigjbiRyn2b2GK3xda6opT2Rxjof82hE4AYe/h/HM9
         GI/I0s5tobfm/3ppZWuMG9YfuYbeVYil8YWBkLoqel61OSyMPrBssuaQVehj3KNGFtjz
         v00FbcUsOBXMArCsvm/EkFviOGNJf0DxWa3O3oUYdWkoihdg2BsVpAmcQ3zw3/3U6t0H
         hm77D/JDni85lu9uMFOVHDBFqFFKzj3+bwIUayQEAmTGeiobA648sSJB9Ig/jUFrnBa+
         48JOujCwzCI9gR+DzhvsHAnolHBNR4IOWeQYBVqsokztM4ZwjfEoXGNiGWrCywpHMOd4
         bcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174798; x=1790779598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2hU/V/9OkaoLGgLOfMT38LPn29XKPRospCOIHDkyow=;
        b=gGSo2ggJDTjsWXpymPkb/wx+LYtsJdqz06j93YXATCYH3NuxxJWBnh7tK80XTH5ihU
         etRlnHa1jTpmnr2Gchl2cLY2J5xtP7sGVwlQ30tUX+uyjFTM2py/nKvhYau4/vpZ8ArR
         pB5DTvaZvK0THTmY1NM/+6Z+kp68+ivoIOSzhJUeUnA+PaWrLy3TfykYX4apKmZtSbHM
         bqV9Q8rDenq4PZBPAfp0Mn+WFCJpDV/G/qJh1v9pNvxIlxJGvEYK2+S8XDES97KSyoBf
         zxRgY0cMk2QyHd5rX54FLFoaf6RmrZgw7faYuM9dr+NAE6teRj0roAwHZ4mQtkrfdnYT
         Hx2A==
X-Forwarded-Encrypted: i=1; AKwUvBzVChJ8ULhj7xjkp7aYOmOuV9Y1z6T6e+mJf3rvLs++KbQBBXaoRySyD2sXoMrwm7n9Pf5Rfx/zyulst4k=@vger.kernel.org
X-Gm-Message-State: AFuF++mdEuLCFtH9DbqC5Mokvo53ivu4nK+FC1TwquIkqo0JeB3bGB2V
	ZzW4KGKqOWW39DXiExdf435FUn2Trfb+3xdg/E90xMOh3+X5D3ghYceC
X-Gm-Gg: AYBFou0ZN8muN6bSL8H/IejV0Ow5WzCMK4BI35WpMvhnLf7WLp0fxIFfVSxuShFciak
	pLYnvvx8AQYGNIHnyVF1BD5OW1ivzoRXTAg5N61EbfBGvLZVcT5kyF+lcFCJojRcUB0BwE6HAB7
	l55pMeUHCY/tDxh9v9/AnOqXFUfA/oZPFmwm2lzMUUSwvpGEVvYu6N00QYi9O5x05JUOnBCh50g
	QDtDBsqZH/wmPEEAjs8Mjm5KL8y5RCImOfEBUnLdHUJ4MhpnU1rKTLdOsrGYwRmjaxUcFrmyIMw
	9cPCJI2ExldGap/sMG6V7jEwH0pb55tkao7moM3HGpa/efYbasOTo9ulwdxf96mlBDcg+5Feg/W
	JC/+yCVPgYejrfb2H6BqH8HmuuSuTVFV7deGQU7aiR1LLe20wf91d6RuK8psb1aGMGDarIdXpms
	AvIrMjl+tkuJ01u8q6x1xc7jkKmMKvZeCvvb9m0P96NK2guubuLqDLb2VIeVFXenFlPgbb1EcI4
	BdGwj3TAwNm
X-Received: by 2002:a05:6a20:c90e:b0:3dd:a196:5396 with SMTP id adf61e73a8af0-3ddf8296889mr2890417637.56.1790174798050;
        Wed, 23 Sep 2026 07:46:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f2228a2sm1257186a12.4.2026.09.23.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:46:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 07:46:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] hwmon: axiado-pwm-fan: Add missing documentation and
 MAINTAINERS entries
Message-ID: <8b761904-27e7-4e03-bc37-9fb048368b2b@roeck-us.net>
References: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>

On Wed, Sep 23, 2026 at 02:58:41AM -0700, Petar Stepanovic wrote:
> The axiado-pwm-fan entry was added to the hwmon documentation index, but
> the corresponding Documentation/hwmon/axiado-pwm-fan.rst file is missing.
> 
> The MAINTAINERS entry also only lists the devicetree binding and is missing
> entries for the hwmon documentation and driver.
> 
> Add the missing documentation file and MAINTAINERS entries.
> 
> Fixes: 2d52742f408f ("hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609230904.aIWyLsSt-lkp@intel.com/
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sorry for that. The patch did not apply due to conflicts, and I had to
apply manually using patch. Doing so I forgot to include the missing
entries.

I'll fold this patch into the original patch introducing the driver.

Thanks,
Guenter

> ---
> This patch adds the missing Axiado PWM fan documentation file and updates
> the MAINTAINERS entry to include the documentation and driver source
> files.
> ---
>  Documentation/hwmon/axiado-pwm-fan.rst | 38 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                            |  2 ++
>  2 files changed, 40 insertions(+)
> 
> 
> ---
> base-commit: bf92ea2a46120fd0809f24d39ad3482d0f20876b
> change-id: 20260923-axiado-pwm-fan-doc-fix-new-d0e42bbb0cbc
> 
> Best regards,
> --  
> Petar Stepanovic <pstepanovic@axiado.com>
> 
> diff --git a/Documentation/hwmon/axiado-pwm-fan.rst b/Documentation/hwmon/axiado-pwm-fan.rst
> new file mode 100644
> index 000000000000..d110e170b0df
> --- /dev/null
> +++ b/Documentation/hwmon/axiado-pwm-fan.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver axiado-pwm-fan
> +============================
> +
> +Supported chips:
> +
> +  * Axiado AX3000
> +  * Axiado AX3005
> +
> +    Datasheet: Not publicly available
> +
> +Author:
> +
> +  * Petar Stepanovic <pstepanovic@axiado.com>
> +
> +Description
> +-----------
> +
> +The Axiado AX3000 and AX3005 PWM fan controllers measure the rotational
> +speed of one fan using a hardware tachometer block. Fan speed is controlled
> +through a PWM signal supplied by an external PWM controller.
> +
> +The number of tachometer pulses generated per fan revolution is configured
> +through the ``pulses-per-revolution`` devicetree property. If the property
> +is not specified, the driver uses two pulses per revolution.
> +
> +Sysfs attributes
> +----------------
> +
> +The driver provides the following standard hwmon attributes:
> +
> +=============== ====== =====================================================
> +fan1_input      RO     Fan speed in revolutions per minute (RPM).
> +
> +pwm1            RW     Relative PWM control value from 0 to 255. A value of
> +                       255 selects the maximum PWM duty cycle.
> +=============== ====== =====================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb3cc6c81bcf..5ad12c57ca5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4504,6 +4504,8 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
> +F:	Documentation/hwmon/axiado-pwm-fan.rst
> +F:	drivers/hwmon/axiado-pwm-fan.c
>  
>  AXIADO SPI DB DRIVER
>  M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
