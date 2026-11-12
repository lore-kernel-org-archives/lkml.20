Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489040;
	b=f/l3b6ns4vQ8IV4PrO5Ry4RdqcG6HmdIwiSQjM27y8uu/ujJ9jXW5DhSfejlfSs/E8YY
	 6OHq+GM76U1SK4R1RYQ/k+GxelxhaceKr/OVA7D0pXKif9XItW2N4BfRaJZRUDR1u8aYf
	 zIQYIhHZLZ80wz1054CeY+pINUc8d60Ij0NicYV9bTWAZQeNsQHCbbjVfjSa3I+vsuiiB
	 T8rYQm+YBQVryuvJCgTo795ItWz393CfrN0C9CsJLnDhWw0OH12r6EBR0UW5NGw3yiKDo
	 sFWdel6W1r1YX28slijOEHcafIAVR8qyGAoXvYISjVeFC2zXToYrMcgemEYLlmM+lAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489040;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=IVj380PAN6i2RXdh4vzZRz56FatldfaxY7V+E/tV3wo=;
	b=a/CkQjQm1Rn4f78KOtnEXDM8HudFsDG/t/yDToMJnObi2PFYw7MW6tLObmbHy50H1z7q
	 QyH7Ni9UaCZfn/WNDNwyYiczkyqbSJ7Gz/N3VWCA4HHQO5wV9IETtKYg5DrUaDeOW1Sx+
	 B8woD3cBb9n72ykJn4Dvk1S4jiExWWIs01OJEMhTOlZ3miEWaP9tkeT9ZqLjSN//IzPtt
	 m5Eq6OVKN6oAIcOrm3YglJZYHxJHKQxARvMuQRYBa4deSPYkgMWIynpOF9E5oll2laARo
	 94AO1XyjGnWiRz9f99HfvEm6Xfr+iJNDCHnuCpyMPmM2R1ZEKrunW9dYFVwvgbTYBAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cblZTQLB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D2C606A89F;
	Thu, 12 Nov 2026 13:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cblZTQLB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6377B1F00A05;
	Thu, 12 Nov 2026 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489039;
	bh=IVj380PAN6i2RXdh4vzZRz56FatldfaxY7V+E/tV3wo=;
	h=Date:From:To:Cc:Subject;
	b=cblZTQLBkE1htEOfoHO2oMJ6Niy2IBt4sgM2shAtNINBYXhExAQ14/S6W1AxnQYvq
	 vOsxCjaIijEHcL1yJnipc4Tnuy3KJJFGGzA16fbi+1un0UDiDFZwWO4MlpUZ5w8LVC
	 Z04uKLw6o7Ru+T8Na5qBMcWrT78H74XwvRsm1DhRNGJCX6wHAqUpnyDXqFZNb5SktV
	 4APw98dX2FmQ314aIw2i+VzfypVXMNel8kSFKBr8qCGxTh+a9cIyfiGyTu21qtHCNZ
	 cQ+mNXuqhn7NYnjo7XzTHb1kmE1E2QyyoywEFLUD4hUOemRNnYcIvHpWazEbH+Esh/
	 +EAtSVwpIO15w==
Date: Thu, 12 Nov 2026 13:10:35 +0000
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mm tree
Message-ID: <avW6y0iTcap79Fqu@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="s3/2zGGQfWTPX3Ul"
Content-Disposition: inline


--s3/2zGGQfWTPX3Ul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  514a5f3b3a636 ("mm-vmalloc-extend-page-table-walk-to-support-larger-page_shift-sizes-and-eliminate-page-table-rewalk-fix")

is missing a Signed-off-by from its author

--s3/2zGGQfWTPX3Ul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1ussACgkQJNaLcl1U
h9DwHAf/WFsFUzKOA+twNGGKGk2ffVgTq9JL6dnPY/lLrFS+y0gtSpciCNlG0+PU
e4PajzgRWMT8BmjVzQpUY7WVHRhU3sbTnIFf0orhKnwMzq5G8cKYZXmiNp0g7wjx
c1v8brtxi9kMfpO+Ae4QT2vnnOPi/BI3VG9nifyXl+Wxr/5DEbGtXXIyn0sleCAY
aKjlxdBv6N+LPXBzwEv+7XanwrhWL97fqSkgfZigM0ftjaw6pM9yqUxAPd6HaO+R
9bXS7DCVVY3LqMaTaiTP5Qe6ooC+hdrqTTaLDNQjBqUDySiOdqJFdE7HAgqfHlhI
oX9M5QKGvgItu8UkfPtImkNNus6Ing==
=tr/p
-----END PGP SIGNATURE-----

--s3/2zGGQfWTPX3Ul--
