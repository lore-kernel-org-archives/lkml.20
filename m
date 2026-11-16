Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825299;
	b=CwxEOsXCtbSi6LVyEfDywEobkLJOUpbkxljaJFD+t9NbPhJmHRqnZ/kne+heOPIukLRt
	 lZN++w+c7jQuzssbOrrfAro0eNGfYf7QVs4pt1CB5ue44qY1Vd1XEG65Wd6AcEFPllgdN
	 9Vb1P4I9MC1aaHA6MPQNCxjhFqvC2V5CqUgDLcEjVzHppC8Ys6joyBeBPQ/SjHp67y/z9
	 X8uoyvMHFclP+iaNddOFS37Nb+0nQ535MvDycpoc82tj8EdePowph/bXw7vvB4UZNNs0B
	 /YoOgghyd+c5K0dpw9mxPyIKmmudpCYnaf+FnQE+5rvcu5novBWXIXhoANy2cANxm1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825299;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GOPTJCv3XLVXfPEVUY2szn6O3hXCLFE1beoEE0C7n3c=;
	b=qy3EmqmGfZzYU+0aOp72V48DEmkcY++UswRFJEy3NkmCSz8CrYxI3VVW9YGtdx3fGENW
	 lWHHSteKg87C7HVHlBujW1QlTMZaey3qu2tko0LjIS7Uzxy46AyaTHQXYhqBsIO/OHtXE
	 HE0yV/LHIQWQPddFsDU5H+pO5lhSIA4pxCatf5fZweXrSyhLidcxpAnr/dR6IZJl2nFUP
	 mQJvEQ4Zl4gJldEIsWIyAHOTwRKuw1bt0Hy7Qeo7JwfQsuoAne1wy0WA+1xcoK8qYhbwM
	 dLqU/l7ilYlX3ZrF6G48qkqagewFTPAMk3BVY0AnmDshpLntBWrToV0VURQPIBR3Uew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="F9/+sMXI";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VyJ9h3CI;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238A606A329;
	Mon, 16 Nov 2026 10:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9238A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=F9/+sMXI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VyJ9h3CI
Message-ID: <cfe4e81c5146628463ace9f170c7265c98f17c27.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794825296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOPTJCv3XLVXfPEVUY2szn6O3hXCLFE1beoEE0C7n3c=;
	b=F9/+sMXIiVNvIlgrdZB1FU8a0g1qhn/cx/k+eeh5SBSDpQXlZXYWPYlE/L6Y2i7hP7RhIK
	XX4rC4U1cOJG8RboEQTLsPic46SDQCJQ+kXa8gNf6cRVkQopXHN6X4B3NYUTCi0SC1pSMI
	eycP9FSIQ0fY0du8V5o3s1utmUimuV/42ZnSOLFvquiPasjLyiV4DijoS7tUlMIXqeRuZ9
	EEXFKGugL/QOameZNi/EDRM0Tb7FCim5Tpy0SvUGPUuWwMm4Stkuuv24Gm6mNttgB+hYHE
	0YF4RNVevIAUoniFG7XgPJmDUcgWzS82DCBBsWOQSNcEiyYe7wKL6Frp6GLfvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794825296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GOPTJCv3XLVXfPEVUY2szn6O3hXCLFE1beoEE0C7n3c=;
	b=VyJ9h3CIUVZngr18q68/wjgTQXAd7MOfui0b+PaqvP8JS4/CslSDW4fZdR5Bxv95EOlgxm
	uz3FqMqB3cnvVHBw==
Subject: Re: [PATCH net-next v4 4/8] dt-bindings: mfd: Add SoC-e SWIP parent
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, Lee
 Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, mfd@lists.linux.dev, 
 Martin Kaistra <martin.kaistra@linutronix.de>, Benedikt Spranger
 <b.spranger@linutronix.de>
Date: Mon, 16 Nov 2026 11:34:55 +0100
In-Reply-To: <e4417d39-390d-4ece-bb2d-5f1745185d37@lunn.ch>
References: 
	<20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
	 <20261105-devel-vstrassheim-soce-dsa-ml-v4-4-02f3cde2afa1@linutronix.de>
	 <20261106-judicious-penguin-of-enhancement-b28c8b@quoll>
	 <f5c7c9901aca84f0b814e5b6c153db84af826dd7.camel@linutronix.de>
	 <cc35b2127b04772f05948ac51c8faa5ef07da0b0.camel@linutronix.de>
	 <20261110192118.GA1412882-robh@kernel.org>
	 <5a6183e3480a0d910e275acf591e2db8700da827.camel@linutronix.de>
	 <e4417d39-390d-4ece-bb2d-5f1745185d37@lunn.ch>
Organization: Linutronix GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-13 at 21:48 +0100, Andrew Lunn wrote:
> > > Given the MDIO bus and mux registers are adjacent, I don't know that=
=20
> > > putting the mux into its own node and driver really buys you anything=
.=20
> > > Can't your MDIO driver handle the muxing directly? mdio-mux-mmioreg w=
as=20
> > > created for when you have mux registers in some completely unrelated=
=20
> > > block.
> > >=20
> >=20
> > What it buys me is less custom code to maintain for bus selection and
> > selector-value validation.
> >=20
> > The MDIO controller and mux were combined in a previous version.
> > Following Andrew's suggestion [1], I moved the controller into its own
> > driver and stacked mdio-mux-mmioreg on top of it.
> > Sure, the selector is part of the same MDIO control register. But the
> > generic driver already provides the masked register update and
> > selector-value checks. My preference is to keep the current approach
> > to reuse existing code, even if it requires some integration and
> > documentation efforts.
>=20
> Since you have both implementations. Did the lines of code go down
> when you reused the existing mux?

Yes, the number was halved from around 400 lines when I didn't use
mdio-mux at all in c-files. I have no numbers to compare only those for
mdio-mux-mmioreg.
Without mdio-mux-mmioreg, I would need to reimplement the selector
handling and bus number checks, as well as some de-/initialization
routines. I think the bcm6368 and iproc use mdio-mux in this way.

>=20
> > The IP core can also include an I2C master for accessing external
> > devices as a synthesis option.
>=20
> SFP cage being the obvious thing.

SFP is a good hint. Their website shows FPGA-based devices, such as PCIe
cards, that support SFP ports.

>=20
> It will need to be a Linux I2C master in order that phylink can use
> it. And i would not be too surprised if the existing I2C drivers can
> drive it, it will be licensed IP. So an MFD will make it easier to
> instantiate.

Looks like a standard I2C interface. I don't have one yet to test, but
it would be good to consider this early with MFD.

>=20
> 	Andrew

Thanks,
Vasilij

