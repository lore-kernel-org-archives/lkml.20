Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E94A64C4;
	Wed,  2 Sep 2026 17:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368557; cv=none; b=op1xesbg9Hay38nuQx6IalJPjHbJ28b7Mj2RAn73fIE3HKpAyizUx+KCVAb4LgkOQDHZmiIdwAqzBx9AWBF4dY8Jo8fdy6qvLoC/JytudAlhJsO8sfaKa3K5QkTFLlhHTz/I4FBA1XrxmNxUaZ1Y1YjDrtwMPClNGFrgAQLvIOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368557; c=relaxed/simple;
	bh=dL/38UuzwLETz+Tbm4E2+Pe5guGEVYLfnjolZH8K4Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tntx9FP4F+rpZspvOf56ndM1k2O1v1gytHcI1gBej3nCiU3fKyVyaWVQ3kXiDaDtywegUUT7SGwZ92DalUizR+tB0dE/EqTYYVJW1E3C+I3Ac1WtJC0lLxT21v7dfet6UJK+9u8rv08VBZ5PF0A5GRmwXuwoQYRMY/+88LqP6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaW5qLro; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaW5qLro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159A01F000E9;
	Wed,  2 Sep 2026 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368556;
	bh=r8EuB+xwdBiQ3yRsV0/rIKejmsH9u9MdHF8N5+qFAzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FaW5qLroJgZhCyK0BQQx/WuLJIx2VmI4fpgSiaX0ifyLF1ANFcjmOQPKqwryEEOoC
	 5wfQ9qJaStKFbjSfO4Hh2aGa2TPOzBjS6rXuQOzB+rnm27jQWJYSqWeufKnopDiWmt
	 /zm1tIxvN8QcPLR1gfvwA3lBB9RvnQzN4Ieii7gk+jOnhZgMIpRAVnIF3Z56YAUpvb
	 vJmnDwR6QNNQXn0DrLLkbU33scYJaPedbf96ekQVm6/J0gU6S7J+RRjpKIkl2Q3OEp
	 48njzjuOkZOH7J6WNZFefd8IFI3XZowRfqd6iffHQsuMMkPHl+U6ZqIY94fs3DYOGj
	 m9OgmuvpTvFpw==
Date: Wed, 2 Sep 2026 18:02:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260902-astonish-revolver-8941f0c60e60@spud>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
 <20260901-clapped-fled-2ae6126df5cc@spud>
 <F6BE1957-CB62-4D6A-ACA1-1521A14A3E23@chaosmail.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QsaiTKcPGEfme9KB"
Content-Disposition: inline
In-Reply-To: <F6BE1957-CB62-4D6A-ACA1-1521A14A3E23@chaosmail.tech>

--QsaiTKcPGEfme9KB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 08:24:19PM +0200, Sasha Finkelstein wrote:
>=20
>=20
> > On Sep 1, 2026, at 19:41, Conor Dooley <conor@kernel.org> wrote:
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        enum:
> >> +          - apple,t8122-spmi
> >> +          - apple,t6030-spmi
> >> +          - apple,t6031-spmi
> >> +then:
> >> +  required:
> >> +    - interrupt-controller
> >> +    - "#interrupt-cells"
> >> +    - interrupts
> >=20
> > else: false?
> > Or do the existing devices also support these?
>=20
> Yes, they do, we are just not planning to use that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QsaiTKcPGEfme9KB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphWqAAKCRB4tDGHoIJi
0kYWAQDCaly+eWPzS6GEIOlVd02ekQEv+WMJFDuYSDVpupn9pgEAz5H9mytVUf2y
Guy1zykFRTknUaIwH5FGKrb3QLC7QgQ=
=FNAi
-----END PGP SIGNATURE-----

--QsaiTKcPGEfme9KB--
