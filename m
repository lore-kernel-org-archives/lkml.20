Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742225;
	b=J+wxsF4kTzM69513K9pXHkHnKiADPchCLkBluuoJthuUf2iSdD6Jk/xQIYbxihBxTfcA
	 beEfqCbDSRCBUPOBESkgWxczt9wanpp2mqvZoBVEsIjI/NBrFgU2qUsUGAiDhR4UKqqAp
	 o+FrZbCiFvQ/NPVjMfIax6LeWYE+yGmRCfpGRxA5f6TfW+8NSJBSArIwxGk9oMLZ2AcC3
	 JHs8dIyiAeqU+IpdzqeGTvMbzitVzrTPHZOG3y6aTh/aVnT1hRcu0CgE4j1b4yAgZZtqD
	 l/vFNAOY9AZlDpwAkmhXtoSlMqkNzrFbFAW/Lwsc1c0Hnlc8/WKt3V+EB1UeGSlV28Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742225;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YXzymi9E16naCnR8b95KHFKlep9Gz7Uplr2TOO0CwXA=;
	b=FBDNGXZra7mk6VJNbyvbi9DyEy1bVHKHTJkB7TzYJnSWBL4HbH9Uoepuyv+EwQy/lZUq
	 5zP9+DnQkqDYHWhrk8Ad8BNCiyuXfAFbQg1IZYwjBd6DlPpjlN8fY805J9luRKdUIhJH8
	 R0uPcZHwnBOzzIa7GyBzEhwmBteABLGILSvMbbBYbliotZmFK86WjTqdaH1DQTyIce6fM
	 0d0ydkEEBwTxSPPL0+MNLoL/vDugeufrsRrMAwA5UpOm2mPBzhdEfYj6xno8XxLEpFhqR
	 gWebuuz1UC38Wf05QfeS/13JWdv38EwbJpOuOHggFIKsm0U+NqzaBX6sHmI550RPPbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6kvvwzI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B9606EEB0;
	Tue,  3 Nov 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6kvvwzI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863B91F000C1;
	Tue,  3 Nov 2026 21:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742225;
	bh=YXzymi9E16naCnR8b95KHFKlep9Gz7Uplr2TOO0CwXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G6kvvwzIlksb22bEiO4mqKt3bvgQtXhR/3kiO94mO5qRcVrIVipuIRbkPrEG0H146
	 XTXaKbECySQVpmcEXF+Uagv8VxpwhHDGiPsfgB44+CIHj2Y/iruYQtIS93XFvvPzcS
	 oLz5EzEQDAX1QuACOPlj9nh/PAqxc8CKkWH2aYlEidM23IJQGg0r5kF+0phXqXj8Th
	 UA0f1d3FCmHI/Po2RXqSaAkd6HZkePr+eFIrJn8D8DbajFaVaOW5HJWrvA3fvNcCgg
	 MutnZAMz+j6yPTDdPDwFnpwxossfIvM6Wjq4ygxhoNy2MxrHOMVSjdCQNVdIPM3BpJ
	 1NpC+QbdfejSQ==
Date: Tue, 3 Nov 2026 21:43:39 +0000
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: riscv: Add MIPS Boston board
 compatible
Message-ID: <20261103-dioxide-delegator-9188c92d0841@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-3-3ac5d49f2c37@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="QBEjC0eKNNNL7ngn"
Content-Disposition: inline
In-Reply-To: <20261103-p8700-dts-v2-3-3ac5d49f2c37@htecgroup.com>

--QBEjC0eKNNNL7ngn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QBEjC0eKNNNL7ngn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupViwAKCRB4tDGHoIJi
0spOAP454JgnRDdTYXV7MJdbV6AspmZZAFYLDI0KhHvjOpOL6wEAh2oex+nkFn9I
AMQXlIpoDADhC31vf8DP8/MPAHwvhAo=
=Kc/M
-----END PGP SIGNATURE-----

--QBEjC0eKNNNL7ngn--
