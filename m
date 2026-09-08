Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3B39AD3A;
	Tue,  8 Sep 2026 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900794; cv=none; b=OdA9cPjLfEdsXHZ1rQyqnzhilQrSUD47YfRuu8DZ3V5hMFcyvdBWXrw20O1qdg4TOIAvMRcbsB2ms6h1ZOQ0hiTYRpqiwnbT6fP6ZdWlq3rggkcBhgXRrsRjILQp3oTzAGeg+zhEEYFpyL9Bz+outUTgFbVMffZ2b3dm8bsnJNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900794; c=relaxed/simple;
	bh=XN57zWmLND9LO1P/rLGMf2hYGtUQtHx9QmzssYsyAWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVqbY6r9TTFI1IQ5hnm8kUDPIOKt/26KTI1gmFu4V7uILGDDMEuvaDyU3YYZD20mCokUq9L6jd67NYWgKN7ObpzRRltuVExwZ4AA4S2Lkisty/YCB0IuFf9AugkhFucukgmBA/htOc1E5iz0eFJS+hF702vAGsYLyt0ybwud/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n65Dg1u2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n65Dg1u2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD381F00A3D;
	Tue,  8 Sep 2026 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788900792;
	bh=VZdtFirp6YDHJxr9hUZsuzkj5zEOnlcPMu4W/cxzo74=;
	h=Date:From:To:Cc:Subject;
	b=n65Dg1u2sAPXw83LMJhpeWSRk8SU/iTYSCVmQ8iXA7B5UiEne4ucMrwziEz1Z938u
	 3PMUG//s9eE5iV6IppZF98oaMcHnwgSjwQeJ6xUjfx9Ew/KGOOiySZ5Ps70en7IsIc
	 VGTsiMKZLwnzdN3w1LxhCehJpjAOKHVaei95RpX8DHLdOu4k+YIM+pHp32LLJuQ1fg
	 St1ExaBfJp3XIs4aKfpSgpysM8NpLYNDKucsHmtp820db8rSW06yTGA7ce01XM2KM5
	 pwMpgwSRdFzPNZO0yGWSYCj56P1zzlpV+6/H9COXyH1hYh5IGvHH0/JVxowypbTKi6
	 8u1ax6Hiar08w==
Date: Tue, 8 Sep 2026 21:53:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pagemap-headers tree
Message-ID: <aqB1tf5nfcvEOImB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0zUZ3hxQYm9oRwJc"
Content-Disposition: inline


--0zUZ3hxQYm9oRwJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pagemap-headers tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:229:3: error: call to undeclared function 'clflush_cache_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  229 |                 clflush_cache_range(cpu_mapped_buf, size);
      |                 ^

Caused by something in your tree interacting with another change, most
likely a header tweak.  I have applied a fixup.

--0zUZ3hxQYm9oRwJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqgdbQACgkQJNaLcl1U
h9DyDAf+M79Ow+rfZPbxrUu97fC/hE9CzCQrTgXmKO5deMo1agyMn6ZlS8mIJ6BP
dDPPwj3bG80ZC6BAqsvwfkH3AlkxoA0r3IJyDa2Qrov8d+x4dl+sbCexubXo0DXQ
daNp63l5ADr6tGqvnaTXyCP0diXKfacyAGwfMxIZkXKj9WZsQ4VqZ2CGoXgiOHyg
BM1dtQ6HkmmwWrWL1xma1UsT+yTKXjdJeNSrr02FPB2s7ddB92hz8FGKpU7Mt3Oz
xpmtJUlHvFMGJsv5MnEtReMayU5Z61/smsW6/O4/fOfAfJ50ilJV4bjvpO+fT8mi
qp6Hu1Rhl1KpY+bhtOsp3HzSsUS7Pw==
=MV3V
-----END PGP SIGNATURE-----

--0zUZ3hxQYm9oRwJc--
