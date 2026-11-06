Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793940013;
	b=gQfuZ3xpQY4mgQpe2CDWX2w2qim6kV0CspVHFVG+a4PnoVfGsiNdycJTWB9Yt/6MxNJl
	 UJzWNYW0nQzmjY14N1U0UCPA6W8f2DDX924pod6rHKJXWNg4XlHABNXRwnmGNAYyV26eB
	 ExjXUCeM/WwVBd6SQfGnkk/bg7aGNrHsPyvKq9yhPo7E0FWH93V/K+igHiJtN9x7laDyc
	 n+dWeeIBu4cUJaehlSPnHBe9suospSICCjoQAWk+pTDzuXHZwj2rPy0B27pQcbLjqvMUU
	 8wMECBZb+J5GetCGuvxNlEVnSu0enwJxPlosVAUMDh2ZrBxGrYLGxQvx1zWmmCJRJHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940013;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=pgE10eCMCTY/ZcVx7ek1lDVXJ0ro/xZZDrYhv8RrKbQ=;
	b=1se1JsCAQzFS1mjCfktUI+0crlrVOBsqVm5Kbrl6WT80tyQNtJ/dOS+b+VP4/wTN+iqU
	 mtENTP+yIoNQxfPN0u2BGZTWlJJSwqWH5jMibB9POGRr2l2O55lhe5AP3z2Dbuwul/wrA
	 EPL/fTqd2ty0R1xjKH+dgpbCdVD/nU8PC8Aj2aTzGQrXOSDtYLA9d177nCXBFh9siDOG5
	 aRvbfuBYdjI3F1D20DhGlQ/Op33gIxI4k8B/hXApd4uwx1W7St1Wmz5iAE43xdm83DalD
	 /Xen7KO1R05FI5YZRgJzyD1FDiulXoiMC29YUgo1sVuxLgCW7qXc8ify0dqTTaqhWzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b="Bk8cTMk/";
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B8606A31B;
	Fri,  6 Nov 2026 04:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7B8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Bk8cTMk/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793940004;
	bh=pgE10eCMCTY/ZcVx7ek1lDVXJ0ro/xZZDrYhv8RrKbQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Bk8cTMk/fNQGf1WV2bC9cjno9nlavkIUND5zvDV1Piiwz1bSFM2pjubO2ka40IVE2
	 Tbzh+Fu2D0O+T05AfWjADO5pT3gjwTKECtiKDvHCHgSLOa9zQReHwLFPXMrCj0lGnI
	 u9Rb9I/ay++2itl/y+LxMgZrst7bpuJI4AsgTgySwh/Q7yBzusCVYBmbuuUHZz7R2r
	 jIb5Y+PcaPlSPu6+mSBBt2MJ8Ld+LJzfrK+Kv/2PVGTNfr931iG2hJ8ZXOd/Z+Iqtb
	 6rb4XaJsVpru1GxcBh2ruOlEobO23x6N3vvQtCQqE0JQoednRHYKe8rDL6SfeJLPkS
	 FCo4nwCK82swg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A250C64952;
	Fri,  6 Nov 2026 12:40:01 +0800 (AWST)
Message-ID: <d7a1f55d822af84b00591a57d2bbc1541c184412.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com
Date: Fri, 06 Nov 2026 15:10:00 +1030
In-Reply-To: <cover.1792749922.git.dawid.glazik@linux.intel.com>
References: <cover.1792749922.git.dawid.glazik@linux.intel.com>
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

On Mon, 2026-10-26 at 17:40 +0100, Dawid Glazik wrote:
> This series adds initial upstream support for the Intel AVCRP and JNCRP
> BMC platforms based on the ASPEED AST2600.
>=20
> The first patch adds the board compatibles to the ASPEED binding. The
> remaining two patches add the board DTS files and register them in the
> ASPEED DTB build list.
>=20
> Changes in v4:
> =C2=A0 - Rebased onto aspeed/arm/dt of bmc/linux.git. No other changes.
>=20
> Dawid Glazik (3):
> =C2=A0 dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
> =C2=A0 ARM: dts: aspeed: add Intel AVCRP BMC
> =C2=A0 ARM: dts: aspeed: add Intel JNCRP BMC

Bit of a nitpick, however, I have other requests on the relevant
patches:

For both of the latter commits, can you please capitalise the first
word after the prefix list (in this case, 'Add')?

Andrew
