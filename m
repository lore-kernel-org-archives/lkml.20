Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086091;
	b=QEFW9Vvpob0Vzb/GuuwAveK2DNpkj3YgfCi40pcnApRFxXq3/nGXZCWtzkRdWE74L7UX
	 OzT1h/LnjtVmsSxeNmk/PDPrhHH2+yEemULQ8sunFiOPI5B5AwHXOBwhku3IJLACCGCwF
	 fIPRQRTdkxMNeirgfH/KTNPCmchRfawC88af/W8ZsnZ0F0DBeY/eUj4rQ6qZqfkGl8hj+
	 goKVz0JvL1UzdBOkS7aJG7Pa7bhfBa4uB7N4yK8gy/5DfoOT44sKhtIe2ok+Dw3/QssQo
	 BqgDBVVsp9m61JeZDvzqFHEUW+Sg57YYYCTfVoCVxRgIzACi6dkjz25SB1xZN+wgsAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086091;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rMoN6QW9WraNNNAxN2SCzxxv/n4k9iPkUrgSrddfZ5c=;
	b=DSvioYDVVljr4NUCORAgx9GRXnCCQsHngB+C7+LM99cTdfKdTBGK8FHTvgU2x5afVUD8
	 lH44WTItx1C69PME8/4vStYklckVARarWMqcoboeWqK9tuFlv6PpUZ7J6510SpKQDRpK0
	 c/oDXszHBIyDE/VJNbqVIRG5PL85f9HXbCJdKdF6kMFVRku/j9iJxqJHZnc/GBpjqvgEF
	 4/fxLTpcHkrRMbOPuElpO+bU6MuDorFSgusJLExLCWfDx3WMSLVk4b0tTyB0w5NxPudi/
	 7JYrAPOY6TtnHifYZYxZu8LqWfmWHvX+s9k0FF2/X1CPZ0buJUxhigMil7xXo3cBxNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i40tytRH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90681606A31D;
	Tue, 27 Oct 2026 07:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i40tytRH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC921F01825;
	Tue, 27 Oct 2026 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793086091;
	bh=rMoN6QW9WraNNNAxN2SCzxxv/n4k9iPkUrgSrddfZ5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i40tytRHxLze3NangBdEjwfJrnEjDmuiYhIp6GeysGdoQ+h7PE3wAERE+pzaWloQk
	 zCQUbdkQ5XduDKoDefD2mzQcl6EKf9Nb0oxJ5C6W5koD96THYjCmWGxnCayg7Bzdcm
	 +Rm9QEdeQsinLOk3Gzy6fvgu68Imu1kYtAHoYcwYSDYQTCdgEjzE/ltnaZbup9FMdl
	 /oLaVQ/7Wza4ltslk67SzOoSq8qQQIzGpRGtY1/v726Pva7cAi/XeiLBrhMXUQWeo8
	 W7IEIISUtoh6SAZXE+ojNY2nLXAO1Nbc4VHzDOZy0yiQwjLNqgS018jaUPp980BQXa
	 oOu47+S9giQEg==
Message-ID: <43ef0af4-0594-41f1-9ad3-499bfb3352a9@kernel.org>
Date: Tue, 27 Oct 2026 08:28:06 +0100
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
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Rob Herring <robh@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/10/2026 21:12, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 6:55 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> All these tools should just work on top of linux-next. Requiring people
>>>> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree" is
>>>> pointless. I understand that base is helping, but helping and requiring
>>>> an obvious information just do not go together.
>>>>
>>>> So again: base has ZERO meaning to the maintainer process. It has
>>>> meaning to tools, so fix the tools to work on known and obvious trees.
>>>
>>> So what is your proposed algorithm to apply an arbitrary patch when
>>
>> Already provided that, so to recap:
>>
>>> there's no base-commit?  Including any historical patch (from
>>> months/years ago), patches with dependencies, etc.
>>
>> Dependency is something else, but for every other patch:
>> 1. For testing/CI: you apply on top of next
>> 2. Every other case the maintainer knows where to apply it, because it
>> is his HEAD of next-branch.
>>
>> I am repeating myself, but I really had no single problem of lack of
>> knowledge where to apply a patch as a maintainer or reviewer of some
>> subsystem, thus maybe I do not understand the actual problem you are
>> experiencing.
> 
> Look at our DT PW. There are numerous patches that don't apply and
> then we silently don't test them at all. Here's one example[1] (3
> actually as the whole series doesn't apply). The more base-commit
> tags, the better. If b4 can't apply it, then I do try just linux-next,
> but is that today's, yesterday's or 2 weeks ago? That still doesn't
> work sometimes.

I have doubts that DT CI would know these mentioned bases, unless
everyone develops on master, which is obviously not possible. It could
work if CI has all possible next tags fetched, but then I argue that
without base commit such CI could apply to closest linux-next tag by date.

Best regards,
Krzysztof
