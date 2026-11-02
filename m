Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647118;
	b=rNm8aly9+o3HJMLhCvgM9kDzXXn4Gll3pfouUAwem/iFRwFrUxDuaJwRxSoXkpO4pVpu
	 aILWEH+3vR1PbuLEEYxINoMYN55bliYtKNJENJdb2BhH2r5PWbxwFBy4qkkdLTkRyMEM7
	 TFiZRFOf1x7Zyu3wYHBASQDVxKnuPLdZHohYza2fVlrCQigH4CSy2fZt3mBZfYHEE9CHW
	 ael/K4hABe6KK3pFw5g6+yJrY+df8Y80HdQYP4u62VaRo3nG1s83TiUVjeRf+FF0ybqJz
	 YNMwO6kVnNvKAhVzKO3ErnTpHpjAngBTX0y5dc/DI8yTlV9YGLeBwYiyOE2Z+mIx/Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647118;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WFJM7Bezg8OF7GxEtGbM8u9hxpi3HX/5YjbCfaLYPUM=;
	b=gHRhKUGaV4BrrJI7oVRIAXQMG9R7Xjgi2YswdoPodEDxKJ6P77x4O+u5/r1mSK2x6m66
	 bpHd4yoncR6lH26Iks/7zcMDCqLqPEjKs30SUsFbvOlAzLA9ZY5uxvzN2vGZ0zcnaZPdq
	 VKDyWSWKCWSfW9gxZ3l4WWnGC2GLPdkcaBBhojUn465rDRAVsdBQrm0mfdo27mNaS6IMI
	 /0uY7adusVyGti0TGFot47N2+V3z06g+JFl3Jr9cNvQFV37W6ame1t3z/8/Ia1n9UZm/8
	 p0zcDwVDWTekwh3X4ugM25quk8LiZq0IifqYd4DLgQzTMnTAvvYlZaqAJ5o8T+o/plA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuxwWPkM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937CA606A324;
	Mon,  2 Nov 2026 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SuxwWPkM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773761F00A16;
	Mon,  2 Nov 2026 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647118;
	bh=WFJM7Bezg8OF7GxEtGbM8u9hxpi3HX/5YjbCfaLYPUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SuxwWPkM5EUmuq9/N3/8AyNZuMM1hhNrapR0quEl59l2K8ykPQSkgJCyfRtnQ3duE
	 1O5b8jrSAJlnKPMJMV+hGSNjvJ1YZ1b7UOjbDrtpDGJeoNldrckyIkxpbevE6RVvXz
	 dN9KwlnlTqOOUoAOjR1nssKbQSRdc7gkFOi0jvGOpQF9L90LJT4iBnWhtaFiMXU179
	 ZG83Jgk70NgOZOWGdKz3VAJdXo8w/kym2H7VJVMrq3EoIDFD8sz7Fw6+/4Qk+J+E3A
	 cNRN293lW8ZZ5UIcfpRxUEt1QBR4np8MyZ3hGqIMv99akXb89GGq+oFA8XDlsue0qg
	 evyoKKjvQYsrg==
Date: Mon, 2 Nov 2026 19:18:33 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: interrupt-controller: sifive,plic: add
 OpenHW Group CVA6 APU
Message-ID: <20261102-camisole-spotty-ab44d620ca87@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-5-marouene.boubakri@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="foRJlODssOE16KBF"
Content-Disposition: inline
In-Reply-To: <20261102141727.640769-5-marouene.boubakri@oss.nxp.com>

--foRJlODssOE16KBF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--foRJlODssOE16KBF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujiCQAKCRB4tDGHoIJi
0m0JAP9ssPe1+vgE7h0PM+HcbZEpi4oY0JfxJDRlg9kMd5sQCgEA7Yn6718Xw3Ap
ixUcG4e1O8Nw53l0n5swatGg4QxDzwQ=
=KOL/
-----END PGP SIGNATURE-----

--foRJlODssOE16KBF--
