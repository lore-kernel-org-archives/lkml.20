Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E34C7554;
	Tue, 15 Sep 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498010; cv=none; b=Ll5D+VyKBxmNR2gO7/OKOExLSyoq6hp87QYQ71/dtRu+nPA0gTqwGeuQ0X0btgtDPu5ByMGonlye/wVRhULMPhMI8z3954tL+lNWpoY40iPsQDSN+NTjSosaKYufxCPnze99eCtJBndUhitNNEN+jmme1DzVNIIgKfrTJgmgtjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498010; c=relaxed/simple;
	bh=7xxEDSpxs+Nh45WcONipdniIgxoH6As2/SkEEsMcxus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPMoi+ymx3L9YKbBwH3qdjkblTGOVILdcat8kMnFJn9iOTEcB/q/tT8KQrtvY/aZqy5xcIYfJ6kmXidnTzBzvXK10E2oaRZDB63T6IUQ+mwKz0KyTvZpFOs2+pa4SAqQUjcHwYxjPrerkr6yjpeHEGav96HKr7nZS0rw6VuHM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQ/okKD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQ/okKD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FE91F00898;
	Tue, 15 Sep 2026 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789498008;
	bh=bijYbgSkn1nW1AO65JLOTXhHccSOS3WGJEzCC8iynT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mQ/okKD1IlZFZlVR8NGf8hsb4a3Ba6VpAnnh+hqKEzx8/xDCab8RBSsav7FPK5/zZ
	 jV9xcwDdYgifnA6KeT6DmHBkmE4EPP+h984DhpG05wI6F8dq4BZ4xygB2kYlb0AdT4
	 N3Zd0Zt2G/eqpoGvK8gMizUKqbInvKTH4KppUZkEUfFGzsfVrbmw1/sHycaMvrSkZl
	 xtfITW6k7aDSlX1FI45EnffVPL45FJoH3jc3yAd1IJBWpg6sCJkDopfUmHyk8kdm2K
	 1ZbdLarmCudoAgfpzJ/fe8VDQOsMAqgt7gDkvk4h/4xolztXhDsUZscuKZiBCxeEca
	 cKY0FX87l7LJw==
Date: Tue, 15 Sep 2026 19:46:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
Message-ID: <b906abab-c252-48d8-b185-5acf3f94b381@sirena.org.uk>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IagrXjw3JABH8lSW"
Content-Disposition: inline
In-Reply-To: <20260915165652.914893-9-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Void where prohibited by law.


--IagrXjw3JABH8lSW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 05:56:50PM +0100, Srinivas Kandagatla wrote:
> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
> mode over SoundWire. On ARM/DT platforms without ACPI/DisCo firmware
> the SDCA topology and SoundWire port properties are supplied as static
> data through the codec driver.

> +static struct sdca_control entity_ge35_controls[] = {
> +	{ .sel = 0x1, .mode = SDCA_ACCESS_MODE_RW, .layers = SDCA_ACCESS_LAYER_CLASS, .cn_list = 0x1,
> +	  .interrupt_position = SDCA_NO_INTERRUPT,
> +	  .range = { .cols = 0x2, .rows = 0x4, .data = range_ge35_mode_data },
> +	  .label = SDCA_CTL_SELECTED_MODE_NAME },

Do all the other controls have interrupts, or should there be a lot
more SDCA_NO_INTERRUPT going on?  I see that's defined as -1.

--IagrXjw3JABH8lSW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpkpIACgkQJNaLcl1U
h9DAigf+NkPTPrkBwpybZU8JUoQj1MUFKmwVVxAX9BkX2jeABRxuRoHM/OXK7S2a
Wk9VAKwPTZdvzTEzOj/GOlYWXcHgO8tU/BuTjQ4D6w9OMh6TVv4lQXhuwjaFwtet
zmhnvJkh+GJKNS7wL0ZgchhJDiyAtAQ1HL9isTVbsYOR7fjIn1HbP2Uskm0vD39y
Iw75oG5EqYrqFPYWZoR9IiSkd94i6j4p9++06J018DgNfcV/0hxD8Qrz1lUancEA
QbITQgQTm4+7qtRYi0Np5mG0F4g5Wgt9pAVuuP5biwy4+ZD6XgzM1holl6Ls75x/
cKsx3y7TUqRwcC7j3zfLansHBLwKpw==
=3f3Q
-----END PGP SIGNATURE-----

--IagrXjw3JABH8lSW--
