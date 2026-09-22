Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201652B1EC;
	Tue, 22 Sep 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066521; cv=none; b=jUNnuTMV+zJYicZgmbThxOfO1UNR5qNRpBWZIYPPNypjkLNreeJDpbx1oUHprE9/RjH0NiJ4sTIOexKOJT1KIuGvffY86ImboRJ5YZbIkGxnL/yOnn0Np6wrYabM7J14ykx1ChWNcls2QPv49lYJY6mSOcirDK29ri4IaFGQlTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066521; c=relaxed/simple;
	bh=fo2FF5pr/NUoFoAkmgTrhDRjX7DK3caxTBlVz2IZU4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMjPCOBsOw8J6cL5BaFcq4F7rFkv4uSFYBhhALQfQzO+h0OGgdCF7aCIclgZ1rW6A3MuWRVxiIAF3jR35I1t3oc5B2i44LafMq4vOh9uHKOyCavXNKPCYe25CDeY3HkqDjaXT995k2IJ1olUthSS47kH03WQtVyPKIxyk4tVALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XN8oBBDV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XN8oBBDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF9E1F00893;
	Tue, 22 Sep 2026 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066518;
	bh=IlR3qqmGj6HXhCVGmSZRGEdhyTs9+61HphWOqw3TtRY=;
	h=Date:From:To:Cc:Subject;
	b=XN8oBBDVH3rE+X2VQc+CbNjCmq42BtHk9tdyog3Xc0EwOKCLZWGBmS122gbTKyuQW
	 NdxD1GNZS1A6rBm+TWhB9fBS2RRE5dumLZO+hQOCslboxSOBjaq7ZfbPQosY/L6zZT
	 AdHQ3YXLEK5zcX/ERJjV1HtIFo9uA1GvZhsyjpWiwZvM3vOKM08n2k9arv7EQUxmIB
	 qxi+0HBHWKs4U2Tn5rHLdU3wLl2fTkvPjslTaxFrrFKfNbIOYqCSs3s1fk4LzF+1PI
	 A3KKXxlYkiSYoQ9iUDXDbiwpGwhb2NfUGxhlrnFI+xSUR4vrR1bH3Bhvkc71DiuGhZ
	 btVCNVb3PA0fA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AE4911AC56C0; Tue, 22 Sep 2026 09:41:54 +0100 (BST)
Date: Tue, 22 Sep 2026 10:41:54 +0200
From: Mark Brown <broonie@kernel.org>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the iwlwifi tree
Message-ID: <arI_UjRYxBNDtTni@sirena.co.uk>
Mail-Followup-To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1iXAAKmhaGbQ85pi"
Content-Disposition: inline


--1iXAAKmhaGbQ85pi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  81550f0ead8c2 ("wifi: cfg80211: preserve hidden-group beacon IE ownership")
  d6846d11123d1 ("wifi: mac80211: keep fallback association elements alive")
  81cbf8f3a3d68 ("wifi: mac80211: shut down RX BA session timer on teardown")

are missing a Signed-off-by from their committers

--1iXAAKmhaGbQ85pi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyP1EACgkQJNaLcl1U
h9CSAwgAgql6U0zb1mgB9F/u8HKb8OWs/w5+OHTefhRJ5LPFCuFCeAH8yPrn7tXy
cF/i+INrPrd9Eq/10XXhQwaaiETDU3dEp0f21I4Ya60YmrFvlaA2yIawjBeuFMKn
IiQYJctbU/yhpQocL/iGNXzS0WUDMgeKsN4jxmOjuRrHYQo6Q+AvRmz9WIHbWXKc
2B5hvq/mjZAnBOPUK7rt5vwBcgKvXZQSJzMBAkHmV7QIGt0QNs8nxSEsL0YHN2xo
jmNwYnW7TmZmSiqpc+dPNc9oz2oih3M9YCSipM3lnh9JsXdZuuTQHTTKUmna7cZB
Qy3XPKLyw5PpUFj+SYw65TmNEeX7Jg==
=E3nb
-----END PGP SIGNATURE-----

--1iXAAKmhaGbQ85pi--
