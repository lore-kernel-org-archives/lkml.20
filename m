Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B592495036
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856634; cv=none; b=Ne74URpmQ6YKRvrE9q5KznuIxKm3deZuZDuI5oPa061lewmoWxCVfqKqaeJhpjdqHQzaFVHNy7L2rORoZitDnY4fDyxRl+AzXGiEvmdWkBiU7+ckGUGXCzSpFgzFXN8ZWpsh3YVQqW1rvbroZx51scEIEdYAerB6JxV7IyzRp1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856634; c=relaxed/simple;
	bh=OX8MB7Faqz16FfyUs85JOvv54LKZYzIgi3xZY1Wp7OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omXDgRu5Na11ap1j4Qy3dnbdoOVHNl/DQisVJB2z5n/6qf2Xh05+Gg4Jup9qbjPkfD5yGaprYZnUTJ2M258lQVLo6FpwaflyAb5zjb0gcwDuXIRsMf9CqadC0083TiSrOlOEhbJH08BGnn4EgKhVvwMuThfWQxuCbHujf2uOqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jB3OwxfU; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jB3OwxfU"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90cdffe8e3eso2384516d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787856631; x=1788461431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msFJqjtLZA54o3SsVIL9LxyTHRQJCU32uWQJGDxK100=;
        b=jB3OwxfU14X7ihLcmmH+SWXvoNMJdVwHrgfy0VRto7RD4MHO9bh1WH54j3xJX5qFxB
         5l137tLKpyfuFKR8VGKCQe6gRVwuGk1oc1oS4HmSbgIi3Gc/lmX1O4tI7K1u3oIkobnK
         HHyzkAyfsOu1GuLSRyEob9OFkQ5h3SrRklQOFVfrfbdJ4irvlWDrze8TwXSeu9BMaPeM
         FCrN2ID+kZiJfHOg0m+gRqKt82c/znATo8H/MsBIxM5E5QXlmwOBq6Hudqz+2/IszqEB
         PG6+8ppAXqApKWzqxGi3IjzEUE3Cu+FzVeKd+HAaR1bkHfBa7DKNECT3iQLuPEE7Nby7
         lzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856631; x=1788461431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msFJqjtLZA54o3SsVIL9LxyTHRQJCU32uWQJGDxK100=;
        b=WgnFYeBWLf/BqobPu6pNDio5ZaT8CWq2G8xJAbvM5fCAreGL9uBEyHK+bK1RsmX+Ad
         Id7mg/fCvhPZRuflNDKZ02czAlT0RcgoczsEQmSH6k9zxW/wLVSQbVdbjDEcOg9Cwno8
         75QfkMfS6BXWbus9e1vpx0RccmjBALPTuRpJf0bgTJEMT1DJDCyvGz/Gtj6aBWg4naUu
         pCAODljP3QmGFv54pPePm1Ol/Fdd91eVIMi9xEU580BdHrIifb9LQxp93kF0yCRvifbI
         V2aRHlmCISrPWtn0EdnW+hbJ+KUVJgV+gOIKAZ5hKTwS1XffuzKmvpKcXWZgM4IIKBo9
         B/EA==
X-Forwarded-Encrypted: i=1; AHgh+RoT8Z0v9WS8NcKGfwfvm+w5Fl6Ws7+OJ06Zma/PW0wtohXrrcJpiuUOkrgW+XlDga8OrarvlvO8O8qYpLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lr9g6iQX29n0BEYV76Tc7t1CvX3qBt1h7hy+ZjMZ2tnO2M/F5W
	vTEL7JOmLVqykZhFawS4sMINqayD+9/pSnN+hblQjjggp0n1t/bXbKsVztUzWug9d6o=
X-Gm-Gg: AR+sD13TxTlC4wwCdFA9R52f797YuBtJnYGeaJHgjtw7kp7RPe67XZxPqsX1PiEky/D
	EkRsCJWYRvitiGRvyUIw5/D1kxOUDsQ3T0SXQ2SbhOtHubf5ILZzatlR86mLJI5vWaQe+SxAdwF
	H6amJheH7+j5iwi1l31Kfq+GkDXcQOaNm7uhsA0zvoskPM1AWl02v9dCZXxWjY/en7yTzTsW6Ck
	uVtqqbwyM6YnIcF2UbG5qDczmSA94m2MXlbpVregSzbZ0Do8kyONqdany/8eLz+akeZZbJCf0Rg
	1fxcV9gHXsd+HOI4bvYuiJ4M6k5BHNaSQIXVGt+LEYI77tqORiB8uTeMHyMRz/o+QNF1khSte+Q
	IWcWd6eMxTYmkib2hhUvk6e/F3O1CtUDd6Tjuk2F5Q+75+Ex7cKkK5+zmSXYbul5vGqW+If5X5D
	3BNLZAAEtmOCgdaz7+ZOaLIrnANqYXiMOBbR4WkFyRShjKSDJYwe+hjJuKxlPKagexztAFxZsdT
	VRPSzokfMDt7dhAAywp76eUdIhjcMla150eiqt4Efpm
X-Received: by 2002:a05:6214:5883:b0:90c:c6fd:e8fd with SMTP id 6a1803df08f44-90ce0c4348fmr19428846d6.2.1787856631396;
        Thu, 27 Aug 2026 11:50:31 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd73e3261sm23067036d6.32.2026.08.27.11.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:50:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:50:29 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, 
	jannh@google.com, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, peterx@redhat.com, jgg@ziepe.ca, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/madvise: use vm_normal_folio_pmd() in
 cold/pageout PMD range
Message-ID: <apCGrJthAhZ_A1B6@gourry-fedora-PF4VCD3F>
References: <20260821144947.167382-1-gourry@gourry.net>
 <20260821144947.167382-3-gourry@gourry.net>
 <01865a13-2c18-464e-94eb-466613de7bb3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01865a13-2c18-464e-94eb-466613de7bb3@kernel.org>

On Thu, Aug 27, 2026 at 07:07:38PM +0200, David Hildenbrand (Arm) wrote:
> On 8/21/26 16:49, Gregory Price wrote:
> > 
> > Fixes: 3c8e44c9b369 ("mm: mark special bits for huge pfn mappings when inject")
> > Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/patchset/20260817220810.1175596-1-gourry%40gourry.net
> > Cc: <stable@vger.kernel.org> # v6.19+
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  mm/madvise.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index ffd6a68320a8..ab362bc482a5 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -393,7 +393,9 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> >  			goto huge_unlock;
> >  		}
> >  
> > -		folio = pmd_folio(orig_pmd);
> > +		folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
> > +		if (!folio)
> > +			goto huge_unlock;
> I think you can now drop the is_huge_zero_pmd() check, because
> !vm_normal_folio_pmd() includes the huge zero folio.
> 

I was err'ing on the side of not removing existing checks, but I can
take a look.  Trivilially - I think you are right.

~Gregory
