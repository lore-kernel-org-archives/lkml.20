Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DE421245;
	Tue, 13 Oct 2026 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912768; cv=none; b=ZoH7fJ6spMzuT1gtc1B/F1vj6lOsVYloxliOUAMd4ny8EzZoXkHEyyKXW9pyE9fGN/yeYVwvliY6BhGPZYXZrWDOTX/J2s4QN/7xS9/x+M6ZSWhSrOy430mAWt3F1zQFUx9syaSRwX85gQ5J+dXasQKiadeHilXMnWEHSuWm49o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912768; c=relaxed/simple;
	bh=xhyOmlY04l3SVooKPFR6wWaAfhoNF1ej31jWi9WMbns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB0RNubBryzXRs2Sywf3YVfdz3hM+CeRaJXiGMugM/WonT1xnbrhVYpFW99JcJgjbjjdXRKuLgpi06xsihrKaPJqbDJo8hwLUV86uWAP6gTWsQC0XpF5tLTdVdnjyhKRKOl/qyrACeeiGX2x0ahVvX2LwybRUY8DpdQSkVpRMk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D+jcCMQO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D+jcCMQO"
Received: from killaraus.ideasonboard.com (85-76-151-95-nat.elisa-mobile.fi [85.76.151.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CC9619C;
	Tue, 13 Oct 2026 19:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791912642;
	bh=xhyOmlY04l3SVooKPFR6wWaAfhoNF1ej31jWi9WMbns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+jcCMQOrybt5E0xK7HdqVioNujBVrA5c9LVXwD6sOnxWQ00hvUJbxK2GZzQ/JOmS
	 3gqlFaUgO3vGZoobF9Sb3KUFdJHO3h0O313Xgg7ae9nz4vXkvon4ZERIDb2b3MSKRW
	 PGyukK2XCLs74urx4TZN7Ki/fTc5kj1wZ/KBGXdY=
Date: Tue, 13 Oct 2026 19:32:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brian Foster <bfoster@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261013173240.GK4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <as4xMnT8a75pIw9v@gremlin>

On Tue, Oct 13, 2026 at 02:29:08PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Oct 13, 2026 at 03:12:43PM +0200, Laurent Pinchart wrote:
> > On Tue, Oct 13, 2026 at 01:59:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> > > Ignoring is the only workable long-term solution.
> >
> > How do you decide which patches to ignore ?
> 
> Anything that looks schloppy. ATM it's very easy to tell.
> 
> In future it will be newcomers who do anything but the most trivial work. Or
> they will at least be super-deprioritised.

As people tend to quote Linus in this mail thread, it's important to
recall what he (and others) said during the maintainer summit: the
kernel developers who code without using LLMs are not just tolerated, we
*want* them. We want them to learn and contribute, we *want* more
juniors who are genuinely participating.

It was very clear during the discussions that raising the barrier to
entry applied to LLM-generated contributions ("they have no excuse for
being anything but perfect" - not a litteral quote as I didn't record
the conversation, but the closest I can do based on my memory), not to
human coders.

> Yes there will be collateral damage, but it's that or no more open source (we're
> not the only ones going through this!)

Think how you will feel the day you will be treated as collateral
damage.

I find this mail thread it taking an almost cynical and violent turn.
Are people rejoicing at the prospect of actively discriminating against
sincere contributors, or am I misreading it ? The kernel community needs
more care.

-- 
Regards,

Laurent Pinchart
