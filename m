Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644948;
	b=dImd+DQIsEXLBrpVnUyIUs9TfEiHf5PqNqY5R0xYzpNR7+YiJFtXdAZ3J+MwYQRhgc6c
	 BGyTWk5mYmPJfAYGeU6Joa8RQpT5KaCdVuqFhDoPgCSphIeRSMiOe+YxMM+yFMTTi6eAL
	 Bdny/FSMZKApqOnJsN8u+pNKgmYDjYnPHxk+vurln5wPupf9DL467+BSkrSCk83kUU3fq
	 XtjHLHPRWcKZ8wtRBXXvRr/kceYj7WmDCaxWrpFy86SqcGWUahKMpi3GIJV8WlSiYJjQg
	 PEMKR2QWI/HwmEg/VTRUm037VpGEKqIN26GE6xv32feU9jebNOq+/YHQCEJrVVb2RKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644948;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Cookie;
	bh=0t//kBYKLxqzlV8oCo8GXvLxhgRWVsUvG1mftC8o0TQ=;
	b=1vR62EcSUEPa2UBIlAU7dKQ7kwWNB0g77KeSFzQPb8EV+KDkXbIWd3Mft5rAUvhBZyLp
	 nnoWMoSVJjVJm1QBE3TEDt+ylx/Jwv+NpyiP2dJP6jqLURSgW2eXi83MZ9Zpg5tMw7Kmu
	 UCxTCrjfiyro28LWd0u8c5u2E+ANUf+WhYs2/mYmUDZseBYGfW472aKlzwm8U9qPH6ZNK
	 bNH0dschtlIOf1H83KrtIjCbiqDwcRpmXJtE+FlNrQ4Gz5DYtb7WlpWJGhhqfgZAHpirO
	 Q0Uyg+oWbUgtomXCReoHL0IIN3LxoP/wU6qu3POsqW3LSfcku9W6psFOW6NWmcGOQsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R10gR67L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C08606A324;
	Mon,  2 Nov 2026 18:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R10gR67L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC851F00A16;
	Mon,  2 Nov 2026 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793644947;
	bh=0t//kBYKLxqzlV8oCo8GXvLxhgRWVsUvG1mftC8o0TQ=;
	h=Date:From:To:Cc:Subject;
	b=R10gR67LobDagMZG931/Nsz8tt8Qh25jTxMZvaSXglnG5R9cF9p5+ItmfbDUkq9nc
	 nDAm9vXvLOiViWKwrGOHvpCMHEaQ279iM8M9F3MA7ilAjvR3gzce3lyDFRJ8KbuqR1
	 Hq1OkR+EqmCHjipl+U09kW9icjnKlu/CoJxSaaGhlqak3Sa3skXoHbGdP81mjfMTUP
	 0BceFrznXQyULUPmBpl4tPmc/5F/lN+JsqmE91288uFe+rq/0w2vN3+mvHNMtcYyLc
	 KJr9raFUCDhBuvXslOtIpZepLnql9LjwRCLLHcFz7VgYxJXKLCpaQyHCvpbMLvYkJr
	 yL/nFJr1P6qvA==
Date: Mon, 2 Nov 2026 18:42:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Airlie <airlied@redhat.com>
Subject: -next status as at v7.4-rc1
Message-ID: <7c965777-2d84-4006-8c12-862e4e020b73@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="ZFfrlkMH9QCX+Imw"
Content-Disposition: inline
X-Cookie: Used with permission.


--ZFfrlkMH9QCX+Imw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

The second half of the merge window ran pretty smoothly, and there's not
been enough time for people to do too much fun so everything is quiet at
the minute. =20

I do see quite a lot of commits that didn't make it into mainline over
the merge window, most of that appears to just be trees that rebase
routinely so the actual code will have been merged but I do see a lot of
DRM commits where that shouldn't be the case - copying David in case
there's something more than just people not adjusting what gets pushed
into -next going on there.

No trees are held at old versions but I dropped the turbostat tree today
as there seems to be some rebase confusion which resulted in it having
something that diverged prior to whatever was sent to mainline over the
weekend with horrible conflicts.

Trees with signoff problems:

  mm-fixes	(missing author)
  mm		(missing author)

(the same commit in both)

Non-merge commits relative to Linus' tree: 1906
 1782 files changed, 77157 insertions(+), 27681 deletions(-)

Top trees adding commits to -next:

  238	amdgpu
  151	mm-fixes
  146	drm-xe
  85	drm-intel
  81	mm-nonmm-unstable
  57	btrfs
  53	nfsd
  50	sound-asoc
  49	bpf-next
  47	rockchip

Trees adding duplicate commits to -next:
  60 amdgpu
  23 turbostat
  13 nvmem
  10 drm-intel
   8 drm-xe
   6 slimbus
   4 fastrpc
   3 socfpga
   3 drm-intel
   2 sysctl
   2 riscv-soc-fixes
   1 vfs-fixes
   1 at91

Top trees with commits in next-20261019 that didn't get merged:

  210	mm
  96	amdgpu
  91	ntfs
  84	drm-xe
  82	ksmbd
  81	drivers-x86
  69	ieee1394
  32	paulmck
  32	btrfs
  31	mm-nonmm-unstable

Thanks,
Mark

--ZFfrlkMH9QCX+Imw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmro2Y8ACgkQJNaLcl1U
h9Ao/Af9FddnjZSc3f4ceOLuju6+YAWpEwwFaCQfRJsXvf1xXv9qmm3Nh5uOrO2N
H0otSvHPxqQweWebOGZJrqtUgDOvAMXzmasLNYjngS+9NsBWwVUJkUOjdaI31KER
fMdZUhJwxyGKLYAs8x/YSQybCQ+8qMv5yOukjzB6ONZJlhHJjLJ+1LYCrmRjzBFA
irQI2MNLKMW2V1PwUpdlNUnYxZRc5t6ZScTopzFnzdJjcZt5mpPOtxKAK9MevE3Q
N81ollNjAM9z2rqt0Pf+S7y/scSz9MBecihBmLx6//R0cyHPVlpnIMsy9E4VkWlo
U5cGQ8IbzUp5az4sX0AzbMuc+MFh5g==
=m/G9
-----END PGP SIGNATURE-----

--ZFfrlkMH9QCX+Imw--
