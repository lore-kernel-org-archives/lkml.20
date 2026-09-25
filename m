Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75494B0E28;
	Fri, 25 Sep 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352604; cv=none; b=hYqbN50geA3D3exWo1RBib6wqbE0K8xw+gkoUA+JqxT77QO/fkGtq00qoh/LwXHXiakp98WiEYbMosTb0GTIbzNqkK6TMal38Av+rrF/pOuc34slcBqdvDZjNzkitLSJKSlCwHACqB7wvSMO0LBKh/EtA6q3uRXvGipRAipK7hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352604; c=relaxed/simple;
	bh=JCwtQgwBd4uwiQQ9cruublW3anVCiwN2cr1QB/kcyNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s6IPr4/4eVlU5z3Q0oyRNdeX9+Yg4neb0gdxpEfSaN/2V4psb2as9t0qIsBKVSkT+whsmo+IkNRgwjI547Sc8njYWK8xyBnK6NvMYhriq/57HDTBau0gjZRZhT3Geiz624sVFJCr9XmL8IHR6WY5dKNxdfUewxLQ8rh8U6OYSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjXAqtIi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjXAqtIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C401F00893;
	Fri, 25 Sep 2026 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352596;
	bh=lxcuWMccAAILLnFy6ETqKbmwxnpl0hasudonI0mgeG4=;
	h=Date:From:To:Cc:Subject;
	b=BjXAqtIi1Zv7kgI97vY+BEwfEX8Ir32tAJH2BgnOiPsbz/VQlo34JINcjViRNAlh8
	 +KB4oWLb/gmHkZXM02TcnojJbWpq/n2fiWPMRBDTtKT9j3mAdZtbvzrFPUzsi5m/yG
	 A26k2x1ezcp8xCZQuOA4pWbg6Vsejv+Zw2nEiQ6jFmv3GAfchCWg7Zbz+D7MsfCOYO
	 ARLimIx+lxB5ICIUH6rQuDUMTtw1a/7UfHPmDI6gxO82uFyKFSw8d/z5889nYfNB1S
	 bGZvvhjPjv+7kpQPsdo2L9cBtGueIOl995zEU9upyh6yW0YKds2g3IzO6r5mjHtdXp
	 uOVFhrJSTwt0A==
Date: Fri, 25 Sep 2026 17:09:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Odell <loganodell@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <arac0WyK8MIbFeNP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FFXBYXPNDcVTjvZc"
Content-Disposition: inline


--FFXBYXPNDcVTjvZc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In the final build today's linux-next build (i386 defconfig) failed like
this:

/tmp/next/build/drivers/pci/probe.c: In function 'pci_class':
/tmp/next/build/drivers/pci/probe.c:1902:12: error: unused variable 'rev' [-Werror=unused-variable]
 1902 |         u8 rev;
      |            ^~~

Caused by commit

   8a2a9fa37b814 (PCI/IOV: Read VF config values that need not match PF)

I have reverted that commit for today.

--FFXBYXPNDcVTjvZc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2nNAACgkQJNaLcl1U
h9C0sAf/W4V6I4zEF0lAbIsEKN9ON7EDSJHWqLJStLQPhkBvRw/sC4ff317rM0of
w2S65QCShVuu7IDiSH8ct2chUzHu0TPl/NOxTOk2jdYrFPYanNo3yk/derccXKSm
cxVLgVzOV6mJbtOLA5tVK6N+ubzvb0Euq5LVhAlHAFVdkoJdqIDWfveLpo42Zotq
ESNG61+osg9dtvCzaFx99GttfYenthUBcbtp0oGBjYuM5AnksEKc3+7+tO8W2cfP
5OThr6s08eas7QDqJyyMfnVdR0DwI/2VbwA4VaVImVCBlx1nUQxHb8FZXOqSU8B+
DHif1fUnFgiRkqarsOny0L932w9xjA==
=Wm/R
-----END PGP SIGNATURE-----

--FFXBYXPNDcVTjvZc--
