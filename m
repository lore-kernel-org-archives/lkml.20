Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED9E4D6C5D;
	Mon, 28 Sep 2026 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612847; cv=none; b=KKAkUOJZ4kS5CkPXZ1TB49uDRkZlKAChbD275u8IDWw0RAg0n49B5i/eUMLyVKVw2LFso4tDxoUrYYlQCwuq4+7n67eNyaYFnDEPeD6biBKkJVwqDMbw79+PeL+R+eppiI8S11VmqL6EQaZdIrW2+m3F1LGaxrG+41I0NWV1XU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612847; c=relaxed/simple;
	bh=VIsOEeLehP0Ihm4bsp4De9I3qoaPWrFpPfjKicn1Fqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESmMaal10yrxV9sVQ86ycE5CCy9tvkzkauIVjKMlgtTxdXjqbSsy5JtL2by5jmk28Jvtlk+ELURvbriQzSvQeeCWYcicwKv6jF1qi0X6czRJKogbl1yR2OQywVw2MUQ2AXHGrV+DZQqPOwjzd9voNhbZpegwcLp5+sKPBYfdFtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no4eYeWt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no4eYeWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53BB1F000FF;
	Mon, 28 Sep 2026 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612846;
	bh=Gn/oxXuaStegs6kQywFv0QA3NhngbzvswKo855cMA44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=no4eYeWtoPMvUGJbMHPXlyQvg+A4ee8Qsdi65QRfb18h1Tq8iewRcc8pjFbjB21Wg
	 cug8N1UFRrTIuEy4u2r2LYS+tyGuIiKD5W1knOI969XeR/Tu2E9F/DWeNC1FK6uzpG
	 sbHd8sTSuXPGvGbnldOk2wDS+Y2b6CC5+C6rXnJS6y49ghr9fPjCMT3Obak26O947B
	 nYOy3UwR2ffNtxrdS3GZ6z+0oDMxi1v0sJni+5e9E05LH22q23fXfbn0lxc7uW3QIz
	 qOKbTl1Lly8VUvLKGPG8b1gYOWW8FgfjLDMI/VdDAt8nOUqlAI5uFekH0RakHKFtjS
	 bmkWfMM/6qLjQ==
Date: Mon, 28 Sep 2026 17:27:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <647ed0f5-360b-4d05-aaa9-9f3ade6f6b7f@sirena.org.uk>
References: <arOMTa0L7QhM5RyA@sirena.co.uk>
 <96944c10-2a31-4e54-923f-97a608663221@sirena.org.uk>
 <CABBYNZL_vs+_MudyOBDK+pBJtOYcEEE6snUhU_btwAuW0RTjDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+RjvSxIoNrbUlDxa"
Content-Disposition: inline
In-Reply-To: <CABBYNZL_vs+_MudyOBDK+pBJtOYcEEE6snUhU_btwAuW0RTjDQ@mail.gmail.com>
X-Cookie: All is fear in love and war.


--+RjvSxIoNrbUlDxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:13:19AM -0400, Luiz Augusto von Dentz wrote:
> Weird, this should have been fixed in the last back merge, going in
> the list of commits in bluetooth-next
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.=
git/log/
> they show as:

> commit c9c15d4d8956df8c564f7c210e4dc5b9b820d97a (gitolite-bluetooth/maste=
r)
> Author: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
> Date:   Tue Sep 22 18:33:11 2026 +0530
>=20
>     Bluetooth: btintel: validate DDC record lengths

I have this commit but also the older=20

4712bd9a14cbdd712fc8584f18be332b9ceb70b0 Bluetooth: btintel: validate DDC r=
ecord lengths

I didn't spot check all the rest but there's a bunch of what look like
duplicated subjects.  If you did a merge then both the fixed commits and
the original problematic commits will still be in the history.

--+RjvSxIoNrbUlDxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6lWkACgkQJNaLcl1U
h9C4Iwf/dOL8DZsPrtD8awW7hSBdgoUQFNCwnHfXVjFKoB66XQzKVO9C3bHh0PrH
20plHCRRT4bPalQPCWSTipmnXWKDt22nF6YIN9iPvXEjujp5qEgWv1Kx/r4mMT+y
5gQJ+uqMea5CvduUHLRFZyIDGn75605wAU5FuiBqxA6ycl/9P3HRJ6B9rMSng/tq
XxE7/JIj4oP62H3G7+jh2/AVnBR3Rx3u69AXy6keq6pTg0IODEgmX6e+tJZzkzWf
CHjDbi6HpDZAs9Lt+dBS3LrwlLOnMEG8bFz3epA3C6rt7EMbL48PIbZMCj7S8GLX
mgFtGW3mMagsKnlGNUk0pBkL50rhTg==
=sns8
-----END PGP SIGNATURE-----

--+RjvSxIoNrbUlDxa--
