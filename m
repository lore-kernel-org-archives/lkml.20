Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA753BFE3B;
	Thu, 24 Sep 2026 22:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288880; cv=none; b=AHq3qBu5PsL9reZJnPB/HkAZ4UGny/DPe3MfaovuB4V4TvzfmP1EtbIue4sGXuYOqXCdRfixm6g25ay+sNGmiMMAIk3saU92xkRj9RPJwSybZKaCFCO8Es1zaojaU5YDcTfD9MhOrL/8XfhHl6Kpwlhc0YwdrIHjqzkg5ooS7yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288880; c=relaxed/simple;
	bh=lxssIHuW6s/MZTgl178wG2Cm1Tn7qxcwdGF1fUcMX0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpHU7oGz6SrhaAF4D1O7S82jKlNve0UxS+YXgudwbiShB/iUo/4lxdXPiueE9G12JgNvuZXGHdNOMSaQCytq0Rk8vWLzGWM5+7r7Z2wfYk4JetkrTqiF84K6PP5gVhDvBIRr7kYHgFiwp2M2LmUprCdD2KZs+1YuWSu0vtV9OB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewnpUaoy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewnpUaoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141A61F000FF;
	Thu, 24 Sep 2026 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790288879;
	bh=7D6zAciElAf48e9upbEbOKRZcIwqECK/W7zcVQZfgnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ewnpUaoyP9W7F4f9UyWCfe4p6KhvY2mEK44KcCt43uh2mgTM+11EiEOLulbfCzGUh
	 w9bCIctsS2s74fgb0Wh0oKESqtfmIZTCp4f+ZGud4NNZwlc+muDIXG7kezl9mH2rGP
	 VSecQ4QweG/v1POwobPBCBVxB1pgEQrSJ3xlxx+KP48VpZHb0XHSVx42UB5lVCNyVH
	 jSdGhpykeuzWXiu+uRnX/kM9fFm1LJ1UIK0aDu3pzCMF40NZ//zHg3FqQ6M0joEuoo
	 IJok4o8qvqEFKq0pNtUQUtJMBaa4pw5SG/PYDS2QsDqfyT48F6IhLudRHqTsG1c1K9
	 6Zj9rVzSDrUqA==
Date: Thu, 24 Sep 2026 23:27:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Message-ID: <6a07375c-a5eb-4021-b7f6-af85f02f3652@sirena.org.uk>
References: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
 <20260924215540.933043-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KhHKTTBYT12xrTT8"
Content-Disposition: inline
In-Reply-To: <20260924215540.933043-1-mauriziocasciano7@gmail.com>
X-Cookie: Oh, so there you are!


--KhHKTTBYT12xrTT8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2026 at 11:55:40PM +0200, Maurizio Casciano wrote:

> This v7 series has been pending since September 2. It restores the dual
> SST/SOF machine entry and includes separate runtime validation for both
> firmware paths on the YB1-X91L. The series remains unchanged.

> Please let me know if any further changes or testing are needed.

You have not responded to:

   https://lore.kernel.org/all/aphNzNx3G4qDt9X-@sirena.org.uk/

--KhHKTTBYT12xrTT8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1o+kACgkQJNaLcl1U
h9D0qAf+J9c7XzEZFwCneVxDY5Qx4YfrM6NqeBuvK1xA+3SVZ//S0WaW5nPuVnFD
/FOflUhc5fL1TMiWZWtFg2+yHAcpnF4CTNeMlxDnKempFZms28WKRAm6d2hVXIxl
a2iDECtWrrIY1eZ4PfcWjoA3+zWG9AqlRZmXAVRG1a3KW2oMZ0GtcYxhyzkXCAe7
zjNIxfyJRJtfoBok94W/qWaZC1Toy1rb0D1Ny1JbPPNJSNqEhcdPviMPqAkFQ9qX
LMLJYul5lz326i33Of6/MN9Mecld2QSgpdP/c8EH51vcnnNdOfhptuJXf9uiQMZu
MrqBrfRakdLkUVNMx8qntzmDa1i9uA==
=RiAM
-----END PGP SIGNATURE-----

--KhHKTTBYT12xrTT8--
