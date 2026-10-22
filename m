Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653910;
	b=Pxp/DDyg94Ly1kHH7AZgXDSfhIc7DtlrHNP50SGq5LbG2+7s30UWI6AEGcbDnR4U+CKv
	 tcQ92yrbJ/QqQ3xRg/3tFpkCSfWcJ6b0LxpAaxHqB/8tzfAMj0oXqp4TaBhaxIrh2P0ZV
	 Irr71wmwmSPKSQME423DG++W/nO6HEe8p2lLSEJQf8E7/NXUMrPKys2NsVPczB/baLhi+
	 uWtNJ3Ua3LZN8j+A7KWa8PVMc7QFCPbKK28NTGgTOjK5IaSIgpgCMIyvpRrnAdap/WPNs
	 Kqx8GSqQjS1c64bX3KWfw88+rxD6Lnsl16599pf1kCCsQAGniBmpl3KOLqkx/IMgGWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653910;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GzocSWmRnJBjCb2IF2ZXZ1TezmknaQ/uzyUsvuQWgJw=;
	b=v1BHdE0+zJb9Q7hrj6I1Q7KQ2Xu2umkpFIk9/gjs8kRBepEsJxMWyGdcojoBpa8wGHZU
	 Iq3IS2iNyd8FEBE77lOE+GD/1qJKyxSQ+Nrrq0En4Sde8jmwQteUvo/p3taKF81Yz4tDv
	 bPV0snJJm0jBLdDjDjzZb50FRlPLIC1B0iyDpIV1lax11qkteN21ninLKqNn2K3m56qk6
	 hgFGKnr6lPvqN2GF76vz2QQT5Z6S+eq0GEepGq0QY9buOvc/VQsGTNFj0dwdEq2PXWFqh
	 rykZ+7tYWREZ7YZ/N8TLtXac+kbLPH11gGzMrk2j9AkFRxDIKczc6X0epCc1wn6YRQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/0Q6bHq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECA606A319;
	Thu, 22 Oct 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/0Q6bHq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9BF1F000C1;
	Thu, 22 Oct 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792653910;
	bh=GzocSWmRnJBjCb2IF2ZXZ1TezmknaQ/uzyUsvuQWgJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/0Q6bHqEEwQkMFBTpOUh4aAud/xmgWYqMgfLFHpDm11MHPv4m65rIi2mdpJSPAwh
	 Je0+7/QCnmveYgttqoY3iGFia0GHA2u9x+1SiZH7wJyopn2pXBqBQpoHJmjmKZkFHW
	 STd3VJKealBIMYLjCyUHiKYFB8bxsibJr9I3fL2kh+gR4pI2NQs7wSZKUrqKCh3+ql
	 PxGTzA88H+vY6DLs+po4LkexVJ3kKT5bF1Jwuo3KAuELxNJAt4EvBM6z5aJkklf17u
	 TYgikUf80/489n2MTmF2V6Dcc3lNSS299qZHBLeigEikha+CaNebVdDWJ7PQHV26q4
	 nMfmSSQ/Wd2JQ==
Date: Thu, 22 Oct 2026 00:25:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261022072508.GB1857@sol>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
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
In-Reply-To: <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>

On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 18:32, Laurent Pinchart wrote:
> > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> >>
> >>> there's no base-commit?  Including any historical patch (from
> >>> months/years ago), patches with dependencies, etc.
> >>
> >> Dependency is something else, but for every other patch:
> >> 1. For testing/CI: you apply on top of next
> >> 2. Every other case the maintainer knows where to apply it, because it
> >> is his HEAD of next-branch.
> >>
> >> I am repeating myself, but I really had no single problem of lack of
> >> knowledge where to apply a patch as a maintainer or reviewer of some
> >> subsystem, thus maybe I do not understand the actual problem you are
> >> experiencing.
> > 
> > When I review patches, I often need to apply them to a tree, mainly to
> > see the context, but sometimes also to test them. I have encountered
> > many cases where the patch wouldn't apply on the current for-next branch
> > of the relevant subsystem. That's often because the patch had
> > dependencies. When I'm lucky they are listed manually in the cover
> > letter with a link to a branch, but that's far from being the common
> > case. I then have to ask the submitter to provide a branch, or enough
> > information to recreate a branch. Having base information (base-commit,
> > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > time.
> > 
> > I understand your concern about maintainers cherry-picking and sometimes
> > introducing issues as a result. In that case I also prefer asking the
> > submitter to rebase, retest, and resubmit. That's not what I want to use
> > base information for, in my case it helps with the review process.
> 
> That's valid and for 95% (guessing the number...) of cases will be
> solved by having linux-next as a base, thus requiring the base
> information is redundant. It's just linux-next.

linux-next changes every day, so "It's just linux-next" is ambiguous.

Without base-commit, the workaround ends up being to use the date the
patch was sent and various other information to try to guess a base
commit.  That's time-consuming and unreliable.

- Eric
