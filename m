Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657800;
	b=m7M8GRdvduW3Oczu8qwwDYTNgbIg+fI52nElJ342r6M21u4yXPXydfWz854ETsNr3vQy
	 mETuElpvC5nyYXbxnKBTwbSx41zGuLZjfLNQswrYwkbyBEGN2oTQh+dH2hArVQy07sv+d
	 pWr8PrWl1bkz2taTEj6j8OYrnN1Qm/6RcSLS78na14hzaeMdH9tBx+lnkJwJnZ0EkjSoC
	 eahEkt50l3kuTu2YL8Ug4SmgXsWuZtDL+gempdi1j3fWdyFJR8PW2lNqYvg+Di/UQS2Kn
	 TvmOSbcuoGnkp5tCLr6jiTkvnyEbivNoh4bqLCQy4YUxQUA7gVhaVsfJUn4penc8LMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657800;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HS8s5tS82JZp8M/M5RUUnontJnuH89paZzRJuQwV6YU=;
	b=StNleT5CMG20rRRSyBVSuIwSRlf6jG9pT1k5Xi6WWUjpudC4CoiG5pBnumLXa6e4fdfn
	 MqLtCFgBclkEbhmtoS8qwUTaeJcNtxne7+YsV2ch7fzUb9dZhqrcSROMh8QnSfw2CU8BZ
	 pNQFSG5aLTY7gugCmFpn2mvbwrwk0z+dGZ+LRK+siSyaD5PzpxaSD1JPSxWwVGG3jFbcz
	 NBGwnR+qW6tQwD2ssCip6o31e4FENdBZxU2vyurwtMn5Op2eFSIwJCTBDLIcja+dMKQWK
	 BMD3eL1GPTYSDRvqfXWw0SL7am5AezLE4StSVfXiofE3AW0M28AhsdECIXo1a6qNj7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZ7PRCg6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA174606A319;
	Thu, 22 Oct 2026 08:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZ7PRCg6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1041F000C1;
	Thu, 22 Oct 2026 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657799;
	bh=HS8s5tS82JZp8M/M5RUUnontJnuH89paZzRJuQwV6YU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SZ7PRCg6El4HIQ85zvruBKLWr2uPWjMioyhAk0EYUyDqYdQs1BZF/tCdE/HHos7Nu
	 F1X91QP43Y8QkfJ9FJAB87pEIkte7wJq3YYDogCzxzM1FYiziQ+xdKqv2cO/vIq9/G
	 fM4KhzMayn/8usCObDyIYPUMG9rb7AgQTCr7cm93eOGOwOmlQGwRVejrWcgxDei4gk
	 2IdeTlC/GnZF22+dFbv3MRjTeph4D1IGOLJ1q6+FFHpYi53SEdKyOGurKvKf/+u/ZR
	 x6svmChqQrMRxlSDZYvpMwj4VE/CirOT8+K+solVbo5dg1Wd6aL3jQjjglGZloA8ZW
	 onMD0t/QjKknQ==
Message-ID: <88eae369-49ba-4581-beb7-a4ff22f43555@kernel.org>
Date: Thu, 22 Oct 2026 10:29:55 +0200
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
To: Eric Biggers <ebiggers@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org> <20261022072508.GB1857@sol>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261022072508.GB1857@sol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2026 09:25, Eric Biggers wrote:
> On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
>> On 21/10/2026 18:32, Laurent Pinchart wrote:
>>> On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
>>>>
>>>>> there's no base-commit?  Including any historical patch (from
>>>>> months/years ago), patches with dependencies, etc.
>>>>
>>>> Dependency is something else, but for every other patch:
>>>> 1. For testing/CI: you apply on top of next
>>>> 2. Every other case the maintainer knows where to apply it, because it
>>>> is his HEAD of next-branch.
>>>>
>>>> I am repeating myself, but I really had no single problem of lack of
>>>> knowledge where to apply a patch as a maintainer or reviewer of some
>>>> subsystem, thus maybe I do not understand the actual problem you are
>>>> experiencing.
>>>
>>> When I review patches, I often need to apply them to a tree, mainly to
>>> see the context, but sometimes also to test them. I have encountered
>>> many cases where the patch wouldn't apply on the current for-next branch
>>> of the relevant subsystem. That's often because the patch had
>>> dependencies. When I'm lucky they are listed manually in the cover
>>> letter with a link to a branch, but that's far from being the common
>>> case. I then have to ask the submitter to provide a branch, or enough
>>> information to recreate a branch. Having base information (base-commit,
>>> prerequisite-patch-id, and possibly base-tree) would save me quite some
>>> time.
>>>
>>> I understand your concern about maintainers cherry-picking and sometimes
>>> introducing issues as a result. In that case I also prefer asking the
>>> submitter to rebase, retest, and resubmit. That's not what I want to use
>>> base information for, in my case it helps with the review process.
>>
>> That's valid and for 95% (guessing the number...) of cases will be
>> solved by having linux-next as a base, thus requiring the base
>> information is redundant. It's just linux-next.
> 
> linux-next changes every day, so "It's just linux-next" is ambiguous.
> 
> Without base-commit, the workaround ends up being to use the date the
> patch was sent and various other information to try to guess a base
> commit.  That's time-consuming and unreliable.

No, you just apply to the latest next. You don't guess. We speak about
the case of reviewer, so person working with the kernel, thus probably
having not-so-old linux-next available. If the next use as base is old
it won't help you at all, because you might not even have it in your tree.

Best regards,
Krzysztof
