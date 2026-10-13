Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7145C4BD785
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890455; cv=none; b=U5drZpTDFawZ/smlBABXBqVlfJqpAsBFFUgSHTbBm6B/zFuhB1eeXVSVBrSSiKMaDsvrMT8TeE7AdBYBDYTvnZB7CdEn85k6ZQ3hfjAecKzWfj2VKtkvLw3ctB+UNA60m59UVbvXMv5q9Q+w1bhvOX4kcRWUbwlkr31FLJvvuHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890455; c=relaxed/simple;
	bh=wgqVJLV/dQe4e9VtDaaTOVnmJg6e9jAeMeClWRY1LTY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=R6YiXkHoZH1FhDTsM9uFDYJ8jRafG+WuHQ9yNW4qq3crC+jhQXnjSffmayrlsQUbJCigf/uCbJwPXXw1KLdISj6LM0OFl1BrVitKwsaJPN/5FtvbW7JkSxmDOKhiLseeqt6A/PDHgt7gbHeXDMAF1k33uosAFsal7+JrRAcRMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=G4znXjQV; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="G4znXjQV"
X-KPN-MessageId: fb6d40cc-c6f7-11f1-9e93-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id fb6d40cc-c6f7-11f1-9e93-005056999439;
	Tue, 13 Oct 2026 13:19:40 +0200 (CEST)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id fb6bc9e6-c6f7-11f1-a0c5-0050569981f5;
	Tue, 13 Oct 2026 13:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=t1SGlL/BePqefUk3qCiIk7sSBJhTQ6u8DFwYLs470as=;
	b=G4znXjQVADtsvQmD7uHk2RiDSOBUKpD+H54IKon0bVvSv6KyPRDji3at9UpDPP1dnK5n3M5tLi8dO
	 fdynzPVRhUL2k41AYUkLMWNG65Ri5ABWMvJeZQR/0K2RCQy6Czl9YTiuhNLu7f83VNcQM18HzyC9gm
	 1q8Ckzu81MVHzsZlq/4FFGiEt+9Lw1T8WPKk5I5Kmsfz9UmbZXGn2/eUk1k5AX963ujolF/AG3KgnF
	 g7k3ShWVT+hHjNh+fopj8U4ufUetsqMHbCj1fjs8VCs8+UX85Y1GhVxL07b3UGuByf6QSPbgp0Kgbr
	 PYFncKoL5Uh7AGJWXDWKlm9HYKjRzdw==
X-KPN-MID: 33|Fvy5v/AaIo+DnVdExlWXq6Es8fbvnE6y60RXW368qrbAGVoaBIzyDOB2m9eiqCr
 sGbW6/ntDSXOOl9hdwgiErVDXRpd/mfR3vMZWmS4xCEs=
X-CMASSUN: 33|r2N/P5s9JvZ3IDHSvve5BuFey5ISOOE9+B2Xk4VdfgjsHf0pJD6/5n22eWSpYYd
 R+rgRl5jg2QcXX6lKGcNrNg==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh02 (cpxoxapps-mh02.personalcloud.so.kpn.org [10.128.135.208])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id fb607a94-c6f7-11f1-8edd-00505699eff2;
	Tue, 13 Oct 2026 13:19:40 +0200 (CEST)
Date: Tue, 13 Oct 2026 13:19:40 +0200 (CEST)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Message-ID: <1716819121.765615.1791890380179@kpc.webmail.kpnmail.nl>
In-Reply-To: <asz9AeFe3CutP73z@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
Subject: Re: [PATCH] docs: remove Assisted-by references
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


> Op 12-10-2026 17:42 CEST schreef Lorenzo Stoakes (ARM) <ljs@kernel.org>:
> 
>  
> +cc the participants from that thread FYI. The original patch is at [2].
> 

Thanks, Lorenzo.

> On Fri, Oct 09, 2026 at 12:05:06PM +0200, Krzysztof Kozlowski wrote:
> > On 09/10/2026 10:31, Sasha Levin wrote:
> > > The Maintainers Summit reached consensus to deprecate the Assisted-by
> > > tag. Remove the documentation requiring it.
> >
> > Please provide here some sort of arguments used in that summit
> > consensus/discussion. This basically reverts/changes previous consensus
> > [1], which is fine itself, but it lacks reasoning.
> >
> > [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/
> 
> Thanks for linking that! It is important to ack previous discussion on
> this. Also LWN article is up now at [3].
> 
> I'm less bothered than you might think by this change.
> 
> The tag's useful for push back on review, but the only long-term strategy for
> slop is to aggressively ignore it.
> 
> Linus has made that clear that that's fine.
> 
> What kills the project is having 1,000 slop submissions that 2 or 3 people have
> to do something with.
> 
> The only long-term solution to that is to hit mark read 1,000 times :)
> 

There's a way to nuke drive-by authors and that is to require them to do
some kind of "proof-of-effort." So you want to contribute to the kernel?
Good, come to one of the OSS conferences, or LPC, or have some well-known
maintainer vouch for you, or do the kernel mentorship program. The point
is not that this cannot be gamed, but that the "gaming" in itself requires
some kind of investment, like proof-of-work.

We may miss the savant that for whatever reason cannot show up to a conference,
but Linux Foundation is already very supportive of funding people. And besides,
Linus has already made it clear that we can expect of people to be able to grow
into serious community members (which may include being able to effort time and/or
money for LLM access.)

This would solve most slop immediately, and we will know about LLM found bugs
anyway from cooperation with Anthropic and just the maintainers using LLMs.

Best,
Jori.

> Sasha - maybe worth linking the LWN article now it's up in the commit message
> and adding a little more detail around the decision?
> 
> Otherwise LGTM:
> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> --
> Cheers, Lorenzo
> 
> [2]:https://lore.kernel.org/all/20261009083137.3-1-sashal@kernel.org/
> [3]:https://lwn.net/Articles/1099594/
