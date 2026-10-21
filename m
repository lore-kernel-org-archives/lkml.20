Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.221.207.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599710;
	b=wJbedLvlEBIE3BPtJdyzwL4Socv+1GN7xAOZIgGqiB+FgtJ4E0zJM6LSjUtH4jn5wvpr
	 t1vGmgpSe/EKrc5SJDdUa9TWdBoPWpJHZmgrbVRpTo2S+LjOE9c471XXmA/moqZ+h//bH
	 iOqTZN7fKfnly7Fvn3NTmfBLBp7sV2+yT46vQ1O1mcVQ8LSs1/J2BfYcCpn/PwZBlMG28
	 zxo4Vdpu/jr+hehbcPX5xVRLtiZFBVa9zNUACAT437MjkGiW38tF+kaca7zwaTBgH02sl
	 jIsueVLvVYQT6UB2DN14w1womn+2Y5fwp34HCfgXvyAnIDrp06pIs3geVINewfFlRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599710;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:In-Reply-To;
	bh=NWEp0nYJIGjm7VjXAO0FQVtdY7Gg16upd3l3id45oXA=;
	b=vgxK6q2O52u3r0U0EQioOAxnO+wrQ27B5N1FBpo/lyzQ52ItZdqqzMsIaxjYSqC1i1ff
	 xD9LjNjBPOPXgaWnT0fhIs7hRBHpTSpaXQ+MkcyfQZVqGyoKaWEl5nRh4mwRc6iohQ9/p
	 sqH6o3RTD1U57jR/cijdDBDkOBAShIbxlJfgujDKdVPu+uJMfW0Zv5N0W/YgWA+UZifUb
	 ZTNB9IUkegs83liFA/oYWm2ZP1bd9lRWY5OuwcGvVRQBMw+3/9jCFRcGAGl727AYinPeq
	 nu8CmDvrqgXNgjH0diutzLC6X11LHJK7C/m9916iyGHBXbULGmhgJSeK8edM4I5Fjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hozed.org;
	spf=pass smtp.mailfrom=7el.us;
	arc=none smtp.remote-ip=162.221.207.43
Received: from bc (unknown [162.221.207.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF3606A560;
	Wed, 21 Oct 2026 16:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEF3606A560
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=7el.us
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by bc with local
  id 000000000004005E.000000006AD8E69D.002DCC94; Wed, 21 Oct 2026 16:21:49 +0000
Date: Wed, 21 Oct 2026 16:21:49 +0000
From: Troy Benjegerdes <hozer@hozed.org>
To: Theodore Tso <tytso@mit.edu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
  Jori Koolstra <jkoolstra@xs4all.nl>,
  Brian Foster <bfoster@redhat.com>,
  Christoph Hellwig <hch@infradead.org>,
  David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>,
  Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>,
  "David Hildenbrand (Arm)" <david@kernel.org>,
  Vlastimil Babka <vbabka@kernel.org>,
  "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <atjmnZl3tQ_1uaSJ@false>
References: <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <20261013173240.GK4214@killaraus.ideasonboard.com>
 <atI_TSQXzAQFWBfx@gremlin>
 <20261020211532.GD15441@killaraus.ideasonboard.com>
 <atggaWq0EU6Km8r0@mit.edu>
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
In-Reply-To: <atggaWq0EU6Km8r0@mit.edu>

On Tue, Oct 20, 2026 at 10:54:40PM -0400, Theodore Tso wrote:
> On Wed, Oct 21, 2026 at 12:15:32AM -0500, Laurent Pinchart wrote:
> > I fully understand that many maintainers currently feel they're too
> > pressured to invest time in the next generation. We need to find
> > solutions to make that possible.
> 
> One possibility is to create tools and/or procedure to amplify signals
> about which newcomers are most likely to become the next generation,
> as opposed to someone who is just sending drive-by patches.
> 
> The reality is that the vast majority of first time patch submitters
> won't become part of the next generation.  So if we are getting 10x
> the newcomers, if we can be more discerning about which newcomers we
> invest in, the project won't die, even if we are ignoring, 3x to 5x
> the number of newcomers.
> 
> > This is something we really need to improve quickly. Over the past week
> > multiple active kernel developers asked me if I thought they needed to
> > find a job elsewhere, thinking maintainers will now ignore anything but
> > perfect patches and dismiss contributions from developers who don't use
> > LLMs. That's a wrong impression (at least I very much hope so, and you
> > clarified that you're not advocating for that), but it's a disastrous
> > impression that many people got from the maintainers summit and the
> > following mailing lists discussions.
> 
> If someone is an active kernel developer, presumably they already have
> enough of reputation that they won't get ignored.  The issue is really
> going to be newcomers who don't yet enough of a reputation, not
> "active kernel developres who are wondering if they need to find a job
> elsewhere".
> 
> And if they have a job, meaning they are in the industry, hopefully
> their employer is willing and able to hire a more senior kernel
> developer with a reputation in the industry to help them out.
> Fortunately, certain companies like Oracle have graciously been
> releasing a lot of such talent on the market, so these people *are*
> available.  :-)

Where's the job board for this. Or if you know of some developers that
want to come to a farm and work on RiscV-linux farm robots I can provide
food, housing, and whatever my experience is worth.

> A senior kernel developer will be able to help introduce more junior
> developers to the community, both online via e-mail and at conferences
> such as Plumbers.  More importantly, the more senior kernel developer
> can help the more junior developer write cover letters which better
> motivate why a particular patch is important.  Half the problem is
> that a lot of the "AI Slop" patches aren't particular important, and
> in some cases, the business case has been wildly exagerated.
> 
> (For example, there was the patch which claimed to address a very high
> severity "one click exploit" bug --- but the exploit required (a)
> tricking someone to download a malicious file system image, and (b)
> running a fairly obscure "tune2fs -U random" command on said image,
> and (c) be stupid enough do it as root to justify the astronomical
> CVSS score.  By calling this a "one click exploit" with an extremely
> high CVSS score, that engineer and their company has been forever
> tainted in my eyes, and you can *bet* that I'm going to take any
> patches from them far less seriously.)
> 
> Anyway, all of this might mean that someone who has zero prior
> reputation, and doesn't have the $$$ to attend a conference, and who
> isn't able to get a job at a company where a more senior kernel
> engineer can introduce them to the community, and who can't get a
> position at a mentorship program like Outreachy or GSOC might have a
> much harder time to get a maintainer's attention.  Yes, this will suck
> for some newcomers; but so long as we get enough new blood from other
> sources (such as new college grads working at a traditional Linux
> company), it doesn't follow that just because we aren't engaging with
> *every* *single* *newcomer* that it spells doom for the Linux kernel
> community.
> 
> 					- Ted

Those newcomers need viable paths for employment, at least in the
current system. I think if AI companies want to maintain their sky-high
stock valuations, there will have to use some of that theoretical market
cap by actually committed to resolving and paying off technical debt.

What if we had a "pay-per-patch" model? Would this help or would it just
turn into a game where whomever has the most money gets their patches 
reviewed?
