Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357994;
	b=kClbhWc/vaBsMs9e0CcTvYuvpFffxg5t5ngyJrVkb9+fK72E9WF9sZOnxI5JuSdgFPHF
	 dnifPcxtCqJoYsQZWf44L3lxYLN/Tg2DYITfp5yVPeaGo8qncSUrk0vf9RZfoVCULedij
	 GW1CVdYqesPDoz0d9h4B8H3xa4/MOpovhg5O5d0LCSqzt9tijfExoj1kIz1Kyf2bZvjEb
	 zlwKfqKUreleNYJVJKzeN/I+E3EF/Dd3AKWRWlCXdb1eX79Ntne/Bubsv7sXoyMKEjKY5
	 rjzRNjOzPSUVyUm9wiFp+X8DjC+0cMYt1GsmfXbm2W75ZJ42JCZlAUz2TQqh3Qxm++w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357994;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=eR2dhcf8p4YWboqWU5hRPpF8mWLyTjiEgnkIONJGNc0=;
	b=qMlmTiAGlACV3OQlWV7S1Q3lM0xnwp23l1qTpCEIdh5zVlyzXdhKBv7gEzzyXoloZPiv
	 W/gLqIRIRtJk1c/MeZRZJ94Z2xWdJ0s8122wamUnmMniL2ZDh/nvdyeuOlJPUBDoRSKk5
	 +ltKyyG1s7Rb3vKVv90m2A+cQ5UqFUPg+fc8ny9gYTBxXFoUY083AyhKLGTO4Ecpqt18a
	 hGJDSFFMT3r2gtnpgbih/6G7M+rrzx1H3nTTHOHD8jHAcv/1BOMWOZbf/7zwy20/HNLg6
	 iF7+zeNDwlfcvs4vmZYn1XsEnhiSvTIhGJOj+U7o+kO6N2WrmQMZ3JqWe8rCRCfkCbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZPgdAFT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F676606AC06;
	Fri, 30 Oct 2026 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZPgdAFT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AB31F00A02;
	Fri, 30 Oct 2026 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357993;
	bh=eR2dhcf8p4YWboqWU5hRPpF8mWLyTjiEgnkIONJGNc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gZPgdAFT+VU0wpUSC1+guG81RN61aC4RcI+2FX2vh146GPek14RJiqdOxiu9ECIYj
	 5+uSNjXE47Rl542yQzo97NNsh6V/NDTw5bvasY75Ea+WCtH+ln+BlSpoGhTTFHI7dB
	 9FirJsTOAklF57nxwuUGylLxC2jvKiqjvR2iRP4I7qjbuO/IIuOrI4W32Vl7rIhnLT
	 46L6RmLsNzTnagFjNhZZm3C+MA4/1rkYdKrLJGSSh7LomdP3AqMmeKDIDNgxbjKjhJ
	 eOWGYHPZnf1GqvJiAyxLJfLzTxegf31SHAse408xgxg8ji4Mkyl9oQr7Kh75Pkgtfp
	 fsw68+UoJi63w==
Date: Fri, 30 Oct 2026 11:59:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Message-ID: <20261030-glossy-coral-worm-bf3ff6@quoll>
References: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:23:02PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 GE2D is compatible with the AXG one, but sits in a power domain
> of its own. Add an S4 compatible with the AXG one as fallback, and
> allow a power domain.

Does the AXG has power domain too? The patch claims that yes, so you might
be missing explanation or "allOf:if:then:" block disallowing (: false,
see example-schema).

>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---

Best regards,
Krzysztof

