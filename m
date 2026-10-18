Received: from bc (unknown [162.221.207.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E43F4DDB;
	Sun, 18 Oct 2026 16:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.221.207.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342380; cv=none; b=R2Z51o2sz1vEuFhj5p92pLITLMGG5vgYRO4tnr1Ujb8UXcRBok4VSYpvRG/h78y4WzW71NVBLQWrrYd1U1zF047p5lsWDsGkDdNH0RXFnBgjmqEg2+/e4d3pMSw/nWJCgkRWsFHWSJ8ao91XNMbi3LR0D2IDctN2XRgZ9seyVTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342380; c=relaxed/simple;
	bh=Kg2AXVDhPrTDy8CkhVXcDk7Y5rEjwYoSyc60dsQZJec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pweKgmlAwmlMe1KCtqjn4zUXxzELyTj9nTSbPx7Zr3LRo1zkxfsa42B5I/cR8fh+gpeHPoQTy/XPVEkkW40wI3cwgsEzIAhsTwp3AfQe4ISPR1PBYiLT9ArkrzboZnABYagA8TvoyqA9+dJrAKhkbsNRm4WAEymHVpbFqSH/Sb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org; spf=pass smtp.mailfrom=7el.us; arc=none smtp.client-ip=162.221.207.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=7el.us
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by bc with local
  id 000000000004005D.000000006AD4F962.002B0316; Sun, 18 Oct 2026 16:52:50 +0000
Date: Sun, 18 Oct 2026 16:52:50 +0000
From: Troy Benjegerdes <hozer@hozed.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
  Shuah Khan <skhan@linuxfoundation.org>,
  Randy Dunlap <rdunlap@infradead.org>,
  Federico Vaga <federico.vaga@vaga.pv.it>,
  Daniel Pereira <danielmaraboo@gmail.com>,
  Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
  Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>,
  Joe Perches <joe@perches.com>,
  Linus Torvalds <torvalds@linux-foundation.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Krzysztof Kozlowski <krzk@kernel.org>,
  Steven Rostedt <rostedt@goodmis.org>,
  Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
  Jori Koolstra <jkoolstra@xs4all.nl>,
  Jeff Layton <jlayton@kernel.org>,
  Christian Brauner <brauner@kernel.org>,
  David Hildenbrand <david@kernel.org>,
  Vlastimil Babka <vbabka@kernel.org>,
  Jakub Kicinski <kuba@kernel.org>,
  Christoph Hellwig <hch@infradead.org>,
  Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
  Brian Foster <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>,
  David Disseldorp <ddiss@suse.de>,
  Jani Nikula <jani.nikula@intel.com>,
  Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Message-ID: <atT5YvJs3JYIkF5h@false>
References: <20261013121501.3738437-1-sashal@kernel.org>
 <87o6cww7c1.fsf@trenco.lwn.net>
 <as-2MbhDdCN2trMe@laps>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <as-2MbhDdCN2trMe@laps>

On Wed, Oct 14, 2026 at 01:04:49PM -0400, Sasha Levin wrote:
> On Wed, Oct 14, 2026 at 10:54:54AM -0600, Jonathan Corbet wrote:
> > Sasha Levin <sashal@kernel.org> writes:
> > 
> > > Remove the Assisted-by sections from coding-assistants.rst,
> > > submitting-patches.rst, and the Italian, Brazilian Portuguese and Traditional
> > > Chinese translations, and drop the handling of the tag from checkpatch.
> > > 
> > > [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
> > > [2] https://lwn.net/Articles/1099594/
> > > [3] https://lore.kernel.org/all/2026101327-cupid-legal-6cf6@gregkh/
> > > 
> > > Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > ---
> > > Changes in v2:
> > > - Expand the changelog with the background and the Maintainers Summit
> > >   discussion (Laurent, Krzysztof, Greg, Lorenzo).
> > > - Rebase on docs-next and also remove the Assisted-by sections from the
> > >   pt_BR and zh_TW translations there.
> > > - Collect tags.
> > > 
> > > v1: https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
> > 
> > OK, I have applied this, thanks.
> 
> Thanks Jon!
> 
> Also ping re: the AGENTS.md patch. Without it, we'll get very mixed results
> with just this change, where agents will pick and choose different policies
> around Assisted-by: because nothing is pointing them to the actual guidelines
> we have.

I agree with the general maintainers summit consensus that the previous
policy was not functional for the original intent. A tag that generally
only has one field of "LLM" is redundant and useless.

That being said, I think it is a major mistake to entirely remove the tag.

What I would like to see is some clear strong guidance and culture that
if we are going to encourage new people, new language models, and new
types of tools that haven't been invented yet, we can and should include
some reference to what those tools are.

For instance, in this message my tag would be Assisted-by: Vim, Debian, Mutt

As an open minded skeptic of AI tools, I'd really like to see in
metadata that's easily searchable with grep on what tools others are
using. For instance, I'd really like to know the toolset that was used
to generate "Improve page refcount scalability" [1], but it was not 
immediately obvious where to find this information without Gemini's 
assistance.

My proposal would be that we re-instate "Assisted-by:" as an optional
but highly recommended tag to document any *legally significant* AI,
LLM, or really *any* tool which is not generally available under the
Debian Free software guidelines [2]

If someone would like to suggest a command-line focused AI toolchain and
a set of Agent skills or other prompts, I'd be happy to put together a
patchset. I'd really prefer to use a fully open source LLM with open 
training data, but I think that's asking for too much at this point.

[1] https://lore.kernel.org/lkml/CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com/
[2] https://wiki.debian.org/DebianFreeSoftwareGuidelines
