Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663405;
	b=uwao50KVwroayP9JFpXU8NSOmVIQqNAAahKz/TJbUHf5EQ8863aoOYLBMzqIYrEpP1eR
	 M0Vdq3X6W6CXUCBVVhvO+9SxhShMtajXZRpvpPKPDrer8eUzw+fTr1iedVTX3qn61n0/V
	 IBUZvEK40TukdHHYXVU72VSbM9fySlvH6wtm22Jlt2Ys6eZlfXRRXNtOAIpzyta7rpzz2
	 n88n5qW2W7cl5gcLtQNvaKFi20ndW3RQQawAlNB5WWy9vc5kpsqHBPgKqaOoQZiydE9C5
	 27BH8OysrZO2NOyLaH+cNlCOHo0Tdm3HUto1CyZYntbrJAK2R/Gc5/PTHsNBE1DFTSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663405;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=LKFHPp9IOzONG9GPjbsaYkZsUGia8IXmv+C23o2wW9k=;
	b=PWyHFVah2ncQmPQrdDW+j3yksV2Xc4nPl8Mo90HEg/Z1sHccAyz36l2m4Ih8SesKpipw
	 U6O0+Wp812sp1/mQW1WMinDvPyc10nK5OS7ZGfcnytF8vq0Wmut/P8U5jfbmtoI8TGv1R
	 rlKwAdCEU6ctL2MMPSz5i07wFHSQavk3YQll5ny9oZ7DWXGzQgI7u5DJNlkb/+zEcH8s5
	 HtriM770X2eW51z6h+CdVqXnZx19EdFtI6dSVsgh9JDwGF09GsfdTrhvFDANEY+ccDKQG
	 nyya4szoAbXWeEBOZkKy+On6G44Izz+KqWEpbpS1BmiK71JotH6ugO6gcNnvJV9brCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mmB+A4kh;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD4606A31D;
	Thu, 22 Oct 2026 10:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FD4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=mmB+A4kh
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA09C24A;
	Thu, 22 Oct 2026 12:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792663272;
	bh=MlZWgSll8i8k01c8fAu3WetXI1sTFaQjCzC3maI6Qug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmB+A4khu4no9DpdF/JIEY0MnIjCSW2P0O0WkUX6bwhEmYR3LPt+v4kr6AThnejmm
	 qOGGRLmGvI8zPOu1BorNxbkiHXQAFHaAR9vRtH0/CwtZP+FYP16+xZqVFfVz7tlQcp
	 e4oD/uNIDujpH4kT/VUv7r6Qgqm5jLXMt4Ey/PJU=
Date: Thu, 22 Oct 2026 13:03:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261022100319.GD97006@killaraus.ideasonboard.com>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261022072508.GB1857@sol>
 <88eae369-49ba-4581-beb7-a4ff22f43555@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88eae369-49ba-4581-beb7-a4ff22f43555@kernel.org>

On Thu, Oct 22, 2026 at 10:29:55AM +0200, Krzysztof Kozlowski wrote:
> On 22/10/2026 09:25, Eric Biggers wrote:
> > On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> >> On 21/10/2026 18:32, Laurent Pinchart wrote:
> >>> On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> >>>>
> >>>>> there's no base-commit?  Including any historical patch (from
> >>>>> months/years ago), patches with dependencies, etc.
> >>>>
> >>>> Dependency is something else, but for every other patch:
> >>>> 1. For testing/CI: you apply on top of next
> >>>> 2. Every other case the maintainer knows where to apply it, because it
> >>>> is his HEAD of next-branch.
> >>>>
> >>>> I am repeating myself, but I really had no single problem of lack of
> >>>> knowledge where to apply a patch as a maintainer or reviewer of some
> >>>> subsystem, thus maybe I do not understand the actual problem you are
> >>>> experiencing.
> >>>
> >>> When I review patches, I often need to apply them to a tree, mainly to
> >>> see the context, but sometimes also to test them. I have encountered
> >>> many cases where the patch wouldn't apply on the current for-next branch
> >>> of the relevant subsystem. That's often because the patch had
> >>> dependencies. When I'm lucky they are listed manually in the cover
> >>> letter with a link to a branch, but that's far from being the common
> >>> case. I then have to ask the submitter to provide a branch, or enough
> >>> information to recreate a branch. Having base information (base-commit,
> >>> prerequisite-patch-id, and possibly base-tree) would save me quite some
> >>> time.
> >>>
> >>> I understand your concern about maintainers cherry-picking and sometimes
> >>> introducing issues as a result. In that case I also prefer asking the
> >>> submitter to rebase, retest, and resubmit. That's not what I want to use
> >>> base information for, in my case it helps with the review process.
> >>
> >> That's valid and for 95% (guessing the number...) of cases will be
> >> solved by having linux-next as a base, thus requiring the base
> >> information is redundant. It's just linux-next.
> > 
> > linux-next changes every day, so "It's just linux-next" is ambiguous.
> > 
> > Without base-commit, the workaround ends up being to use the date the
> > patch was sent and various other information to try to guess a base
> > commit.  That's time-consuming and unreliable.
> 
> No, you just apply to the latest next. You don't guess. We speak about
> the case of reviewer, so person working with the kernel, thus probably
> having not-so-old linux-next available. If the next use as base is old
> it won't help you at all, because you might not even have it in your tree.

I don't test on linux-next, that causes way too much churn. I test
patches I review on top of their respective subsystem's tree, as that's
where they will eventually be applied.

-- 
Regards,

Laurent Pinchart
