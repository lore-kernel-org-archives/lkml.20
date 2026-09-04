Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31093A380F;
	Fri,  4 Sep 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788532882; cv=none; b=u8VfDRb1wDCtFMhz8YtcI/TtJuWSONlk5Dv+QjSlMXyyqvI8gY0wU83o48w2DfNmrBqa4a/478Y0QmddQzNyYHRDgW84/rCimwZPQYW9w/WZ1LxKlWD8e8JZmC/RElnQzbM2Tui40bAgzcGf2nVQia02E92aXWKc2lXQ8SkTJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788532882; c=relaxed/simple;
	bh=PrVgSoQf54ceYqtKdirDNT+8OHG8gzFBR3WMgKGAYm0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=W4irZcuZE8laPv71aqy6GrYQzJYYK3IVTPiTlS/yQsvL1etnL+8RL1sbC9z7dtPCAkAtj4xxFQvg4RowIeJR3Ue6w4LyigvvsvbaoCart17cKg4Pmx3pgT/zRxTkwFDZivkFyKbmUFVcmTQQJVQCPGTDljY4XriUBRRlXTWECBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1b6FrNC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1b6FrNC"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2421C1F00AC4;
	Fri,  4 Sep 2026 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532881;
	bh=zD53N/EHIMHVfbT4JxU4Fm2WFQ5MT2sTqDAA/y2RbGo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=A1b6FrNCmOwhDgGHd60VJn3LXE8NDiHJx3sKln5y/Mxa9wzOpGlFbs1EdpqkqnyXr
	 ohuK/Tr8D/Hb3fu+JYcC8TSvg0ogbKQPm8hGmMKnVN8VAd1dqbY5V8fPDVgUGIJxO6
	 tgADXu4KDoKW/Z9nZPs2uO0aLtOcKdGdkhos0p0vz4BFagEnFbpmRiJUJX5CMCwBeC
	 NbaTjhdGKgvq80cOr+DmV87XbhSmodh2V+Pc+5LBXpigECJXqnB08iPCgsSP/Jxnht
	 VsCUN/p1ZKlTB2JvaYnKoqdHUHhjFtywP7Mz3fZLR4KgYT9YxkLO8fYdUwTl8shVA6
	 /Khs0R/n7phqg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 04 Sep 2026 16:41:17 +0200
Message-Id: <DL6LZOVDBDTD.DQNNUKIU3P3H@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: add am62p/j722s GPU node
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>, <a-christidis@ti.com>, "Nishanth Menon"
 <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
 <33c6717c-5c24-488f-bd85-d0cfaacaf13e@ti.com>
In-Reply-To: <33c6717c-5c24-488f-bd85-d0cfaacaf13e@ti.com>

--b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Sep 4, 2026 at 4:27 PM CEST, Udit Kumar wrote:
>> +	gpu: gpu@fd80000 {
>> +		compatible =3D "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
>> +		reg =3D <0x00 0x0fd80000 0x00 0x80000>;
>> +		clocks =3D <&k3_clks 237 3>;
>> +		clock-names =3D "core";
>> +		interrupts =3D <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
>> +		power-domains =3D <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
>> +				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
>> +		power-domain-names =3D "a", "b";
>> +	};
>
> Could you check once, if you don't need some assigned-clock-freq.
> and good with default freq ?

See
https://lore.kernel.org/all/20250915143440.2362812-1-mwalle@kernel.org/

-michael

--b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaprYjRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/imSQGA+0EFfXnMF0x7rvtUX9YBU/EEhH0bwrMu
DfS8Rwit1ki0p8KXhKtXF5EegntAkmO+AYD4L6fgH/DnvaFbB/AlzWpSEmkvg8Hn
S9J6JBHSnk6w0NGja4zHFhSoiYknmfaCixg=
=5d+V
-----END PGP SIGNATURE-----

--b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38--
