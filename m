Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBAA37F015;
	Tue, 22 Sep 2026 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100156; cv=none; b=Qkn+TZX9pupQBLjfAfOgivnQJdgOGiex/QZPyS8k7xMIV8An8Pqt41t5bwk1ufH0s9S+3/O4/asCFMTkph5xpdXVlDXbOEMZmESHSNw5noKIt+i+BJe7ePJSayZZAsBQ8PPtBzuWKfZ/QqYCsYGcUiH7+8Gee7CC+1FifJWBOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100156; c=relaxed/simple;
	bh=kiRm91eADhRlItadzKUsnklTObgZag5rj0w+ua5sdSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASOo14mUIxZsqkR/umenrrk1jcd0gegShzFXSsSnptb1vMcKGKfyoHcPV5CmLCqYStBnduHT/L5icFCuMfKExrApRUeOhMMvCR+CW/HAgyuqbzFg002pJPBFH7SLvrUX6kLH8kDOJREDAzDE4qpEOB3ExFV8l9seJJd1Y5f7fEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIsaj3QV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIsaj3QV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DAA1F000FF;
	Tue, 22 Sep 2026 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790100155;
	bh=kiRm91eADhRlItadzKUsnklTObgZag5rj0w+ua5sdSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIsaj3QVJ9UrqcZwb/OzdQ16XbS6kEp7k06c5LZrTQZpy1j71A9b/Af85Oa1kb6W3
	 meHxOhZdrSmUxJma16XbTGX9R5J2tUbeHXxkcPGyi2lolG6wUpheAibaFAyNnO+O7k
	 mBfYd8JUeqBFk2kfZysM6peaZmZYd/yVfVRdG22viDZf5ZzxxLskhR3v2x/ICYFLpU
	 Qd9QBj+lrTMAXFnLxklVSNl9kDfJ4ue9CtKV6sVeiCIqWUGlCMXUglj+8WXJbj7W5a
	 gQfzpMheVgzLqlDecdlrnEXIhQPTLWPUzkWtbg4eX852YN6sHzXyS0eJU7BcxkMpsT
	 oPt8Re5Xv5xYA==
Date: Tue, 22 Sep 2026 19:02:31 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Rosin <peda@lysator.liu.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mux: reg-mux: Allow zero-cell controls
Message-ID: <20260922-overeager-cannabis-00d53cb1b9ac@spud>
References: <20260921232617.3130745-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7JP1fcXb9s065aVP"
Content-Disposition: inline
In-Reply-To: <20260921232617.3130745-1-robh@kernel.org>

--7JP1fcXb9s065aVP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--7JP1fcXb9s065aVP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarLCtwAKCRB4tDGHoIJi
0simAP9MSVTllvOw2wGdj+F8VPLxDlfJFkp/5dkpXCfKyHxx6wEA2gT44Y/PBjvV
GABbp34R5UBtXA/6dYNOHi/o08LwTQI=
=ZMRb
-----END PGP SIGNATURE-----

--7JP1fcXb9s065aVP--
