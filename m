Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DE54529D;
	Tue, 13 Oct 2026 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922594; cv=none; b=Do6aA6yLY0eZxFWzLJ8F7K7+MSnEZma0+GeQqf/ha18S/ov0j9GDE2h05HNEngU8rkrqAxGSbl3XSTFErDw0MOdGat5fB0td+tL2U3WX9nLG6oOIIhm1sjbaenBWFuQNiOC107jiG70SVC8QOZSnzGipW+aX6EBwJ3VAlN//E+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922594; c=relaxed/simple;
	bh=G9fzofN7cMi8sVJA0pNWiJAX0zQLQeRDou9I5f76JS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjOQ8Do06skyqZwKlwGdTNti4jQuEZppLPis2X+UCLAAQkxTE7GPdEuCcHdXqlXzvEdXrYftvKEP//odzCbnh0AeoSGngx/Ikl2tA3mnTvG7BcSDdvEk+8gMwpuAAeJaQZbmoRnh6hs/ow7vW1wDR3I/iMgczQiujszcPRA2gUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OYGZ2ecJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OYGZ2ecJ"
Received: from killaraus.ideasonboard.com (unknown [109.141.100.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 448301E4;
	Tue, 13 Oct 2026 22:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791922468;
	bh=G9fzofN7cMi8sVJA0pNWiJAX0zQLQeRDou9I5f76JS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYGZ2ecJvqeimtJQBVQPcRHZUEa+GYjEbuHzovpzwJFJnUfTtjOTLB3WVQhJh/ztu
	 83g/06kbzhURrpXcMw3hrwwl5a3c0OWDL76mhNg7JNzwAkFqKGa9ieNZDe/FVEUIVz
	 i+AhPniw9aHe/fynHayWyXN7RKtBNOfcVloN89vM=
Date: Tue, 13 Oct 2026 22:16:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kees Cook <kees@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261013201628.GO4214@killaraus.ideasonboard.com>
References: <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl>
 <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com>
 <202610131216.C841415F01@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202610131216.C841415F01@keescook>

On Tue, Oct 13, 2026 at 12:25:03PM -0700, Kees Cook wrote:
> On Tue, Oct 13, 2026 at 07:42:43PM +0200, Laurent Pinchart wrote:
> > I'm increasingly thinking that the Mesa policy of requiring commit
> > messages to be manually written (possibly with machine translation)
> > could be applied to the kernel.
> > 
> > I've heard multiple people saying how using LLMs made them more
> > productive, with an extreme example during the maintainer summit of
> > Linus talking about doing in a couple of months what would have likely
> > taken multiple years. The same people like to tell how they're in charge
> > of the whole process, how they control the machine, and how they have a
> > deep understanding of what they're doing. If that's the case, surely
> > writing a commit message will not increase the development time back
> > from a few months to a few years, the extra effort would be negligible.
> > 
> > Most commit messages generated by LLMs are quite easy to identify today.
> > Requiring a human-written message would be a good way to quickly ignore
> > patches submitted by meat proxies. And before anyone tells me this will
> > change very soon with <insert employer's new model>, I'll say we will
> > update our process when that happens.
> 
> I agree on the face of it, but it's just as unenforceable as the
> Assisted-by tag was. :(

Perhaps, but I think that's missing the point. The SoB line is not
enforceable either. Very few of our requirements and assumptions can be
enforced. We're not telling people they can get backdoors merged in the
kernel because we can't guarantee 100% that one won't sneak in.

What this is about is setting our expectations, telling what we want and
what we don't want. There's still value in that, and I'd argue there's
even more value now. There will be people who won't care, there will be
people who cheat. We've always had those, we'll keep having them, and
we'll keep rejecting their contributions. I really don't get the
unenforceable argument here.

> My own recent commit logs are, like the code, a
> combination of work from me and the LLM. I trim and edit and reorganize
> and add/remove stuff all the time (code or commit log). And all the
> while, tweaking its rules for how to write prose, so I do less and less
> editing. (And maybe my commit logs are now too verbose? I'm not sure;
> I've regularly been told I was too terse before, so hopefully there will
> be a balance found.)

What would be your issue with writing commit messages manually ?

> And as far as spotting this kind of thing, I've already failed the
> Reverse Turing Test[1], where I thought some of Lorenzo's (justifiably)
> verbose commit logs were all LLM generated, so the inflection point for
> clearly distinguishing is here or fast approaching.

Again, we're not aiming for 100% accuracy, we've never considered that
goal reachable, LLMs or not.

> -Kees
> 
> [1] https://lore.kernel.org/all/202609150943.000EC9277@keescook/

-- 
Regards,

Laurent Pinchart
