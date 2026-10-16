Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CC3812D2;
	Fri, 16 Oct 2026 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167253; cv=none; b=h6dk6idBH50IWGplW4XPhhDqbifRRrfvI9YqxylefMNvoefDPwiP3anYNp4anRoBAmlaSOpF/Qq8s7mf3HOCEb57/sIew4Mlb1+6vPPts81OkTT8wwJ+JSLyGYEWoETajU3hcxWkNRz6SRjpifpvrJw/vd3Pie8xUii33EEW7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167253; c=relaxed/simple;
	bh=T/M3FgE2S0gHydqo2K66Min/mGnFLCTuCoxxmE69db8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qH/hP66kISiWJRgoWLuWjQfMzuuMUpzBySJMCNl7DHzoHCV6m5IMPvAXz1F/MNpzgRwOricmAEiVoBhWdsz/+6ymVsRj45CCAyWk10CkWw1xxkyGBLaWkURLT9251Ra1TOpRWd8HuFfZVG0HC1pH8RuDVlS172x0//8OXAhVj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otWvrSJX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otWvrSJX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB081F000C4;
	Fri, 16 Oct 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167250;
	bh=T/M3FgE2S0gHydqo2K66Min/mGnFLCTuCoxxmE69db8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=otWvrSJXHsurzGaHAbePB5oAHNk2uAGwd9jUZ02mYctQnhDhmb/6YJAXD4d4fmCrm
	 UWe6tw4FryKYSAjr5rqrvV3DH6z+2TXBQrZtMg+2uUwBTE4I1xw7pQEEcaicRTLd02
	 AZ1wsLsPQ/BJ5IqWTooQuIZHAiqK0fLGzU6tzE+bDd3fDYb+lhcvu5OVHTtS5u8ncS
	 Eu04OKEwg1gHlgQ/kp4mo3NFzv0sMqanDyCBKOqedE5GeXchXn7T+OgBbOsFl902Uk
	 QM8GDIGOZfgn14EtKmFyuxz6KCf1q5tw9tqon36TjpZ64EEF1ClKNjVlPKfgEHb5bG
	 CQPJBVWXRVnpg==
Date: Fri, 16 Oct 2026 17:14:02 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <atI_TSQXzAQFWBfx@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <20261013173240.GK4214@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013173240.GK4214@killaraus.ideasonboard.com>

On Tue, Oct 13, 2026 at 07:32:40PM +0200, Laurent Pinchart wrote:
> > Yes there will be collateral damage, but it's that or no more open source (we're
> > not the only ones going through this!)
>
> Think how you will feel the day you will be treated as collateral
> damage.

I'm already working evenings and weekends to deal with AI slop to the point
of burnout (finished work at 9pm last night, for instance), so I already
feel like I'm collateral damage.

And it's utterly thankless work. You get negativity no matter what you do
with this stuff.

I accept all that, I do it because I care. So you take it on the chin. But
the AI slop wave has changed everything.

What was already an unsustainable review load has now doubled, or tripled,
and there's every reason to believe it's only the beginning.

So now maintainership and review is thankless at an unprecedented scale,
which leads to only one thing - burnout. Possibly even the medical variety,
where you don't come back for a long while, if ever.

The project simply cannot function like this, it can't. And nothing that
requires per-submitter effort scales.

There are people sending 500 patches in 2 hours already, for instance.

The only solution that can possibly work is large-scale ignoring, because
the number of submissions can grow exponentially, and even small
effort-per-submission is vastly beyond available resource.

The alternative is maintainers quitting en masse and the project dies at that
point. So it's a choice between two bad options, but one of them is 'linux
dies'. So the other one seems better.

>
> I find this mail thread it taking an almost cynical and violent turn.
> Are people rejoicing at the prospect of actively discriminating against
> sincere contributors, or am I misreading it ? The kernel community needs
> more care.

You're misreading it.

I feel _terrible_ for newcomers. Really. It hurts me that this situation
exists.

I came up as a hobbyist from nowhere. I wrote a book thinking nobody would
care, part-time, while doing a busy non-kernel job.

And the kernel being what it is let me get where I am, for which I'm
eternally grateful.

I want to encourage talented newcomers. They are rare, and are the future
of the kernel.

I explicitly spent time at LPC encouraging newer people, in person, for
instance. I have (often behind the scenes) encouraged young, talented
developers. So in general, I've _actively_ worked on this.

And new people sending small, sensible, non-slopped patches/series will
still most likely get their stuff merged in mm.

So it's very far from the case of 'oh wow now I can just ignore everybody'.

--
Cheers, Lorenzo
