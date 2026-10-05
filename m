Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBC4746AD;
	Mon,  5 Oct 2026 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196195; cv=none; b=cE6tEwSoYDkKPugCWkS+rnCi4lkk/DD3WaSRkLLtcpt5fb+tRiPRwsD2OUkg4P3GEsQTezAJG/Sfqi5pdP0l2Z6FJEVynLWa667hiFaeH128EpkONJKpVmjv9UlfTbyfUip/YJgw+cE3zuJgRhi8tMKcR1+S1dyXft67nxpBYdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196195; c=relaxed/simple;
	bh=VCdtdx1IUP8ShAtMruchd0VuoPIMEYgJy8nEzHLCc7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5QCOuvkhxEHvXfDfxzNkmuTXajFhJF+KLIbQAodPND2GyIMCLtnSZlPb6VHtq2g98QAn1KWNIITkfDzW9Ik/XZtoL+AnNiNnDG27vj5WAiOkNktg7I12t5+5vb/K4XM/REfK1104hF4wPIR0XMbj/n5DpUW6JMeoMCzQMjFw6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdQS5stB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdQS5stB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6B91F00893;
	Mon,  5 Oct 2026 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196193;
	bh=VCdtdx1IUP8ShAtMruchd0VuoPIMEYgJy8nEzHLCc7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EdQS5stBnMbPXiRcjd4FuvNTHjketIOyyw9D0JFaCumzZVZiPnWrOaetdc0vwicTZ
	 4ecyytPDbThwviIHN3oPcSx7ugGG8y0+n3Q/LUP81tbL8TKA8vaD1sjs+YzooUfQkr
	 QEHqbcZY1L+tqfXgoHMx3QH6mexfus4vVuLQdiat3S3MRgvJTVs9x1rKucNaTyHOLZ
	 EsJj7+hSjix2AZc8cSImvumDcXgb2r4IZuFLVbqUonmICQ1030jKOs9wd9fCMtAvDJ
	 MAPeT2YO2zSUymyPUW7hae8tlv8bhEW/FzW24KWRF6xS8BUOdd1hbW9/yVaUTMnBq1
	 j1Hq7F9YL/EwQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 537931AC57CE; Mon, 05 Oct 2026 11:29:51 +0100 (BST)
Date: Mon, 5 Oct 2026 12:29:51 +0200
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error
 handling
Message-ID: <asN8HzfxSHmBjfu1@sirena.co.uk>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com>
 <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
 <asNbjSrPYVbeqSae@sirena.co.uk>
 <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cO30F3djDKDguik/"
Content-Disposition: inline
In-Reply-To: <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
X-Cookie: You will forget that you ever knew me.


--cO30F3djDKDguik/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 04:36:37PM +0700, Bui Duc Phuc wrote:

> On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
> it calls soc_dai_mark_push() only in that case.

> Is a positive return from startup intentional/allowed?

It shouldn't be, no.

--cO30F3djDKDguik/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasN8DAAKCRAv73Ows9A4
ia6oAPwKWuMtsVlLKHYETHbUSa6bMxHSYmnL0pqfug21qnTy2AEAm5OXh1XSYpqm
8UdNRFdnbnPy7SX5g/RLbguKIMWCBQA=
=Obcm
-----END PGP SIGNATURE-----

--cO30F3djDKDguik/--
