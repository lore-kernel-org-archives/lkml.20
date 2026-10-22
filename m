Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.221.207.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675260;
	b=f9keUyfWdSe0HmtymA7reDeVk4gqAYKCLdqDGWvc3q8hh0BfBqEA0mVjCAgd5+aQ5M9j
	 +TVHAZJK4mIt9lsJpCNjI/nh2wt1MwveUuVQmI8XYiuTitJjhihkA0CMf6uKDDdOPmW7q
	 MGf1rPdBCP9d98qUkf8T/1QpLauSmWIE+Gj8K1RIOI94LvW26u2IwGBrAFdcSSUe3Facv
	 sUsmY2fjoGz8oPuhAX2wVsVygx6yxIe7U5QCo1ZO3MIWd8aMTH5dVQ0RQ5PWjaUweV6Dm
	 qlS1TbNVTOLu7f4+iuOyVE+a8iHu2osU0h6Uy2PW6F0UqKkVZr8lUmVn+oKvDNl0Iag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675260;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:In-Reply-To;
	bh=8sSUVj3k8bHSogQkYAgnak+1LXzp/s9rsz6uPbE7IJ8=;
	b=YGgAaGNs9FQmg/IYm72MIeM5+yt/E0/tq8vJUF6DOa3LA5luUyGW8m6tFd4RWYzZ4Vyh
	 sMbc34XF728VRE33vqs9acHBzHYcp74CS3WzH24Qa7UD/M2oy8g+2hnDUQqoXt4v0kYaL
	 AnxO46N7ZUVkiFADoSnI1KazeMXuJrWJpz6TLO6qdoug1tqHgYU+H2nGmp51UnpLa8Lch
	 aXqqyh67MzEU66MO2IBrPpnmW5rsG/EYZvY13Ae3i/kDJYR38nxJH4wDNf4A4FyNE32Xn
	 +S37HzgSc4ZPEpTYODwMdCpQOtP3l7BEeBqtuLa6ZnRSlxR5uWPDf3Hmtv8KITmZvMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hozed.org;
	spf=pass smtp.mailfrom=7el.us;
	arc=none smtp.remote-ip=162.221.207.43
Received: from bc (unknown [162.221.207.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00CC606A319;
	Thu, 22 Oct 2026 13:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00CC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=7el.us
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by bc with local
  id 0000000000040066.000000006ADA0DBA.002ED3FD; Thu, 22 Oct 2026 13:20:58 +0000
Date: Thu, 22 Oct 2026 13:20:58 +0000
From: Troy Benjegerdes <hozer@hozed.org>
To: lyude@redhat.com
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Kees Cook <kees@kernel.org>,
  Randy Dunlap <rdunlap@infradead.org>,
  Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
  skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
  apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by reference
Message-ID: <atoNuurgxrKV4aid@false>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
 <202610130120.E43D236E@keescook>
 <as4gLo_6acb_zZu0@daedalus>
 <4a55a48948a1f01686b0471307b6fc2d52be7896.camel@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <4a55a48948a1f01686b0471307b6fc2d52be7896.camel@redhat.com>

On Mon, Oct 19, 2026 at 12:15:38PM -0400, lyude@redhat.com wrote:
> On Tue, 2026-10-13 at 14:28 +0200, Jori Koolstra wrote:
> > On Tue, Oct 13, 2026 at 01:25:59AM -0700, Kees Cook wrote:
> > > On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> > > > On 10/12/26 9:24 PM, Kees Cook wrote:
> > > > > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> > > > > > The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > > > > tag. Remove the documentation requiring it.
> > > > > > 
> > > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
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
> 
> I know plenty of people who would love to contribute to the kernel who
> haven't before, who do not want to be involved or use LLM tools in
> their own development. Considering how much LLMs lower the bar for
> people to be able to submit fixes, I think it's also worth pointing out
> that just because you've sent a patch doesn't mean you're a contributor
> who is going to actually come back or is actually interested in trying
> to get a patch to the finish line. I've even ran into 'contributors'
> who wouldn't even avoid using an LLM to respond to review feedback
> which makes it nearly impossible for them to actually retain any of the
> critique they've received on their work.

This is why I'd like to know *which* LLM I'm dealing with, so at least
if the human is not paying attention, maybe the LLM developers will care
enough to provision a large enough context window to actually retain the
critique.

> > obviously LLM generated could be rejected for not carrying the tag, and
> > a patch that carried the tag could be asked to explain further (if they
> > had not done so.) Or at least, that is how I felt and have understood
> > Greg, for instance :)
> > 
> > Essentially, the way I read it, is that Linus said we don't need this
> > roundabout way because we can just reject effortless LLM generated
> > patches outright. This is good and an improvement.
> > 
> > What do you think about requiring people to explain how they used an LLM
> > for code generation? I don't care if someone uses it for review, or
> > brainstorming, or whatever, and I have never understood the tag to be
> > required for that. But if the code is LLM generated, it would be nice to
> > know for instance what prompts you used. We should have some way to not
> > devolve into the maze that Jonathan Corbet has sketched, where no one
> > really knows what's going on.
> 
> Prompts aren't deterministic, and this also expects that everyone is
> using LLMs (most of the contributors I work with do not actually use
> LLMs, and most of the ones who do stop short of actually generating
> code outside of large tree-wide changes with it). There are also
> already drivers in the kernel which have adopted their own no-LLM
> policies.
> 
> I have wanted better tagging for a while, because I do agree Assisted-
> by: isn't great, but just going "well you can reject slop :)" makes it
> dramatically more difficult for me to tell the difference between a new
> contributor who just doesn't know how to structure their patches
> correctly, and one that just let their LLM take the wheel and barely
> understands what they sent to me.
> 
> Something that would be dramatically better, and I really hope would be
> considered over the nuclear option of just dropping this patch:
> 
> Co-authored-by: LLM
> Reported-by: LLM
> 

Automated-by: LLM ( env: LPttYC3GoXNrBqGfLT7tTbNHm8SiUpBwYz )

If we're really going to be open to new tools, maybe it's time to start
having one or more linux-llm forks that are entirely maintained by tools
and the only thing the humans are doing is deciding which one to run and
posting prompts like this to the mailing list.

The one I want to be using for farm robots is going to be the version
that has a credible path to including the hash tree of signatures of the
LLM model weights, the Nvidia GPU driver version that ran the tool, and
a cryptocurrency address to fund the tokens needed to run the automation.

In the example above, which is the FSF's Litecoin donation address, all
of this information could be included as transaction metadata associated
with the address.

> > 
> > Best,
> > Jori.
> > 
> > > 
> > > -Kees
> > > 
> > > -- Kees Cook
> 
> 
