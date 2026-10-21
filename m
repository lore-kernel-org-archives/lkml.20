Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.221.207.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598860;
	b=qP91vUP/JMLnwQaC0/G0bbFVnW76N7Mu7epSROhhleJF+2aAmTribFpNrFIn02NH1d2U
	 Uil3kzFEwLeE49bBHmU87k6Id2I+8U0IT/AmvSgp5zzrhivi80RtCTfs9Z6WTBEokzwgu
	 bkUiJq/HTfSACBOjLSq7c2SPWQnSvTGTM0yq7IykcbruAjBhIDqOrz6ZVIhkrgRu4SqFa
	 diLHO5GLJc1Dtdxl8ekBedXo9pX2AydcTI0724YQFwRgk+1KS/nqG3j5HqV3XyvaN20LO
	 YbL4sBIINZ/kBMzrrJwm6aBdNpJllLVT2XqcESwO8666XVHpfPWy4jNyFnBXbxvVL6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598860;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Dhx1Fsfl3f131vQXKU48aqB13coG5+FwMDAWI0KaKUs=;
	b=Nt8qD7948ndhLzWuFz8IBUOIGi2DGGwq9RogEO0zM0yJKW0yaFAPpL4sogRXjFthjA8B
	 485B5zjhItIEz8x4q7Txfj+bF4+f/YVpxOQhqJbwwoAx7/H/Ro6vkN47c3KmWSezxGsIf
	 aeyG2ltlVR3ZM1HQs3TpUdNqNLeh5iyUBH4Tpvl/HePZ4YBGAgEGhpe/3jwWcSeApkJGh
	 QN9KB4kXpqHAQ9XmwustH0vKyF1ny/QwGpmnS50XZTLoxO3TDhZT12NU16T3pnj32iga5
	 c0JSZE9IzO0jIemL5f+Lrrn8zvdRT2zDGRkeNdd7jxU5wCxn6hpApJvHmevgOT/JSFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hozed.org;
	spf=pass smtp.mailfrom=7el.us;
	arc=none smtp.remote-ip=162.221.207.43
Received: from bc (unknown [162.221.207.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45040606A319;
	Wed, 21 Oct 2026 16:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45040606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=7el.us
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by bc with local
  id 000000000004005E.000000006AD8E343.002DC6D9; Wed, 21 Oct 2026 16:07:31 +0000
Date: Wed, 21 Oct 2026 16:07:31 +0000
From: Troy Benjegerdes <hozer@hozed.org>
To: lyude@redhat.com
Cc: Theodore Tso <tytso@mit.edu>,
  "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <atjjQ0oupQ4pmKHB@false>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin>
 <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin>
 <as7uqZn9rQ52USwy@mit.edu>
 <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>

On Mon, Oct 19, 2026 at 12:32:21PM -0400, lyude@redhat.com wrote:
> On Tue, 2026-10-13 at 23:23 -0400, Theodore Tso wrote:
> > 
> > Using AI-assited priotization may have some collateral damange
> > because
> > it might not get the prioritization correct.  But ultimately, if we
> > get a flood of patches from newcomers, the choices is either to (a)
> > load-shed, or (b) burn out.  And of the two, (a) is the better of two
> > bad choices.
> 
> Why is there so much talk around trying to automate portions of the
> review process with non-deterministic tooling (don't get me wrong,
> things like Sashiko help) and not "we really kind of have a problem not
> having enough maintainers"?

It *is* possible to make a deterministic LLM, and this is why I think it
is critical to my personal future to have an LLM that can actually be
understood by a human instead of a random number generator casino that
sometimes puts "4" in your private key.

What this means for this discussion is a clear process and social
expectation on the core OS kernel development community that humans who
use this kind of technology for an open source project make a machine-
readable note in the commit message on what proprietary tools have been
used.

"Assisted by: Claude"
"Assisted by: GNU/LLM/Linux"
"Assisted by: <redacted>"
"Assisted by: Debian"

All of these tags say way more than a simple binary flag for "LLM was
used".

If you don't agree with me, that's your choice as an individual. I also
want to point out that it seems like many of the biggest LLM users are
also being funded by large organizations that have well-developed and
important *policy* about both inbound GPL contamination issues, as well
as outbound.

How many maintainers on this list that use LLMs have asked their legal
departments about the risks of including code that does not have settled
case law on copyright? 

How much money would it cost to rip out and clean-room a bunch of code
without the benefit of *any* AI or LLM? 

> The latter has been the case for years, I've seen plenty of subsystems
> that barely have the bandwidth to actually review work and this was
> very much an issue well before the LLM bubble. Is it not even possible
> for us to maybe first consider trying to solve this problem and push
> subsystems towards actually making it a priority to find more
> maintainers? Subsystems like DRM have had this problem solved for ages,
> I consistently see us reviewing work far more consistently then other
> areas of the kernel I've seen - even with the onslaught of LLM
> contributions. Considering how attractive a lot of GPU drivers are for
> LLM contributors, I think that's saying something!
> 

If we are going to solve this problem, my view is we are going to have
to look at how to fund maintainers in a more organized way. If LLM
codegen tools are causing a lot of "noise", then maybe we should explore
how to bill the noise generators.

-- Troy
