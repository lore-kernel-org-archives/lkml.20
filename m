Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.221.207.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266604;
	b=xMclgpYcf/760sxlN3xLafhfzn+oEt9HFlu1R2fbMDF/boXpoDKtDaIWBDF2UlqJTLdA
	 h0my/hPjtH9P8MhiS/kLQviPZeDwyguqAYIOwmOahEQtAMrQ+nkZ8a6xvr5H9eD1vNTtk
	 Vy4rufwoGsbzUfZU3uXASCs5fhAMm7JfTY4Ik3xaFAGmelBPjmtasqgrotDTAlovbmeEs
	 qx4f0eeQ2x6Y7XQoIyBvZUTOqfDHyPy634itASpF0G/VVzo3QDJpMDBjvzFc4HVrDjgjH
	 q2VlNtKceGymkBJDSdkm07TkvyeAAnDoHidoZNs1g9R4mc1DF9qig1ke+0X4Fhw8mQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266604;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:In-Reply-To;
	bh=uMdD3NmjT1MR8i8B6VNl6YJZVUaJX6r1LIIEe1gxjqw=;
	b=z7LBzwgVGWG3IxtKrO4w86Rt8losjrm0YBFNTeF69OowaLoxnuP2i+RP+wEDZaXkoe9z
	 ZsAc43Vot2A8W7vi5z1mtAXOVWp36u+KXwkXtFuXvORXE9/ELokQ4CAKiF8HHG6vpJWWe
	 esezeNGrZF6f0MQbZz/qS/Uja6xAkUbSYj67sL5kg0dijxgM9D2SWlrkUnPBWQL6MPHLV
	 qySPBFj5H9LIsWxbJwgl7x5y/UhlL+J6GgbBiiowN5IdLNob0f4cUTBJoSRTs+o3NXW5v
	 G0gUkVJkvHlQ5FrEA4Dr6l14Gtgh2dwAVANOdmvnmHEM+DFk09dV90UC0KI2YgwZkSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hozed.org;
	spf=pass smtp.mailfrom=7el.us;
	arc=none smtp.remote-ip=162.221.207.43
Received: from bc (unknown [162.221.207.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE818606A31C;
	Mon,  9 Nov 2026 23:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE818606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=7el.us
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by bc with local
  id 0000000000040074.000000006AF255E5.003DB8D8; Mon, 09 Nov 2026 23:23:17 +0000
Date: Mon, 9 Nov 2026 23:23:17 +0000
From: Troy Benjegerdes <hozer@hozed.org>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lyude@redhat.com,
  Theodore Tso <tytso@mit.edu>,
  "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Krzysztof Kozlowski <krzk@kernel.org>,
  Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
  skhan@linuxfoundation.org, rdunlap@infradead.org,
  federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
  workflows@vger.kernel.org, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <avJV5e-orqQyr4YP@false>
References: <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
 <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
 <atjjQ0oupQ4pmKHB@false>
 <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
 <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
 <DMF17B2ZLUVC.3FQPOG5TPIX@ubuntu.com>
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
In-Reply-To: <DMF17B2ZLUVC.3FQPOG5TPIX@ubuntu.com>

On Mon, Oct 26, 2026 at 03:53:48PM -0400, Joshua Peisach wrote:
> On Mon Oct 26, 2026 at 3:39 PM EDT, Linus Torvalds wrote:
> > On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
> > > 
> > > On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
> > > >
> > > > It *is* possible to make a deterministic LLM, and this is why I think
> > > > it
> > > > is critical to my personal future to have an LLM that can actually be
> > > > understood by a human instead of a random number generator casino
> > > > that
> > > > sometimes puts "4" in your private key.
> > > 
> > > I hate to break it to you but that is literally not how large language
> > > models work.
> > 
> > More importantly than that - the whole "deterministic" part is a total
> > red herring.
> > 
> > We shouldn't even reply to that idiotic argument.
> > 
> It's not idiotic. Would it be considered non-deterministic for a human
> to intentionally add a line of code causing a kernel panic for no
> reason at all? Or an LLM telling me to jump off a bridge?
> 
> When it comes to human development, people *know* what they are putting
> in. An LLM does not think about the words it is spitting out.
> > Why? Nobody is arguing that we should stop take human patches because
> > "they aren't deterministic".
> > 
> 
> Except humans want to actually contribute to the kernel, not make their
> slavemaster happy.
> 
> > So anybody who thinks we shouldn't use LLM as tools because of that
> > reason is just being dishonest. It's just a disguise for "I don't like
> > AI". It's not an argument, it's a complete strawman.
> > 
> > We have had non-deterministic tools in the past. One trivial example
> > of that is just different compiler versions that have slightly
> > different instruction weights or just different rules. Even when they
> > are individually deterministic the end result is effectively that
> > different people will get different results.
> > 
> > And not all tools have even been individually deterministic - actual
> > real non-deterministic behavior exists in non-LLM tools either becasue
> > they have timing issues or are explicitly using random numbers as a
> > way to get their results: Monte Carlo simulations is a very real
> > thing.
> > 
> > And yes, non-determinism adds a wrinkle to things and it's something
> > that needs to be taken into account (and people often add things like
> > explicit seeds to avoid it when they need explicit determinism from
> > otherwise non-deterministic algorithms). So non-determinism is
> > something that should be weighed as a factor against what else the
> > tools brings you.
> > 
> > But it's not actually an argument against LLM's.
> > 
> >               Linus
> 
> Well said. But also, we won't be able to "submit bug reports to LLMs"
> like for years people have submitted bug reports to compilers.
> 
> -Josh
> 

Submitting bug reports to LLMs is something we can and should aspire to
do, and maybe one of these LLMs will have sufficient context window and
processing power to take all of what we've written here as a prompt to 
build and demonstrate a deterministic code generation tool where the
code produced by the tool and the entire process that produced it back 
to the underlying training data can be fully disclosed and discussed.

I'd challenge anyone that believes that "LLMs don't work like that" to 
try running code generation with temperature=0, and let us know, what
happens?

Just because pretty much any commercial machine that uses IEEE derived
floating point and parallel execution can't practically produce the same
answer from the same inputs does not mean it's not possible. It just 
means no one has yet put in the engineering effort.

Good engineering with monte-carlo models or other tools that depend on
a random number "seed" seems to involve multiple runs, with different 
seeds, and when you are working on a something involving human life
safety or otherwise have to satisfy some regulator or reviewer that the
simulation work you did is repeatable, is specify something about how
many runs you did, with what codebases, and how much divergence did you
get from different runs and different seeds.

You see this with weather models, where an ensemble of models is used to
map and quantify the uncertainty in the projected path of a hurricane.

We can and should apply the same rigor to kernel engineering, and keep
an awareness of what models produce what kind of code, if for no other
reason than to provide some additional forensic data if or when we
discover the first evidence of an intentional LLM generated zero-day
that slipped by human review.

- Troy
