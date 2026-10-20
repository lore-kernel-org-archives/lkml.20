Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792470652;
	b=IcGwyQB24pdawShqMoZo0AsfKxFfi+w6RbiE7hAN8h5yE5wqPG1rCSjMqai0pTZlbn62
	 KW+RNWSCTwq/P1yJJJ/8lb0i6BrYs1saBaU7qFN6CtgCoBRloRRxmvs0kulk5uRZ6Iy2d
	 Te6VHzoELYuQpuGY30u9cxjuCpcvWGfp3eJi5NDQJJR67wn/je6Qlkq6ttdVQV3nP0UFF
	 wfgpms6te8gr9bZMuE+vYChwMRk4Q2VYmU+0ibr1XpNQ4oF3RSdd6UH5S1mCQv8nhqAfv
	 GcGKgyddSqeJG8YdYpDsKUCcQxfVWX4oyC1HQsecI7x01HIDOZNVwhdSg/TEslw2wzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792470652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9j3OvoxTGWGD26yaKNg6HrpKJGkRBiGsb2UWwwP5GFA=;
	b=u4o6mMUKQfTfSQsj8yyyQIvi0//TeZ7VNGUlB91ilMWevWAgIibCONTirLpdKDp5be0l
	 qlNnmpf4UCWDbTNu51wLZiCYB17PWOj0rtzVpIoSq1o/68Aj6Q1dwVRFEzpcLK4tRMfOz
	 04HKy9NCF0FyvkePggUA37cP/rd/Nw0BlqL0aBghEE7i/8qD3WEGjhUju7sIG4bMGqGrM
	 SsOdfc551e3VyyefBDohDVWVbrMxHjf39DdA5YQ3aVMIsEy/xXhMQ7ho+P7iU/Cd5fuLs
	 SIpBopyNhdJIVXuw8LPKS9XfiVuxPGTD6c1ugVSwL0tI0h9ENVE+v9dop3LhWj4LZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=UJeI0CaH;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24BB606A332
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24BB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=UJeI0CaH
Received: from macsyma.thunk.org (pool-173-48-113-115.bstnma.fios.verizon.net [173.48.113.115])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69K4TZx2005333
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 00:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792470586; bh=9j3OvoxTGWGD26yaKNg6HrpKJGkRBiGsb2UWwwP5GFA=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=UJeI0CaHr8FD1fkb9npYaLKCJIGT3pYr63clbA+4mvZ4Uj+fb0XxcWtIt4wQPGks4
	 Rk3uDxtlGpuYS7vrPwm7uHAnHPJt/5MPHuL95WfdxWqKAjhwef0ZuP9lcdmOD/JMzu
	 J8IffN4VnTeTFKeJoED0wVkhIVQKjxwKsC0vjKNIdCyQLkfItnvWv4leaR4GAksmKj
	 lUPKmnHKqFDaTj+2uUmq2Qub2zAx8P6bMQY9dpYF2HVjZY50mEgQ/EeBn6oBfxN2bX
	 wy+6l4B2teOukwF7dZkknQNeQVVy8ejknEhipJKPUG7znpBwCTNbVA57FzFg70H7uK
	 j5tv7qYUzLGEg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 07C0021B27DD; Tue, 20 Oct 2026 00:28:35 -0400 (EDT)
Date: Tue, 20 Oct 2026 00:28:34 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Justin Stitt <justinstitt@google.com>,
        Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jori Koolstra <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
        Christoph Hellwig <hch@infradead.org>,
        David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
        "David Hildenbrand (Arm)" <david@kernel.org>,
        Vlastimil Babka <vbabka@kernel.org>,
        "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <atbm7w6WFSnwpduj@mit.edu>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
 <as-Dwg8DcEOYMXki@gremlin>
 <20261019224448.GC15441@killaraus.ideasonboard.com>
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
In-Reply-To: <20261019224448.GC15441@killaraus.ideasonboard.com>

On Tue, Oct 20, 2026 at 01:44:48AM -0500, Laurent Pinchart wrote:
> > Recently 2 people sent 1,000 patches over 2 hours. Care to check each and
> > every patch for 'quality'? :) Only the beginning.
> 
> That's the kind of behaviour that should be easy to detect, and I have
> absolutely no issue with sending all those patches to /dev/null. This is
> script kiddies behaviour, not the work of someone with good intentions.
> Ignoring those patches is not "collateral damage".

Well, let's take the reverse.  Suppose there are 500 newcomers who
have each sent two patches each in the same time period.  This is
going to put the same stress on the reviewers and maintainers.  Of
those 500 newcomers, there will undoubtedly be few (single digit
percentage) that will eventually become valued reviewers, and somewhat
larger percentage that will become regular code contributors of
quality improvements.

These percentages were always there pre-AI, but there were much fewer
newcomers per unit time.  So this increase of new comers has its good
side --- it means we have the opportunity to significantly grow our
community.  But it also has its shadow side, which is when we only
have a newcomer every month or two or three, the overhead of trying to
engage with a newcomer isn't that great, even if the vast majority of
them disappear after the maintainer attempts to work with them.  And
if that happens, we just shrug and move on.

But if there is 10x or 100x the number of newcomers, it puts a huge
strain on the pre-existing community to engage with these newcomers.
And when we get newcomers who send patches like this:

> We could go a step further. There's also an increase in patches from
> newcomers who send a few patches only, with the usual signs of not
> understanding what they're doing: code changes that give an eerie
> feeling, very large comment to code ratios, and commit messages longer
> than the three volumes of Lord of the Rings combined.

.... the question is the probability that newcomers whose first few
patches look like this compare with the probability of newcomers who
first patches are 100% human generated?

I don't know the answer to this question, but clearly some people
believe that the probabilities are different, and so if they need to
make some lifeboat choices about which newcomers to engage with first,
it might influence their choices.

Even if doesn't, the reality is that with a huge influx of patches and
newcomers, maintainers' time is finite and expecting them to engage
with all newcomers, and review all patches promptly is a recipe for
burnout.  So "collateral damage" isn't just not just newcomers needing
to wait weeks before someone gets back to them (and some might never
get a reply if their patches get lost in someone's inbox), although
that can certainly be collateral damage.  It's also the potential of
maintainers getting burned out; that can also be collateral damage.

And having someone claim that it's the maintainers "fault" for not
building up the reviewing community is also not helpful.  We are where
we are, and as much as I would hate to lose a potential contributor
who gives up because they don't get attention right away, when only a
percentage of these newcomers become regular contributors a certain
amount of self-care and preserving the maintainers' sanity might have
to take higher priority.

Don't get me wrong.  Getting a large number of contributions, even if
not all of them are high priority fixes and/or high quality
contributions, and having a large number of newcomers is a ***good***
problem to have.  And I'm thankful that we have it.  But it still can
be a problem that we need to solve, one way or another.

							- Ted
