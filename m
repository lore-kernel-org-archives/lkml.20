Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986E52CCD9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897612; cv=none; b=ZirAYhx2fFnLrqUZ4vyOCwSDn7slwMx+I+TQf2L1tYGXD8GcIOIW23/1uFQ4XPUjXXbPW9dyiqDBtlCcBYXMi3tt2vH5tAa6FkjeNfh/h44oIRd4EWyQEqAvoNjWXyrtAksXLX9WGa88F+6rd+eWb+FgsuG1PvQADxr93vEKBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897612; c=relaxed/simple;
	bh=mCAEfYC7gA2zgo22YFetK9UJWNkQQOZYOVq3rcdktrk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=dNkxFI3dbPqOpxJZ6dZoLTtbYmBFKvWAfD8fqi42VbjDMkWHWTKJ05G6za67Cgpzsac7eCfTe6lw8BStNl/Hi0GxG2pS76ZKhU+y5Tt1+AdMMpCb93w4H+tCao1UqJIXakyIt4NVads36l2eMeO4SBesA9yJ0cA7PiKwIB3QoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=TvtX5ldE; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="TvtX5ldE"
X-KPN-MessageId: cee888c2-c708-11f1-bfc1-00505699b430
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id cee888c2-c708-11f1-bfc1-00505699b430;
	Tue, 13 Oct 2026 15:20:07 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id ced057b5-c708-11f1-a0c5-0050569981f5;
	Tue, 13 Oct 2026 15:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=HMuumcnvwkny6pDaBpunm3Tcil4T/jXk6RC1uFYHs4Q=;
	b=TvtX5ldE4ZDP7F0X2rmVFweAzuOFPpxBm1uQii/ZreWk4CoT3v6wg5VX9MjJtkq1BYAeyk/SZhU1n
	 q0O8QgCioHK4mDCC6bPq1nUvXRcWmTsRQBopRTX3uBTxERhFsanzfh4sAJtk/pIvHbavSmuQmhq0nc
	 C8/1ZqCl7i7lXznTWjsAaKkdbqNj07SNQrnvj+tEmb3mIdVqoXLkHFwBaICYQZV0Dm6vH5am+muigX
	 L7v2zqfcO3mgfXGHaaHkKnMwyd9OEkj0UX1npjjjDyHf8mlW34wZ70wl1lllWjoBBX/C+RBIRcPOFQ
	 fTBQ322Sz8XKmFcUEBbuktojCk1NgsQ==
X-KPN-MID: 33|58g+Rvqg7XsY2bjCAKIJ2nVOmNJSgncjLbvekHFfu/EUejp6PMwBVzzp1q0aIT4
 8ZUM94D/z7K2HMhTpptb2Q8yvV3uqe77r+I8zjkqelYI=
X-CMASSUN: 33|60wl1xjDPaO0RT31BWMemE/Iel8kpLbnkvVQ0N23HHOXvtFQ9vOnwc4ZOEWGitY
 8JwZjOUs3Krg/6+6dp80jow==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh05 (cpxoxapps-mh05.personalcloud.so.kpn.org [10.128.135.211])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id cebfd0cd-c708-11f1-8edd-00505699eff2;
	Tue, 13 Oct 2026 15:20:06 +0200 (CEST)
Date: Tue, 13 Oct 2026 15:20:06 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <28216768.791900.1791897606751@kpc.webmail.kpnmail.nl>
In-Reply-To: <20261013131056.GI4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
 <158571150.788122.1791896588591@kpc.webmail.kpnmail.nl>
 <20261013131056.GI4214@killaraus.ideasonboard.com>
Subject: Re: [PATCH] docs: remove Assisted-by reference
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 13-10-2026 15:10 CEST schreef Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> 
>  
> On Tue, Oct 13, 2026 at 03:03:08PM +0200, Jori Koolstra wrote:
> > > Op 13-10-2026 14:55 CEST schreef Laurent Pinchart:
> > > On Tue, Oct 13, 2026 at 02:28:43PM +0200, Jori Koolstra wrote:
> > > > On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > > > > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > > > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > > > >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > > > > >> tag. Remove the documentation requiring it.
> > > > > > >>
> > > > > > >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > > > > 
> > > > > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > > > > > 
> > > > > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > > > > 
> > > > > > and for those of us who don't know details about the discussion,
> > > > > > how is it redundant?
> > > > > 
> > > > > No, I mean I use an LLM constantly for almost all aspects of my
> > > > > development work, in multiple dimensions, so if the old tag requirement
> > > > > held, my email body template would just put "Assisted-by: LLM" in there
> > > > > because at the very least, it drove the build and test stage. It was
> > > > > redundant in the sense of "yeah, of course I used an LLM at some point
> > > > > for this patch". ("This tag means nothing *from* me")
> > > > > 
> > > > > > Do you assume that everyone now uses it (LLM), just as everyone
> > > > > > uses an editor?
> > > > > 
> > > > > I don't make that assumption, but I always held the position that the
> > > > > tag was meaningless because it's the human wielding it that matters:
> > > > > they either sent a good patch or a bad patch, and if it was mangled by
> > > > > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to*
> > > > > me")
> > > > 
> > > > I think the tag did have a genuine purpose for a while. Now we have just
> > > > decided to implicitly attach it to every new submitter (because
> > > > basically that is the case.) The point was that a patch that was
> > > > obviously LLM generated could be rejected for not carrying the tag, and
> > > > a patch that carried the tag could be asked to explain further (if they
> > > > had not done so.) Or at least, that is how I felt and have understood
> > > > Greg, for instance :)
> > > > 
> > > > Essentially, the way I read it, is that Linus said we don't need this
> > > > roundabout way because we can just reject effortless LLM generated
> > > > patches outright. This is good and an improvement.
> > > 
> > > The absence of the tag on a suspicious series offered a low-effort way
> > > for maintainers to push back. What's the proposed low-effort replacement
> > > ?
> > 
> > To ignore it, really. Even less effort :)
> 
> Are you saying that we should ignore series when we have even a slight
> suspicion they're not perfect ? If not, I don't understand what you're
> proposing exactly.
> 

I am saying it is up to the maintainer. The word is out and we are allowed to
ignore poor contributions, in particular if they are LLM generated. The whole point
is that in the past poor contributions were still a signal someone was trying and
it might be worthwhile to help them to grow. It is not that signal anymore per se.
We need other avenues to identify talent. The kernel mentorship program is one of
those, as is showing up in person at conferences.

The tag helped some maintainers to push back (like Lorenzo). The tag isn't needed
anymore, because the push back isn't needed. I think that's an improvement, and at
any rate was inevitable.

Best,
Jori.
