Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997BB489882;
	Thu, 10 Sep 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046285; cv=none; b=AIoiwKh+rMYJ6HHfU/j5xS+mgt0zfVPLZYNpBxSN7aMJppI3FMPAXv7/byq0BO2jtflGUK4WqItzZKjFl9gx8XMozu+O5uZ6RN7yWUVtwmFnJQ3VNlPBfEz+ceUAuI4EsNuZUK7YfwwvU3Grn6fad7ebXixW8NLwmEsrbPSxe6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046285; c=relaxed/simple;
	bh=qQrItInjJmJYkwqN2J3a6oD0Faw1CDbdOVtEASc676g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jW8I0xgEpo7vh2Ext5sSugqLlOAM9/anLRotEHrL/wkAaV3yloG/fLez0xADXqW8S75rMPDwjJi5BW+vYrBFyLrLAUI29XX/1x2PvH+KeRMMdC4i2tkePkXrMiTEh82mADNTP9yIA7Rpup7arLp15JMyH7SXrrJ6CE82rSio57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yh28SgK7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yh28SgK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B11F000FF;
	Thu, 10 Sep 2026 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789046284;
	bh=63mYHX7mtuoiPipaFKq34F2k9faAGyQ8nFHA1oVLU8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yh28SgK7gOsyNTvjOGWgVG1/MDJixzQwQhYPAGNTeDU4OCLsroi21iNV/clvoIEh5
	 uKFGiJ3Oi1dp52stLFPNgzYrIwY8vNlOCjtj1+b4kort8izKB+rqCmiPcTI2gh7VgM
	 tnC4jvDMu1aBxEAWYpTLCVl4tx5EUYH1Eo4S55XiuIvhDgkXE6oCXY/ZV/qc9qh0co
	 NXrZ88fbtKVa75c5eqBXedcleXEgyodSEZT+Sa1MLTSh3o3RmvxJy3XY5E77JyMUO4
	 o5wNJdeykoOuBVD3BDFefmraJ/IoJNeQ3gvvoxGkawTwMXxtIDWfOV+WxREmvKXjJl
	 YyFwTlmBFNxlA==
Date: Thu, 10 Sep 2026 14:17:57 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Message-ID: <f64a008a-8bdd-4c06-aa12-a721cebc3a11@sirena.org.uk>
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
 <20260909204042.46656-2-stefanghetu9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bxz62p+0qLECbO21"
Content-Disposition: inline
In-Reply-To: <20260909204042.46656-2-stefanghetu9@gmail.com>
X-Cookie: Gravity brings me down.


--Bxz62p+0qLECbO21
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 11:40:42PM +0300, =C8=98tefan Ghe=C8=9Bu wrote:
> Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
> call stack") added a shared Xtensa helper that iterates over a flexible
> array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.

You've sent multiple tengentially related patches in a single thread
without anything indicating that it's a patch series.  This is really
confusing tooling, please resend as either a coherent series or
individual patches.

--Bxz62p+0qLECbO21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqirgUACgkQJNaLcl1U
h9AwYQf+OIH7nMiz45cq2dAIjQSTZ7xvYRJFfL7NgH9LmIUJzCDA5iD/8JHzAJqH
HtB/dbJUg5yoPkH8vB9DmrouOKM1/ZnoGMZLz2md/fcHprBKzTRRY/hpS/SLL7uG
ebPii0YZt+JZnq0WeDpOljT7LfjU7mcSxobur3AjJd84pHxsxFHB1XnjtBPGHhdT
O77Q+yTV8DjIgXy4iZSWTvmxxYFIagg6w7DiuJ7G5VogrWpFJGOFw1PRw+Xg+S7F
YP96GFRjjB+BMtmXvRYpIyB6Uvm3NYGkYlIMP2TOLR+vEbuz/UxWOwUVFFw9Jg38
W8RJHuPrDPsz/7g1TH6r92mrmYo0ig==
=uzC5
-----END PGP SIGNATURE-----

--Bxz62p+0qLECbO21--
