Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8753437C11F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883989; cv=none; b=pbeCL2Iq4OTVHtELnuhww92ObSjQfBVzu5y5b3NEc8gTmsAGITmFS7nvu8XG7I7auQv03bgAi8ry4Wz1ZDtQIJ2CZlphYJr6F1kWjCHnZKEJdNcTI63hGrAYpPKMmr6ZVQmFvC7lahUEH1WwBRMo/MlY4t+hXlM+7DuCKPOCZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883989; c=relaxed/simple;
	bh=uH6of9n2rBHWfIQOS9mKxTMhHVx2BH+BmV3w17ToNbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qjwx1PM41tQaaVmq0PsrytK+Z9XO6rSI9fl+UDKujWrfIbdOIoALW61qAwKWrdD/h11BeHG6Gp/69z4SL07hO6JfOePl2OzODv1VkiR9s5SaKO2LAZyQ8cXzp7B4vMDHBwwTk0GFFcb2yDX7latgmhFgsSx4nvPD+GkcTdTLyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxqzrxwi; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxqzrxwi"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3911738a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883972; x=1789488772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=fxqzrxwi2bzga5/vC5mqkMfyxdXc9OjpkhgB2nu/QvIEaAWPMVL6MciTrSgFUNYWu3
         RjM8v+ptYG/PzK+3bmx4rc4wbwG08FUHhcsRSOvroG8RrCcjSY06fAtta8wLB+2MFF/Q
         +jAYXoAIsXdEYUODcdnyEriJYSuu1/RDtQzW8/r097SLQ0cfRfqs80xoLPI8PAo8VzR8
         Dfzo1ZN6m1MxnFG5gQq/BwbQkMTJRCkPxwL7HGGkD5gs+GnPhbgm9cahAlp16dcAOpwN
         xlWrLBeYo+iH5AyMZ4PDqiU6zDp2vS07v3FvuL8SWi6a3mAEQX2DswpV3PZFmk9bVoPP
         cn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883972; x=1789488772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=e6lVdQuJkDAXsIja7g9Umh+zqFDkzHsBOKYqLUUHFiojsvvL/0iksQJe4YvAvY17PP
         IgNBxgCxUopQqEyQxvNtCjOB7NJ787dhrTThWU7q7ZpGXs9iu3LBenvYhAS06p5NTxxR
         2WSJE7jSD6y+ekKSA64y9nOjZI4WWRxL+ezGRd6c7H2np+XZ+AkQXb4aPco9Gn1xH9gC
         GCTV50cTprol7XWYeB+PKiOmI0yoBEAkUNrO07/6e9ItDkLPIcgPe56pTjek2E7cwTMS
         H47P0/Ej1nNSNCtmekcggVr2Z4stuBF8rLAL43eNSrBpguZ0lqeqbCcBJMuPuRdrTKH/
         Q+Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxJ8m0i7i43nfN9LrRSr5ou3zmMbC2hvHLMMeVgSg6mAvgrP6rKNxfeIJTSX9KoOOQmCvd1gXDVryE/efs=@vger.kernel.org
X-Gm-Message-State: AFuF++kyfnstKZidxT0Ut9N4kS+UDW8ZYIE5MtKVTO4Rzx/k+FJqMsox
	zno+vlhG+2tfKp67hm79pSkf5aYItd6bzmtNphWmu5pI6krKAOgnzatD
X-Gm-Gg: AYBFou34mlzWMJKixoRLOP0E/XR35GBGOnaR3Bg9YJmxMp8sYXJW2IyC/6SC7n+MuhF
	CWLcpaUjPi64dbnvZ5bhw7YMLOmQOnCSkWkgXjKTt+gQpkAdwx2UXnhDwq1APenMRXUGFYEQLI5
	pOA2ZQuiY5yGUk1NhllmgaxvLXAjM/3PaHxp2FvSOZko2qmbMYVtyreGXvAhM4LIK+/+5Qj6uEl
	KJkQ89fbUl5dMdgqMzvSKADOATWrJqiB2kw7xtXqJdWSyQvdN3Qv0ELiNyHwemmh5W9tIrM6Liz
	9zOD9m3ioqUrwuPYqVTIStLreY1s9IaNMuC66nxTk9P2fCdsi6eKlvbDbXvAJFJag/5eFigBQ5A
	l5JI15podUkGwBoYvYUeIkkaFLPbODVnOIzshOHNhJVug4OUH2/rfnNWH6ctMGQDlW7jZyBKR14
	7w8elG+0L5XTr6GlvaJKiC3y5V99+06lS1waMZHdrGkfuvxSURlWN4QrGeqDbdMvUnztTny88XB
	g==
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr45189132a91.2.1788883972013;
        Tue, 08 Sep 2026 09:12:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm26901209a91.10.2026.09.08.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
Message-ID: <5f01098a-9d83-4f4a-957f-835d63196a98@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:48AM -0700, Petar Stepanovic wrote:
> Add a hwmon driver for the temperature sensor ADC (TSADC) controller
> found on Axiado AX3000 and AX3005 SoCs. The controller measures
> temperature at locations within the SoC silicon die.
> 
> Each TSADC controller is registered as a separate hwmon device and
> exposes one read-only temperature channel. The sensor is configured for
> continuous conversion during probe.
> 
> The current TSADC hardware does not support threshold or alarm reporting.
> All TSADC interrupt sources are masked during initialization, and only
> the current temperature is exposed through temp1_input.
> 
> The averaged 12-bit ADC code is converted to millidegrees Celsius using
> a lookup table with linear interpolation between adjacent entries. Raw
> values outside the characterized lookup-table range are clamped to the
> nearest supported temperature.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
