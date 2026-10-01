Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF3F36F414;
	Thu,  1 Oct 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859654; cv=none; b=daoUxhghn8f+oY1XanVwQkysCRA1077vMNnfieul0BG7MKbGF6wy2tQ8fPQ1m12w+IlZvI6kUCSLHtIQI0orJkwVm4YjzPEeJAMQV03ke2usgEzzTfGJwth8FsGoVh6UxzMxcorJZ1V54fDXDA+WQ+ZQx4w9SrmltiDFF0cHB+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859654; c=relaxed/simple;
	bh=zTmj8CoQC+zUSJAPPnP6PmFPc06AiL9pAARma4O6fCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dm5uE+Y1AHd0lAFO+rgkb76uPNtmw3FT1NR5DtyYcfVMGOoR70FNBKs0B08E/fSmVsu0Wvpq++qH09G1Wdt0qtOd761BzyupTgITnWvR1vTWO1E3kTbQeaiEj5tN6MNCxYmmJGGyhJCJlWk6wQDCvW9Hlvz+VQkIO7gZLE4/LIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+htQWLi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+htQWLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265DB1F000FF;
	Thu,  1 Oct 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859653;
	bh=i6zkvNAsz0JwutvCyE9VM/dwHK9SrEYrdY2dT0EuqN8=;
	h=Date:From:To:Cc:Subject;
	b=H+htQWLiyehCzSHlpQPBVqcL/v+Nx3Eff1F1JubXqBWW/GJBrjWH3IAn5AEawlveV
	 7U3JjUBkTl4hOD+tzO9ZrxSz7yHDiRd9CWxUAoN3qN20HSEv+1IAgcHLlWlaQUezVC
	 UgPh0uTtjL78BayNiYYxp1zGwBFnQljQvdgpprEIAMFrgnHb7gb8N7vFxWYLnW2khg
	 rwVrGBvP6dt12cvHP3gDrrcPWJKMEV72PyOQx/YscKvxTonUzW8rwxud7kBYhU12oh
	 7nJkPTPdaOYxBqSy2Hqc03aSoYmPeKHe2pxgm4tENa3MnSG0apvqJvP8//v3QFEI2r
	 k2O1DP2JdOrJg==
Date: Thu, 1 Oct 2026 14:00:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the rtc tree
Message-ID: <ar5ZgRtt6n4SFJ8Y@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RiFdR5SP51sAL8Tu"
Content-Disposition: inline


--RiFdR5SP51sAL8Tu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  8ef8e9839a23c ("rtc: ftrtc010: fix integer overflow in time calculation")

Fixes tag

  Fixes: 1d61d2592c1f ("rtc: ftrtc010: Rename to Faraday FTRTC010")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--RiFdR5SP51sAL8Tu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+WYAACgkQJNaLcl1U
h9D0pAgAg4/cmZSfglRmsC6D/i/BumgM8i+abX65hW0v9CVq7AVB8ZMYcTlCy0Y9
RSGCgJUSlRRBUaBEGQn7nj6/E7lTLCpvvIsvq1AxCRDcKNzSBMAP/sQRNSc9ryCK
lg1kbGaLF5uvkpieBzxQHBGhYdDJJxn5QpC/UNIocLcKofp7xC+IzSFagAXNedzk
rLkHHggjvG1nruOJb4vV4jGJ+CslOwHDEcIgCSLMHlgcU7uUFcdivWSArfjysYGG
3ueZwy5QaC63g0ybYY/WoGbdSDitL4eGQyrby+F68UT7UkENHi8b68vLy3zJerbO
Ao5IDuov66LHIRslwRnRknM++vxjhA==
=nJWj
-----END PGP SIGNATURE-----

--RiFdR5SP51sAL8Tu--
