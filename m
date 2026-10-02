Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EAC3101D4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962028; cv=none; b=Opvi5tG0TUdTBLWI0WRU5ZM5FuOAUOGDqY7tHyUHbP9PcRKHbD8bAiQMMacUYnpUvki7vbyfkQwQ8h2A3Ky+Vd5fwLVg+qyc4MSA8kzA46RcvueC2NQJgdGjfY6qpCosyNcW8OIag084ftxg/+nYn2zrCRfnjKQPObUiP51XDXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962028; c=relaxed/simple;
	bh=QHen9gVRvjYiUyn/5n3O6WHDx/+r038TY1SB6RZJN2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f16q81XVQPYVBh02UymztiEsHUQNXXWqPjGXXe+v0mme5+dZt5sq5MLr1kNWg8PSOoST38dAmSGOVquUyRihPVktiFnETNMaRV2U6u8JfdldLSfivGqollBSk42xLAMluglAiWTf73J2D91FChpQE2E6Nv6qou38mQhAFLsMIPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLdc70Ls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLdc70Ls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253E61F00898;
	Fri,  2 Oct 2026 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790962026;
	bh=+vH2WwfIQO7e+TabRfQ/XtsKBsXs/zz1QD1ZBeHlAZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HLdc70LsrFHydw96NBOOlwPTsE55QqLDeBkjx+6V+qdMxgi5S4jpWxpTrv72dhgjk
	 UagW+Vk7WgfH0I/ycefk3uSEOuriCAbMQ+uhJEhdtvPVFRU+w/k9Tn9DUMjwBUKl6u
	 niGCId9pHg0adkwfUzOPsxL6JRgHJ43zu5b+5cT/1yUoafVqOw1crVOnIfMmMSNExa
	 GcscyP72OQRggvT0b/KN56o4SsIzpRDztRyL+r69QxMh84i414HbZnP2o9DT2VlYqF
	 YNSqKEpgOy7zk2i8VQ+Ss8d4X8QX1gJCf1D9OFw+mF0GOevKixvFW9j5GspwMJ4nUr
	 g+qRtF6hx1RzA==
Date: Fri, 2 Oct 2026 18:27:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Bence Csokas <bence.csokas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH] cache: Make cpu_cache_invalidate_memregion() error out
 if there are no handlers
Message-ID: <20261002-copier-storm-8b3548555546@spud>
References: <20261001-cci_enxio-v1-1-3c9e16024abd@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRb5nIklULYe5gBN"
Content-Disposition: inline
In-Reply-To: <20261001-cci_enxio-v1-1-3c9e16024abd@arm.com>

--nRb5nIklULYe5gBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 01:00:07PM +0200, Bence Csokas wrote:
> Currently, if there are no registered handlers,
> cpu_cache_invalidate_memregion() returns 0. Callers are expected to check
> cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, instead
> of calling this function. If a caller forgets to do this, they may
> erroneously think the operation succeeded. This is in contrast to x86,
> where cpu_cache_invalidate_memregion() itself checks if the operation is
> supported, and returns -ENXIO if it is not.
>=20
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Bence Csokas <bence.csokas@arm.com>
> ---
> I noticed cpu_cache_invalidate_memregion() returns 0 if there are no
> registered `cache_coherency_ops_inst`s, which I find counter-intuitive.
>=20
> >From what I've seen, there are no in-tree users who do not check
> cpu_cache_has_invalidate_memregion(). However, IMO the better solution
> would be if the function would perform this check, and not the callee.
>=20
> Furthermore, arch/x86/mm/pat/set_memory.c also implements this function,
> but actually does the feature check, and WARNs and returns -ENXIO if it
> fails that check.
>=20
> This patch that provides a low-overhead fix.

Hmm, I almost lost this. Guess my patchwork lei query needs an update.
Just happened to remember seeing this fly by!

> ---
> Changes in v1:
> - Rebased to master
> - Collected tags
> - Link to RFC: https://patch.msgid.link/20260922-cci_enxio-v1-0-00bade212=
729@arm.com
>=20
> To: Conor Dooley <conor@kernel.org>
> To: Jonathan Cameron <jic23@kernel.org>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-kernel@vger.kernel.org
> ---
>  lib/cache_maint.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/cache_maint.c b/lib/cache_maint.c
> index 9256a9ffc34c..132d2816d6b1 100644
> --- a/lib/cache_maint.c
> +++ b/lib/cache_maint.c
> @@ -59,12 +59,12 @@ static int cache_inval_done_one(struct cache_coherenc=
y_ops_inst *cci)
> =20
>  static int cache_invalidate_memregion(phys_addr_t addr, size_t size)
>  {
> -	int ret;
>  	struct cache_coherency_ops_inst *cci;
>  	struct cc_inval_params params =3D {
>  		.addr =3D addr,
>  		.size =3D size,
>  	};
> +	int ret =3D -ENXIO;
> =20
>  	guard(rwsem_read)(&cache_ops_instance_list_lock);
>  	list_for_each_entry(cci, &cache_ops_instance_list, node) {
> @@ -78,7 +78,7 @@ static int cache_invalidate_memregion(phys_addr_t addr,=
 size_t size)
>  			return ret;
>  	}
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  struct cache_coherency_ops_inst *
>=20
> ---
> base-commit: 551c722f40809618230001baccf219193e22fc5a
> change-id: 20260921-cci_enxio-f3d31d9acec7
>=20
> Best regards,
> -- =20
> Bence Csokas <bence.csokas@arm.com>
>=20

--nRb5nIklULYe5gBN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/pZwAKCRB4tDGHoIJi
0kpVAP96etVT1FApsItlllvTDJD5hXBu863rS8VHXE/yvLy9AgEAw/kKRCTWMObC
6/YmwZgcD8yL/SZNQnVzuK9BUvoISwA=
=HN1H
-----END PGP SIGNATURE-----

--nRb5nIklULYe5gBN--
