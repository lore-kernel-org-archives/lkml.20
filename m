Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866675;
	b=JhVPRGvZ56O2m7t+5YswlBZEHYX0HMFwLLuT/uJqiFzs25lXBgtm5XfQGYjJbXP5bV0d
	 tHH/EtkLMGKt7Ssq8+aPH9118Kq9U4EROePqYsIVr58sVmNPC0kbPgZc4dG9XtdxXm85U
	 n0gV+bOS0jbN0VQacEWPwDTv2tdH4kBv5teg3bVbyQg9QVSuvXDM2W41bcmENH3+PJDMF
	 pI3uHCXns5zJzm4dK0V4GdBtclQQzcgeSTpz/f5iVltzlKL4aRF/IV+tDOPFYWyxHWSij
	 YhTrOgsJ46D+dCQbCqoRPkWvsG53ouI0X4eUIOkgJWzdj+lKrv/THklyusZo82iE/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866675;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0JhM2gKSuMdzmX27u5VspaNgfhvoOewOCNbgNlKO2bE=;
	b=UOsXsik/Z485HuJV0YHpL85EaM3v+19Ko5xlicaLQOdmI+uuOVs70Wou1xuMbi/wJWNF
	 b0xL0kJrAiaJfKAvETTVtdBZ+9vYWGBSVhxG10mV3FmBSD0Byq6w24hnD+AlMYzyCIUQc
	 xWXeOlj7n2K5JLpuGETg1aP20AxcEwdZA072zPlQF9Hnuy8dRdo3Pg1nFePdPlvwub8hi
	 4MN6rPKkiqk4kMg5yoo0I9yelx+FkgZqAHQk7OhmOZ7eQRj6eUeA4cMji27Humu25VzMu
	 kvRALtdqfr11cF9y0lDeVOIt4xUfCVyoHYuvRDdsp6Oz8Ds7lKSuvI4cYj3MlEzdiXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhFxYGZ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01F606A31B;
	Thu,  5 Nov 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhFxYGZ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3090B1F00A02;
	Thu,  5 Nov 2026 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866675;
	bh=0JhM2gKSuMdzmX27u5VspaNgfhvoOewOCNbgNlKO2bE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dhFxYGZ8WNNmIhpmukagi66w0huKNGHliWqlqucR2aJ0x/Zy1SMAKrLvFowtzZh90
	 mS7lDWbCCvft2iZxkh11xUSpfiPyBDCdNaAvA2rpkkKYLTRY5RR6eI3zo6NmyxKdsA
	 zWAXsOFuoog35oJVdh3AB2YN3jPHkq0hg885hvLJZsY/S9FuIwUjJwj1FKCYl0kR+y
	 nX0x1sOUUfp+Z8apxh6jsH7KXZPcySM05VaKEnpYz18fcCCVBjLAEFYIDZkVkbteUZ
	 fcbYBe63WVXz/Si992zB5466lprxLLF9BAyWcRSFmVdmCmZBhhmKpvkOG1jGe3A1Dm
	 fCbpxlIvITmfg==
Message-ID: <b81b8404-572b-4ea4-91ab-6e201f0352b9@kernel.org>
Date: Thu, 5 Nov 2026 09:17:48 +0100
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
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: stm32: allow TAMP nvram child
 node for syscon
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Simeon Marijon <simeon.marijon@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-2-f65908490cf7@foss.st.com>
 <20261017-valiant-exotic-heron-c0b6e8@quoll>
 <ef5bfb63-4e57-49e0-a1aa-81b5de14a36f@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <ef5bfb63-4e57-49e0-a1aa-81b5de14a36f@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2026 14:43, Patrice CHOTARD wrote:
> 
> 
> On 10/17/26 19:52, Krzysztof Kozlowski wrote:
>> On Fri, Oct 16, 2026 at 05:26:04PM +0200, Patrice Chotard wrote:
>>> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
>>> exposes its backup registers through an nvram child node described by
>>> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
>>> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
>>>
>>> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
>>> reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
>>> "make dtbs_check" fail on every STM32MP TAMP node:
>>>
>>>   tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
>>>   'nvram@5c00a100', 'ranges' do not match any of the regexes:
>>>   '^pinctrl-[0-9]+$'
>>
>> There are no children of tamp@5c00a000 in
>> arch/arm/boot/dts/st/stm32mp151.dtsi. How is it possible to reproduce
>> this warning?
>>
>> Are you using some other patches bugs as a reason of change in bindings?
> 
> Hi Krzysztof
> 
> yes, in this patch [1] arch/arm/boot/dts/st/stm32mp151.dtsi is updated
> that's why bindings need this change.

You cannot use future code as a bug being fixed.


Best regards,
Krzysztof
