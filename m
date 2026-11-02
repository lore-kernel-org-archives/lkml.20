Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646907;
	b=cDtUc2arVGZDfWpjcd+kLEEb6ADzX7iz9N5YNSXxxBs1bp4/L74fDcIFIbV1PHA+P9nl
	 tHVjnL7isQlR8/XMN5LXyHsZOM3jYFipr0ZP4oanZu+azGtfe5nGTVaiC0iPxzEzyiEWb
	 J2hQoakopFixRDzts2uttr9TosPjwRKGCIhQpgxkHpekXBsDnh3f/TCOrfcTfwQ4xNPhJ
	 JNeP8ZrOwESL3mI1egoVoA5+JNu1Chdo7r3yOpq9knyVFj3KUKbmFQlmAgrfxJZaZUjas
	 3qCBEW99cIe16D6eHswTmCUMbXW5offpozua9rts8oyn+uNeQSS5n0kI7fiv24QDbOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646907;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ub7b5kzLvl9OAeW8ozCd6H/592RWGbAqWfLNRh//2/A=;
	b=OhttVhXQpbgM//HJ/WUyQgfhHShsKBFiL65T/KF+7VT5wTwYrpwFRQ3fdANumvn/WuGr
	 H/ryb0h14iy+l04qVHGCzwJ5i4rn8o7NhrvTWc6WutLkl3F5w0WHHzusSCH9SezjCMvYS
	 TOhdSBXuzuObtiaeukJLpIBHwmtPSnOEINrx8812H9k24NOdXR7YkNZ/X/4vUs6ihByiC
	 JBCNqUETJkkMQKq8HntS6VVd2tO/e6sXZXE8TltkqqlB9foLUn/XzRQkq3pxl6AaUln1P
	 YnrKDMDhB3t7gt0ryv+IwheW198Hg1W3d+otB0P8LmtMKE6irytsiikQJCISu0uovBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hth+rPdM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36492606A33B;
	Mon,  2 Nov 2026 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hth+rPdM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132871F00A16;
	Mon,  2 Nov 2026 19:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646906;
	bh=Ub7b5kzLvl9OAeW8ozCd6H/592RWGbAqWfLNRh//2/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hth+rPdMehrl9EA1niQuNJaYSiG8QK4UJG4rx8w5Ztdq3W+R1L/UaI6/zUUkZCN7K
	 xDyiXsp4wlh0FJCJDcFHwZcofoZr4pjikuBS2SlOck6aQiKqdbcDOc9EbVT/oeE8G0
	 9SJlMrKd3rpvhnrldz1cIOWF6WmQ9z9mKwbt7Ge9PitOwZLM44JstbN2OfxP03NCyJ
	 HA8EV2ZhDX+d7Sp2/aIYeLSy1ZDmsglmKsl6wJtM839v9kvTMwIesqkqeWDNnOD50Z
	 clF9ZfT7ekH6mdC2DlAz099ceeGe12OL0RSdfav0IQJ+Sk5NRtGVo5NJDqW6i6Kvzl
	 qrK7BS0wJSM3g==
Date: Mon, 2 Nov 2026 19:15:02 +0000
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
Subject: Re: [PATCH 3/8] dt-bindings: timer: sifive,clint: add OpenHW Group
 CVA6 APU
Message-ID: <20261102-coagulant-unplanned-f98c31a5a309@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-4-marouene.boubakri@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="ck1ZkQepgggIYSGA"
Content-Disposition: inline
In-Reply-To: <20261102141727.640769-4-marouene.boubakri@oss.nxp.com>

--ck1ZkQepgggIYSGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ck1ZkQepgggIYSGA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujhNgAKCRB4tDGHoIJi
0vnqAP49VXjGm7Y82Jh8vMDSzllX63VvhJSZatC/j3MzWdJm0gEA40JIqOL0/nky
JeL86xTzQidzloCS9D260V0s7U2YHgg=
=Ze0C
-----END PGP SIGNATURE-----

--ck1ZkQepgggIYSGA--
