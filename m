Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47864A5ED0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158525; cv=none; b=c5eZn6eOaFEsHEQgFsRazjM0nbPSpETpRB0CYQEp8/Hh/pljWgyAMU907CGkHxvylnSP4Ev/0fsttsX5A5MELO3nn29/XVtJAvx9+lwiTHn59ZMCB3aTD9fBozeyaZFj+fBLM3rMr85UhFpLdvQxgez+3En5RJo0f1iz4bRUBwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158525; c=relaxed/simple;
	bh=42BAW3sjeH2A6QDTyTHzsJuEqTfgp3lMvIVXW4J5Bxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEioJB8GZciCvKYp+JIytyUf6oKt6ERQjqELugwI7eRM+ylg8ktk2Ulg0qbWwKkFxJ0eEqv9hAYLOExNxCGN6c2BugpC8caf0FzvxcrbAMi5zoOwsQ+JBVtIChIkzRFtAbQHforrLUj8YbStv5JH1RnaXmsOBlogGQk/RA0MeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mZcM2XEy; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mZcM2XEy"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91791ec1b83so97636d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792158523; x=1792763323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0/H2zWOxTS0O6iCKkUCp+Yb9Q6oHYUrnCIj0DP3Fsx0=;
        b=mZcM2XEyMEqjHm/Hv6Sc3rx3CbgpiCQDPd81GjfsH/cYXmvEYGLPTWe6HCICjrOrpt
         8JHgONAVgrHop4cB2CEDIpmqgWZtM9V61TE8SiOff1cqiSvGyswYUbh1aU6HHHYWrsF8
         uSzFOhQVgxC8nTr87e+HwfBI02VUJmV0cOPi4a5Ge39B+XJOcE7alVcgl5vBEwdZMGo9
         xNM1Ym+vE4n2oFdyEXX9DBxwO447bT8Davx6NvkFtPw/vwCUwZ2qxiNlmQRQVOQqZ1ap
         ISl9cI5qOx2Fnw3QBhPGFJts9/obvS/zTtcnCJN8aXwwySu02c0XPSzDyvIbZvdFkmSs
         oSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158523; x=1792763323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/H2zWOxTS0O6iCKkUCp+Yb9Q6oHYUrnCIj0DP3Fsx0=;
        b=sV7yZOB5x8NutpIMhOwKHhkmegHqKtvvfQ81wUvlmaBZOu6+RBrPT9TFVg9OhbLvef
         c/MkrxMJnDwA2RfRpuPGwE9MwB1kxStBpzQvk/aXAvC9/+BFngGR87Qs4FHpE1cEY2XW
         d9oupYAzt+U5mCe2fuunPu0iQQ+bAqYwRiVG8yHURPxInRrFhNWOT6daSpYmxtOjSrYD
         0YvxolWlht7H6GNbCUkQWJkkSp7Sm8Xu0N7ijhCJMAIK9NH2RGLgaz3xGza8TS/5xNwi
         hXisHH8IwZJWg4KkoXXrJ+rsQFL4GcNaDxHaXdo+0PPdW+hb6CpNrICnj5E/bsxYwCRl
         gRKw==
X-Forwarded-Encrypted: i=1; AKwUvByO4XKRGFLuhn6AntEWoKO69/EQWu0n3cvbhHjJ8rnSlAWmN8MCAbbSMsRWy9NgGU/ZRlXi/2ToPAXE0Xs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo3k7bNk16Vpp8Q2Hvh1fUo5y9eaCp7/AsZDqOFchlfV2Ln0ys
	gQvs9/ZH/oE/zoV6w49fz6b9u0cdw2gES+LbB4DyxxquVHAcyLB7RbHj1tN3BFq9AUA=
X-Gm-Gg: AYBFou3QHP2ig0mwb4iM/Kd7+gYsrf4GRKyF47QztyxWUjTRqPmkLGKg/l6mDr/4Wr9
	aBX+dKDdYeLzR8/mJdKOWIvxoXeyhpc3gHPmDnuRPIqIfWHkMCxb53mT2rsfHuZTyjtzz4XhTSc
	Aw+CV8xOhqSUhXamcF/auT457WZZF3w0tF78eKo3+ygzbnFEFFn5GykfXhmprjw/sPSkBUdw9yr
	G+dz3VTxDaM+HlNgC473Oj4UacUDw+cq+D7rF0EcRP7Olop21w/9gDd5cHpT4OpxpODPUYwcwWP
	43RI3Yy7ij2ZdrgRe5aiT/okBTWrdHsfsPYKRLp0n7OhJ9mLkigDOc1qNPtcPoTEFTEgM2K9aco
	IdDAvlfGZPMwiLI7Fjsq4bCQohSdrIxqHFExjJDtLyBrVuMt4woKrrOB1JqgzWEeGSKPLpzZTgK
	iixYX5tB5MW3nOWUdRJ5XLa6R/urm/fnqcovyuaxDqvQ4auBUXHkUyzp5JZQ8zcm9Y+6JEQcNiI
	ccIfvwIQeG63+4CHwD5EKUnKhNEU8BKaPadbuc5YuYWjWyAR9BstW8=
X-Received: by 2002:a05:6214:3013:b0:919:b4fb:eec with SMTP id 6a1803df08f44-91b5578517bmr396695716d6.36.1792158522383;
        Fri, 16 Oct 2026 06:48:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbaae645sm23369576d6.21.2026.10.16.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:48:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:48:40 -0400
From: Gregory Price <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 7/8] selftests/mm: check MADV_PAGEOUT file permissions
Message-ID: <atImwW1ONQQ9Hv7p@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-8-gourry@gourry.net>
 <cba2a01d-630c-42d3-b6e4-b498f10c4b45@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cba2a01d-630c-42d3-b6e4-b498f10c4b45@arm.com>

On Fri, Oct 16, 2026 at 05:48:11PM +0530, Sarthak Sharma wrote:
> > +/*
> > + * The owner of a file may page out its clean page-cache pages. Run as an
> > + * unprivileged owner, so that capabilities cannot stand in for ownership.
> > + */
> > +TEST_F(madvise, pageout_evicts_owned_file_page)
> > +{
> > +   char *mapping, *control;
> > +
> > +   if (!geteuid() && !drop_privileges())
> > +      SKIP(return, "could not drop privileges");
> > +   pin_to_current_cpu(_metadata);
> 
> Is there a reason why we are pinning to the current CPU here and not in
> the next two tests?

Oversight on my part.  I added it where i got a failure, but didn't
carry it forward to the other tests.

> > +   ASSERT_EQ(mapping[0], 0);
> > +   ASSERT_EQ(mapping[page_size], 0);
> > +   mapping[0] = 1;
> 
> If both pages are on CPU 1's per CPU LRU batch here and then hte task
> migrates to CPU 2 here
> 
> > +
> > +   ASSERT_EQ(madvise(mapping, 2 * page_size, MADV_PAGEOUT), 0);
> 
> Then this can cause lru_add_drain() on CPU 2, and therefore both pages
> do not reach the main LRU list. Thus they won't be reclaimed and the
> test can skip here since the CoW page wasn't swapped.

I think there are other corner cases here as well. So yes i'll set up
thei pinning - probably worth it to just pin the entire suite of tests.

My original set had a bunch of this tested more explicitly, but this is
really implementation details that are not worth the additional test
complexity.  I think we can just rid ourselves of that and just pin
every test and make sure it does what we expect in that case.

> 
> > +   ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
> > +                mapping + page_size));
> > +   swapped = pagemap_is_swapped(self->pagemap_fd, mapping);
> > +   ASSERT_EQ(mapping[0], 1);
> > +   ASSERT_EQ(mapping[page_size], 0);
> > +   if (!swapped)
> > +      SKIP(return, "MADV_PAGEOUT did not swap the COW page");
> 
> Also, here we skip if we couldn't swap out the CoW page. Won't it make
> more sense to check with pageout_until_swapped() first if pages can be
> skipped, and then fail here if the CoW page wasn't skipped after all the
> retries, similar to how some other tests implement it?
> 

Ah yeah good catch.  I'll adjust like this:

   /* Ensure pageout-swap actually works first with a control page */
   control[0] = 1;
   if (!pageout_until_swapped(_metadata, control, page_size,
                              self->pagemap_fd))
      SKIP(return, "MADV_PAGEOUT did not swap the control page");

   /* Run the actual test */
   ASSERT_EQ(mapping[0], 0);  
   ASSERT_EQ(mapping[page_size], 0);
   mapping[0] = 1;

   ASSERT_TRUE(pageout_until_swapped(_metadata, mapping, 2 * page_size,
                                     self->pagemap_fd));
   ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
                                    mapping + page_size));
   ASSERT_EQ(mapping[0], 1);         
   ASSERT_EQ(mapping[page_size], 0);

~Gregory
