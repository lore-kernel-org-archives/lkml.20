Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920936;
	b=jO1dT1S3hEaVWOaM5aQ1qVzXUC+pbXZptwCAC2rOY+SOeUsfQaZod2QL6EjVuj2tngD1
	 vJwWCtpBR7oBFfB1G1CLTsxWzHSNTTxlmFgycnTC80nMFUdr4L4jWAkzh8c/G5jNXjmYE
	 FBCnHwldluAmUlD0HOh9KYsbJhPXUNMaAHuR92+hB65rOwsRLL1AkvbUUNpXJWuc4dzCz
	 nH0FsnH4X4/TS6driPl3Vvr35bjrFP2JMZGmBN4DWB3BcS/0ldzwmJV5iu2KjOzoF/4i6
	 0vbP2w7+clmLJS7T9P38apYj2WmCwu2XmTnvSzN8S52Mn6I1lt4TP2I0GFL3x5n47BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920936;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2iFjUgAKS1DIXwm/dV+jDKyu7+bpHqIZgkCg+6u2Hy4=;
	b=F849N+J/oTUXguyN1YPb3mV7ZgvZWoc41N00R1BZuh6VwLz8gsb/CTXY+/xoJ0jpR1+y
	 smdtg+/qi3xILGiT7YYVHW09tFoqi71gCPFFM2tJpoBvvwSnNobmckTCi0pwxQ4chnBhb
	 U7/V02LsV8NmZVInuzP+UFUzb+3SyZSB5o3RvIxHKxiEXKxzil9vcBelIlz2vj5DGhnYe
	 8fgH/2yDOzJa0fNawdeqwUwmdktQnxdfCKA3ujntpV+d7ksCaAuje8EwF6N/qzP/yzjDG
	 KzviO2InQHBLmN9Wlomr5jlMFZAa1pr3Ostx9RDCVkYLe65X1HSnNWkyLw+lgNBYezQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=czKroEIs;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7AE606A895
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD7AE606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=czKroEIs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2iFj
	UgAKS1DIXwm/dV+jDKyu7+bpHqIZgkCg+6u2Hy4=; b=czKroEIs0gMYCrKxLNfQ
	ncUPc5yBXm9OArl7EYy4PaEIzA/eC3KHnVm7Hl8nYM1J0udT7KaFFxYoWpEkmalC
	w2sVWVl7KeuYXNH/I7O9yAyjFxH9NNdNZofKiI1Hj1bUPFSY00EuZDcF8g5Hw2bf
	zHptczColY2vdiLwuH+KvV+qCWVmcVh8HNhpTrLzNSQ4mCFIbGGCPhFKbQrfuA+T
	gOHPTDuo0W4/R14b+2rWc3kW+HWksh83QkLftO78hm9t+yFPFT1H36C5PHAMOh3a
	EJRD8FjZF7f2k9OqUoZ+SD/Fm+iHWCXC+vRPg8AP0o3RH2KUh2qmco5Al8/zB0Ft
	fA==
Received: (qmail 250685 invoked from network); 17 Nov 2026 14:08:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Nov 2026 14:08:53 +0100
X-UD-Smtp-Session: l3s3148p1@GUygmHhgrOoujntI
Date: Tue, 17 Nov 2026 14:08:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Message-ID: <avxR5VZESPLklIuG@ninjato>
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="acFh2L5ANEeBbCxf"
Content-Disposition: inline
In-Reply-To: <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>

--acFh2L5ANEeBbCxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		edac: memory-controller@4000d000 {
> +			compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
> +			reg = <0x4000d000 0x1000>;
> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
> +			clock-names = "ddrc", "pclk";
> +			status = "disabled";
> +		};

On second thought, any reason we don't want this enabled by default?


--acFh2L5ANEeBbCxf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr8UeUACgkQFA3kzBSg
KbYSLQ/9EyAHMw1TDuF8jEoiTYpwgMRQAdB4z53Fy/XTDuGmOyEHen4cEq3DPMe1
ryE2pl8i+4JNBpBqTr4XLWCDZmk/zLyLbuw8dkSfxnDhrWOvvfZrXOgpO2AJF9AP
CA+O8LqmnMoQfSHzzWJGQhKsJUNOI0oOPcUYnVW1cvgPihAwmbPIA0l5dRQvO6st
C0oyr9jvSZAl8Gh80wZ9Q4MNcr47T1bPEnisabXsmpNYXI/KjddJ1RkbZvR6Cf1S
LlTjmqvwQ2Mr+tPtQ89dXwE4f/6Lzj+JSBzwEc9I0cbBpZSEoFCm7jMYX1jHxQ23
/CI4IKbXDTQ7vRdYDV2FXX1jl6kPDA89gA7JHUaka+fioyPzIKZtPeTaOa88aMTb
bvL1DLJ7mrmdC4MZTZgxnqL8TpdMvBOo4RTUpDKWojh/V3unZd4ehx0M+5t1uPAQ
i2S2SD12wx1nfU3aaEhOgF/xbpym5WAx1vDfi8NkikDglvQeHe8QiPpjN7uoyBD1
PJvzAw6IPadjobF/KGPF+BCpjSXQCm+lCHlrDe4La931axuTVTyEfWcjQb/Wfx/Y
5A7cH+6NXDFR2Xf86EMnGmU/jEgbPQYOJYSUNU7PY9nxU+ETAE9D/PeWH96r/vks
OOWwAvir1m5H3CLsNhqMTVvhRo2bMnoJ1kBDZfe6XLmK/mgkgiQ=
=BqAG
-----END PGP SIGNATURE-----

--acFh2L5ANEeBbCxf--
