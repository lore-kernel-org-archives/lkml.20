Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B01485CF9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159645; cv=none; b=dTvpFJDEEKWxUZe3+VxiqtATc2xovgk5h8bP+Hd63YtHDicP0xAOVNDV4b+prMzv4XwibBKqDAwSzGPtL5j5nJGtXfUOvygVNOw8h2Uv8LWp/O8DUuTxm/8t2gRXL8o3VMjGyQ4D3YrG2bgSiIulgTjZs6AhN3cb9RE0MLE/G24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159645; c=relaxed/simple;
	bh=v3IclZjlbi9Z4IjYxWogGj9IRDfhQqXoI8k1HAKfqv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8JyE2zPgkXx5/vG5UHJnqo3yGhXRjOGXJxyQenvHD2t1JBmNss1/hH0jORnhPvFCWJADcsV52SBF2X9iJpvMVVoYqfY+LFZDDZYyYPnqIxDHKrylWJctRvxtUOiG+KQOoxIiU1ToaWH0yxr82m+9I6r0nIReySN3XXvusDComc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EPYnfoto; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EPYnfoto"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9179bfa9e9cso268536d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792159643; x=1792764443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QayzQmhnTMuUa2ajrFbaahJ0XP47WZ2WayG+9I0E9kQ=;
        b=EPYnfoto7IJQjmAM5CmvrMhdK+nbSPInx9j0cMSqDlF/nK2jrZwAK8V5K+k47rxM7b
         kvKkuf+SKnH/8AYCeUihIetv6P0xwBTrTr4wWFXoT+pFpJvbXxKehCYNgarvFL3rejGc
         kZW4neR+1G8nwqUMbm4e5S+qrB+/Kyu931+6FquFPeo57qjOFGFfkW5qulTIY86ZAA5q
         lDNk5IAZVAAMKSCvNMNyV2XnKEDOHN6OJY7W5JcRdYsvM/62f/sHwrXancAvUvQSYJ9h
         /jKA3VKa15/Cn83WCOWjNPpJ/hXtS1khOxe8LDF4BPFqGpsgjdwCQ6RwUmwR9GzUZiMO
         hfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159643; x=1792764443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QayzQmhnTMuUa2ajrFbaahJ0XP47WZ2WayG+9I0E9kQ=;
        b=X4e4lPT8ZYZ0G5LUr5JW56IXMzr6dJC4aHUWJZdTwMIoNdur/nHVLgyPlNTI4SSP1M
         DxWoHICiZw+QGJJ0q4ByiJCA6vreUFfCcseNWmV/54qvQ438ySF82r16TBFzp09JVmGf
         /rLF6v8H0Fzw6CQdHBDdvN86K7Txnh4zEsZDpKFSTj3orrc03BCLQi95dU68ti8p9SvL
         PRaN/Nry81ccojl5R8AmuqxL33q4bSyo8Ra21zvtVjVPxyCHQdvEU7OH6NSk8OxfPgFw
         IP2JDfHzwfHUMC8+z4vjBRxBH3lW9G22LXpNolMcajg9alFjlwvcVonIeZ55ooupuwlx
         0qMA==
X-Forwarded-Encrypted: i=1; AKwUvBxgtzMFHXtGTjQGZvzPAIuaiSKQxW0Fy1Vfk6o+ELtRrQVurLI27NmmWO7Sgt2EcxKwu637/BIhzFfUasA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/WkaGWg6+wRTN73qC9gyfnQa6jW6dojEG8utcyr/tjFaz15bO
	zYRTwb0iDJ5NacWVLVPsUTM42zdj/ATsruD3Z5x4Zkvj0bE3Uk9zO32mkZGYCNuSVAU=
X-Gm-Gg: AYBFou1g8e9O/JWZkVr+jAIWt6d2fJKZEkwUjY5Uc1lmd3V7Dd3S6vUadJM/BY2vo+S
	lqDEa6n+BKH3pyfMHekY7zc6fTV4SiZ8iTq/wSKJNGAXgFJStthMdiEIIIsSdjYr7M+NUIJ+HOw
	ZwyOVL+kW94NPU3PzJGycVFTeXdxsJ97/v8HIkUx5+nALC8QewpnCnH4XJEBaQI6VcmIkLie0X+
	LQa5PX8yfD6UwVcxVJj26Zs0mOmIb4GAHIHNiQDVhMyHmbLdvcrl97u7NEaVe3Ijh76TX3nARST
	THXsgqXmTNOyvtpaHgvZqu3xa2Urw6Z27Rb2jqgEVuA1qgos1DrJLTzkRkRGpgSlkgrY+WH+4/S
	q9moTRF2I44RlEt6hpM1ovDn2jEEKD23WZZ78XX/+1R28LVhUpJg2EG0B2BPzb0feCUkkTeUZec
	Wr2f9MMKWHavqMvgLUI7JdsMR6AKwAaj4xhu27I1wH1wNCllYZ+a1Pi5gXy88OyoMWOpxVAXZ9X
	NC3CoR426CRqD0fo3jLoJhB3KADXzWvB3OnD//HpE/rCrsO3cwepx+94O4kZ3RzhA==
X-Received: by 2002:a05:6214:3a8a:b0:917:a1a7:6369 with SMTP id 6a1803df08f44-91bdf07e362mr1076226d6.22.1792159642853;
        Fri, 16 Oct 2026 07:07:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb75af3sm23592056d6.40.2026.10.16.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:07:22 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:07:20 -0400
From: Gregory Price <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range
 handling
Message-ID: <atIvbzEGUcyCqdC7@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-4-gourry@gourry.net>
 <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>
 <atIkDw9r6CVDJaG7@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atIkDw9r6CVDJaG7@gourry-fedora-PF4VCD3F>

On Fri, Oct 16, 2026 at 09:22:54AM -0400, Gregory Price wrote:
> On Fri, Oct 16, 2026 at 05:47:57PM +0530, Sarthak Sharma wrote:
> > > +/*
> > > + * An unmapped gap in the range makes either hint fail with ENOMEM, after
> > > + * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
> > > + * an effect on those pages that the test can observe.
> > > + */
> > > +TEST_F(madvise, unmapped_gap_fails_after_advising)
> > > +{
> > > +	char *mapping, *control;
> > > +	bool swapped = false;
> > > +	int retry;
> > > +
> > > +	pin_to_current_cpu(_metadata);
> > > +
> > > +	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
> > > +	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
> > > +		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > > +	ASSERT_NE(control, MAP_FAILED);
> > > +	control[0] = 1;
> > > +	if (!pageout_until_swapped(_metadata, control, page_size,
> > > +				   self->pagemap_fd))
> > > +		SKIP(return, "MADV_PAGEOUT did not swap the page");
> > 
> > This test is checking for both MADV_COLD and MADV_PAGEOUT. So if we skip
> > here because we couldn't pageout, then we don't test for MADV_COLD
> > behaviour at all. Do we want it this way, or should the tests for both
> > of these be separate?
> > 
> 
> If swap is off, the behavior of COLD and PAGEOUT look pretty much the
> same, and we can't actually test them meaningfully.
> 
> We check that madvise(COLD) returns -1, but that's also largely
> meaningless if this initial pageout_until_swapped() call fails.
> 
> At least that's my thought.  If you think I should split it, I can.
> 

on second look, i will just move the cold checks above the rest, since
they're mostly checking failure paths.  those are mostly unchanging
regardless of swap status.

so basically no need to split, just a mild reorder.

~Gregory
