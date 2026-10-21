Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592391;
	b=zLZWPMPA1Gvt9/JuZQvAzpYTTyN/T+UZdTgxC0PuHQlrwedONNbZIp5czyBdKtfHGYJv
	 vZewfNRCzaqnTFu5TXlsc9C+kZYTiUb62G0t3vcPnrv2v3vtGbramO64wWr38guKzprFf
	 1cZgoppoAoDItKPToEiX8VcHjp8rVT2nJtSsvBvaPd4m0Iv4MJ55vxm2mII6LfhMCvNHY
	 eqfpQxHcvRdrjaC+Thu546eBLwo7DwCY9rkZXFms5HbJ5RstImnQHG/Ha15PhfC6RxJMi
	 LCvyaO855JTyMgKuaDqET+bkLHh66BDa9Ue8odd8yRn362wXeOkrN9HZQYq5OY/fS0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592391;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=rEX5V43c4D3SEE8/QjnF2l3+QYXk5M1z/X/WgzWok2s=;
	b=Y/qgg7KTkHEF/ffjd8uqv9q7wPPFwqA7PIPMvpR6ZtznB7DBVr5utnTtFwHebMjT71Kn
	 3jNXpnaWLq+TzokDO9OCkuZAvFOHNnkV61Xczr07LrTntd/pFi718AXuiFss31wIdouzS
	 X4NQcSOye9IB0UcPiloJ4Z1++7WH9Etp6MFlmNpW+IUBrqm9GJcLVTdLlupWDZwO4LmDn
	 XfIubTnehWD4OHWFXDRWAPeCw2yCqjradCvcbByWXq5M6HhkI3pxjZ3xmE+Sjvz9AbEgg
	 3f7123jOaWbTqURlC4MyLTpwRCrEm8+vjS0reFW5QNq+7C4IEgdukljbfgZ2RmkLNPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=OVFF+11s;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC060A2625;
	Wed, 21 Oct 2026 14:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEC060A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=OVFF+11s
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9C12440904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792592389; bh=rEX5V43c4D3SEE8/QjnF2l3+QYXk5M1z/X/WgzWok2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OVFF+11s0uCeT/ElNSlUuPoj3uVq7dUx2pYO6gBCOMeuXR/m2U6cdGcZ6tkAE4y9W
	 SUeC9MmM9Rnu5q+dwo3gg/UUwBnSlKf8nl9qAbZnWbolM2fL0iM7BVKZZjuYKRxR62
	 jwlU3Ry2EI3UUQAlA2Rl2PT2lm0tcSjBL7hNkHfX0VZ805zux0D+77f8XU2xrzVGpB
	 JNP7f9PhSDd51iRzzsANa6gxykcLhqM0qbJxXxlWLEVxkZjKuT5Mz01U4c2SII0GDE
	 TZ7AE5Y0zR3cT174anBGu8WfVyq6atJyUo0Bb5d+efgGQ3YoeUNX3Cdbs7GwiwupkL
	 BcPNbrhGizS0A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9C12440904;
	Wed, 21 Oct 2026 14:19:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers
 <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
In-Reply-To: <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
Date: Wed, 21 Oct 2026 08:19:48 -0600
Message-ID: <87y0br3zln.fsf@trenco.lwn.net>
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> For many of my contributions base is obvious and not needed to be
> explicitly defined. For all the patches I accept, answer is the same -
> base is either obvious or if not and patch does not apply, then the base
> does not matter.
>
> Requiring it is just bureaucracy without actual benefit.
>
> The only benefit would be if maintainer COULD change its base to apply
> some patch with odd base... but this cannot happen. Maintainer base is
> fixed - it's the HEAD of his development branch for given category of
> commits (e.g. DTS branch for SoC maintainers).

I fairly routinely get docs patches that don't apply to docs-next; when
I'm in the mood, I'll try to figure what they *do* apply to, then
cherry-pick them over.  Base information would make that process easier,
and even automatable.

Thanks,

jon
