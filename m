Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57641469845;
	Wed, 23 Sep 2026 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156517; cv=none; b=ixdwNHc+7Ne5AnqdGhuPSQu5w9HLVoRjr9sPJM47twBGzE2I+o+FuVKF3VvZN+RnlmLTkpw6HBicGQVbqe2r3xkSdKsfe2TjrOhnDlEjkiD37gUSnX58C1WgfAZuRWZFaSr3Klla9MbDHiyBNZjzkAJXoOrQ2/Jwgn2FQJ20Ncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156517; c=relaxed/simple;
	bh=A02vOJuOAUX1yuB8qhC53Ilzuq8zCHTbhTSk3rySytQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feJ5TDdDza0zUJ7vSl4q83J1djmKRxwaq8NNPVzHXnLmCgKHs8f3iTVX0LmvkC3FwVvudTUT8GINI7f9hAzCnS6miOoUiw1VuAXYGC2hkPOWpxN5+4tqrLpYBFkKLrrG8/WEU8WYb6S0BUTKvgjEUiTQF/7Tc0sXthcqxpbn1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtyGGDbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtyGGDbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85F81F000FF;
	Wed, 23 Sep 2026 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156515;
	bh=JXGpzpr9eYDCcEmviY7JNakpf4awCvczNC7Cmb023eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OtyGGDbYRS3jpN5c0sX2R1UPUThTo+H9ZxG2fdDgzYZKEKL81lnESR3Ax4VBKxGr5
	 llYUFwubMm0SAuFR/Ge/YKR5TF/oBVSTyQdC0uiZ73+IVQYF0WYs45E9z26m0S68lr
	 mDaohu8z32KDnnoLwU1sinkgQGA+T14mtTr8gdZB0Oj/L6A9C0kI3+sW9EnPt+ZtCB
	 lohpsJuDNo00SefCeMzqW5bW6txCNLsAZIP9j2h+bIUZuTSgtCBJ2CWrSyFZU7ABfK
	 jjYfr3B4x3vGrnUELZhGhbY3rINkcMch1z3IEZGsZ3G6G4XZhQLpfZFf0rOZWjUmJR
	 QcV6uiFFh51kQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C2F8C1AC5737; Wed, 23 Sep 2026 10:41:47 +0100 (BST)
Date: Wed, 23 Sep 2026 11:41:47 +0200
From: Mark Brown <broonie@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
Message-ID: <arOe2yA4KOvhYqRb@sirena.co.uk>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A9+Hi3pv8GSHEQN9"
Content-Disposition: inline
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--A9+Hi3pv8GSHEQN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 12:18:24PM +0530, Harendra Gautam wrote:
> Add the QAIF CPU DAI driver to support Qualcomm audio interface paths
> used for CDC DMA and serial AIF audio links.

> +static int qaif_aif_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
> +					 struct snd_pcm_hw_params *params,
> +					 struct snd_soc_dai *dai)
> +{

> +	/*
> +	 * The sync, lane and frame configuration and the MI2S bit clock are
> +	 * shared by both directions of an AIF. Concurrent playback and
> +	 * capture on the same interface are therefore expected to use a
> +	 * compatible format, rate and slot configuration.
> +	 */

What enforces this?

> +static int of_qaif_parse_aif_intf_cfg(struct device *dev,
> +				      struct qaif_drv_data *data)
> +{

> +		switch (snd_soc_daifmt_parse_format(intf_np, NULL) &
> +			SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_I2S:
> +			cfg->sync_mode = QAIF_AIF_SYNC_MODE_LONG;
> +			cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> +			cfg->invert_sync = true;
> +			break;

Does this line up with the clock inversion in set_fmt()?

--A9+Hi3pv8GSHEQN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzntoACgkQJNaLcl1U
h9DE3wf+OVwBsqCWbO+jqJh+VNvk2fMfVsXWKAMxmNu3mAcCPZgnh1I4kDalHg+F
HvLdmzrL2eJe0V6k4cuaOM8YmdhAOHEcLAABI10/op0PyURZTzP2jvsKAVKtGMBo
eVeL22Cee93PQM3Jx2WZds8CbmptAM87cS9XrGiIpDlSTqlGnfT5jtNyArMfvmpk
J/NZncMGNfzNGKdlca4HxzgCqq1HPuPw6ZQJdqxysqLLXrjDq+upEZ4aWrJTql8y
9KZ/J46O67NNaF6f/zhWUtKcWigN6L3XZh3gjGQHA5IyEnUh3unWXzbQwbOTFtlh
nVRw9yiVf6NWIPc1ljoKdagPyO3tbw==
=oTm5
-----END PGP SIGNATURE-----

--A9+Hi3pv8GSHEQN9--
