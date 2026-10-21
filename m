Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597753;
	b=l1UgaBvGpnAacuOAvTq0vswj+dnQ8w6GDzAVawmfR6CctKkcwzAOT0UdFmcE4/tnM2uw
	 Gp0GUPXAPyvNZoQlyaCRQ4kuyGB1ecEnnreHx/BSHsGhdCjzD/kl7/Mpcy3MDQqYguju0
	 0DyPkl4542Boaj78pnwChMoVVHIzbhdu4N7U8INw+5iC+3eHtUsnjkqm7BXCqX2CoLIRM
	 +ViTuyou+FGZ07sR0D+C7xvYg1RjKcwFDSd65EXGZnrpeKQXBuJ47tcwISRfkj8Nd5gcG
	 kaMIHS3NxSL5s4QcOHql7FxUY4VDH2+K5wpO6UfF72S5ULHx8YrkRdNYEVy+W8XPznA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597753;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PlIfgFCUjfT46EbRN/4oDU+8in7u2v22Ipk5f1NaKgk=;
	b=CN3OK0qf9lwtprQvUz2PYPfPbZkg8CCYHZbn3Sth0BkGxoUf4oIB5sk2Zelewiqzy+a2
	 xD9d4spT0hKK1nzOfGgsMRClJgoS03l52N6ZgC3dx9w9vUIotC7Egq6kEo1mB6QojBpoU
	 I6sLnS92L4zqUEVHHJ2N+40O+6Wi/5Bx9tbd9JtsDJctOJK5BV9W75zsUcXeAGdAvDdyc
	 o7zMOlwXjUb+dCK+6JRk++yCKoyNiVncD6XTo7IxpiQ8jtUswqVi62Oi1SVJIySaZwwx6
	 WEEtY7JL+rshEqeidSMH25qlnYchUWd83kEj5ea61EBfbuqFCIIbl4u6IeYWrWAkcKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NMqrhk/W";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37288606A319;
	Wed, 21 Oct 2026 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NMqrhk/W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706471F000C1;
	Wed, 21 Oct 2026 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792597752;
	bh=PlIfgFCUjfT46EbRN/4oDU+8in7u2v22Ipk5f1NaKgk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NMqrhk/WKAhK6T206gsXqZjyVsfzeftCN3ZA5Tb5eYvjSftiz93wK4YRkXpZGFX+Z
	 zMSEC8gfQDnZbOVbjDvTCzpr5tGo9YPbYFDL0ExQqG8dl8X3WXyRFXzpRHj+LPPiz+
	 qnDV90OpUUtliG+Krtv67DOpU1673ZZE41VkdpKlwcXVopSgoG67UCOtDyd6GVQ8o7
	 weNlcI8hR+ot+BCqHIR7O8oiHRJr92y7d73eT3INoNKlCCfIbbkjo80ogSSgYBMgjZ
	 ObT0zV/BhKFUGBxxCN08N1oQ88QiVkks7+M7cBJC2o+RYqGKJW4xhiavfhvomaONHn
	 9fSoCK6XQmIiA==
Message-ID: <9aa3e170-3d03-456b-ba2d-f329b93ff071@kernel.org>
Date: Wed, 21 Oct 2026 17:49:04 +0200
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
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021-origami-groundhog-of-radiance-78baf9@lemur>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261021-origami-groundhog-of-radiance-78baf9@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2026 17:04, Konstantin Ryabitsev wrote:
> On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
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
> From my perspective, I don't really want to force contributors to manually
> provide the tree information, but it's helpful if tooling includes it
> automatically.

Sure, I do not oppose this being helpful. I oppose this being a
requirement and that was the impression I got from this patch.

> 
> Specifically, I am working on a service that eager-builds git bundles for all
> submitted patch series -- the goal is to make it simple for CI systems to
> fetch patch submissions as bundles that are already applicable against
> mainline. Knowing which tree and commit the series is based on is really
> helpful when figuring this out.

This has limitations you will not be able to solve. For example, around
SoC code (ARM, ARM64, RISC-V) are often combination of minimum two
subsystems:
1. Driver code + Devicetree bindings, being picked up by driver
maintainer, e.g. drivers/clock/ or drivers/reset/
2. DTS (arch/*/boot/dts) being picked up by SoC platform maintainer who
later sends it to SoC folks (Arnd Bergmann and folks).

Such patchsets by definition target independent trees, thus the only
reasonable base to fully test it or even apply it is the linux-next.
Contributors would not be able to provide base-commit different than
linux-next, thus that information is redundant - you can just assume it
is linux-next.

And if by "tree and commit the series is based on" you meant maintainer
tree, excluding linux-next, then that information could not be even
provided, unless patchset is split.

Best regards,
Krzysztof
