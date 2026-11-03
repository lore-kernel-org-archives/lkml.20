Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742445;
	b=0VPKeR/HDxA7HOtr5M58mSAN6Sc50ZJ4KjDjTEhAeNs3OR8NEMqE+3mrdrwpRHRz/Vu4
	 C2mj0FWKENEB3btJ3LI6VOJeYoHIDzwA/A8Z4NWpCZ/ETVD8Htf6nokQeEG84B+59cxy3
	 jWGnAhgxyVtxAmjxwE/cPKQcXZssoLeHDB52GDr/R9iYXHdgFIA6HmzBSuYt7NvGB14aM
	 pyztkYsOGNPYyg6uVLQBlkVcwE4d4I4/6tnjbzh9kXgUIc8AZePANaHqm3DZbRMF2Qwcn
	 723116UeiLkHBIu7lyjIGRYKA/b+4yI0bsag+UMTA3oXz5g3zndtarJN11a5EYC71Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742445;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VXYJTEbkCcS8JY3kdIlS7QjgGSrvZ1I4sev2LE7rAIk=;
	b=rElGaSA7jI6s+12dw91j6O703NO4a3o2NGKKzpYDEo+3G7cmoH9SRx8SLoSdOkCtR23b
	 KLrXw8KYxw613HFx0+h3GyY8X+1Q1/1XneWPcIS68efWW9+ggI9aPa3l9jbCOzr5SdPts
	 n7zHmfLrPwEolPtqNO5QyCEMHgxN5ne1IZIJPSmOqYcb5Wqtf6Gf6jxZ7LkbLjfRpQ3OP
	 wJNFEp0I5yaWG+YNJYyzcOjQrq8ghtiiwJH7oNd9gkU/SjjeGx7Wnx6W5lg5/Mae1Dh0s
	 sM2hLyr9S0jBAthJoF4tClKZOfImhSlz9fMxLZuPXFhen19FHOXyWlTM6oPSqR4/3HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5fG+dD4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F45606A324;
	Tue,  3 Nov 2026 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5fG+dD4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AA11F000C1;
	Tue,  3 Nov 2026 21:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742445;
	bh=VXYJTEbkCcS8JY3kdIlS7QjgGSrvZ1I4sev2LE7rAIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5fG+dD4dQX8szkRjAKbncD/EdF4Ot8EbhNn9gYxvI/5/rdEucqktxKD4QFfssbHn
	 ojqc6v9mDrECqeHOJWHhhgneaJZKlwXJubSM9/SmE5m3ridTQMiT5TLzMrCJdBJxFT
	 neqdcdHaen2jRN8e+pO4g4Iwf+M2mi4jo4jWTGhOrvarK4Wub+Mz07jkHS0WonPXMY
	 xkta30l8w1Dw2jdJBpMfS1jy6ch5B6s9esTNfKIutlztC3U8JBklxAP8bmHYfYjLob
	 S0kFgUrF6Ruvd2APt79uOiEcUUgjCqT60n+fkd/xtCxPNFEfmej4HkElyTZtIIACLf
	 JFHURGafjqU+A==
Date: Tue, 3 Nov 2026 21:47:19 +0000
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
Subject: Re: [PATCH v2 8/8] riscv: defconfig: Enable GF SoCs
Message-ID: <20261103-relax-generous-641baaf8d606@spud>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
 <20261103-p8700-dts-v2-8-3ac5d49f2c37@htecgroup.com>
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
	protocol="application/pgp-signature"; boundary="icZwj7cyj7n5tvNn"
Content-Disposition: inline
In-Reply-To: <20261103-p8700-dts-v2-8-3ac5d49f2c37@htecgroup.com>

--icZwj7cyj7n5tvNn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--icZwj7cyj7n5tvNn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaupWZwAKCRB4tDGHoIJi
0jrOAP98Oz6hQvtnGxRqEmdtCWLQydi/HZ/hRXa2RL1fVLGqlAEAp/1T6OE911ue
PT2tKUa/uPWdVa+9LAS5tpcDRaTZnwA=
=vS1z
-----END PGP SIGNATURE-----

--icZwj7cyj7n5tvNn--
