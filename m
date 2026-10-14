Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A74195D2;
	Wed, 14 Oct 2026 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998534; cv=none; b=hTf8/swru2ddYu5UREXXPdtjtFPFyK7iIuc+l0fW3D4KOg6VlzIi8aNCTxafp/wqFZfd/geL9aqfKujYG16r7w8/e94SMmOpskS0ke1EL9gCEBfw/QwSupobDaq73PctHE0QtRvhSsU0aYnE6s564/se2vdBUSLOHXSmUTKQRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998534; c=relaxed/simple;
	bh=KJ52kxBhfMUH9XMnL4lbyboiBmxke+QRHmYbceN+wGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q5bTsXyqESFz/nXWrxVEIgPcWPpw7YnFsOypBggX02/M/e9l6g6GqxlnxKDHDe+S+P42hBz/HPQXCAEXkn+iTjQ8DFBScwCR2Kp6cNddhYU8qZYBNIDi5A/zZvMIVT48jMaSkCFCH8NgmvDA/cUbj85gma+ZjGsltlCfFocdx+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=muiQVty6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="muiQVty6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 52458408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791998523; bh=bkLZ/wxa41d4ou6q9oCdi1tgvZ3yofqS7AdlVYE7GCg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=muiQVty6vvk6+RMjjBY4vMPeWZhBWdCo7a5D6YqdMCFJKr+DUhRB/2Dz50+Gi4zMV
	 V3UI/7UkMMie4I8qY6CGhMyzcra0HkwyzO86v5b0MCz6vFT7PgukLc5tKfb6pFsxkn
	 zh4g+qJyg8p77fjbBAzsJEwHr+OJxPka3mM+6pFERkLdiGBTuiFoIHM8cDSczUqFnU
	 Dv01WP/ApxswkPGP6Q5HrbCR5NQ1qk8Z+NK0iIoIgufacyBlFUjvDSmUuc5xFftujQ
	 BVA5Yf6PWrhYZnkFCvZWjt7kwIHu59skY7OEwXxSv5y27N3wlG8c5nnXUdFI3GQ41u
	 V35/tYanq7+bA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 52458408FF;
	Wed, 14 Oct 2026 17:22:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, bvanassche@acm.org, emmaonana18@gmail.com,
 tudor.ambarus@linaro.org
Subject: Re: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function
 prototypes
In-Reply-To: <20261002041520.42061-1-emmaonana18@gmail.com>
References: <20261002041520.42061-1-emmaonana18@gmail.com>
Date: Wed, 14 Oct 2026 11:22:02 -0600
Message-ID: <87qzhsurid.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:

> kernel-doc fails to parse functions whose names are wrapped in the
> DOMAIN_NS() namespace macro, e.g. in
> drivers/iommu/generic_pt/iommu_pt.h:217:
>
>   ... expecting prototype for iova_to_phys(). Prototype was for
>   DOMAIN_NS() instead
>
> function_xforms is the designated place for unwrapping function-name
> macros, but it has no entry for DOMAIN_NS(), so the macro name is kept
> as the prototype and the real name leaks into the parameter list.
>
> Add a transform expanding DOMAIN_NS(op) to op, following the existing
> DEFINE_IDTENTRY_IRQ precedent.
>
> Add a regression test for the wrapped iova_to_phys() declaration.
>
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  tools/lib/python/kdoc/xforms_lists.py |  6 ++++++
>  tools/unittests/test_kdoc_parser.py   | 22 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Neither of these patches applies to docs-next...what did you base them
on?

jon
