Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1E25616D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183220; cv=none; b=ly5iSOVz3C6lZMnGN0kHSs8rZw8sXePWPAYow8UWvxR9JH3ESZ0w0KjjnmsQBv3C2nzzPkev2L0eErnLA9NtHjl3J3MhXakudvycDAgBPPpYU+2MMI0Bmi9RoItVRJBlBOwVv1UhLwbTy7x163uzA/Ra+ACy/ANRx/fXda7SdDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183220; c=relaxed/simple;
	bh=LiJ4g9qpoghVVXRiEy8va6iNjTqxUY5nd8Q1xYAsk8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/qGwsqfAp+3yN+DE8L8XcUX2Jj2gu5HjjPZTAF3LQ8I7YhsF7Vo+fpRLKfEqCQrwCINWxX+wjzg7zak34Gt6RiFfSqZOWXtqELXmVokUAwE0ZbST57B5k5nXZSmXnlPc0ESoHOHSdxw66RhJDoLi29+DVueuto70oziUHPZPTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LQRBDuEJ; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LQRBDuEJ"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6729ca45e37so1283594d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790183207; x=1790788007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5/Q15LjQU6IGrJSXLhgsnwxABxyY9NVXcvoSHf7b9NM=;
        b=LQRBDuEJ3KI9cDxBVDkeGj+C6778FtYCypgLCL6/DwCTp0WUEZpxrT/eGXm+P9CuPZ
         oEDJUq7Vudgeur5fvwxfPi881yu4TQz4jCPpNTtCUZN87c8FoQSagkG7cKnU035mW0Wx
         jyQFma1JhDZH0LHq6kJ/6yRJmlIl/6FQ4IVnwQ3tqGwN7CCbIrGKUUG0CcDFDJ7DC1R7
         vqvOR2NOVsSle2IXWbakqrI4vWpn8PM3KGV1ZeTj8g1Pcot4NlgDd043Yt3I2YyhMlG9
         HNVjkvWge2xiYgfIf/y3XD+Zgy6hUDvvohzuRAUcQHpNNvXh5pBmStUMawKRl6RtjV37
         GNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183207; x=1790788007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/Q15LjQU6IGrJSXLhgsnwxABxyY9NVXcvoSHf7b9NM=;
        b=K/y9jTjJFgAQ9sBxs91Tz7iHPFc82iWIszMIAi8NI6rTbYHVJAXJfPW8yp9uHWG50u
         8unEmkMOX9lZ3fvfBO8/XIK1+KfQHKCDHC0qG0b4E9S5HreD9Q6t/qIADTFm79BpD8DO
         6P0MJsJT/drXZDW2r8dD2pWVIAXmVTnBN5C99Z0iUH0u9zMGdjJ2YrbLrJxL5RDcTGJw
         t8Nu9YhPUgrBfGVcQalET9K9/4cl0V8EKL1khz5K3YDHoWxqY6c5/ecMZmvB+N9CpuI5
         ALIPVuSaGSymmBvlmPjpyBIrbgFLtLG+XL/4FnGEhjBdM7QnUsw3VEinmAyipBi6c0Yy
         tM3w==
X-Forwarded-Encrypted: i=1; AKwUvBw4VawTPLlb5WRSrvRdI7pDeaYw3UhPlYxnx8bk74q9m3j3fwMMYeWquJ4Hj+vbMWA/D3GAiVWgT/J/Ye0=@vger.kernel.org
X-Gm-Message-State: AFuF++kmJIjQK1HsUsu1Yu2eVuchyUsLEp6kau1WwGbHixNB0TTBEtR4
	lkpJV2dpuECBKf3Nc/lkbEB1Ffb7//t/W7l9svkX9CUQNO4i+cWJgyOt1GSUbFMFuK4=
X-Gm-Gg: AYBFou3LU1Io62N1iKfQgRRG5xrURdgyPirCH2ADEV6iPQ6nqM9uIFciJl/xB6oaFcU
	VEn/ulGlWwEMPtoZ1OvQti9oDaioUsgoMj0Y1mVhm9eAX9zgYhYAIABCYeY6xYSBDFI2bW6tKuJ
	2ECI8cF0NiAiasJUz3ROSDa+ru8O41miUY59+6rs4JlZLtTbL9FTDBc8vakFD+82KcZ+mjZCvti
	EqUJ80ahn6/RY04caKxxJn257xUsRLcz1c2U/yFk8U1Ke9UoIBj96lid7t0LvaBQ+JNz/oI7ibr
	Elkqu9YlSBlzgUoXZrDMQBt53jl4BMiPii78GZLpwYcmFSxOesl493RRMP7YqWvTugXy7caf/lT
	ZoRoXJHi161t2E7iq/fbAvWKUh8Mp8HbJExUpSXxzWyO5HzHNOjV9D1W77FRq+vnr+cYGGKeVE5
	b3Pp3a4be6KKJONB8ozIYZeThmINb5IYLfZMUsmc9zCClYh28O3mY5fe4bLPWXIu9tgKnNTUM19
	0YlgNHauCPrL+7Hlf4Tdf9BpUnojq+MBVXQeaaunNQtSICEST8Kh9g=
X-Received: by 2002:a05:690e:1743:b0:672:99e0:ebec with SMTP id 956f58d0204a3-672d5956963mr1045386d50.132.1790183207298;
        Wed, 23 Sep 2026 10:06:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248cf620sm269920985a.43.2026.09.23.10.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:06:46 -0700 (PDT)
Date: Wed, 23 Sep 2026 13:06:45 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 05/10] mm/madvise: factor huge-PMD folio processing
Message-ID: <arQGK4RbYWYm4En7@gourry-fedora-PF4VCD3F>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-6-gourry@gourry.net>
 <arP4Igew3iL9qVKW@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arP4Igew3iL9qVKW@gremlin>

On Wed, Sep 23, 2026 at 05:43:59PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +/* Return a locked, referenced folio only when it must be split. */
> 
> I find it really weird that when it:
> 
> a. succeeds
> b. mapped folio is missing/invalid/filtered
> 
> In both cases it returns NULL.
> 
> And it's also weirdly returning a folio in a kind of failure case, or it's
> more like a defer-to-the-rest-of-the-code case I suppose.
> 
> I wonder if the split could be done as part of the function?
> 
> Then maybe have it return bool and document that true means it's fully
> processed (invalid folio cases, success case), false means that it's been
> split and the rest of the code should continue.
> 
> Awkward one actually.

Yes this was an awkward one to futz around with.  I took a couple tries
at it and this is ultimately what fell out and passed the tests.

I think there's some tweaks that could be made here, but I err'd on the
side of "don't break shit" before I went twiddling.

It is at least easier to understand, but certainly this shows how poorly
the original code was structured.

> 
> > +static struct folio *
> > +madvise_lru_huge_pmd_locked(pmd_t *pmd, pmd_t orig_pmd,
> > +		unsigned long addr, unsigned long next, struct mm_walk *walk,
> > +		struct list_head *folio_list, bool pageout_anon_only)
> > +{
> > +	const struct madvise_walk_private *private = walk->private;
> > +	struct vm_area_struct *vma = walk->vma;
> > +	struct folio *folio;
> > +
> > +	folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
> > +	if (!folio || folio_is_zone_device(folio))
> > +		return NULL;
> > +	if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
> > +		return NULL;
> > +
> > +	if (next - addr != HPAGE_PMD_SIZE) {
> 
> NIT: Maybe could define above as:
> 
> 	const bool spans_pmd = next - addr == HPAGE_PMD_SIZE;
> 
> And then make this:
> 
> 	if (!spans_pmd)
> 

seems reasonable. ack

~Gregory
