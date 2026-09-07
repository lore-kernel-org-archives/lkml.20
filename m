Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741EC37C0F8;
	Mon,  7 Sep 2026 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801616; cv=none; b=KaAkUrIrqiUptqPgEBZlwJ1xtfPnpyD2zNfWSJrL5U1mq27jaSl3xEnw2O4FuDuOgZ9KhRgibN8Dxgg4P0X5ByTm1QFqJrEKABIJC5K68fAlW4x5A5jS40BUIc295EMgb/QPPsVPlHdMpoi3RHUNAzqOAkS/sYjRIgXz/F+N7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801616; c=relaxed/simple;
	bh=97+OIOU3FVs5e16jdVP2eQyN+TbIv2ppCbJRSjhQBf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=de34JiWR0ZbIY9BFS/DOhDh1k5Mzqks3hyLdAbWD8VcvEGsbA/GyeC36JRfDwuFWpFEN/Kk65IPTUVyDY8rO54noBqtbdE4Zb5nTJna3adPLHZ6TYvosc5+NhdXH3X0k1es0jGJzAmrusm/taPKwh1IHS6sKjHQxs2RdGn/9BJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUJ5jmuQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUJ5jmuQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4AE1F00A3A;
	Mon,  7 Sep 2026 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801615;
	bh=97+OIOU3FVs5e16jdVP2eQyN+TbIv2ppCbJRSjhQBf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CUJ5jmuQm/wfO9+umLYxJakXxI1ArGbpBbYEih7cYop9zMveg0RDrcjW5SH9fjJ0J
	 nYwaBBa3xuRg0qO/7Tr637jz+Nio9SlFp3QjoOz+JTfdING80kAcTDN5zHBTIx4dbJ
	 pHqWLwdpYQVEvA1s9lklHO4C+T90Ta9tfkEb4kQcX46oH+tdt1ALCpmWp+mx1xcChY
	 kGFs2MnM2evTSmjxj+ozFWD2zjV6dYkm6r09ZAzu4Gd2LXS/uo7WBsqsQ9AbGGd7Hy
	 lSZmHL9KupVjupnaKyXj/u7pHMe9n9aw+puqV+dk6LJHWfluT1HOAT8gv7NrRcR5Id
	 LzVcJj7GUpFUQ==
Date: Mon, 7 Sep 2026 18:20:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: nvme: Add apple,t8132-nvme-ans2
 compatible
Message-ID: <20260907-provoking-peculiar-835c812fd019@spud>
References: <20260906-apple-nvme-t8132-v2-0-ac0328590823@cyberchaos.dev>
 <20260906-apple-nvme-t8132-v2-1-ac0328590823@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KWWMlReF3FRZYBOp"
Content-Disposition: inline
In-Reply-To: <20260906-apple-nvme-t8132-v2-1-ac0328590823@cyberchaos.dev>

--KWWMlReF3FRZYBOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KWWMlReF3FRZYBOp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7ySQAKCRB4tDGHoIJi
0tMiAQCxaFqnJ8/puuY16UC+S1C3igPHNaEUPwH63h8vCXlZwwEArbh0khR951c7
OsyS6qOdcmVhldFbjDikXdJH9bbAmQg=
=Kaxe
-----END PGP SIGNATURE-----

--KWWMlReF3FRZYBOp--
