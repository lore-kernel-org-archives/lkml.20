Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEA3CEBB9;
	Fri,  2 Oct 2026 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964768; cv=none; b=qph+B2uh+7kROzxcw4ijnv8xsMA2QHKFfcTQOek6zI8MnPF2N5q2Hmq1qgwBzm5Ni1hOcMX9yViQfSDx9WJtTcyIoTdgm4mro46rvRt2Djh9WvkXocr+IfUI4aGTdqPnvqvqelfO2rGFeBFsQAWbyfkvkFiYNBkUqL9JmoxaIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964768; c=relaxed/simple;
	bh=4W2b7vlSXdysadf6+LFeP4pew385QjfKq435W8Vz+fE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7ydrZW0z9vSNPOs6RXTzqCHXc5OdlJcg+QJmdPDWs+84aKKEydRoI+97a+jZKQHbOQxUCRMWKTNsFOA+yNzqjp/2GyhNd1vLZtNGGckQmMz8g/aLLv7xSHsi8GRe3lGcneUHyNayXimeI4jqSt6ZQzv/UjqlLkRXYbBZoBecow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSEbUyzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSEbUyzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8BF1F00893;
	Fri,  2 Oct 2026 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790964764;
	bh=PVDybhQR0lJdYcvHYQc8U039ifOVIMYazH1aycCTW70=;
	h=Date:From:To:Cc:Subject;
	b=nSEbUyzEKhsI6zK18g81LCQy7qpdOis3ufBPjmiiFxcmw1MAGFx8/1ACKxopxI5D7
	 lu3e+293IwkWGednT0whizgjF9lZ0WuAbFKe9olwewaua4Wd0WV+kXB74mHs/YdjtF
	 EtAnhqw8kwI7cH7NN+UBz9xvD89jSvXyldbJHJmpwbBJ2g73XjbejojNNltW4Y+/Ky
	 I/nGeNwkRjNR9uTYTUbd+T4AWIXUwjXOqEw+3Z6D0mSWAH2oidGJbdyg+usJ6no6qB
	 fNhppvRuaXnLKIkZId5dJRuK7N8fK3lhYe3jqPHG7H0MV3M/NKpHRUaV9mP011+gif
	 0RclqvtB3l6Mw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 89C8D1AC57CE; Fri, 02 Oct 2026 19:12:40 +0100 (BST)
Date: Fri, 2 Oct 2026 19:12:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the clk tree
Message-ID: <ar_0GFOb5hZfhHHx@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KyhzCljaV80OIyqf"
Content-Disposition: inline


--KyhzCljaV80OIyqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  d31b7d87d1b28 ("clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks")
  488d2cfdf3c99 ("dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks")
  9546425453234 ("dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define")
  ea2ee01da5555 ("dt-bindings: clock: ma35d1: Document the missing crystal inputs")
  35ba0118dac01 ("clk: nuvoton: ma35d1: Keep the clock count in the driver")
  e92291a009f7c ("clk: clk-gpio: do not blame the DT property on probe deferral")

are missing a Signed-off-by from their committers

--KyhzCljaV80OIyqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCar/0CAAKCRAv73Ows9A4
ia6hAQD3NW9VFHUTrD2416hO2mxKzaw60mSfYzSm9FV4NKmH9gD9EL7jZAmVy776
8IPe3w8wnZrZiiBErrJ4/O+oJv+d+gw=
=q8yg
-----END PGP SIGNATURE-----

--KyhzCljaV80OIyqf--
