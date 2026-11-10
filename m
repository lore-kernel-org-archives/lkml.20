Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794341724;
	b=Gq/I7EuTvmrrMGozieMbLezqVsJthoEz/8phsu2ECotZAb3OLwWjSHveW2+2va1Lwu4f
	 zkExXvbRdk5ueRwaaNbEiHshtW6RKM0uLLczKIZy6H6bYxlebv1RYYVsZihDIvDR8ZYeN
	 i/WqoTaEQ0YSA2n0FAseELKDj1qPKwNDUcqOQh5PDCNchq8ibvgUI9S0hfVeg64ZuJa4g
	 ba9lbI8FeLzxxSswcKNISWmycL9vKb4tXECcI93Dw/YAx1shx5o7tSx0818vi31gf5ldN
	 WAF9tH4iM5QA9DZyXO1j2MCT38n8i8V+9r3IQ6QxJv6J4c5NoLF3U7x5F7j1uSuEqTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lJiT+8IpY9D/26sFc0x6AV66fD9LP1gmMsQhUCQo140=;
	b=z+UodW+osAMq1+fOwf5tbytQaErwA+tcSvXmBBgAEMfWNS5Fuh/mMrNLRryXxxZ3hdJJ
	 qeKvmyf1TGDDaRUm+umd6nQ9Ouqo8MvEQ0lRuqW3z6gsEEpoDwAtHAHTi6j4A1lzkCkR7
	 nFS4eh8sEnX26E89rmgIyXyR0VFE5xxzrRWVrI0op2HU3gsuioyL4M87ibeeKnUaSN7yj
	 2yGJRcA1FQscfgoOL2BQIjCFNo7UPC0SvsMMbP8UlKUyF6csWTK6NZBUD28/R3alqZWO6
	 4jgEmOTrr2sjR3SWqMzN+MDhuteRQtIqX8y0eXPkoNGYvPLfR7LaO0soU0pWr1SwPCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vi0rRR86;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304FA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vi0rRR86
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be4686827so1991304d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:15:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794341723; cv=none;
        d=google.com; s=arc-20260327;
        b=SGiP7PzKZfXjZg578jb6ACooTSYJ+VRw0DTgW7OitEiaI8dcA3iCaHXh5tWJMR/Wc/
         z+wHTCRFjzh/4Mp7t+de2pdGFxe4o7tX26i6OYwpoDTt1zt4h7uIAw706t73l9kj6pRm
         +OOuSZ8+MIz0wYV9LD2bk51HTP3pmIWWxBVawCvoebMlxr4KO+pLmVMfwpfB9UX7wUqr
         +Cy1KkgJYehT5nZ9hLR54RqB/ZF4T6iGlCPfmNLdrxHH2Esv0/fSOXAScd54ecmFaCct
         kB3bsnp8A99W2zam5lEgSJYbWi6AN2m13aoZLiDtspDT6FILnRVUJ0+clKWsv8gL6+F0
         5wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lJiT+8IpY9D/26sFc0x6AV66fD9LP1gmMsQhUCQo140=;
        fh=D3hwaB/c7DxOEFiKotyKaBjtougLePBYchq5ZADDnSE=;
        b=ptSuf2dUxwwB1SeR+fn4rVuWclSgA6aXgf3owxc67ngJI1Iglnetxk0bzs6IjeY/MB
         mEHAxL0JLdxEyo9KNSSzLC0jxMw4S2WqbuVm+1NsxKX5gbtwxSoI2ChRv+P0tQpA118w
         AVjFbc/5gOUxYxo7O0xtWURkWMHUZrPoZ7gec8hmyNPBLc4XubT6/HW4xp0QIhnkctxb
         IHthl52Ym3uPGyPqdk8shCFvSOqqerxuVqCFOqMOnPsNJ2HvrLzFT0gXZz2cOaJ75Jw9
         epzKS0xfWyoGtoxSCUCdvHT/o9fdYlEupgef4d+ZK7xfvUB0rPikdJtWh14w5EzZh3X2
         BjdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794341723; x=1794946523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJiT+8IpY9D/26sFc0x6AV66fD9LP1gmMsQhUCQo140=;
        b=vi0rRR86rLgaCrpxolO2NCtTdCGuzamlnVzJOpe33bEraVmDP6+GWqGypTu5hO4688
         gzEf8o0cDiBwAhmSQXGSlZTrXEjGYDy14awolWCbz0qTb2KMpsGWyR6DYNYmAUgTlDCU
         CMk5thnnAmX3TK0NBjNMaxg7r/AvXoH82dYxq6HhkeOnfsPrf3IJ4y2ksurH/ID/+ju3
         aPYuRRCxfQ/ZZFhAwNy64a4/HX3546ldnSlmP32BJeTvbP5dbFyY9n7nb5IUAc7TFP+F
         jUsQUR3zZp0w1VanZ4zM2Ju+hQ+5r+2XmtEcx0BCwY5E5KUAtMw4H0Iy6GvLsAGB7idx
         7w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341723; x=1794946523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lJiT+8IpY9D/26sFc0x6AV66fD9LP1gmMsQhUCQo140=;
        b=XgxjSUyWWUklA1bmWh/txhVN8kQ/Vyrk8nvVnqvxaoA8YkG8L/OgkzGqlrV9IXRwP+
         5hQmseE4JNFWRNuWXBXwUTHWikG21Z8ETjzC2v8kG2cEB7UOv2saDvhgep/D4yBYzJeo
         8Jrtq3/yuLCl0HbARJIPXRSs75NszHFvFIH5igw84ZraNw5O3JOtyteUj43SToPlRL/5
         dekVJtUmYhGr+33Aruny4XJAfqfaRDfOgVtYLBkEPVMXwiclcHkad8YpZWoo5dKGqy4I
         ePEZodyvobQLn/tPC9+deQTu8o7poF+GJJcPC8b0tnR9ADCKGCYMi+29bPOx3/+gZfHY
         SxCA==
X-Forwarded-Encrypted: i=1; AL+hErEUv6dvKCmJZW1bi/lJS6IHgwEcvkIfU5GBJYb5sRCJ3RvBacI7vi5sNlgE1lyUsNx1q51xN5WkgQj1EdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W8p+Zrmr37w524gRqvWzAo9Qy5S5dOW2DUFLebNHZ1l/RQFIM
	G2v6tELrCLViFxNzTJUzw9hPV0oI05u8M0h3a5CQC+Ryxieeht7bo9Pj0hjiI5GH3CPRGNwU2CJ
	3A7zkrSWkUGpgMmHy7DI9bEsLueIna2w=
X-Gm-Gg: AYBFou3ghw2gONlsuz9VrWH/qRESrPjL1vLcNUxoKZR4fHmG0QITvbQzTGmNuJlzdke
	5dT53E6denKwh5x/pFrKzJ4EegSPuv3s9IHTnJaX3IOC4KuXQ5iz9QAxR/wmtR7uGCsgXEPlSaf
	C0ZKECWZPtt8YjX+PA4nmek5l7PZxNQSTBnb+wQ5P/SxxHwcOQbJhnde5NOuylx22FNRjcaScbg
	0l5+ComouTvK3a1y3mLEu1LixmUJHrQniiNurYOMY/4W6u4KyXTUMkaEqWHfiBix/mVoCpZfAtE
	QK4AwrAJ0XDO3p4qVo1tPugo8ACtS7JaEWBLwzSDIcjqE3P4BFnZ5ylCNAziroC/2Pxp67tzF5+
	xWlEI8lc0M0lBDZaYtPBawdbaNERpW8i3wXG1t3rZHHgK1cJ/We/QIUAitNugDGZ6yKdc09ffNG
	a2BmmvZ550LJHrmp6WK3IxM9QwZ7Y80MTMvlPcO+/qeqN1ZcKW5vsVVFglnlywRTwt//EEcsyel
	dM86p1qwQ==
X-Received: by 2002:a05:690e:43cd:b0:67c:28fd:8f1f with SMTP id
 956f58d0204a3-67c67f77ab2mr227205d50.57.1794341722999; Tue, 10 Nov 2026
 12:15:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109210146.57766-1-sidchintamaneni@gmail.com> <avI7g14oGpFKlJnV@ashevche-desk.local>
In-Reply-To: <avI7g14oGpFKlJnV@ashevche-desk.local>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Tue, 10 Nov 2026 12:15:10 -0800
X-Gm-Features: AclHuK-s036JOQbw6HtDykqOqg4xoznKSez1GVAhjg431vKNmBxRayoAL0gmlkM
Message-ID: <CAE5sdEg3VKZuGqpt1Sm22Dsuh8HUFi-9w2GWEAicALS4ECXQ_A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: designware: Add ACPI ID MSFT0006 for
 Microsoft Cobalt SoCs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, apais@microsoft.com, rlmenge@gmail.com, 
	hargar@linux.microsoft.com, Jarred White <jarredwhite@linux.microsoft.com>, 
	Jeff Kirsher <jeff.kirsher@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 09, 2026 at 09:01:46PM +0000, Siddharth Chintamaneni wrote:
> > Add the MSFT0006 ACPI ID for the DesignWare I2C controller integrated
> > on Microsoft Cobalt SoCs, along with its 300 MHz input clock description
> > in acpi_apd.c.
> >
> > Without an explicit MSFT0006 entry, ACPI device matching falls back to
> > its _CID (APMC0D0F), which configures a 100 MHz input clock instead of
> > the controller's actual 300 MHz clock.
> >
> > Acked-by: Jarred White <jarredwhite@linux.microsoft.com>
> > Acked-by: Jeff Kirsher <jeff.kirsher@microsoft.com>
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> > ---
>
> Where is the changelog?

Oh I just dropped cc tags.

> Haven't I given a tag already?

no, I thought you were suggesting that I repost it.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
