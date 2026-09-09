Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD13DAAA1;
	Wed,  9 Sep 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948181; cv=none; b=I3yBBG42vtHZ1UPBLqCCw7vOZCByVzG1v+ZBonu5DYcqFAuX1Dj/C7mtuy4fNloi0wvEYwcgWWmLxqciprxmIKQzNMX7WngNcMI6vmjXBNrl6juX+xN3bte1Buua7fl5aONP0eh+H0Z1hReGcD1c6lrkN6CvqwhHKb55QmX5rzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948181; c=relaxed/simple;
	bh=EVsC7YNIyV3XddxWdZtfOvFrWEPTDs5tjm9Ewwpx0Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN0TYYsPIB2lXBIn3QZTQycD57OEf/rF6Q3XuMQMij+PfPE2desNyj0ZM1ru0r4VSoUT0JE/nJQjDPIBqM6Soctw/C5nE/9ypYzy+VjsOPTn6DTHCGVFd295Y+w1ct4D1EMP648HYomy4SL4FMCdO02dE9grNtM8/BvpRlp+ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hX5tVD48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hX5tVD48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E231F00A3D;
	Wed,  9 Sep 2026 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788948180;
	bh=qL5v5lQdZldPAbLm/+TpEkR7SMK04/J+TrzXP5wZgHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hX5tVD48XCtUCVXCRL5G9+dGlaiLOYwvKuJ4NPg+7iYrzwq4NCV8g6oaBxe5m2yMg
	 YFzqWD19PJoZBRAvWrNqsHYPyobZWghyBI4oMIm1QU3dacJS6Anoi+7fmzTp+TZSDD
	 hJnr8MoHeZwP3ui0gZeUFrEdNwfw+lYeOr0o3XK9Y1Clx1cqeDjv6nu78+5S+8YRH2
	 Ooi/ot9PfJ1faexvtpbohSFlvFk+uJZ3KMwBK9dBfzG3h5xeF/uboedCwEtDbJWcgg
	 p3Kz+K+d4PgpQQZ3/qh+rfTRqNCQZjsE1nKxIvl7fyJg5VqIosP5HD6mug4nRDY9PM
	 iw4Y9KYc8sJyw==
Date: Wed, 9 Sep 2026 11:02:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Message-ID: <aqEuyLac2OGkSYX7@squawk>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-2-jm@ti.com>
 <20260903-sandfish-likewise-820d64daae2b@spud>
 <9e72a269-1b19-4c60-a32d-8f93c499f205@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="msDbi5syonYINgjJ"
Content-Disposition: inline
In-Reply-To: <9e72a269-1b19-4c60-a32d-8f93c499f205@ti.com>

--msDbi5syonYINgjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 03:28:47PM -0500, Judith Mendez wrote:
> Hi Conor,
>=20
> On 9/3/26 13:00, Conor Dooley wrote:
> > On Wed, Sep 02, 2026 at 05:27:57PM -0500, Judith Mendez wrote:
> > > Add ti,am62p-efuse as a compatible string to the uniphier-efuse bindi=
ng.
> > > The uniphier-efuse driver can be used to read AM62P efuse registers as
> > > well for GP_SW silicon revision detection.
> > >=20
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> >=20
> > Why is a fallback compatible not suitable here?
> > Either it is, and you should add one, or you need to explain in hte
> > commit message why it is not.
>=20
> Do you mean the following? :
>=20
> compatible:
>     oneOf:
>         - const: socionext,uniphier-efuse
>         - items:
>             - const: ti,am62p-efuse
>             - const: socionext,uniphier-efuse

Correct.

--msDbi5syonYINgjJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqEuyAAKCRB4tDGHoIJi
0kbTAQClPJISrFz94rICYGVYujAIAlIPpO10JQHDUyUxLH6E1gEAqYmy4Hgv2dII
OViZOLP/U00zE82DsFTWQKfQ+vKrhwc=
=ARD7
-----END PGP SIGNATURE-----

--msDbi5syonYINgjJ--
