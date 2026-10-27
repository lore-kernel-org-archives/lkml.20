Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111501;
	b=oes1fqGYBHKuFJPyfaIS6a/Gmpd3G7SGA+T/M0J342K2ygQeVk8Leh1lG4psdOdr5GvN
	 B9unJIjQlHDQx8s1B5rIfI9qoaB0OK0AkwwxKAoNOq8D56ttNAY23bcuccmhrw6HosNlA
	 LgVHfvCd6v+uc6mFUe7eZXcrA4dwaeVPxK17AzwHxWvarXM4qkZvIzQOc6ugMqXPzJqGP
	 Hg1TPaPYS1lDdbclFQRQTumyA/cV9Wb58JeWs2mSVAFXbeS4E+SQ0w8yhBa4J+w3ZedRs
	 bh9KJ5jxH6TfTzZMC+/zCEpcwaltkb58YS8Sus3vvdp7KrcPucKsOAWYKZsSWrdOJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111501;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=i2u6gcCtm/EYo5bv/g5RITQ9o26G/HMKGcPni7+jcg0=;
	b=5sy/NEc1L41GwO7N0Q1ukhdruMbLA/pXV6mmBbK3f1xhKOcGBgFv4cGmDyVyur+I3mWi
	 cwflU5jRWlq2VIcR88IpBwzcRdnuQxhVSc5fdA6aMiIdFGekDEdgT4U5wve6jLRHj47CL
	 HsQy+glFUH2hBiIMnZ4w5lQWokq8WTwUJcGvBQdDwUMS18LFh0hIbqA5fYGwXNcvAp0of
	 M04qml0Y7+uqE6hIPDJj47aF/RLx9KTMmkGOa/NZfxVdb/3tMQzOg8KpJxats/osC2M2w
	 +/B6fxDjKwM4Sl9xC9LjOeN/zOGYGTw22dJzYBeA6y+1SuUULkb62QF7sxw574/8PBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OerPZkBc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393C606A31F;
	Tue, 27 Oct 2026 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OerPZkBc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B591F01828;
	Tue, 27 Oct 2026 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793111501;
	bh=i2u6gcCtm/EYo5bv/g5RITQ9o26G/HMKGcPni7+jcg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OerPZkBc97eRxyb9Ynr0vIUCKkVL7HB1hmsg3nPZZczmUsv+xS7EAg0NrmKXyHy2V
	 IM1AHxWXZNhQrM7Ii13rvmTKd2U/rW06ruuQWrorBtHrNJNXTx1kNPIqEdJeZv+48Z
	 JMT8NKiEY+WNoDW4zUtLgxoy6MXA7TSrCOF9+a/S/Yfdnc2m8vhg91P3kn8P0rAldc
	 KfYA34g62u0ThwZWWiu+A7ODU46vZjyvKi1YPdPHK0wRWbq/PzOqUVjIzePdkv07bn
	 X28WsCvTMkh7kOyfOobyR6OQXwq+PAjbGvLd+kHLO7JsrmndIKdKCBntrsWIwDMHmS
	 wVVh43cIrIVCA==
Message-ID: <8230fb00-b1a4-47f0-b9de-5d0fa42e9465@kernel.org>
Date: Tue, 27 Oct 2026 15:31:36 +0100
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
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <3f518c8c-2950-458e-95fb-5b282db4c384@kernel.org>
 <20261027122952.GB2133989@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261027122952.GB2133989@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2026 13:29, Laurent Pinchart wrote:
> On Mon, Oct 26, 2026 at 11:48:16AM +0100, Krzysztof Kozlowski wrote:
>> On 26/10/2026 11:40, Laurent Pinchart wrote:
>>> On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
>>>> That's valid and for 95% (guessing the number...) of cases will be
>>>> solved by having linux-next as a base, thus requiring the base
>>>> information is redundant. It's just linux-next.
>>>>
>>>> When patchset does NOT apply on linux-next or maintainer tree is
>>>> non-obvious, the base should be provided, but that is only "if ->
>>>> should". I think the proposal here is a bit different.
>>>
>>> What's the downside though ? As git can easily provide the base
>>> information once configured to do so, what's the downside of asking
>>> contributors to include it ?
>>
>> For me the downside is that if you require it, half or more of my
>> patches would be rejected
> 
> I don't think we want to automate rejection of patches that provide no
> base information, and certainly not as a first step. The goal as I see
> it is to encourage people to provide the information. It's a process
> that will take time.

We already encourage that in current wording and b4 automatically
provides that.

If you want to encourage, do not make it a requirement "with only rare
exceptions".


> 
>> and I would need to add unnecessary step to
>> remember.
> 
> It doesn't have to require manual work every time you send paches.
> format.useAutoBase in conjunction with specifying upstreams of branches
> helps.

But then base would point nowhere... Upstream of my branches are my
github branches, so I always know what is up2date against my github.
Otherwise how do you track - with multi-machine and fully backed up
repos - whether your local changes are updated against your backed up
branch on github/forge?


> 
>> Since this step is pointless - it would be linux-next
>> (assuming in the first place that this is what the author wanted here!)
>> - it is a waste of time for me and potential resubmit of series, just to
>> fulfill requirement which brings no benefits. So I have downside and I
>> see no upside for my case, when you require the base.
>>
>> This might be affecting others as well, but now speaking about my
>> workflow - I have a lot of independent cleanups, which I stack on top of
>> each other, sometimes series, sometimes not, but stacking is important
>> so when I run `make W=1` it passes.
>>
>> What's more important, I reject the entire reasoning/cause of this
>> change, which claimed you cannot review and therefore accept such
>> patches. It's simply not true.
> 
> That's not my claim.

That's the claim from commit msg. And wording should rather be "which
claimed one cannot review".

Best regards,
Krzysztof
