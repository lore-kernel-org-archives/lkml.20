Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590FF381E97;
	Mon,  7 Sep 2026 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788802308; cv=none; b=Dt8wIZg5CFNtmFaC4Jcj7jqHYzu5Hn4Nsjv/EAn/qdoMp3rNvduiLFB6oA1WlFCz0QChDmW3w8GDc3RbYrAllt8WLfeTi1rlHRM+pZlWItoKWgtoAOMlCc6zr31ohbY6Ahckn+vCv2uZsIXJqEgy72wInkkEdbnVbZ25qEz8o2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788802308; c=relaxed/simple;
	bh=ApNmqOPKAmvywk6QCgE58hkxGIDGVsi2dDUaD5lB3+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJwvLIblDaMnt0xCZibmNuxcu0oBvJEfecMdFqQ7LQynU1WWgi749TLqQOc2prKlg+itdtTu1BoDT18ptJ1RfCp9TGfSkfvN30RmW0AIhzXUYJhjPduDLpIHvigHYRJemikfjGmelTsdHBkwsOaBw7Lnqx/YE06AA218NhV+mgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+jXklYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+jXklYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD031F00A3A;
	Mon,  7 Sep 2026 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802307;
	bh=ApNmqOPKAmvywk6QCgE58hkxGIDGVsi2dDUaD5lB3+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l+jXklYNmg0wDcCYIEY+6nO83b2frlpb6P7pg6jBe27xHaqDhgwamiVboo5hC2tC+
	 S5vdDg3uIhVVBUKBnVfwbLxtqUuU+TcQ9ZVhdMELiC+4BnY1R3dP1RTuUezxdR3+80
	 1b/xvY/wz9ANHqBPJ5QbgRnBaZaVvD+5GX111T6bx8qYVqb+6G7ufp9pStuDu3EU7u
	 GjIdpnOPqYD8fSfKUehdhi4xIrrODsVEvCDy2y7lBAxt/S8VqwjcDjE1cUlubOXJND
	 YYqjaH4rv6p47VfSNVQUZvZIelfOlUmU4SH8AG9qUvHZiqsCffnelv5z53qwXnzmLg
	 ymswdYzMDgvSg==
Date: Mon, 7 Sep 2026 18:31:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: peter.chen@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org, krzk@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20260907-bullhorn-charred-125d3920e51b@spud>
References: <20260906032431.470744-1-hongliang.yang@cixtech.com>
 <20260906032431.470744-2-hongliang.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KgkeIoGAnZ4PK4Ao"
Content-Disposition: inline
In-Reply-To: <20260906032431.470744-2-hongliang.yang@cixtech.com>

--KgkeIoGAnZ4PK4Ao
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KgkeIoGAnZ4PK4Ao
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap70/gAKCRB4tDGHoIJi
0tcpAPsFjtkQsLkO0xQoaMnH9KnvF5DZqy2ksAPdjmNcv8D8hAEA1Tok2QAAimrH
dmO9g5jvHqsDBlo/TUjtf9/4XM54DAI=
=pknf
-----END PGP SIGNATURE-----

--KgkeIoGAnZ4PK4Ao--
