Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489537;
	b=L0Vg0fx/VaLLohIobgisQAc4dQc204Or/WiahmUawyTwATPCMg3ImtRPB+fPFMz/8bN4
	 2yOVgbN5If5UlewCxyMEyrieJhK8oHXZbNzNXn5dtEREOCugAlKTRiG0FhEWK/xPU3zwS
	 lceFh9rvJttTQs4Qms+kRFLwMV8A8luDrQZmUz74vEcOSaFELl1TB8GwvWj8+/Lw8T1Vb
	 YGdZtcd1Z93yGwoCmQ36czgxmgB5stWioaUSXTrCJKy7UDnzsDXoqQA2XeWvRR+2ZWNxn
	 UjIgo5L9tRD1F5rrfueLjR7w1OSIZP/9LVKC8VEUb5A4S/F8gMUP8eQFEoHIqwg+EwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489537;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Cookie;
	bh=xfm3tQao5WE1WUAGx1d1Zlm9qAjSl/BorrGbV5qINGw=;
	b=quClXkVPSoqCs7eV7zRoXcF23EucKaPYbbYXfM0BTMhb+5s0o3BAOrl8tPjbCRzt0db+
	 M9lL2KnFeIChLuAllNDW8LSB4Ryyq5l5mIJmx/UG55d2GTqHAR3iNBxiEoIQGf9UNd5D/
	 K0iKZxPc6pWrWyhPcqSg0ruVreTqjLtkB6RB9XgoFc4cuRMu+n8KmTJJnylJPWRpYALep
	 OyfrK/yKPjkEWuksbONqMQr+G7JN97X/KyfmcgB8GPIYQ/wA8ConBfOKGkJ3m8/DWskul
	 n9lhnKWLW/LV3qBCDqfvNOCPE8rkqQLN1/jy8xSCMi3s7VV5SjPRExtHg7Qiyj5ETyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID2UgdJ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C6606A320;
	Tue, 20 Oct 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID2UgdJ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF6E1F000C4;
	Tue, 20 Oct 2026 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792489537;
	bh=xfm3tQao5WE1WUAGx1d1Zlm9qAjSl/BorrGbV5qINGw=;
	h=Date:From:To:Cc:Subject;
	b=ID2UgdJ25zsN4F0eRrzscL2Wn0anh4l2rmPzw6EhjUy/kOQEhyqqEjrc7PY8p4HOA
	 UpJPJle0CQd65S2nsQkoFfhfoCo45NHvhjoZVCjAH5diJG1MLlRVXCkzLBfgIpoNrJ
	 XFrKZc4DdLF2jwpEVGa6K4F+WwYgGe5UL2npJYgRLzw6EAJBGaCMx00uzkGsvpA5oR
	 ToJGOHs7B3eEfhioODL3uHsY23HC0ZmjdqoOzL/mvQfjREnSW8z20HcjU0CM3ByavH
	 V3yEM0v7My6xF+1rbPjgxa6EgB4RyiKVlDhEDe2TrT7B4QO3U6lw35HET+e1MPqyDI
	 +Ur5ZG1qys+8w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4D8ED1AC57D0; Mon, 19 Oct 2026 20:09:12 +0100 (BST)
Date: Mon, 19 Oct 2026 20:09:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.3
Message-ID: <atZq2EZCQ-65sPv1@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="P1jZEGQzkx6/lNCU"
Content-Disposition: inline
X-Cookie: You buttered your bread, now lie in it.


--P1jZEGQzkx6/lNCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The usual rush of last minute merge conflicts today so this is a bit
late and rushed but generally everything has been fairly standard - we
did get more issues this week than usual, I guess LPC did slow things
down noticably so it probably evens out.

Trees being held at old versions:

  landlock       	next-20261001	(kunit test failure)

Trees with signoff problems:

  clk		(missing committer)
  drivers-x86	(missing author)
  fs-next	(missing author)
  fuse		(missing author)

Non-merge commits relative to Linus' tree: 16246
 15182 files changed, 1033397 insertions(+), 388934 deletions(-)

Top trees adding commits to -next:

  2236	drm
  1831	net-next
  1243	arm-soc
  781	mm
  619	bpf-next
  596	v4l-dvb
  453	sound-asoc
  378	perf
  342	char-misc
  275	tip

Trees adding duplicate commits to -next:
  23 net-next
  23 drm-misc
  21 drm
  20 drm-xe
  13 nvmem
  13 drm
  12 amdgpu
   9 clockevents
   6 slimbus
   6 phy-next
   4 i2c-rust
   4 fastrpc
   2 vfs-brauner
   2 tip
   2 sysctl
   2 socfpga
   2 devicetree
   2 arm-soc

Thanks,
Mark

--P1jZEGQzkx6/lNCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZq2AAKCRAv73Ows9A4
iUKaAP9mDjWYlwOgP+XQ6X+cIf9HaMMtn/osgGQ5evmv2R4D3QD/eFCK9R2KvAYt
XnaLiPDHC2dfwhqw+7lfiK2El5IIVg4=
=D5KC
-----END PGP SIGNATURE-----

--P1jZEGQzkx6/lNCU--
