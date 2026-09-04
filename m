Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D43D47DE;
	Fri,  4 Sep 2026 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538032; cv=none; b=TdM5ZwYAK53lNV4foDM6TC9VfwvRZkHsh+H1tBzxtykOWMqswFt3Fm34Of3Nk35QTSeWaoI2PoPD90HNTgCy/r2qnCX/+haCoKKxHJvR7l9xU0Xdrh7k1a6lLxA+GaFguulW8cuyGRT7MoGBWPvF8e/gKPGNguCTJAjllEAzCV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538032; c=relaxed/simple;
	bh=VjcdHLn/exuDn4yCcryaq1BgCywB7X9fso0WPwxozQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPXQNaOovQZe2yLuPO8PamxLd+RckTkrYIMA6dtr9zCYiV8NK6KsiD0PIteq0Rioy89FZMQRNu3lEDwWMJHa75jFcCsGrWfFVk/ylVWZzhM99bXcvp+SkP9/pZawfdL4NdKotbB3jTO3VnExz3MNH7o25XIzbSlCJeuCJXTxQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODkVNa+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODkVNa+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C3F1F00A3D;
	Fri,  4 Sep 2026 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538031;
	bh=oz47/zTe83ehtd3OEEyBdaymSL5IvcVctX/ptDYp7Xc=;
	h=Date:From:To:Cc:Subject;
	b=ODkVNa+VIyNClQpz7BsyQ9EUrxG7jvZygo2JdVM1PEasFfrmkH/DJtsU1AFQ/Ddi2
	 dPIihcIrvXyVfEN7btc7fVWBrfi0oyNl+N8DTlknu7Gj8pi1BFy8fmdP2zgDw3TvoT
	 B2qVs1q1YmFXIwOjb2t9Ri4KJjOIZa7VjlQ8tmV8ESi+j3Ee7FSvLkm52Tg7gGFydq
	 PhNAD4KW+imSnuYaIDM91xTCWg8Z0pslXS+6/p6lpQM0wMkr/QSuIGuV9cKv6NvH5y
	 vLUdctcsFpisWNvV3ZGVVwEo2A4aWF89Be3zD+BGsTFOCefXEsMjvgrZN+eFEbIPGJ
	 /qTOZUkUrj2hQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 04E531AC528C; Fri, 04 Sep 2026 17:07:08 +0100 (BST)
Date: Fri, 4 Sep 2026 17:07:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the dmaengine tree
Message-ID: <aprsrJt107UkFPZB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mdaZqrVCinYqENOf"
Content-Disposition: inline


--mdaZqrVCinYqENOf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3d2c0d555d34e ("dmaengine: sun6i-dma: Fix use-after-free in error handling paths")

Fixes tag

  Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--mdaZqrVCinYqENOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqa7KwACgkQJNaLcl1U
h9BF+wf+Pg+XoOZMdS0sqMKdBaJxXqgJUwbybu3KdS5C7EBVcc8ICqAlJ9xnwiwg
KqaHEf9w65Pq1qicoK+VruBu4QkOf2QmK0hYo3gcvT5MYs5gqxg0o0itmRjXfurJ
6Tut8MiPActDNe1ESAS7fYwVkIReSecAFrbMZjVc7kvRLBSO5AthIuuW64i7YCUr
7AQX7R3T5RSHvEuXIIh7DbFgCsMmBjmeiFrGmU4Wntkmca9gv+lEP/bnJOWYey0s
of/hLvVac5xUDHmGns9iCXj9jBuE7V+n7lHROBjuxUFYkh7iWdmePe7eGs82YKtg
SZAhS7+xWL67xE+uE391tOpy5N1glQ==
=kiZw
-----END PGP SIGNATURE-----

--mdaZqrVCinYqENOf--
