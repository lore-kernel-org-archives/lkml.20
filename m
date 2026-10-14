Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D24D6C37;
	Wed, 14 Oct 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974649; cv=none; b=CGupxDJFaetRHpe1UFCMqCiO2UPzQb9vRb0aGnoRcHAJt5cmXAFDGh9sTLrKH3Ku1Zb8tCtOm3iBRdr2LLqgOfcQZsTB7jZlOG53UjkvzMw1HgByGNnOw18gXS67kP7h2qCoG5Ey0AjJZ3IUFKBxgXfvPVsXbofv+yro4D5NkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974649; c=relaxed/simple;
	bh=DP0Ieqoi5wZMgEayjuz5m/NrIvwbIMZw8khQ4qYlU9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVzEb4ol5Ofp0DkhnwevqRG5oPyvDt73L/Y/qVIss8lgPax/qFuL4gk58nyDs+SnDa0r4SILj8ZkRLT8cQcSNhkYDAG+YujOhWEkbUejrTYz+mD5o6e5JI8Hta1+b8e3gwbfw+MjxgKo6fQdOo2CpIdKcWmakWwCi3IAZoRIiww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3K2TjRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3K2TjRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F9E1F000FF;
	Wed, 14 Oct 2026 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974647;
	bh=DP0Ieqoi5wZMgEayjuz5m/NrIvwbIMZw8khQ4qYlU9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h3K2TjRrVF0FqpdSOx4xHm+dQceczMutbwFmtYFvBF70SmG6yFPUcjC5MOcz7vA1L
	 M1Ww4YqXlBMGZTRaT5FDvzEpOkW852SACFCzL7agdYaoEX3ZoaMiuD/WPOUi/rdzyj
	 R7BrR0ZXl01IfS3lmjq42X2g186iYTr4QUox+0hxaheAoaBxtQOFZJzm7hvnNX0Tnz
	 PPO6/8RuQhPDWkmU8Wg4tpIQO7rwlNUQQSXboOxfdH1sf8O70KQiKpValjilP1ik5K
	 3MKAgqe0dHsOGqvyO0BZR9qF4xglgZp3jE0tuxWTHHWYPZvS6x38rqMe7QtOw+ohVh
	 CxylkTPgnRClg==
Date: Wed, 14 Oct 2026 11:44:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v2 00/10] ASoC: SOF/amd: ACP7.B support and ASP carveout
 firmware loading
Message-ID: <a22f2a9b-3bb9-40d0-80d6-4ce36758c4f5@sirena.org.uk>
References: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="676xn5QD/iBmhotU"
Content-Disposition: inline
In-Reply-To: <20261014100902.1215212-1-Vijendar.Mukunda@amd.com>
X-Cookie: Live free or die.


--676xn5QD/iBmhotU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 03:29:08PM +0530, Vijendar Mukunda wrote:
> This series adds ACP7.B platform support to the AMD SOF driver stack
> and implements the ASP-authenticated firmware load path required by
> both ACP7.B and ACP7.F.

v1 is already in my CI queue, can you send an incremental change with
the new stuff in here.

--676xn5QD/iBmhotU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPXPEACgkQJNaLcl1U
h9CxcAf9Heotb7IHcpwkhw5QrY+/YqPi9LmhfEcyPbJJeNN/ZM1o0r7fRqf+XkEM
7TUkqVq8uYUTxkOluWLgWm8/8b+MGItBm1I4PHQKuY+Sx9xW7+yT/JCRf5VfvYKK
0pAX9SF/Px0V6s44trnCHN5dU4Vd6pj+72BYCX4SmzG9I4we88Fj7APbTfSkgXsE
uzu+GPAMa0VdJiUpQxhPpKhfWoBLR7++PZ8OW5STZlsVmK1hvMrklIws/qBF/smL
8BYx8nXVoWIwtprUM+FpbXqCYu/H4/Viuq/BjLKP1fd5D301YERLXxvsO0mN09W5
ZBikFDcA0ouZzsYwvgNABhauBRkjaA==
=DX07
-----END PGP SIGNATURE-----

--676xn5QD/iBmhotU--
