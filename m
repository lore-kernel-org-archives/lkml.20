Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045225;
	b=eHavKa3JhveHk10m7T8nDrQAFzYZBSzp4S2IEbGgXyhMeUCUmVu7R/38KWOy3OK8408T
	 Lmtg+bOhjRZJQtnjCkogXo/91zR0boIQLgAA0ghh4oerjNEMLv+PxdtdY87G7qEU5vNbU
	 GA/TaS2KrZ8Vm00UqQE4YuA21LwyQvdMgMoVDve5Qg5q6994BaCfjCSXB/FyIVbAxmAMU
	 PIIJpTH+8el7uLxfQIsxtv8AIZEhCPS3/A/GtbPp9YPjj/DEzjnjdv0zJg8LO2aB5lTd8
	 dogCWYtDJV2Ewq9gqSVb/J2R9s4eqf8RNrL8sc9JOviOaVXZE3Ed25qiKJY0MBeCryw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045225;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RjBLPOGTEWRDtuKEh9DSi8M9p5Qd1C/92HwHxjqIScY=;
	b=PxGX3CXkmYEbXEUGMgiNmFpdLepSwv7hJNw26D5j+zTlgLBwJ+is8BvmfUqK+RRJxcbz
	 21rs+313dfvZ0uDm/R1A6Brg7oJjo0NoJfwfVjUynAhmK+sAlfx73CoHxDo+fwZjfM166
	 jvMzPPcNwJzlUJyvpl9Ljg6epXsGf8qHp3zP8gkAUR/D0vYHO27ne5FZqGzcRx6uHNs8V
	 l0r6iqKNq1iA8RZKX9ssDrtnI7FecnCatjSucxIWBVA9fko4/I9JGnkNLT85OwONj00cS
	 W9ZOGIbf0MyaWupFNmbb4NTKgRHkC0BzFqrD3o447h8tthyc3R4lDbPmVLA03Vkqt4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WT52gwbh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A7D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WT52gwbh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77651F01825;
	Mon, 26 Oct 2026 20:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793045224;
	bh=RjBLPOGTEWRDtuKEh9DSi8M9p5Qd1C/92HwHxjqIScY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WT52gwbhOQN1Ks/BJhhPcavJSBeijjaD87P+pc4Sq6oMWWqaGzadpVcwEPiDW6LPo
	 6qdeXlXiT+gt5WdxnlucVI2ckVSbrjX3hr9IIevTPcic9N6VBxEtziod1o4djsWyVl
	 TcVJ6qUHRpltBisqhGeGYheS7Jx8lZciTlgpAindPTqc8MWY3J9rk92V2Buys2doKF
	 LL0Qy8OQ0oe6Yvh6O7HCGiC7tw0qtd5xqsc+nQ6UhDks++eif1Fiw87FF/9LiZFYi3
	 i11HXMqcH8OvlyZY+NQfrAsTFtics89iLWdTi71RKyVia8Smv4W6YaZ62r3tppe+Fa
	 6KBumkvd7Ek0A==
Date: Mon, 26 Oct 2026 20:07:01 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [GIT PULL] LEDs for v7.4
Message-ID: <20261026200701.GG2195460@google.com>
References: <20261026152012.GD2195460@google.com>
 <CAHk-=wgdJOTies4qhrDKFERAYdGS_=6SiGu_onr19qftqKvfrg@mail.gmail.com>
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
In-Reply-To: <CAHk-=wgdJOTies4qhrDKFERAYdGS_=6SiGu_onr19qftqKvfrg@mail.gmail.com>

On Mon, 26 Oct 2026, Linus Torvalds wrote:

> On Mon, 26 Oct 2026 at 05:20, Lee Jones <lee@kernel.org> wrote:
> >
> > Good afternoon Linus,
> 
> Lee,
>  your pull requests are already fairly unreadable because they aren't
> exactly summaries, they are long lists of details.
> 
> But darn it to heck, that is *not* made better by then repeating the
> same long list of details *twice* for no apparent reason.
> 
> > LEDs for v7.4
> >
> > - New Support & Features
> >   - Core: Add `led_trigger_notify_hw_control_changed()` to allow drivers to notify the
> >     core of autonomous hardware control transitions
> >   - Core: Add the `hw_offloaded()` trigger callback and [...]
> [...]
> > - New Support & Features
> >   - Core: Add `led_trigger_notify_hw_control_changed()` to allow drivers to notify the
> >     core of autonomous hardware control transitions
> >   - Core: Add the `hw_offloaded()` trigger callback and [...]
> 
> Please try to make your pull requests more readable. Make them
> explanations of what the pull brings in - highlighting important parts
> but at the same time *summarizing* thg contents, not just listign
> every single detail. Much less twice.
> 
> The goal of the pull request message should be to explain why I should
> pull it, but also act as documentation for what has been going on.
> 
> The *details* are in the individual commits. Nobody wants the details
> repeated, people want the highlevel "what's up, what's interesting,
> what is this bringing to the kernel".
> 
> And the merge message is there as documentation for others to read, to
> get an overview of what is going on - both if things work well, but
> also if some merge ends up causing problems. That's when people look
> at merge messages - for people do a "git bisect --first-parent" to do
> a rough "which merge caused this problem", but also for people who
> aren't experts on some particular subsystem but still want to get an
> idea of what has happened.
> 
> A suggestion I've given other maintainers is to treat the pull request
> not just as a "let Linus know", but also think of it as the thing that
> sites like linuxnewbies and phoronix woudl be able to use to then let
> people know about what is going on in new kernel versions. So yes, the
> email is for me to know what I'm merging, but it's *also* for those
> kinds of third parties (the third parties may be kernel developers
> too, who just are working on other parts of the kernel but want to see
> what is going on elsewhere - again, not interested in individual
> commits, but in the "big picture")
> 
> And yes, when an already not very easily readable version then shows
> up twice, that is just annoying.

Sorry Linus, this was a <copy>-<paste>-<paste> error during tagging.

Also, noted on the verbosity.  I'll summarise more in the future.

-- 
Lee Jones
