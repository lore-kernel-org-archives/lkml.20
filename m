Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9357C72E;
	Tue,  8 Sep 2026 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788893563; cv=none; b=eiZVdWPxo6+/i5OrXkAzdqfX6lfzcI1en9dBKRulxQAXIuMk8CJUkHpafTvmaB5gAwLFlQm9P7kZCNOu3hwmoyptDJXbf7r9Nom9s2bQx01MF25uAGKlhfbPPG9/03qqvrzyDGuZjieTQ8vA/tBJxw2b3SQFzYzuLf1p1LNUH6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788893563; c=relaxed/simple;
	bh=utfaVtlGd7u5D4EQV6l5xEQC/ZWecWLHb/s4NJCNk1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5sUXMjdI21zvH0yeeY8JtIy7IHer0kSF02AtpZESAHsZm6fDUeJM4MAVotSpb1HbebMwyT/5cqfejIhXD4rRMcAC07qcebZIU6RjjbXv+HshnDDF7NV3tumem1kYF/KTQzz5gzF9SkrG2gDCOi2gT08UEX8j5Gz/dkY7/Lgdl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ieq4JLaR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ieq4JLaR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CE51F00A3D;
	Tue,  8 Sep 2026 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788893561;
	bh=DOKPmpWRmdDBglqf84YkB3HAz/fgt7fFnGQ4z3lV4J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ieq4JLaRtlT92Yg0dCEjo4VFE7X1234dNn5s2zUPIZ7NiNXSGmSkQQFccLQBYWHhr
	 RYN3F1nROxCUN1B3nbU1qcvdS/fARGMxeXIBC0M3xsXKUfhNOP0y0lBj7ZuD80FyrO
	 YYD7Eni5KPI+8MP7nSsd/ANAyvZKOVnW4XlIQFXohh/yW3P/gwqVMp9XgrgrpIWGrM
	 Kvwmv2mW3Zn7/utqqBEybj89h+2cbzaTqGwYaRW9WfZl62QybKty/KBfX+89QKf8dg
	 YhnfVAqb1MqfylRhqRxXbuWa/SWl5KK5X12z097zGYHnCehSs1UY4qQ+WS+B8L/Nly
	 Fclmqr2A1t+eA==
Date: Tue, 8 Sep 2026 19:52:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate
 regmap update errors
Message-ID: <a88fbf17-faac-4902-bd39-ff0a616a7d2d@sirena.org.uk>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
 <20260907120310.135693-4-phucduc.bui@gmail.com>
 <e011cd74-7c5a-4cd1-b412-ad11765ad11c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JWy8Wwp5/yGMiUOU"
Content-Disposition: inline
In-Reply-To: <e011cd74-7c5a-4cd1-b412-ad11765ad11c@intel.com>
X-Cookie: The world is not octal despite DEC.


--JWy8Wwp5/yGMiUOU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 07:49:00PM +0200, Cezary Rojewski wrote:

> I'd expect someone from Mediatek to verify this.  While I agree with the
> change, some drivers follow "ignore register update result" arch and,
> what was previously ignored will now cause basic operations to fail.

We don't really get any review from Mediatek, AngeloGioacchino used to
try to cover things but it seems he got busy recently :(

--JWy8Wwp5/yGMiUOU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgWXMACgkQJNaLcl1U
h9Ccvgf9Ggr9gv/6qkfKjZsgCMk8lQLLYxhJ/1oG28aS2ODQznEVI0n/o3onhTSp
9sWz6l6XoSuTlM0+U+89WVv2HZFTcs0wsaA+pE+OGa7diIQxlVE2+V5AgbbdLPHJ
h5Lhk2fB/Qubw+9taoXc8pT2Jmt/L89dCkVTgysWcDBJ+t0/2zhRB5YHSrsYiqbQ
fgbnFPbf6JVIOqaCm20N1AAPm0cqbXi3+/TAqVmuHXpIOccFDiy/NrwG5BZj2JDk
LySiLFKawdzJBIRjeP9EO46fau/vwCeJQbtsD0qdS4HAzi2FAtj+WZGjwS2Y9kJf
Muc8BwBg69bA6BnfHttIdruciJ41Bw==
=1Y36
-----END PGP SIGNATURE-----

--JWy8Wwp5/yGMiUOU--
