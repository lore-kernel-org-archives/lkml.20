Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965963;
	b=UVGDR8CpGDNJzEpK02x+eSx4O/soHEfJSU6i9ZlJodsThA8vZe0rMxOK+rCV2kWcjYv7
	 U6UIOzd7NoA6/q7GVO9ar/2btBKo/3zJ3ZA0oYelj78977rXpB5jnXz6upMBAE4M5oJVp
	 Um3hb3TrvZJfoZnzZVbcn187ev9gla5r3hhKNjhRPqzJnB0iXKL0y98t3HoL3e4ddp7jL
	 zLMkbW0o8xLgtiRAfF3fRCmgogsdIihhgkdleAQ67Cj4eLMRlXaWDPsEBHO3Tg31KXzWO
	 zo9H4lT4PdJzw+IWGBInVf1KTl3v9qjcSpeVBr9gfGmWozkfxY/CXq8GfpLakcb0vjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965963;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-META:X-MBO-RS-ID;
	bh=ROAfnzciRE9uZilgoxb2xZEIvKiKO30EAnSl3ehs3Hs=;
	b=wAeuLN5qOj8KS073wpOBrSqYyuFoKLOHmFxs1L4xS13sEw4K1Pr1E+OYEEyeFPGUECIJ
	 TYMvHeq2IRkXVn82wILhD63aRMr3gw2OzTVYx0+vTaZgwhr+K6a3u2cYfqSiQzj7VMKz7
	 K0/FuzbUeOppIQREZU91UCT7HtWzhw2CchIjDRlOKehyNa0T2uOh3TsMfbXuAZlgXd+ej
	 vXUbs4gfxt/d6kGJT5bbaLh6l7O38fE0n4FY0l6i0ZQwCa4JVAxC1EFLOOhjsADG2djVT
	 ZLPioEt63p5UpeswSVm9H1WHKFn3aJBqmuvTFTFKJLZLaNiySGzJ99jcZn6Yo0fA2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=s10qoaRL;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8C606A326;
	Fri,  6 Nov 2026 11:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B8C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=s10qoaRL
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jLcxF6cvSzKnCR;
	Fri, 06 Nov 2026 12:52:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793965953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ROAfnzciRE9uZilgoxb2xZEIvKiKO30EAnSl3ehs3Hs=;
	b=s10qoaRLRdHEvXU3trdw8iuPlFG0MncyzZeSC2CL3l0tpoM/ApzAxYVWVKHC6I4bShDFXq
	tHoD2KqThcLmXqxjzGnrjuUtj0aV5eaKuh46CY4cjXTd9mAuQ5delqwUsnyZTtgpunIRxX
	1neZUJ0ivNmwTrRmcMu5zs7bnCH3n7+QSsZOJ4aGC8gE4b63bky0zbfYLeNM+SL+tXtawl
	OEOutVurw5vvmZ8+q8dAKQmcTNV96dEhkel5Zglur9G9jqcU78DU4ima7qJEhqEc92zgrS
	CWEsF9vgCS5Grxco9cuXz+j3npvylpqJWEpbMNVSNqWkD2/X/1IuOEnZ5PGylA==
Message-ID: <cc36e81bf914e1ba3d641d2fe5aa38c52a275ece.camel@mailbox.org>
Subject: Re: [PATCH] Documentation: Add category of subsystem-apis
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 12:52:31 +0100
In-Reply-To: <43787755-f0ef-4338-b0d6-fcffcdfcc402@infradead.org>
References: <20261105181542.3071-2-manuelebnerli@mailbox.org>
	 <43787755-f0ef-4338-b0d6-fcffcdfcc402@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: p89qyry33ebknrm79gkxpbqh1hejs3tn
X-MBO-RS-ID: 479e0f62b89da43818c

Hi Randy,

On Thu, 2026-11-05 at 14:01 -0800, Randy Dunlap wrote:
> On 11/5/26 10:15 AM, Manuel Ebner wrote:
> > Add Bus and Communication category to reduce number of items in
> > 'Other subsystems'.
> >=20
> > Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> driver-api/index.html
> This LGTM but at first I was wondering why I2C is listed here but I3C
> is not.=C2=A0 I3C is listed under driver-api/index.html. So are some othe=
r
> buses.

I think the actual reason is: There is Documentation/i2c/
but no Documentation/i3c/ . subsystem-apis.rst links to Documentation/<name=
>/index.rst ,
core-api/index.rst links to Documentation/core-api/<name>.rst .

however there is driver-api/i2c.rst and driver-api/i3c/index.rst.
Thats why Documentation/driver-api/index.rst has this:
> Bus-level documentation
>     ...
>     I3C subsystem
>     ...
> Subsystem-specific APIs
>     ...
>     I2C and SMBus Subsystem

The structure is weird.

driver-api/index's justification is clearly stated, subsystem-apis's isn't.
What is it?


> That is a little confusing to me. ISTM that we need so *not* have
> 2 places listing bus documentation...

I'm not sure about that. If the files serve to different people/roles both
should be kept, adapted and refined.

> Anyway, this is a good start on that. It could be merged as is.
>=20
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks
 Manuel

>=20
> > ---
> > =C2=A0Documentation/subsystem-apis.rst | 21 ++++++++++++++-------
> > =C2=A01 file changed, 14 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem=
-apis.rst
> > index b1ad48bb40..4e886897d3 100644
> > --- a/Documentation/subsystem-apis.rst
> > +++ b/Documentation/subsystem-apis.rst
> > @@ -24,6 +24,20 @@ Core subsystems
> > =C2=A0=C2=A0=C2=A0 timers/index
> > =C2=A0=C2=A0=C2=A0 locking/index
> > =C2=A0
> > +Bus and Communication interfaces
> > +--------------------------------
> > +
> > +.. toctree::
> > +=C2=A0=C2=A0 :maxdepth: 1
> > +
> > +=C2=A0=C2=A0 i2c/index
> > +=C2=A0=C2=A0 pcmcia/index
> > +=C2=A0=C2=A0 spi/index
> > +=C2=A0=C2=A0 w1/index
> > +=C2=A0=C2=A0 usb/index
> > +=C2=A0=C2=A0 PCI/index
> > +=C2=A0=C2=A0 peci/index
> > +
> > =C2=A0Human interfaces
> > =C2=A0----------------
> > =C2=A0
> > @@ -72,11 +86,7 @@ Other subsystems
> > =C2=A0=C2=A0=C2=A0 cpu-freq/index
> > =C2=A0=C2=A0=C2=A0 edac/index
> > =C2=A0=C2=A0=C2=A0 fpga/index
> > -=C2=A0=C2=A0 i2c/index
> > =C2=A0=C2=A0=C2=A0 iio/index
> > -=C2=A0=C2=A0 pcmcia/index
> > -=C2=A0=C2=A0 spi/index
> > -=C2=A0=C2=A0 w1/index
> > =C2=A0=C2=A0=C2=A0 watchdog/index
> > =C2=A0=C2=A0=C2=A0 virt/index
> > =C2=A0=C2=A0=C2=A0 hwmon/index
> > @@ -84,9 +94,6 @@ Other subsystems
> > =C2=A0=C2=A0=C2=A0 security/index
> > =C2=A0=C2=A0=C2=A0 crypto/index
> > =C2=A0=C2=A0=C2=A0 bpf/index
> > -=C2=A0=C2=A0 usb/index
> > -=C2=A0=C2=A0 PCI/index
> > =C2=A0=C2=A0=C2=A0 misc-devices/index
> > -=C2=A0=C2=A0 peci/index
> > =C2=A0=C2=A0=C2=A0 wmi/index
> > =C2=A0=C2=A0=C2=A0 tee/index
