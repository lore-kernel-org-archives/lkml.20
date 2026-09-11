Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094730F92E;
	Fri, 11 Sep 2026 14:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135530; cv=none; b=ZKk/0EuuwZNZoD2X0tri5YswRN4iD/cPomul9aCdkXQOHctaYoD8yvcGyH9R98hpizj6TuNIekCgxMfHcUiuFLWzYxZPLb4j8BCa9tqC/OX8FWTM7pAyEX4ypO7LOxAMU4hhO6nBAL9d6OmullHmxICsNx0KglDYYZkX58sAclc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135530; c=relaxed/simple;
	bh=dnnPP8P+q8r4eEm8AUNtq0yD8aIh7c+f9n6gFPjXE1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr9bj1NkN+vX2SDBnqpexC6BeEkYIRW/7OdYaTXZHMDKWHKKwiVSPucutG1ypyXD2ZqP3vZ8wTBIouq37W9+eAIKvjQjiDs753e2xuh7PNhgbF6YNFsvBAtnnej1or4euaPWpQoutvsTFvE2mt0isybxxQe4l+inzaCSw3/bQFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acnVdEkV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acnVdEkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD811F000FF;
	Fri, 11 Sep 2026 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789135529;
	bh=dnnPP8P+q8r4eEm8AUNtq0yD8aIh7c+f9n6gFPjXE1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=acnVdEkVuThQE19VWE8qs29kb4yY+tjGc89X+BRrTO5KYsPRGaDk8A1v7uSCCMCNS
	 dL2veHOLqdLE1ffIVclAAjG45nFILvKIoyqyq/qPcxRroJQi0EQCc4M9DaFMdr+NYe
	 w5zPL/idStCoSPAZ4DFyrlN1zV9XlInwc9LNKKseI5TwzNoR0Rcw3hp5b3p5ePwTYP
	 7Q9t4ZAKangv/zmfwzTmoiA3O1WV8enbxVwJ1GSUavGvCXIOmH5o0oT/R+yK0iSjQu
	 5fAZTRcu1vj8AiQbut7rjXJavMzhB0sRYk8So+xyL/8DCfP6WvrVbWb3DsQKU4L9bd
	 wRLbz87TFUmKw==
Date: Fri, 11 Sep 2026 15:05:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
Message-ID: <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CsyL+oqxIPiQycsV"
Content-Disposition: inline
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: Close cover before striking.


--CsyL+oqxIPiQycsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 04:46:33AM +0530, Mohammad Rafi Shaik wrote:
> This series enables the Shikra audio path on EVK targets by adding the QAIF
> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
> board-level sound card wiring for CQM, CQS and IQS variants.

> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
> prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
> prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
> prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
> prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
> prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8

As I've said before could Qualcomm in general *please* stop sending me
things that don't apply.

--CsyL+oqxIPiQycsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkCqMACgkQJNaLcl1U
h9CvkQf/WVf75ELNnL0po+kiE+dtlmS7JEAUcKTCkgYzJtKLLCzQwlIgguNVzIfw
AvQUi0oXqqGW/NpUBeo++WsHSZX4ZG8omuvBkd4ZGvFjqUz5LfovPTHxoJHNyOg+
GvTje6kc6iuMlWjYI1p38qzYm91OCZm2i+IDScIMe8O6d7y0EcItV4ukVAq642IG
sRIdWwcZ0XIJqsYCPoA6N59XIyfPiHgBG34q5StwByT8bOIjAXI9nt7TTQn1BZ6Z
l9yB3BQLVfN1r+JeAiNVPN1EcUbscXysLzw8St7AARODtXSjd56aooIR3zXzjgSZ
PyYYquCYBk0BqjWBT0pICOn3M2+WTw==
=LEao
-----END PGP SIGNATURE-----

--CsyL+oqxIPiQycsV--
