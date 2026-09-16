Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBDA364EAA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570709; cv=none; b=oukLQTFPNrzc/yCTwezsxyQ/YTHDID3TkdEueAsDLhtGM8qO0cOYW+TqYyP8Yokla0LStsKUX+1mEgUmV/QNDedaLBBX9/vUUhRkv93wSZID6G0LQqrVat5XxrssrNeqs2fC1XbXqsI2Tj0Zdsg6TVTJB94R77PxOcHtGR+AWQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570709; c=relaxed/simple;
	bh=zqbHumWXTgyPSnBiFG7tdNAOB274jQFr/Oh4RdNiJOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArDySGsHveCoTzCXcXWNCICGA7AWatD4qe00ic4tByF66NohTkwvaH/HockTC7hbqFDXohiwu6EiTWZM1bI0ueEFH4E730X+SAZ+uPOJ4214m1eqJSKrwP03xUzByFyxencYWZzIhJlYPt3A/32BZrj/hV0ITxhiQMRoe3FpYwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=u5PPQc5X; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="u5PPQc5X"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9123599f5e3so10395706d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789570707; x=1790175507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJ/7KRGCLt2483GTzu4rmQfCVmqSHc3OynN8gOawIhg=;
        b=u5PPQc5XgfkDEu7rParCFg56Eg75TdIjeZscdjXJx2o/l7J7dPRigdTIzSvwlbeX45
         Mrmaqg5qvMT2owAWbS2jLqWkMJqG4MWW18xIhE9LHXL1RCw/W8lfqf+FCYPDxj2yd6gF
         RVLwA2s43htz4Gotc9/zlcaT5MKWU3naAOgmyqe60UaX2B4d2H4SjpVMlbrcF2qnD9+N
         P01b5J9u1StgXPH4nIuPyQ5L2LywEtep96cQX7UpfaLpBhlwt+Cv0awroneDD1tz1bTY
         1kdWIqeA5/KkYiSfXTqMEomc+3SmixhcCTnzFihpPKhBrppali26VfFJxNkOGBnvYwKe
         /c7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570707; x=1790175507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJ/7KRGCLt2483GTzu4rmQfCVmqSHc3OynN8gOawIhg=;
        b=fcBpIGYf6aTSslmlW3JPpAQobuUQayiOm7gtNBqsvNhvHgla6wVQg9qe1hPH3i+vrt
         Db7Ig6kEEglLMhHwOx1ayBTB+JJ9CGRQM21lYukXD2YtsLtXmV7H3fvVB9GluvqAZxPH
         ajLniYM9cPLcSPG19xlTv8NvlbwaeZFqKYE/Mpdhc5MDzOX0XQD2i2T4st0rXMVNbSRF
         +AIHbGPHU/Yl8wvk1c3qMl6mW+oivc4J9GuYApSyysgrz5w87wSEPaRc3YYhm6DaviOX
         8i5WNM0GidWTaY90agBsndv3ZoGid6sfZ50ka2JVvGzFS1MMGHEug7oPdqQCmOsYr8Xu
         79XQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1XjUcZiOeLiTkH/CQVJRwHwv49VA1t9j/PUieL5DnyA6gyKnO9mSe3MzlaS6W+EoX92pXGSOqparQfU4=@vger.kernel.org
X-Gm-Message-State: AFuF++laHIs0RsTGS7/JL6cK5DrSjDLXDhyFIdYMrgT4RV6VuWsVlpQh
	TZDis6czeSMKNQFppwc+hXyV40kPUopeTS7a5gblE15JgdBRSETVHChLG6jLK0IwTWE=
X-Gm-Gg: AYBFou3noMf7cNYOo3xYgUo0AcgBjCYW0G9mf9rXa2Cpw2mTrCizE9+oh1Ab+yqYnnD
	J2aFSeOcJKSSSmtwxea+kqzNFzQzXyZbAiQpI6s1dZMVE8Ydypt6ScPZirUwFgTi8COrPRwC87t
	uDDoRkz+0tHejfVT3p6acDkEU1oQLFlIXcL7xe4uQPg6jmyFRxmU+JStyDqwzga+26ZN9+rpDn8
	ypVYDySIM5OFqnFu0joz1zMDdQV7UFgZ/+X4kAyRquErINo4WOBFv4g0KJkIoMhx2rTDixxjoL5
	5xleDv8JNFVb5KtlPM309a8AUZ9PetpiLRbIdM/XVf3gT062QrQ6f+ltm57/QW4Rt44GSVrWYdc
	39B4XBiaElSEAxOyZuRnkNaeXGEiUMyizAF71BAOOreI4+Jdyd1UVUJF3nBaGmJ8ST/AsBLWjnI
	839ZFai6iseQ5oYkgoYuUHF4ZrY5sKrEb4wkIyuyVScWwN8NJJI1KdqL1WixU8Tzrm06JPKMJWk
	DX+nGMXKfCD3Kyx3Xs9nDv6fpoV7pS/ZUGxT83/lnyXwNN6kno+fj5jLIYrWQApSQ==
X-Received: by 2002:a05:6214:21c2:b0:910:47af:7b5b with SMTP id 6a1803df08f44-9123d7ace93mr52499256d6.20.1789570706029;
        Wed, 16 Sep 2026 07:58:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beeec67sm27942276d6.48.2026.09.16.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:58:25 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:58:23 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, jannh@google.com, wangjiexun@tinylab.org, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqquDtEZL1ndymGN@gourry-fedora-PF4VCD3F>
References: <20260912110832.3203902-1-gourry@gourry.net>
 <aqloB0zm3RjJ47m1@gremlin>
 <aql65IhMobL5Al9B@gourry-fedora-PF4VCD3F>
 <aqqTbGMJL86TzDrf@gremlin>
 <aqqbB_nFAOGenDhy@gourry-fedora-PF4VCD3F>
 <aqqjW5dpyznijYLh@gremlin>
 <aqqk89oTigJ9LS2N@gourry-fedora-PF4VCD3F>
 <5437871c-d9ee-49d2-b24f-965c73c29c3e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5437871c-d9ee-49d2-b24f-965c73c29c3e@kernel.org>

On Wed, Sep 16, 2026 at 04:48:04PM +0200, David Hildenbrand (Arm) wrote:
> On 9/16/26 16:42, Gregory Price wrote:
> > On Wed, Sep 16, 2026 at 03:12:53PM +0100, Lorenzo Stoakes (ARM) wrote:
> >>>
> >>> Going to spend a little more time testing and tweaking before I post it.
> >>>
> >>> I've been working on a making more extensive unit tests for certain
> >>> parts of mm/ and this might be a good time to look at whether I can
> >>> introduce a piece of it.
> >>
> >> Nice, curious as to how?
> >>
> >> Have you tried the userland VMA tests btw? Not tooting my own horn so to
> >> speak :P but it's nice, though it comes at a bit of a cost in how the files
> >> have to be set up...
> >>
> > 
> > Yes, in fact I used that as a start for exploring how I might make other
> > components testable the same way.
> > 
> > "Stubs... stubs everywhere"
> > 
> > There's basically 4 testing mechanisms i explored:
> > 
> > 1) selftest
> > 2) Usermode Linux (UML)
> > 3) Userland stuff like VMA
> > 4) Linux Test Project (for syscall and ABI testing)
> > 
> > selftests are really limited and actually create a maintenance burden,
> > they're not real unit tests and are highly dependent on the actual
> > machine configuration which is super annoying.
> > 
> > But, lets take the page allocator as an example.
> > 
> > The only piece of the page allocator that "should" (cough, simplifying
> > here a bit) be machine specific is zone and node configurations... but
> > I'm not convinced that this should require a full VM to unit-test.
> 
> I told Brendan exactly that (try stubbing it) and he tried ... and had to give
> up at some point because it just wasn't feasible. ;)
> 

LLM go brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr

I'll try to clean up my current pile and see what I can pull out for
some select components.  Something is better than literally nothing.

I'm trying to be careful about not causing a bigger maintenance burden
while also having some confidence in my own code.

~Gregory
