Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48C92D94B5;
	Tue, 13 Oct 2026 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898048; cv=none; b=aO0HDiJoAe+FIZ7jsZz/qoCLROSPfakOH90G1L7wKBfSCkHtBVJZnP5ArW974LA1dpMcCFDiY0rfhqqB4RgdiqUVlAO+2iS5eXDqfbXFVEfdqtqymEZCO+g/ItsnbnIag0Pwm5D7EAYM+j2tXxBtmytI9lAeBhjQcmKxgC6NtBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898048; c=relaxed/simple;
	bh=w1QRhbExC7TZgFJQwELxqmgCySrFQwMS3h8CBxYd9RI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rShcExf5vy750c6Ydgw70mhtk2FzbxtAg04u9DLmhzYgVqIkbHAYdl+9comW/vO1z6igRYtf52J/czFrteUFIatKuhkpynnlw5BLr8nCE9iK1szACilvtoGenjAXvbf+bGBHLQY9QcIrHefQ+NuCCRGtioGk7kf9DazeQPUci+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kq05TxSH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kq05TxSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3613A1F00899;
	Tue, 13 Oct 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898047;
	bh=cFfqwwFKvAEYu7MNh9q5aU6OeimHjI0VoWyd1S2+rzk=;
	h=Date:From:To:Cc:Subject;
	b=kq05TxSHPzxrbry5vcT3zKJyCYvx79ss3y63iXoYlnp4lkHRe3/74ls4MqcXImfJS
	 5g8WHxaE5E/j2Bb7TNBDyR00Gx+nynyNTl7LuJfzjb0kmG3YrXa/RB2M4qS2uBlqgZ
	 ZKRduH1VkhoP0qVli/1Gb/CY/vymCWwocDxJtovmLqkx2+qNES6OZvvhcYjwuNIiye
	 pPiJs0v9qNvsnSvPg8zxwwNyG8LmnKbLXIvf7/mBA12F7L4tH/MDIi5mf4pekvJT7q
	 h17qYc14/pyru4abVa3Le4aLGwy6RdO9GsRGh608ag0ZBA3nnF1ZdyG/6gnw1gSiX/
	 OrjKcOK7oAOIg==
Date: Tue, 13 Oct 2026 14:27:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ntfs tree
Message-ID: <as4xu47U3YNaijJI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hocjAuXCZYpADxvx"
Content-Disposition: inline


--hocjAuXCZYpADxvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ntfs/inode.c

between commit:

  1e03db31119eb ("ntfs: clear stale pagecache on initialized-size extension=
")

=66rom the ntfs tree and commit:

  d874f8060847c ("iomap: pass iomap_iter_next_fn directly instead of struct=
 iomap_ops")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ntfs/inode.c
index 206db4e99ef13,cceb42b267051..0000000000000
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@@ -2576,33 -2437,23 +2576,33 @@@ int ntfs_extend_initialized_size(struc
 =20
  	err =3D ntfs_attr_map_whole_runlist(ni);
  	if (err)
 -		return err;
 +		goto out;
 =20
 -	if (!NInoCompressed(ni) && old_init_size < offset) {
 -		err =3D iomap_zero_range(vi, old_init_size,
 -				       offset - old_init_size,
 -				       NULL, ntfs_seek_iomap_next,
 -				       &ntfs_iomap_folio_ops, NULL);
 -		if (err)
 -			return err;
 +	if (!NInoCompressed(ni)) {
 +		/*
 +		 * Zeroing skips holes, so discard cached uninitialized bytes
 +		 * before making them visible to writes or shared mappings.
 +		 */
 +		clear_size =3D max_t(loff_t, i_size_read(vi), new_size);
 +		truncate_pagecache_range(vi, old_init_size, clear_size - 1);
 +
 +		if (old_init_size < offset) {
 +			err =3D iomap_zero_range(vi, old_init_size,
 +					       offset - old_init_size,
- 					       NULL, &ntfs_seek_iomap_ops,
++					       NULL, ntfs_seek_iomap_next,
 +					       &ntfs_iomap_folio_ops, NULL);
 +			if (err)
 +				goto out;
 +		}
  	}
 =20
 -
 -	mutex_lock(&ni->mrec_lock);
 +	mutex_lock(&mrec_ni->mrec_lock);
  	err =3D ntfs_attr_set_initialized_size(ni, new_size);
 -	mutex_unlock(&ni->mrec_lock);
 +	mutex_unlock(&mrec_ni->mrec_lock);
  	if (err)
  		truncate_setsize(vi, old_init_size);
 +out:
 +	filemap_invalidate_unlock(vi->i_mapping);
  	return err;
  }
 =20

--hocjAuXCZYpADxvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOMboACgkQJNaLcl1U
h9DtWQf+JNfApxhRc42kB1vdZU+TfNtBjFKoJXfdKcZFms/kqwMLcrReOXE6DjP/
Uz+Bhd//Ccn1WZLGUoCjCt7if73T3a3ahNGxyaijsaYjCDEyvN4KRj+55xkVGGPR
8/+NVJmHdIDg4iG/JFxyq5j1RLei+jCbE8Da6VqRRZJllyLGPYQD3xnjmsg4JmL4
U5vLvE9sN0uEFrhaTBKn9FVmEYv6BxU7bAi+QyTpYlvr+dsjfBtURFzGAhvZ9+x6
WvYjv2+G2/rdld/pzuIGUCUQSRh+JWTzNAL/Bj79RM8W1DRaQBH/CMwVJdB2WO/4
4IV0XNex5r7MvczE/QGKboWpgbfYGA==
=KJjo
-----END PGP SIGNATURE-----

--hocjAuXCZYpADxvx--
