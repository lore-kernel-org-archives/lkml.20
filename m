Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A750AC20;
	Thu, 15 Oct 2026 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063796; cv=none; b=NDt6LcpKyV4d0ACdV7cSWH1B4/MX/5u7MbjEeQYz1gtv39Nu2blNUXCmnZqqftbXUXF6EvSvyhOUvonV7Mnk9Q+5DYfalout2RjGSNFnAL2NiywaXgfpWT4LQVDYPApGOwrrBRjeRq0edL9l7Lm0KFnn19CiVlEresiFoQv8gjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063796; c=relaxed/simple;
	bh=PuDraPxveObNw6YF0fJcKPhT+63JNYVYv2xDl3xx/YM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KcsCCT73BNyHXvVkX+cdTQi9h2RwHU9hqiHtpEEXlhRuanu3Aou9vacMCfJsaf4MQmtEElY2cjpdbu4Qu0KBEnDjh/Eyf9WmP0Uff0HFYoiIYB5GYs0JBGlr+NPijgU/eQcMOR5A2aT/B/7XlfV1s+zOiPXHHUUj73Li0mmrTCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TE4E45fg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TE4E45fg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B27C1F000C4;
	Thu, 15 Oct 2026 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792063792;
	bh=2DwhX/3ce5TK5tWLd+Z7vb78AEHTFNPlbKXOzjGXpMo=;
	h=Date:From:To:Cc:Subject;
	b=TE4E45fgXlUji/yy8nvsc/9y70QQLG6CO6WdJ0lL3+3TwhM7fa5rTLehFrV8aw5LV
	 6SmGRt3a2pIxTnlWTEHlVvUfpdL5Xu+0HQwaPr8UlDTImhrCdmWirKNLTKGiCMnXCi
	 GRLoo+47xyyIXoCh1HC2YmUNgRo+0XQs4S8BYgmtvlo/2zYb8/4sMuDWW0P+O8YP26
	 FkQOHSXZ1o5qGsUP8lv0mKgsjWbhP0LKHNZ5KZ4kktSb/sD/WKcES9lKZ43nKfJ9kX
	 cbDuzCG1dgZfVozZdsRsEIMRr/kSg9zcGIcBxRmG0OA1ZFZAh3KUohVIIIEvAnLkZS
	 fQy9iS04iS+Kw==
Date: Thu, 15 Oct 2026 12:29:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the kvms390 tree
Message-ID: <atC5LZemJJUievn6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AWBEMmhd0o2wyiJM"
Content-Disposition: inline


--AWBEMmhd0o2wyiJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  2da555e616089 ("KVM: s390: Kick PV cpus at the right time for service irqs")
  9d2c7de8ee14d ("KVM: s390: Improve floating IRQ injection behavior")
  c07c9e91ebb33 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for the STHYI buffer")
  7e4702e32be06 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for the STSI buffer")
  399ddb20fa708 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for the GIB")
  1d42d02f443d0 ("KVM: s390: Replace get_zeroed_page() with kzalloc() for sie_page2 and CMMA")
  ec95708cbb07b ("KVM: s390: selftests: Add IRQ injection selftests")

are missing a Signed-off-by from their committers

--AWBEMmhd0o2wyiJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQuSwACgkQJNaLcl1U
h9BYGQf7Bw5onf3w00DaTu7xuGcN/6ANB34NArBTAYQ2QQ4p1sjNe/+e9kbeKcgh
UL5rJtqeLzzsRBiNHuLVfTCFtvGM4v2pmMJeSChRd30YllTnrIyW5j9AvmbtDNit
YbWYAe4Yqkk3E12/MMKTBK7JC7ASXwjpR2bO2A9TNOWmu3u1E4ceKS9J45VxBY/D
HVRy+cfvZT/K0XhqxI8dK9ZUnxca2DU2ubcSYG21Nw8FWvP/FAzCSA++ilrFUZBI
Jaapy4K3MlEgIT2be3oBdJJ3lZNOVcryKPuTI7fZb4cjGaUm/5OYdC0PV9KYfrie
cQcTyMcORTV9peokXWSLCq9N3wShZA==
=5T7r
-----END PGP SIGNATURE-----

--AWBEMmhd0o2wyiJM--
