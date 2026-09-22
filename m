Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1E40B10C;
	Tue, 22 Sep 2026 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064581; cv=none; b=UjBvV1uKFuvcyJuxhsaXo2Yw2s77+QYAus0SuJHqfRXZhyzTrn7C1GNNTHTI9HYTDPc2Dyw0SFQh1MlD+CKkG1lxQ6ksaOyPNT/9J0DdIBUg0GsNeAYQUh57DXnlXp5cm63KP4sYvK//4STa//DgdZwVY1YW1+OTb9yR5WHJXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064581; c=relaxed/simple;
	bh=Dz9IwbZu3OKgYqy1hNfLGMSmOzUloJte22ImO5hx94M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7jQfshOHhn488qVYURCTtmvCSC3O981QDfTSqAXN+OYlM95GZJDsN19VJnVNMF+hHojAKsBX4nbwkPVBr+zcB+9M5CQ5mtOUB9x878SiUt+Na6XhwFe+ghUd6R9lZ+UUc7sCvo5OIPSt0COODeI58LOni/FJo6C/vkpX1LOp2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZbbCPoT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZbbCPoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCF51F000FF;
	Tue, 22 Sep 2026 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790064548;
	bh=OrvI0lS5iedsIuWwFJtRVpqvsYUQdMp/dmyITNGxSg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DZbbCPoTSBcurUYk2bz1VDxkNWDMV02RvhWrWaiMNpPz6ljb/j9YGOTwoSVab/b0a
	 N6G9FFCwypeOzY92+k7EwJLGDxA4l1FrS/oE8wrhv5oT19CwwEJzHzGyleT25NEG7J
	 QragPj5OgzHOHobEPQY28YnPMIUb3mLuULNFeKa5LUn69I2dhr/faKLe+JTiWXicwF
	 VdXenJ3YXYc//eoor40OzvZ2yBtIdA6SG3/zPi6aKuDJuB4NxtqMx9C3bOt9uLsJqO
	 dZcqz3FayH52g5YJkxpReTDqATZD3kUvaiaovKoI9t3mKoGCPEtOJ7484u3md+1eyj
	 AGnX/+OzQnHNw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 44B461AC56A7; Tue, 22 Sep 2026 09:09:05 +0100 (BST)
Date: Tue, 22 Sep 2026 10:09:05 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 05/28] alsa: pcm: Remove the qos request only if active
Message-ID: <arI3ofru4is-jDF_@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VcZRb/AbZTZ33dvh"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.


--VcZRb/AbZTZ33dvh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:44PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> Fixes warning:
>=20
> [    8.502802] ------------[ cut here ]------------
> [    8.503445] cpu_latency_qos_remove_request called for unknown object
> [    8.504269] WARNING: CPU: 5 PID: 2790 at kernel/power/qos.c:322 cpu_la=
tency_qos_remove_request+0x48/0x98

Do we know why this is being triggered?  It makes me a bit nervous to
just shut up a warning without an commentary on why whatever the warning
is telling us about isn't an issue.

--VcZRb/AbZTZ33dvh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyN6AACgkQJNaLcl1U
h9Dq1Af/Rvn6BWUaXoit9+fIWsqMQTQahObIGVt9y9ZaK4eU5kRQZDy4XXcqXGj7
guQpBstVggAYk0rrNXsGwPkKcibW446LRRrT5dPYXr5XMXcz5S7UYFnOZQrP41U/
nJwjC5LLzJZkCcogV8Y+UDBda2ny2XMHgQYHFaRYRnVn0P4cfCckgTPbqRBNT9rd
mJDM0h2B8n1CNvoAKxL8NJyozqmtO/u+M9ks3TLQ7rRpP0BhngvBEFQ3L8/auQm5
9LThLXY908JZXJUCDVmT9OxhQk57RbY6tnXZ6QufWM2LvVG5BcQplu/maBqwSTVf
bgv6QOlSelzI1sx1m+fvlFPwkh5NTg==
=v+bB
-----END PGP SIGNATURE-----

--VcZRb/AbZTZ33dvh--
