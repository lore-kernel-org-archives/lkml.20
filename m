Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844428;
	b=KCcvxoIoK54Vq1z8bHSJQ2aKsoSxB4PLKjBSNYI3xSpF7skySyEIfPXqdjW9g3UpO5lx
	 EFFzrRKIN9Emwk5mrWXWgR0DD2q8BED3hBNi6MJM/DuuTNTCGxifHlkZRIvMg66iDzSRs
	 n4JJOL3m9fkvSX2NddhvUEN9wCCjgUOlfr8JJIevJnm7uGTquTwScIfRiQp5Br33cEU2h
	 6qJfod7MRkT6sRNBzqKYl4j3PnqZGl/3wuVzstGYkw15nRBQEefCBTournZebybGctufn
	 ZA0rchtx6p9n2RMH1gkVB/olNR+aB4afGSE+pfuL89a0A+3hkuSLmVp5TzWzyRzaUng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844428;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=l5/vmAvF28KuEi/vuxEIfS80PMdT2P0hULSlRZ41Miw=;
	b=ARZefr2wdXhjxb6cs5oYLB0KBvpFejYxpfYmOXn/kBKxy5NXzweOpYuUtiiDu+iCL1/P
	 CdeTxR/Ad/7FtP8rZtbqYQOLcMrE3askpP7l7qleG+57xtYNT8oGlwSG5oSmu6DRIBwYc
	 S6p7ybqiaPA/rFCYYoaU55/KCo5tI6BeUOyvq9mK4/26xgCHgufDti/uJb5DfysF4HwGj
	 sSSnjupfPZua6D7ClynM21DNvD5Zdwxs9I732/aQIfi8ixDoNp5YcFgjIU4230JXJk1vj
	 E1PV7UNp8GXIoZ8BjDLDuzQ54Pl9hUSG6UBS3jknevAftSRVcpluxcDR915qq7zbezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbJColkr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4768606A33A;
	Mon, 16 Nov 2026 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbJColkr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7751F000C9;
	Mon, 16 Nov 2026 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844428;
	bh=l5/vmAvF28KuEi/vuxEIfS80PMdT2P0hULSlRZ41Miw=;
	h=Date:From:To:Cc:Subject;
	b=KbJColkraldwXMlKwCGsVABC/5Lj37OEytAhBvsEGjaTAY/XuMcRrPiZrZ4QhpDAi
	 qcCA7vkcJDAyk0byGpx1zYtjnaS1CFVyGMOLNGfu/vIWQbe+rAsiF3brdhaV3VPV5K
	 bauSVMOzcei4RqLOCuhbIAu5PrTxh8OQNY6evuF/Zcw/1dfRJBuO35s+oc0UGsi4Mo
	 ZAo/FjUgeWmFZXWJMG+LoNZBJvsJnGxFl1KzJxpM4IKtP56hfivuxP26vKXwwWU97Z
	 0FSTeaghzVxDAhsJzPnSjQHWO3F2Xr3ve7y5eXwUrMpT2QGe1sgDcglm6mN8Simnw0
	 yOzfkH6cYsjcg==
Date: Mon, 16 Nov 2026 15:53:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yongxin Yang <yangyongxin@kylinos.cn>
Subject: linux-next: manual merge of the mm-nonmm-unstable tree with the
 vfs-brauner-fixes tree
Message-ID: <avsnCFn0jCvbhtRw@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="+kXcJeGBNP619irg"
Content-Disposition: inline


--+kXcJeGBNP619irg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-unstable tree got a conflict in:

  kernel/profile.c

between commit:

  944b8062bc6f6 ("profiling: report it when /proc/profile can't be created")

=66rom the vfs-brauner-fixes tree and commit:

  091be6dce28ab ("perf/profile: report failure to create /proc/profile")

=66rom the mm-nonmm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined kernel/profile.c
index 820d5ec909d40,818098cc094a5..0000000000000
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@@ -153,28 -153,52 +153,52 @@@ void profile_tick(int type
  static ssize_t
  read_profile(struct file *file, char __user *buf, size_t count, loff_t *p=
pos)
  {
- 	unsigned long p =3D *ppos;
- 	ssize_t read;
- 	char *pnt;
- 	unsigned int sample_step =3D (unsigned int)(1UL << prof_shift);
+ 	const size_t header_size =3D sizeof(unsigned int);
+ 	const size_t file_size =3D (prof_len + 1) * sizeof(unsigned int);
+ 	unsigned int sample_step;
+ 	loff_t offset =3D *ppos;
+ 	size_t pos;
+ 	size_t done =3D 0;
+ 	size_t n, not_copied;
 =20
- 	if (p >=3D (prof_len+1)*sizeof(unsigned int))
+ 	/* Keep the shift word-sized before narrowing to the 32-bit ABI. */
+ 	sample_step =3D (unsigned int)(1UL << prof_shift);
+=20
+ 	if (offset < 0)
+ 		return -EINVAL;
+ 	if (offset >=3D file_size)
  		return 0;
- 	if (count > (prof_len+1)*sizeof(unsigned int) - p)
- 		count =3D (prof_len+1)*sizeof(unsigned int) - p;
- 	read =3D 0;
+ 	pos =3D offset;
+ 	count =3D min(count, file_size - pos);
 =20
- 	while (p < sizeof(unsigned int) && count > 0) {
- 		if (put_user(*((char *)(&sample_step)+p), buf))
- 			return -EFAULT;
- 		buf++; p++; count--; read++;
+ 	/* Copy the four-byte sampling resolution. */
+ 	if (pos < header_size) {
+ 		n =3D min(count, header_size - pos);
+ 		not_copied =3D copy_to_user(buf, (u8 *)&sample_step + pos, n);
+ 		done +=3D n - not_copied;
+ 		if (not_copied)
+ 			goto fault;
+ 		buf +=3D n;
+ 		pos +=3D n;
+ 		count -=3D n;
  	}
- 	pnt =3D (char *)prof_buffer + p - sizeof(atomic_t);
- 	if (copy_to_user(buf, (void *)pnt, count))
+=20
+ 	/* Copy raw counters using offsets relative to the counter array. */
+ 	if (count) {
+ 		not_copied =3D copy_to_user(buf,
+ 					(u8 *)prof_buffer + pos - header_size,
+ 					count);
+ 		done +=3D count - not_copied;
+ 		if (not_copied)
+ 			goto fault;
+ 	}
+ 	*ppos +=3D done;
+ 	return done;
+ fault:
+ 	*ppos +=3D done;
+ 	if (!done)
  		return -EFAULT;
- 	read +=3D count;
- 	*ppos +=3D read;
- 	return read;
+ 	return done;
  }
 =20
  /* default is to not implement this call */
@@@ -221,8 -245,10 +245,8 @@@ int __ref create_proc_profile(void
  		return 0;
  	entry =3D proc_create("profile", S_IWUSR | S_IRUGO,
  			    NULL, &profile_proc_ops);
 -	if (!entry) {
 -		pr_err("profile: failed to create /proc/profile\n");
 +	if (!entry)
  		return -ENOMEM;
 -	}
  	proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
  	return 0;
  }

--+kXcJeGBNP619irg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7JwcACgkQJNaLcl1U
h9BSFAf/RQMO/jCK8ZwjmSP3S9oGA7lruB5Pqhtbv1s/DlUyub9Ju+zuNQdxOPv/
IoZ32T4BHyTe0woGeJM2vpNfWXkYkaudgleDgNURfbB+a4CxUX5+oiniqvk6MayG
VcxObQisg5zgRoDWaYGJgH5jQe/Ow37AkVlfX67Lnjz3Vc9vP9Oo8NyZ0GAHjtnD
nIfiIMopRtyNKMXUAHIcMGpfOwhHjo3BlfwBgfdFkjnbKAwDCfQ2PCb8fvlSkvxs
hoV9LwwGluLCKi0YQkQ77px2sbcNCAnen/DfrgO0Arqk7yYjEchxgRvN6WtLsWx+
GS+P/PUe8kQwuA0Ydpo9ZLkVHsF/qQ==
=lZ0y
-----END PGP SIGNATURE-----

--+kXcJeGBNP619irg--
