Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664031;
	b=f7PTi78v1NTAJZRRHD6wL232YjJ8zCAgagl+8U00bLWIY/yEejPVrLIgKTAnKk/9pOZx
	 OWko3Xio5MoPCm7xPJaAPJ+g/KF0amh3e4ubYOdcZbxApM8TsX61zE0WO65emZ7gkpq1w
	 vB1o+wTimTCjL7YYJ1TdK8a70IXrV90IE3Fm4yNbQpy/uAb9edQPwsqXEcAkX/PaauVnj
	 5B6ieWwQRVW9TLTeS0bjZNz7CB62FGLdnmu+mb6GGwb3nwPPL7EBfYqxvCLNmltJvYYxC
	 X7ouWYPm5KytSxUXuHv5cdg+yR51Z+/UkalVV+u2wqskyZzP3bTKJf+c6u+ChI2lbZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664031;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HNqJmCyShDCVTxc3ETqjVTExQyidIL/udlP02+wEjXY=;
	b=xd1GXFbDbZWEO0ynGvn0AcLz4an3zbE/+zFI2ENposJNleizwEu4ouYCOj/k+Vuii0dz
	 nk8RkY7hPczL3apZOdkrWKDujsAMGV6CL29/UIghJU6AjBcJvCIsgbxZqE4badOzbLOkd
	 ovcqHUvV8lWbEyJ/eqjB/Q3X1fq/wXXWJv7CyqxuqLgP9qA9nW5xQR/4wnCQXTc0spIYR
	 V6wZz6RYayZk8hL9ZBna8Dz496dyoZSnh3+yGRmkK2r5ZA2aodo0XTiccXmQVb86ItMEn
	 Odd+jnGb51qjsRvnscCwn0UeKvOueCIrZ+rkpF/hkc/lfnQIkpWzlvn/I5l/XtiRiWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pe7RlR1i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EB5606A319;
	Thu, 22 Oct 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pe7RlR1i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7D81F000C1;
	Thu, 22 Oct 2026 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792664030;
	bh=HNqJmCyShDCVTxc3ETqjVTExQyidIL/udlP02+wEjXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pe7RlR1icts9Rk1OXpXCTrXq1y+wTCGxzaBgxXglxChD/USanzVnLGA1lZ+92LQb9
	 0m9Ouc/7KJwgEpd2TZp9+lcV/xuT4lltHTHVHA0HHkDnOa2j5QE7LKGpKu8YW1Nrq9
	 Bs+4lIbiPg3+/jG7v1qgeJQDseqD7yzHczMJLajujrTWe2tPrbMhmwxKHqGj/Q8xaS
	 9TOQ85yOUehbBIi+J/muq1+L/3+EqoIRb79jn4G0Wqpzifp1I7nXDEfL7qtRuvetF4
	 WC8u4jq6QZd2+PZVrj1cQe6JXtm23CRJBQymZiNUFbMdEjnG0miMOh97xeWWPii6bf
	 B4iiEcG494xDw==
Message-ID: <1e3ad9e8-cf97-4553-87ae-98c22aa974fc@kernel.org>
Date: Thu, 22 Oct 2026 12:13:46 +0200
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <87y0br3zln.fsf@trenco.lwn.net>
 <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
 <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2026 12:04, Geert Uytterhoeven wrote:
>>
>> This is a real issue because it is very difficult to spot - your commit
>> is applied, but you never verify whether is applied THE SAME way and
>> maintainer thinks everything was applied cleanly.
>>
>> If (1) happens and patch does not apply, the solution is to ask the
>> contributor to rebase.
> 
> This happens a lot in DTS-enablement patches: multiple people are
> working on different devices for the same SoC/board, so half of their
> patches insert new device nodes at the same conflicting location.
> Perhaps we can teach to git how to handle DTS addition conflicts?
> 
> So your solution is that I apply one new patch every day and publish

We speak about special cases, where there is a conflict thus the patch
does not apply and base information could the maintainer rebase the
patch. Only this case.

> the result, and ask all other N-1 series to be rebased? Obviously this
> not only applies to queuing patches, but also to applying patches for
> build/run testing during review?

Unfortunately yes, because every other option I know, so maintainer
doing rebases, is error-prone as I see every two months. If you assume
that maintainer can be trusted in a way that they will do the rebase
correctly, then well, welcome to burnout world were we barely have time
to go through inbox, not even thinking about doing this diligently.

If we had git-forge workflow, then this (contributor need to rebase till
there is no conflict) would be even an obvious requirement enforced by
the forge.

Best regards,
Krzysztof
