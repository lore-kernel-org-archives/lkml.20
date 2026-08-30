Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44983ACEF7
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094093; cv=none; b=bsUg66IRzq3NtbwRYbKB34cDhPASGJScucAI4TtN4JKjqv/0yv810OmpjhD2bq5JFSPI4Nqdv16Mg93oXpTZni6WF9witGDwD2yTBtNYqGQ5DhzICNZLK4ifWGIvtT6rrLgWKoqG8L8ChM3FCJpx9Jf3Mag9sf2BQjzBu+i2FuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094093; c=relaxed/simple;
	bh=dJBrHRcH1cOF4PaWRs2z3SVGfAdZ8dI8gBjhGpDUNTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kg34UeqomScooU8f6C11euDi+aox5f1TOV+sL3c5fOFB8ycy2UyKOxCVtMVtCTm+qpBrREktYTXT4vDUYxXCYzrx1ASnOPz5JlJwYUnzlsfyvYIpF41Sf6N8h0L5J5Mu4iKMCRihiZ2nlIUfL9+9Q9tD0+Y8eJ5YBqn/7d5W3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S340j5MC; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S340j5MC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2017024a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788094091; x=1788698891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2dVvCYD9RAYS7/u5Gv2TMbo54nxfZe+ySEn1+VlbEk=;
        b=S340j5MCFbHLKLcHfM7/zWFY5hJZIPwwqFJHMrwazzg7s6s7Lx7Kn3n4kf1u+6Cs+T
         Y8povNo1bXOT5xNtel/ESHjbUtRZiK/6HSvrqp5FZEtesX2jFCI5CuJ2l75Z0DDkcVi2
         ktq3mI0iGd4mlWAVsBZ7S4gHJOCw4u1seqCEmB4mFV3Coc7p/PB4ip92mw7VwpGu1hJB
         7WyxvFrtrcUL+l9F/5WMeHjrSsO39qrdg9vjl9yZ0tWng3Q5EEXE4RIMZHwNoMRt8iqe
         eaevVYRseCreOqOlD2yQR3JKlczqnZhZFKfQbkhSsz6EwjjA6theUG/fPyCPt8+vLIIT
         FrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788094091; x=1788698891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2dVvCYD9RAYS7/u5Gv2TMbo54nxfZe+ySEn1+VlbEk=;
        b=CYlrFX0lo4mHY3YDW+SjaOycuUpm36vZM/XzDTN8Wa857cJuROSA4c0yIvDqApspa3
         w/Ben5KMv5Im8tw9vq1YKSzy8CLzwJlO/xzDYDkF23rvFJ4tjPMY4sH9QgNhh6uwOr5Z
         GOMJDCi0nSuzemoSQp1biPNYk/+wjnMx/Ng0Y4d5wrNGYrK+Ah42BZ/XrC7AYye/X/tq
         oBUQ7kd7BODpx7aR+buY27iKcJvdKk+8lcguaAKD4dnx8ym9H1BiXr2xrVoOsSz9FmsN
         jXt4NRRPKrVPOmAY0C9CkEyrqeajR6pDKc1dVwhubf+mhHk2eyBWTBlW7JTiO+S7nTDD
         5SYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqnhb9akQL8Hv3EIKf4HhRJ80rFPgpO5YK5JUJXNwTVe8ua51j5Ez3kIJOu/5e6WYHyaptkFpt3cwpt1A0=@vger.kernel.org
X-Gm-Message-State: AFuF++neSCjdaYTpBY/iVknPf14UNTYoDiUde0GhenTh89076asaNK+N
	sTtBpQTh/NLzaNIxSKxWIzn4NcWiWgSDNceDCh4yvovSdhpl2s0HoI7U
X-Gm-Gg: AR+sD13jBxvLQgRsfO2t6pTMcY3rKJEWzKeXhA9UGZsle2gc3LRuNhT1hL2uqh7ocL/
	J9S6pGHrC5hxlOhEWn8d8cVElkHpfv2fagB/JoSdSZsSCFHjY+ig3wBgwNVgvCJAdBgxuYvNZx3
	aN8tOinzE56fjI0yHbWUc3UIfU1lLESe+piPqKkLI6PCgHNOT+aOY/VX4eGS8ps+RFzVgQ4evnc
	IOsTfu5g0610RWBQIFiFFqkITsWfA1VKiZTCvkb1hN1L7XiaIUkZtBAwtX4qTcjYnR5Hi+t1PKk
	PAMVsL0vcKI3Tpix8Z3kup9791fdSF3klO6Fh5HAEsFHDBONoECb7jMYhgOmqhWuGMtEdfy7XD9
	nhSDXNw+e2WFgsLbSjpraN1zbPBV2JOBVF99ygO8+mTUZ2+eDQ9DZE7euas7AUcyc1LS2kxllD0
	/+KCS4jMz4LOcXq1IwK04UIgkETXxKol/N2yS3X+4ftdRuJEXxihowNtuCT1j0VMJ7UpTCRDGun
	dNelELVMFQ8AMbFo1NQzl8uqpCAgADzGrRIQjd5ZMg=
X-Received: by 2002:a05:6a20:d0a1:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3d26562ead0mr32088995637.4.1788094090908;
        Sun, 30 Aug 2026 05:48:10 -0700 (PDT)
Received: from fedora ([177.21.143.191])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm25325171eec.0.2026.08.30.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:48:10 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: willy@infradead.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	riel@surriel.com,
	rppt@kernel.org,
	surenb@google.com,
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Date: Sun, 30 Aug 2026 09:47:56 -0300
Message-ID: <20260830124756.457887-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <apOkscUtVMpFqFjM@casper.infradead.org>
References: <apOkscUtVMpFqFjM@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Matthew Wilcox <willy@infradead.org> wrotes:
> > >> Fixes: 164b06f238b9 ("mm: call wp_page_copy() under the VMA lock")
> > >
> > > what makes you think this is the right commit for fixes?
> > Maybe I would should analyzed this better. I only seed the commit that introduce
> > this function (and consequently this reader)
> 
> That was what I thought, but it's not enough to determine if that's the
> start of the problem.  Look, that commit does:
> 
> -       if (unlikely(anon_vma_prepare(vma)))
> -               goto oom;
> +       ret = vmf_anon_prepare(vmf);
> +       if (unlikely(ret))
> +               goto out;
> 
> ... and anon_vma_prepare() does:
> 
>         if (likely(vma->anon_vma))
>                 return 0;
> 
> so either this race was already present in 164b06f238b9 (and you need to
> go back further) or it was actually introduced later (maybe the write
> side was introduced later?)

This commit introduce the vmf_anon_prepare():
+static vm_fault_t vmf_anon_prepare(struct vm_fault *vmf)
+{
+       struct vm_area_struct *vma = vmf->vma;
+
+       if (likely(vma->anon_vma))
+               return 0;
+       if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+               vma_end_read(vma);
+               return VM_FAULT_RETRY;
+       }
+       if (__anon_vma_prepare(vma))
+               return VM_FAULT_OOM;
+       return 0;
+}

in commit 2a058ab3286d (mm: change vmf_anon_prepare() to __vmf_anon_prepare())
the vmf_anon_prepare became __vmf_anon_prepare.
Where the race problem occours `if (likely(vma->anon_vma))`...
This commit 164b06f238b9 is introduced in 2023.

The write side is introduce in commit d5a187daf585 (mm, rmap: handle
anon_vma_prepare() common case inline) in 2016.

> The important thing to know is that the mmap_lock is a read-write lock.
> That means that two readers can be present at the same time.  So this race
> can happen when both threads hold the mmap_lock.  I don't know whether
> they do in the syzbot reproducer; probably not, but it doesn't matter.
> 
> The other important thing is that _we don't care_ what the value of
> vma->anon_vma is.  We only care whether it's NULL or not (this is a
> sufficiently common case that I wonder whether KCSAN shouldn't special-case
> it and decline to monitor it ...)  VMAs are created with a NULL anon_vma,
> and then if needed, anon_vma is set.  Once set, it is never changed (uhh
> ... at least I don't think it is.  Lorenzo, could you check me on this?
> I think all the places where we set vma->anon_vma to NULL are in
> situations where the VMA is not yet exposed to the page fault handler,
> like in the child side of fork()).
But if I have a write in the same time, this can be a problem, even though if
you only want to know if vma->anon_vma is NULL or not.

> 
> So it's inappropriate to use READ_ONCE() / WRITE_ONCE() to "solve"
> this problem, because we don't need those semantics.  It's sufficient
> to wrap the read side in data_race() to indicate to KCSAN that we know
> what we're doing.
you sure? 

the __anon_vma_prepare(..) is write on vma->anon_vma and the
__vmf_anon_prepare(..) is reade from the same vma->anon_vma at the same time,
you sure that is not a problem? (I'm asking as a curious layperson.) 

> 
> Also, as Lance said, I don't see how this is related to huge_page_alloc
> failing.  All I see is two threads calling  __vmf_anon_prepare() at the
> same time, which I presume is an attempt to COW a hugetlb page.
> 
> I don't think it's enough to just add a data_race() to this one read of
> vma->anon_vma.  I think it's quite prevalent.  There's probably other
> syzbot reports that mention it.
Yeah, I mentioned this on commit message because how is said by KCSAN the
__anon_vma_prepare() and __vmf_anon_prepare() is called after huge fault... My
interpretation might be wrong and if so, i will fix the commit message without
problem. 

Thanks Matthew and Lance for reviewing my patch and sharing your thoughts,
