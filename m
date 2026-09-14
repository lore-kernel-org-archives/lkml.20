Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE8457E55;
	Mon, 14 Sep 2026 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386529; cv=none; b=KhUtfh8T1D1V3yZII2drVpibt2IwvDJqZbgHtwlE9Fi+VP1uQ/GQFkkaFDA6DG/l9MrtCznTaAjAgGZJNUMLwWv936h+fZtld0NkM87XSyZ6Gk7/yqyxYJVuSk8fxETQv5si80nwTVJlW8yWlQnIETO1/QLZGbZ0EYFK8hEugkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386529; c=relaxed/simple;
	bh=CCAqzLFwS0BOIKoTb5f68QH0X3E02aNX4wj4ufaM16w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hczZt6q3UE1DV5h7VXziOVYZ6bqf8QrsOt1/xFY+PU4XHDWKqDhbwnxL6eRa4nwH2shUfJiIuhFn+Fru8kPYdr9NKBdB+LSUSboU+BFiUZis3UW8EQROLCeWObyBxo/8rCz05UDuCOWEr87lcLXf+4O5w/vsDeZiFTNCHhNnDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G44hERQU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G44hERQU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9451F000FF;
	Mon, 14 Sep 2026 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386527;
	bh=BvOJq3PLLRpLiCq6GJnNna28TuE+pSOPNvTesECUD0s=;
	h=Date:From:To:Cc:Subject;
	b=G44hERQUBVPlO4DQfLXB6XfWF2eA2fw6zOHWCuelvX40g8PJsYJuDNg79g1+Yr8oh
	 A1iMNyjNCuJSUjNHtTXmub2OLl1nDHEA+hnUeLSRCuTxfcEBFiDqMByoFiHYgmfygw
	 qn/D7NwJY1cOLsrnh2GYR2SLQZ90n75bxQhW4BO4QlMh6NRy1WlGIR8VtvqRiRRHjQ
	 wDx+Dhv60RJD0JLwgXbiNIpAdNSkZBT2IC2qAaZgRJx8761XGP4EpxTY/r6Yt7xGpK
	 Ygst8kBKmS/Tvfhjf0iY9UPqlKPB9YNkJJQ4ye2R0MD23/fNF+VvZWAKnvxDIIDayI
	 wZBW8x1N2MrIA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8EE541AC52F1; Mon, 14 Sep 2026 12:48:44 +0100 (BST)
Date: Mon, 14 Sep 2026 12:48:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Daan De Meyer <daan@amutable.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the security tree with the vfs-brauner
 tree
Message-ID: <aqffHOsZaT92Fkg_@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SuTPdbK0t3hE/F4d"
Content-Disposition: inline


--SuTPdbK0t3hE/F4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  fs/namei.c

between commit:

  449c7265d60d4 ("vfs: add O_CREAT|O_DIRECTORY to open*(2)")

=66rom the vfs-brauner tree and commit:

  16959c469f232 ("lsm: expose mount idmaps to inode hooks")

=66rom the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/namei.c
index ca4f5e3be99ac,99f894f3f7e13..0000000000000
--- a/fs/namei.c
+++ b/fs/namei.c
@@@ -4227,11 -4188,16 +4227,11 @@@ int vfs_create(struct mnt_idmap *idmap
  		return -EACCES;	/* shouldn't it be ENOSYS? */
 =20
  	mode =3D vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
- 	error =3D security_inode_create(dir, dentry, mode);
+ 	error =3D security_inode_create(idmap, dir, dentry, mode);
  	if (error)
  		return error;
 -	error =3D try_break_deleg(dir, LEASE_BREAK_DIR_CREATE, di);
 -	if (error)
 -		return error;
 -	error =3D dir->i_op->create(idmap, dir, dentry, mode);
 -	if (!error)
 -		fsnotify_create(dir, dentry);
 -	return error;
 +
 +	return vfs_create_no_perm(idmap, dentry, mode, di);
  }
  EXPORT_SYMBOL(vfs_create);
 =20
@@@ -4368,21 -4328,7 +4368,21 @@@ static int may_o_create(struct mnt_idma
  	if (error)
  		return error;
 =20
 -	return security_inode_create(idmap, dir->dentry->d_inode, dentry, mode);
 +	if (create_dir)
- 		error =3D security_inode_mkdir(dir_inode, dentry, mode);
++		error =3D security_inode_mkdir(idmap, dir_inode, dentry, mode);
 +	else
- 		error =3D security_inode_create(dir_inode, dentry, mode);
++		error =3D security_inode_create(idmap, dir_inode, dentry, mode);
 +
 +	return error;
 +}
 +
 +static inline umode_t o_create_mode(struct mnt_idmap *idmap,
 +		const struct inode *dir, int open_flag, umode_t mode)
 +{
 +	if (O_IS_MKDIR(open_flag))
 +		return vfs_prepare_mode(idmap, dir, mode, S_IRWXUGO | S_ISVTX, S_IFDIR);
 +	else
 +		return vfs_prepare_mode(idmap, dir, mode, S_IALLUGO, S_IFREG);
  }
 =20
  /**

--SuTPdbK0t3hE/F4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn3xsACgkQJNaLcl1U
h9BNpQf7BRnXDuELUc1uGkGnxgNUjVl4hUzqBdQ1BfLpcIpwCYS3uzYw6obNQ6/8
0wwtnLLORYp30g9Erv/jD/nKDVnwPRq7QYaT5lv/XHGWWGsKn6uP/yKcjvxJNQdX
9XfW6NuuDxeEVmHBlAoghrD31T07XwVMu0K7SNkjLMfwf1x5MBIYo/OPSSFaTxs3
Lj5m4DBSo7QHTy84dc4ziGbEU5JrZ8/2VRGceVjJhj74FlzOTuFnUWbmeH7OBGMh
EvqW0NWrhRGz0hZ9QYi6XWAfiy7XdyxUCoLFiJHBVhuEOZQnlCSWa8cr65Lew+cl
BBxKBqVVEYDZmJYYdQppMKxUkBgLmQ==
=bE0B
-----END PGP SIGNATURE-----

--SuTPdbK0t3hE/F4d--
