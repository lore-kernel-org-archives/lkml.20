Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792534052;
	b=DFyUbdDL1G+vorHGUP/GQjHcdaBwezXXWapz0VKrgBvjCmlwcIH7kqmGPGxV+L4+XUou
	 etfAy0oTrhINui3Gj0gsZR4nG5ddfWZPHpURR0lvfUIaOL6AdVTOZeMBL/Bf2UNyDe8ia
	 ENNScWXnjHD2Sub4L+4BhHB3ElCu0OgseL0KWRIcZHa9yaUV6rQpQbqUl6bQWzqQHPRm5
	 hrkBu3jlA7m+IMhh7equyBD8fbcg9zsxK4A6t5EGc6CTNpsYiv/zzF7SMCgqyGcV8ufZ1
	 lbNjB8YWG1D/k+R7MXHMbLXFeiZZU1wwH4v+tQ8tfSQXvuJqGE2ukQwAQukSSPLK8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534052;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pWdjr/d/hf7wlxe3EUx/jojVqEBvoFrMCPGjGaxAxZQ=;
	b=yvGyrQKqq68iNG4WZOKEBut6eJfCdBaNeZ5UCjFR3HsaVTpo1Lu4gvIV3188jaZrx03M
	 iipGtYKQksgwVzXwuEchg9AU1XdkKHM25Tif8K+O8rEYFJg3sX1pl/jtJ6BRfeegqZz4o
	 t422J18Wuen6wuDaXwLSRwqKqyPJrKT5Hz51yLiMSFg+Ow0JO0rGXqKMn99eczU9HnHWC
	 aJVIQHHXK2x0zV2bZf6WyS5/IqHsZB4nXgphx2yZhe6sE9rltr7wKEVlzQs5Wmh4stgdi
	 NFTyClAJgAULF5eOHg2pNKsKYSeOeuH/7Avp7gn0lCjAnTJ+PshXXZuzvoN7xgQZ13A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RYNjetCH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0C606A31E;
	Tue, 20 Oct 2026 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RYNjetCH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C2E1F000C9;
	Tue, 20 Oct 2026 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792534051;
	bh=pWdjr/d/hf7wlxe3EUx/jojVqEBvoFrMCPGjGaxAxZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RYNjetCHcRRPhydHWUGAHk2nDz4REzEneMHTySufPG6jbxTNTxwfkRxiou8LWIKZ7
	 VVjPQ4prwD+LYVP8bNE4oIWRPPC5ZdSdyl5DuUwblg/xPS/U7DyrpAQZxyshhnYPU5
	 M1jNvI9IIHLRBediFSzmztmdYUF8hjER5nlazc4M=
Date: Tue, 20 Oct 2026 18:07:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261020-brown-potoo-of-relaxation-3e9a72@lemur>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020212235.1143086-1-ebiggers@kernel.org>

On Tue, Oct 20, 2026 at 09:22:35PM +0000, Eric Biggers wrote:
> Many patches still don't include base tree information and can't be
> applied.  Such patches can't be properly reviewed or tested, nor can
> they be accepted.  submitting-patches.rst already describes how to
> include base tree information, but it's characterized as optional,
> appears only towards the end of the document, and is missing details.

I'm happy with this change, but I'd disambiguate the title a bit. With b4, we
started providing both a base-commit and base-tree footer, specifically
because often times the "base-commit:" line by itself is not sufficient.

Imagine this scenario: a developer is working on some code in a feature branch
and come across a pre-existing bug. They create a fork off of their feature
branch to fix the bug and send it in. In this situation, the "base-commit"
footer would be meaningless, because it references some transient commit-id in
their feature branch. In an ideal scenario, the developer would rebase that
bugfix branch on a known tag, but that doesn't always happen.

This observation doesn't really preclude this patch from being accepted, I'm
just recording my own experience that, by itself, base-commit is often
insufficient.

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

-K
