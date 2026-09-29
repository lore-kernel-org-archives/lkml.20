Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984954E13EA;
	Tue, 29 Sep 2026 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790716732; cv=none; b=UYOf1bEZwnRW6xYvBOvM77wZVhQmu8WW3hY1ZOxK3/xNlvmc6lTvD6HdSOvtmzJShpOtbwVZuEZ/OTgHiUVWS78msBTelmAaJLFu5ygjBQZMSWAxqeaaloVJ9mWbqCL848/J1xiABElviJfQJav7RfnA0gXMoFole+iJVvOYbUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790716732; c=relaxed/simple;
	bh=R3DsJXmEMaxFIS4azVxkrADIqK6gRKvKuUBojmJy3LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUoZxVKyPfsZ3Cc/4WaF7YKy5U7q9eoU5m74a27ZPX2zc9nT6uGv7IE/ea5ZT9lGDzKcqR6CKJBfNoD8hAbgw/7LBOzVvxtj7duwlCTZA3yb8SmQLbS4i77CXGYVXKMdvty91Y6tCwZat2etn9d79+ejAVN9WwBeq9FT5h3HIEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQ/nWjJR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQ/nWjJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1BF1F000FF;
	Tue, 29 Sep 2026 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790716731;
	bh=XMXQ1yhGVRtRV7agPkwIHAZz6Vb7FUrIfkgGRZ9x7CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQ/nWjJRH6zUA6rbaah+Gv2NZIw9HdRhtsiz4czP4qb8b6t8CU7f+M8xhdwzbhZtH
	 NRbBTV4bteYvIFhfoJoRZg8BQBiLuOAICw5eNSYXi0DgVR9tmOFz8N/Qeugsrl86w1
	 QFz0PbKY4S7eVkILpcrPQd0CK2+KZnjW9yXrl0GZnLIyrTK+hJduv5c1qhop0rGblb
	 sBMw+sjMuVeCniN11fWTDxjOnf0KUELNwY1fIvDvcFotIR3thbNJmQQel0F7DZ9bYy
	 Web3ZdHAqpVf1yPw1YtTiq9gAjCyvKHa0IqA+Dz67561mRRh9L07AoUacYBgIAXOHk
	 gxnwuQ8ooSD0A==
Date: Tue, 29 Sep 2026 22:18:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Odell <loganodell@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <e1f9991e-3460-40f3-a551-3bbd74abc043@sirena.org.uk>
References: <6c7088c6-28dd-4e5b-bcb0-0d951183b884@sirena.org.uk>
 <20260929160712.GA2327182@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zefBooLEG3t+1vhR"
Content-Disposition: inline
In-Reply-To: <20260929160712.GA2327182@bhelgaas>
X-Cookie: 1 bulls, 3 cows.


--zefBooLEG3t+1vhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 11:07:12AM -0500, Bjorn Helgaas wrote:
> On Mon, Sep 28, 2026 at 03:13:13PM +0100, Mark Brown wrote:

> > > Caused by commit

> > >    8a2a9fa37b814 (PCI/IOV: Read VF config values that need not match PF)

> > > I have reverted that commit for today.

> > This issue is still present today.

> Sorry, it should be fixed in the current pci/next
> (81bebadfa0f7 ("Merge branch 'pci/misc'"))

Yes, it was gone today.

--zefBooLEG3t+1vhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8KzYACgkQJNaLcl1U
h9Cf/Qf/V9lCMoioXe9nPyv207/P+bJ3rmMZU3COGFV/7kLDbFxeAoJirtWXusfj
B/rfGvmgpTiEGtdR/lxW56gzvLTzEtbuxbz4G3YB0gdpIghtZ5E76hE3l7kRuY3h
52xGSU1EhdeVScRdbGjtTrkA2cd1Z1jFSZsFFj9/4WCThYeRTN3B32WMyjOPW7VD
gv6Yo0KVzONNM3GwVz07UV0E7plzIQsdOqhasE/Ooff1nJ+Gk+zwQadcvseP/lWQ
sFfobu4IBMD+N4GXbxmjTXf9t26t4vH0TS889p/LoaQNL1Kg4EZZdK2kVrEmK088
O/hAfquv5I/um9OkGCNFYSt0hRPuCw==
=xp4U
-----END PGP SIGNATURE-----

--zefBooLEG3t+1vhR--
