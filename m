Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8214A8FD7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366118; cv=none; b=U3rIjBHbC7y9FJapvTLqWiJUojej6vWOPCBZPZxGHlEV1hVG9FgmpZCcJticgWSWAsdAVMzj1/aMjq8Yyt/KvAxqoOiRZUB8KYLyzqzQR8bxRQROG5skiHijamE7GYTC4Zir9S1JVEsl2MpumvbXieMUgx48UrySR5Y7jVX6zyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366118; c=relaxed/simple;
	bh=F3DHMVXCsFyLcyuN0rxaB7JXktY42Mz8oSzY/xM2wK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj05zMoQXo6tc7nzgYwg+9gCrx76OgZkLjiSCpA74+HVY5V1uZLh05g0QlTw5u0E8W6hPd81cjs4qaAOi27dibjohYuKBomwFR+kRVU0luxjmtX1fL8BZqIeqLr33+gEGtHSVq7xKnwaY4uGXEDL5aGwilCqrrW+u1O+RI7qJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etonnWNr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etonnWNr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D281F000E9;
	Wed,  2 Sep 2026 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788366116;
	bh=R6GINoLwkUA3hhnBwenhiVH2MG/E/BgWH1U3tO3YoWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=etonnWNrXoT73baz3xJtEhRpNWkjVDs2f5l711wzJlSi2+mJFHLC74fsobQFx/gdL
	 DKN/pu+iXg2MuJxCGaKiT3VVrOIlPbIqnRB/d6bIMZr+A7/iXoEhdVldUQ8v3J1lAt
	 mp4QGN9mzmGajX3Nvi3yu2h20lnjJpMuBOhXKQhyp18GbkTf/is9Q/5QP+tU/Q7ETd
	 MUkamoN2reB0VRMt+53H6OWapmNio02uzoluNZN8ie+pcu7Zaqjtnh3tzUFlSXc7Xw
	 QZ+Bu0jZ3jHHt8IERYRTC7K94xQ/w9P6ZakjlcZHCsPcTytYxaDoBcJx7HZOvUQ54T
	 LNpTnfRFsRaQg==
Date: Wed, 2 Sep 2026 17:21:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Andi Kleen <ak@kernel.org>, 
	akpm@linux-foundation.org, liam@infradead.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RCU safety for vma maple tree walks
Message-ID: <aphJ7olxr-_VhDKt@gremlin>
References: <20260831143511.1133029-1-ak@kernel.org>
 <apWUsc-a6k1YkuMv@pedro-suse>
 <apXXgimKxgJl57qo@firstfloor.org>
 <apXaTN6o5YaEO8FR@lucifer>
 <apc-F_D5mWwWL74i@firstfloor.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apc-F_D5mWwWL74i@firstfloor.org>

Hi Andi,

Looking at https://lore.kernel.org/lkml/20260831150651.1134594-6-ak@kernel.org/
I can see the cause of your issue - it's your own patch, exactly as we've been
telling you.

You're inserting a VMA on a uprobe_mmap() call, which is completely incorrect:

<munmap()>
  -> vma_complete()
    -> uprobe_mmap(vp->insert)
      -> install_breakpoint()
        -> ...
	  -> create_uprobe_ptwrite_page()
	    -> _install_special_mapping()

Now you're inserting a VMA, using an entirely distinct iterator, while an
existing VMA iterator is in use.

That means you can end up rebalancing the tree and _trashing the iterator_ in
the core mm code.

Your (LLM's) proposed solution to this was to keep on doing the completely
broken thing, but by inserting various RCU locks, preventing a KASAN report on
use-after-free's due to avoiding an RCU grace period expiring.

You can't reproduce this upstream, because the bug is in your (RFC) series.

So, exactly as we've been trying to tell you.

> Assisted-by: omp:gpt-5.6-luna

I'm a little grumpy about this as you've taken up a bunch of our time to assess
two sets of completely broken LLM-generated code, and you've mostly responded by
denying what the authors of this code have repeatedly told you.

You also seem to be using one of the lightest weight LLM models - it isn't a
great choice for core kernel work, especially in areas you are unfamiliar with.

In future, please audit the code and make sure you understand every part of it
as per https://docs.kernel.org/process/generated-content.html

	As with the output of any tooling, the result may be incorrect or
	inappropriate. You are expected to understand and to be able to defend
	everything you submit. If you are unable to do so, then do not submit
	the resulting changes.

Please respect our time moving forwards, thanks.

--
Cheers, Lorenzo
