Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E94D0A0E;
	Tue, 15 Sep 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498904; cv=none; b=LDolBX65q5UEhcFxoCgJr40262dFJWuzwKuxiHiSBJjhFylExQwBHA1+c+RtEaPF8t/062Umq2c+ryGsM8yP1RhJtxkYOpaHOVbVzIfsIlmDF5EOkzaXqKDmoQaXc2ZJOAJNbyA0VxfQ5ZdCxrk891r2mYxxFf5qbHxy11SUES0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498904; c=relaxed/simple;
	bh=hz6WpxHBLdfj00DT4yjkTDK/eZ9ZQwe/iMYxzBfpPtY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pQAknnH41fSN1umvmBQPtPq3hcSRGehqGbMmsVjJYI/fsxGqTziDZc12zU/b2efct4xU6PN4o1QBRNJrjJu6z02U2uZ/NFUyIV94mQhuPyBtJ+BO6lLH01xSaWC8M0RRYgZc1Ch3K4afOG9Ur3XTuUSZtEsxVWjfafcI9r3hKO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AAuFfRU4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AAuFfRU4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E2413408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789498881; bh=c3liCs63qQh0M9f9bUmlkj6aak+AlCP0QcMNZjfc/4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AAuFfRU4YFhdrqXqdxJbeZlyXT8JoCPsiQ6zW2Bu/S6f8oSbaIKt7GDj6JgqWesPp
	 PGjov0ZWcUaF81B040nuRDiNfABxPmo0QmNHSKks4jagZqUUAIEBzRnKFAKdmpADq8
	 uBBoaIHENP9nKCsCMz0oXRopzrWfkRpBqi2L8BS9WSYNOHmXYpG6naebTMrogQL9pc
	 1bKUFgHJBK2A1tEC7pPkZ4uR2/WLfhTEC4yDWiSxQcU0mJ/htEbfYPCK0ReOXUqhIw
	 bKNfZdeWb/3KHXSzZhooUFflR7EniVKy5J/PHI+raER1b8u/l0hPqdbINLy64K9Dqu
	 1JYEVhJrtO+1w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E2413408B4;
	Tue, 15 Sep 2026 19:01:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-doc: include "define" as an identifier type
In-Reply-To: <20260912055202.103573-1-rdunlap@infradead.org>
References: <20260912055202.103573-1-rdunlap@infradead.org>
Date: Tue, 15 Sep 2026 13:01:20 -0600
Message-ID: <87eceu9w5b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Update the list of identifier types to include "define", which was
> added in 2014 in commit
> cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
>
> Fixes: 91a3d6be99e6 ("doc-guide: kernel-doc: tell about object-like macros")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/doc-guide/kernel-doc.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- linux-next-20260911.orig/Documentation/doc-guide/kernel-doc.rst
> +++ linux-next-20260911/Documentation/doc-guide/kernel-doc.rst
> @@ -565,8 +565,8 @@ identifiers: *[ function/type ...]*
>    Include documentation for each *function* and *type* in *source*.
>    If no *function* is specified, the documentation for all functions
>    and types in the *source* will be included.
> -  *type* can be a ``struct``, ``union``, ``enum``, ``typedef`` or ``var``
> -  identifier.
> +  *type* can be a ``struct``, ``union``, ``enum``, ``typedef``, ``var``,
> +  or ``define`` identifier.

Applied, thanks.

jon
