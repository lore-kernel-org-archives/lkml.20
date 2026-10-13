Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F04EE845;
	Tue, 13 Oct 2026 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894714; cv=none; b=mTqnpEM2+m9AJXmsRQqR5kvE+qlMeHoCYLQZYPFwQ8Uq6qKl3Gi8lvjTv5hly2SPHee/cte2ZlN79i1O/Z38IISwbmc3w4uSr86No7sIxWLLydd4xYy3L57BlPqV82zPkrFQXpoWBV2jksn7XH70QUs4z1Nn4R0qOkK9favAQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894714; c=relaxed/simple;
	bh=Jz7U6dgA4jdFmMWb4jrQAqiXgJj9BvtmfBooP1HnRwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyUu0BHg3evDgvyDbqnjA9acRjwPvh0EnYR8ELVS7g89xpDYJLSUEn/eX/jOIZwhXzIp53K6rOkbswb0XQDe60z+cRbrKXd37n+cT5HmEfCrpVE1VWUuvmJ4XgPMIdKL+6xZHINiQNfDZRLBeNX6nAvnII/IHjf9quGZYhuVKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ddiEDML2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ddiEDML2"
Received: from killaraus.ideasonboard.com (unknown [185.104.138.147])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05E801E4;
	Tue, 13 Oct 2026 14:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791894583;
	bh=Jz7U6dgA4jdFmMWb4jrQAqiXgJj9BvtmfBooP1HnRwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddiEDML2WV5JT2/nY8K/wjeO/4A7RQ6Jgo3Y3+T+mfYl8JWstmk3PIQRXsrMLMFyR
	 BtD7mjIylISkccs2edN8lRAMX/jsqhEcxIUi/N0cRS4vtH/zlcnM/+q8EP9nsJSu7U
	 cTxjdwIGhOaDmQEB6lJCRu+P+Ac589lZ167wGKjE=
Date: Tue, 13 Oct 2026 14:31:32 +0200
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
Message-ID: <20261013123132.GC4214@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <asz9AeFe3CutP73z@gremlin>

On Mon, Oct 12, 2026 at 04:42:46PM +0100, Lorenzo Stoakes (ARM) wrote:
> +cc the participants from that thread FYI. The original patch is at [2].
> 
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
> The tag's useful for push back on review,

That's the point I raised during the maintainer summit. It's actually
the *absence* of a tag that helps me push back on review. It allows me
to ask submitters if they forgot to add the tag, and in many cases (so
far) they simply don't reply.

I'm not happy removing the tag without adding another mechanism for
required disclosure. Without that, I can foresee submitters pushing back
on the question.

I agree that, for my use cases, recording the tag in the git log isn't
useful. We discussed the option of requiring it in the cover letter or
below the scissors line. That would be my preference, but few people
expressed support for it.

> but the only long-term strategy for
> slop is to aggressively ignore it.
> 
> Linus has made that clear that that's fine.
> 
> What kills the project is having 1,000 slop submissions that 2 or 3 people have
> to do something with.
> 
> The only long-term solution to that is to hit mark read 1,000 times :)
> 
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

-- 
Regards,

Laurent Pinchart
