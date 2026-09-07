Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243EF4582D4;
	Mon,  7 Sep 2026 11:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778880; cv=none; b=GyR002Wf6Q5C+PLF5+3JIiaxDOKoPFgfNAsA9lORjOXuGBPLZo0jqn9uHh+o2Ez/0XgOmICgOUicSx7mXG8zi2x2D2N+WVLvPRWL/szoXjNepkq0wZunhiuJ6INkH1JHz62bff/cbrGegig4GKQuUqk6eNDxnoGasnCXsedVLmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778880; c=relaxed/simple;
	bh=b8YfcUL36uqFq2U/tdhOMgGM44rwal4ClWPpTfi9Iiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RSeOJYQLLZxFMU6/NyAC1v23bL8tGYd7j4RzEMzcH21uTp1KJzcJUBbqm/Vv9bv6IEPXdS3/yyIYWejV3rzsJ1JgpKhvzU5GLPIoOjzqmsw/F28pynOLSurfwgl880t/pOoMi0qj8ZKAZzJXcuNwOxkIey1GnBAWQRhmn+skyZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOha6ZX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOha6ZX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83191F00A3D;
	Mon,  7 Sep 2026 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788778878;
	bh=sp9qiQNzXiFRsnt2+6Z96Sy8P9WIkNH2Mpu4wOE80Ds=;
	h=Date:From:To:Cc:Subject;
	b=oOha6ZX/+ezHgwWWuIX9TYAF8WPBrqxIdSn134f1XfjxP/X7OpRiqtnuBtIUl3nXA
	 gpW0GdGOa9Z/cCZvhgmLkeEzlSgyJQsGl2wkhFe3zsVUhvC0JqIPcBFVZbBAfBaQNi
	 Rpe8lyqqgPcLNLRILbs0X8G9F1hhgsUngEpW7v/XEX9zAWyKcNWYnFfDhWQHXHOfi0
	 wHMCxOQl75X0XV/1MwUx3/8rpzieZtU4wugxOQORS2F355PQOS8ya9OASUQV4GZkU6
	 5c2gA+jq6xFtNdORiIclX8GLP06oOkTI3yjB0hTkJurvNKsP//rUm+MbYaAL4dXfbp
	 Ds8/iXddlI8rw==
Date: Mon, 7 Sep 2026 12:01:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bluetooth tree
Message-ID: <ap6Ze-_ckuTFyCMH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0XBuCxOMWKPLFIG3"
Content-Disposition: inline


--0XBuCxOMWKPLFIG3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  755cf7adf8dd2 ("Bluetooth: btintel_pcie: unified decoder coredump format")
  61f725843b509 ("Bluetooth: btintel_pcie: add MDBGC multi-buffer DBGC allocation")

are missing a Signed-off-by from their committers

--0XBuCxOMWKPLFIG3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqemXoACgkQJNaLcl1U
h9Df4ggAgOEPYyBz/UJ+5726betmqo2o2MySo0nv24rd+AbysCoI7sawLWcd6+/c
vdT/Q/1FrvkAQjF6KPXJySdKrooI5uVS2Jjq6Y6qugsO3XDrwUhSXglpO7Rrwqqq
Uvb/Qd0gRoWOI5Uj1a3N+QGTtkDHTr6vk3g9+5lYx3utKYTbA1UMrurLXi3WUc5r
z9r3aMlRLOLG1v0UDG1zNhQOwF52g/djRskzzFNmE+4PAtl1jCMCy2AC7VGbojqR
xUSlsPzJR/EnMSHesYDkK0cmW6x+raWogz1Ow4rf5yyFjXzqPm1YxCzBuba2CFbj
ZiKfshpv/BvCNqaxtJyd+pJ1YXKMrQ==
=UVgE
-----END PGP SIGNATURE-----

--0XBuCxOMWKPLFIG3--
