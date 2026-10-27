Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131037;
	b=vlMB7Uf900WrTBnHInIZ9/0O8Bp9PGjemCje5yQHr+jDDB4whXFMHxGrr8Ki0ROJ1468
	 N+aUTkbw64EMo4y4nd+c0sJeD+DVdLUMyVNczIpRqaJwlt+UWXIMW0/T0O4o2/1jFo0eC
	 iwJBXdAxDByJzoL+f4AkGJydUdGQGPr6ncdtMRE9qk9p5Bnx8H3dHtMl/Otj7yYkR++It
	 rU9mdehnekBwKWbVVq0LtyftJ9xX4KY2dPzXLSzAtHKQBaq+r7V1BW1a3dLmcsQkQFfQ/
	 9ic0Rhs9NUZXwsjqY79nv1yYa7ftUjlKbN90Lx00LDV3OBmqiNBksPZGwPCl20mt9ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131037;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MjCOMTfDinep5vhJGuYRekQuBK53NYbLjZwxUltG/Hg=;
	b=4B3Xp+rY8bOUolu6xqjgwp916dHlj7tb4p1/sCT/krJTGHR84uwfxl6q4FOGkN1SHoJI
	 YWIo7pel90Ya4KcYdrucz0+Ao/BBlK5hQKBixHw9y2aiRbGAu/zGFRgV1Gz5taDINmgN3
	 uDQr7uFOixupQ5/7Dt3wqwuCyekhxl1VFVXuOcC1Jp2i1WNNP8KYxpnviT31VvvAt4SJS
	 LT0IUVwRBlE+rvMdU2hJPBYjaZ7rnbnWFcOq8PC3zY3/Lppghf3VTXptnNdeiDbFV+LFZ
	 ub/7A3yjF9/4kuZsE14UZNhj0K9x5qp+pQYBJt/Y+eVUTQzOQ4pXXP1+IL6FAoHqMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfO+CnhS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E5606A326;
	Tue, 27 Oct 2026 19:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfO+CnhS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E401F031E4;
	Tue, 27 Oct 2026 19:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793131036;
	bh=MjCOMTfDinep5vhJGuYRekQuBK53NYbLjZwxUltG/Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YfO+CnhSfb0ZtYrj2CML1pC1tIRO+z2avoDHlsH3Pg7Jh1XtdZihUbWne5MH13ZEr
	 ndmOcwHWKJwE19Z8Gpl/t+QdOA78SYAaGtvABPhHc4tbAf8qGDUCmGbqJ2uzgRvUNC
	 D5WMOCaDUWyjlTtD2oj8Qh3LzsCFncpf1YVp58L+Lgji6+E26NoBuB/VyP9Ndwsmgv
	 tQ4hUOoI/M+eT962RzEcA0MuZla8CLe5YRl+zCwSwNE5bMGGVvwfa18N0/kPdJxm0l
	 5hMU665s0mhzzyh+64GbMKE4QFaA8fJNFb0EunDnNQNqIBlLseJsL0qxIQl9xTSErt
	 3jWa767pCRbgQ==
Date: Tue, 27 Oct 2026 19:57:14 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261027195714.GA2508049@google.com>
References: <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <3f518c8c-2950-458e-95fb-5b282db4c384@kernel.org>
 <20261027122952.GB2133989@killaraus.ideasonboard.com>
 <8230fb00-b1a4-47f0-b9de-5d0fa42e9465@kernel.org>
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
In-Reply-To: <8230fb00-b1a4-47f0-b9de-5d0fa42e9465@kernel.org>

On Tue, Oct 27, 2026 at 03:31:36PM +0100, Krzysztof Kozlowski wrote:
> >> Since this step is pointless - it would be linux-next
> >> (assuming in the first place that this is what the author wanted here!)
> >> - it is a waste of time for me and potential resubmit of series, just to
> >> fulfill requirement which brings no benefits. So I have downside and I
> >> see no upside for my case, when you require the base.
> >>
> >> This might be affecting others as well, but now speaking about my
> >> workflow - I have a lot of independent cleanups, which I stack on top of
> >> each other, sometimes series, sometimes not, but stacking is important
> >> so when I run `make W=1` it passes.
> >>
> >> What's more important, I reject the entire reasoning/cause of this
> >> change, which claimed you cannot review and therefore accept such
> >> patches. It's simply not true.
> > 
> > That's not my claim.
> 
> That's the claim from commit msg. And wording should rather be "which
> claimed one cannot review".

Emailed patches include only 3 lines of context by default.  That's
simply not enough for a proper review in most cases.  For a proper
review patches usually have to be applied, which often fails especially
if it's an old patch.  (Caveat: as usual, the frequency of this varies
by subsystem.  So some people encounter them more than others.  Just
because you might not experience this much doesn't mean others don't...)

base-commit (and optional prerequisite-patch-id) can prevent that in
most cases.  That's the point.  And it helps for applying patches for
any other reason, like testing, or resuming work on on old patchset.

It seems like your concern is that people would bureaucratically ignore
patches without base-commit even when they apply cleanly to "something
obvious"?  That is not what I intended for this at all.  This is all
about getting more patches to include base tree information.

I also don't think your interpretation is consistent with the actual
commit message or diff of this patch.  Regardless, I'd also be glad to
clarify the wording.  Do you have any specific wording suggestions?

- Eric
