Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBB4539761;
	Tue, 13 Oct 2026 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919487; cv=none; b=bpm6Zgt5lRyHznCcHLTqcV9xguBbzEEZMmVr21tdI2I4DNvogKn5m7TyHGbt5Ut7mx+0BUcYOpXbxORp9p5sY84MNAdpRx+QzoJhXV3TBgysDSWzCtoBGx93qEcswEEUVYxYAsZemK8bO6OBLKgc+otppfJDk3lVlNhhybVye20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919487; c=relaxed/simple;
	bh=iJ5kzuJ0et7OajBxoMk6/MYlL6uZ2MZ2ZMCyNbQXB5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spy/gNAwsfdNvdYH0MWK59+i2htqCK+IilrAWtWpWO2MfVwFLS+ZktwtAKx5mFcqG/POTnJFHMUTGVh0mcXPXzt8ynDjC88yu+9hJSTjorTKP/zeKeUpT1oatWKn+UQyqEhK3lK6SVk6vh4WUUijmSIohmE+AyuVvGQeUO0+8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HySpgGcc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HySpgGcc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBEE1F000FF;
	Tue, 13 Oct 2026 19:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791919486;
	bh=iJ5kzuJ0et7OajBxoMk6/MYlL6uZ2MZ2ZMCyNbQXB5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HySpgGccUm9cu/zchbG31cZSR5gQdZvfoHnLzbde2n99zewASJBP+w9jz90VkpocS
	 6XmjXJAyiHSEKPCGR5/1CpSPt8sQwOWJiXlV2FLB1KbnQn75b++BtenfokNzbayjQ/
	 UUaMyrQMGw0c2aM3hIMxNtTr9JWkwhnHtJ02b7DHvotwf0lZa7SISvRclNq82t8sNl
	 ko0xYJkhm8hiJnGzpxaf7rsXGt3PIM3G0Pj2EwjtfANFCQSdjEt+2lnJk+OxEgJV93
	 XYjxjpFeKse1TY4NtAOcalHGu9sJRbCmKgqyhzyqA0dQknjwiczdIKwLOnyF24ekp7
	 bp9plCEEZpOWg==
Date: Tue, 13 Oct 2026 20:24:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20abeec3-1e55-4ff9-a5fb-05d5039b35b9@sirena.org.uk>
References: <as5jnDJEt1iZZqZk@sirena.org.uk>
 <3ebc7573-59a0-457a-a9ae-104c56010837@kernel.dk>
 <c4818b35-67b9-4413-bd36-c17660fa6a4e@sirena.org.uk>
 <4c9528bc-a015-46ee-9464-7d1e3bafa40e@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XbDaMMSKEZh44qfz"
Content-Disposition: inline
In-Reply-To: <4c9528bc-a015-46ee-9464-7d1e3bafa40e@kernel.dk>
X-Cookie: Some equipment shown is optional.


--XbDaMMSKEZh44qfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 01:14:49PM -0600, Jens Axboe wrote:
> On 10/13/26 11:20 AM, Mark Brown wrote:
> > On Tue, Oct 13, 2026 at 11:07:56AM -0600, Jens Axboe wrote:

> >> This is already fixed, which sha did you pull?

> > I have 8ba95aa196dc8f3fb50f123f9fd32459d65a49e2.

> Yeah that's outdated, e8b704b323f93c6b860b955d9f19c3a8877a163e is the
> current sha since about 3h ago. Guess it just missed it.

For the most part I fetch before starting the merge, I *might* pull
additional updates during the day but that's very much not the norm.
This is partly a speed thing during the actual merge, and also because
it reduces the risk of issues due to interrelated trees updating in sync
with each other and the fetch catching an intermediate state.

--XbDaMMSKEZh44qfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOhXoACgkQJNaLcl1U
h9DXrQf/SwiZtAtS+2PG705seO+4Xj5y2p3qG9E2vWKVgD2EvdYX1yyBACUwxS6X
b00KrrhjN4R2Y2ytCfDObk579XaCOsBKKZRGzyOxoZzmJ+H4ohcRaDAebSoxvXLL
sAQy2v4Ditzt6VG3WBQyP/muSaDEdvgpewTLpjhshIKJMdyPuL4CDrRtFhgVc/Zz
8Dk4KekwaA4CoKeoDMDmrmddh/0NMcJbQX3qTNz5FN0e36SzRB+a2LsrE5cKmmrA
O8ssw2YqU1XOh7eplFll8s23mVt/dXuGNKNU3rIkeop7bXmt7OzcXloAVoZMupg+
zlSH3DyyRmYS6+q9Uvm4czMyjP7jMQ==
=jvB4
-----END PGP SIGNATURE-----

--XbDaMMSKEZh44qfz--
