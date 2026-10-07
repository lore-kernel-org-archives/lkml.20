Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073A46A5E4;
	Wed,  7 Oct 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368700; cv=none; b=hbQ0ioCdNg73c3M7sr+A90P3dQaNXI+I0AqRmZodeG85xBTolj7OZOmcfwdMlXz6fU4vasyr6PizZ/mW+V8f0QT5G+dER5WQFxTFAApwzdejAJ8pZkhrW0MMgOfxijvV2ja8KaQyoyzoJZLCA0ddn+FWWA809mkTb/aeuD1apL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368700; c=relaxed/simple;
	bh=ze0pmdyjgRkCyKL63/qNmZFz4TXiGAoe0p+7PuTHRUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkgfxceqC0PSCvMHsO7dbIS/OjWjuCq+zAtMNzd7crwR1vWJBdenQblsdLZg2OeAoJoor/saTG5a16Ubq96CSAkqcKMIlHt/yKya7PE7HQ/813UWr8aUPobbOfu/KluoniNnHlg0x9Pot9YDDrnoV4akkEbwfXDHUzsott3nBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1nGPu37; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1nGPu37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA311F0089B;
	Wed,  7 Oct 2026 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368689;
	bh=ze0pmdyjgRkCyKL63/qNmZFz4TXiGAoe0p+7PuTHRUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W1nGPu37lAD4iItWp6ybwSb8RRV+U7tivGsueqB9V/3uX0Yllqhr4pClwfJJom8Sx
	 X6fnvOoz8cRWvl7/DcBQqiJK9EfwuVItkgiyQRfbPb4wkWoeYYnDo9D00uo+XQvBw5
	 hUZTy1dETwUaOUi0S8VxNoOuFTCbs4AO5OAovQ+TqzS2JIF5xl/KB0k6Yj3cPPynqQ
	 BsLMCaKOQRZL+sYj8VXFFKNz7OgCp+SpG+1AUaCjKEM4U3y5aTDft4vZJrAZHT7uck
	 4qkEindwnin+landYxYv6CJqX/fDJiA0SDcA3zUGFc3O5edr5IfEmSVcm+jwtnuDVD
	 l/GV+yrgFlFIQ==
Date: Wed, 7 Oct 2026 11:24:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Subject: Re: [PATCH v2] dt-bindings: nvmem: st,stm32-romem: align
 patternProperties regex on nvmem-deprecated-cells.yaml
Message-ID: <20261007-4fcf53de5de310d92affa63c@squawk>
References: <20261006-stm32-romem-v2-1-f2e156f563c6@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t/M3KmnA6P0SMj4E"
Content-Disposition: inline
In-Reply-To: <20261006-stm32-romem-v2-1-f2e156f563c6@foss.st.com>

--t/M3KmnA6P0SMj4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--t/M3KmnA6P0SMj4E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYd7AAKCRB4tDGHoIJi
0oD6AQDxIkvzHjhhwqIsfxRcu6JCKsbMB7R/GDV1eo6YJsPa7AEAyHY+0PgFGMxs
66DEyMYgv6Yx6OHyapOhZAnnCygmIwU=
=cNUN
-----END PGP SIGNATURE-----

--t/M3KmnA6P0SMj4E--
