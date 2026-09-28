Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13942AF00
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605858; cv=none; b=otEHrnFIPyPYhvvYTlE9Mpp7xIuZF/DMmQYu8GTNTn2LR/UCXBV0I0VSbbMACvoy8y40FRP0dLF/VSr+Faaxzg9VYKjH8kYeuhMiDDwFQ/0GIshREympUYfVsM6kCSAEDcs6V6qs8ojjOFFipTq/Ke86Zv4vFbbgCRv9Q3nf81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605858; c=relaxed/simple;
	bh=zOO5vngUpbGvtnJJBJVPw2xvGaJW8+vPXLlCqMLjWxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjkxKeR5VQcjUQn2pICcjQHfKxrsMuArsFYoh9VsrFgj86aCF6Hfn8ki7PnjouBM4/ZP+NLqlRxrSB7Ud1/1x60/LPPe5+6tLY7ZmUnsDKuw4vXEBUpnqXNjFncqmopSiLFYyRUNANYmITuJKOB2QlHHZ+rN6NbiWztfW4fRrcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RET7we+k; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RET7we+k"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341fe27b718so3055774eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790605845; x=1791210645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fPfnBNjR5ch8SlrLWyGonFkgejUz2CO2DBapZuBSnpk=;
        b=RET7we+kxRYdLAfbUCc0rcI2pSpqxqFSxRl+ubtip4dDaXcs6shb8DtHmljp/88Slf
         ct6WY48lz2Ptv5i23PQawLdcQTtqKjwokIl49jpIrRAn3UUR9E2HjeO0z4D066LTBgAa
         DJLUh0ZAroAmkDEKc87vfwG7a9PeMhV8Dt36pMS36rU3sEgH207IO8lS0XwreA4rKss5
         Dxw3da3GSf75C4mdg3K0piJKu0Gmql4N2/Jq+pIDirM90IcDRWc3a5ngIxZQ6NF4qQ5m
         3bgnVysoXoqdqLSypNDihcH0XzWbDJ4LqK6W5qfRTnFCDOwQ0xBSwCyam85Uy7lu0mtU
         rCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605845; x=1791210645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPfnBNjR5ch8SlrLWyGonFkgejUz2CO2DBapZuBSnpk=;
        b=oEtt9ghPOZ3mpoJFuB1o3ZVf5uy23/5G9ggt2P00ow0uSgSP39lz5wag2F0zFTziQ/
         X++/tx3Jnc1tCxFENbacMEyGw0qGyPmxQbL+znve/khFdXZelXVUu1se6/HRoxXUEyCZ
         uzYcxMOn7rN15E8TiVTHpT2FALD0j+ai327OdcW0RXtDY3INX3hBtizbsMrHLpxsm15q
         MgKNVI2xuhG7MhVdKScEX99OWficfQUu2KP/jc3NzWwv+j1YyP3iCS5UXIUxgtepqxTT
         qfDzaw8DX3BI89dDHPjdYZKSQoiPC+i+gJKfZTnCTbJO3/0vOG5fVj9Vf+aAWxJyEZsN
         hGJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs32M0S8NwQi5vyWU+TfUbL91VHcmKG7JbDzfarXPUKxN7cqfAp2iMprIvKa1ziHjVZC4+yfcnsYRVgnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF5Y4KDgFyvUfrq20Jm1rvjOpbXfXndfmVcYsp1haC0Po9N7YZ
	HC44HZSJZseh7JVrRvdu9gKeLkoo070evJEFoP5gWjqDIh6GqAOUzjqF
X-Gm-Gg: AYBFou2bUCtGz0t0wbXLvGhGKnhEMxTJs74d5azpesPpchsfNOBWp7XjqOdcD1oA8Xn
	eN++Tec2jQsa1QL6s5aHVNOR5R8M6XQJU6MJNQtgrwCMWLZ26DPsN6pzDA+JA29lWdlv7YfN0JT
	wohMFRfhf/tvkx0KQo3w2Iu/zBeSm0+QRjOuLzhJUJrIskHzO+vD1FdgUFXQvued7c+3VboANsw
	m3ZvMO1fvRA3C5LWCOorJyHaqHGsU+/bPXQbyFpj9Q1Z2xHJw/LR5lDuD+RJmtrWE0B1hL++jwQ
	jCvXNgoafQRf4/HYHD0xUgSTd4yiBxmVVk3gdfrdlwbiRI8bZez2KtSITFPGLEC0zeAWm8hikQa
	a8gb+SffZdZyYWzua3AqZSPSGNx94AiseJMJKHc2jhTpa5HriBVKBFdM/vEHA6ucdUcho/vBAvv
	0IFDhM2KmJ3lcJaLTCl8uBzgaRBR+luypw/fplL9WDA9YmGw5THsGw5bFWeDl0uPEYAFXgDbvFL
	fgT78P078v9
X-Received: by 2002:a05:7300:cc1b:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34271d88c7emr14770568eec.22.1790605844955;
        Mon, 28 Sep 2026 07:30:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm29219226eec.17.2026.09.28.07.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:30:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Sep 2026 07:30:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: alexei.solcanu@pm.me, Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD
 Win 5
Message-ID: <531f1815-fdc1-468c-ad4b-d513972cfae6@roeck-us.net>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
 <72ea804b-6d62-4f31-985d-4f3f0359b5be@roeck-us.net>
 <CAGwozwHiJhDnpYsyWMYvzBmtGtn+pKJp+LY3dUk4mYcjw300oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGwozwHiJhDnpYsyWMYvzBmtGtn+pKJp+LY3dUk4mYcjw300oQ@mail.gmail.com>

On Mon, Sep 28, 2026 at 02:03:57PM +0200, Antheas Kapenekakis wrote:
> On Mon, 28 Sept 2026 at 13:05, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Sat, Sep 26, 2026 at 04:11:21PM -0400, Alexei Solcanu via B4 Relay wrote:
> > > From: Alexei Solcanu <alexei.solcanu@pm.me>
> > >
> > > The GPD Win 5 uses gpd_duo_drvdata, which exposes a single fan and pwm
> > > channel: pwm1 writes the same duty cycle to both fans, and fan1_input
> > > only reads the first fan's RPM.
> > >
> > > The two fans have independent registers. Fan 1 uses duty cycle 0x047A
> > > and RPM 0x0478/0x0479, fan 2 uses duty cycle 0x047B and RPM
> > > 0x0476/0x0477. A duty cycle of 0 returns that fan to EC control.
> > >
> > > Add separate board data for the Win 5 and register fan1/pwm1 and
> > > fan2/pwm2, one channel per fan. Boards with a single fan are unchanged.
> > >
> > > This changes behaviour on the Win 5: pwm1 and pwm1_enable now control
> > > only the first fan. The second fan stays under EC control unless pwm2
> > > and pwm2_enable are used.
> > >
> > > The GPD Duo keeps a single channel, since it is untested and its
> > > second fan's RPM register is unknown.
> > >
> > > Tested on a GPD Win 5 (G1618-05).
> > >
> > > Suggested-by: Guenter Roeck <linux@roeck-us.net>
> > > Assisted-by: LLM
> > > Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> >
> > Another patch new revision sent as reply of a previous one.
> >
> > Where does that idea come from ?  Can _someone_ please let me know ?
> > It seems like a contagious disease, but no one is willing to admit
> > where they caught it.
> 
> Maybe the following?
> https://en.andros.dev/blog/75beece9/sending-patches-via-email-with-git/
> https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patch-to-the-linux-kernel-and-responding-to-feedback/
> 

Sigh. That "keeping together" does cause me to miss new patch revisions
on a regular basis. Oh well. At some point I may just create an
auto-responder telling people that I am not responding to nested
revisions, and copy the authors of those articles.

> I faintly recall something like that when i was sending my first patch
> a few years ago.
> 
> I checked the kernel docs and they are correct now and explicitly say
> do not do this. Perhaps that was a recent change though.

No, that was not a recent change, unless you count commit d7ac8d85d39f4
("Documentation/SubmittingPatches: discuss In-Reply-To") from 2015 as a
"recent change".

Guenter
