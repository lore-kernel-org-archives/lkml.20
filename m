Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359781;
	b=Q5/qhQGUbqBXlPgj3wiwi2DR8XjfjyjvjxGI6x9KqUptBcmQlOAxvZ1byCgfxYmfyH1r
	 vBtIps8ntWmYfOyxoNgrkXVZeD3AlMGbpuL1QU1kLOdg2enKiDKmwSFGCVW1R0ldKG9Uy
	 YWBf8PvLPk/RivRX/qhXqCjUSw+4wcqb9qxyko4R1RKAHyk1SC/NYGI22/DbOG8kyhbr3
	 QC22jb+sRyEw3i4v4UT5aUO27xQUPb1aK8Vs7FWyN1gw8Db7tqAUH1MFoXOrU83JQK39e
	 KSSf+8W/bwOGfgwEPhrqy6wAQipWPgHT4UoCLr/so/Z0rf6MhjpsR4jDzCdMFXSPslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359781;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=9PsBY8Qr09buSCwFFe4vaPMjDOQ5TMptk/E0sw8Tnbk=;
	b=J+fd85LbvEzT7X9Jb3HhfdteTzuIWGmKO2XWjBzsp3uT9xZEhVXYuD8d4yhqYYzg2fSK
	 bofwcDVmMeWAZbnwZck/+JmI+BYYv4ZLiJkV3ZEirfqY7nUQgG0JHPtgwhVgBf108Nnfk
	 4DYUSHSHJ6bIN5hF6fAr0VWbKwAd3DuHuUbTNjlWehYkqwXVSNMf1yrWKpooX4zXRwbva
	 pxy+IAL8Wr1A/HJOVF3HhlWL/kNtJn1Ijm8J/DPi8ppyXVV3U6ZlyWxQQwvd8QK2mL0xy
	 SzuOvz5F25CopQRA5yYmtdP9rxLe0lEShwNGsRFS05AIj24+f+bDqnUv1cm6VcrtNQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fd5Sonhp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E143A606A31A;
	Fri, 30 Oct 2026 11:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fd5Sonhp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29B71F00A17;
	Fri, 30 Oct 2026 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359780;
	bh=9PsBY8Qr09buSCwFFe4vaPMjDOQ5TMptk/E0sw8Tnbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fd5SonhpQCiLizQIrszFpPErIfMqd3bXuofqz1gvyeMUr3nEb+rDe6M/+GvmlQpZV
	 T5xeHnVGSvrSPO2CiTr0DFq+55X/QqxDq2kqy+CxAOic29V3p0HmBxXvKvD7qtZ5BM
	 xk5te4vsl6N1T2K15adVarnb0aFjgpIaHyXc5gQrHGbWzEH4+jBbPz7pyQNUq9xWsC
	 /47xDOsxVP1r/lvx69VH0mdaqCU3IqQ7g0xbeYbMvqNeZOHR8BAAjRtPFD8EpE8jF9
	 9c6+AAzvyR76pHib0CMnNTciHUSOaIRnDRWbCioKu8LvpqX/VEcZeB6uNvJoKvgFuo
	 gqkhuRJ9MwQkw==
Date: Fri, 30 Oct 2026 12:29:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 01/11] MAINTAINERS: fix the Amlogic VDEC binding path
Message-ID: <20261030-invincible-peacock-of-feminism-ecaefe@quoll>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-2-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192507.210058-2-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:24:57PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The binding was renamed to amlogic,s4-vdec.yaml, but the MAINTAINERS

What? There is no such file.

Why are you sending fixes for broken patches being just reviewed instead
of just reviewing them?

Best regards,
Krzysztof

