Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489064;
	b=tPJKhp/dy3aqzsY2zPWhihO6ighBjoKO4M04UGRzrst+TerNfHtlN7oZySHltgVeXMQ0
	 UFAizszCeA5JXMi8FxOGvZTOYOCTZ4la+JJFJIep0rEPInnt4b+aKWrro8jopR1NpAlpM
	 IQgxFvUxlCErZkqauAB9YA7HXjUHbXma6ooSMmVMuLIoffATEo9Tgzi6aRcLwnEO3E+uR
	 WHCS7AeOQ03+fAvDfw5kOck41Z6lASM+s6veo9cHuhX+Y+1gB/jVP4MZW7Oobxi9xIFX8
	 LJUobJFLYN7q0g7JdfM9XLYINVPSlgRmQuH7hTuhQjffNZ99uJsrHQFQKuZ925SrqMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489064;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=PA2XrRJ1jEDBZ4cWD5Zb7Rw2dDKemUDo6+rbWVKhUVM=;
	b=h8oW63SnwwVmT98dTyN2FdOs26LOVv4coYZRHGHbB22n0DQscGlx1UYWmdCpn684/lVN
	 gmJxjXJmP5QAq+v2v4BTErfBlWPLj+t3q3TjH8nqvE1wUSyolZCLnA/061K2PKLuEy5nd
	 lUbzwPnooMJsxfs8tMK2BN3k/yfkcIDqt61veb13Ud+u5bixGU1rOQBB7SkEiCzT1lqhR
	 Nifc+2G2WeAYbemC6R/xsfsGMrQo9TxiY0q6KmbKT78LEyABJglnSCys8eyrM2BHo08YZ
	 e+HqZlpEwDI6LBy4MBwLeuNuzexEmbcLpqnBO+4mPkrk5GgFyFdIADbi2Xr+bgS7I4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TjB9/dRd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2360A261D;
	Thu, 12 Nov 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjB9/dRd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8A81F00A05;
	Thu, 12 Nov 2026 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489063;
	bh=PA2XrRJ1jEDBZ4cWD5Zb7Rw2dDKemUDo6+rbWVKhUVM=;
	h=Date:From:To:Cc:Subject;
	b=TjB9/dRdFTUdvHmXK/Un7MNf9qz0q5hKhNHTUQ/IMNGSYLboZ2dedJrENx0AoKBzH
	 gxpBYpiAdcSlSgkBTk6V1tLgM0JK7LW/XAZEZCz6BLb4VcttGuK2CbnsCFg66QKGI0
	 n3/qYxduye6mvak7P7VOp/KAy8Ibm1slJZgY32rMPa+dcflbcVJOv4kzK62VqwIs4O
	 gBDwfoL3U/8yAL4g1EMA3O3LKKccmwMiWKtvaV8mEbj/uPOMBWFQ6/d0fYQL9IfsSl
	 K3aKO7brBg/6wq3K1xUFhjL3a1Pdg19rED/3XQPblEJWS+8KXInPlByn/OrPqFtXiU
	 YJdoUbuEVmspw==
Date: Thu, 12 Nov 2026 13:10:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: linux-next: manual merge of the perf tree with the perf-current tree
Message-ID: <avW648YFgbci03ra@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="YDXyM6BlI+CK27Me"
Content-Disposition: inline


--YDXyM6BlI+CK27Me
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the perf tree got a conflict in:

  tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json

between commit:

  a89a17e152c8e ("perf vendor events arm64 AmpereOneX: Deprecate BPU_FLUSH_=
MEM_FAULT")

=66rom the perf-current tree and commit:

  294b096cafe17 ("perf vendor events arm64 AmpereOneX: Deprecate BPU_FLUSH_=
MEM_FAULT")

=66rom the perf tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

The -next copy of the cherry pick has an extra '.'.

diff --combined tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.j=
son
index 114f95e41e0d5,b0934a7b252c3..0000000000000
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
@@@ -35,7 -35,7 +35,7 @@@
          "ArchStdEvent": "MEM_ACCESS_CHECKED_WR"
      },
      {
 -        "PublicDescription": "This event is deprecated. Refer to new even=
t GPC_FLUSH_MEM_FAULT. Flushes due to memory hazards",
 +        "PublicDescription": "This event is deprecated. Refer to new even=
t GPC_FLUSH_MEM_FAULT Flushes due to memory hazards",
          "EventCode": "0x121",
          "EventName": "BPU_FLUSH_MEM_FAULT",
          "BriefDescription": "This event is deprecated. Refer to new event=
 GPC_FLUSH_MEM_FAULT",

--YDXyM6BlI+CK27Me
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr1uuIACgkQJNaLcl1U
h9AJwQf7B+OURkT3hKzx1jkUCrc6mVAUgrRHnV4hHYzSE5QP7cvnJqdHhFpYj9RP
e9/R7ZTSYfoJ1ROuZe1jcrQ+gZzJnG+snQ7/A7mRt4pUdwNiuT1uZ2YL7+sJs5pG
3k24qd+XPqvn+3yKGInAqIycNC0B5CfDdi8j2iXZewK1rgg/zM+P3XVqcCCvh4KJ
oi5E6YJqYXGkiSPRIu+jJbz0IqzH8GjPWAjenS0RaLddxt12pDjcVNFi5eKykuqO
ikQl6EywPdmHIJEEUVbZNmFIVn4DbxwKHK8NNc/yGfMQSiNALA0PLQRk93bETAKi
7NF+r7UX5C+2Q/lM8dYzKE+eD99tkQ==
=w995
-----END PGP SIGNATURE-----

--YDXyM6BlI+CK27Me--
