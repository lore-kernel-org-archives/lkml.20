Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC4D3002AB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947893; cv=none; b=K9fytLs18syJr/W6TpsG0E6QcC6ka21zS6UN6p8Ooy8nCa6QiJTDZvKVke2guJf90HGFWiwVqSzcLJ/H8mqql+SDG13u4dzzFslT1Q49cxf1cRK48hordzXH+CiQEsinrljzv+zDqAP3F7tTDBK4oWzGv1FaZ2mBtNtvIC/QEM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947893; c=relaxed/simple;
	bh=BTWZgvMFDLsqE29q4K9SrpqPAwz/Ao9gpQ4HurHPP8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ica0K5UDAx8rhDoXjS+YzMLBk7gl4bfCPwjWig8FcgfUxhfWfJcNzeG3nkj2YjpY7QXi5fu+uMxalt4tVaDGG2y6a8e1C4OWq4Jg05lboXxHEMW/9R65I1yxL598p5rkfBq37OnvVLbS0uhrvxb5OOzaCyXq22xhGt/wwHRuMoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvqXcrS8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvqXcrS8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso213539a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791947892; x=1792552692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PYUavPGXHain40lEWS6IBxjBfzIOfqYPMFChcw+Uek=;
        b=VvqXcrS8rTM8MhK6n3aOXX5kDdMJiCUAyE/1S9ATnLmDBvXYDDBuKOrcKAlvf+GsqQ
         gosTWGX3LRmk8X1FPNSZn+WqjyC6U7JDEOv0xJ34VVDKsWDxs9xf3Cz2lL+GdBOrTQP3
         MTJUjwI/leHuSI2s/PR83TjPeEiowFXCBLnSX/48vSAW2otlLuOREAyQhZEbNI9q3N4G
         WLP9DhCLArlh/t8c+9VkEkxFJEgeS+1mXO99Ox/+GYDxE8iL0WkkGcWMH/mwD3W4EC3V
         K0T0uu3wdFPLcl0iJWfenTjoFiciBPC0NNiJCXgqVnq65GwNJF4QwY8R5nmksA2UfWC3
         hELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791947892; x=1792552692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PYUavPGXHain40lEWS6IBxjBfzIOfqYPMFChcw+Uek=;
        b=Mm3TQxdHD2XpI+bkr6dFxYqaB2WzVrxLfp69QRIA0R9lkybYeN5u6c/niC+XN1Q8YE
         VR5sJ3Rmh387t4rI8+SJx5d8vsq0MF4K4LfhzlRnYIQuH4cDb++coFeDZPs0qebEn7lI
         l1KPWx7xdpmExKYtA+f79Fx+uAo9b67PD3Q+UrnsH/HTPYtyeth8QoW20Ou+ho09XqPI
         MeXW9YKsoRhuLDV4s3rPGD7cudqvHNpJb8/LCvuiWDuQYGURTLVq2T/ULe63zFGaC/uJ
         QXxy3je/VwHUlreYFiXChfuzJRA/iRQ/lLWlLxdHmGi4cCuiaUW4eJatpD/AOVefMNiL
         lGAA==
X-Forwarded-Encrypted: i=1; AKwUvBw10BZUUk2Z6N/Kwu71OsC29DEetKEFOQO8vljmxmLyZL3hdmQ+Dq+ULwXU2AA4ZlEbgybQdo3207AkM7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzA3kT1VQj3mTqv/UxCPTVqSB6hf3HWE6BTYUqfqFvyLKDxjcU
	a0I+iax2vaAwlR2YWjTH9jN3x3I4/QorRbbXCeV/UkZxAQ6E1pNOlhGc
X-Gm-Gg: AYBFou3XWFn+TTyX9NZ4kdPEErfTfIDhKmPWA1n/h2sXnHML1mU64InEJMw+WWGWExe
	3EqbgLszcg0dbXT15UodmB4PXQXdgDiYvllqH3QKQv1hotqWcFW+4liuSaMnUDicTO/xRIXPYfv
	7zNbGLoWX/uVjmoArzPTERuon0svXDioFGbF89Do+0b7t2Q/pPX7ChpZQmSUcnCBcbBG9pdMe/j
	LlvBjLF75/3ijULJF5UOW+u+zl5MHITMwl5+ECrTYtxCMxpF0lzFBSnRBSejkR1v9rGsbWNvCxd
	pRpfAAaKdVnBs5sCE+yZs/Ic4q4mL52QtudRVxfu5IdIXcTHki8Ff+1sMKHf1OxQSKaewKRw4Mu
	jWsykochLq5/pzRHczgu6yI4jM2hdbS/KNZLCC3SiWGNYm3hlNf4yTrzw4glgxTxoZqONyWQkHI
	TAnLy4VpELUBdjhQ506qw0QPd0HuOxoJAjJayy6vrcfZukSaLuZB0kVoiITLYmx8R1NgLqZs8f
X-Received: by 2002:a17:90a:c10e:b0:3ab:2d17:51c8 with SMTP id 98e67ed59e1d1-3ab3a29028cmr12418582a91.8.1791947892009;
        Tue, 13 Oct 2026 20:18:12 -0700 (PDT)
Received: from localhost ([104.156.230.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f280fecsm2365730a91.13.2026.10.13.20.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:18:10 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:17:55 +0800
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <as70Y0biw0XMjwL6@zephyrus-g14.localdomain>
References: <20261013115639.167433-1-marcus.yu.56@gmail.com>
 <20261013115639.167433-3-marcus.yu.56@gmail.com>
 <as5b_jzx5CG_UoZS@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5b_jzx5CG_UoZS@ashevche-desk.local>

On Tue, Oct 13, 2026 at 07:27:42PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 07:56:39PM +0800, Chang Yu wrote:
> > Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
> > 
> > The AS7343 is a 14-channel spectral sensor featuring 11 visible
> > channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
> > flicker detection channel.
> > 
> > The driver exposes 12 spectral channels (11 visible light and 1
> > near-infrared) via sysfs. Runtime PM is implemented to stop
> > measurements when the device is suspended or torn down. Power is
> > never cut (PON=1 always) to preserve register values.
> > 
> > Future patches will add configurable gain and integration time,
> > interrupt support, buffered reads, VIS channel, and flicker
> > detection.
> 
> ...
> 
> > +/*
> > + * Integration time is calculated as (ATIME + 1) * ((ASTEP + 1) * 2.78us).
> > + * ATIME must be between 0 and 255, inclusive
> > + * ASTEP must be between 0 and 65534, inclusive
> 
> Haven't noticed before, but is it indeed 65534 and not 65535 here (or 255 and
> not 254 above)? Haven't checked datasheet, please double check.
> 
Per the datasheet 0 <= ASTEP <= 65534 (65535 was explicitly marked as "do not
use"), and since ASTEP = n - 1, we have 1 <= n <= 65535. Similary
0 <= ATIME <= 255, ATIME = step - 1, so 1 <= step <= 256.

So I think the numbers here are correct.
