Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FD40B106;
	Sun, 18 Oct 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343708; cv=none; b=upjwmOYWMkT7tzG7nStk/Tt8j+qAp5gzl000jglqa+u2ONjjrQjhTabBtdHS6QM2puusHub9yGrKu9P4xbmIcA26T9h3fDdyZxO8qbprPDtrJCFD2RjwWvVi1p270dS3f516sj7xtmH/odfzjQrxrS7EWIV6kkWemFbgL/LbZ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343708; c=relaxed/simple;
	bh=JIux15dffCSrnYSm37dmSpDaY3oT78RSkHarDoocLOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDlxYCiqq6yRrhV4Qrtk7Qi6qTeZY0xn78BvGeuLLIGnYRk3flQ3bqdyueAW/x88hYJrMm+8yRzITadawVKUIHf/vNt2nVKJLJVz/ysZYFH62CxiMkrB6BwRaYoWtIGjyHuLJJihQEhu8MatZ48PiqwXoYUtUwVJazWtlBq/5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQ+JFbv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQ+JFbv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38591F000C4;
	Sun, 18 Oct 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792343705;
	bh=MbXeNQcWQxaO7M8EgEPtS1U/WzsH39gu2qpw99kTj2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XQ+JFbv4d6/M4KcA9QcOxjcREx1vhHU/G+QObvTa9JCQo8EHu5ak9Ltqotl8yP0lL
	 Wvc3/nU0TK4Ed3ouCOcgUiCCmU1YxhGpVdOvyi/3GOPy7bIeKN4GNlQmYQD2ycBg2W
	 fEJZ1AKN+vHJmSIkKHa/LZAQprIuZ3BagdSimDwtRtqt9ALSry4XcSUC9TuL19gLeC
	 YvSi5kuRVe1rNTcgxgW4tDVHGogWgIlrk2AAtrTna4wPMwkgNQBPMT4QnW1s91l1fb
	 fUL2ol5TIdbB7nN7bHuPYckTSoXNGcNi/AnC2cp8I/UCdHR5nLMzitFv1cRBeoZTsI
	 zAWawyxT7qBYw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 261B31AC57D1; Sun, 18 Oct 2026 18:09:11 +0100 (BST)
Date: Sun, 18 Oct 2026 18:09:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: linux-next: manual merge of the drm-rust tree with the rust tree
Message-ID: <atT9N607SQ4tJOFx@sirena.co.uk>
References: <ar_0MTEPHARiUqc0@sirena.co.uk>
 <CANiq72nR4sz5xvTVqqnwvoVJ0s-sDETQyPc9MUKo2698Ocp-Kg@mail.gmail.com>
 <CANiq72nALxFQ9xDe7xU26e9ae+25-=v3wmapz_SqA7UuqPvRkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UPxeC/v6Tl9iUpz8"
Content-Disposition: inline
In-Reply-To: <CANiq72nALxFQ9xDe7xU26e9ae+25-=v3wmapz_SqA7UuqPvRkg@mail.gmail.com>
X-Cookie: You will forget that you ever knew me.


--UPxeC/v6Tl9iUpz8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 06:37:58PM +0200, Miguel Ojeda wrote:
> On Fri, Oct 2, 2026 at 8:43=E2=80=AFPM Miguel Ojeda

> > since one is a re-export and has the `TODO` message, but apart from
> > that, it looks good, thanks!

> This is needed to pass `rustfmt` too; so I have noted it in my PR to
> Linus -- I thought we were enforcing it in -next?

Ugh, I think that's another rust getting itself turned off silently in
the config thing I think (I was missing forcing LLVM=3D1 on the
rustfmtcheck build).  I think I've fixed it, I'll double check tomorrow.

--UPxeC/v6Tl9iUpz8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatT9NgAKCRAv73Ows9A4
iY7TAQDE1lVPg8v/KqdjtTiZ1iRLU+buzWdGkiOngCWLQ40EHQD9HAK+AaT2EvfA
ukYKFCQvbqGB2eg5SPqzCxT+HF/Tig4=
=GQse
-----END PGP SIGNATURE-----

--UPxeC/v6Tl9iUpz8--
