Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CBC403EB9;
	Wed, 23 Sep 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178273; cv=none; b=FTpaJeZBDgHbA+24PDcOF5rUAja3NAeTpowIUTCDaNYrU0asTyFwkxusASdt9CBTu5M8vuN5Xjvzj45r4h4YXaorykMclYmcUEcObaZBYn+PIQSwyyoFQD2sSmJkOEnoT2otXRVEvD7MYhRdVUeGv02CK2zgKszyKycItAdJiWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178273; c=relaxed/simple;
	bh=Jj9QL+UbNTS5PSfoDhE2IyaEQhsh6t1d27dLirk2Ubk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9a3r+4uzTt06jGjeYZMoVq0iTiHnNU6pzkEod2SDIy/r26sxDwxSloQz/qHbYSE5/wWyx1sqaoVkWqLeFv5ocVxG7U4ekbtUUe92pyz5uPSS+yCsfJjBRGZrhShbKHlC7hW+6t3bx8h8LsNPQuo/T7JpdGvDJGZADgPENdSpYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCvKnDvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCvKnDvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAAF1F000FF;
	Wed, 23 Sep 2026 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178271;
	bh=9PPxBgUPMs5vchL7SR1fadKjrntsb9RgCKzLY/cjVMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZCvKnDvyFD4Ed5hludzd7plkpUV5xgTorV53CLht/02a3pPU8pxjsaNP+vl3RM6u0
	 HHdcQrXYtJlRDswS+twP65Os5BLKtpUkF0NliYzgprI821NcdMJy4ICi0Vyzz/Ki+5
	 n1f4aAAXIIPaqAuzkYZte48uwP0JSDtUbo9VMn8frp3k0UNWEggB00c8b+uH5t+6mT
	 /b+nrhZH7sqBUiqOVota1eT4fe1qPNYIZ7ZQUoKJvp/Y4Y+OyFw57kNdnnPO6C0ONW
	 TsqtVuNCK4mnlbY5ovdQ9umxwMjqtOuKpkvHSbiM4JQSx7VjoVvL4JZoHzwGDxCOPa
	 JL/cPq7+7qwgg==
Date: Wed, 23 Sep 2026 16:44:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <20260923-strenuous-faceless-dfad20f6b872@spud>
References: <20260921232540.3128596-1-robh@kernel.org>
 <20260922-cheer-reference-c31fc6fb946d@spud>
 <20260923150409.GD27237-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fXQyoIfMWTM8pali"
Content-Disposition: inline
In-Reply-To: <20260923150409.GD27237-robh@kernel.org>

--fXQyoIfMWTM8pali
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:04:09AM -0500, Rob Herring wrote:
> On Tue, Sep 22, 2026 at 07:06:02PM +0100, Conor Dooley wrote:
> > On Mon, Sep 21, 2026 at 06:25:39PM -0500, Rob Herring (Arm) wrote:
> > > Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. =
The
> > > node only contains the compatible string and one register window on t=
he
> > > local bus.
> > >=20
> > > Assisted-by: LLM
> >=20
> > Guidance to the LLM should probably include including the reason that
> > this is being added to the commit message.
>=20
> Not sure what you are looking for... I told it to convert all the .txt=20
> bindings to schema. Then I told it fix all the errors. Then I fixed some=
=20

I meant that it should say something like "Add schema for ... node that
is undocumented but appears in the ... board dts".
Otherwise this seems like a completely random addition, other than the
submitter being you pointing towards it being cleanup for undocumented
stuff.

> things throughout the 900 commit branch upstreaming things bit by bit. =
=20
> Then it mostly sat for a year and I told a new model to review them and=
=20
> fix these common problems a, b and c. Then I said fix all the=20
> dtbs_checks warnings on arm64. Then I said there's still warnings, do it=
=20
> again. Repeated that ~10 times. Now I'm going thru to weed out all the=20
> wrong and sometimes unnecessary changes.
>=20
> So LLM did all the easy parts and I did everything that requires any=20
> judgement. The hardest part is typically just figuring out the=20
> correct maintainers...
>=20
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++=
++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/h=
isilicon,hip05-cpld.yaml

--fXQyoIfMWTM8pali
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarPz2wAKCRB4tDGHoIJi
0qo5AQDoHJLM3dY0FK4aNlll5Vp276wV+D0l/vFY92imoN9xJwD/S/lJE2a7bcHD
Q7vOIv9sEQqziJ6J3fePaQYs5nrnIw8=
=v+dZ
-----END PGP SIGNATURE-----

--fXQyoIfMWTM8pali--
