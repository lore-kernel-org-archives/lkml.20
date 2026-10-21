Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565382;
	b=g+bdB03x3Q48GELwo49LV5HZUkzEStJXljq4hYMggYcjmk953xQpI/TS7aQZ2HAgDVq2
	 1A30vz5O+yu/Fxw8ZDplgknT3gjWsVbrpYhL8GqAng3Cx2LKIBMJNfZIrz+tRJtJelPfr
	 88FPA+Yu7jiD3sv+2xO6B9YUace+pIbdSCDVuIDofXPTh7tbsegz08TbubmayJLFnZxJy
	 BAPMvYunfM5eVhQegsCnBXfRzMuGYD2F8OOsyYtL/w9H0KxzIOEYpI3X5UW9FmiM3ZPzL
	 LmLfQ2QjBCf5oVhu0af9LxdKmtSndW8o1OIpRrJ4P1zxauvuV7qz40mJ3cJi7Eof0sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565382;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BsCdIHzoAA0qqDiCj2CnFnttNmAHwY0cD0zQr0d1nDk=;
	b=JjXPMKMHbEesG861JffYtOVWCp8M6Md3H1CCnh5ysdZt9K74bXJOgm4yv5rKdwGKfdTr
	 y95WimxYAHbucGFs5BNvXgWMEfg1KKWK9CQYiLSlwPjYEQxwXZtjJSWLW5RFG61P3mmtk
	 g/iJOulhdO0qveo/eX5U/R4hX2AE2VU78yQUxU7hoP650lXSqqBE4V8D0jyd1/5OHJP8W
	 Xa5X7+UeZTAjQ4lGlpeF2wTJYYwkUhDw0Wr0pzpt7EAAVYIUaVs1vAr3ArnIyJ4KK6USV
	 WhVTKyA40vQaneA3kz/c5qRf/BBg1oQILhJTl7B8Pc8utxCe3ipEERFx3y9GrCmllbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtN079xE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A96606A319;
	Wed, 21 Oct 2026 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtN079xE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4951A1F000C9;
	Wed, 21 Oct 2026 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792565381;
	bh=BsCdIHzoAA0qqDiCj2CnFnttNmAHwY0cD0zQr0d1nDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OtN079xED//VqEZ+NrJshFbqq2VM7LPK41Iht02f1f0THbzS/T6ewuDIrMWa2U63U
	 kXuekPk0+iPYk3uhYXTQ7kxcRSLiTxXNJTjZGeYoWPUO4ADBdhS5ZUYlRn9dc/xqy8
	 fa+Ww+weGI5igNVS/UM+Q3efa7HEGzhZJEQOQRkvpZO6DP1pU77whIcB/LcBdFFE2J
	 6xtAWoOPIUKwX/nZzvIkvp6veXVyTIuW4KPOuQKs3MjCCDCw2PVG2J69mRaF3zEUZG
	 8uYtFNIOB7xmkBwUGZSyNodMimnWgurle1c59OGCeRI2bdLYOyghdzA8Wz9TWTQnUj
	 C3oPbkdApBVaw==
Date: Tue, 20 Oct 2026 23:49:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261021064940.GC31908@sol>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>

On Wed, Oct 21, 2026 at 08:41:47AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 08:39, Eric Biggers wrote:
> > On Wed, Oct 21, 2026 at 08:26:28AM +0200, Krzysztof Kozlowski wrote:
> >> On 20/10/2026 23:22, Eric Biggers wrote:
> >>> -Make sure that base commit is in an official maintainer/mainline tree
> >>> -and not in some internal, accessible only to you tree - otherwise it
> >>> -would be worthless.
> >>> +    If ``git format-patch`` with ``--base=auto`` (or
> >>> +    ``format.useAutoBase=true``) can't detect a base commit, e.g. due to
> >>> +    the current branch having no upstream tracking branch, it exits with
> >>> +    an error. In such cases, pass an explicit base commit to ``--base``
> >>> +    instead. This is also needed if git detects the wrong base commit,
> >>> +    such as when the upstream branch has local, unpublished commits.
> >>> +
> >>> +The base commit must be in a well-known public tree, such as the
> >>> +subsystem development branch the patch is targeting. See
> >>> +:ref:`obtain_a_current_source_tree`. Mainline or the latest linux-next
> >>> +can also be acceptable bases, depending on the subsystem.
> >>
> >> I disagree, that's pointlessly too hard requirement.
> >>
> >> For many of my contributions base is obvious and not needed to be
> >> explicitly defined. For all the patches I accept, answer is the same -
> >> base is either obvious or if not and patch does not apply, then the base
> >> does not matter.
> >>
> >> Requiring it is just bureaucracy without actual benefit.
> >>
> >> The only benefit would be if maintainer COULD change its base to apply
> >> some patch with odd base... but this cannot happen. Maintainer base is
> >> fixed - it's the HEAD of his development branch for given category of
> >> commits (e.g. DTS branch for SoC maintainers).
> > 
> > There are many use cases for applying patches besides the final patch
> > acceptance, such as review (by anyone, not just a maintainer), testing,
> > CI systems, etc.
> > 
> > HEAD of a branch is of course not fixed, and changes every time a patch
> > gets applied.  That's especially relevant when wanting to check out an
> > old patch for any reason.  Trying to guess a base commit based on the
> > date and patch subject is a waste of time.
> 
> All these tools should just work on top of linux-next. Requiring people
> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree" is
> pointless. I understand that base is helping, but helping and requiring
> an obvious information just do not go together.
> 
> So again: base has ZERO meaning to the maintainer process. It has
> meaning to tools, so fix the tools to work on known and obvious trees.

So what is your proposed algorithm to apply an arbitrary patch when
there's no base-commit?  Including any historical patch (from
months/years ago), patches with dependencies, etc.

- Eric
