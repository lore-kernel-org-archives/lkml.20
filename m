Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619A2E06E4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896661; cv=none; b=NdyYrhr0K4sV3mnT1jCg+zxg6q/a1LauLHToM+5oRsigh5jsax9CuaxgScFKzUD74Ve4cIp0nI4ttCcotGslNDqjyY9a6L9AhdP1nyuK7UStXRwo7iZBTNuszBfPObUXZgUIpbWigi0E8Q/xN4+H29SVVMrqjJEX+j8HcV57M3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896661; c=relaxed/simple;
	bh=lrijtuWmKwDDILeCMwYY3Sd3CUnCrwDE7vsIgjD++7A=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qacE1YTBQ8UlDzuAiqL3uWsb/ybKWHoijRcuExC+bHuI1tt5ckfyjZPWg/FGAWCV+lNUDBpqtKCWzS8Wcqa9pJoIgO7/w2zgeEUiXjmCo+lhMlFEoAVY5isuHlU76WRECHTQ3eQTIMgRVt3uHuswkWO9Tv9tp5CvvuZpk+mSlh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=HJIqfHnN; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="HJIqfHnN"
X-KPN-MessageId: 6ffd0a7b-c706-11f1-bfc1-00505699b430
Received: from mta.kpnmail.nl (unknown [10.31.161.188])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 6ffd0a7b-c706-11f1-bfc1-00505699b430;
	Tue, 13 Oct 2026 15:03:08 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 6ff27a77-c706-11f1-ac16-00505699693e;
	Tue, 13 Oct 2026 15:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=+vQgJL8MMGFhwYStVksSoppS6NdeKAy6mIy/hJhtSag=;
	b=HJIqfHnNYGjyT668OaUoDe3gsYQQk2nGPABNaz8iL5iiAZHci+2hKcWWYGhWSG+rmvseLzkLUWBVh
	 oSz5d+54F95pmsZD044t2nlPMM6kSG+7pmvAcbrM+jvV2U9epWbCSyUPqGqzL7OkiTn5CPPsjN8xvs
	 SQvo2NBF+HpJZ68N1mHF6tnuWEmb1/5UXd9K8erm6WEc5oaVaQkguj8PlD09LNdS4CUKFjHOQeGDOG
	 nwDKLTKAbwh6I0xEzRWcvc1ejYcD4EibpZbVcj/X4/+1CwGmBUADo9QjJ8hm2tmivTnjICN8gOpxqK
	 cTMU8Q3/Mys3sn0+LnUWwDnPeDUG6pw==
X-KPN-MID: 33|H4Vr3p2pgw67wyy+j6XhcwTitlw3OHPFMqwUz7Vjlwd2gL/tI8tzZP22Gdg7Opc
 XG4+qvfu0SUEZoYi26tVvaK9lCh1TKSKv1iGSaOhj7BM=
X-CMASSUN: 33|JoxRtGfIGlM4EJ2UoF9A67B7jdn2tU0ZuGu9Leo4e2sOROFV2UBL2zT/b6Gbabb
 X22GoYSqAJ9ZO5FUkY3lmfw==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh05 (cpxoxapps-mh05.personalcloud.so.kpn.org [10.128.135.211])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 6fe0ea2e-c706-11f1-916a-005056995d6c;
	Tue, 13 Oct 2026 15:03:08 +0200 (CEST)
Date: Tue, 13 Oct 2026 15:03:08 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kees Cook <kees@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <158571150.788122.1791896588591@kpc.webmail.kpnmail.nl>
In-Reply-To: <20261013125559.GG4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook> <as4gLo_6acb_zZu0@daedalus>
 <20261013125559.GG4214@killaraus.ideasonboard.com>
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


> Op 13-10-2026 14:55 CEST schreef Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> 
>  
> On Tue, Oct 13, 2026 at 02:28:43PM +0200, Jori Koolstra wrote:
> > On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > > >> tag. Remove the documentation requiring it.
> > > > >>
> > > > >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > > 
> > > > > Yup, it has become as redundant as specifying what editor I use. ;)
> > > > > 
> > > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > > 
> > > > and for those of us who don't know details about the discussion,
> > > > how is it redundant?
> > > 
> > > No, I mean I use an LLM constantly for almost all aspects of my
> > > development work, in multiple dimensions, so if the old tag requirement
> > > held, my email body template would just put "Assisted-by: LLM" in there
> > > because at the very least, it drove the build and test stage. It was
> > > redundant in the sense of "yeah, of course I used an LLM at some point
> > > for this patch". ("This tag means nothing *from* me")
> > > 
> > > > Do you assume that everyone now uses it (LLM), just as everyone
> > > > uses an editor?
> > > 
> > > I don't make that assumption, but I always held the position that the
> > > tag was meaningless because it's the human wielding it that matters:
> > > they either sent a good patch or a bad patch, and if it was mangled by
> > > gmail or an LLM, it doesn't really matter. ("This tag means nothing *to*
> > > me")
> > 
> > I think the tag did have a genuine purpose for a while. Now we have just
> > decided to implicitly attach it to every new submitter (because
> > basically that is the case.) The point was that a patch that was
> > obviously LLM generated could be rejected for not carrying the tag, and
> > a patch that carried the tag could be asked to explain further (if they
> > had not done so.) Or at least, that is how I felt and have understood
> > Greg, for instance :)
> > 
> > Essentially, the way I read it, is that Linus said we don't need this
> > roundabout way because we can just reject effortless LLM generated
> > patches outright. This is good and an improvement.
> 
> The absence of the tag on a suspicious series offered a low-effort way
> for maintainers to push back. What's the proposed low-effort replacement
> ?
> 

To ignore it, really. Even less effort :)

> > What do you think about requiring people to explain how they used an LLM
> > for code generation? I don't care if someone uses it for review, or
> > brainstorming, or whatever, and I have never understood the tag to be
> > required for that. But if the code is LLM generated, it would be nice to
> > know for instance what prompts you used. We should have some way to not
> > devolve into the maze that Jonathan Corbet has sketched, where no one
> > really knows what's going on.
> 
> Listing the prompts seems fairly useless to me. Not only do prompts
> capture only a small submit of the information you would want (many
> people use custom agent files with lots of rules that supplement the
> prompts), they don't show that the submitter understands what they're
> doing.
> 

I'm not sure. Maybe requiring prompts is not the best way to go about it,
it may be a lot of annoyance to go back through your conversations and
see what prompts were relevant. I do think the prompts still likely show
whether you understood what you're doing, assuming they were authentic.

> Mesa has a policy that LLM-generated code *must* have a human-written
> commit message. They go one step further by requiring all comments in
> the code to also be human-written. That seems a better (but possibly not
> good enough) way to try and gauge the level of understand from the
> submitter.
> 

Yes, requiring human written commit message sounds like a good idea. Only
leaves the issue of people using LLMs for translate. But I think we could
find a way around that.

> -- 
> Regards,
> 
> Laurent Pinchart
