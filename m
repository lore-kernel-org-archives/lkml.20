Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C234449363D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099095; cv=none; b=hYf6S9Sr3hMbvkOBf7QYMrtbL4kJ6Kz2W91Fgx0ZBLtMq03dVkZKS06rk59C0WLw8ErlfyyAAdf/Dp0pLMoot7lPnTYZUC5jzoB1kSob3VmXtWs9AGDmrcWMfG9f4e1WA6B9bjkuKZtV46W5lMmgHVL0I4SSTVDceyZD3uWKaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099095; c=relaxed/simple;
	bh=83MLyGfV12OVGGbzvXQozbX0iG5IYp9QKh1Z0+U6jBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUdqFJvb0Ij/YhDkSNJlnywaf6MNrlchkEUwUnsKxJfpvD/5YKQYIShK65Syag1vCd/ZOpAAH9Ar0Rz+qgO6OxX36/CLkj7GN8fJBe9tBjqzRhz1KUx9bjGvQcy3ATAD8eVMcB9aFiSR2l7bC9OBPzc8xi8Fu/LRQoizydThEIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5YouK+L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5YouK+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDB91F000FF;
	Tue, 22 Sep 2026 17:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790099093;
	bh=fHsDjD4HEnDfc1j0yhiHjhL6iDP0YYRM8BFcfB2SjE4=;
	h=Date:From:To:Cc:Subject;
	b=l5YouK+LufSegc45NuR+xvi3p8Eeom8GvA49cQRxmvlRbpnF2W5hWSHHRR3OuYTop
	 2wDYsBl5TXdDErVyFfp8Y5cBRuQQ0rQVkfPfzpvR2IXXAfmgFtfP3bBv8ommRQNhND
	 I9DJMY4MYFxP+C57GnqXuyaABe6wkhugFqbD+NNlk+s28ufqxlhjkEGENmvYsG2jgN
	 2lHOfJMT1pfM1m2LnzsrJgw4oAb/IW2MnRxXMPs/jUen93zFyCM2m03zWDgjT1ffOY
	 /kaBtsnrWncnt32GSf46ut7kGbv5FHbjltWDHI0ApbQbO6ZVl3TN1Rhydw94bioCpA
	 u/OcY1nCdSpCQ==
Date: Tue, 22 Sep 2026 19:44:47 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jon Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org
Subject: Number of bugs fixed in a release introduced in the previous one
Message-ID: <arK1nOp3vgqk2MvG@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thcczflik6w4raip"
Content-Disposition: inline


--thcczflik6w4raip
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jon Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org
Subject: Number of bugs fixed in a release introduced in the previous one
Message-ID: <arK1nOp3vgqk2MvG@debian>
MIME-Version: 1.0

Hi Greg, Jon,

I've compiled the data from LWN as Jon suggested me earlier today using
<https://lwn.net/ksdb/releases/v4.0/fixes> (with the appropriate
version), since there don't exist any graphs for this data.

Why I'm using immediate fixes and not all fixes is because at the moment
we only know how many bugs were introduced in 7.1 that were fixed in
7.2, but we don't know how many will appear.  To compare apples to
apples, we should compare to the same information we had back then when
for example 6.2 was released, when we only know the bugs introduced in
6.1 and fixed in 6.2, but not those fixed in later versions.

Here's the data since v4.0, which is old enough:

	Fixes in a version for bugs in the previous verion

	7.2	279	*
	7.1	253	*
	7.0	276	*

	6.19	236
	6.18	229
	6.17	245
	6.16	241
	6.15	169	-

	6.14	206
	6.13	214
	6.12	244
	6.11	230
	6.10	208

	6.9	278	*
	6.8	241
	6.7	193	-
	6.6	245
	6.5	210

	6.4	216
	6.3	221
	6.2	240
	6.1	243
	6.0	265	*

	5.19	236
	5.18	228
	5.17	237
	5.16	256	*
	5.15	229

	5.14	258	*
	5.13	227
	5.12	218
	5.11	259	*
	5.10	254	*

	5.9	243
	5.8	267	*
	5.7	241
	5.6	242
	5.5	275	*

	5.4	215
	5.3	217
	5.2	198	-
	5.1	219
	5.0	232

	4.20	200
	4.19	171	-
	4.18	173	-
	4.17	166	-
	4.16	203
	4.15	186	-

	4.14	197	-
	4.13	164	-
	4.12	135	--
	4.11	167	-
	4.10	167	-

	4.9	153	-
	4.8	115	--
	4.7	126	--
	4.6	91	---
	4.5	93	---

	4.4	85	---
	4.3	103	--
	4.2	66	---
	4.1	60	---
	4.0	53	---

I've added a '-' next to those numbers below 200 ('--' below 150;
'---' below 100).  I've added a '*' next to those numbers above 250.

There seems to be an overall increase of bugs immediately (next release)
fixed since the 4.x releases until the last 5.x releases, and it could
be due to any or many of:

-  More consistently using 'Fixes:'.
-  Having simpler code, which allows finding bugs earlier.
-  Better testing.
-  But it could also be due to actually introducing more bugs.

Interestingly, the number of immediate fixes decreased from 5.x to 6.x
(but not below 4.x levels).  I suspect programmers didn't stop using
'Fixes:' tags, and the code and testing was likely not worse than
before, so this seems a legitimate decrease in introduction of bugs in
6.x compared to 5.x.

However, if we compare the 7.x releases (those with a notable increase
in LLM usage) to the 6.x releases, we see the immediate fixes increased
again, and further than in 5.x, as we're now consistently above 250
immediate fixes in all releases.  It could be that LLMs use 'Fixes:'
tags more than humans, but it could also be a trend change towards
introducing more bugs.

It would be interesting to follow this trend in future releases, to see
if it continues to be sustained, and if these releases are indeed more
buggy or not.

It's still relatively fine, though, since it didn't skyrocket to
something like 300.  The increase is only slight (at least for now).

Another thing that keeps me worried is that the bugs introduced by LLMs
tend to be more obscure (since they are meant to look like legitimate
patches), and so their discovery might take longer, in which case, the
situtation might be worse than what we see here.


Have a lovely evening!
Alex

--=20
<https://www.alejandro-colomar.es>

--thcczflik6w4raip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqyvogACgkQ64mZXMKQ
wqkYKw/8C14n7WS4fduIDk1bcDp8mh7GfoFgXuOFFL+Oys9RZGy0pv/O3qUVGSzA
ScytA6MzhUYZSgX3pMnp7BEC/Zo7mJ7zmfTVU+f9wpZSDfBfNovyPlaPdCODHpSP
3ddMT+2PzzYImExOeXzZ3POuAVnEvm2y8uAE2yyRJyYw6jHuH4PhE7/sAj6m/TP6
A9WkQ3LatFce/v0g/5hJ+7iVwQCDqxL3C/7GVZ3wbIHMPJOlFJZDAolih7rJXN/f
P+l/ccXao72jdukwS7wtItxuqYfCDRoajwt4EKbT8PX+4Zz6pMaNXjUy9+RNob97
FjhDssIbWNr8zlQCX1HuUhl/vbMBjuH/UgRIjZ+lWeiPr04Q13TpS5XxW7NtH+q/
gPFbRDaqnvzkwWgvXdC88cQ2FdgYTeJWP4zHl1AiDqL91iqCbgPsOWzII4NZNWYp
oMmZPrxg77VCMnNlB1ddSwspoqIlUlvHe227Lka68jGXbl8mqXwt5An0QwtOC41D
PwptoVHyTPSUZyfuk3E0h49zccr4KnKVeiCKyDptWZ9tSiXZLY7/D0FqWHHB+7yy
/GvFmBjpGOF6+NT4Gx/QyWoh16Iv/GBDV7Z0KwFqRU/VvwjXb2tEED5KwXthoMBl
PlkuhiQdv288ppmjqjyx0oBext5ZkYwzoeXyU7denhH7nMmB62k=
=68G5
-----END PGP SIGNATURE-----

--thcczflik6w4raip--
