Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932214;
	b=IzHKi1jwg6F6W51zeup9BEGdL24zFKfDBuO+XuwdJ6Tq6E7aWheRD66C8l6imNc54q/B
	 90tb9u34sL4ky/GB+EynmuAMGX9sHlk6tvL9k9K29/lGirHH5x0w99dBadKM2qPzfNw11
	 1M4FBlhex0WwFCsiAmGDU1PHBn2+Qy6q1DLb6eZky0Wa2yr4QtXg4LRkH6+c1T3F2SIn7
	 +rhppjckU6LCne1IVFyPIyakd1aceBbefwxMTIkgXRMo2J5dE16vWMKorNonjORqq5fcp
	 qDEhHHRSrkax7dSg9R2itfCT6d67nGEof+5Nbbjly9CGKxvBs0yXrYPiP8H24EMM70A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932214;
	h=Received:DKIM-Signature:Date:From:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=JexgyI7yRxTMOX4OV785zSL56QhTuX7CtJ9t0+OOffY=;
	b=E0mWd5tf0IVdfr1BaQjoxJDGG263UlTXkrvxD+hz2qllRx4E/FMxDDHscMAfpkqHjlRp
	 ReS9w1LedzN5MUxmdGsKpfVkKg5zfizEFAhFijoUqK9ycITYum6TEVFUXxkgPE5c/Kx6E
	 huT/uPPiiPGPnb/EjS3xK5QVJ9urVmMQ0J4SJdvIRkgH1N1P9s1sK6zobympWINSJpCBY
	 MEHWURTLvOebHVQNMGMaUykki3XXfM3zNCT/GyowPzWIa7sLU0eUEynHIrtnLCmvI401a
	 Myw5ML3gd4a3qqBnMPj5LoAFGbSSEi96B9mH2vwpGhFgcLywJ/8x0VnKrNDX0rns+GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6X+dXf9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895EA606A31C;
	Tue, 17 Nov 2026 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q6X+dXf9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AD61F000C4;
	Tue, 17 Nov 2026 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794932214;
	bh=JexgyI7yRxTMOX4OV785zSL56QhTuX7CtJ9t0+OOffY=;
	h=Date:From:Cc:Subject;
	b=Q6X+dXf9UsRvvkaW2a1d86UmY8+Kx0UCxJXXsbu2eCRS0Uw8/xyNDvh0ek+5dHDpj
	 J3JRqa6qaWrWMKHKfHlgHBcx9lK6/5lUS/TChko7XZc3KagRD+97U9wegc3S73/ewW
	 Sn4nUDfrZucPljEesMHbC16wakDzuxY24BG9UsoSh+zNUm1qAMQ1KB3kcFYXtlV212
	 4plW0GI8bAdUMNI4xPSEpJ/nnpdDf+7bfG7bx2cgPOQBQBQE6ZFizyNYMJDiEAmFT4
	 HPFfnPGBx92IEqg4NvBxWw+c1TUTnjTA+getgfh3A3f7LGBpw3OhMyRx++y3I73vgC
	 T+v7513YY3OOQ==
Date: Tue, 17 Nov 2026 16:16:50 +0000
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chris Down <chris@chrisdown.name>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-ID: <avx98jYYXsZAmkDN@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="8SdN1bgAFGtWOHP7"
Content-Disposition: inline


--8SdN1bgAFGtWOHP7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/proc/kcore.c

between commit:

  6b20f3da3436e ("proc/kcore: allow disabling /proc/kcore at boot")

=66rom the mm-nonmm-unstable tree and commit:

  79011a80f0646 ("proc: give kcore, kmsg, the kpage files and profile their=
 own file_operations")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/proc/kcore.c
index 4251a9ef868b6,ab7b74efe9754..0000000000000
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@@ -723,20 -722,9 +723,20 @@@ static void __init add_modules_range(vo
  }
  #endif
 =20
 +static int __init parse_kcore(char *str)
 +{
 +	return kstrtobool(str, &kcore_enabled);
 +}
 +early_param("kcore", parse_kcore);
 +
  static int __init proc_kcore_init(void)
  {
 +	if (!kcore_enabled) {
 +		pr_info("/proc/kcore disabled on command line\n");
 +		return 0;
 +	}
 +
- 	proc_root_kcore =3D proc_create("kcore", S_IRUSR, NULL, &kcore_proc_ops);
+ 	proc_root_kcore =3D proc_create_fops("kcore", S_IRUSR, NULL, &kcore_fops=
);
  	if (!proc_root_kcore) {
  		pr_err("couldn't create /proc/kcore\n");
  		return 0; /* Always returns 0. */

--8SdN1bgAFGtWOHP7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8ffIACgkQJNaLcl1U
h9D0rQf9Emzlk3Nkp+2cAN7LBmvmTJ8btQ+vE8xKYj5PbNwZBR2q6FmgFXWhmYMn
DLPWpvmSupXnbs9giPwjfgwrlmCKaMMvZak8iX3bNSgYICg4cfRTtjOYluGKBG3T
DtSaKfl6ba4zJjcPJZDbHBBLjpMliL3iwsPcF3dfpZiJz8Vpj5EY5qg8AVXQy2mr
NZ/U3y8QKc42u03Oa13daP2Z3RqVt5g5d7GBkZJDhVSyC9ChEQ1iF2uoDiD+ijI4
FvuZTEuKT4iJ/B4xCT9d+PSBXvMOfdoFekiNsTu9N+SpdZJIDeazRnQTw6jVwnSB
E2iB96tycn7Qg1um0Ug9SUBdKxmAtQ==
=LVWW
-----END PGP SIGNATURE-----

--8SdN1bgAFGtWOHP7--
