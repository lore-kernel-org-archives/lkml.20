Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310F13A4538;
	Sun, 30 Aug 2026 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788100069; cv=none; b=byuxn6jjq+mlRHF74Uh8+i4n/xIwbyrP6QbFaK+FqXck6LdQD7+MYJUdNrBokrv1JtRsZlnESRcOQfyb2Rbz7vcsfBFWLDMwEFw3FCQLHjtTR44i75tYSb/OppjMhXhTIbzBc8HlX2/H1dpLc7xH8iRZdq50H2bYqGPZkY4QbJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788100069; c=relaxed/simple;
	bh=6Mj+pUEWF19/xY8BvpB85SuoP347Zd246oOwwrU3AhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipPl7u+YTNFoSSKdpPXL31fsmo1yRWU05iT+PXO350WtkMhkF/qyULHlsS5cM32Yeb6lS8fdx/ZFf9R7Giu7Rm7CHIooZ1XdVPjblTFRfim9uZh26p3EZS139O84iOpjebrTU7iSMDpIIFfCYouHhiiO3hjoPv85cjj/YYdUz98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikKseO/Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikKseO/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29151F000E9;
	Sun, 30 Aug 2026 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788100067;
	bh=6Mj+pUEWF19/xY8BvpB85SuoP347Zd246oOwwrU3AhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikKseO/ZMaQN2SZlQqu6BBe+14HfZZNIyeldx92vA1QpLD1bOmTTeaCNC9Li57vZB
	 qlAi6SkjrwkHkRi4CkWZ7cvoNjdrql+vRI2A/oIFukApoo9Z34jPDBJGY5ATSbKOpg
	 ab7IeeUU6/9CGH8xNHsIagOpiZDRDLqnWd1rOgDOtvlPuGkgyC0+KefYa7ok+UTP2O
	 F0zLswmHo7ruymxucSB2mqB8FShGRuSUL3+7ELiy8BkCQHn5HTudiWEQo7RFfSBepT
	 GKeFwxAH8nMqxN31db71DGx/rc8zi4APhJTfKj6bQlY5rT4uo1w2TtwadRXuUSmtPB
	 ujTvF5YaDjplw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 3242CCC22E4; Sun, 30 Aug 2026 15:27:45 +0100 (BST)
Date: Sun, 30 Aug 2026 15:27:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ASoC: fix audio on the Microsoft Surface Pro 11
 (Intel)
Message-ID: <apQ94WcqOmDLE2iG@sirena.org.uk>
References: <20260804225853.31585-1-lsa.uz@pm.me>
 <20260830084500.6123-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kH/i8S4zSBgAhDLt"
Content-Disposition: inline
In-Reply-To: <20260830084500.6123-1-lsa.uz@pm.me>
X-Cookie: Orders subject to approval.


--kH/i8S4zSBgAhDLt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 30, 2026 at 08:45:05AM +0000, Sergey Lebedev wrote:
> The Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) has no working
> audio under Linux: the speakers are silent while every layer reports success.
> These two patches fix it, and the machine then works with the stock
> sof-soundwire UCM profile and the shipped topologies - no board quirk, no new
> match entry, no local configuration of any kind.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--kH/i8S4zSBgAhDLt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqUPeAACgkQJNaLcl1U
h9CZKQf/WOAf/YRuIgWHzRyiO6M2UvSbLT1ChdIgAb1diQdc/LKF5Dkr2xFLdRC6
eRroN+2caYcYpGc/zTC50aSRf+6xVqkoYrdhWAERf3bQl/qn5vNY8XI4omM7NVnm
pFl1ZPNE3Xt/qg80r6uUOl1n3UIyK0kcFqpeLBGY6alVicDr8wk5uMfAqsgwXbCt
XQ+KBo2s9trbx4v7bjn24bIXWmDJBehd4w1c2IVpinY/ibWT8DT3pCTn1Yr95RV9
+1SqYTYYIldCAdp/9bdcZlZ+P7C3GKMlHdX7J6iz3LIPmtb4bW+fKTe47mKZLwLj
sunEgmhB3A5AfSa7xBz2i3KQdLTsUw==
=MfLq
-----END PGP SIGNATURE-----

--kH/i8S4zSBgAhDLt--
