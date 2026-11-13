Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581875;
	b=OFX7cRRMltAUsWz76A8M/EzH+1zSMwzDIpOVZdWJ1rv8S5L+nAqVZfiikmUmvc+ZMvDq
	 SfKhmgxl1HKLq4RXkeEvzPBj44QsPql+xaLWocmQQ13fdfkhTsgvQeS+brXxqgyran8F8
	 WTsxT4RzZUytPBZSsxhRZ1qgEeu3AmDpW/6Rgf1SiY0ye5LLF6HYqoNzJqvwkzA8P4SqM
	 JUE1QOd/xS510ivqyesMD4cawwAHvuLVd14qz77Hubc8bjJofBCoiSwmEnOV3g4CIMaOi
	 C7c3EgEd7IkPJ03Y1ekvq99uEqMY4jefPwl60akUQhcIgoYs+es9l9Q8aj4TEgx9OHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581875;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MNEGNx8Nxxbr//T9ff/bwvhh07TTp18CTfVVXdbjar4=;
	b=jX/m1lchOYhzVOEhZVehjMc24a5sGOoIWIDp/raNxba0f8MoTFZlkLY4Bfmvz4OjOxIC
	 f4Kgg/xEGKg9m263lEd8PGC7LRa5RRmBwEGYl71X/C8kPln/+Vt5mqXghzi39uhIZ/lD1
	 hy0yyAlOJZNpyOTMyg0kdktcbh1toVlqzYfC6YTLZ3+7/zrX7rkpLZgoGVvhr1eKCJ74d
	 WX9YRibU4F8oxZ6/lQpEDhXR9UDLCZ7Om51EQSjHOtSA8dYNfuXQkQ6bsmhEYOP8XMSHq
	 ekkt/W1H8JB/w2N1hacghMge254g4RemH1zXyqyDSViT7cu3SZve3PiZ/GbbxarLwGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KaNa+Mkn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F6606A330;
	Fri, 13 Nov 2026 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KaNa+Mkn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871CF1F000C4;
	Fri, 13 Nov 2026 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581875;
	bh=MNEGNx8Nxxbr//T9ff/bwvhh07TTp18CTfVVXdbjar4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KaNa+MknasCg7079/xexkYZRSd4mlzXTBjFK5ZW8m6/qvxqs3I+Cefo+Hfbertz3p
	 ilPgR7qZO30ErQCa2xGXhfk9Gh/awpXX8ViFvj+OAwgIHhW6euA+w9NSoHZJChp6Uc
	 nW1l74Bm3mvv/Ro4uMaFlhTJWo3yZgWH25pqMpQxl4tz5QKEgLFIOrIi+fJ5DYGxcY
	 TY/Ejv68yxscP09zCt1OIbg77V0OyoR5NrSXyXBrBSkdYjVoG8iU/Kvbqt+iuFquQG
	 HNKrK451BuPm21Ns0xN3oM8L+zatjlxjMTlVnxLYQBA2D6fXGRfEi+I7E+q6sP2BMa
	 nxMB1dByzDZYg==
Message-ID: <cdde4ee5-930c-4982-ac79-ac52570c37e9@kernel.org>
Date: Fri, 13 Nov 2026 15:57:49 +0100
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
Subject: Re: [PATCHv3 2/4] dt-bindings: edac: altera: agilex5: document new
 edac support
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com,
 niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261112215342.2476801-1-dinguyen@kernel.org>
 <20261112215342.2476801-2-dinguyen@kernel.org>
 <20261113-laughing-crouching-hawk-5bccca@quoll>
 <2440a2e6-5d06-4642-b722-ac3baf5b8097@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <2440a2e6-5d06-4642-b722-ac3baf5b8097@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2026 14:29, Dinh Nguyen wrote:
> Hi Krzysztof,
> 
> On 11/13/26 02:18, Krzysztof Kozlowski wrote:
>> On Thu, Nov 12, 2026 at 03:53:40PM -0600, Dinh Nguyen wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: altr,socfpga-agilex5-ecc-manager
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          minItems: 1
>>> +          maxItems: 7
>>
>> Why is this flexible? Wasn't before and changelog explains nothing.
>>
> Sorry, but I'm having difficulty understanding your comment here. 
> Doesn't the minItems as 1 specify that the 
> "altr,socfpga-agilex5-ecc-manager" must have at least 1 interrupts 
> specified, and up to 7?
> 
> My changelog also specifies "up to 7 named interrupts".

So is my question: why is this number flexible?

Best regards,
Krzysztof
