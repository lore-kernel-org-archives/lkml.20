Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646888;
	b=QUYbOe3lJ9ByFkdhPtlmeV+qgBtuTQPiawPbgJB5HyyMC0qLf0WzKQ3AxecEfc9Gk+5K
	 aAzOKLOorIaPKdYVw0Sv3nv3f7bONcYo1MbC/oKyNBfahpEE8Zg9OVDb1TnGSuJnbntjj
	 iUMgDRocXaGq7rADfJ2p01RHPwRJveTcs2xBUq5CKYQcNdZj4x9xZWwtxoymUKawDidUQ
	 l/i8giGsDPbRMHyRhuNSdVhlfcyoukHYgOdvOPM6XVw69h/CocFWoqChHRXtK5rog+DEH
	 y5DXg1atnEYXn0ripEtAT8xZZIoOhVQT8ce8jLcgt8JIr2jl1m28ojn/eslOFX9a+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646888;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o4BWY5KFXSmVDgW8Ud3VQ3NPMxuR150U2T11g1AHqeY=;
	b=S6vWxecWH1xWIUbfPf7+QapGdYhkNbd5Vcu84dFSWjoRhvXcY2jC8sm0tfnT+Vmkx5pu
	 5FmvyToelzp5y9IYNPBijuRmyD/RdmFhKkdtoLbgTZiwtA8NWBC4Tx1rAGbXthvEuk7iq
	 Eaenx5F90azfj0rTk4/J2NtfXKFZbOKOGnX9qevSX1+OVsamZbTBm6sZwPqj/YMulHYmm
	 7hnVjYaEFAX3IB8/ab9GAKLH8vlkiskVFnpFPTKNPOEoprhTIdKRBvCQEuhr25xaPKTld
	 TGBQLPUe4DA2MezfJ0O0UUAsoDFaWjOxvJbRt/Smb5gDg1bTRj6p2RF+mEtkF00dFHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0dWhcfO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137D606EE9C;
	Mon,  2 Nov 2026 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0dWhcfO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC84D1F00A21;
	Mon,  2 Nov 2026 19:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646887;
	bh=o4BWY5KFXSmVDgW8Ud3VQ3NPMxuR150U2T11g1AHqeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o0dWhcfOFk8VSHNIrIa5lLkdih2+I/wlIO0Uftyyx3f2x3PD1ob6En+6uDq/YuvGQ
	 S4zFADeddoECtQa/Uo46hhXEgi8CPC+X68kaPDYvGcQAVcR39sUpWVd00s4xih1GT/
	 /jhUowzZy5E6pJ5qhf2WdFKMeHWIqDrXfoJzvOdWGM/TYkWK1CFbwB1Elx6LcF3lEM
	 VP3zufkCtGaRXlUWOHy5oPPmYrKZieWu3EgHPnqaFNPtd/MXnS4BK/GAGfCx1KQsQW
	 No6ZL0oK05rUXFF5K3RIWVjWxzP4/IV0n9UW61h87qQhGB3L7QvUjZa82zsacSuhmt
	 FQZkb4ofkFlGw==
Date: Mon, 2 Nov 2026 19:14:42 +0000
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
Subject: Re: [PATCH 2/8] dt-bindings: riscv: cpus: add OpenHW Group CVA6
 compatibles
Message-ID: <20261102-pretended-helium-c37853df1c99@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-3-marouene.boubakri@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="CY94ol2i4y7nKpGc"
Content-Disposition: inline
In-Reply-To: <20261102141727.640769-3-marouene.boubakri@oss.nxp.com>

--CY94ol2i4y7nKpGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CY94ol2i4y7nKpGc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujhIgAKCRB4tDGHoIJi
0oHlAQCf6tvKBotBDIW30chlWr1UEZQn1nVklLOXwu06Owx/dQD+LtQPLSDH4PWg
wTVTrtzZywGLXjvalIjGSaYm0IQV/QU=
=PjKr
-----END PGP SIGNATURE-----

--CY94ol2i4y7nKpGc--
