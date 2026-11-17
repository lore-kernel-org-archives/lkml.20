Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932225;
	b=InnCE5Eb45xKJ8yEY6XrgHxX+EM/HyJpSQjztAxwhagCzXG5mwlOW2z+egJEmPOmrGzN
	 TGIKYgKuBUUVuwS5LPO8owutebnzdbSVDZu+MrGn2PeQS3BN67gJ0KpDV/RRHyIGvCf4L
	 qV/tAMCG2lCRcas4TvDYfzbc++fSmZpIGQ0qJ68wpEYov6c2wx0Q2ok/+FwPOcIe2lrmt
	 1GSEO3RrgswS10Shepz6QTmSvXvIWPsV+cVJv+Ix6Bnl1pPqYXo3UFanKMj0wcJhV2IGh
	 Oy1yS1lU/zSVfp5TiTkZZ10dfXdwAeJIMcMhWr/ZhKUkygsJm2Eel1nZlqjiiIBQoVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932225;
	h=Received:DKIM-Signature:Date:From:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=XNNwTxWkKnx1cjZ15MY7VYWVBWraFUkHuxyH225BPjg=;
	b=Gmd0hBY9NSJI7yG/gJpcpNumzRj3S0/Cv+5r83aglVLkaHQZASssojgwnzQ8JDUiscgk
	 iFE4gyGM4EtwQ137Yn26SzgI/T9UXAZSdzJkjg4nBJ0881j7BZAmx09NbgyLTtUx9wN+h
	 4HbbDAeO3nHbvaca+4jZZF3J9heJdXOBwKq6k5BmHfenTCjusQcy6kPM6Osk2P7BhVpaH
	 7Jbj14dM+ykVRYOMtpRgXet+y/ObyW8WsfwcpaFqaysUyNg6IUZGXsyOWuJBmKGR9/Ao9
	 ZHeHf9hl1pJqyIYHXIDGxq/BwODaA9ag+vkbGSSuhL50Swm/dT3aN3BjLUDlHaG9DTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGTemwzj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD40606A31C;
	Tue, 17 Nov 2026 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGTemwzj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727041F000C4;
	Tue, 17 Nov 2026 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794932225;
	bh=XNNwTxWkKnx1cjZ15MY7VYWVBWraFUkHuxyH225BPjg=;
	h=Date:From:Cc:Subject;
	b=JGTemwzjkog0bxPchzx194Lx139l3IQWC3NlTiSYPg8LJO+yaVawZso2tV31LqylN
	 eYNCYyAQEPwICE87h5BD4ehBk2QCrODrS2BBzK/1k2GKlK5J388bDvWTXbZseyaPHr
	 Vtypv33rd0SVXSMm8NCiNIx79cIFhYw0qzm9b+uh6ffhflBdDHc4s3JGo+XE0CTGDs
	 HHZNe8hwyuk+vcgrU9DQf0xyxZZ6mL6jIlbdQKBcECo/oRiWCzIcAVxTI7bJv6zxm3
	 Vi3h/nea0MQhxvjjVurosLwPAqxgBWdkLGKC92GWU+QWscBJqiUB2J7thfR/AnetWW
	 edSWKZHL+tZtQ==
Date: Tue, 17 Nov 2026 16:17:01 +0000
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-ID: <avx9_c_HWPAl9i1Q@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="0XI2la9RnovdJ4f6"
Content-Disposition: inline


--0XI2la9RnovdJ4f6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  kernel/profile.c

between commits:

  2ab6daee3c87d ("profile: account for partial /proc/profile reads")
  0ff0b873d4d93 ("profile: simplify /proc/profile read layout")

=66rom the mm-nonmm-unstable tree and commit:

  79011a80f0646 ("proc: give kcore, kmsg, the kpage files and profile their=
 own file_operations")

=66rom the fs-next tree.  This essentially discards Andrew's changes, AIUI
the conversion to the iterator API ought to achieve roughly the same
thing though I may be misunderstanding.  I may also have messed up the
merge somewhere.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/profile.c
index c6d5a2638a52e,c28386b6723bf..0000000000000
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@@ -150,55 -150,31 +150,28 @@@ void profile_tick(int type
   * buffer. Use of the program readprofile is recommended in order to
   * get meaningful info out of these data.
   */
- static ssize_t
- read_profile(struct file *file, char __user *buf, size_t count, loff_t *p=
pos)
+ static ssize_t read_profile(struct kiocb *iocb, struct iov_iter *to)
  {
- 	const size_t header_size =3D sizeof(unsigned int);
- 	const size_t file_size =3D (prof_len + 1) * sizeof(unsigned int);
- 	unsigned int sample_step;
- 	loff_t offset =3D *ppos;
- 	size_t pos;
- 	size_t done =3D 0;
- 	size_t n, not_copied;
+ 	unsigned long p =3D iocb->ki_pos;
+ 	size_t count =3D iov_iter_count(to);
+ 	ssize_t read;
+ 	char *pnt;
+ 	unsigned int sample_step =3D (unsigned int)(1UL << prof_shift);
 =20
 -	if (p >=3D (prof_len+1)*sizeof(unsigned int))
 -		return 0;
 -	if (count > (prof_len+1)*sizeof(unsigned int) - p)
 -		count =3D (prof_len+1)*sizeof(unsigned int) - p;
 -	read =3D 0;
 +	/* Keep the shift word-sized before narrowing to the 32-bit ABI. */
 +	sample_step =3D (unsigned int)(1UL << prof_shift);
 =20
- 	if (offset < 0)
- 		return -EINVAL;
- 	if (offset >=3D file_size)
- 		return 0;
- 	pos =3D offset;
- 	count =3D min(count, file_size - pos);
-=20
- 	/* Copy the four-byte sampling resolution. */
- 	if (pos < header_size) {
- 		n =3D min(count, header_size - pos);
- 		not_copied =3D copy_to_user(buf, (u8 *)&sample_step + pos, n);
- 		done +=3D n - not_copied;
- 		if (not_copied)
- 			goto fault;
- 		buf +=3D n;
- 		pos +=3D n;
- 		count -=3D n;
+ 	while (p < sizeof(unsigned int) && count > 0) {
+ 		if (copy_to_iter((char *)(&sample_step)+p, 1, to) !=3D 1)
+ 			return -EFAULT;
+ 		p++; count--; read++;
  	}
-=20
- 	/* Copy raw counters using offsets relative to the counter array. */
- 	if (count) {
- 		not_copied =3D copy_to_user(buf,
- 					(u8 *)prof_buffer + pos - header_size,
- 					count);
- 		done +=3D count - not_copied;
- 		if (not_copied)
- 			goto fault;
- 	}
- 	*ppos +=3D done;
- 	return done;
- fault:
- 	*ppos +=3D done;
- 	if (!done)
+ 	pnt =3D (char *)prof_buffer + p - sizeof(atomic_t);
+ 	if (copy_to_iter(pnt, count, to) !=3D count)
  		return -EFAULT;
- 	return done;
+ 	read +=3D count;
+ 	iocb->ki_pos +=3D read;
+ 	return read;
  }
 =20
  /* default is to not implement this call */

--0XI2la9RnovdJ4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8ff0ACgkQJNaLcl1U
h9DKxwf+IaIJ6BbTUQI/opOjN12FpjUPdAfOq/8MvL5H6VDAV8yBwldR+eSrZfSk
+vitaZDrEtbjyDlhVujXXklFYO+MARRA53lZcSskC92pBGYMDifRe//S+HrzAKC0
wfdAULv5DtfnmG5ndnWDa6tOCYFzrhLCccCF3A5Kfh6nER6dTu3vvnwUbPx/82Z+
zfJbMIe7MIZsL+f47d3kc7WpY5YfG4RQPSOnlsYnAFvcRROi/fSTPqphZ7ZrbpZS
26+JNXdtZHz5Zp+SFr7m9KE19MEWoylfQVeszNQpD+Mev3IQ3KANxF7dnMQRWRpk
v+7NbKx06/sUJ/YgePduSIIBKT0xTA==
=eWEj
-----END PGP SIGNATURE-----

--0XI2la9RnovdJ4f6--
