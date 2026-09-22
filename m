Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192054EEA4;
	Tue, 22 Sep 2026 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092171; cv=none; b=ZqoQuaEnce01HmX8rbbdvBXQ20f5/s0AA6aTZgFm1wayacOP3jdCN2RXiVJeluvyId1XsguwBkgMK7rW/h0oSKz621JC6v/HMwGQW5deSrJwP3mFihyUOVTHx/3LRYB8n6yov7HJcwpxQcJsV/VjGQKaAI//jHC6JpIwpa8QQno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092171; c=relaxed/simple;
	bh=lusiA89n3+ZBjBZaqDHKRwZ68pnDNciZFIw82Gre4a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ev7PmtpUY5b/2aWxCXuxwzG8SbF8AM5CKHnZ7/j+g7AgQ2unf2rvUQoVqWnqcnJYxg0livaoi7YTsOOWFscNDeHmndxiyhR19DPMRBBqDy8nS1A09rJCsjj9dNVI4mWB/cIyubjJPcddyYAxzPDCY+z6whVMD5cznoAJtaFb3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYYxh2ct; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYYxh2ct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3741F00893;
	Tue, 22 Sep 2026 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790092169;
	bh=dFHGbR/j7IpZnrkF5xSgQFbZ+Wn4X684fiKHsZbkh8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GYYxh2ctELmLJj6hoKigIQKb6IoarGn26DdO1NqYlvwYtTTBF6KRbjJ77MZxsn7Js
	 PsHo2pjXnSNJCkANQaWUrDwVhzWnIrgOFt118qe4t2EmIyY7+JddTIM+3oJ27zLdPC
	 nNCB8vfe4hlMOzLO9+Sj/XfyTzsNu+wYtv4UomS0MLJTEjYXb2wv31wqjheDe2jSBl
	 Lg3M6XqhKXHSQrdEkJxDlpa25Mkle2LB794JPgCdLnwTREyMVFeiu8ew6F+1PR5sTM
	 Sbqo8m+xusrChE94hJ17oUsFD1pHiZYDWMDgYGX9AyxBnurIQJMv90PPaU+1FZR2/4
	 z+KUKWAy8D1oA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 83AEB1AC56E2; Tue, 22 Sep 2026 16:49:26 +0100 (BST)
Date: Tue, 22 Sep 2026 17:49:26 +0200
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
Message-ID: <arKjhitHzi1rqKCV@sirena.co.uk>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TNUS4WmuFywvXt+E"
Content-Disposition: inline
In-Reply-To: <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--TNUS4WmuFywvXt+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 03:12:36PM +0530, Mohammad Rafi Shaik wrote:

> +static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v15[] = {
> +	SND_SOC_DAPM_MUX("TX DEC0 MUX", SND_SOC_NOPM, 0, 0, &tx_dec0_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC1 MUX", SND_SOC_NOPM, 0, 0, &tx_dec1_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC2 MUX", SND_SOC_NOPM, 0, 0, &tx_dec2_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC3 MUX", SND_SOC_NOPM, 0, 0, &tx_dec3_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC4 MUX", SND_SOC_NOPM, 0, 0, &tx_dec4_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC5 MUX", SND_SOC_NOPM, 0, 0, &tx_dec5_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC6 MUX", SND_SOC_NOPM, 0, 0, &tx_dec6_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC7 MUX", SND_SOC_NOPM, 0, 0, &tx_dec7_mux_v9_3),

There are existing widgets of these names in the base widgets that are
unconditionally registered so these should collide and get an -EBUSY
during registration.  If you need something different for the newer
devices you should move the base copy out of the shared table.

--TNUS4WmuFywvXt+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyo4UACgkQJNaLcl1U
h9BCaQf+LEopVYB106VRfJ4chXp/VRdl1auKfVZQwHrrJLtAyvhXwvTH0oM4NamF
QuklMuXq9wAi0xnHfhSfjR9ZH4ILHw74X0ue/NAzBNhX+OA+KIRetFhx0m5igjPH
XQuGtiAInwroYY9Zqgvo/lFouGllUY86RehZVudPWrT7gP3858lvgc6TdCg0t3Hw
bw11oo6wVc0iuL8Dq4IoT5n86kFSsQrhQL3HvKkNfX43tE7oaZFEz1KXJVpX7oXU
e7raiCWDwc4eVGdF7ayp980LGn3VPIv68hoNAPPRSXwpnflfMudVLoobPeYwetYx
x5IbGzGfV/KG6pmdxuhe5YlLm3mIyg==
=tQMg
-----END PGP SIGNATURE-----

--TNUS4WmuFywvXt+E--
