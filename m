Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90337C0FD;
	Tue, 15 Sep 2026 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502467; cv=none; b=P4kRzIg5gJxqrafzn6jga4eaAcFMAUUulO2w+zMwl7dnlP/bnNn5r8OTflgps/j8BbPfzO8ZCRe+Hxj3JI4qLuDZXhB1q5zmrajyfP9YU3eFq0MjmOfwnjSqmLQqD98dfQmMv9rsAIeateM+PPtbbOcNbhqEhcrrImmXzf6VJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502467; c=relaxed/simple;
	bh=ewEiEZmi9YENEKJhwlm5yoLn+voAzmpf24VkSUzMWck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vh7WTD3XP7Wj4ob00oTbG/EFnwwOrOlTE37ycDYP2GXZsTMYcnuOsQ6MBAo4AJ3JPch3ro4od68hduxy/BLnyZjNRU80ppEQouJPNDUWJOj8L+5eSkhQsSb+/J9eE3+jdVY/QDqkZVleCV/hMEmdq4NNokAXGHPIsRDCITnyHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=U77+zCiO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="U77+zCiO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3141B408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789502465; bh=pzaZ9uFqRmySZgYh1RyRb48ALwREuuSFoEme0WL8a48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U77+zCiOdELXvSDgo4Ar52K4HrO5837kmr5IAUxugtSs2C7LOjNVfamnQSdh8gZ51
	 Xn4sLKGmI5oRLjzEvB+5MjAVHIJrQ0gP8jeOnjSOoRHwFdvH5PksAofr5i6Htz7Vzu
	 khR4BLmkR5YVDiArBqIFkk+ZBN/a2f0Ladeh/Ss4+C0xKSMlGpQAr2yRRDIsYVlAB8
	 YcDA2cAf3dNzUd5PWzJB63E4ZrmH7plB7x4EJdUbK9woybYGl62qeB203fRNlujPK8
	 4yZB2zOxBIY+oBD/6aR8ooGwfG2ukvsAIAExB/mcYFCEGCUXatgd4srH/s7rzvwTyx
	 4C9DPeu5uBasw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3141B408B4;
	Tue, 15 Sep 2026 20:01:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Masaharu Noguchi <nogunix@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Chen Miao <chenmiao.ku@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masaharu Noguchi <nogunix@gmail.com>
Subject: Re: [PATCH v3] docs: report Sphinx/Docutils pairs that break PDF
 builds
In-Reply-To: <20260915-docs-sphinx-pre-install-docutils-v3-1-95ee86793673@gmail.com>
References: <20260915-docs-sphinx-pre-install-docutils-v3-1-95ee86793673@gmail.com>
Date: Tue, 15 Sep 2026 14:01:04 -0600
Message-ID: <87a4pi708v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Masaharu Noguchi <nogunix@gmail.com> writes:

> Sphinx declares the range of Docutils versions it supports, but that range
> does not always describe what its LaTeX builder can take: a distribution
> may relax the upper bound to ship a newer Docutils, and Sphinx 9.0.x
> declares support for Docutils 0.22 by itself.  Either way the pair
> installs happily and htmldocs builds without a complaint, so nothing looks
> wrong until pdfdocs is run, where four of the books fail:
>
>   ! Dimension too large.
>   \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
>   l.86321 \end{sphinxVerbatim}
>
> That is arch, core-api and translations; admin-guide runs out of TeX
> memory first and stops 13 pages in, and fails on the same boxes once given
> more.  Each of the four includes a large literal file whole; the one in
> core-api, memory-barriers.txt, is 3016 lines.  Docutils 0.22 is what puts
> those blocks into sphinxVerbatim rather than sphinxalltt, and
> sphinxVerbatim is framed, so they hit the size limit of
> sphinx-doc/sphinx#3099 [1] -- open since 2016 and fixed only in Sphinx
> 9.1.0.  None of the three is at fault on its own: it takes the Docutils
> version, the Sphinx version and blocks this large.
>
> Keeping everything else fixed -- one Debian 13 container, one TeX Live, an
> unmodified texmf.cnf, one kernel tree -- and varying only the two Python
> packages:
>
>   sphinx   docutils   core-api   admin-guide
>   ------------------------------------------
>   8.2.3    0.21.2     ok         ok
>   8.2.3    0.22.4     FAILS      FAILS
>   9.0.4    0.22.4     FAILS      FAILS
>   9.1.0    0.22.4     ok         ok
>
> Two distributions ship the failing pair today.  Ubuntu 26.04 LTS has
> Sphinx 8.2.3 with Docutils 0.22.4 and no upper bound at all in the
> python3-sphinx dependency, and Fedora 44 reaches the same pair from the
> other side: it patches the "docutils>=0.20,<0.22" that Sphinx 8.2.3
> declares so that it accepts "<0.23".  Both fail identically here.  The
> 9.0.4 row needs no distribution's help: 9.0.0 through 9.0.4 declare
> "docutils>=0.20,<0.23" themselves, so a plain "pip install sphinx==9.0.4"
> resolves Docutils to 0.22.4.  Upstream ships this sort of work in a new
> minor rather than backporting it [2], so neither 8.2.x nor 9.0.x will grow
> the #3099 fix in a point release.
>
> Report it where it is useful: once pdfdocs has actually failed, next to
> the error, in the same place LatexFontChecker already explains the CJK
> variable font failures.  Ask the interpreter behind sphinx-build for both
> versions -- a venv and the system install can differ -- and name the two
> ways out.  htmldocs never runs this and stays silent, which matters
> because most people who build the documentation never build a PDF.
>
> [1]: https://github.com/sphinx-doc/sphinx/issues/3099
> [2]: https://github.com/orgs/sphinx-doc/discussions/14055
>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

I'm sorry, but no.  This is a great deal of complexity to catch a
single, hard-coded mismatch that will soon disappear into history.
Instead:

- File bugs with the distributors involved

- If you *really* wanted to test for this sort of thing, it could be
  much more simply done with a Sphinx extension.  Trying to parse
  shebangs and such seems ... inelegant.

Finally, this has the look of LLM-generated stuff; if so, you need to be
adding Assisted-by tags to your patches.

Thanks,

jon
