Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D523BE146
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149506; cv=none; b=dYgHMRauygAkTS16PnomxrMpESFIle37la6RPzDrvdj95ciwSaE7AJVBYfJEAbbiEfdym/yasORxxLjQrcgpjOGCwWrGt5+nCTGgSV/Aef3EbKZhjNNNNY3z3elaccWWQC9XkF2iRpJCFAtNHZqRI7rWhVCbWMTq6bIDlitcGsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149506; c=relaxed/simple;
	bh=zgkwj6e9vbDHwtICgViFCAGRLUN/G2JGqqsU7h02Wuw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3SSmLCwS1QhFhqTqSEKT1GErJr5YI7UMlSpc2X1Yu0TfN18PIxCBPCtmONzV+MQOdBDillvi3t3xsjO2PKxtP3BsDYqwFu43AVrAWzUrNzrxWL1l0Rm6bxF789fIHaU7aWJLzJr6voPAeDEHJxYggEHPSOj4f/K1wtAcF5yusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOLuofGX; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOLuofGX"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-483d290f398so3692373fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149503; x=1792754303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVz7ThNpphF2wGwY/8fgPQxitchV6jCAr/JmL33wLY0=;
        b=rOLuofGXs/3SgRSMcaqZ25UKsw8rBc3LS9Pr1WgCbJB3fu2ntW4G7dT7R/4Frfp9+J
         bbJVBUaY8KFYfTUfjuGdx4pbo3pB1UQRhBcaQTtAWiVnNp8ExOcYl3DMcI++AJXLqo+i
         JP9+BKb0ekE0RGrRY81HYhK9YY/hmu+XhZ56AhyqaLvlr8MSMu44P1QS0+NcdMeZmYQJ
         Jwgsprq4De8xfOgx0i2ty7N3wwtRqfOlas3+H+/Vg1pirD+T0JovQDSZP5975BAgb01J
         u+RN6tKYuoOkBApBzHnFTPk+XMsJjMqlHbX6P4h1TslDSzw40da+Np8yGr2GMIFzcNFf
         KHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149503; x=1792754303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cVz7ThNpphF2wGwY/8fgPQxitchV6jCAr/JmL33wLY0=;
        b=TyVSq0HvpWpKPy/54Aebv6l4ec5nKU51tnl66DB4gXvQ8AmfGv3r2PU5/Mt9HgLHol
         +FfIkNU80rbiAnzelp96PNNTXrlonbn4vgMdcyKKrpVkkWxIUBb5fnGw/JMhaCT17mOM
         SZdf5vqfEDrieF+c2Swb9yRfoH4SOjxlOoKX/kx9EisR9l3Qzr1zW0vSb8AtvHxcGSCL
         gMgT8+y2nOYgT1YPbTKWw0TqHTfOO4Hr8+NKyerAAlbacooEQknYu4XD78q3WdeEv6AL
         SI0y0D3qKnbo3fPOlWUWJSW1gEf5t53/oRHJmRtioFM/9q6O7AlQR7Ayfduhs13S8PBx
         hIBg==
X-Forwarded-Encrypted: i=1; AKwUvByqVWvuPdhG5+cai1TW4ElNhYrg2eBi4K0ykCb2NghSCt3g0ItohHb4s/rEbXHnKcQwogdA0e6hSPcoSLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI15wXSXoXswBEpegXBLyySIb9OcGwIRAjtyPagWKgaRjhAmdk5
	OLhzRG4/hhPAWZPLqVvh7VdadWki02wd4qV7KQN0Z9jAzO0px4eBFKhd
X-Gm-Gg: AYBFou34NSfJH12yFHeiaLyeEcxI+i1vyI+s1pPhUCPNsl0GqeG52CFMhIxSYl3FLWB
	M2VkxupS9qX2HhGA3SrHWFvq9GZ9NTQQeKhP2UEzKVLgf4ZP074yIlPO3qWg760EpTjn+iFoRr7
	pF2o1p3mEghLKyixijA6xuDJFzCyNdyPtNua0dBIPonuATRF1eHayzVLpBS6ylkprmbC0NoglRY
	O0nnOFlOkWtv+W8u8lOb747ktMG10nCc3TS+/NVNCnNMeVKiVuRF83ZQZ5EzxJD75tO9V3tWNvX
	hJ1FK8owpRKSjKysRqadqexwcIxwHujg1m/4HLfOgjhGyH+IS1rfioYgw1mzuSS4OeanhwqfPaP
	Ua+YAXpX7h6ePI8vADc7VeGnE7Bu8sW3XKTZVFI+Tz5FyBPtn2U+vnSjrniW3h91HfE9V0wno6x
	ou9uyhBnppoZ7BtCLnNNJ68HUgP3g1z4ziZqnSrXZh5o96m0vQj+/5NVfEZa4ORfgF9XgNQ4kjT
	FJWvEck7O82mizqt4pvdjApRJPzs8SbIh3ACmnsi8CK8/aO1L4BgQJje2Zv4qCq1qf6Vw==
X-Received: by 2002:a05:6871:810:b0:491:8db3:58bf with SMTP id 586e51a60fabf-4a2a854044amr19154740fac.8.1792149503385;
        Fri, 16 Oct 2026 04:18:23 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm1510827fac.12.2026.10.16.04.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:18:22 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Fri, 16 Oct 2026 08:18:08 -0300
To: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 02/10] iio: backend: add devm_iio_backend_get_optional()
Message-ID: <w7waqang6lriwbcq6o5s5yuedouuwgacmnj55qsjpzjrv3jut2@cthvkakgyhpi>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-2-3c21648c8e26@analog.com>
 <atEeZPOLASHAcnjF@ashevche-desk.local>
 <atHjHqyxXj6jkObW@nsa>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atHjHqyxXj6jkObW@nsa>

On 16/10/26 09:45, Nuno Sá wrote:
> On Thu, Oct 15, 2026 at 09:41:40PM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 15, 2026 at 01:49:42PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > 
> > > Frontend devices might not need a backend driver to rely on. An IIO device
> > > that supports backends can behave differently when they are not available
> > > and that should be acceptable. Such parts may provide basic functionality
> > > solely using the control interface (SPI for instance), being able to have
> > > extended features when a backend is present.
> > > 
> > > Add devm_iio_backend_get_optional(), which returns NULL when the backend
> > > is not described in firmware, i.e., when the io-backends property is not
> > > present or, for a named lookup, when the name is not listed in the
> > > io-backend-names property. Other errors, such as probe deferral, are
> > > still returned.
> > > 
> > > To make that possible, a named lookup that does not match any entry of
> > > io-backend-names now fails with -ENOENT, the same error returned when the
> > > io-backends reference is missing. Also, the missing reference is no longer
> > > logged as an error, leaving that to the caller.

...

> > >  		ret = device_property_match_string(dev, "io-backend-names", name);
> > > +		if (ret == -EINVAL || ret == -ENODATA)
> > > +			return ERR_PTR(-ENOENT);
> > 
> > No. Please, use device_property_present() instead.
> 
> Oh right! Totally forgot about that internally :). And it fits into my
> internal point where I don't agree much in treating -ENODATA the same
> way as property does not exist.

Say a frontend consumes multiple backends, but some of them are optional.
If we care only about the presence of the property we would fail when
trying to acquire the optional ones when the required ones are defined.
am I thinking correctly?

-- 
Kind regards,

Rodrigo Alencar
