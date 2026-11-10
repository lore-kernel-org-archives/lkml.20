Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330184;
	b=ql98erucbWfPrZH8m9urkOzoKDK5vXOWJZriQabWEeEKR5nTkMNyqUURpgkzQlzZOj9F
	 1tc8MqpQDkx+37uc1Qjqsop3kUtOk+xbcArrD9meMjpwr70dJT5Mnzr8pXxc1itwK4mlr
	 ahSCPWn1Kym2eDactDYIOL7IzdY+kmdk7KgmQJCS2IYHDqOV5Z9/NzFYl8oHS2yeY316g
	 CFPoEX7ImqqnQoP6ppB+/YVShc+oVaRy7UyffrtqALTkc3m8rnBFJycwS20ebTq9ago/M
	 Dj2Ee9zEBffKxRM9kBpFJVCK/q7faBtcxiTKAqcddBFl9SggsQn9m8LPv9ik2EDbXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330184;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=46l4+NqfPyfVg479fEY7DLj9+mIAGi9Xe+UYzqhTlrw=;
	b=E1qP4B/uq7zpnau4lmeWSylhNpWvRyV1r9AjKHJWmKnxXhrjDaFxHZSwnWW+X/zj0AET
	 iheY5gZuQ+oSdCy/OWC+P9B4DkzOFPVnkR9hzpkjJcqZWvQAtBFGGEj4KCF16j57PpQcm
	 6chWw8CxEIlQMHdcHoq7dE+p4lpd5EN9FtVHFv4DqxMqyCMg9L4gB1ihiJyo8NNx1MtME
	 dhCl+1j0qkgpttw+Yhh56uybDrIP7VaWeDH3gr9yoQU1eX2uzw0UIlOAgWYE302f14ITv
	 1I1vI9LnTsbVjEfRXeNwU6/43VHlUT48Nk6QNqOGf4suwFKo1byJjxGvQ3tYGUjSSTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmsboDbA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC0606A323;
	Tue, 10 Nov 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmsboDbA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465F91F008A2;
	Tue, 10 Nov 2026 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794330184;
	bh=46l4+NqfPyfVg479fEY7DLj9+mIAGi9Xe+UYzqhTlrw=;
	h=Date:From:To:Cc:Subject;
	b=bmsboDbAoc0q72QayO91vlfBYHNO3bKoVP1K/3/dgYNCeRbD/6Tx6Bqya7zqV4aXX
	 tYmJVCN9/B6ECNakScPslaRwR2kGzrS3MOQy8thVlBvBvdzWDBnDh1GDgMuTKH/qAC
	 YBIQxMKPr73FYGDB9Zm3NGv6rWxoGHxVyf5LGPs70PZzlfTMpungvLrn7ullNXlZVP
	 NklD9A1V6lbqw774d3fm6LsB51kgka3YjYatKPyu+SFKNKyw+/ctXex/xyCbZojJwO
	 g2x6rQo6fkhoVqVPAUXlo1qhlSxGDBzi7SdGWDySFUTR0CHoIkWgfL/C8fjlrCj0R/
	 24A1nU1dSqqxw==
Date: Tue, 10 Nov 2026 17:02:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <masneyb@kernel.org>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: linux-next: manual merge of the clk tree with the origin tree
Message-ID: <avNOQ4P_7LFpv-5L@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vmICYqHgWLHQ2Ps"
Content-Disposition: inline


--3vmICYqHgWLHQ2Ps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got conflicts in:

  drivers/clk/hisilicon/clk-hi3559a.c
  drivers/clk/hisilicon/crg-hi3516cv300.c

between commit:

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

=66rom the origin tree and commit:

  3865d0d4439f5 ("clk: hisilicon: Remove hi3516cv300 driver")

=66rom the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Deleted the files.

--3vmICYqHgWLHQ2Ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzTkIACgkQJNaLcl1U
h9BX3Qf/VotBF+hPd2ZQI681oevQfglYUllKke2Jhgv3dMnOasDBiLPqfUKHo7eC
9D6G79XQ39jetRt3wAIhpBK13zwrfrIc7Zf8sXD8kPCmav3f0XcXwDwUaslYJHpd
Sun3PXLNsAu/bdhAlh45zR9jHMKodPddIBkScVoPz63qZpL1mwCnRkECHQHgALWF
CqWyOx6m467Li8/MkafrWOU/l7dVp1025tGfj43NyrOgkoI6vUaRxDMAcizPv5eo
aXFvGPrPDiHlyppqfVgArTC8KbgiPTucM+1fpzeeseEWv9iJYeHDncENT7qkvdem
FhiR7YmWuv7SV3YyEV1fdRREvYXwaA==
=6KQw
-----END PGP SIGNATURE-----

--3vmICYqHgWLHQ2Ps--
