Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9744E4C36;
	Mon, 19 Oct 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414805; cv=none; b=H/Z0u53IU4FgBDAaoDeHW65MZaAyS3gioAwCLvB4u5Rr9NqJQpoMbJ5uhmcEF+VZI2IfS0lYP5OT0VkmfGwlY3ll84BShNet/xjvXeBYvUr2CugJse6/GBA0jfddlX3ciL0mprlzovAQLI1m3dnKhSONMeO7nwDMlBGoKJg3MEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414805; c=relaxed/simple;
	bh=VZywbayhSb24Qw25QP/wz7oSAsaYw9mtnbMYChj+sfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAcFzUXses/xBtgeNhL2KuNAh0b8MUl0XJRVw6dXFGMoRfkSk8lWmndwgkb7LODh9wpjfwPeQnpwQrA+Iw4BqfVEKHg2UFHA56FngP8Mt/QJvOeDUb6EIQ5TpPkmzopUi9Q2jbPrEVqLAgIDShBq/Le+sTTZVqgy1Ml+/cMTipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knHrVtwQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knHrVtwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4991F000C4;
	Mon, 19 Oct 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792414804;
	bh=VZywbayhSb24Qw25QP/wz7oSAsaYw9mtnbMYChj+sfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=knHrVtwQ3lbVhBLu/bhOqzvEULh2LvA4ThIBjbIlbU6xE4xrdv4eYWSufvlfUYqXO
	 tfYgNcHewXYWpTRqWchYQTJDVjlR101pQykshuMrAFH6sfS75Pk4ZGVxHDY9akQVLT
	 iOkqz0EbFL/FbOVaoPtlhfHgOP65M8/Ajm6ZGMgeZ4ibP+9SIxS7DBuiTRU/rq7TGX
	 BNnOMpiWSSB0qDiw1+3jx9okGFf7Eh0zY4QmyH0pKsTnwt57WgsmjxGuDxkf29OvIZ
	 fs1je2mO1nDmrjitWAbVHuEBf5x/YHz4xQOe9B/debVoSEiG24FyA8yao7VPi2n8le
	 u7bisA3DzYn0A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4E8D31AC57D1; Mon, 19 Oct 2026 14:00:01 +0100 (BST)
Date: Mon, 19 Oct 2026 14:00:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Carlos Maiolino <cem@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <atYUUdnkCxX7ZQ__@sirena.co.uk>
References: <arUS5b85ed6L01qc@sirena.org.uk>
 <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
 <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>
 <araNBVKW6MXR97P1@cronus.toxiclabs.cc>
 <20260925141448.57220a7d3f76b92d8f1cb130@linux-foundation.org>
 <99ec7529-0733-4d04-a30c-d9a2b299182f@huawei.com>
 <f7d2fe6f-558a-4bf6-bf17-00f3842b923a@sirena.org.uk>
 <20261019114806.1298980-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LKHl6zQDb25PeQro"
Content-Disposition: inline
In-Reply-To: <20261019114806.1298980-1-sashal@kernel.org>
X-Cookie: You will forget that you ever knew me.


--LKHl6zQDb25PeQro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 07:48:05AM -0400, Sasha Levin wrote:
> On Mon, Sep 28, 2026 at 01:48:14PM +0100, Mark Brown wrote:
> > There is a fixup in -next already which is hopefully OK, I don't recall
> > it being especially bad so probably Linus would be OK with resolving it.
>=20
> Hi Mark,
>=20
> The fixup in -next takes the mm side of xfs_btree_split_worker()
> verbatim, which puts xfs_trans_set_context()/xfs_trans_clear_context()
> back and drops

Thanks for these.

If you have fixups for merges in -next it's much easier if you can send
an incremental fixup against the merge rather than a completely fresh
merge, the tooling uses a rerere cache so unless there's a new conflict
in the same place it's hard to get back to the original conflict.

--LKHl6zQDb25PeQro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatYUUQAKCRAv73Ows9A4
ieIDAQDxTZ3qnv0aLwl2Vq5cwUbLm9QuvVtMHd/UYM0OOd0gbQD8CP9R1B96v4ih
01E+Hibt+vZx8CZAjlhhrtNeFUfWvQs=
=YI72
-----END PGP SIGNATURE-----

--LKHl6zQDb25PeQro--
