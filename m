Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56B3BB664;
	Thu, 24 Sep 2026 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247239; cv=none; b=bBS3DSktCROsvoIGJn0D3DT0+fsqoAhUk1XIweG5QGSgl7/kMjcGVANbb+6v4j3ohxcnoBWnnbolMf7nNvDhTBFWONewNObx4zVQzY5T4ff1DS7pgGyiYsFgl19KeVJ5kPXE1pyp7kHo6r4Kgg07WEvRpSeeNCMbAWVsaSj01bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247239; c=relaxed/simple;
	bh=tJ8yrRPCfBZ0x/hSLR6t6zw4QFx6e7QNrRdH7ZAk+bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IIdAiMwOoMYcCk9lx8/UWhEvcvK5M0FNI0TI+zgzkoWGi7QhGzNCWxeRjEdFx0TX8b7Zf5z7jArI5bets5NXz6ycjfSpudYtV1nUn84irD5oBkX52YWPU8HslUrdqnVqhQnFbctyoBEhmVlxq2ZmRg8I6ZRF185Y/sW64dKpVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioRLe2Mh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioRLe2Mh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106F51F000FF;
	Thu, 24 Sep 2026 10:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790247238;
	bh=Bo0KFs181nhqi0shEFNcFHlQX5qdnPO3uuFk9f2sJoA=;
	h=Date:From:To:Cc:Subject;
	b=ioRLe2MhDgMmjOqvo3IG5T1f6ylTv+/SiNC9AcdecY0M8FeXXpCSL83E13nS/es2n
	 HZ1oSI1Ow/K51Q47Qxnf0MTtSQGwxObwP1DkAeVNXR1gpQYSwAvmc0bXcqW0BpkgIS
	 Hxp78m4uicwKFy+9KvzZs2fmon8j742HsF7qL32HqfJDzcSZBDPEu/uQc3Nio1EK6J
	 Ha4W35Up8jvcnJ7p+MwkZiwf3G3B433nbRrqR1FK/Ey/HE0RRZCM4xgStxHkAPEvk7
	 MgLr5s/8AYWDhg1Vv82V3pte++i01qhvLLlGhsOMgV3umuQm59NJsszbGV+aRZt5DW
	 Sk28Bs4O5S6Kw==
Date: Thu, 24 Sep 2026 11:53:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the drivers-x86 tree
Message-ID: <arUBQuAfW4HJQHik@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DQhkg+UvwKYZ0Y1S"
Content-Disposition: inline


--DQhkg+UvwKYZ0Y1S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 support")
  9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning in fan_curve_get_factory_default()")

are missing a Signed-off-by from their authors

--DQhkg+UvwKYZ0Y1S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1AUEACgkQJNaLcl1U
h9COOgf9HWw/EB3UAMG7DWhO/Amx9zMu8qNLxMe0j6kN+JZ5kvp/1OAS8gYUeynU
qAFF6oeBLD8l75zoX0cd2r/bLF29uBQNtIco45ND1PaUnciWWKeq31k/J/WWywSx
MAcdJa08W3vHWWSvhqaup+vo+x8jPHJsuhkKpopxl27yI4LTlXwBIpjKf58Fsjf7
vywxHBHaLBr4kFK1t8ao2Xg03INgSryzyzAOqCKyV3P0WiI7i2r+XlpjvRJ0VtVe
+jkjV5aw6lATQS71lF4q/d3h4w6tClmOBGri7mCHbNodMPUYNx63FRgXoTRonT/E
RxVMp4WF2tVywBy80TEsiIN5AS2Y6g==
=LQ+4
-----END PGP SIGNATURE-----

--DQhkg+UvwKYZ0Y1S--
