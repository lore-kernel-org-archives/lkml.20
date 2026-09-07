Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC151D53D;
	Mon,  7 Sep 2026 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799193; cv=none; b=E2fGVlh3BiWpKbZBi8HE1eYGN+kk7IQAT1ODdbhMn1W78FcHS61sKUd90JmmpAOs9kNZ6OUKRHC/oE9wqwOsnzVah/cr+tFMpeToE7wHxGZAu1ifv0+uPXQxkFzXopU9I6x8SK2bIPiI3lj0qcjlQkJHZGBu5YvTEBEajtiSZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799193; c=relaxed/simple;
	bh=HO9Gvxr9ukRZgaKqtL+7jvo99DME7N3OoMxny65T+jM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LRLPo2Mh+/i2Hw5Rmak9IHEA/89flK2KjPTDweWLz2GSzgviad06tgu4BAkY5/E0NYpkES4AI+s+WtYUHX7mHWTT7H1gTaP/MTUUo/6W20DgSAh3HrRhu2v9+9v8ZdLz4em2NTKQ/zEcyOL2yMbbAL0y6u83IIAxDT7z7orhvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=El75W1Lw; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="El75W1Lw"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 75DCE408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799188; bh=ktl3trXojmPkIwZOrUhiPusz2l4rIjeLPKYtZ8PAOA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=El75W1LwfxoepQIpcPbKym/+vCwLUaF1Iq8ZnU8nHK2e9Hisq7r0brSMfYCv4pJMG
	 TBuWMi/GkLK8N/RbPUOQo5palJRGTvO78DXldvUSFx3Sbqfchiu2L5lzVpV/WYlC6H
	 to3STydOyErLPQ0RCAFaZEOOD2eP59R+ANzLUao5+f2Q/iOH4qk6NVY3A0UmQQEkKE
	 1/sXg3CTR3qsJuF5ieiHT/glyZkfUi7tvkGIIA7YR2yJK+Fu87FyjneNBaPJipbL3O
	 V2hlYJIvVhFI44lEvgIgeXuk0qgz966YawnlRFyl7eyIbtvWxfgIhxaKcE6rBFkXGN
	 YEI3/tYledMQA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 75DCE408FF;
	Mon,  7 Sep 2026 16:39:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hemanth Selam <hemanth.selam@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/core-api: fix typo "maintainance" in
 comment
In-Reply-To: <20260904113257.13594-2-hemanth.selam@gmail.com>
References: <20260904113257.13594-1-hemanth.selam@gmail.com>
 <20260904113257.13594-2-hemanth.selam@gmail.com>
Date: Mon, 07 Sep 2026 10:39:47 -0600
Message-ID: <87pkypow18.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hemanth Selam <hemanth.selam@gmail.com> writes:

> Correct "maintainance" to "maintenance", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  Documentation/core-api/housekeeping.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks.

jon
