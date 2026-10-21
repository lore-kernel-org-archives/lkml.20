Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564779;
	b=QzUTOjXgQOyHWRHv0/nTNgUZLKqI8NVTMS8H/vYGYeWPWhD/fI60qQAFbLH8CVopx2M6
	 c03s6rLiZEwMbL9SSAc/aHultJhzDnbJwtWLWJFGl4W3LdaQBcRtPREqBnTay3rPc8Udu
	 FCA7UMNBieW1D9nSxrym7oNuBcXxfHBMT3CE4DHyIcc6kZkNgLMmf+sLXFgrDlpAzIWCc
	 nArUg9oq24pRcdViXnqjmR+HEuY7y+Exp2djYhOOp9BEm7tEvuK217FoRTK63l1bjCtx/
	 izVCtx+MZC3C/IPgItoA0bhBoFID+37ZYlxjPzVGQ11IP6yh7D69RXl20uuTS7tzKkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564779;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=21b2QNCGShmTQj++SAkaufZOZXmnGGESSq3T3u34PKs=;
	b=ZFs5G+3uMudtA6roTedcMY1tZVD/5GlofWT0ADb5RE5ib3aN/VtREg3BJsGQSwRQN3Fk
	 Zdy/hMeS1rkKPaaFdcPu01oQ+im4/KNiQdQbHJv1qk/NaIQVE0ZumukLrJ0pEDAmXW04D
	 yeB8H2hUGHEKkix2+SVLE/ouHX0M9HOJacCI+Ux4CF4mjc/kNy1Ij1ypHrlKth+n7wex4
	 MDrwI5jsLMVYvA1NcDAy6N9i6EoMKBe/UJLa9uiSaTv7C11vsTBYBApRifaRrnC2RcPut
	 pZIyNEQDFIFBWa0NmKxua1VlmPdC3xG3sfa7rstfYZsulz8uv5RTIAswwLvJi8CRmwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWHIX8wo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13606606A31D;
	Wed, 21 Oct 2026 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWHIX8wo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D871F000C9;
	Wed, 21 Oct 2026 06:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792564778;
	bh=21b2QNCGShmTQj++SAkaufZOZXmnGGESSq3T3u34PKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XWHIX8wotz7txdaPPyxzdJHzBbrYBqx6pEVyKfJVPZ0mcssGL9xfPoP9oj9ePTdXm
	 EUgUUZSyUUUjYOelJ5bQcNQhaLKsIN6roW7k9Z10ZgS4OQTQsiHjCnIIsqegCu2cLP
	 etv7YqkyqI+NeK1f+mvHU4QOHhpZ1xTE1S3aVF2V6aqlGX1qxCPMD7Bz78XR7Sbx51
	 sirS2MOiMOL6vvqfTmbtQFFoYYo9mBgNwvaiUWZuu2wOw6MfTGXxkoj1K5lXEtAfJO
	 C2SMvp3q5aRHfTHzvi5ryOEXExpDDswSXeI6s4tMvqAPvanZkfjc3kn2HxtvdZkzY5
	 sQh9qSKvLoddg==
Date: Tue, 20 Oct 2026 23:39:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261021063927.GA31908@sol>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
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
In-Reply-To: <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>

On Wed, Oct 21, 2026 at 08:26:28AM +0200, Krzysztof Kozlowski wrote:
> On 20/10/2026 23:22, Eric Biggers wrote:
> > -Make sure that base commit is in an official maintainer/mainline tree
> > -and not in some internal, accessible only to you tree - otherwise it
> > -would be worthless.
> > +    If ``git format-patch`` with ``--base=auto`` (or
> > +    ``format.useAutoBase=true``) can't detect a base commit, e.g. due to
> > +    the current branch having no upstream tracking branch, it exits with
> > +    an error. In such cases, pass an explicit base commit to ``--base``
> > +    instead. This is also needed if git detects the wrong base commit,
> > +    such as when the upstream branch has local, unpublished commits.
> > +
> > +The base commit must be in a well-known public tree, such as the
> > +subsystem development branch the patch is targeting. See
> > +:ref:`obtain_a_current_source_tree`. Mainline or the latest linux-next
> > +can also be acceptable bases, depending on the subsystem.
> 
> I disagree, that's pointlessly too hard requirement.
> 
> For many of my contributions base is obvious and not needed to be
> explicitly defined. For all the patches I accept, answer is the same -
> base is either obvious or if not and patch does not apply, then the base
> does not matter.
> 
> Requiring it is just bureaucracy without actual benefit.
> 
> The only benefit would be if maintainer COULD change its base to apply
> some patch with odd base... but this cannot happen. Maintainer base is
> fixed - it's the HEAD of his development branch for given category of
> commits (e.g. DTS branch for SoC maintainers).

There are many use cases for applying patches besides the final patch
acceptance, such as review (by anyone, not just a maintainer), testing,
CI systems, etc.

HEAD of a branch is of course not fixed, and changes every time a patch
gets applied.  That's especially relevant when wanting to check out an
old patch for any reason.  Trying to guess a base commit based on the
date and patch subject is a waste of time.

- Eric
