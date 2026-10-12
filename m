Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDD4279F8;
	Mon, 12 Oct 2026 19:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831938; cv=none; b=ulS6KdXGbxAcPGZvzsHO7bYcbWGMwWwUzoWcU8QZcu4mcowxvL09OJupGc5LLLDXWEebTWutDVKgTNnkWwmD2ve6E8jz5oooZ3La5+f9PtcVDj4JEWSFCHE5ydPCZEzCgVCeGVMiazAYlvhpMTQmaIcEzYgX7eGhy5fd1M+cABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831938; c=relaxed/simple;
	bh=LSH4WYaT1skOJ+TnLOv0eEeqTTiFCHFkVymnekdLX9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eu/0k3uxdRePEiAnVNNVbSTgUZJ4KbufAb9i4s2FTp26wklRzFeQZVo97DyRwKj8My4RvaA2+cKGR7h387+x84gi3/tOzjKwEMsSxoGnfHU9m2c0yPZztQlXHzQcVTe833y2djfbGP9aGsBX02B/7Qdrfk7U/HR9qxxHRuDjrMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwHzw/Bh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwHzw/Bh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C361F0089B;
	Mon, 12 Oct 2026 19:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831936;
	bh=fx6sZpGwSsTCb7vmgpOEhINwLqcB93OXP5gq4vcDnmA=;
	h=Date:From:To:Cc:Subject;
	b=KwHzw/BhcWyRgRbaIRAGv02JYMAHp9N2tQh9zN+TD384OsaUMh1G0SjWSEt91Hona
	 2/4/XBLDTNpiDou9uR0Hb5yBC8TyI97+1FQ75/bicBz8oT1rAMhjSHCIGkDErKzG+l
	 f9PI/imvxp9vhFjyGI4WVBYfOA0oOKjZ14Af+SoGdH7kxhvzxlbSR7Lqer1ax//CRq
	 SFTU/lP2qY3Q6ukcbk1y7V5kVLSGKgvi9Cs7lIKOZAV2AOS9Okjtk4zKdwxlmPcg0h
	 /rEQu63VhNX87eFEKVCfDH4X8icwZwy9UQh/atoAw9nu+sm6sKaXGQYDca1NEda+5i
	 Hmwg2kCdJWEGg==
Date: Mon, 12 Oct 2026 20:05:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3-rc7
Message-ID: <734e8f7f-c3f6-4118-a775-f98b4d1101f0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="onXm/2OtS4NRsFGz"
Content-Disposition: inline
X-Cookie: Double!


--onXm/2OtS4NRsFGz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

As expected LPC meant that -next was a bit quieter than usual for this
point in the cycle, hopefully this doesn't mean a greater than usual
last minute rush but we'll see.  The constification of mnt_idmap
continues to lead to a string of semantic conflicts, though still all
very much trivial to resolve.

No trees are held at old versions.

Trees with signoff problems:

  clk		(missing committer, there for a couple of weeks)
  drivers-x86	(missing author, sent my third reminder just now)

I think drivers-x86 needs an update to my contact list.

Non-merge commits relative to Linus' tree: 14973
 14280 files changed, 977339 insertions(+), 359372 deletions(-)

Top trees adding commits to -next:

  2126	drm
  1134	net-next
  730	mm
  596	v4l-dvb
  474	bpf-next
  462	sound-asoc
  429	qcom
  342	char-misc
  340	perf
  301	wireless-next

Trees adding duplicate commits to -next:
  25 amdgpu
  23 drm-misc
  21 drm
  16 drm-xe
  13 nvmem
  13 drm
   9 clockevents
   6 slimbus
   6 phy-next
   4 i2c-rust
   4 fastrpc
   2 xfs
   2 vfs-brauner
   2 tip
   2 sysctl
   2 socfpga
   2 devicetree

Thanks,
Mark

--onXm/2OtS4NRsFGz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrNL3wACgkQJNaLcl1U
h9A+pgf/V9gC36aEtdIhRlKyrCsRtnvlcjEcRW/CmiWFkoCiFLBRxncSmknkkGOB
7C/Gbbi4UnUyQuzvEsi4B+Vq9zcL6FcrdCGrHwWCW2XnLZ6WLeI+hcO9fxkN9oys
NhwsfEeUSnhURAjYq1UgLSSKDsLKGyKQcQEmxIfSEalHOFKHeugZNXnqhHJiOTHD
rjE2U6jP9ToUC7DtW+FQDdQFUks958CvnIkz6wjkPg50JbsugpFu0uSqDmgTvwkX
cby1ofUplNY+w4pTTOlePyW/nM05OE+CXSbGarYiV9+zFnw1kHFumvA+k027cvLY
rwcHfy88hls4ydfd0t6HAfabukG78w==
=JsX5
-----END PGP SIGNATURE-----

--onXm/2OtS4NRsFGz--
