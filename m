Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407685;
	b=GgBm5SGaoVJxI1RS4o5K5wFvO96L/ZGEl1L3NftZ/KW31inPLfZ4xKcBIfVY9b+iQIzW
	 vHiG5i91SuMyH7ZOsGBwqBhob9/iVbhbalDywRkyVm6C8k0x5pd36XaPlkcehsdtMWnhE
	 4wGeZB3k89r7rd9e43iqlwJOkyFft2i9JRNqc2D84HMPREn6TbvGDV1Q0L6eLpYpKC4+M
	 WeMY6Kxipe1/mT4RSVvJ7X6DQ1XzlslubpW+ghX6E26pBSpF+VStGYbn5UoP6vALZDdTN
	 V2O9gDtoNwyJyQihEJhG8keZgiqwx5TlnaB6ybGOz7W1N1ppvz6e9rwASuxNEf2gBIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407685;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/BYwmTLc268SpihxQ/Qh7SWKMglfN7RDmuZifcHy5Zs=;
	b=ewdZfs6e665rdPLswW3Iup47iS1M5Tgk6Ph97njCMJBI4hIBgyCJryPnBa5rIHunGz3J
	 gCakhvQqt5i5hKru0ntjU7h0pyZv+DecASPi3ZXwSv78pj3dc7zPJ+R/AARfg0Ec6CD7g
	 Bcs3iRnuM/gc56ejHM4S6uzDsqjBMrv3ny8kGnTW3Dd99XcOA7YOV1gRhFGcD6teI5g3s
	 5UwXLhBG7Bu1K8fHSgoqRoW757afu5sYQniuDHWnxhVX7q6G3MhqT7ERHwazNLhnfnDRf
	 BHDPW3zSkL5oWst/yz7DtNi8d9ymSz5HM2D/K755+1iVv3MGk6Ngcn2PzZbZjYAOcPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiseoniZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E5A606A32A;
	Wed, 11 Nov 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiseoniZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351411F00A05;
	Wed, 11 Nov 2026 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794407684;
	bh=/BYwmTLc268SpihxQ/Qh7SWKMglfN7RDmuZifcHy5Zs=;
	h=Date:From:To:Cc:Subject;
	b=DiseoniZsx80fPtrAj7S3wCet9rxXCD2+hkv14jx4muWmZg6pkzva/HRgfebj3Owj
	 efWnt6bKfSREFk3JcmSTfHQ2oIaAmf0eOHfystWI2xNgiR6BUFXx8Lycw4izWk2ofj
	 NTj3NhAqdWrwsQ8ObaX//qblMIJBVXJYyt1LZI65NuPx5ylUQtSzi71R4iDNXjfX8x
	 3I6fTVcvoFZlCcDKg111fb0b05ewKqb1MqytT5Q8bpA6Dch73hTTJDeBSzzIp1cqYR
	 vsPAee8XVaUT02mUyZaOHhkFG8laUwICatcQYphXp5Xu7RjdToxOL2YPc/2eEhvHVT
	 IyiKGRQ99HjYg==
Date: Wed, 11 Nov 2026 14:34:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Christian Brauner <brauner@kernel.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fuse tree with the vfs-brauner-fixes
 tree
Message-ID: <avR9APrG3b5DUOEs@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="5AEo8DJ8wMV8bWwX"
Content-Disposition: inline


--5AEo8DJ8wMV8bWwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  fs/fuse/dev.c

between commit:

  80beb226de50b ("fuse: don't move pipe buffers into the page cache")

=66rom the vfs-brauner-fixes tree and commit:

  9c1fd690cbb1f ("fuse: reject unmovable folios before stealing them")

=66rom the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/fuse/dev.c
index a5c08a00cf83b,e7d9c506afaac..0000000000000
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@@ -1099,6 -1099,138 +1099,6 @@@ static int fuse_copy_do(struct fuse_cop
  	return ncpy;
  }
 =20
 -static int fuse_check_folio(struct folio *folio)
 -{
 -	if (folio_mapped(folio) ||
 -	    folio->mapping !=3D NULL ||
 -	    (folio->flags.f & PAGE_FLAGS_CHECK_AT_PREP &
 -	     ~(1 << PG_locked |
 -	       1 << PG_referenced |
 -	       1 << PG_lru |
 -	       1 << PG_active |
 -	       1 << PG_workingset |
 -	       1 << PG_reclaim |
 -	       1 << PG_waiters |
 -	       LRU_GEN_MASK | LRU_REFS_MASK))) {
 -		dump_page(&folio->page, "fuse: trying to steal weird page");
 -		return 1;
 -	}
 -	return 0;
 -}
 -
 -/*
 - * Attempt to steal a page from the splice() pipe and move it into the
 - * pagecache. If successful, the pointer in @pagep will be updated. The
 - * folio that was originally in @pagep will lose a reference and the new
 - * folio returned in @pagep will carry a reference.
 - */
 -static int fuse_try_move_folio(struct fuse_copy_state *cs, struct folio *=
*foliop)
 -{
 -	int err;
 -	struct folio *oldfolio =3D *foliop;
 -	struct folio *newfolio;
 -	struct pipe_buffer *buf =3D cs->pipebufs;
 -
 -	folio_get(oldfolio);
 -	err =3D unlock_request(cs->req);
 -	if (err)
 -		goto out_put_old;
 -
 -	fuse_copy_finish(cs);
 -
 -	err =3D pipe_buf_confirm(cs->pipe, buf);
 -	if (err)
 -		goto out_put_old;
 -
 -	BUG_ON(!cs->nr_segs);
 -	cs->currbuf =3D buf;
 -	cs->len =3D buf->len;
 -	cs->pipebufs++;
 -	cs->nr_segs--;
 -
 -	if (cs->len !=3D folio_size(oldfolio))
 -		goto out_fallback;
 -
 -	newfolio =3D page_folio(buf->page);
 -
 -	if (folio_test_large(newfolio))
 -		goto out_fallback;
 -
 -	/*
 -	 * A swap backed, anonymous or mapped folio can never be moved into the
 -	 * page cache.  fuse_check_folio() would catch these below, but only
 -	 * after the steal has already removed the folio from its mapping, so
 -	 * check them here, while the answer is still meaningful.
 -	 */
 -	if (folio_test_swapbacked(newfolio) || folio_test_anon(newfolio) ||
 -	    folio_mapped(newfolio))
 -		goto out_fallback;
 -
 -	/*
 -	 * This is a new and locked page, it shouldn't be mapped or
 -	 * have any special flags on it
 -	 */
 -	if (WARN_ON(folio_mapped(oldfolio)))
 -		goto out_fallback;
 -	if (WARN_ON(folio_has_private(oldfolio)))
 -		goto out_fallback;
 -	if (WARN_ON(folio_test_dirty(oldfolio) ||
 -				folio_test_writeback(oldfolio)))
 -		goto out_fallback;
 -	if (WARN_ON(folio_test_mlocked(oldfolio)))
 -		goto out_fallback;
 -
 -	if (!pipe_buf_try_steal(cs->pipe, buf))
 -		goto out_fallback;
 -
 -	folio_clear_uptodate(newfolio);
 -	folio_clear_mappedtodisk(newfolio);
 -
 -	if (fuse_check_folio(newfolio) !=3D 0)
 -		goto out_fallback_unlock;
 -
 -	err =3D lock_request(cs->req);
 -	if (err)
 -		goto out_fallback_unlock;
 -
 -	replace_page_cache_folio(oldfolio, newfolio);
 -
 -	folio_get(newfolio);
 -
 -	if (!(buf->flags & PIPE_BUF_FLAG_LRU))
 -		folio_add_lru(newfolio);
 -
 -	/*
 -	 * Release while we have extra ref on stolen page.  Otherwise
 -	 * anon_pipe_buf_release() might think the page can be reused.
 -	 */
 -	pipe_buf_release(cs->pipe, buf);
 -
 -	*foliop =3D newfolio;
 -	folio_unlock(oldfolio);
 -	/* Drop ref for ap->pages[] array */
 -	folio_put(oldfolio);
 -	cs->len =3D 0;
 -
 -	err =3D 0;
 -out_put_old:
 -	/* Drop ref obtained in this function */
 -	folio_put(oldfolio);
 -	return err;
 -
 -out_fallback_unlock:
 -	folio_unlock(newfolio);
 -out_fallback:
 -	cs->pg =3D buf->page;
 -	cs->offset =3D buf->offset;
 -
 -	err =3D lock_request(cs->req);
 -	if (!err)
 -		err =3D 1;
 -
 -	goto out_put_old;
 -}
 -
  static int fuse_ref_folio(struct fuse_copy_state *cs, struct folio *folio,
  			  unsigned offset, unsigned count)
  {
@@@ -1153,9 -1285,16 +1153,9 @@@ int fuse_copy_folio(struct fuse_copy_st
  				return fuse_ref_folio(cs, folio, offset, count);
  			}
  		} else if (!cs->len) {
 -			if (cs->move_folios && folio &&
 -			    offset =3D=3D 0 && count =3D=3D folio_size(folio)) {
 -				err =3D fuse_try_move_folio(cs, foliop);
 -				if (err <=3D 0)
 -					return err;
 -			} else {
 -				err =3D fuse_copy_fill(cs);
 -				if (err)
 -					return err;
 -			}
 +			err =3D fuse_copy_fill(cs);
 +			if (err)
 +				return err;
  		}
  		if (folio) {
  			void *mapaddr =3D kmap_local_folio(folio, offset);
@@@ -1627,7 -1766,7 +1627,7 @@@ static ssize_t fuse_dev_splice_read(str
  		 * Need to be careful about this.  Having buf->ops in module
  		 * code can Oops if the buffer persists after module unload.
  		 */
 -		bufs[page_nr].ops =3D &nosteal_pipe_buf_ops;
 +		bufs[page_nr].ops =3D &default_pipe_buf_ops;
  		bufs[page_nr].flags =3D 0;
  		ret =3D add_to_pipe(pipe, &bufs[page_nr++]);
  		if (unlikely(ret < 0))
@@@ -1791,6 -1930,9 +1791,6 @@@ static ssize_t fuse_dev_do_write(struc
  		if (!smp_load_acquire(&fch->initialized) || !fch->connected)
  			goto copy_finish;
 =20
 -		/* Don't try to move folios (yet) */
 -		cs->move_folios =3D false;
 -
  		err =3D fuse_notify(fch->conn, oh.error, nbytes - sizeof(oh), cs);
  		goto copy_finish;
  	}
@@@ -1834,6 -1976,8 +1834,6 @@@
  	set_bit(FR_LOCKED, &req->flags);
  	spin_unlock(&fpq->lock);
  	cs->req =3D req;
 -	if (!req->args->page_replace)
 -		cs->move_folios =3D false;
 =20
  	if (oh.error)
  		err =3D nbytes !=3D sizeof(oh) ? -EINVAL : 0;
@@@ -1934,6 -2078,7 +1934,6 @@@ static ssize_t fuse_dev_splice_write(st
  				goto out_free;
 =20
  			*obuf =3D *ibuf;
 -			obuf->flags &=3D ~PIPE_BUF_FLAG_GIFT;
  			obuf->len =3D rem;
  			ibuf->offset +=3D obuf->len;
  			ibuf->len -=3D obuf->len;
@@@ -1948,6 -2093,9 +1948,6 @@@
  	cs.nr_segs =3D nbuf;
  	cs.pipe =3D pipe;
 =20
 -	if (flags & SPLICE_F_MOVE)
 -		cs.move_folios =3D true;
 -
  	ret =3D fuse_dev_do_write(fud, &cs, len);
 =20
  	pipe_lock(pipe);

--5AEo8DJ8wMV8bWwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0fP8ACgkQJNaLcl1U
h9B58gf/a+cW2KVrTPoMwlryNjCwNMsnLGeZSZlGPLaD8bRopA3L8iil5gtV3fvG
c53BZj9+G2PZzhFxwkb2Rl3ztndtu0UL1UvBv/pGLl7Ax3CH9UIFKDKQL8e76X7i
xVje8kIZOF4Mk1INf4mWMwW+GaDq7iNUfkzBF/nIfu/+qiSY4BXB7Yxjnz0jhQMO
YYSY+1igrAe/9TyG/w5gU3noU2PwQgG2oXOSpeKVMl82KxxahyjXhnpbfOw0f6SP
5N12XPKptmAQF4e1bwgDuDky7ny6s8xvyDW4zdGSGAOcv+oxDdc4N4UrbKf7Nqi2
qa8S966FSrZaDdRzwRfTmSEUL+rC5g==
=Uhhy
-----END PGP SIGNATURE-----

--5AEo8DJ8wMV8bWwX--
