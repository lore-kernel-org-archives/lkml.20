Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7055304D2;
	Tue, 22 Sep 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066535; cv=none; b=IqbOSePTyDQBrKHXGBtx6phsxP8mQ6L/EEDMN5VGqMbV1/vWskOLuI0caKatlh9nDOwgJUPaPAI9kEKXTiz0E353xit4JNMu8kjgNRF4BNrr0kwNmasa12ZXSAHfMvfasNIak6kH7fp6bt5D3TnxJlGK18VpfMR7+VAVUgYl5w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066535; c=relaxed/simple;
	bh=rKQR4b9SkfQXOUl3MIqwH3LnFtjGIyOs+HXz5t+FODA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5Tf6TF5cw9EvXrTwxJ0fDyHyDQXdY/lguqTVkyTj7TTjJTUVrrALlcY6wZZHD9tp8+eS7C292hu2+ELnzBwHVrr13eHZ8TgvBs9mOTdcPCH82SXg4OUuHTVB5hDOAzQapyN03jQCZJPGRsm1+tYqrf9mRz4z2MMKChAcJLU690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzFaUWXW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzFaUWXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4D71F00893;
	Tue, 22 Sep 2026 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066534;
	bh=J30mVHaqQqwZB367TbuX2Spl4cVhkk5fGEgswt9PPuU=;
	h=Date:From:To:Cc:Subject;
	b=PzFaUWXWRWbJrnfhLxG80g5L7A+VIksyAaWar9xteZG3/pXoK3VqPZ96pbD29ne9R
	 8/E6+tjxYOWldhlH5kbSPNWJArAsTug8KRUIsklBVTm9Zq4cxStvCtEIqNUL3qNVJz
	 gVlvqj0sk8HhBpusjInzWWh7L3LbtkNq8IoU+SVLysmkSOrPotIlFZ5NL/0Nue4Lue
	 /eoUqGFoSG+15NgrL+lLychxc+gmEgSmL9wdVpRM2oK4E7bzp5WPsJgh4zkAZuGC6q
	 21prHPkbuTXi4MvocFaMK7I6Huxl70aCnHIQMt9uKNPfPwIR++FgkCWwrCyxwi89dG
	 C9nBMiVtY3W/w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1241A1AC56BF; Tue, 22 Sep 2026 09:42:12 +0100 (BST)
Date: Tue, 22 Sep 2026 10:42:12 +0200
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nfsd tree
Message-ID: <arI_ZPb7NADzzLZ0@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AZCvO5WRhcfWPowi"
Content-Disposition: inline


--AZCvO5WRhcfWPowi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  a76d52a01792f ("SUNRPC: Do not credit control-record octets to the RPC stream")
  e263b5d674fcf ("SUNRPC: Reject a TLS alert record that is not two octets")

--AZCvO5WRhcfWPowi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyP2MACgkQJNaLcl1U
h9ChIAf/Y5U9rkxX62heygfNIY4hTcQsBsHzoGNq3XaDpUE4a5yNfQrSn1U3raV+
SDlM8iylq9D1TODhLyNN2mmrAMCm3Eg0aRJ2EH6bhnPlEk3/IfUHpLld9c9anlp7
z35j6FcJmKIbLEr2UWA/d8H3ZbUfrRjzjE5dZtbiRXDAx39dQ1SUzTL9Wl0tiZlD
yCShXXmPIK1toz/XK1DRrTKg1clfyRGQKQAWNDEKmzmoYk4DcUS/ydzkPDlqy25I
ABRya6rZFv0doQSgzOxBbFW1hB/JMRvr2w0WZ/vJovSJBpjxuLek5JPhEMNnIdPD
6YlG/NTp0G0HT18iFEbYsB7EAZRQgw==
=TFji
-----END PGP SIGNATURE-----

--AZCvO5WRhcfWPowi--
