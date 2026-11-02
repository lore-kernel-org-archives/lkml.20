Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634651;
	b=Sz+6T6MLpzhx2DuLb0foB0ZSVdBxtYRHI0uR0jxKYVAyAYwB8ZZqow25/qf1TT5gUZYp
	 oHQsrAhUqZwa7XOlrGyiGlJsC8aBFz29yFahOPelXZNNbl9Fmm5NHDmurbwSsaEzwmKsY
	 lWNYpB5cXacwr9K/hYQNzhUQUj2szILIPtqwOet8K4QTELUjRRqlktMSyAJD8fD+as+ZK
	 Lqk/GpWZIIcEbY+5bgZT0sCSoxYAu1piHcLu8J4Ij/4nkRhSzdkJ8KUEZoQjBtNspV43L
	 53Nrs2T3J2oz+2VfOD22WTBugupouYFTB3pkXYuzeNsRjcmFb4wMaZouCnwEJeXbWFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634651;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=tNymdF3+sOsvqTQMjlfLHZt2GQXzue7Jd8C6fmMxaZA=;
	b=1L9srKN9r6fDm4xmxWuLp3LVDeVxmPNL8VuaichQlkxrBeZFWHfO85amSxX6xEptrBJg
	 0zm97wvE8S9XiywLGGbPNfxmc9mF+ZY7MQPxuPZMaUbUenJRguwrfQVd5t/skgSM3XOX8
	 Ji8ZV3pHCv5k7wRU7s5hviPiJcd3D0jjHPAtmhqOdT8iTBtC65EiipXVeA3da1a+okn+g
	 mdysB8B4huMr3jUSL+Lb5Pm7ZafCE2aRDc5njCkqHuDJwanzHle8214t0zdRjS1NmFdvn
	 nIBoxOrLPqP8BlNsds5V+NAD3w1Tefj6lXOtMbPRFLNR6a9Lwuax20NNttNkVxA+jpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b="gjOjF/Ts";
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309666079AAD;
	Mon,  2 Nov 2026 15:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 309666079AAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=gjOjF/Ts
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7D4CB415CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793634650; bh=tNymdF3+sOsvqTQMjlfLHZt2GQXzue7Jd8C6fmMxaZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gjOjF/TsFf4PupAhziJOVB0Q5od6UdSbvpnnthnqxvNQAgBgNpU4alkpUjU3jj56a
	 Z6qY8Jb0RYY1pyobYIq+q1wU1khROWXK1Y87MjEeCv+L1LI0EyJ561sLD3f+CT2WFX
	 8F61bqyJx8IMRcKg/smDV17/QQ0b3KRKRgrOPiBJDpPaAFYg5vorl8gTPGThEPQPc5
	 xh7fIqvDjt+K3WNW2C0GqUJ5w7N9fJ4zLjhfB6NA/ba/r0IVwmI4hDNk0EXYbe3S5K
	 A8LCRhNsXLZSAx6IWKtyGFXZSiXOHohJdwAg0NdDBPbyZXq4Ue5rp00dFcpM5ePmBo
	 6hjOEcz43RUtw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7D4CB415CB;
	Mon,  2 Nov 2026 15:50:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: ioctl-decoding: use a list for bit meanings
In-Reply-To: <20261008210943.3297085-1-rdunlap@infradead.org>
References: <20261008210943.3297085-1-rdunlap@infradead.org>
Date: Mon, 02 Nov 2026 08:50:49 -0700
Message-ID: <87o6c7dyg6.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Make a list of the bits 31-30 meanings so that they don't all
> run together in the rendered output.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/userspace-api/ioctl/ioctl-decoding.rst |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
