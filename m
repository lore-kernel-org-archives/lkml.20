Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910628;
	b=M+GmnwbHaN0hpsfmJ7jy5ypWvEhNirPmC7n7px3Rg77LuuGrXFL7h7zcpAZpCsIWmcD0
	 ep3WpyVW8mURBqOB5/oE5TIuCPmOEwlTxCu35Bj7Mj/iqqmurEHiYwjYSkSlHBmduFj6q
	 +ojCMJMY8au2WGeiKYzaH1xcx0yMmOTsC37F25BiNzx0roChUTYBSLEj23i2QHyLG1Mh6
	 cqSx8ykL7aGVLyDxeuyQHqljFkE66AW4unbvTMpWlzXbZODHFtibeHl2BwxTeYTDF+x2Y
	 pWNrp+kRjsT1WHggAQNbSOoqltTsGAisUdzWAC6Sn4Bzv/0EF0gjcXfnD+5R9h39+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
	b=EFILbxQKT1wNbm6Z/RD/rzxFJfZzZVxOvLOtaoFJNcG1WVaa/uasI9f5iqmiCtm0Ohs5
	 UfOD7cQflmODmp1NwO85RchCr1pSBCo3eM5TzrGtg5AmC8emdbPxWEiItFm1Qz8YeO/V3
	 5kKUpiRP4kxyUvLhvLn/+sUVXZBTX3rwDYWQfVQNp2tHKpFyhFxRo6x6bcegdF4X7HSPg
	 i9QfRmvKyZmiMdlzuE4jCkIrtogPIEpA1KO1uJWLpF4JdnKn7okFXyj+7xzG/0C+g685n
	 atBPkZJqvumM6o7HDQii//yq54BYkrhaKIl7VOsbQnT1ZM3mc2zgI9XzEOm6abWmUQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nnP5JxbZ;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7B606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nnP5JxbZ
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5361e313e63so23206141cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793910627; x=1794515427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=nnP5JxbZfeb8fykuTsu7lOgLI/QEFjRVc+fu1CYYF7N69sOiXDjrrCF6BHJfgpwcaL
         lEgvTmREkxcrtOZ4P8RIF3pTSLmhWQZb0J6DpuwAtLLTSNvKJnG0f4N7DpigRBO0w10/
         jnXWhSCUllEDxGd23xNXeJ90IIwwMXsh2ZZrTTMpleuZfIQ/2/YoYOnyLU+jdOktjhZK
         D6yZ3PFZBa09Jg2E2q2tFJ9dY64JNxtKAPkRezE/XXLt7YJQASLBnbdTsc6XqpZ8XqEo
         1p8iEvylpaNMSnujQyNYTblqNW60mVS0/K/5Nai7YLiJvG1GTl0xXFP/Skp78N2suhG4
         1OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910627; x=1794515427;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8iFcpvnEbr8OqpJfN5Lh96ASE9g3Jpc4XYATrN5TARs=;
        b=pNrwaLO4icOBhEcPDe6RthZCv9UTrvpegi3I8V9ecJKwe0XSnKvwxJduCDd7ZQaA8w
         pTKkIHwTcilgkK99YrHIjEtLqXlZncRRxhP3eG6eoT9PRrtI/Ef6rdbNsqnr3bDDzpBZ
         3ys0sHkwK9EJZoHmI6qjzYEGGEGFxqMnN0zKmnrUB80FlhEMBOxSsuGEFx8iT80+1M8K
         kDbMGx5kElny78rzhzJmgTyx2Jqawy4EmlWUVuqTwgKR2a07WjROu/nf/myYfqjcoDQ9
         gBFsjdxYih466bHOX5ilRd7dXNq3oUjEkkEDjc/kgRNUQt+HoljRsBdorZsAE8q5alAp
         MNsA==
X-Forwarded-Encrypted: i=1; AKwUvBwhbDeDp/ZHA//7MqXAitZUNn3Pn4SfzeIDwERr7u3C23t8+GlI/6UrBSfYQHP+W6z38Rc2Rw6zE6WbOwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z92P8opcjdjtf/M2RQ8YPyOStYfWbpw/fQlKVVkg4EFDr534K7J
	V6ksJE1Iu/m7wBI7Tr/6Uex2DMlkr5TY/SEHU9Twil9wr+pZqQyLBfq1j5JxHMUkpg==
X-Gm-Gg: AYBFou1WgXPglQddxMfEwn8GehHAN5Cib/0ql2Raf2XaFpR6tLm1JofgAb58zkPzy+h
	ZcWzP9IGOJncqjbmyZDIR7YPcgNez7KNM6GANhuBC97LaaKo9LDC4XaLQgXVfQ1kMYcfAhM6ku9
	9RMld87Z0DOhxy9+p/t/mLpj/+nAymHTyKqwQU3PtAXGEtRvbWPhCBTfcjCe8IUXy6JQakxYeVc
	uRDbR/OV/1qwR00I/yCHi+8OphdtTNieUlSx5fz/n/ehXYkKJY9Ue0jXdNgH67sCUmens3QLh1L
	bMAoD90sHnrU0Cj9zXLvF8klWP4X2ToQ256iYY0RGasM7/EgBokWJwfyIGhGpNbH+qiV1A/LlCL
	L8jqloG1We/ggAb10Rn5aN6JwWDfSIBiw441ZMuoNW0t3W6H+zmjv+kY2H6KZHSzTrDN41OjxBM
	UzferuL2YTRbO3cJ2epFaNg4qttW3XIIehYpZ0fM4/wmQPQJUU2xVN3btRr/v12mRUfo6I9rfyI
	ZZ14iZv8yikKkEBVNOS4dfJlE8PzbOTFy4Pkoiyqd8OI8ah5+khH3Nklsz2XNsEnUU7Qb6meS2g
	1+6WnktwNwvvVGnG3elR+GAoNlTv
X-Received: by 2002:a05:622a:2308:b0:532:cad2:539f with SMTP id d75a77b69052e-54e1576ccbamr6840201cf.53.1793910626495;
        Thu, 05 Nov 2026 12:30:26 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25d65a9csm2142601cf.11.2026.11.05.12.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:30:25 -0800 (PST)
Date: Thu, 5 Nov 2026 15:30:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: James Clark <jjc@jclark.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 1/2] usb: core: clean up before handing a device to
 the generic driver
Message-ID: <9372664c-a8d4-4098-ade2-b73ec214960c@rowland.harvard.edu>
References: <cover.1793669297.git.jjc@jclark.com>
 <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>
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
In-Reply-To: <74b3f919f214a8ece24161a2c904d8a5744b703e.1793669297.git.jjc@jclark.com>

On Tue, Nov 03, 2026 at 10:34:12AM +0700, James Clark wrote:
> When a USB device driver's probe returns -ENODEV, usb_probe_device()
> hands the device to the generic driver. It does not first undo what it
> did before calling the probe. This causes two problems.
> 
> First, if the driver sets generic_subclass, the generic probe has
> already run. It configured the device and sent a USB_DEVICE_ADD
> notification. The generic driver then does both again. Notifier users
> such as the usbport LED trigger see two USB_DEVICE_ADDs with no
> USB_DEVICE_REMOVE in between.
> 
> Second, if the driver does not set supports_autosuspend, a runtime PM
> reference was taken before the probe. Nothing drops it, so the device
> can never be runtime suspended.
> 
> Clean up before handing the device over, in the same way as
> usb_unbind_device() does when a driver is unbound: first, for a driver
> that sets generic_subclass, call usb_generic_driver_disconnect();
> second, for a driver that does not set supports_autosuspend, drop the
> runtime PM reference with usb_autosuspend_device().
> 
> This leaves one limitation. Until the generic driver binds, the device
> has no driver. If it is runtime suspended in that time, it can't be
> resumed. This is transient: the generic driver resumes the device when
> it binds.
> 
> This change does not alter what happens when the probe fails with any
> other error. The device stays configured, so its interfaces keep
> working. It keeps the runtime PM reference, because a device without a
> driver can't be resumed. Its USB_DEVICE_ADD stays unpaired, because
> sending USB_DEVICE_REMOVE would mean unconfiguring the device.
> 
> Fixes: 88b7381a939d ("USB: Select better matching USB drivers when available")
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
>  drivers/usb/core/driver.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d3a61ebc6afb..9b8cd0e4219e 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -295,6 +295,10 @@ static int usb_probe_device(struct device *dev)
>  		error = -EINVAL;
>  	if (error == -ENODEV && udriver != &usb_generic_driver &&
>  	    (udriver->id_table || udriver->match)) {
> +		if (udriver->generic_subclass)
> +			usb_generic_driver_disconnect(udev);
> +		if (!udriver->supports_autosuspend)
> +			usb_autosuspend_device(udev);
>  		udev->use_generic_driver = 1;
>  		return -EPROBE_DEFER;
>  	}

I was talking about more than just this part.  What happens if 
usb_generic_driver_probe() (near the start of the function) returns an 
error?  (And shouldn't the lines that test the return value and do the 
early return be part of the same conditional block as the function 
call?)

Alan Stern
