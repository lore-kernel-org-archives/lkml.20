Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036403;
	b=xjvvr0HweuyQRRI4BMkYP4DNKTLA8ljsvUGO+BlreVqOJElB2GJ1YZqW7vIvlLpVJ4W6
	 WCGH6ehpkE4ARfuYpRyPmTFlpy13o8N7T4GKM8Dp7Wr4yl05nDhP9ihMtG/TtqmB995w6
	 dJ1Ymxnev6/FmZirK+LQ0Xk+sZWQnFqTgEg39ZKDR8Uk2JqKz4VApivdORYROLvCJWEuq
	 tiQfyOlNzLAr6kTZV4moQn7QWkz4VJOaB7uN/OEdJKpijjj7Mq4EBaQJWso0soZ1aF0gr
	 eqzsmq4UrG0QuRuc4PnwLAptFSAHT/cl+60OVliqqPIhmUkG2ajqCy2oy0JOsG69gRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TdZI+A/T6veaOF7Fsd3qi5AF2bBsWKQ3dAj9xuoYJUM=;
	b=RDhGVQftQc6razY6ME60u8ZZIf2a1ySoH6mDcAz/E5QLhpGAsQzzm3CdmlPnNHh3Pc1x
	 K6yA6Tl3o+dLQ8w7vh8gqpaLoJdXSV22Y0L7vU/b7vYYeVs43shtUbwlSTZ2O23IgDHjH
	 zjE64YX89zwgBxP7SGZ3TcSGBmqGTTDRYG7yzvOtCbmEMe/mueiW1uDAlTimFB9hYM5pO
	 tLxqp9+Cnlv7qqZOR6keoWva3mBcxgGuoFbkAv76auyXhLFax11dH4zyq+5HRYXDMDhx0
	 azmlqoHzeTYX/B0JGHjvVbUd0AU3/qBcO6p1GmsEBy0AQboQU7aXAe4K9iMn/2DANwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Axh/bVHR";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Axh/bVHR
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c450ab1483cso446966766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793036401; x=1793641201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TdZI+A/T6veaOF7Fsd3qi5AF2bBsWKQ3dAj9xuoYJUM=;
        b=Axh/bVHRFf+6yVjD5QuZk/aN6eIF5mIJW+FknJ0QhIFnrlfy0ITy11nIf3e2M1NREC
         9iDJHdGVxDSkatZadFtw8tuU030vrweeN108n43l1VsEqG73neammW06FuVJKFngLRmC
         2fJEFd+pWsZeZh7lwV3lMZiNVTuqs89n//ARWVzuwkTGYFxBZ/jNIiLOHzrVTanEFm0G
         9w0wf95xzIpwYCqfzs/GbkMv4NJUiINg/Wq6gLG1bnTb0D9zT9luVqck16GOUxqa0w7F
         b42DVlGlAKjvo3PRijkVQM0JKcBlypmH+yEq77UlPdd29aOUo25MrulqmJcnfa0h/dsl
         uwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036401; x=1793641201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdZI+A/T6veaOF7Fsd3qi5AF2bBsWKQ3dAj9xuoYJUM=;
        b=EyVilFkTRs2stPJZNAw4uc5CiTJPBZaIR4RZmgnPsF0jV8poDYc2/YaavIxJvmhTtA
         gLmYvOhOu9Tgh8P6CUyCTUUqSJuuSTQLVFbPhIqhLd8N6I3uI84fXSFfd61cmDwoGynb
         vR7dT7J5npPJT9veAxxtbonh7hnwivrB0QJUUL90M2BeJKL6bMtvA3GWM86lU22eYgMt
         hcVzamEFd76kf/4ZCwQ7skF91IvsmYSjsxQ08pmAy7DgSAoZRPq/xLrhGOrQsiDZ2QOO
         eTVKt0n8Q0ptWlymEM+rTdI8IpGlbvIrCZ3TDX2gBLug81uouq532zYP4kaDtrNkr4vt
         0fgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkkI/bS1q2wuVTEHGUBD2gga2xTblpgrPpEVm1O4ZCXDS0077bz9tVl9Kd9rsWTBSthWlAc6ErfdMgDIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT/lQIlG6Pps6GX+lKgT15xz2KFPNLJGpt9PFJxs6ahHqjohIb
	YCvvh8qTlV4TrS0cOsmZnz1nJ4TU4U/mXLhOJsIkag0bDjCf9BoNbwt0TTz0PHHA
X-Gm-Gg: AYBFou33w+c0EkGVY9gnyr7g6Llr1+MtA5dap2f8MdTzOebEupgIWcv1QJ5ArYmpCnr
	gU9hsh/G5Wa2WvwSZR157MczlTYls7LzDKHXNgBnhsXhldERaTCay3t+XmdypfWa4bIt8xCl3mP
	V36S2pH6XAXgnjfg4kg4JU0lOhtzhd/a3AVyHTicWLnXw318KORbS2mmrPXbUFX6/PBpxYk9kZF
	zodeJuBWzurP9wJYeoBJLC2sE9Cth6ioVGUmFcRNodRUWdxeKw6jAAPeFi7zat+7ng0cVoNYAcH
	8T5gRZ0LyUsSou7wnXoQse+EnUHLuE43FdYlV6dyxlimx+WNVBI70X7HtcrWC3to92p0Q+ci3Ih
	oak4ttgrXYY1QgMxoN2/legeIGvAfjusfFNmU1mr1Mqmpay14i66yhhqQK5wC68UMR3JZBJqfSf
	CufHk8o+mjssPZ36MUPGxam79RJtr+EMea4LK/162PkGuDxDhGD1q3nhzQh9KRmYPBYa6e/3R31
	ry5ybHkdh6b3rV37a42
X-Received: by 2002:a17:907:944a:b0:c29:f5d8:9c6b with SMTP id a640c23a62f3a-c46bde4346cmr829233566b.26.1793036401209;
        Mon, 26 Oct 2026 10:40:01 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49954c8ff1sm101721166b.78.2026.10.26.10.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:40:00 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 26 Oct 2026 18:39:58 +0100
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-mm@kvack.org,
	Baoquan He <baoquan.he@linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] mm/vmalloc: Bail out if in softirq context
Message-ID: <at-QbgvltXF0pmcd@milan>
References: <20261026102503.30860-1-urezki@gmail.com>
 <20261026090421.e4bd83f3e20fb82852abec4e@linux-foundation.org>
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
In-Reply-To: <20261026090421.e4bd83f3e20fb82852abec4e@linux-foundation.org>

On Mon, Oct 26, 2026 at 09:04:21AM -0700, Andrew Morton wrote:
> On Mon, 26 Oct 2026 11:25:03 +0100 "Uladzislau Rezki (Sony)" <urezki@gmail.com> wrote:
> 
> > vmalloc() is not allowed to be invoked from the NMI,
> > hard-irq and softirq contexts because doing so may
> > deadlock on internal locks.
> > 
> > Commit 04aa71da5f35 ("mm/vmalloc: do not trigger BUG()
> > on BH disabled context") replaced the deprecated in_interrupt()
> > macro with explicit in_nmi() and in_hardirq() checks, but
> > unintentionally dropped the softirq context check.
> > 
> > Example:
> > 
> > <snip>
> > vzalloc() in a task
> >  spin_lock(&vn->busy.lock)
> >   <------ Hard irq
> >    irq_exit()
> >     process softirq on the same CPU
> >      vmalloc()
> >       spin_lock(&vn->busy.lock)
> >        spins forever
> > <snip>
> > 
> > Restore the check by checking the caller's context with
> > the in_serving_softirq() helper. Note that, it is still
> > allowed to invoke vmalloc() with disabled bottom halves.
> > 
> > Replace BUG_ON() with WARN_ON_ONCE() for in_nmi() and
> > in_hardirq() case.
> > 
> > Cc: David Hildenbrand (Arm) <david@kernel.org>
> > Fixes: 04aa71da5f35 ("mm/vmalloc: do not trigger BUG() on BH disabled context")
> 
> Sounds like a cc:stable is needed?
> 
Yes. Should i resend and put cc:stable?

> > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > ---
> >  mm/vmalloc.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 7521b9b3bfd2..36e6e3be6ba4 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3252,7 +3252,13 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
> >  	struct vm_struct *area;
> >  	unsigned long requested_size = size;
> >  
> > -	BUG_ON(in_nmi() || in_hardirq());
> > +	/* IRQ re-entrancy -> irq_exit() -> process softirq. */
> > +	if (in_serving_softirq())
> > +		return NULL;
> > +
> > +	if (WARN_ON_ONCE(in_nmi() || in_hardirq()))
> > +		return NULL;
> 
> WARN does a lot of stuff and I rather doubt that it's all nmi-safe.  I
> don't think this matters much - it'll probably work out and as long as
> *something* gets printed, it did its job.
> 
Yep. I checked before the kernel sources and saw that people use it
with WARN. I thought switching from BUG() to WARN() is better.

--
Uladzislau Rezki
