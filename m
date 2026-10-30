Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357531;
	b=I1jkLiDskkwU7QzWOXEEKmm87tiTd9o6nyGbqQOUBQdPGWzvPO3/9RNIHd45qWNwE/LF
	 gAHQB4hhDSWMTlKWjaXI6yzeOpfvFjalTL+XgSOdXoZ4juJdg/WbKqOXMjcGuk2NhaLMy
	 vQXWpjFJVpqc5EEytG821EWRVfJlpLTVNVnd8BEJ2PrYSaLQ0siQmVXIaKumyxkezVPWp
	 oGCXI/lPuJmtPr8VuDFQCrtC5R3tlrmZUowEMtYd61AAveCFfOxPzCiRoNYeUqo/DNQMC
	 7puyHOBzEofX4qcAaI2PM3pHVHdjqx4wX4GbUUOlzpCCNw7ye7h9CVg8IpGfxc/mYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357531;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=49o1u1ndEVYCRhdoNrt4i607A2DEAQbKE5/U9XS515A=;
	b=x2QKgJ5tdaNOYxzxkn+EHKov5ZSjrJD2kdp9QV8rONQYRyx2/WsHd3It9krtVB2hzi1X
	 7tsW3OEMU95WZJvcqz4aSZRLS8FhPxwfp7Fm02w523DKhSK/WXzkzqSacDK8ebuXKiw6k
	 y0n6AtPq+m9gfhNCn9t8AaVOHsvpWzF6aomhDnLUOoYhb0VP9sX/mLLgqdPXTv5YkCnl0
	 zbGEnK8bQe2c07AQ+r3Rq4tWa+z7RfT2vTWFHprAh2OhJXjUnjGfVGlo9bHsFvyF5eDPh
	 ycgouimpqK4nPmcl4SdR/UxVtJJ0vGSOHRM/abdxaMKv+fdvYJvAUJQhJoBdHa4TwSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mfGsiqKI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9E606A8C0;
	Fri, 30 Oct 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mfGsiqKI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3AB1F0093A;
	Fri, 30 Oct 2026 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357531;
	bh=49o1u1ndEVYCRhdoNrt4i607A2DEAQbKE5/U9XS515A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mfGsiqKIDIm2/4TYmCaARm0JPoJPIAzX5errHQP7wswXDpM7bq2NZl3nvafZw3MuB
	 LyhIrHR8l7uXCUYvyLIXcpjzM98TmBwhstgCkZ8qkfCPcwC6lrRj8QnEaUOBP3xTY5
	 V1XHA1s02o5vUFqn80wHuWMalQnosLbTrSX0vnZFsX7gPu4Q20F89RA5Os9z3BjDwT
	 p7hNDX+vjh6bToH4eAWxaKytCA9nNY1NKBWny3GydLKDtAg8eU9a3PkPQOy/CeORQU
	 0Of0b+2Olj4gZH9ko+iEy+q31jGfZ1X+IIRul4Le8CdOJIAlQ+JYRwMGuOy6+YWhDa
	 hkFGENlCTQQQQ==
Message-ID: <79b1da71-7a17-4d75-aa79-ac1a18303b2d@kernel.org>
Date: Fri, 30 Oct 2026 11:52:04 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, colin.huang2@amd.com,
 Carl Lee <carl.lee@amd.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com>
 <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org>
 <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2026 09:41, Colin Huang wrote:
> Krzysztof Kozlowski <krzk@kernel.org> 於 2026年10月29日週四 下午9:43寫道：
>>
>> On 29/10/2026 14:38, Colin Huang wrote:
>>> From: Carl Lee <carl.lee@amd.com>
>>>
>>> Add eeprom device node for NFC adaptor board FRU.
>>>
>>> Signed-off-by: Carl Lee <carl.lee@amd.com>
>>
>> DCO mismatch / missing SoB. Please read submitting patches document for
>> further explanation.
>>
> 
> https://github.com/torvalds/linux/blob/master/Documentation/process/submitting-patches.rst#sign-your-work---the-developers-certificate-of-origin
> 
> Thanks. Krzysztof
> This means I need to add my Signed-off-by to each patch, right ?
>

I am sorry, which part of submitting patches, which tells you what is
necessary before you submit patch, is unclear? Please go through all the
steps of submitting patches and analyze if it applies or not.

Best regards,
Krzysztof
