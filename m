Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107943C2786;
	Tue, 22 Sep 2026 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080207; cv=none; b=UBZvUnAmEO/sMQWRk+tYf5cmoK9+g763+oEbNzvpFy992jMfL+qU8fKIkrm7wkcLHkJU/8ihiGWbaJCjs3MxGCed+DX0JS610yz7XDoRJQ4lGvPxMJv6PZlyotZ/tlWnJWzO8IBVX7jzyQr9CBZtZIZ5B0qZE/zsOuL+RM17Ey4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080207; c=relaxed/simple;
	bh=PqAl+HVHkrrL9FczVZg0CI96bYcpxGqt/65ScF4a6Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcM/PLKwCJsC7EsXVGrM2U+6fjO1+oqTbC47qIZCUQBWFW1DOlYm1KMCapFJ/9ga/QoArmLUambFY2wMIaXuDyqNjT8RIr3s3nk4y1ZBYvq5a0W1jCnJGFe/Km74eL6pIV6CAeoUMPEexgH095PkD5lPoqbmHLFJb1H7i4LdmT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXq+uf+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXq+uf+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295E51F000FF;
	Tue, 22 Sep 2026 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080205;
	bh=nodtLQld92H/w+87PrKqNfiLf6/OH3/Vw26rljGaiF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KXq+uf+VbaOn4N3HiwTtMMdh26MYFiYMJg4o7+mFAljlqysCl43T6C3U5UXVdm1Q0
	 3/Mxcfnw50/GvLr64Zk0v0X0BxrvIl8pH3hD8Sor4t5sW1+6QFNuQbwxtAiSRByQ1m
	 ZEvpT++srYAbrRE6YJM19HNa0r/hf0D+X7Wt5NKD+Isv1natB/1NB7rQoJKokWhZAw
	 4nxCodcIqrTk4JaATRUd82BhO32bQ6dUiVDjU8F9onDSkr4urP5D9AMwOvpAifltpq
	 CegDTJXenU72Z8Emu1AhPtnrShrCucZmX44GRpjpFCpuSR/VPAG/OMeqYctbBSrjPr
	 iHKhKeQzMG4gw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C58D61AC56BF; Tue, 22 Sep 2026 13:30:00 +0100 (BST)
Date: Tue, 22 Sep 2026 14:30:00 +0200
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mohit Sharma <mohit.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment
 for mDSP platforms
Message-ID: <arJ0yBdeDfjYihRd@sirena.co.uk>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-4-e79cfd7af5b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+qbF2DyA2aioe+8b"
Content-Disposition: inline
In-Reply-To: <20260922-vmid-v4-v5-4-e79cfd7af5b3@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--+qbF2DyA2aioe+8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 12:38:12AM +0530, Ajay Kumar Nandam wrote:
> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
> (mDSP) which runs in a stage-2 protected context. Unlike ADSP targets
> where SMMU-mapped system RAM is directly accessible, the mDSP cannot
> reach the PCM buffers unless they are explicitly SCM-assigned to the
> appropriate Virtual Machine IDs (VMIDs). Without this assignment, audio
> does not function on these platforms.

> +static int q6apm_dai_scm_assign(struct q6apm_dai_data *pdata,
> +				phys_addr_t addr, size_t size)
> +{

> +	r = &pdata->scm_regions[pdata->num_scm_regions++];

This needs a lock.

> @@ -1021,6 +1168,7 @@ static int q6apm_dai_probe(struct platform_device *pdev)
>  {

> +			if (per_stream <= POS_BUFFER_BYTES + PAGE_SIZE) {
> +				dev_err(dev,
> +					"reserved-memory pool too small: %llu bytes\n",
> +					(u64)rmem->size);

%pa

--+qbF2DyA2aioe+8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqydMcACgkQJNaLcl1U
h9BZpgf/XmDQSosVZWiiFhI9qhxndjmrRD2T1B1eUdBZEaqFVhup2hCgJ1QWIJdz
/6CRhZ3M6nU1p055uykGpQYT38IEyAidvXQ5iDuFUuHrJqXU9odXo/ypOr31QZRx
HVBofsbARP31irqFg+GqJj9YawvL0idJA5JIJRmmXWU47ox/pdMGYd8tnrsSlCRq
SS71L4hq0Du2/7Z0bo6ySxVBwSKcWvclWAF1bR828WcKdzB3/gpyv7RCCf03ilcv
jaq624qp6aCZoItwxPqzCVKsaZAv+PMS/ildbMxQ0ohkILuTpCelpBVhdPyZBgOj
/r3fDG0ntChBQHhpWtGJFcdsizzmAg==
=WtKL
-----END PGP SIGNATURE-----

--+qbF2DyA2aioe+8b--
