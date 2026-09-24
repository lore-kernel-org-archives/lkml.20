Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDD9442385;
	Thu, 24 Sep 2026 22:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289409; cv=none; b=DJLfwkwSxoYdQD28gz1moADL53dTgw3e5KIiDQYnOcB0yMi9AgKxoddFXvap7UsfuXZEa47ZJSXvZNukpqkLe+SvI2ix/1lbRY/SEhd7uk6kEZlPqgB/mAYUCnJxtCE8o9EkghZ0f2VSXi5gYjheapG+MOpIcYuxXOVy42dOzLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289409; c=relaxed/simple;
	bh=1wmX4rp8dbQalKgfoYF2kUKKu5XPfwP/gP2gXlSUrog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJbIslGfqehgLDGC7nXOWf3VEuDFTA/faKJ/7NNwo6Hw/5XNOIKGyECEXYjzDVDDA0GFxZT5lVt62ek83mu0F1n9pJpInNPxkAqEdMNDh16Mor+bhK9vJF23AfyvpFHGbr1t7S9+jdrtsDznLvl3zRVZepR80GbhIAAsgKHRkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMoeOI8A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMoeOI8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063F71F000FF;
	Thu, 24 Sep 2026 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790289408;
	bh=oP/zxzF7zYNaQTJI7+MbpMn4XM//3Jpa5qEvLqTdNPU=;
	h=Date:From:To:Cc:Subject;
	b=NMoeOI8AtN+NYS8sImy/69uLAceoi5SEgy2znPjzlUeVQGoZhslSPgunAR6gi2O+m
	 8dYQB8C/AwRtYBLHuyVQH/BGh1G6UZKwEZPFPcitPfCtkvyP+hzDbCpZSWfqaLf1NV
	 uSbEJJR5VN4TTsSui3xMCTwA3CqZI6YKz9WsZbn4T1LVbUNU+4bGyqCKCkm0bW65tE
	 yqo9Q8FoDpvEYWJo9ycY7z4W8FZSsV7kT5aGKKqIaa8riyS1ToGYrWldaFV+0qakHz
	 XySI+xeF8n9DF0dNoDmMeyqdwW5tUI4e2vJMPf+LhujQYLJdYHQaO2uGgYbFcrgisd
	 p9YrYqWLZevZQ==
Date: Thu, 24 Sep 2026 23:36:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the perf tree
Message-ID: <arWl_CVE0g8dSTSU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NWV7WeiHSCOmpR2R"
Content-Disposition: inline


--NWV7WeiHSCOmpR2R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  4c09f6c47b769 ("perf annotate: Fix NULL pointer dereference in loongarch_call__parse")

is missing a Signed-off-by from its author

--NWV7WeiHSCOmpR2R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1pfsACgkQJNaLcl1U
h9B3ogf/T+qa6GFbWwTt/2i2tNnJ56TuCw3ilf9G3OBYNZfnu50KTXTC40iq+SoL
wdkJM8NdTEG/VoFJkCniwODGOtY3qRjL8ScLdVmxW0vOueuhdSF28Y810HCz0ZGH
MwpzlNsPxlz7hGt9+AdxY09flhNIO40uNliLvHQ1UR5hcYb75DCvEWz5XOBHGQ8/
Zo6+OrdA6fdVUx3HyGUL2S4FhKMiQ9zbstqjOXXQxJ8dzbGThLpny+v86oUPh5At
L6pgyZxsmY9uBvjzSJ75W2KOUnHXRUOXYdMr7QVQqLj4n8SihtJuojaPInTPktDI
swgJmUjB7JZx3OHKyrkcVwvirYgTow==
=GHuI
-----END PGP SIGNATURE-----

--NWV7WeiHSCOmpR2R--
