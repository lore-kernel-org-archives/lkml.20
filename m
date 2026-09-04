Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB4492183;
	Fri,  4 Sep 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537306; cv=none; b=ep6mcHZI5tdGekMPYD9GfyMVdIEtDUp0EbN0tQO6hUr/tfJCm9hWOaHK+jt77F4MTLSLaR8EBFiUlfSPbP0Ab1uJ0plySkdNZ59xrM+NFh6n6DMfmDXe0sQAtiet3J5JjW/iKXNn6OsA22toqE3e0TzH/4hlOk/WHSvLb/aCdS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537306; c=relaxed/simple;
	bh=HodFTFJx3Ii12wUAUzSwSKqJILjnrJP4wbnpWP4ALo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzq2/W+adu06+h8bfRlGXqUbNR9TY/lGcf4PMm5ab4oxcNrYAghOB+ySRA9K5msTzsLzVspJzehZR547x6VLXLbCD8bktULgx6iX32WC3zu60uxCSM75L4UY7QdAyqUqDN1COnsU7vqZMyyT8cJbXe5HXoslj92Sg93wLum51tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8zNOVPi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8zNOVPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D6E1F00A3D;
	Fri,  4 Sep 2026 15:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537303;
	bh=HodFTFJx3Ii12wUAUzSwSKqJILjnrJP4wbnpWP4ALo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E8zNOVPivW+j3+9CLz05cqZe958f1ndVln1uxycJdI6WgIJj47+qbvJh/WR75iUh5
	 TUWTBF6aTUeM8cKLnkTHV4oASxGwtkSWytULyWQMj5b4yDrhX9Lr1aAH8PUgP8rr3i
	 a5ZioE9ZQ8IJqY3IuJfG+0BUYEfv+TbuRnKWQhuv4p2iD2trnA0VW2KkoR+YN2gmZV
	 2aOOKK52zbPjrzUtgQae667XzFTByJL9RbCuBHllinAPRs4/5G5JMgET9NaPOUNREQ
	 j0KF2IYxOntnU4XRMAQB6DA6K2pIFIjHy3NgZyBQ5QAV8yIaeZkRzno1cxwsRsj1nM
	 WAeqrb1zFYe2A==
Date: Fri, 4 Sep 2026 16:55:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Message-ID: <20260904-collar-hamper-a743fdc4322c@spud>
References: <20260831-add-external-mux-enable-gpio-v2-0-f6027a4afe61@vaisala.com>
 <20260831-add-external-mux-enable-gpio-v2-1-f6027a4afe61@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5MyF9xd2z+WQS8en"
Content-Disposition: inline
In-Reply-To: <20260831-add-external-mux-enable-gpio-v2-1-f6027a4afe61@vaisala.com>

--5MyF9xd2z+WQS8en
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--5MyF9xd2z+WQS8en
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprp0wAKCRB4tDGHoIJi
0oMtAQDVIIzfxa1YvQlavpk7ILt/ngzGo9V06/5fTzdWDQgMewD/RgLShsgf3d+M
h/wa4k4WQQgbRBY5IX+4YV2BA0NRWA0=
=Qerk
-----END PGP SIGNATURE-----

--5MyF9xd2z+WQS8en--
