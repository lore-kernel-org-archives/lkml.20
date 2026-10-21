Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598408;
	b=BNdSIVeZGgLeVBHPY3GKnUktnA2KE5AQw4VcEEpxWz+Fmg6MhFoULyNEDaGW47j+Yg6r
	 mSDXw+LHKjfXGkp0/6/NwxuhHqxPzhXX3tLJjG62J45I3FH0+nGPGyAuqdyY9WsYtlcoa
	 z5yQK7S3qvidGrU2D7+zfCJmLvzhgTJvSjhGkQTMQ4Z4mzhDPzA1DoEYHUj64aRwGeF1J
	 sDLRahAH0oGUrt3zNeiVKVOqsQueOTrx3NhmBZrbIc0gG9PAwbLv/eYsueVN1Yrwwwev2
	 uYl2nOEFSmSwVWbwzT9SCgDkRCDWIsVboc5Z8DPcydRBh1mYwvBz0YnFMryF9vdDS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598408;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9SqXtViRtGm7JEuHgSEjRHXF1lGpWBdC4iVKnbS5m7U=;
	b=HwzvBvKQfJmVdO9qTzVB/F7cg0jcjA6qFGtiUlktD/UHwJNZTblOfpNzwoSNK9kcI6sX
	 QKl6KHl33RGg7G5FLQ7j4fh3NWaWeyim2YV/p5V1+ReVEg+G2Q8h6zszGHOK8ucvfNw8c
	 M4X1a5NOSb3nDKoQpoGI8QaB9dYviWQ3KqNNd9Buba9v3yMPRIv3gZkkSjy+0EFzs5Gsg
	 G+Kd/K87kGZqZfexLbIekzBmgcoEub/QqEHNbBpgHq8q59jnzKdQInkbBUhxy2iSNDur3
	 hXp3Zy7UNSnszxkCS0jRUDptT91I1v2RNKTLoqbM5u6EtOySIsHraEoHmqnnkmly+Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYHKFdI0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD378606A31D;
	Wed, 21 Oct 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYHKFdI0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3774D1F000C2;
	Wed, 21 Oct 2026 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792598407;
	bh=9SqXtViRtGm7JEuHgSEjRHXF1lGpWBdC4iVKnbS5m7U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=YYHKFdI0tFg3gscTYD/+fS2GUihAgW+EyoJnGT8r1b2scz9Vfdcey3gdQCHvsyHhw
	 vSTkw9Muwrb/TG12o1jkyqosVK5Wu4qG8pUcCuT5t5gtABI/jmprYgA4DtbTFViIeS
	 ud0XAAjLmfDB3WBgtwJbrDgSqJr4d26sm36Gc5cZwW19WbVrYsSkHlDmHJ2FCLB2bi
	 Js32ce6vPjPdADunjxyJOy2rxk1hxSpJYmOIg6r1NKvUiqdsDRgEzawFB2Hu3tUCUc
	 Tv+JBDGf8KWemoEoVwQuZa62rW+fFbSy3YnkjvwAKgr1+MDZ78U3o/sl0spHj1xf/f
	 B5U52SnxG++Xw==
Message-ID: <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
Date: Wed, 21 Oct 2026 17:59:19 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <87y0br3zln.fsf@trenco.lwn.net>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <87y0br3zln.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2026 16:19, Jonathan Corbet wrote:
> Krzysztof Kozlowski <krzk@kernel.org> writes:
> 
>> For many of my contributions base is obvious and not needed to be
>> explicitly defined. For all the patches I accept, answer is the same -
>> base is either obvious or if not and patch does not apply, then the base
>> does not matter.
>>
>> Requiring it is just bureaucracy without actual benefit.
>>
>> The only benefit would be if maintainer COULD change its base to apply
>> some patch with odd base... but this cannot happen. Maintainer base is
>> fixed - it's the HEAD of his development branch for given category of
>> commits (e.g. DTS branch for SoC maintainers).
> 
> I fairly routinely get docs patches that don't apply to docs-next; when
> I'm in the mood, I'll try to figure what they *do* apply to, then
> cherry-pick them over.  Base information would make that process easier,
> and even automatable.
> 

Some maintainers do that indeed and I propose not to. Every two months I
see one of my or other folks around my area patch which is being changed
in incorrect way between mailing list and Git. Change is done because:

1. Patch did not apply cleanly (a lot of simultaneous work, so base is
obviously old the moment the maintainer applies such patch)

2. Maintainer tried to resolve that by applying to the correct base (so
followed your process) and then did git rebase or cherry pick to his
final development branch.

3. Maintainer is overloaded and has no time to investigate whether
rebase/cherry-pick from above is truly correct, except building the
code, so every two months result of such rebase is wrong.

This is a real issue because it is very difficult to spot - your commit
is applied, but you never verify whether is applied THE SAME way and
maintainer thinks everything was applied cleanly.

If (1) happens and patch does not apply, the solution is to ask the
contributor to rebase.

So sorry, but the proper base rather encourages risky patch
merging/rebasing, instead of pushing the rebase problem to the person
actually knowing the patch and having hardware to validate it.

Best regards,
Krzysztof
