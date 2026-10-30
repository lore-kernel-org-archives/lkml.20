Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323921;
	b=IDxI35HtJ/tbl2ZCQzVofLQtGRH0T5jZoFhziNirnd1tGo0RaLcK3sXG62stNF7+Jnro
	 VxXpV3iXrSjllbd77GTeUfWEvFH8I31A/g/oJn3A7imz99Dq8KbH3oVAAj2ibSBAXfOL+
	 IWAMu36BJ0Af3hAXhNPpv/nmy0ObNUUeeTMVFhXEau5KAZvnVoONvUxjsZQEcN5JAPWmN
	 ezbeYHf9WGHgNhZ90x4jnr/mgJEICtdtgQFNlva6t4d72120mZgtmKaWAO3faN2wXbraU
	 QKlwGlHQ/l4wlJ4pcHw+P/LccNpkNS/r/FtmY4NHG+RQMSZ9J5PogNWVP7e28+HshBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323921;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TGhDAr2dwZiPzS/mrS7vv+2diNojd8kC6t6N16uc0O4=;
	b=ut5x/cRRBB1HxvEFxNIfEjXqzRIeRXP9RlD9EEHqO4LP40fcDRZMuj4RhAe+PpcboGFD
	 R4Ivupv+VClNgwhjtH1Im6eSxqVLhgHaN+Zjg5jmbpiy/GWP9imJ/xlUWZTuma6d425kj
	 +7k+3esHaSEPkzUJEBJqyaVPUXb8NqCwvRVhc77MKRnW62YpTs8QG4qN0CH2cMaLFHOfH
	 KbapfVqzquc6Vsd3qcpQZITR+MutCs+VVKRfkSKPjUpjqQCdmSsjEYWMOw7/qGBTNTUxq
	 ymGpHumwR3dgKETBlpQKz1TAnHcbTtHe/J4Cv+vPyJfPqOib9hySTYI2u02XwywD/oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WocAb16/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C0606A31A;
	Fri, 30 Oct 2026 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WocAb16/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740721F000C1;
	Fri, 30 Oct 2026 01:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323920;
	bh=TGhDAr2dwZiPzS/mrS7vv+2diNojd8kC6t6N16uc0O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WocAb16/Jo33fJskuMJawb6P61oVLXyyUMJEfKRHsrU+31PDsWwsdCpE4bC972cU9
	 rFFQ7vZJXaVnArQuvLOUo32ho47lw4xU+TzlABRw4SyRGnpVlcUM1SGiHO7gEtq6E4
	 kkiQ5kmou1t6DcWpP+b7V5j4r1fqyYofq2aK7NsEMjuoO0sEIG71E2/jV9LOo3LYR5
	 Me/5DQDb/CVXntf65i25k7phsRslVE8UZdFlBMImOFD7RxVl/FGm735Aacy3mWejNm
	 n2kiJbuZcyORy53YGml0MX6KCpfo0pqPJglWLaN5pN/bdkkUKHp6Zfb7CEh6+/Iesz
	 jM7mdtpFBo7ig==
Date: Thu, 29 Oct 2026 18:31:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <Kanak.Shilledar@axis.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"guoren@kernel.org" <guoren@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"wefu@redhat.com" <wefu@redhat.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] riscv: dts: thead: Cleanup with dt-check-style
Message-ID: <auPzj_N44iXtrR_3@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <55208f641473e0714e4509fd5d071343b3a0de98.camel@axis.com>
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
	protocol="application/pgp-signature"; boundary="ZrT0CggEIZoz5/F0"
Content-Disposition: inline
In-Reply-To: <55208f641473e0714e4509fd5d071343b3a0de98.camel@axis.com>


--ZrT0CggEIZoz5/F0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 01:02:22PM +0000, Kanak Shilledar wrote:
> On Fri, 2026-10-02 at 15:43 +0200, Kanak Shilledar wrote:
> > Fix almost all warnings thrown by dt-check-style after krzk's updates
> > to the tool [1] when run under the strict mode. There are still a few
> > warnings remaining which are documented in the relevant commit
> > message.
> > By doing this the files become easier to read and maintain.
> >=20
> > After this patch series only the following warnings are thrown:
> >=20
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:221: [child-name-
> > order] child node 'oscillator' out of name order
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:227: [child-name-
> > order] child node '32k-oscillator' out of name order
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:248: [property-name]
> > property name "snps,wr_osr_lmt" is using discouraged style
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:249: [property-name]
> > property name "snps,rd_osr_lmt" is using discouraged style
> > 	arch/riscv/boot/dts/thead/th1520.dtsi:253: [child-name-
> > order] child node 'aon' out of name order
> >=20
> > These are left for future work as they create a very large diff.
> >=20
> > [1]
> > https://github.com/krzk/linux/tree/b4/dts-style-checker-blank-lines
> >=20
> > Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> > ---
>=20
> Friendly ping :)

Thanks for submitting this series and sorry for the delay. I will apply
these to thead-dt-for-next once 7.4-rc1 is released.

Drew

--ZrT0CggEIZoz5/F0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCauPziwAKCRDb7CzD2Six
DDV9AP0XyxKiEZKezADR+IwYgkm3uHSS4vjMhhOh9me5W4tdZgEAtBrp5aIocVAk
sjQ04QnfKSV9NEf09vt0Aoay6ZsbJA4=
=1xB1
-----END PGP SIGNATURE-----

--ZrT0CggEIZoz5/F0--
