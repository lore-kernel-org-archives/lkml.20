Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3649B21D;
	Thu, 24 Sep 2026 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251755; cv=none; b=N47HtWAdT3Uf3I+lqiUQiBTf6nJkVvHtCrPlceYeOEy169aUhoThaFvWMZyIVArArAFZ0tjqUZLcvx7I1FBcZ7LcrjNihdMMJEjFXOzX7WjgUWj1ld8qx3sTBbAsOMVCavWc1qmbkoNNFpcHcn/0B3mkVh2stUm1sSt68mpZswE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251755; c=relaxed/simple;
	bh=yeMNU7BMCe7YkAvZy/Z+WOjqXhBBqJw9L3WwRM8CpoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YHhQROqMaEP/J5Snnn2p9ICnosoJ/68c8DVW4GuFEhSb4iCzxu+tzZobdJPjfnZroNVqnrwZ6fZLmYHTDmigktiVQ29629co9esU1fFeX3k4BLN0UotQ6koG0vsGLL7JrHm1PFfr389hszTz3EUSUreQXW0v4D6cgsPzbWEyqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgpoUMHf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgpoUMHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D44F1F00899;
	Thu, 24 Sep 2026 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251753;
	bh=T1YXErhRigt2RjHpU9GKlLoSjLm4MRuaSzfi6tLjero=;
	h=Date:From:To:Cc:Subject;
	b=AgpoUMHfXMWMVcNlaAfmr4dzoCOALjSBBzyC988w7O43dofecootUeynvm+tmwkdn
	 c265RDpRVXjB+MKuoahrrN8NaNXjfkWFISofnmjRwR3y1DzhoaDIVDQtCYsT8+mvM7
	 8fuRcwHsVscR16OV9I+lwEvkzpVwlX+sJDIeNqwT2RlSURkp8/jNHeIH7RR9NYr4Im
	 4XWvlocSxGWGSAxIPXF9a1BGgBnG1SH87LjKJWXXHAgnh6g2uZp+aqJ/+tMWwZBxoz
	 b5gT60dgZSovaMg04wPbz8E512A+G8FdxJbJExiBBTLDJIQI0bcTtY6x6/zVxQkmMh
	 vKva/6j5iwsSw==
Date: Thu, 24 Sep 2026 13:09:09 +0100
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Carlos Maiolino <cem@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <arUS5b85ed6L01qc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xTXTWLEHrcKvTktK"
Content-Disposition: inline


--xTXTWLEHrcKvTktK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/xfs/libxfs/xfs_btree.c

between commit:

  4d1d71f8b90dc ("xfs: remove dead kswapd flag inheritance from btree split=
 worker")

=66rom the mm tree and commit:

  26f42375404e5 ("xfs: fix NOFS state corruption in btree split worker")

=66rom the xfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/xfs/libxfs/xfs_btree.c
index 6738d9d1511bc,7effebe297ea0..0000000000000
--- a/fs/xfs/libxfs/xfs_btree.c
+++ b/fs/xfs/libxfs/xfs_btree.c
@@@ -2994,6 -2994,7 +2994,6 @@@ struct xfs_btree_split_args=20
  	struct xfs_btree_cur	**curp;
  	int			*stat;		/* success/failure */
  	int			result;
 -	bool			kswapd;	/* allocation in kswapd context */
  	struct completion	*done;
  	struct work_struct	work;
  };
@@@ -3007,18 -3008,39 +3007,18 @@@ xfs_btree_split_worker
  {
  	struct xfs_btree_split_args	*args =3D container_of(work,
  						struct xfs_btree_split_args, work);
 -	unsigned long		pflags;
 -	unsigned long		new_pflags =3D 0;
 -	unsigned int		nofs_flags;
 -
 -	/*
 -	 * we are in a transaction context here, but may also be doing work
 -	 * in kswapd context, and hence we may need to inherit that state
 -	 * temporarily to ensure that we don't block waiting for memory reclaim
 -	 * in any way.
 -	 */
 -	if (args->kswapd)
 -		new_pflags |=3D PF_MEMALLOC | PF_KSWAPD;
 -
 -	current_set_flags_nested(&pflags, new_pflags);
 -
 -	/*
 -	 * Don't use xfs_trans_set_context() here: it would overwrite the
 -	 * caller's saved NOFS state in tp->t_pflags. Use a local scope.
 -	 */
 -	nofs_flags =3D memalloc_nofs_save();
 +	xfs_trans_set_context(args->cur->bc_tp);
 =20
  	args->result =3D __xfs_btree_split(args->cur, args->level, args->ptrp,
  					 args->key, args->curp, args->stat);
 =20
 -	memalloc_nofs_restore(nofs_flags);
 -	current_restore_flags_nested(&pflags, new_pflags);
 +	xfs_trans_clear_context(args->cur->bc_tp);
 =20
  	/*
  	 * Do not access args after complete() has run here. We don't own args
  	 * and the owner may run and free args before we return here.
  	 */
  	complete(args->done);
 -
  }
 =20
  /*
@@@ -3062,7 -3084,7 +3062,7 @@@ xfs_btree_split
  	args.curp =3D curp;
  	args.stat =3D stat;
  	args.done =3D &done;
 -	args.kswapd =3D current_is_kswapd();
 +
  	INIT_WORK_ONSTACK(&args.work, xfs_btree_split_worker);
  	queue_work(xfs_alloc_wq, &args.work);
  	wait_for_completion(&done);

--xTXTWLEHrcKvTktK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1EuQACgkQJNaLcl1U
h9BbKgf/QqCTh60Caf5ZptiDSsDQai3X3U6+WrpG9b6jc9DprMvoFmbWiGLvYzWj
6JTQkz9rQxTkwOsDf2cz8+j/zeCvmmD7GCI4H91ZYztVC7FIlMglJHb+hLCc1rb8
vrayDeq0VfLysuw0jSAcDXlBmpZaiuWmYc3bd0VesM3aBfpCzwbJESc62a/yGqM9
hfWQ1B/FiSzV2h1WIPKUOxl0PVwjS7JokhbscFxlPJI70pXH8KOAk578F695uYXO
3WhkPs5VumPHf9qcCFCS++hKYV0EbnfskQquq++F/zH3QJUMY2LdIB/uAQw3Ymst
jhI36P7mpo0bdc5d9jP+zGNye/18nw==
=vPCn
-----END PGP SIGNATURE-----

--xTXTWLEHrcKvTktK--
