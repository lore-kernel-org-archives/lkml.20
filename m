Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336979;
	b=se9yGb14dp+V3m+FS3/S7S/9J4Qe3SV4JRnpnVizWXH//zTeXXpwtU5sdBZNiZUV5ErR
	 Q8OrHbDzzdm/3BMeINSrd4NtUNgsoO6n/C1QyIBXXl2KnelNA8TRBD7cb1VtUd050w0pp
	 NiGLSo27lUf9hRr0NQAOuS97oT6L1i9Ko/IIWsGOXiiY4fad3PNOGKVlcD/EOBycNXhIA
	 zbkavkMlUqe9EF2vrsbPu/M8EK24MKPwFiQgponPbwMcmB8KG6VPqY+NAPzvrbddwprcE
	 ORrIhiQb8/kpv7Ii42+XrcgtMK5u4bMaQHmiB/AOb/QDEL7ebDcFRtS9VE+Eo599xhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336979;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=USlTfriYHgjlxaXxljcz0E95A2J8alevE3LYvzPAPfM=;
	b=lcvXQVFhthVshxswxwXWsFaJhjRUzFge0IcA8p1MlRYSQIaSjyXT8Ji0smKbTxSo6u2r
	 4FKdHqgr7FJg3MJXluSBw9+AM2KAm0tO7nTptxx9vbW7c/V8pm+48yD7uoqzhmyqi/9rq
	 d4cnPZSwhoE8OL7gYn1/c+H6qh5Ldse+BNSbArCnyRH//7aYB0JIYnMzEwiPjynZ8oXDg
	 RC02arUJ8IFpoHkVKIWFYUodMsVTZ2clxtU8jQftZRdQjF6qjOQS3F8a0AmMMZ2yMNlWw
	 LAfF1BAIoWuCH5Qse4ajAki9hh1lu552k7yse9WSO98IihNWbpzvEMqjc1cFiRkmJvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKiHM9Dy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E75606A323;
	Tue, 10 Nov 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKiHM9Dy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070971F0089F;
	Tue, 10 Nov 2026 18:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336978;
	bh=USlTfriYHgjlxaXxljcz0E95A2J8alevE3LYvzPAPfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kKiHM9DyJ+wZzTye9IssSXbhKCo7btcIMa975u+wCcqaf19XH3zXzjO84TIqbNbir
	 s4E4H1wEg2dbYwQ0ZJrj7aYiXVuqrrji6G5IoJXXSWTLZMqMILf4y1sqOHOx4mak6U
	 GpsF+0B63NMtR8b+wn7yBnskyHuLgklcAJI59GS7HN4igAvhwyG8iTgdQI3fr/ltgX
	 XaeAWiJ8PKJsDxmlObkGKJTiAX3+ubkZx49qEc8Q/P1A+rBwjhM/KC9+E6LNyDPoMM
	 vG2FH74R1mErJI7i7ar9DEhwTyv+qlEiAVy/le3QX43X0Ino5EFEVcpbh4BaKTIIko
	 99uZ48kBAlwAQ==
Date: Tue, 10 Nov 2026 18:56:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pmdomain-fixes tree
Message-ID: <60f76f85-8a5f-4b3e-afec-ab4e69315ff5@sirena.org.uk>
References: <avNHazNbGtMQJ5pV@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxClQKruZyneNn6U"
Content-Disposition: inline
In-Reply-To: <avNHazNbGtMQJ5pV@sirena.org.uk>
X-Cookie: You can't take damsel here now.


--oxClQKruZyneNn6U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 04:33:51PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the pmdomain-fixes tree, today's linux-next build
> (arm multi_v7_defconfig) failed like this:

This also affects the pmdomain tree.  Also, I still had your Linaro
address as a contact for all your trees - I've updated this to your
kernel.org one since the Linaro one started bouncing.

> In file included from /tmp/next/build/include/linux/device.h:32,
>                  from /tmp/next/build/include/linux/platform_device.h:13,
>                  from /tmp/next/build/drivers/pmdomain/imx/gpc.c:11:
> /tmp/next/build/drivers/pmdomain/imx/gpc.c: In function 'imx_gpc_remove':
> /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: invalid storage=
 class for function 'imx_gpc_driver_init'
>   554 | builtin_platform_driver(imx_gpc_driver)
>       |                         ^~~~~~~~~~~~~~
> /tmp/next/build/include/linux/device/driver.h:294:19: note: in definition=
 of macro 'builtin_driver'
>   294 | static int __init __driver##_init(void) \
>       |                   ^~~~~~~~
> /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of m=
acro 'builtin_platform_driver'
>   554 | builtin_platform_driver(imx_gpc_driver)
>       | ^~~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/include/linux/printk.h:6,
>                  from /tmp/next/build/include/asm-generic/bug.h:31,
>                  from /tmp/next/build/arch/arm/include/asm/bug.h:60,
>                  from /tmp/next/build/include/linux/bug.h:5,
>                  from /tmp/next/build/include/linux/instrumented.h:10,
>                  from /tmp/next/build/include/linux/atomic/atomic-instrum=
ented.h:17,
>                  from /tmp/next/build/include/linux/atomic.h:82,
>                  from /tmp/next/build/include/asm-generic/bitops/lock.h:5,
>                  from /tmp/next/build/arch/arm/include/asm/bitops.h:245,
>                  from /tmp/next/build/include/linux/bitops.h:67,
>                  from /tmp/next/build/include/linux/kernel.h:23,
>                  from /tmp/next/build/include/linux/clk.h:13,
>                  from /tmp/next/build/drivers/pmdomain/imx/gpc.c:7:
> /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:25: error: initializer ele=
ment is not constant
>   554 | builtin_platform_driver(imx_gpc_driver)
>       |                         ^~~~~~~~~~~~~~
> /tmp/next/build/include/linux/init.h:265:55: note: in definition of macro=
 '____define_initcall'
>   265 |                 __attribute__((__section__(__sec))) =3D fn;
>       |                                                       ^~
> /tmp/next/build/include/linux/init.h:275:9: note: in expansion of macro '=
__unique_initcall'
>   275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
>       |         ^~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/init.h:277:35: note: in expansion of macro =
'___define_initcall'
>   277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .ini=
tcall##id)
>       |                                   ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/init.h:306:41: note: in expansion of macro =
'__define_initcall'
>   306 | #define device_initcall(fn)             __define_initcall(fn, 6)
>       |                                         ^~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/device/driver.h:298:1: note: in expansion o=
f macro 'device_initcall'
>   298 | device_initcall(__driver##_init);
>       | ^~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/platform_device.h:345:9: note: in expansion=
 of macro 'builtin_driver'
>   345 |         builtin_driver(__platform_driver, platform_driver_registe=
r)
>       |         ^~~~~~~~~~~~~~
> /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of m=
acro 'builtin_platform_driver'
>   554 | builtin_platform_driver(imx_gpc_driver)
>       | ^~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/include/linux/init.h:176:30: error: expected declaration =
or statement at end of input
>   176 | #define THIS_MODULE ((struct module *)0)
>       |                              ^~~~~~
> /tmp/next/build/include/linux/platform_device.h:304:41: note: in expansio=
n of macro 'THIS_MODULE'
>   304 |         __platform_driver_register(drv, THIS_MODULE, KBUILD_MODNA=
ME)
>       |                                         ^~~~~~~~~~~
> /tmp/next/build/include/linux/device/driver.h:296:16: note: in expansion =
of macro 'platform_driver_register'
>   296 |         return __register(&(__driver) , ##__VA_ARGS__); \
>       |                ^~~~~~~~~~
> /tmp/next/build/include/linux/platform_device.h:345:9: note: in expansion=
 of macro 'builtin_driver'
>   345 |         builtin_driver(__platform_driver, platform_driver_registe=
r)
>       |         ^~~~~~~~~~~~~~
> /tmp/next/build/drivers/pmdomain/imx/gpc.c:554:1: note: in expansion of m=
acro 'builtin_platform_driver'
>   554 | builtin_platform_driver(imx_gpc_driver)
>       | ^~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/pmdomain/imx/gpc.c: At top level:
> /tmp/next/build/drivers/pmdomain/imx/gpc.c:503:13: warning: 'imx_gpc_remo=
ve' defined but not used [-Wunused-function]
>   503 | static void imx_gpc_remove(struct platform_device *pdev)
>       |             ^~~~~~~~~~~~~~
>=20
> AFAICT this is caused by commit
>=20
>    d7262971a2acc (pmdomain: imx: gpc: remove all initialized power domain=
s)
>=20
> though I don't really see how.  I have used the tree from next-20261109
> instead.



--oxClQKruZyneNn6U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzaM4ACgkQJNaLcl1U
h9BHxwf/R5EenoofSUuCmkz1Vr34Fyo4uJCGucjKkfttrMOpQ6tfAX5uxnHBEbmJ
PMSuOuQB6ybtGsJXdxaupc9IJeWJAcYhoyTr7Nc8fGDHSkMeV25KOloCJBR7SEEg
Fbmo1l3+Khom/j55Op8ac6bFreUIWqu8ez55ZDO8ZKl9G1xM+PpYLvhEaSfv6VPF
LtM7nAwMkzcd1OKDqn/AaP6mIi0GH3mUaVWgNI14MoGMA4OTj1XSfWqunTZOe53a
tXi1k7NlV5Bk61CBaGwl+t3fqA5B/DlbEmEPIdrjlI2UzlBMsbt6iaJYlIW7x11B
oLfHMum9848xNC53AUEvKQ7TfNU29w==
=Jlnw
-----END PGP SIGNATURE-----

--oxClQKruZyneNn6U--
