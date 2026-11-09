Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210980;
	b=ioL3KuyVx4+U9wDnUL3KmlfoPbCHvA8wJiKwdd73zHFaaHEg1nVAvs6+DdA9YRQLcWGA
	 lR9Nn5e0nTO5XjpqnQUEehoRKdbLQCgcpN7tTZtGkNjKmR2VbLgsdJBxUFuRoN75voRx3
	 lfdDS30vITh5I2if85TeNwWj8YgSxAjSPA7hVX1K+HWnWU3dW4ZJjTH39FAJGIYaF0HU8
	 hfCUKZSiknw+4N9qBczp7cogg0eDpPea5iIHZyzoBx5ZMtClbU1oyuDYRvmOSyeknnrXb
	 gE8TsSzT+LIt/SQflEqjnMYoJkAYbjwNQfUxZFBKOKcK3zFtcZelDMeb867hiGGqlJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210980;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=beeIhfgcQV7TlBjZN1ejJeypNbQ1lSiL1HUsOsG1ZJo=;
	b=2m9c+/ekPP/RTWOSfpqRnlu73QA8y89sVtH5xAWd6zHQ7fDSjzh0Cfzgu8HrPgmFDon6
	 xCi4iY0ZjciifQHG+Ta9M7UE0spRHXpZp+tmrcUwNS3iUbZ5H+MVzFiRJzeJNiWKtU1rK
	 W28praIm0LrEh8gQak9VMRlmY9+KHDxM2dN7XxofPMvuJpr96Dak+iLOWI0xZC2JBemI0
	 Pjf+oQ3/JQAk1rh7PTkg5Qd1X5hQuq5fp3nyXQofYgnLyTtZaGFtPi+dHQVxmG4gv+GN5
	 58Osz/h7pTiTFZKqCo75x9aqWVn8l3A+JR+hwrRxLNY9Oe2/zTwPwBibtKjHE8csqLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b="csfJhc/R";
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF068606A322;
	Mon,  9 Nov 2026 07:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF068606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=csfJhc/R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794210977;
	bh=beeIhfgcQV7TlBjZN1ejJeypNbQ1lSiL1HUsOsG1ZJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=csfJhc/RRIoGZu7NmjEN/JlExsYIdCdDjKFGP0WrTXnd3adCSzQbtobaJH3CpJA9I
	 u+RvCSBmdHeUB9sXQNuzyFxnHpapWHIJ2XIttm1J8nas+c6Gl2u0R3rx2oQAC7jNhs
	 lUysmms+0Yj/NDFsZq5EisAgR3CMlnMfNeTl6eGUZ1AVxBo8GN1Fq24d56sX5kqcuI
	 KNn+acHpfiLjsn1e/Gs8OQuW+nIc+2OO/B19NI15C0rImroGXiMuixw0dXw3hKedAx
	 Foj9ZL6zIMdy6aUk+aGAReLEbqVl99A5bIPR6Hwt8GgHC7tHHMkZDAd5T3vD30pT9A
	 M+DmoNhnFGbMg==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B62156495E;
	Mon,  9 Nov 2026 15:56:15 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Renze Nicolai <renze@rnplus.nl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: x570d4u: devicetree fixes and
 cleanups
Message-Id: <179421097567.853200.13340616110295498836.b4-ty@b4>
Date: Mon, 09 Nov 2026 18:26:15 +1030
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Tue, 03 Nov 2026 21:33:01 +0100, Renze Nicolai wrote:
> A handful of independent fixes and cleanups for the ASRock X570D4U
> BMC devicetree, found while working on OpenBMC support for the board:
> 
>  - Remove the w83773g temperature sensor node, which is only present
>    on 10GbE variants of the board and should not be instantiated
>    unconditionally.
>  - Fix the tachometer channel assignments for FAN4-FAN6, which did
>    not match the board's actual PWM wiring and produced incorrect
>    fan speed readings.
>  - Give the eth0/eth1 MAC address nvmem cells unique node names, since
>    they previously both resolved to the same NVMEM cell name once the
>    unit address is stripped.
>  - Add gpio-line-names entries for a few GPIO lines (NMI, BIOS
>    chip-select, LPC reset, hard power-off) that were previously
>    unnamed.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

