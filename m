Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651826;
	b=1hxwa8dYdspvKU8lxo7hCTbmxGqACFzrPgBdZVXNI48bvVm+vnrg4Isi7Gj2JKNpkjh4
	 TulMQHfvwrcUiEksQ9Sq+vZC5/wlA3Qy4Y11lBRryZS8bIJCaoC/dOxsPJAd4HK50o4RN
	 fB3+EWZcHDkl8D6AkrwnVe8LNkpUpR26oEP04mSaxt18JTapce75qPYaZ3YUBREe+2+y3
	 1SLy1Xdg03KFHT+LuqTUt9CF+6OIfeHeHVcRmeJ5kbmAJbz7sPWS3LLd45SU8dVofzSQr
	 X78M9BTjpYqoupGE0+9mq5ZOKcohZlGmj+DAKjHbNnCTRvAC5lwY806MOL5b+aELFiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651826;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7tBDhDuj3pwAMGa44s5n6XaQt4l2scdObxFiJdiwxyk=;
	b=C2yoWzWXJFu6756PiXJRCUJIxNsJBDCzF1liQkTgVcRKwB2LdrEPqbk9Q10oM0++vGr2
	 CRCmZS9Pi1q0b5YvwAFLWYjgDSXkoaSM3qlSIk6FkXmQlbag90CPpMbe8RoQzuA2o63PC
	 OyDFrPKgbQPkHq3DqmUaClJBIZu9B0y9obV52p+cbsc949kN9AZiucpC3KkNE7iVfHbZE
	 ixnZoPzYA3/I/DBXGqwU4OcLf3qg1WpYOLwLVgZBmT5wGYLSfhuMhmz4cnDGuFpZtrdxZ
	 sXMM5LxN216JwpXeESNT0b+VlKHDXnBSKWr7IaWfki0uodtAxNzI8CYutDtXW1heaLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dsg.is;
	spf=pass smtp.mailfrom=dsg.is;
	dkim=pass header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=X1r02B11;
	arc=none smtp.remote-ip=109.224.244.21
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82727606A882
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82727606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dsg.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsg.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=X1r02B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dsg.is;
	s=protonmail2; t=1794651822; x=1794911022;
	bh=7tBDhDuj3pwAMGa44s5n6XaQt4l2scdObxFiJdiwxyk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X1r02B11dkeaDplxdweECPvGlKg1JM2xrhmHJDpjMrVJo7cUxguycD3CPt1VWKIkc
	 +PuFadLvnD/Bgvjzn4J/fPv5wtl3JJpUkJuIfJWD8H0e3BKB6KYXkL+2z3WgKx5nWV
	 1GXIDnHI8XHtl46b3Ys/OxTUjpnQ/DMKHJsCSGUxoKiZHTxmjFe5cSHbHeDuAidnHw
	 ceCLJ8EIvByJ+7Dvfb5zd3llCMH0ZcTAvD55669OlaZ/4qZ1AjLvw/3gk3fCQL6ZxR
	 SMMLIsO75prhQLLl0mavy33Mxtn45F16fWfbemsEmFnzP4i3JrYgpLZ1W0gQ2GdB8r
	 bCbbn9GYd/mKQ==
Date: Sat, 14 Nov 2026 10:23:39 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: =?utf-8?Q?Dav=C3=AD=C3=B0_Steinn_Geirsson?= <david@dsg.is>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, linux-pwm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] hwmon: (adt7475) Add thermal sensor and PWM provider support
Message-ID: <yjB6Fbqe1FNgQm0q2QmXD6fKwCPWhZ-lnOVMD-gupg3DWK46gsVdy1CRR5PtE5ZuTjKBNyO3001YfjLfO8HzDcKy2SMiwDT3RfX2oZa_t4E=@dsg.is>
In-Reply-To: <02d8986f-64ef-42ee-a440-7c66a48f5801@roeck-us.net>
References: <20261114004110.328050-1-david@dsg.is> <02d8986f-64ef-42ee-a440-7c66a48f5801@roeck-us.net>
Feedback-ID: 186389362:user:proton
X-Pm-Message-ID: ec80071f00155534e877c41c043634fd5beb7cf4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, November 14th, 2026 at 1:03 AM, Guenter Roeck <linux@roeck-us.=
net> wrote:

> On 11/13/26 16:41, Dav=C3=AD=C3=B0 Steinn Geirsson wrote:
> >
> > This series lets boards use the temperature channels of the ADT7473,
> > ADT7475, ADT7476 and ADT7490 as thermal zone sensors, and drive their
> > PWM outputs with a PWM consumer such as pwm-fan. The kernel thermal
> > framework can then control the fans. It follows the ADT7470 series [1],
> > merged for v7.3.
> >
>=20
> I am getting flooded with patches, and I have no time to review them all.
>=20
> Rule change: Functional changes for any hardware monitoring driver which
> does not already implement it will have to include conversion to the
> with_info hardware monitoring API.

Thank you for taking the time to review, I appreciate it. I will address th=
e items raised in the patch threads and submit a v2 once I've had time to r=
e-validate on hardware.

On the rule change, I'm not sure if this is meant for me? Patch 2/4 changes=
 the adt7475 driver to the with_info API. I will address the locking issue =
you flagged in that thread, just wondering if there is a larger change bein=
g requested here.

>=20
> Thanks,
> Guenter
>=20

Best regards,
Dav=C3=AD=C3=B0

PS: Apologies if I'm making newbie mistakes here, this is my first hwmon pa=
tch series. If I have to send future patch series, I will learn from the fe=
edback received here, even if the clanker does not. :)
