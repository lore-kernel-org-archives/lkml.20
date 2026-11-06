Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967882;
	b=t8fSK5pBeEVJlpJaTZR+N+6JzoMahWWXJW+1hccvO7uho3zOVCMsDOBCOwPtLKPhuh3b
	 mDHRpPTfsHuk+qtS4YWw2MoMJZRJkVsCiplHTfH54KiSl1Ca0fcsxY/5pX0I/LWib9XlO
	 J9zIreoLExd13HN+SwZIfkQwMw6gzcpUUqVcHoYP3Te5e43YeDE9TGe8sPaVQJB+51xbz
	 kMD8iQ2rUbM9no58JyaHvBcr36d7xLzCVlhH5HbOs6w9KpT8+QVqvHhuuUKA/qMlyrlNV
	 GiIhxtk43Z4Lo+GBOGZieHqjpwQQwU3HgVNi8vXj8tb/HMWCe8mudR2bftrkfz4sMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967882;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=gcp3IhERIolgxwFIIfmfPI/w27CHLBf1HSdIWgRYFIU=;
	b=XlXonvncFcDIyb3dRE1orv4gfJlSJszjS9OhZAqtS0wSlWz1NFBbz9S94PXRD6bO7Dgf
	 zo62PFlSMTNoc9ugG33ke+kIniLEkI3XGL4sH8GO8svgUDrLBCi9YMN2DKWocLGoYHQry
	 EGsiyq2liWYFrLV+oNGoXTzOxEd7ls6PpHyfZBt8/PbTSJAsZkmcUMhWtdZ8ElCfLXhP4
	 0cRhM2ZV/Inc3xmYh1gBWlqtQdlFRf4pzCQ0PDK+ZTYDWJD9TeE6xZzIgHy0nDskALj5U
	 SHPbc2ASrZLLCzpSYmGJLGnf+asMXZqOr54ABemMQ6NLS5vbkkJ5OGMdzWTo2f+ENjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABnzvU9b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F8606A32F;
	Fri,  6 Nov 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABnzvU9b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D93A1F008A4;
	Fri,  6 Nov 2026 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967881;
	bh=gcp3IhERIolgxwFIIfmfPI/w27CHLBf1HSdIWgRYFIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ABnzvU9baluU2lB7w7dVGXVD4uEQ9nzo7xXPN2K9Im7YvijuTTwZObNv5hOI13ktg
	 uwlwe/66CzEPC7hAsY5FIQTVM0rzrAe47iFB0Dek2BwqQoWPr+d734MeJXUsMiftzC
	 DPson5kD4vK9J1ire6r1ZkhoxXkKZj7z4wJWdYLhRoVQ70hCd+1Gi6JBL/B+JR4oNc
	 z/aYO33umAA6MELW2u6d6jHEcga94AIRnHUN4y4XOOSeDJ/Mw5mLmNOE3efqO0mKxI
	 Vx1qVQ2U8lQvuHGpsmlopA/SbOdRuYHj/5C6Y02zwPsWcbCUS7sg/tyUJwJ5ldJH3P
	 ysFvtq5Sg0Sfg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 74A3B28067DD; Fri, 06 Nov 2026 12:24:38 +0000 (GMT)
Date: Fri, 6 Nov 2026 12:24:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: pierre-louis.bossart@linux.dev, Basavaraj.Hiregoudar@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com,
	Sunil-kumar.Dommati@amd.com, Syed.SabaKareem@amd.com,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, venkataprasad.potturu@amd.com
Subject: Re: [PATCH 0/2] ASoC: amd: acp: supplement patches for ACP7.B/7.F
 SoundWire machine driver series
Message-ID: <1a75c8e5-975b-4225-9e25-5b6b1148fb50@sirena.org.uk>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
 <20261106114622.219126-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FH2cet+fmQufu3HQ"
Content-Disposition: inline
In-Reply-To: <20261106114622.219126-1-Vijendar.Mukunda@amd.com>
X-Cookie: Whoever dies with the most toys wins.


--FH2cet+fmQufu3HQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 05:16:20PM +0530, Vijendar Mukunda wrote:
> These two patches address nit-picks raised in review of the ACP7.B/7.F
> SoundWire machine driver series posted at:

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

This has really confused my tooling :(

--FH2cet+fmQufu3HQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCau3HBgAKCRAv73Ows9A4
iXi7AQC07VcxSDE6UbX0pOoDNP8D1f1Jtizz+IeY4X3x0IECPQD/TjXFLaUY9jSB
kdnhWuXzBerTTocsHg+Nf4FELEip0QM=
=4+SU
-----END PGP SIGNATURE-----

--FH2cet+fmQufu3HQ--
