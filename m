Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563995;
	b=wDM8aqNBoQEPtXbPDM31UWvSnvLfEx/yyaAmKthN2Bs30w5ktmrtih3UIjo5Y9/mnd8E
	 GjkqkJ588KyHGGohjjMA+qVJcRxEuskYKBH+uc7Y4bY2n0gPaCO4ThQirF5LiYUbobWOZ
	 +wJm8ksLA0tOV7yXX+Dkt26UggaFqNpcvvr+CUPPNDqJsms4cdN0wYHh4EN0lqN2Xg5Zr
	 v4YGLwCaxWGtiIvmAovkgwMkVHGRgx1OFmG/Mc14ahujMeD5RieWOpRQdeUxQyoBJi0Rl
	 TtmNSqm4M5MH0ywmqide/vscgjJTeafDQXyElYG+JNpj4PS2VN4/jWFOePSUltb8wUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563995;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ElBdXWAjd5/2gZ7mZhUT7ZukISglljnO9yUGFpsfiaw=;
	b=x+wLohycPu36F8rP+THh9YMR62pnRQpjE2/isbKrLBETm50Ge6c2Mz9xRgN6dWcIBqYE
	 WhVrzGYLNp+YWvwHq+fp08VDouzOQn/VHUvjYy3iM+mrNb4wHCUrBgX4NuavEEW49JC/X
	 bZZHEeE4H/HYk9wwzTLx9pi1dQp21E7zYIhNwHdpVkTME6UKx3CkAkHmY1fhsB1Fd8zoG
	 JzN1mmU34QW6YTfWH/y299O4dlowi4fenAJI9/CV7cT1DbMHyqNRzWEB7KaDKrgp3YzE7
	 cr2LFE5PDQSW1ht+UWdYnKoGDTBa19R8cvdi3J9rIIqeBSRcnoKbj9gcFpf9+nidThg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8+9ZkXV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07908606A319;
	Wed, 21 Oct 2026 06:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8+9ZkXV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258221F000C9;
	Wed, 21 Oct 2026 06:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792563994;
	bh=ElBdXWAjd5/2gZ7mZhUT7ZukISglljnO9yUGFpsfiaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f8+9ZkXVZLN1MwnDHglLGtUQqG1MKY5z0ITTXICIMo7RupTNzpLR6cVEiM/QMDBLz
	 x2461OLk1DPHOSgXbu9NH8bV/wDpb1gaqrKU33Bjmo7F3LTDuqSgGjZlvWseIMrsm3
	 RzPWo99dBHvTgnJ7fk2+g5Fxg38vak6jc4Hx5qnv4Uhnx6UxdDgD1z5IpY2aX0pcaz
	 AvV2yBIRZlJ3DWbL6eKg9w1tRSzwL9UFO3kOAbbOBx8JpMmFl5v1dGyTJa8qtZeNWq
	 T/iW4JfYLhvF4cqLOKwT9DM4PjBSSBe4RnsU1yrmacyGVWyrtBSEotPchJ+IJY0nOC
	 cz3WFIYT3Ousw==
Message-ID: <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
Date: Wed, 21 Oct 2026 08:26:28 +0200
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
To: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261020212235.1143086-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2026 23:22, Eric Biggers wrote:
> -Make sure that base commit is in an official maintainer/mainline tree
> -and not in some internal, accessible only to you tree - otherwise it
> -would be worthless.
> +    If ``git format-patch`` with ``--base=auto`` (or
> +    ``format.useAutoBase=true``) can't detect a base commit, e.g. due to
> +    the current branch having no upstream tracking branch, it exits with
> +    an error. In such cases, pass an explicit base commit to ``--base``
> +    instead. This is also needed if git detects the wrong base commit,
> +    such as when the upstream branch has local, unpublished commits.
> +
> +The base commit must be in a well-known public tree, such as the
> +subsystem development branch the patch is targeting. See
> +:ref:`obtain_a_current_source_tree`. Mainline or the latest linux-next
> +can also be acceptable bases, depending on the subsystem.

I disagree, that's pointlessly too hard requirement.

For many of my contributions base is obvious and not needed to be
explicitly defined. For all the patches I accept, answer is the same -
base is either obvious or if not and patch does not apply, then the base
does not matter.

Requiring it is just bureaucracy without actual benefit.

The only benefit would be if maintainer COULD change its base to apply
some patch with odd base... but this cannot happen. Maintainer base is
fixed - it's the HEAD of his development branch for given category of
commits (e.g. DTS branch for SoC maintainers).

Best regards,
Krzysztof
