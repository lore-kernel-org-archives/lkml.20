Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7086D4A262F;
	Fri, 25 Sep 2026 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356549; cv=none; b=Avg14MqP+T6z6I1phrPCrAtVMxZDfPHcIfD6XopE+car+F1G2VaLcR5zcf2h2YWnTO8AwRQiRoNSLgFJgN0VubdhpPs3obDb+P3NvjoUC8KrDaDMTzpTXOaPvOrZt5vV1XxRS5yMKurcMoVckDSJbhmsDJBzz/DZP3MFzwGSDVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356549; c=relaxed/simple;
	bh=DMgd1xAHI93Ch7Hm492FDFDKqVrLtXpdOnlurPA70eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noS4AD+MhXLgQHZ/gfGkh4C+nWZfl9TSEiNW/rzFhgsS3zEFHpE4DPClx68EpDiw5QXKDKhouvtKKJBIOk/S7vjXZyB9DB+wSO33MbYdQYoAU+LGIiQ0ounBYlehEno6z9TFp9WQ13o3/5EE37eocOhcGSeQl0DGeuRM6kHdLuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqc5Y7d8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqc5Y7d8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9841F00893;
	Fri, 25 Sep 2026 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356540;
	bh=8wrQukkbLvvWOUtbkwn8ZxkTSNRmKfGQ5MVi7iQyHbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mqc5Y7d8JpciDSrcjetG2MsERuGJmWf9V2sE8IQ5qoBatO3pnNgtR3u9vhEAWwLeJ
	 nWyIO6pNuDAHm/Z7iKXO+93/G7c444ZH9LE4CM3vX+fVhuSTOUuizOstlCJZYAArbE
	 6n8E0w7tP5cQbawz0Q8nhNVVr5FfOzyENFqUoEBs8M+2fALSmSj9BhdmIy2b9dYQzk
	 kTFJ6qRZj/VMSFygB7WrvWmZ+cD+ElKSQZMiBmdIAm4nrgUAPmlrRa1eO0wyhMHFYf
	 8NVOMiZDeCgpsQA8CNZvjAtMH3+nYOM8YSfjhdmCsdDOkbSBWph78Kop3rcFAVmnkO
	 yxXngypmG1whQ==
Date: Fri, 25 Sep 2026 18:15:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"rahul@summations.net" <rahul@summations.net>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <a5d0d4df-7e8e-4f12-b011-e41b66efd8a7@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
 <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <ed0c4c67-6933-455a-937d-f5888d124538@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DWHGYh3WZIaCg574"
Content-Disposition: inline
In-Reply-To: <ed0c4c67-6933-455a-937d-f5888d124538@kernel.org>
X-Cookie: Love America -- or give it back.


--DWHGYh3WZIaCg574
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 05:18:08PM +0200, Krzysztof Kozlowski wrote:
> On 25/09/2026 09:14, Joshua Yeong wrote:

> > While the above method works but I'm trying to get the entire simplify to the following.

> > user-app-b {
> > 	compatible = "...";
> > 	voltage-domains = <&rpmi-voltage 0x01>;

> I see. Why power domains do not fit here?

The spec seems to map very clearly onto voltage regulators, it describes
voltages in mV:

  https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-voltage.adoc

I really don't see any problem describing this as regulators, it seems
to fulfil exactly the same role as SCMI regulators, supporting things
like SD slots where the OS genuinely needs to control voltages on a
mostly system power controller system.

--DWHGYh3WZIaCg574
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2rDYACgkQJNaLcl1U
h9CdSwgAgMFKO17AuqQP+TIfWFVvmgx8SAxLdZAciDJp7vUz0+KV+gs7mIAFG/bW
TF5hZ6o+AxJDaoZJB0MNnKwD1icT7bYsDNgD8ofXBZvUnfAQxttR3SiVsb1Uhw7I
BPsnwGkDGg0ma9wokkrd+M3ah3d5i0Doooq05z1mgEeiQOre89STDUd7zB0riO/8
/fa+MTIH8U3+pA2o4MtzgxaEkklWCthmRxSoNknvv6rFPGk7vWm+CNfA5SZaAuXS
k0bpugjYmOHrmrCTvbogP5pMPtmhqYkYAIGtpZBY1FEBjJKO5y97nHiByWEQHVpU
WK4Eq5kaV8sgtElCA0/E0bn5rRGa2w==
=kWHX
-----END PGP SIGNATURE-----

--DWHGYh3WZIaCg574--
