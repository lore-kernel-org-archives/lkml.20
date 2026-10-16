Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458142AD77;
	Fri, 16 Oct 2026 18:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174661; cv=none; b=ZMwkafu4xJzjo5gKWw0cIYClc+MJpTDEmjA3AGxvIhS780t92oTJYMoGTW3DwWgCG1p/OAzK6pnOkTI8qjnLHTMadWAZj2Wlrfdzxrm8bKBSN7c2gdfi3FQj6/54ShL0buXP33CHWsvZ8UhBYY1+e7AprvEVtECdD94luCY/lG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174661; c=relaxed/simple;
	bh=YxojJCCF5/gNlh6H4FrSNIbVQn47AQ2+IFvsiqA5Vow=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I3WaziT2WNr4o7qaqEyYyjffv1cCOi1UQlsjnXaVMiUeU0yzpa4qE+MUbL9XGx1dkE6iXK192Ek6TLYsBM3WjTyPBJY+qYgJo2ti9J18oPiRO3PCg2c/8oPmz+kE2VQM3H+C9gvMKy+NIoK0rGFQXB8B7vvTiKA0fIok1g0v1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=gENkXm6O; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="gENkXm6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EfGMqL0IhSpFTglHd7tGknfphlDKhLPLsAlGcmCdo28=;
  b=gENkXm6OuHFPhmxlrAJ/GLur7fcbF1bVLzDhkDfqyqswbrxt0TlbNSwo
   X6W63hRj5zDk0/DydcjK8ohCANG9rXtEqppMcDOmHLKiig+vBYIqRtIH/
   zorafFYqAllodXuTvZD/HAIHzekQUYOD6jRrQcRMaILVWFQ+zlg5F/d0K
   E=;
X-CSE-ConnectionGUID: aSKXPtIGRBm69brpE3lMUw==
X-CSE-MsgGUID: J5F8a1jxT7aAIVJpBXRTag==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,162,1787004000"; 
   d="scan'208";a="160071971"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 20:17:27 +0200
Date: Fri, 16 Oct 2026 14:17:25 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sasha Levin <sashal@kernel.org>
cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
    Theodore Ts'o <tytso@mit.edu>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Leon Romanovsky <leon@kernel.org>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    Thorsten Leemhuis <linux@leemhuis.info>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v3 6/7] agents: add a skill to find other instances of
 a fixed bug
In-Reply-To: <atJoYRBujlGx0xTV@laps>
Message-ID: <50531bd9-f3ea-2d45-7b3a-a96a446a8fcc@inria.fr>
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016152828.3765695-7-sashal@kernel.org> <957f530-7954-3e2c-9975-d369af37270@inria.fr> <atJoYRBujlGx0xTV@laps>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 16 Oct 2026, Sasha Levin wrote:

> On Fri, Oct 16, 2026 at 02:00:15PM -0400, Julia Lawall wrote:
> >
> >
> > On Fri, 16 Oct 2026, Sasha Levin wrote:
> >
> > > A bug fixed in one place often exists elsewhere, in copied code, sibling
> > > drivers, or other users of the same interface, and reviewers routinely
> > > ask whether that was checked. Left alone, agents tend to audit the whole
> > > tree by reading it. Add a skill that states the defect as a rule,
> > > searches for it through shared interfaces, copied code, the introducing
> > > series and earlier fixes, and verifies each candidate before reporting
> > > it.
> > >
> > > When Coccinelle is available, the skill searches with a semantic patch:
> > > it looks for an existing one under scripts/coccinelle/, checks that the
> > > rule marks the fixed site in the code before the fix, runs it over the
> > > whole tree with coccicheck, and checks which code spatch could not
> > > parse. These steps live in references/coccinelle.md, which the agent
> > > reads only when it uses Coccinelle.
> >
> > Could I get some feedback from this?  I would be interested to know about
> > code that it can't parse.  Maybe AI could write a semantic patch and try
> > it?
>
> Right, this is exactly what the skill currently says:
>
> +2. Otherwise, write a semantic patch outside the repository. Match only what
> +   the defect needs, not names or statements specific to the fixed site. Mark
> [...]
>
> I'd expect the agent to have information in the transcript about this, or are
> you looking for something different?

I just want to know how to find it, or ideally if it could be reported to
me (or to the Coccinelle mailing list).

thanks,
julia
