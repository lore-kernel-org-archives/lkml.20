Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920506;
	b=jlU4HRUHTxD9G1GXjkBdjooqqQD4hoGZ+WjG5NruVN906ovqEcX04goHNTIRwJgq3Zv5
	 4PVFRVrBQtYl05kj8Zft9wpA5LiMFI5GcFZLJxcB/kEh3KfspOHFK9TSlSmh0+YXbMSLi
	 36swMwZfRVm2NRBi7Cc4YnfwX+scgKEWcUuVFkOBIeeYqktZTZjmbsc6fMaFAh3li9G5x
	 gZ9iCopn7di5boEEWeRCtfPr9MaknanPrXBXdIMX492RwcfWd4V2mHZarPKwdPLhxLvPs
	 inkxQBxdheEPlWmtrARVPmSrlJOEUVy3rz22uEGJk40eHCtjSK76ZjYINLoh0lDxjLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920506;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=VY91sNtJewTDMhwYI2qDz+oWuhte0jT0CEdAEgAsRTU=;
	b=5t++E7xy51Cnd9CM52EacNOeS2Umz8M1TM9lO3ebqgcoJqQGIySXWnGUwZmFKzLyRePV
	 It1bU6fUoqG0OT53KTG4xg+FCCga/ancgfPZBS5Kc3DEO90mhpRLlHGqUDn8Cjttn4iX+
	 9zj1ZNySMsVtCCjU9/gwxR2CVSlKxEnB/RqHtWiKB5XnvDO4Q/E2qwbhgH11NnlUMw/o0
	 w+2JnekSx9CYhn1E8yuZmyK7b+FWFv0Dbt5I8/03N4xq8EhSrNeVWO2iRcbPVDwyNxNbE
	 4JE2Nprf7tO2fBJH3zEXKqbSz5j5HdSbSIR+fdktm/BDZs698Yw0Wnnx+m3sqjI5f/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lxKluqFP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64026606A884;
	Tue, 17 Nov 2026 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lxKluqFP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6391F000C6;
	Tue, 17 Nov 2026 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920506;
	bh=VY91sNtJewTDMhwYI2qDz+oWuhte0jT0CEdAEgAsRTU=;
	h=Date:From:To:Cc:Subject;
	b=lxKluqFPsIBI6+I3wyBnxGau42w7eOeTQkbmfoNuo4XWgHR0RL8T4Y6Wp+D2y/RWg
	 TofGAO+Pfug3brVRYodaO2jeERc1+bomXpYc5/ZFP3JfBuFfaGeWzfm18Y4nFDvx/V
	 vTgDiwYpXoW2KlOFWI/AB3vBmT2y0+xClK8f+tgtqMMUweH9CKmuwzvIhuLQI6ARKS
	 WQLK9Hp3WWG+0a/jyoH4ufrOLm73ay0O97NGXwyzqdUYdWsNeNMW/8lcxD+cZkeHrP
	 E7vSC4XjdPev+xaoWZCJjxwSU+kTMSzJbWbXc8mS1pt36iITmrcEvUxTs/fNcnV2cD
	 zJagHRASZ7aVQ==
Date: Tue, 17 Nov 2026 13:01:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Youling Tang <tangyouling@kylinos.cn>
Subject: linux-next: manual merge of the vfs-brauner tree with the exfat tree
Message-ID: <avxQNpa-V0yefH6d@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="FZmg0hIaGcKvQpPE"
Content-Disposition: inline


--FZmg0hIaGcKvQpPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/exfat/inode.c

between commit:

  cca94c25250a1 ("exfat: don't map EXFAT_EOF_CLUSTER as a physical cluster")

=66rom the exfat tree and commit:

  788f21d1f1923 ("exfat: don't set SB_RDONLY after filesystem errors")

=66rom the vfs-brauner tree.  A bit unsure about this one, the actual
conflict is exfat_writepages().

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/exfat/inode.c
index 0bf2f6ba51d29,531560175009e..0000000000000
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@@ -114,8 -114,9 +114,9 @@@ int exfat_write_inode(struct inode *ino
  {
  	int ret;
 =20
- 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
- 		return -EIO;
+ 	ret =3D exfat_emergency_state(inode->i_sb);
+ 	if (unlikely(ret))
+ 		return ret;
 =20
  	mutex_lock(&EXFAT_SB(inode->i_sb)->s_lock);
  	ret =3D __exfat_write_inode(inode, wbc->sync_mode =3D=3D WB_SYNC_ALL);
@@@ -134,9 -135,6 +135,9 @@@ void exfat_sync_inode(struct inode *ino
   * Input: inode, (logical) clu_offset, target allocation area
   * Output: errcode, cluster number
   * *clu =3D (~0), if it's unable to allocate a new cluster
 + *
 + * For !create, *count is limited to the part of the range backed by the
 + * cluster chain; the caller reports the remainder as a hole.
   */
  int exfat_map_cluster(struct inode *inode, unsigned int clu_offset,
  		unsigned int *clu, unsigned int *count, int create,
@@@ -156,15 -154,9 +157,15 @@@
  	    *count > num_clusters - clu_offset)
  		num_to_be_allocated =3D clu_offset + *count - num_clusters;
 =20
 -	if (!create && (num_to_be_allocated > 0)) {
 -		*clu =3D EXFAT_EOF_CLUSTER;
 -		return 0;
 +	if (!create && num_to_be_allocated > 0) {
 +		if (clu_offset >=3D num_clusters) {
 +			*clu =3D EXFAT_EOF_CLUSTER;
 +			return 0;
 +		}
 +
 +		/* Range straddles the chain end: map the valid prefix only. */
 +		*count =3D num_clusters - clu_offset;
 +		num_to_be_allocated =3D 0;
  	}
 =20
  	*clu =3D last_clu =3D ei->start_clu;
@@@ -291,6 -283,11 +292,6 @@@ static int exfat_writepages(struct addr
  		.wbc		=3D wbc,
  		.ops		=3D &exfat_writeback_ops,
  	};
 -	int ret;
 -
 -	ret =3D exfat_emergency_state(mapping->host->i_sb);
 -	if (unlikely(ret))
 -		return ret;
 =20
  	return iomap_writepages(&wpc);
  }

--FZmg0hIaGcKvQpPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8UDUACgkQJNaLcl1U
h9AnnQf/cmcCLNakzr+mWBhcvyEiwSdK5hP8ZeKfZhFlIK2DHkB0ORkR3h9asYre
z2TOSoXXVyoEy+CZVzxErL9lpSoaUtIjyM8hYA6TXwj/qwTavRcIiW1KlxQMIsdi
2hH7493Chk7WAEg9yhj6riS7CmInCgNdVsMG2ryD2WoJDBEs2rfo06PMasOWEF1V
Ed1MnAHKuRsvNGpwH4Yt7SJRjnw8QjE8CHkNxTkjsAZgcgshmMAmA6FbQJ/IcpOg
9IOIxSbfoKHtFdDEnGntwNy66It1xpYsnCXBAIpKBXS0QVV0BWLuSMjxd5YZaJrG
R6qC4ZWLVQfcZxM5ycXFCpF9yu35Gg==
=IUcF
-----END PGP SIGNATURE-----

--FZmg0hIaGcKvQpPE--
