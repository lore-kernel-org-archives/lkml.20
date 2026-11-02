Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646067;
	b=LyPXT8F7v14pgagivL0o8xdRyl8jtlMZMKPT5OXamoA2ocGkKHtsqokffntxVEvo9336
	 BkhoEJRuGfArvML8oZWEW1WNdlA7z2+Wy3azeYfrRaZyoIuoSUnRLxvYchtai8gicBljm
	 9iebmGT3x46n/TGyzeYKgN/6q8BgE4jyDJ+MQ9jL6jt2b7MiREH9ABuAdtMLkaRflFlDI
	 uoNhaDVw/C5A8ekd7SDlNcRATv2tA/uQfHSG257OX8GTjFreelAdqfewz0j1O810+RNr8
	 hUL2RBRdeQfNuazqPemwFq1xfhSPmv1Rfy6X77MZ2s4dXXnDcZskJWd+iNSr7ehKlVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646067;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=ZecBYjWUhN4z7fJ6GXfUmUEfwYtS6fvFv39qR2svdwg=;
	b=2rZBnv/LtmdJnlGZqTUe6iaohj+28EIDbKwwcE5niDVvbaynvGucPnCwaaaTyIT7ie15
	 35so2sUmXhHo5KTU4hX6xOyJVUCdfMTdx0Q17jSrmMPo0qRFW5yLd4NG5R7/OusOLcOsx
	 ZmQEt8sLJLtWIdl3Uj3iPD2daZ2l9tNpFE4rHIZheMKxX/u9SCEwOYmE3AgmvA2XeLrRo
	 rdNMo+r0lhWh2JZ4i2tInQ1z6rZ2K99wxwXMqi7xbIPIdqmIX9OzTIPxl1VZSaP9X8YYk
	 hhi5pTBGtjBSM6DHI/fvNwxf2D51Uey+uPBzPZCaDYNGWNBb/Y3rDL9QNWOkNBqC18w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrJUtj1Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B93E606A326;
	Mon,  2 Nov 2026 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrJUtj1Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6741F00A16;
	Mon,  2 Nov 2026 19:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646067;
	bh=ZecBYjWUhN4z7fJ6GXfUmUEfwYtS6fvFv39qR2svdwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OrJUtj1QmMk8l1ckUmFtbmCtyGHk78wo4/k1AMngqmUzGb25vHp7820KWVkl2lSMF
	 rmU+YOR7SyfXAoSs+sjcUYAhq+M4MI5oqqsNvpPTU8IEh7uaxIEn7NNoNaKNUyyDLL
	 ZWN6jw+KcG8SvcYQMTXHaIHLk9ThnnrVMfcODPpGalpIZvpIe0nE1oYlR3Bj9kcrIs
	 C1S2MrFKRWxx39BqfcRMfho537Saox7qxlTGPbwesu/SdrCmRKWuUMinDs4+qNA+fC
	 HgT89W9Ii8pqPgUTdNXc3aR5n5uanYs7dmKQV8zvfmF3zuzQ8BaBFy8poI72foXumx
	 L5zWxtz03WDrg==
Date: Mon, 2 Nov 2026 19:01:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] riscv/mm: fix up the mm-fixes merge of
 free_pmd_table()
Message-ID: <b396618b-fa12-46c2-9140-d9e555dc8408@sirena.org.uk>
References: <as0D2sHzh_UnNF5L@sirena.org.uk>
 <20261030221401.155797-1-sashal@kernel.org>
 <20261030153347.5641a97e22e18ddff6043416@linux-foundation.org>
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
	protocol="application/pgp-signature"; boundary="d4hTvcyUwKyTx7AM"
Content-Disposition: inline
In-Reply-To: <20261030153347.5641a97e22e18ddff6043416@linux-foundation.org>
X-Cookie: Used with permission.


--d4hTvcyUwKyTx7AM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2026 at 03:33:47PM -0700, Andrew Morton wrote:
> On Fri, 30 Oct 2026 18:14:01 -0400 Sasha Levin <sashal@kernel.org> wrote:

> > Mark, this applies on top of next-20261030 and is meant to be folded into
> > the mm-fixes merge resolution. Next/merge.log says it was resolved using
> > a previous resolution, I think the one from the risc-v/mm conflict on
> > 2026-10-12, which had the same problem (next-20261012 has it too).

> Thanks.  The "mm: Fix page-table teardown during memory hot-remove", v3
> series was problematic, but I now have all four patches lined up in
> Muchun's as-sent order in mm-hotfixes-unstable.  I'll push that in the
> next hour or three.  Then hopefully any -next merge resolution can just
> go away.

I skipped Sasha's fixup on the basis that you'd already handled things.

--d4hTvcyUwKyTx7AM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmro3e0ACgkQJNaLcl1U
h9COuQf+O2VXd86qGVq15jkmyMh4j7Bj5xIAx+eVfhmzlQ45rUKfhDjZ6Pq6h5h+
1TdZGPLr1IJxy/0qf1JJz5fkPGJFAsuzPD9EL8N004bOqyyRkfodbCitEFqElTkF
5uTKNfKdCLxamg7DbokoU8IdYo5nreN53iJJrBuXNL4ENGgeiktDyqayZxBFWmcQ
AdV/7nfbFs49gftjcdI7/YdtwCmgYZaVp/jEKTz5aCnxZ0VCLTj0UvPbI2PViwtY
QVB48svqCofi8vlzR0uaYQnws5+YRCLw3Lva/bnMFftefvg+geRww5pCuH5iTPET
QLo+yXOc8G3jxE0EZGeN7Nj7EIF45A==
=TEHF
-----END PGP SIGNATURE-----

--d4hTvcyUwKyTx7AM--
