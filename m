Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA823A83BF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723580; cv=none; b=FHopNqX55IdK1rYZS0+HqMUVRHs3u0Xqg7z0p0MtE/V1H3nLqD+DAILyB60E7l5g3XoutqtSNwqS4f5UK1vFG6prda5uyBBycrqUmM6EiE1ddC1VHViRrkb7kTo6+cxAIcB1kOV4o/m77x6elxHoEEfB39HRyoRd727lBtF/pLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723580; c=relaxed/simple;
	bh=MGxK+rUoCEf06oKRRreaFfQSmzq8OzXEABAVt35UAmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVZj4dv7znOypJ+EsBXE7EQkc+ecj9hYMFlF+pUnnsx99Es3ggxqioQXS7CJtp+LvjjHAsOgBxU4Ms1a8M15DKBxKonGwoxTUO7paKUYxmOJ81j1LUCRcjHhEyOAHGI+kX600bQGoM4jZ63gqiwVjYv5TZIyy03NMamOfLHp07s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTPAXqIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTPAXqIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE141F00893;
	Fri, 18 Sep 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789723579;
	bh=GyJ/Izgdsqp5q8EJHvMUjjmksB1H1LTha8OAdEwdi4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dTPAXqIMzE3zycBsqWLtnKbfH7UTA+wPBUSmm9FVCgnVlZS+cSZ4kIBteBFtOZPSX
	 +JIZmqWQf2EyzXBct0o+IRtlpZwSgI8HpNuoofjU7yff+11zadzIkhTCyVlVHmSZge
	 KieiUkq6Twe3H44uy4Y3WTIKX/w07c8tTELWSBCzXTj7JY/up3OsVdsTCQCObX7Oc2
	 95yXJJvKNyiq2jq3l0VGR1HtrHNLkAtyugwIYgazb9PH5Ool0INnJ6Y+OLH6GiUFdk
	 ROA2JKb/JwkCqoKgNXqt/gZbbsFEldDNCHkiWrvXDe0Q0bnKdtzBesW6uD7pUDzfAs
	 EdU7IgGBDDYFw==
Date: Fri, 18 Sep 2026 10:26:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Message-ID: <f034927d-1907-45b7-ae66-a10989116ce8@sirena.org.uk>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
 <20260918003722.2764284-1-justin.yeh@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bTlqMwmTvtaxM+Z9"
Content-Disposition: inline
In-Reply-To: <20260918003722.2764284-1-justin.yeh@mediatek.com>
X-Cookie: Dental health is next to mental health.


--bTlqMwmTvtaxM+Z9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 08:37:22AM +0800, Justin Yeh wrote:
> Hi Mark, Liam, Matthias, Angelo,
>=20
> Gentle ping on this series, sent two weeks ago:
> https://lore.kernel.org/all/20260903062056.1024263-1-justin.yeh@mediatek.=
com/

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--bTlqMwmTvtaxM+Z9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtA7YACgkQJNaLcl1U
h9Dlkwf/YJOx05NeMMpnlsAzuP7wfrP9ZAT8RAWV4CBWBbKzL922YZOLpb5Ei+eB
Z/xbWC1awCG/N8+oWPgkNAm23hoftpLU8X3Q1oYIBbznNydS8ietdFfibILvPa6/
FrFFyRkzX15QOAMC1OybDghDiPydNv52kyfmBrL3/qM4tDEkUJ5hY8iRTJGz/wKg
nUZBbd81D14Yyf8huMaCaJ6d3i700e47eNMiGvIMNftQ/Ys9U0PIwE++tgvDLyp/
riInpbgojfvNkvvWDS7RFGeHfutXfbFVXS4lq53Httz4RU2I9K/4UAt3RqgUesmi
NZHxugQUq4Er+7UhhPDPUbnnjlmOtQ==
=uW80
-----END PGP SIGNATURE-----

--bTlqMwmTvtaxM+Z9--
