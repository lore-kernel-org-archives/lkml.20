Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECBF47F3CF;
	Tue, 13 Oct 2026 03:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863331; cv=none; b=G4qbkxSRLjAcZkOro99jIk2OcRD+XnKNIMFYaPNszD/bCP3iVo/96Mkd5Gg0pubAKvv9VWIfW+etL6hX57o/7vLaxZ6zrYNKFCkpdL1L8FyjRuLAVq49x3HOTw4LQBu4JP5gjl3smSOh06lbN5zm3mFH9//E6b4xA/CWdgoAHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863331; c=relaxed/simple;
	bh=JcwwFdubjAuED0BflqpGNaarAgz/XSPFMNuF6gdyhqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVt+RlM+LIwrPDBQf4mvAPiRJP9A6rh6iVTNZHHxL2d80nlnpYdnH07H2KSF8XbeeF6rHTWF+O7sfBokR+ccS2CNCQE1xmOPabTfS2KvjnJEwcpPww8FXC8+sR0Tmrmhs5BTR+mrqOZvFvasmWnEkQCv4SCPCREjPgplrTCnPEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D95J9WKE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D95J9WKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F491F000FF;
	Tue, 13 Oct 2026 03:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791863329;
	bh=Gr68N5Yl3I741vmeAmNStLekMikbH3dgfcoR17xQsIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D95J9WKE3Uf43j5UiQBW/cK8Z7qjhItXmZ3caym8pge7R/DXS1mU14xH1my12eJD4
	 lHr49nWApaljg+yObwUr9cylJiR5LF9guCkreEqK7fS7PM2d3rM5h2gzMlUMlRBxbC
	 ldFFlIkQ9YAINRzG7T/aOHmqRtzYjcebH/sdl/AkaKTDcitrY746zk4JtHCYFAVH8S
	 mxSnh04UkjmA+84orfAHkOi/2xAzuemgGqhX7AbnMUmE8mFiCtdfw7rKbjYJKCRuuU
	 AGGJ0zGPporQzxXvfsyRXO0+WXGWHrA0q6kNV8lkyh9McFwVmfYZWPnsSgnBiASSln
	 LAp+zOIU2xe2w==
Date: Mon, 12 Oct 2026 20:48:48 -0700
From: Kees Cook <kees@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
Message-ID: <202610122047.A9E381A@keescook>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <87zewiy1sd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zewiy1sd.fsf@trenco.lwn.net>

On Mon, Oct 12, 2026 at 04:47:14PM -0600, Jonathan Corbet wrote:
> Sasha Levin <sashal@kernel.org> writes:
> 
> > At the Maintainers Summit, Ted asked whether the stable trees have a way
> > to deal with incorrect Fixes tags. Hannes estimated that 15-20% of them
> > are wrong, often because the author ran git blame and took the first
> > commit that touched the line [1]. We use LLM workflows to find the
> > commit that actually introduced a bug, and others asked us to share
> > them.
> >
> > This series adds them as agent skills under agents/skills/, together
> > with a skill for writing commit messages:
> 
> Time to argue for a more fuchsia shade of mauve without actually getting
> into the substance of what you're doing...:)
> 
> I wonder about the top-level agents/ directory.  If we regard this
> material as documentation, perhaps the "skills" should go there too?  As
> readable text, they might just help to improve human skills as well,
> assuming we think we still need those.  Under Documentation, they could
> be built into the rendered docs and made more widely available.
> 
> Otherwise, if this is primarily a development tool, perhaps under tools/
> makes sense?
> 
> I lack strong opinions here, but figured I would ask the question.

I was expecting this to appear under Documentation/. The agents are
designed to read human text, so let's make it at least passingly
sensible for humans to read too. :)

-- 
Kees Cook
