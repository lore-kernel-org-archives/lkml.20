Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794361791;
	b=bgliCdpOfHhe/VFHZkvkiuTp9V6gEtAMNQsrfqVIIVI6pQ/2F/ERO0PK4nwmf2MWQvYo
	 IwyWplYmelGERhJl0Q3LhzWurgiVbsKooot04C6ixOXsdF01fD10eaPggvSuEIDLfXLSj
	 NWYLsff/CkjCSLWFV/zB8ddlj6RdgB3XdAUMyqac5ffd13Ogn3eeRonVKvX5MYxBvFgkN
	 EfmoCMCF4fz3/EKMgAaUs2ry/LLof1yE8Wl7p/eCOuTbcttY+mJ7eK1PnBRneu2B9tfcw
	 ss3ST78HZGngssa4HbZ6a9lcQk3CvMk4QfsJZPMxcsI2/1J9kvGjK77CEFNTFRsbr7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361791;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=7Kmq+KrqsJVdamEglD05VlODQnyHuuKHPdii9uryj5M=;
	b=f7GHLoda/me8JMn7HejgbnXK6mCntjPF/E5oosHAxQj4xNyPkqn4S/VwtxeXejtx6ugO
	 aMYaDXwSesfoSyqN8nk7E7l1r1cKYJOZVCDwBZrz1B2v4S+e/IfrZnHdxo0ZKRbmoGPBq
	 ej5kVN59+vW5bBA/TIG3wADShLxPg7XglNPLs6lQ5/Ihr9u3Tepkd5qFLvi/E25xkDHBd
	 hjlXz/ILAfO6RpUcDv0+ec8wA8HL9+rtF6oT9iy4G9TOzPlHClRcSJ5idlHNXetQxoESx
	 JP8sSQoVfr83FUriqr7g0kRTgavL/ER+Qa23tPvz+lK4pFysz0/fPUs6CMPuAJ4oCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lJPVZ0ab;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B185606A320;
	Wed, 11 Nov 2026 01:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B185606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lJPVZ0ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794361788;
	bh=7Kmq+KrqsJVdamEglD05VlODQnyHuuKHPdii9uryj5M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lJPVZ0abKDf0DLzHSxMmK/yrfDVBM1PSNgzEXP3miyBlLjMlmo/se/vVUwfvQwlcL
	 VITk+MFatj7sSRTvURtTFEk0ASGPf6xwTmXgeOYp7cuInxpixCQwF97hyrmsR3/zHU
	 /BHk/NCbxj0MX2USlWM0Gwv3YbLAvPYVpZcDD1o1q3jV83Hcl66r4lMadsuTHhvxul
	 wwpQ1UKXQTrr0znFz/caCwZqbBe196VL/6ak6l2Ob5QjREQC+7Ih4fKKQuG35TWPxZ
	 4nopr6vQijOiHR2A9zc2pjMyBw5FBobqhn5zZPYe4cCgLRiiDpAFpekFTdjzmqFZfW
	 leYmOUgTYQH8g==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 92D0F64C3C;
	Wed, 11 Nov 2026 09:49:47 +0800 (AWST)
Message-ID: <a92395610d27fc0f97af3b27b150de61583c2197.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
Date: Wed, 11 Nov 2026 12:19:46 +1030
In-Reply-To: <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
	 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
	 <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
	 <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-10 at 17:42 +0100, Dawid Glazik wrote:
> On 11/10/2026 6:53 AM, Andrew Jeffery wrote:
> > On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
> > > AVCRP is an Intel x86 server platform equipped with an ASPEED
> > > AST2600 BMC. The BMC is used for out-of-band management, platform
> > > monitoring, and system control.
> >=20
> > It's probably my fault to some degree for not providing a better
> > explanation of what I was after on v4, and for merging changes from
> > others in the past that were pretty lax on the description, but what I
> > was hoping for was something more like e.g:
> >=20
> > - f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
> > - bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
> >=20
> > Are there more details you can provide? If there are, I'm fine if you
> > reply here with them, and if there are no further concerns I can update
> > the commit message while applying the patches.
> >=20
> > This also applies to the JNCRP patch that follows.
> >=20
> > Andrew
>=20
> Hi Andrew,
>=20
> Thanks, that helps. I also found one more issue in v5 (uart-routing=20
> issue), so I'll send a v6 with the fuller descriptions below
> instead of having you edit them. Please hold off applying v5.
>=20
> AVCRP is an Intel x86 server platform. The BMC is an ASPEED=20
> AST2600-based RunBMC module on the platform's DC-SCM. It supports the
> platform's out-of-band management and exposes board management I/O such=
=20
> as the system UARTs, status LEDs and control buttons, while integrating=
=20
> with the host's telemetry and management infrastructure.

Can you talk more about the division of duties around RunBMC vs DC-SCM?
Can you describe how components of each spec are used in the design?

What's the motivation for designing this module vs using another? Are
there any specific target platforms intended for it? If there are, then
some further details about those would be nice. If not, no problem.

>=20
> JNCRP is an Intel x86 server platform managed by an ASPEED AST2600 BMC.
> The BMC is the platform management controller for the host system and
> supports platform power and reset control, while participating in=20
> out-of-band monitoring and reporting for host faults during bring-up and=
=20
> normal operation.

You don't mention RunBMC/DC-SCM here, so I assume the BMC is integrated
into the platform? Can you describe the purpose of the platform itself
(beyond the purpose of the BMC, which tends to be the same for most
platforms)?

Cheers,

Andrew
