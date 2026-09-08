Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461E4F0538;
	Tue,  8 Sep 2026 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889086; cv=none; b=STJaTBU90q3C2wLyPx3CmTUGkDCPqIRxS/38m3Rt81GHg6anHHexIT+8bL9UaKBPC2y6iZCjHfP19ceJODX0nLTl4YiW1m2Dd4ZBkEeZFGYcD7/J4lgywr8LRWpjk9O/7LE8P+FYFIFvHfGJWIeKDeY6N2HTKMnPzLTeUSJ/KGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889086; c=relaxed/simple;
	bh=5OSF8OpLe53rcAeoaJaYe4ad8o0J6Caass++HtpXOLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrgLhR+/PBXzQCaLDyElRz/3rOB0FVVmEkmgDxoiL2avbvnPi0lPyBzA31tOFok0oA6tZ0bhrGbPaHZHMdRlz8ndj6DAse4kabqpM5PHQ2ASeLDZuR7KxmpkYj4u/Ae8eddPWZuO6txfkZT8GmT5u8thky6FwPAimL6oS4WxzzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtIE0sTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtIE0sTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957711F00A3A;
	Tue,  8 Sep 2026 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889085;
	bh=5OSF8OpLe53rcAeoaJaYe4ad8o0J6Caass++HtpXOLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jtIE0sTT1coPloJ9LxLMWL5CN1lftZc5h6nVlPSm9xffJJERWVqa/7K99o/QtaGS9
	 YOiatZfAw8B6zogweOsq+QvP4q/jteblf00Rglc+5nsUUl4Ybm2h0V5TedWR3GGNHh
	 IeCWvjw3MftJUr6BFs37FDjFln2XjSdTKPB1u4risrgND8q4oOS/ZXBzoavdd1P+QE
	 OnJAe4q09IXq3Z2RgmUwYTuTSLe85T7qUsmU6CvpZjt9I65CiToobxxaHURDS+y7HV
	 d2GJ1LqsMRkt9Gb1Bne2C50qt4za8mDD2ztp605s0xxml8UE0uF3J2h7w5ahjoUoI+
	 DdoAgR/ibFXyw==
Date: Tue, 8 Sep 2026 18:37:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-mswi: Add SpacemiT K3
Message-ID: <20260908-pacifist-fasting-441391d1da02@spud>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
 <20260909-k3-aclint-v2-2-7931e5bc86ad@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+IC9M6TKls+gJoKb"
Content-Disposition: inline
In-Reply-To: <20260909-k3-aclint-v2-2-7931e5bc86ad@pigmoral.tech>

--+IC9M6TKls+gJoKb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+IC9M6TKls+gJoKb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBH9wAKCRB4tDGHoIJi
0scKAQCeP6smL6SZJH1DKuxzB28cxYUgVBWkZAmP+aL9ZQXLFAEA77aaIRW1pK/K
1fN4Xt2mAIYBanL/UtvGXOVyIxwqtA8=
=UyDT
-----END PGP SIGNATURE-----

--+IC9M6TKls+gJoKb--
