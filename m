Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867303BFE3E;
	Tue, 29 Sep 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720648; cv=none; b=LSKVGbB/plLW2Ht9Ahd2wo7c/aeRjOkzred5CKqipp3UIanr/C5JwfuLyKoQpTD3Zv06rRpZyJuG/bqI4/wfDGsBdNQeACfxkmrpbSkMIyMNpI0PfjSlfo6LZEOxJb8h6VTHfFGZKfukXi7J8yF+97j5xIk/LWuevHPxz4PSt0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720648; c=relaxed/simple;
	bh=7pyhxVLeI6+Cwxz7Z8hAb0MPhFXEys9z3/guVkcu2SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z40tYP7YX/NkgVRAM80jbC9JsKvB15/gpF4M58H3nEQxAmlWlI0m/kcznr2HDwHqL2XavNjTywJcrS37n9OsIPoGFJYkYBe/yA54QBx4awOVx3+ZMAyWXfWBiAGSaYymokHiZHAR5k2Vc7nSG+cq8b/MT90O0i/VGVsfKh+zH84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqMVBsYJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqMVBsYJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336331F000FF;
	Tue, 29 Sep 2026 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720647;
	bh=B/BW8Vdrk1IhDcNjo5BOfesSqb2py02zFoijpXJpWRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KqMVBsYJ8k0d2sgG6a48WVq+l3Nq4T9BGSopoc6kyiNARL3YPk+PmQP0K4lTvxWwO
	 I7DRX1SWjbdp44zQ48izHJ2W5C4o+6ac1kvNkND02fohzSUBytPPK3CUPCYXq+aC2z
	 r9ndQ+37Z6eU3ixRFWHI6txrMOCHt959a+LxQppCwi8fEYE2MG7bYNFAhwZbP/5ukM
	 bZj9IhX5wCfYKGP5CdGYbsPF0pvmjRqQXTqaLCCqY6A7meCZ5/3vibCum/48h+czZn
	 hQvCFtTt1cdxGhr7lGh2WlJA5aVAt7gsbqjgyvy4e7ruTh5gNv6ZaO+1U9BuJB765P
	 GVkXzJD727+1A==
Date: Tue, 29 Sep 2026 23:24:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Axelsson <andreas.axelsson@androscientia.com>
Cc: lgirdwood@gmail.com, shenghao-ding@ti.com, kevin-lu@ti.com,
	baojun.xu@ti.com, sen@ti.com, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: tas2781: Skip calibration data for other SPI
 devices
Message-ID: <e97bc4b2-69f7-4a71-8b32-9d3c60b2ca60@sirena.org.uk>
References: <47904337-8887-4623-83df-c370a26adf03@androscientia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pICCd7kKt5DABMhS"
Content-Disposition: inline
In-Reply-To: <47904337-8887-4623-83df-c370a26adf03@androscientia.com>
X-Cookie: 1 bulls, 3 cows.


--pICCd7kKt5DABMhS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 11:53:03PM +0200, Andreas Axelsson wrote:

> v2:
> - Rebased on current code. The tasdevice_process_block() part of v1
> =A0 is superseded by commit 513480da5e9c; only the calibration part
> =A0 remains.

This applies on neither for-7.3 nor for-7.4 of:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

As a fix I'd expect to apply it on for-7.3.  I'm also seeing a conflict
against Linus' current tree.

--pICCd7kKt5DABMhS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8OoEACgkQJNaLcl1U
h9C12wf/QF9TCuRlIz9XftlgyBmhapjJ5yBrPq3grieEN/bReKfcodjXb2swPP7g
oCUIomr8dJVR+uWrXGJPUk05Vvm3n6Wx34w6vsIvErli2xD0hLubVM+iqpcTyUee
qTcB9OkG2eyTtQUL+fjZXyupKBGRY3HpVQLbh6nsR9VO+JXN4HlGAAmWVH93gZ47
fPf97vLOieuPboIiu6Cv6kZubasCgWLhoeQgyI+QlD2vdFUoWy78XE1aSJ7ngwq8
OSckTnUVrW2kqf45QucNf2UpH+215nFGvCZec1C6N/7U07OL7PvaI21p51b3YdWt
aklV1dWu4uB6lE5dhUyVQQS3xXs/BA==
=/zki
-----END PGP SIGNATURE-----

--pICCd7kKt5DABMhS--
