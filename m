Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493286;
	b=JhMsXMaQQF/nJaw+KjxAvN7tbpq/B4MDdGB+s0/NQ9/4INv5IaOFNGccszmTOy6HXdvG
	 fXU/9WBmvl0SKArAYM4g3fSgYBqEeIiodjy7gL3q3tV9eZXYYDnhQjboYLuqDVmVA4Qyo
	 dX2ccj2mVowlWraAFP/64m9GWo4xiyrnQOWNqWeqX8L1L+QlTwPRWrddVGI41EMmm4Zxs
	 BASY5njRxdIKWH2tIPjL/4t3I23B1lI5kpx8IT1+iVb7AFqsw7sf6wWnsvH8Le4kqH6UW
	 KyozJ0zlhdcmn+vgTEvWFmDMnT3W9e2kqIzT1TvlsD90xvQyEPM/JUI7FLnRo62eP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
	b=Cj1vl3EiQ54s/jMZil6Dlo+Nj1zLkPv1LqQY/XuUMIUvfDB6FBgPUuU2CKjkbOhjDksg
	 nhgun3cVObHJXRMsG+2pGjx7CPWgN8ZMYs/KxuZJxXO9rRXLyFtR7UM5sSegBub8A1423
	 lktwZq5ojFwdp1tDzVOrSVvcM0dE/Jav1fQmYjOTINf8GuKOWwktVYbEa9XLAp6wbBI7F
	 PO2euoGx4r574kK6+Wt91y1VjFDLzFTC0AZYT6T08VENk84df7WToo35ADy4bEmVLlRlG
	 l8/eWYokdSC+i7Vl0NkbD3anuooMaA1L3J62ChQydblh5gA9xL3V+HXx3skoeQyOSDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fiGsEbWV;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11460A260C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B11460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fiGsEbWV
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36661f953e4so621793eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493285; x=1793098085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
        b=fiGsEbWV8Q8RM6j7ZxuVSvjNOICcG6msaUt4ksLEKv+iwv6d8mxyjI+a+1OU0I2GKw
         F6luj7kc9MNOSHVKmv+62GQZAdeQzjs0durajglBeRLj++pSzmkAq961oZr4j8SXZELj
         JXdXl+6PIKVfjB48KQKvWRtyW8qHoTRIiGHSLRi5EVhek3fVAbfA/y6+onr+iY2O/bHx
         KMmmpB8oRIDXzcsu3MVc8a1X9tfsNan5xDoWsVMKchyzXgoTALcRdTArn7Q0oDFxM1fp
         glTTGMeSvFQkiHXwWmnRf74xc/RdAusZLhgtR0DICZDjNauabVu08HwZiM4jWCxGQ19J
         SS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493285; x=1793098085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6I3hZn5IrrtMWEjXHuQurKyJm+2cM5wqnfTX9gelMt0=;
        b=0t55Y2XW2A4acO4a0WvpZveAO8MSuSwqhbG2xC303cl+fugXIL0REfAOz1XSBWEujX
         yaXl53Z+07koeTiC5zfmDScn+gs720Pr57TdMizQbZeZ60mEUoP5epmSPkDtpSoMGrSZ
         MLwsDFOI9GHHhS+flqdsl/qIDpNQx5OfWsZXqEGqHudUdLHVhaFeuKZSIQx8kt8BQsgl
         4NLcfBVowJF8ShbhoRe1SXHvXSh5/vaunjjlD1wrYedrlQsCbP3xjD2cIICDtSYbp8ib
         +h7cO9IEnS1ka0v3XA19I0d+CBzTQv1aNun8zpv6hjvNXYRJly9SZ5kbn/eD4BbQUKT3
         aBZQ==
X-Forwarded-Encrypted: i=1; AKwUvByfaK+HnomTImBeVv2N+qjjNf/VOoFzCncH9oYUcnz1lpGU+Ihcx1erW9j4m05/HJU9wd8n92h/PB8L6n8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9lzO6EXe8pAr1IT4QbKpYo8Ivk4yJtmITX2fJtst4jFCBMzQS
	HwiLRqAOG1a3d7XSig0oGaXl7gI2CzvKc34Es8OQ96nOhj152QsfCXrQ
X-Gm-Gg: AYBFou1aNXvKKY/9XujunkTV8f2QTVtDN+U4gXb8pgkNhQvJlWy832eINVMA+bCToxt
	VctfGYUno3D+ik/pZfVmWRc7A4qd0o/CDkiK3DeRc4dLhfR09CN5NH10MPjrO3Ls2n+aKslSRLh
	ze6LPFdvibmJ2FmwM9nJZvCdD3FMpppPnbIQw9KfqPmbvIZRVClJVvfQz+/Wp87tWGhRWzvDiA+
	vw46WiayzIWSE02EDHbvA7Ge8idr0aqH4xH6qh4yzmu1kGlDqnchoZTomQyZ4e5zpd2iCYxkbiJ
	u16L4rVLABwBzsGuOEsB4J9M6k34dcm0xvnIqH7ObNBvV9TTYlWGlN6J3EyOeuIKzz6DQ3jnt3H
	mzQnqksUDqgn6msjpxSB0ULUf60HX/SLUqKrNMxyfJPmzIT2vA5hkAQUApBhOVE4gZohgxZH3aA
	/1Fmw8TdXlp6ZLxTThf2012z8VpN99ybGqzJ5YaRx66ZS2U+Rlqn30wnaa3FGvNO8OF89bCnJFy
	s+7tgEvrAvt0sa/PRClP9EJojXVnzxsNBazb4eGZUVy9fR/dOGXbxqE5qlHVfk+vb+OAU8w5LAy
	HqXGXLo=
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr13074342eec.11.1792493285129;
        Tue, 20 Oct 2026 03:48:05 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm39596320eec.14.2026.10.20.03.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:48:04 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Tue, 20 Oct 2026 07:47:53 -0300
Message-ID: <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atcrpTI_R4kRM8pb@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <atcrpTI_R4kRM8pb@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On Tue, 20 Oct 2026, Andy Shevchenko wrote:

> > +		/* Keep a hook the driver has already installed */
> > +		if (!p->set_divisor)
> > +			p->set_divisor = dw8250_set_divisor;
>
> On top of my previous reply, why is this hunk needed?

dw8250_probe() installs the BUSY-safe dw8250_set_divisor() before
dw8250_setup_port() runs. Without the !p->set_divisor check, detecting
DLF replaces it with the dwlib setter, which is the BUSY problem
described in the commit message.

> In the case of existing _set_divisor, do we want to keep the possible set
> _get_divisor as well? Shouldn't we introduce a respective _get_divisor in
> 8250_dw.c?

8250_dw.c doesn't install a get_divisor, so there's no existing getter
to preserve. The dwlib getter is still needed when DLF is present,
because it computes the fractional part used by the preserved BUSY-safe
setter.

> But now I see that we have same function name in two files. Can we rename
> those in dwlib to, for example,
> dw8250_get_divisor --> dw8250_get_dfl_divisor
> dw8250_set_divisor --> dw8250_set_dfl_divisor

I'll also clean up the naming in v3: dw8250_update_dlf() with a frac
parameter, static inline after dw8250_writel_ext(), and the dwlib-local
helpers renamed to dw8250_get_dlf_divisor() and
dw8250_set_dlf_divisor().

Thanks,
Vinicius
