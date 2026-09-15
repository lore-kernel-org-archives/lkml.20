Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B53A05C2;
	Tue, 15 Sep 2026 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460205; cv=none; b=j/o4JCW50MBtS/ntei2P6KdLPSWf41JPp1ygSIFK8xF4NXiQ5fYSDE3HfEuzrtTgyhMbQPdRm9QuOtaIEGNEWSh6o4bWQ24IdtfOUz7MCAsIE0y8iReEdcGyCc+OygFti92RUuPvYe1Heg+VIvD0u4zIE3SBsWQNJ8JW92S6wEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460205; c=relaxed/simple;
	bh=9xjdJ0u1xXc+pWzjtzJtKGqjupmdYC9PUu/BOFNXSHk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQWhQB41GaMxPnvK1EwKd8iRdMc7YMGG6vISnSPoLFFOxlUH44HCa0mXCd59p1En5MxtmPjUouzeuO7RgS4qUCOPHgaVt5xpin1UvtoPaoe3mptP8LMIneMX6A7kuxuidxI79PxRpifigWVFpayYKG7rryGxUDvJhEQZZ6+zSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzAH5Zdg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzAH5Zdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515351F000FF;
	Tue, 15 Sep 2026 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789460203;
	bh=e1W+tBesNj6gf4uFrJ6qnnCVVNK7s1ZvqhyZl1SMGdA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mzAH5ZdgM9NRXjsdWvesc6RhbUiFjak5BDh/35mvBdY9jLOispSL4DEnkbazJGeuW
	 Wht4Z5FApE1V0QjzmeRGC4TQUxJlNN0h4hE1xU4IlKCrpyW5crwK92Ei+9sp/tgAI2
	 oP+3BLpupt9ASZyO9qNVO056lsL8tn4VVbsxCWqn/6qJQnJkPu45JW9r6uKetlniyT
	 x8gT19Nq1RLj7oBpodZ6t6E2UaxaBsd5hxujoJa7SHqhYzI1Ywiko4Ohsl8spbnZcb
	 oRVA4j+PuF+2cJ1dpYLPHLxSusSz+DqdwqTJ2IindcPavrFEgLdKBn6WMLPYbUbolx
	 rKXCwq20U+bBw==
Date: Tue, 15 Sep 2026 10:16:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Masaharu Noguchi <nogunix@gmail.com>, Chen Miao <chenmiao.ku@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <20260915101638.76e3bf1c@foz.lan>
In-Reply-To: <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
	<b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 16:52:03 +0900
Akira Yokosawa <akiyks@gmail.com> wrote:

> Hi,
> 
> On Mon, 14 Sep 2026 19:35:40 +0900, Masaharu Noguchi wrote:
> > Sphinx declares the range of Docutils versions it supports, but that range
> > does not always describe what its LaTeX builder can take: a distribution
> > may relax the upper bound to ship a newer Docutils, and Sphinx 9.0.x
> > declares support for a Docutils its LaTeX builder cannot cope with. Either
> > way the pair installs happily and htmldocs builds without a complaint, so
> > nothing looks wrong until pdfdocs is run, where four of the books fail:
> > 
> >   ! Dimension too large.
> >   \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
> >   l.86321 \end{sphinxVerbatim}
> > 
> > That is arch, core-api and translations; admin-guide runs out of TeX
> > memory first and stops 13 pages in, and fails on the same boxes once given
> > more.  Each of the four includes a large literal file whole; the one in
> > core-api, memory-barriers.txt, is 3016 lines.  Docutils 0.22 is what puts
> > those blocks into sphinxVerbatim rather than sphinxalltt, and
> > sphinxVerbatim is framed, so they hit the size limit of
> > sphinx-doc/sphinx#3099 [1] -- open since 2016 and fixed only in Sphinx
> > 9.1.0.  None of the three is at fault on its own: it takes the Docutils
> > version, the Sphinx version and blocks this large.
> > 
> > Keeping everything else fixed -- one Debian 13 container, one TeX Live, an
> > unmodified texmf.cnf, one kernel tree -- and varying only the two Python
> > packages:
> > 
> >   sphinx   docutils   core-api   admin-guide
> >   ------------------------------------------
> >   8.2.3    0.21.2     ok         ok
> >   8.2.3    0.22.4     FAILS      FAILS
> >   9.0.4    0.22.4     FAILS      FAILS
> >   9.1.0    0.22.4     ok         ok
> > 
> > The 9.0.4 row needs no help from a distribution: 9.0.0 through 9.0.4
> > declare "docutils>=0.20,<0.23" themselves, so a plain "pip install
> > sphinx==9.0.4" resolves Docutils to 0.22.4.  Fedora 44 reaches the same
> > state from the other direction, shipping Sphinx 8.2.3 -- which declares  
> > "docutils>=0.20,<0.22" -- patched to accept "<0.23".  Upstream ships this  
> > sort of work in a new minor rather than backporting it -- the Docutils
> > 0.22 support went out as 9.0.0 after a backport to 8.2.x was asked for and
> > declined [2] -- so neither 8.2.x nor 9.0.x will grow the #3099 fix in a
> > point release.
> > 
> > Check for it, since sphinx-pre-install exists precisely to catch a
> > documentation build environment that will not work.  Ask the interpreter
> > behind sphinx-build for its Docutils version -- a venv and the system
> > install can differ -- and warn when Sphinx is older than 9.1.0 while
> > Docutils is 0.22 or newer, naming both ways out -- a newer Sphinx or an
> > older Docutils.  Only warn: the build is left to proceed, and htmldocs is
> > unaffected.  The bound Sphinx declares is no use here: it is either what
> > the distribution changed, or, for 9.0.x, wider than what the LaTeX builder
> > delivers.
> >   
> 
> As this is expected to be resolved in Fedora 45, I didn't see much
> point in adding this warning.  I now see Ubuntu 24.04 LTS has the
> problematic pair of Sphinx and docutils ...  So it might be worth
> to have. 

Fedora 44 EOL is still in at least 7 months from now (e.g. when Fedora
46 will be launched), so, it could still be worth.

> That said, with your approach, under a build env with a problematic
> pair, this is what you'd see in "make htmldocs":
> 
> $ make htmldocs
> Warning: Sphinx 8.2.3 with Docutils 0.22.4 produces
>    broken LaTeX for the large literal blocks in this
>    documentation: pdfdocs will fail. Building them needs
>    Sphinx 9.1.0 or later, or Docutils below 0.22.
>    HTML builds are unaffected.
> [...]
> 
> I think this can annoy people who only care HTML docs.
> 
> Why not do this check after the PDF doc builds have actually failed.

Indeed it sounds a better approach on my eyes.

---

On a separate but related issue, has anyone tried to use rst2pdf
lately (https://github.com/rst2pdf/rst2pdf)?

It could be helpful to use an approach that won't require writing
first a LaTeX file. I remember I implemented some support for it
a long time ago. The patch back them is still on an old branch
here:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=rst2pdf-v3

If someone has the time, it could be worth trying to port it for
it to work with sphinx-build-wrapper and do some tests to check
if it is worth the efforts to fix existing bugs at the tool, if
any.

> 
> That is what sphinx-build-wrapper is doing with LatexFontChecker().check()
> (see line 557 of tools/docs/sphinx-build-wrapper), which is to
> show the way to work around PDF build errors caused by "variable font"
> flavor of Noto CJK fonts [3].  (Fedora and openSUSE have started to
> deploy such fonts in 2024.)
> 
> [3]: https://bugzilla.redhat.com/show_bug.cgi?id=2271559
> 
> Regards, Akira
> 
> > [1]: https://github.com/sphinx-doc/sphinx/issues/3099
> > [2]: https://github.com/orgs/sphinx-doc/discussions/14055
> > 
> > Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> > ---  
> 
> [...]



Thanks,
Mauro
