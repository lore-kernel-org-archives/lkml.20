Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491891;
	b=F68qKnNtSaiG8DhLKNpQbB1komZnp1+AeTiSTZnl012DU71tYZrv2XdNTDiu4mW0V04w
	 Zx5UAcTuTBFQ/HTNXGlp3uC4QtjNC58VSoK8qY0kmAS9jqA18wDjXMuJkZpjnA6Fh5wtz
	 qJsWKmDuIBlWlmlm+xIQtuvBxI6/12/BTdEksWow6wcmcN4Boz57CyUkzGCTOGCvUb6mv
	 Ast95y+V3PrzRFEz/G7LMipXDLGjtAT5gsJ4SevWZMtacMYfMARlv7kTwtVYKyudd6fMK
	 sTMttYaztVKTYpewJCs4WZ21hka4k6YPTYpVfEoI908GxXzYIb4aIztHh8uSDuNJP/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491891;
	h=Received:DKIM-Signature:Date:From:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=j4G/bPrB8PHdrTr6+DvlYZM2eihixzOKDCy7qXm5APg=;
	b=wK1wLWC2fgtUkxRO0xJ+HBkkiGlTt+MjClGcYDK88cHed8UMA+qShzXp1JSgB4umiHwT
	 eDYYHlsH+1joBp/i61f5dLr/hIwHCpsmlwGWabvpudpquOaLeIKBxH8Jke7nyy2tbcIBd
	 HEToU6uk7GTfw9dHEatu/PE1TdT+wrZ8q5SVyG8TjCqOKq8IBnyiGV7VA3ycPoIn+MR9X
	 Upy2kVRT92Lzls0TsF/jO6WxBp3ivbDP/w12lGg+j1vnlqh9MHTAyAvFU9MFek4LaxAYx
	 QCbbbOOF1zCO8r0DOLvxj/hyjdMe9MPKpfX5UciLCytnAwZCueM7rUwVxYGJglPsh6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WoxvPXw/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCD606A31C;
	Thu, 12 Nov 2026 13:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoxvPXw/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1B51F00A05;
	Thu, 12 Nov 2026 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491890;
	bh=j4G/bPrB8PHdrTr6+DvlYZM2eihixzOKDCy7qXm5APg=;
	h=Date:From:Cc:Subject;
	b=WoxvPXw/WoFfpAzpNYoWvPfXa0tWuDVTZEGvaswn52ooq8bdfrKUiY2189H/GFNBC
	 Hda/5gavOE15uGa9jsv09bDlYlj0bj1bbxjmpA1JeBDE2BnhjQeqkkodpHmjyxqePZ
	 TzCwT9q6L5PDKBFHE0Y5YAWWOnic1a2fNZFBiWKwR+/NVwuUWM5/ifQ94uZOWHsNwe
	 LQi3qbBy+bwX7FwaP37Ynu7wS1lo9k0G1kH41dqacyCR4c/2KDcqNXZE6AyYNI6Hec
	 im/GdT0v8cJb01B28eGJVlRXQcmAL/DQrTPAudLbGJwCh2CkwD3625cxu7zDH7ydzi
	 DMnST5+KEfFoQ==
Date: Thu, 12 Nov 2026 13:58:06 +0000
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the mm-fixes tree
Message-ID: <avXF5GjvL3_FuQO4@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="VHxJj8h8ipjeiedO"
Content-Disposition: inline


--VHxJj8h8ipjeiedO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  mm/filemap.c

between commit:

  0ff9a4200192d ("mm: limit pagecache folio refcount when splicing into pip=
es")

=66rom the mm-fixes tree and commit:

  028bbac710376 ("fs: annotate lockless file position updates in sendfile")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/filemap.c
index d96ea2c9db285,c9bc0fdf15ad4..0000000000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -3183,8 -3175,9 +3183,9 @@@ ssize_t filemap_splice_read(struct fil
  			len -=3D n;
  			total_spliced +=3D n;
  			*ppos +=3D n;
- 			in->f_ra.prev_pos =3D *ppos;
+ 			/* readahead hint, racy updates are benign */
+ 			data_race(in->f_ra.prev_pos =3D *ppos);
 -			if (pipe_is_full(pipe))
 +			if (pipe_is_full(pipe) || *ppos < folio_next_pos(folio))
  				goto out;
  		}
 =20

--VHxJj8h8ipjeiedO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1xe4ACgkQJNaLcl1U
h9AxHwf/WGk4DcH1bpIISAlEoDpyha2ssUZZh9omTAJynrsoTjMea1Djy80/sfd8
cnS4hJoRyLfhzhuEeEyQRdPQxW/UOlxUhZxJZAvmOyg3cMQWcn+/f4yewW4EDMd4
kcf+eKobMssuAOrq6TNBPVc2jdWvghiQTM8lVhAkN5uuBQ8izBP4EFS7X2D4Dn21
cE4BxMCTMJJe0aRZG3SlhWqbIlKNQ/ArRkqjuHwWinkEBQ1yNznvYpd3lBPlLN5o
AMGNQRcKp2lb90HE/K8TZGAMcUNBMUj9BbGygdw7OJO8mFH375CN+ImUXz0zx1Ai
XuAN2DenVrrt+NCveCtOr6yh3Tu1UQ==
=qKFk
-----END PGP SIGNATURE-----

--VHxJj8h8ipjeiedO--
