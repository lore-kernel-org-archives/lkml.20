Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E218835C6A8;
	Thu,  8 Oct 2026 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447660; cv=none; b=sdvoGdD3ANn8pcB0iCS0wOCfcmXUHDjEIlkQCG8bl8pqETxeWrrweMTmvfOBWMEs5CiMTEd0siiYHCWreIubyDhoduIO5/Pb4KrsJq8WozZX7kjCr1X+1szygvkXD3SfpjyEvyo1iVYiJ2IjJAxLjv5gLV9DxM+bQ1QuWVaG6KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447660; c=relaxed/simple;
	bh=e3+40ytroZd8UkOtxyfq7brsgjnTd3IzZPXyHWOv+eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVnb6Vji5TEyZnGyu8mLQDNCoIlGqKQ5Eg0frwFft2HNDArfhYjNbwT9Tk/XXYfoMMzf9z7p0zVeKODchxviQBF4xp3cRU18L/do+uRlW24hGakeZUjXpcDQnXe2tC3oiRQ1Zl6gpKxMYULPWq4uPzdM/ruVYJJGU2lBXZpjTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6LASO2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6LASO2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6871F000FF;
	Thu,  8 Oct 2026 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791447659;
	bh=e3+40ytroZd8UkOtxyfq7brsgjnTd3IzZPXyHWOv+eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z6LASO2RSL2hx+ABfURA5fGHZFeuRNItRy0/zGQ9LJJpOlkcX5+gXvQkqauZewCPE
	 VdFiPylQJv4SCSRkUF8UsWuGNYIRTIfuDeYxOWgGG8ruXu56BWocM1IsOEsxsc2ds4
	 qYw7csuoULn/Ib4acBLfAvIhNbfN9046W1oKT4HwHkGU0cVbcsod27RCnIWqPsr01l
	 vSPRNUnly+i/vuci6Yo5FXgcJK/EgrqgZiFM3IrCATo10U2Q7IImerqQfEJItzONtZ
	 6bU0ykRP2j9CRxK42a8gUd9I+lNRAwIo7AQwsrYI2GDS1lm5Eu1w2pfE6tBQvegg8c
	 pvaWxgBLxPBZA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 06E611AC57CE; Thu, 08 Oct 2026 09:20:57 +0100 (BST)
Date: Thu, 8 Oct 2026 10:20:56 +0200
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: mediatek: Don't keep a freed topology name in
 the static card
Message-ID: <asdSaDwahA5srEqn@sirena.co.uk>
References: <20261003194501.832558-1-michal@nozomi.space>
 <20261003194501.832558-3-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6i3hVWD2P/PaIFQB"
Content-Disposition: inline
In-Reply-To: <20261003194501.832558-3-michal@nozomi.space>
X-Cookie: You will forget that you ever knew me.


--6i3hVWD2P/PaIFQB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026 at 09:44:59PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> The machine drivers pass a static snd_soc_card, which outlives any one
> probe. With SOF, mtk_soundcard_common_probe() calls
> snd_soc_card_set_topology_name(), which devm-allocates "sof-<name>",
> stores it in card->topology_shortname and points card->name at it.

=2E..

> Save the original name before setting the topology name, and restore it
> from a devm action that runs before the string is freed.

This is valid, but it doesn't feel like this is Mediatek specific - we
should probably move this into the core code.

--6i3hVWD2P/PaIFQB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasdSPQAKCRAv73Ows9A4
iWjyAQCQ5EpsU2uUq6FAFEaxSaDmJrgpBXNidaTsw8CM7GmvIAD+Nq8nai9tUtVC
zgkZwIFH4nOACSEmWBUyknlThZRmXQc=
=71nn
-----END PGP SIGNATURE-----

--6i3hVWD2P/PaIFQB--
