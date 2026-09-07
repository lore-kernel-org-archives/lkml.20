Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8613D479872;
	Mon,  7 Sep 2026 16:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797056; cv=none; b=Fr+8QmTfLs+R5vFWfpDyzD79i3tTPBK2KjrJR7Qyx8iiX1SKvrrSp9/V5xjkpxnBikFmRfV9VysdW1jo5vHvIiM4joGJfP2s3kOLLnC0ZAk/HLc/I+fwQV3jTfL/lmEFAiu5JH2laFwMv9YOti9rou9Ua9/1o7S3BuviJr9ef5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797056; c=relaxed/simple;
	bh=4sp/YeN2H04Z0zOoTiojLjcoWDbChrEAn+Z54jK+rGA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XYjckITae/BGfg4CflN9pqDB9WOKMgBB5v4BJIgdWaMXqPNOi4lT5TX91sdYTLRfrnP761b9VszfpbyClnERipaVTjbPdcBYUVHD+N7wSon/ZxU/A2x4/2OA1sMr1ByM1ztRxbVaSQqsCYnhVTuJeMyonevKdLYkm+5iDNWLLiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BPzf/Kr/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BPzf/Kr/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5AC2C408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788797054; bh=PQcokecY8E9hHBUhc9gxmM/LdBoKSMfS5iDVS/hdTgM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BPzf/Kr/5fOHzuX0cN8eDZiEX/Geve/nDXcGFvtuLkPsyBknHGeow+UPFn1iNFqRU
	 IIkKRI6c9QFzCdzI4KayaPBecyle1kaRWha4BJ6cA3mQQT8vRqzjIbTrcilcnLzeko
	 TybcYxckb+nu24zsT3Yy1IONPl/R6xKjLguogEFa+kx8UAmo1CkR5Ma9bYd91F8h2I
	 P5NI5mMOFRuqpSNSRTdZbZQVrhZLPAieoFp+laJDvlf+xP/L70ECfvaSPW0wUzXEYY
	 Ky4pChiGCwg8gs5wZYAc89OzMXEp2zV2ry2Cc23j6yaIFqZ1y7gALkZehCw/uy2ll5
	 HMMeMFNe6SNSw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5AC2C408FF;
	Mon,  7 Sep 2026 16:04:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: irqflags-tracing: Fix the lockdep Kconfig option
 names
In-Reply-To: <20260905023746.82998-1-kmehltretter@gmail.com>
References: <20260905023746.82998-1-kmehltretter@gmail.com>
Date: Mon, 07 Sep 2026 10:04:13 -0600
Message-ID: <871pb5vyiq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> CONFIG_PROVE_SPIN_LOCKING, CONFIG_PROVE_RW_LOCKING,
> CONFIG_PROVE_MUTEX_LOCKING and CONFIG_PROVE_RWSEM_LOCKING have never
> existed in mainline. Lock proving was merged as the single
> CONFIG_PROVE_LOCKING, which has depended on CONFIG_TRACE_IRQFLAGS_SUPPORT
> from the start, so there is no reduced set of options without it.
>
> Fixes: 55df314fbdb4 ("[PATCH] lockdep: irqtrace subsystem, docs")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/core-api/irq/irqflags-tracing.rst | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/core-api/irq/irqflags-tracing.rst b/Documentation/core-api/irq/irqflags-tracing.rst
> index bdd208259fb3..a3c77046ae6b 100644
> --- a/Documentation/core-api/irq/irqflags-tracing.rst
> +++ b/Documentation/core-api/irq/irqflags-tracing.rst
> @@ -9,12 +9,8 @@ that it gives interested subsystems an opportunity to be notified of
>  every hardirqs-off/hardirqs-on, softirqs-off/softirqs-on event that
>  happens in the kernel.
>  
> -CONFIG_TRACE_IRQFLAGS_SUPPORT is needed for CONFIG_PROVE_SPIN_LOCKING
> -and CONFIG_PROVE_RW_LOCKING to be offered by the generic lock debugging
> -code. Otherwise only CONFIG_PROVE_MUTEX_LOCKING and
> -CONFIG_PROVE_RWSEM_LOCKING will be offered on an architecture - these
> -are locking APIs that are not used in IRQ context. (the one exception
> -for rwsems is worked around)
> +CONFIG_TRACE_IRQFLAGS_SUPPORT is needed for CONFIG_PROVE_LOCKING to be
> +offered by the generic lock debugging code.

Applied, thanks.

jon
