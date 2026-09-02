Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665338423B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364118; cv=none; b=l1G0nKLqG8JY/JmQOmHozBOhwYdna8AMqmZlXxI3N71Fi7dZ5GSS1QT8FKoW9XG/Df1IXCzfIuu+SbxJOCqN/V6qN956u/C4VSlceopMIBajYp3AryZQ9wvdK+CLuqMJMNb9yftLBOVRrryRZxiAczjRtGb6KAnoqh9UUeAOxfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364118; c=relaxed/simple;
	bh=FK5r2VJ7dTfRTiRnjWhz/gfkP8J5XQFW/3hUXfbZKxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls+oTGhJnbRiYdCWlI1RK2elS2GMO1H90CQ67/AlXaUsHpa9VJzhKsB0PYmqrkDl9w2HJWVecVdu0nl8ATAcJ8L3mLJMZE9fCsxklGdfIwd0fIDYmLspmnnJAqa5Y4/e+k64cm8Wbcdqcx/LQ8FF3k0DUcoCbTxk8V8LpUfXJEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+sfTU/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+sfTU/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041761F00A3A;
	Wed,  2 Sep 2026 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788364116;
	bh=iCMCHiLmbVMniSbQUlMNA+V3bAjUJklD1qAmp+/qYlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K+sfTU/bdKV7tbSxo9A8Qvb/hrMUfXLZ+p0Lqxgw1AbeT8wx3l34D4kGf0ZXFYESO
	 VzpPMjBzALVfXkit8eFsIYbsdPO13d6AGvIRJJf0haScGzLti7Jyrt5G+Gva2Dq0eG
	 /2Qa4Z/XEn7/vAy1/4Li36EICXXMvuyXiF/kerFMhCC28sy80FAMXeXhjZ/RKsM0pw
	 il8wUeUnz8dINDbUTR7wMrJsst4tm1QX6sFk2gCdfdeWodYUFxdD+8o9yDIZk0Fwf+
	 1SFWycQC02OX22QY8cB2VniYSHER+wL1sSD+n2CPrJGgPIhzXIz7WgdfnqImO4yA9f
	 vbeXGhIk13+zA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 6652FCEEA72; Wed, 02 Sep 2026 16:48:33 +0100 (BST)
Date: Wed, 2 Sep 2026 16:48:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add optional vcc-supply support
Message-ID: <aphFUThYNg8JYtEx@sirena.org.uk>
References: <20260828-rpi_reg-v1-1-1066b1f68630@oss.qualcomm.com>
 <e4bf36d0-3f4e-465d-b4a2-626d5a5ca887@sirena.org.uk>
 <apUbsGi1COlopxb9@hu-ssmaurya-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZrSFiA8PmtPM4ic7"
Content-Disposition: inline
In-Reply-To: <apUbsGi1COlopxb9@hu-ssmaurya-hyd.qualcomm.com>
X-Cookie: Orders subject to approval.


--ZrSFiA8PmtPM4ic7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2026 at 11:44:08AM +0530, Shashank Maurya wrote:
> On Fri, Aug 28, 2026 at 01:13:42PM +0100, Mark Brown wrote:
> > On Fri, Aug 28, 2026 at 09:59:43AM +0530, Shashank Maurya wrote:

> > > The Raspberry Pi Panel V2 regulator driver may rely on an external
> > > power rail being provided through the device tree. Add support for an
> > > optional "vcc" regulator and enable it during probe before accessing
> > > the panel controller.

> > Does the device work without power?  A name like "Vcc" makes it sound
> > like this is the main supply for the device...

> No without VCC, regulator will not be up. So device will not work if
> power rail is software controlled and  not always high.

That doesn't sound very optional then.

--ZrSFiA8PmtPM4ic7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYRU0ACgkQJNaLcl1U
h9Dk4gf+O83b89s65r3rZ0a4tSXFuaFkUUauruKyMqczrJBsezye262PF4urkn/W
bPmKXZ8H2GOkY1NEFas7vkX+IesJNLvcs8coEDifJ6jHxP9oVEXzkSchzT7aQCJi
0wNx5o26ilHGMsrsBx8YwXOwZKJeSGbuSMvTvKkNfDvQ7ZGsxr2xEyt/e4oJyvBC
g/u7VWqgoO87Pg/jZ9iuYk+eRa7G98l+77Yvrf5u9B8RLcJH6Wp/t4ym0aREgaLj
u5g28RuS73khOjL7ilRCL12U1IqxGMjvU2Fj/2SCReXEWlYBYP7QmB8IOSxuMk07
y1ISV6EkarE/g7/cE7cP6SFHGggSGQ==
=4lJK
-----END PGP SIGNATURE-----

--ZrSFiA8PmtPM4ic7--
