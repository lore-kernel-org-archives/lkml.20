Received: from bc (unknown [162.221.207.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1256385D7B;
	Sat, 17 Oct 2026 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.221.207.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258936; cv=none; b=IyrJO42LUwtzk6hrWiGDQ7eF4hsW1n2DWrNAi1XiD/9x0ayVwwJ0zDcxDTlDc+v5QRhnmAY4uBf39vSfYkgtAU4beDsPM5V8yNE3UGApGuTCHUERb4d8mE0mS5u+g8lDxJa8rCRL8g9RLD9Dwj9EHZTn2HUvpjqxISbU4sdPOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258936; c=relaxed/simple;
	bh=RVnU932CaFagWh3EiDY63LLcko/vJL9ah9oQGe7lYes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXbri45nulUjpQ/lgtSnXDoDSttrucIumEkvYJL8JuZbG65ZRSJkH25RDIbh8nCEuPYo4fWnr0V9Pvr/UfV3cQYjC/mCV/Q5ssbDU4A/X5rJdBeJReQOpTEz6VL2u2UmtIVSc2GZSZ3ae1X7vM/MyZNj0qdLgWMPRxuhX9pB5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org; spf=pass smtp.mailfrom=7el.us; arc=none smtp.client-ip=162.221.207.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hozed.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=7el.us
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by bc with local
  id 0000000000040026.000000006AD3B376.002A50CB; Sat, 17 Oct 2026 17:42:14 +0000
Date: Sat, 17 Oct 2026 17:42:13 +0000
From: Troy Benjegerdes <hozer@hozed.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
  Linus Torvalds <torvalds@linux-foundation.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Kees Cook <kees@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
  Krzysztof Kozlowski <krzk@kernel.org>,
  Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
  skhan@linuxfoundation.org, rdunlap@infradead.org,
  federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com,
  workflows@vger.kernel.org, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <atOzdXK88Z3yxO6o@false>
References: <as4xMnT8a75pIw9v@gremlin>
 <FAD7F1E6-5FE0-47F5-8D10-40473B39A2D8@kernel.org>
 <907933931.787284.1791903485683@kpc.webmail.kpnmail.nl>
 <202610131000.43AB316FBC@keescook>
 <20261013174243.GC178151@killaraus.ideasonboard.com>
 <202610131216.C841415F01@keescook>
 <20261013201628.GO4214@killaraus.ideasonboard.com>
 <CAHk-=whTs09_ozN+e09GU68N1wPP56MUzDjrg9rnKxQUa0A_4Q@mail.gmail.com>
 <as-Ino4KNmaG77_G@gremlin>
 <atIyeGHCGDTCIvkx@gsse-cloud1.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
In-Reply-To: <atIyeGHCGDTCIvkx@gsse-cloud1.jf.intel.com>

On Fri, Oct 16, 2026 at 07:19:36AM -0700, Matthew Brost wrote:
> On Wed, Oct 14, 2026 at 02:56:22PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Oct 13, 2026 at 01:45:09PM -0700, Linus Torvalds wrote:
> > > The kind of expectations *I* have is that people do their best and I
> > > expect people to understand what they are doing.
> > >
> > > But that understanding has very little to do with what tools they use.
> > 
> > I think that's the crux of it. Don't send stuff you don't understand.
> > 
> 
> Yes, never send code one doesn't undertstand.
> 
> Also as important - never send code you haven't tested.
> 
> The idea that LLMs should not be allowed to write commit messages or
> documentation really gets under my skin. What if you have a learning
> disability related to reading or writing? I do, and for years the
> hardest part of writing code was documenting what it did in a way that
> others could understand. When LLMs first came out, all I used them for
> was writing documentation and commit messages because they couldn't
> properly code my ideas. They could, however, describe my ideas quickly
> and clearly. Fast forward to today, and LLMs can do both, so I use
> them for both.

My argument to keep "assisted-by:" as optional but highly desired commit
metadata is based on understanding. If you have a culture of being able
to explain things to humans, then make it easy for both humans and their
assistive techonology to know exactly *what* technology is being used, 
and where to get it.

Hell, I would expect the proprietary LLM vendors would have a strong
incentive to keep the free advertising. I personally haven't yet asked
an LLM yet to write a thesis on the subject, but you can probably place a
bet that I'll feed this message into a couple of assistive technologies
and try to make the most compelling argument that any company operating
under US securities rules might want to have their legal department review
the company policy on what to put in the Assisted-by: signoff.
 
> Matt
> 
> > And if you do, expect to be ignored.
> > 
> > --
> > Cheers, Lorenzo

A clear structured header is easy to ignore, and the cost to maintain
is minimal once we have consensus to retain it.

Cheers, Troy
