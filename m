Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E23B5F50;
	Wed, 14 Oct 2026 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996897; cv=none; b=YxnXOFXea/stBa2sCpCB6+AAoeuRkLIZSz7/TOC2K+1S9XRGAgB1J5S+sLc0jddVJD3ClSjSueBKQ6VKzag/ixPKra+xVzlPzM6UNCkAhMlHS6QMdyBlqFxvHUQq8vOKuJlZrAI4MCIlZFYvsvWb0FVNwIYsU97yOcdF7pXBJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996897; c=relaxed/simple;
	bh=53cOAaA4VDYZ+gecsT6obnH0P9t8yYDIvAkYBXZ6/eo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R5s9zqPwk7OMdWoykGPvQybuFJkwLHjHJEBEEPF9swZr8Mx+qg1fol5LwlKk9bEnHOaCDBqD9+vQtJvH4ukGyp1aJB3YDhv3KxZJe8MvcTUlFpkqhrEOjthZtGC8bNab+plXzXfjz6WLdfNi0F2lLaiG0kOoZfM+7fbdhLN1+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EHv24ZjW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EHv24ZjW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D870F408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1791996895; bh=EhUHkbPk4X+IbWsQOStYP2QUcrlkr/AFEVSmWdJhjrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EHv24ZjWHQgNp1/zC6idJIMwD1DXJCl89/y6rdaxSWz2937BB3c+w/cVtQvJeTrmr
	 fqHbwJKS/q9xVrYlG2sJWD+fhWrpZrkuFqQA2a0qlxQWfhoRc8hlBTDt+/b5XaP9p6
	 TfM7bsfwRv73raxkcrYHbyuEp6wthyX1B2b0yNCkRv47BB33a/Flh+zUX/7Jl+6+XR
	 z19LMpsLZwP4GFFfaIsoW70KMDe91YMMVnFrz1SsuQn1XzQ5VKTccKsxaV1OLRLjcs
	 d1WTfHNZDsRfK4mn529CoOv580q07KtyxK0AQw1VO9T+MiXFko/WcBayoDc/HL6MsT
	 hDSLJRsw67OJg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D870F408FF;
	Wed, 14 Oct 2026 16:54:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Federico Vaga <federico.vaga@vaga.pv.it>, Daniel
 Pereira <danielmaraboo@gmail.com>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 Weijie Yuan <wy@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Kees Cook <kees@kernel.org>, Jori Koolstra
 <jkoolstra@xs4all.nl>, Jeff Layton <jlayton@kernel.org>, Christian Brauner
 <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, Vlastimil
 Babka <vbabka@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Christoph
 Hellwig <hch@infradead.org>, Mark Brown <broonie@kernel.org>, Jens Axboe
 <axboe@kernel.dk>, Brian Foster <bfoster@redhat.com>, Carlos Maiolino
 <cem@kernel.org>, David Disseldorp <ddiss@suse.de>, Jani Nikula
 <jani.nikula@intel.com>, Justin Stitt <justinstitt@google.com>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove Assisted-by references
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>
References: <20261013121501.3738437-1-sashal@kernel.org>
Date: Wed, 14 Oct 2026 10:54:54 -0600
Message-ID: <87o6cww7c1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> Remove the Assisted-by sections from coding-assistants.rst,
> submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditional
> Chinese translations, and drop the handling of the tag from checkpatch.
>
> [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
> [2] https://lwn.net/Articles/1099594/
> [3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/
>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Changes in v2:
> - Expand the changelog with the background and the Maintainers Summit
>   discussion (Laurent, Krzysztof, Greg, Lorenzo).
> - Rebase on docs-next and also remove the Assisted-by sections from the
>   pt_BR and zh_TW translations there.
> - Collect tags.
>
> v1: https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/

OK, I have applied this, thanks.

jon
