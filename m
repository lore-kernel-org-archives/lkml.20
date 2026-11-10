Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289997;
	b=owLnWDfAfvCdSKmAVJUqMo6WADmVdr5oGwvtLsemvXhropYIA8EsGfnq28rVm8LseEWW
	 jdRDb1vaxWMPpC5gmc/cynYdBSPFOh77QJyjvR5bZ2M36qIEt4C/q+q+sMR7qkPCZOZ0e
	 wMlSy5HkxW7luncgVlPtbFh7pFvxfHdy/a0mM/SuMustRuti4A84Ph/fN3IriuI2PbFBh
	 ZoE6Gq9REwdHeB1U5PW4ralsmuFk6+Dz8vDNCYVOpze4IKkU63WWga52ZjrSrIPazEice
	 XsVx65et+qwCSb0pXh3qWAQsWGKZYb0apTtyszyu0PJIAjacyCpG3iJWmr9rlXKiWPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289997;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=YnyI1E/tXADZNI0XTbGcSGGT3VaZrgmrn187FtfBb6I=;
	b=gb64hfJzhR4K8gIoyes/kcJfKYMCcepoyE1I5bROkwTXcvpXRtEAXidxMrm01ffS5UjU
	 qUQFGI2PrpeI+GVnXAx9QJsgQhymfqlNgEhH1Mta6Ci2GEOPbPKnorwmMMj0yOjLPJs77
	 V7siuS53btZda6ddXbKNd8hPC3AAQOsmlPXJ37s4Q/dIPBdvlsec0DGZNcY9SckJ7HEpy
	 3JWb9KLybQIMsbkIJA8D1iMkkPYuQTavG0srGaIFx/R12YaAgWTmZNxVLYWaou+AUsdto
	 xssUk3f3RzWxKh14M1FcQcDysDklUjwiUSyjNKijUmlKkkRxci9vlM3an+8nykU8NwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RlMcej0s;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73250606A321;
	Tue, 10 Nov 2026 05:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73250606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RlMcej0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794289987;
	bh=YnyI1E/tXADZNI0XTbGcSGGT3VaZrgmrn187FtfBb6I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RlMcej0sH+YHRrPEV9YJUIDy+wr6QvgUvUSjUzl4ynFK/1A8o78bX9qhhf4hLaJBE
	 Cgvy6tJbLtFjESxgLDfQ5jUWGX9jCHJ7J99aQUIh2oDdIx9ZD40yjfvfqs584FmjMN
	 AO5kC+oLKBbDRMRfWNuLN3ER0TVOFagPaKoEAaNG7Gb6060YCs37/NL/sB6jvovceY
	 St82FWpxTZKZa9eOIBQWuhF5VmbeDPF+ycRnUkJaiyNVqvmK6DUak+/7QGwsJWCiFv
	 +WKdv8aHB3CcR/0EsGkGqEcxiX+udLc9ycwIKHIGblQlXb0O08pdPPuuWYBKBfM/rc
	 fIITpQN0q2Vlw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C4AAC64C3C;
	Tue, 10 Nov 2026 13:53:05 +0800 (AWST)
Message-ID: <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
Date: Tue, 10 Nov 2026 16:23:05 +1030
In-Reply-To: <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
	 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
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

On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
> AVCRP is an Intel x86 server platform equipped with an ASPEED
> AST2600 BMC. The BMC is used for out-of-band management, platform
> monitoring, and system control.

It's probably my fault to some degree for not providing a better
explanation of what I was after on v4, and for merging changes from
others in the past that were pretty lax on the description, but what I
was hoping for was something more like e.g:

- f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
- bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")

Are there more details you can provide? If there are, I'm fine if you
reply here with them, and if there are no further concerns I can update
the commit message while applying the patches.

This also applies to the JNCRP patch that follows.

Andrew
