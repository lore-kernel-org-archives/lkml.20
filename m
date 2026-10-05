Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBE543744A;
	Mon,  5 Oct 2026 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191926; cv=none; b=NZ2Y9rNxIu+c5cCcDWaK/bAV8bOxrlxjexPpr7B71E6r4CLsm/qQxWf2Zc3kMMSghxhSspCKZibzzPMQdGm2iKMTnymVk7yAnOFwoFF06TFMJKLZzeFYMJx0lNMqDoHKj2b4bOzd4/8eBLeQ0PgGlXT4qOCNbNH5U+ppEt2TOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191926; c=relaxed/simple;
	bh=C1A3a/GNITXM68GPw3uyjFlGIqpmsLhypBq33rEyjjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzXHtoi+K2KkYn2KnUsB4svXS9ywWVREMZ7WQkj0qS86sTJkA8Drfcs5q9XKaLL2SOGzr5p15enci/fZT8fXJwI83IV6xY+3oUN1QkSc8ymRlgCF3mU+MutMU8v7BN44228F8d7jMYuKWuQ0m9r8/B7Gjp+o9/8cLfOCI8pb+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDgf6z0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDgf6z0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18C91F00893;
	Mon,  5 Oct 2026 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191924;
	bh=QHrnoVMyn5+uGtTkGnEOkH/QvDPLDdRxKlsjxotgs58=;
	h=Date:From:To:Cc:Subject;
	b=MDgf6z0PEut4AysBw7WzqMk9ierAFkxvrEc8RdY8d4GmzSXSxohgn9UkLscGgTOwA
	 zMzLlCAb6fVoV8RXVN6b34RoFiyZYnkmSCGcy5t6jYZusmQK0wgB8XMEFUbgj9kgIU
	 TKSshy5DvVoEK9A2fjXZdtKVevOaI+VVumt1bkUwh2PCmvTmqJkARpKWNhZfpE7VpL
	 sVUt8xMGsjZI4tjbv/NupfakLk3B8DeIkcOYBbAv8Dwz8BetuDEKGtEZXEK1ebAB+5
	 Pr8ihAd8ntAsIOqZCWee9uQKhiGaSiAGoK/C5OegAYf/KOEtSn4lkbKSjmTCArZ7wT
	 eRgPdDkZAuLjQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3663B1AC57CE; Mon, 05 Oct 2026 10:18:42 +0100 (BST)
Date: Mon, 5 Oct 2026 11:18:42 +0200
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <asNrcuWGpww-8XUS@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="faB4EPMUNqtQBSij"
Content-Disposition: inline


--faB4EPMUNqtQBSij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(arm64 allnoconfig) failed like this:

/tmp/next/build/fs/nullfs.c:55:27: error: 'nullfs_nolease' undeclared here
(not in a function); did you mean 'nullfs_nolock'?
   55 |         .setlease       = nullfs_nolease,
      |                           ^~~~~~~~~~~~~~ nullfs_nolock

Caused by commit

   580de1b24ab7a (nullfs: add an empty immutable regular file)

I have used the version from next-20261002 instead.

--faB4EPMUNqtQBSij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasNrYwAKCRAv73Ows9A4
iZZJAQCPIL77QwYfAKQCTC7EuHSF1d5qHU00wYXib5mBMysDlwEAqyr80XdApd5B
Da1pOurNNEzgB4Hl5sjBeHDceEtX1Qc=
=S7sr
-----END PGP SIGNATURE-----

--faB4EPMUNqtQBSij--
