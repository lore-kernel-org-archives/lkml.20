Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867340;
	b=Cb2+t2l5VaJcxEw/WDDNqKmZBJZgrEb5BWookGyIdNZ6dZCXzwjG9YE6GM5ro5+/vnNR
	 Lp4jZWo3VTzr1uvNqq3OXvpgWYgl1gFVvXdeH4Q1IMOWse38TOK9BW5fdk37rjoFN+mU+
	 I3kvFgn9L49QUj5KfNLcNLvCUzCJxvR2LB12+5RSQhSjuTye78PXUCbnSnUv8VnmIl5Ud
	 5iP9roRU2FvxinMRF6paeNOV6REZbFMymB3bWUaNbu6VidwlHTEe8Rasow7J9JTmPuNb3
	 1/6Hh8KqCcy9k7x9pFCwviTJKQoXvg8uRVj3gZv9LgLzVVq+geKViQeXUPOz7L6XCgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867340;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eqK6AYA/q2397JZTSf7bv9+iN8f9okpLC5SE5H0iyoQ=;
	b=SMx2ZSnMmH3Fr/ciqVR5RvsDvMepxasDkGsjIzHwPKDQfGG4r79Pyrv3moGM4mVQo/vY
	 oNEG0dQIinbReZ+QdtoxFoWY1VjsBctDoOFvPl0DL+r/geeXKsngno14b9AY1tcb+2AsG
	 bEqutxayrJJXVSScvHm2CA2nF0yKr9IOMcEuxIXnZZrNQM3FsFPwlsQc4A4X7fug77bin
	 aVFYi23AFEGsFKMIkKBTTbrkC9++aKDpQCHoHlBzufgF9yv5FwBsY0rxTI/sanAEL53dY
	 hyiIKG0F9TL/AL+hAxn5REv74DRyOC4sDdZode/pMgwO0FuTVAzKYg0oeziiJS950ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dy61g6x0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A94606A32D;
	Thu,  5 Nov 2026 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dy61g6x0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32061F000C1;
	Thu,  5 Nov 2026 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867339;
	bh=eqK6AYA/q2397JZTSf7bv9+iN8f9okpLC5SE5H0iyoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Dy61g6x0b+GMbPLsLTTDH1gR0TKyRTmvXoknObdvvoQJXmFjCYJGIa30esD/G3kvS
	 A7XHHv485wh2Z86AOBbMDsoMydO5WIXK+BVY9TZKe9aSixQrUuzlQK3rOyTkPncf8b
	 EliMnoGEInbnbd1FD12Nghl+6lH9jiSN43+CeXoSQsQghKrDdgPrd2jM+SL6m1dcIU
	 JYeNCshOGUtjH+D6ZYEaZqq9kPw/8ixVvgfIK6uvaE0TsNeMx22jgnv5VNa5Yin18W
	 FRXddI2VwJ3xlmdSYZ+cxpdQZV/GgdRJE4ZBywZBCwgTxMmICLFtq0QLajNSpw6ln1
	 gBYiPVDgcobYA==
Message-ID: <832e8281-4e9f-43c2-9477-9f5a5a666d41@kernel.org>
Date: Thu, 5 Nov 2026 09:28:54 +0100
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
Subject: Re: [PATCH v3] doc: process: clarify scope of applying-patches as
 legacy reference
To: aleszlucero@gmail.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261104-doc-patch-fix-v3-1-f71cc8ded7d9@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261104-doc-patch-fix-v3-1-f71cc8ded7d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/11/2026 19:31, Oscar Alejandro Sánchez Lucero via B4 Relay wrote:
> From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> 
> The applying-patches.rst document describes the manual manipulation of
> source trees using the traditional 'patch' and 'diff' utilities. While
> technically accurate for non-Git or constrained environments, it can
> create friction for new contributors seeking the primary Git-based
> workflows.
> 
> Update the opening note to explicitly state that this document serves
> as a reference for legacy or constrained workflows. Provide a direct
> cross-reference to howto.rst to steer contributors toward the standard
> Git infrastructure.
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---
> Signed-off-by: AleSZLucero <aleszlucero@gmail.com>

Drop

> ---
> Changes in v3:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v2: https://lore.kernel.org/r/20261104-doc-patch-fix-v2-1-3601fc35c505@gmail.com
> 
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com

Do you see EDITME?


> ---
>  Documentation/process/applying-patches.rst | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

...

>  A frequently asked question on the Linux Kernel Mailing List is how to apply
>  a patch to the kernel or, more specifically, what base kernel a patch for
> @@ -20,7 +26,6 @@ In addition to explaining how to apply and revert patches, a brief
>  description of the different kernel trees (and examples of how to apply
>  their specific patches) is also provided.
>  
> -

Why?


Best regards,
Krzysztof
