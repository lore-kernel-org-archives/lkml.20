Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F1647DD74;
	Mon,  5 Oct 2026 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198224; cv=none; b=CCx3slj4hHQgi0OMN9QEC7f7i3om/G2527EGJtyPOCJNlOHQ/RuegHhCDDoe3kkO3JxKc8E2SfCefu6ixuOVm2XIFISyQ/vHxEKEwS1ZduPhu4mdD/RRStv4Fp8/qJ8MMzp0RiliEc6PaXlpXsgLjQGJq8ph9hJCiExDsJmWWPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198224; c=relaxed/simple;
	bh=tfch/Ra3oaVjKGDMeWzTIhlgb86NfBltY4y3kti2FTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPcua6L/oqDHho944XeQIKsrRQ6RwAUVYqYpcN3XS/IABXlP1O5METMOwcbuMzhNXrm1qyFIsLLBPr8NHACYHiYy4/S1mRzHQ2x9T8SNlVz4ZYsmq4q8e3QqBzCwqWxQAN7a05EZfxSGOgoFKDC7mTzyfrmCFUZ+t4zEzLs6sok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQ0hHroT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQ0hHroT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6CE1F000FF;
	Mon,  5 Oct 2026 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791198222;
	bh=tfch/Ra3oaVjKGDMeWzTIhlgb86NfBltY4y3kti2FTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YQ0hHroTzmKNfUGQHk2YpiC/sHKriDnMhQkuFt7BbbqZ3SbKqPJzGI7nNfEQYxKld
	 In0lYimbpjT5IrzQakzQh6E2CQn5gz1Sz7Kd+DVLyB8qP+6+zd7sHNKWugcJPpZrBj
	 GMwEUyhNNt0WB31YZa/oin6ztlUI+wS+wswGvRSgxvA1U3qbaaADCIXaMMCvfWXXs3
	 0RpABu7p+AgVi5AXqdfRyGN9Tccmd3rSavm/RunNaZeXGcRxmpJCu2f6n+HN9mii4g
	 tu7suHQcdES/IgEvW2gnwe/M0gyAm/3nRt7HT+QKjtSTTisM4P9ONa5pM5T2w2X4ad
	 Sqxvc5aYEZfTQ==
Date: Mon, 5 Oct 2026 12:03:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Hermes.wu@ite.com.tw
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: ite,it6625: fix I2C address in
 example
Message-ID: <asOECtBkmgk_EXZ0@squawk>
References: <20261005-upstream-it6625-dt-example-i2c-addr-v1-1-11ff60e2293f@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+UnTffVH1SWJqXZB"
Content-Disposition: inline
In-Reply-To: <20261005-upstream-it6625-dt-example-i2c-addr-v1-1-11ff60e2293f@ite.com.tw>

--+UnTffVH1SWJqXZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+UnTffVH1SWJqXZB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasOECgAKCRB4tDGHoIJi
0tm/AQD+BJ/bsvUloMgoNErfay9IDSoSwOboOsbV9uPBLTc09gD/WWZg+I67Uu6Z
/YUnYuk7+dmQMx6qJQ2Y+/qJKDg9VAI=
=bNl7
-----END PGP SIGNATURE-----

--+UnTffVH1SWJqXZB--
