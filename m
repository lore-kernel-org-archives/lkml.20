Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31C53845B3;
	Mon, 28 Sep 2026 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599700; cv=none; b=bA4ZKaVAHGMmpRUSQjNE52perNcNSpO3EmKRl56qNZziu1VY99s3AjECkKy8QojfwtfukjLyiZZPwrXvDyEtK/VXwOLdDNz9+1h7H1dgaU8nxrFyG15/B86C3K17Ik7CssrIdj8/XROasrf4jEUNaf7MEFHydJkuGjuMhgC8js8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599700; c=relaxed/simple;
	bh=c3o/WvzsLi6fVbulPCvoO56UYvVd0dOAtwKQ7GUsu+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=socPzPBpOetUKeuifrJWpzMtPb+B/H1MDMQdixltC2P+yILML8tEA/mzp2qGhWqW6wds0NunZclJZ2R4Eqcn16hQ0e25bwdIfgXOCkEUDWjGL7UT4uTeLHRCzMy83aU/iE01Rt/U2CYqOYqXl7LzTm+4ivVOZFnYVZXICPjX00A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMcuEBUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMcuEBUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD321F00898;
	Mon, 28 Sep 2026 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790599699;
	bh=c3o/WvzsLi6fVbulPCvoO56UYvVd0dOAtwKQ7GUsu+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SMcuEBUtRn1C0Sj0Mbp25+NR6sK6VGRGV/MI3qU0K7O+gaNOZLVS2Qw4ddrc4EyMY
	 q/fVs5jYp1b+d3y0q9hIm5aWxnNGAsYLsYf0tOx2ZuK3x9jCy3AgH3rQXx2q8oN1cY
	 qG8FNiQ+WFWo3o0Lx8lC9YoPRfCC7ZpGZlu0BDUt+MOU+Ma2Y91mUdYSUMkzq3GOdY
	 IbQiGgNTO3W+PSYGqDimXe5kS+TBb4VkxTnG8lgHY7Un5f6ygDmKAEoFDgZo93gap4
	 /Es0OykX1v1PSBxNeOf6syWr27TbpdQZvTw7+khTAQe6AOckMSSjbqDmna1hTSV2p7
	 YVmDi1wZFfyJQ==
Date: Mon, 28 Sep 2026 13:48:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Carlos Maiolino <cem@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <f7d2fe6f-558a-4bf6-bf17-00f3842b923a@sirena.org.uk>
References: <arUS5b85ed6L01qc@sirena.org.uk>
 <arZn0IB-L3hnNniw@cronus.toxiclabs.cc>
 <f9ddfd24-ee1b-47d9-a906-299421247b1d@sirena.org.uk>
 <araNBVKW6MXR97P1@cronus.toxiclabs.cc>
 <20260925141448.57220a7d3f76b92d8f1cb130@linux-foundation.org>
 <99ec7529-0733-4d04-a30c-d9a2b299182f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o7fEZf8enH8T5AeY"
Content-Disposition: inline
In-Reply-To: <99ec7529-0733-4d04-a30c-d9a2b299182f@huawei.com>
X-Cookie: All is fear in love and war.


--o7fEZf8enH8T5AeY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2026 at 08:26:34PM +0800, Kefeng Wang wrote:
> On 9/26/2026 5:14 AM, Andrew Morton wrote:

> > I suppose I could add the standalone fix to mm-git as well (with xfs
> > maintainer acks), just to make life easier for everyone?

> Maybe Mark will fix it in linux-next, or as Andrew said, merge all
> the patches into the mm branch, but depends on the maintainer :)

There is a fixup in -next already which is hopefully OK, I don't recall
it being especially bad so probably Linus would be OK with resolving it.

--o7fEZf8enH8T5AeY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6Yg4ACgkQJNaLcl1U
h9DWVwf9GnCyJ9kL0stA42utQJHh2LkVMT62YG2EVd5EOjf0pZe6yWmm23sQDEuM
scnyFhW1gyQQeKT8stRdBI6C1k1avLtS5Uxbhtc7q1YzFtWW1YW61dr0qgGe/bB0
FOeFINh3C2gIr8Dpgz4LMUNExViLSOnM0yZpWeTHH8AKUygYYoIDtC94oxcNSdpw
d4RVnQgisjLYa1h1X+UwHkNdjmogMuAdD9u2MS3VXke1i96nmIgEFNnp7UctO0Ai
HhNVZHMBLdtOSfsxm863hX0jSCs5S9rhBw3LOPy2dKrrF4CfstAPa5EWzgUV0CXP
iPJ9yIk/3KnOPkAENV+bLPDM98uZYQ==
=xjMN
-----END PGP SIGNATURE-----

--o7fEZf8enH8T5AeY--
