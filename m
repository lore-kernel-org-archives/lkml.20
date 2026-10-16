Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817E03A718D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133701; cv=none; b=V/r5/UEkqyVP2h0rQ30+Yb/Uyx0PsHkJsvDvvZB5FN8Xwb4mEf5bVu3+HqhJcWIikRjvakEnCETlNG31Dw4rIRH6cle0nKbnuJITSMCog0Ct5OBFefC4qj3QX8gedB6YyPFy7XAcqCciN6QV9aU1uzdGEf/FxFazrZov+m9cgkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133701; c=relaxed/simple;
	bh=351ElCUMniIjiuY5v6ejBqhzssHserQBP/iVWSvo8Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snNFsMLasjmTwfS1lGEMkdIh0mul9F/UzfV3XSK11y6Q56eB7+1qTteEHNHjkL/05iWcN7cAqXYphYkkroFjL0hZIFrnwCTXORA2kEbM6yfvB7r66bOgZxkBP28cCHAmenCC0dWdReSIIHY6zeskK9a+N2kAiokANe1oZ/tGwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fXHsTmv3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fXHsTmv3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df54150dfso886140f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792133698; x=1792738498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F4FUcPRLKbuW4HkGF1Z/uZ9MIZyrAfZgEtA7+269nGA=;
        b=fXHsTmv3mn5/XUwqFLuLfMUoDyPhs/awRoKnFZ14tUv4vbtvAxceM+lVkHyygE+dCu
         x5TjnQPgspSvl+163qFh4ICcxRBhfaXeWvZJ+LiJydHfeh9k9712AcUXYr7/DvCB8rad
         yrv+GN5OlbWx0fjYWyGGXOt2ARMbNkUb9ujcwizB40Lsa6Yr9jyZeKp8nTOBQD2lGlEP
         ezSwKjeE2kYDKWV2nErf1GjPby4wEyj+nZQ5yhW6qssaVjyqP0ff5xjOIUz4wYROBduR
         J5maHM/vEPDykeLEeXeyvW9/WiKV9NWe9kHSWSwaqkyNdOR6R61nJfaECWkZidoAyQBR
         NJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792133698; x=1792738498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4FUcPRLKbuW4HkGF1Z/uZ9MIZyrAfZgEtA7+269nGA=;
        b=x82l0S8hEtiRxKXdB0KrCLhadyr8km8P1g0wVO9wHMBAqQ4wfIml8tIr1iD3ssYC2I
         0eB7ALmz4amZn1132BYPGDfGFwaJMRoMoKMEVy7zxpy/Fi2115WfcfPj6h46jj/h6hPt
         bArGAG4wWKpcTZWDS2JNDNSJPl3JMmZuuGqfynthH0226IZyUpuOvnmiyoGsw5AKtCxp
         oEia67nPl3sb8M7bMQxBDmMyzNPAI30ENyAmnoan5PPAuyplEg/ckiPs/Mo5Js6H9wcb
         nCAq5iNUPL6Zo1fj31eD9DRJrQabhwbdJPFC98S1/O6WhJvFQiIJQydiCuadxpL3mqV/
         FE/g==
X-Forwarded-Encrypted: i=1; AKwUvBwZJWZePz7alNGBvbiHuegzdZWZMieiyDJ45HpEjJLWs1qCiHgHMOeA39OMCG0zVTKHmpYds6ulGQlXtT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgCE8WW7yRhlSm0f2CIqEzpbjliHu2iPVMUwrgYokgzPUxo7nP
	W9O8J3y2CgpPDyiD306qd7lFXuZGynRfHbIpHLTITyVa1Yvl5CQPgkL4cZbSvZZKh9M=
X-Gm-Gg: AYBFou1LKeaQo/8xiBAsNPtFYV6R6/N3JDQiJhL194Dmbo+qf1FFd/Z2LpG775LiqM2
	9PjBZsP2A8CN0JLbRH0hFxbnzPag3h4w+8EjFEbnNJdQi6upBY4kcekG+J2+dPvv/NQt8YtUN34
	PAUcWrTeoI6+q0y18HBOsQ43Aji75vfdhx9hNnF267nnqtphnrS8ySBkx3SlQG9Fr0EzAI9gAN4
	PqfSEi+lWOkBO/DitkYKBs7ITvEbM/U0ieZg0nYwZj3GDw0hTECMkqWEXlhhIDVVyuuHgoko3WZ
	ADmhdXQ72JwdR23tCgE2OGhPnYy8v5HFuk2SlQN/fLMxkjSoTA9iWpiY+Norote1Ygojn/FuOZ0
	bEvMhC+LdIvan8B8QbvGdkCG2zsp1VtO+pYLWezWFwPDl04UF79fe8b0+MZFZSa6HP2B9o7k3iA
	pNTMTWVIy8nEm+kytFgMan/ZaYBmtTZE1MMjE3X3wKJOvY3KryNx0kCZjW8dqHJ8jus/ZmaN8qX
	2IyLROdFBBa
X-Received: by 2002:a05:6000:3106:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48dca34316amr34701413f8f.39.1792133697666;
        Thu, 15 Oct 2026 23:54:57 -0700 (PDT)
Received: from localhost (109-81-30-108.rct.o2.cz. [109.81.30.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d080sm3121319f8f.53.2026.10.15.23.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:54:57 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:54:56 +0200
From: Michal Hocko <mhocko@suse.com>
To: Alexis Bouzigues <BouziguesAlexis@johndeere.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"liam@infradead.org" <liam@infradead.org>,
	"ljs@kernel.org" <ljs@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: nommu: set MMF_OOM_SKIP in exit_mmap()
Message-ID: <atHKQFi0ckwxLa-P@tiehlicka>
References: <20261013-fix-nommu-exit-mmap-oom-skip-v1-1-cb957cdbfcc3@JohnDeere.com>
 <as80Rpm-VHhP14aK@tiehlicka>
 <BY3PR05MB82607AF910C023253C48CD26A09D2@BY3PR05MB8260.namprd05.prod.outlook.com>
 <atB63fzpLyfWpzPn@tiehlicka>
 <BY3PR05MB826006B6F1E2D97E247104BFA09B2@BY3PR05MB8260.namprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY3PR05MB826006B6F1E2D97E247104BFA09B2@BY3PR05MB8260.namprd05.prod.outlook.com>

On Fri 16-10-26 00:42:39, Alexis Bouzigues wrote:
> On Thu, Oct 15, 2026 at 09:03:57AM +0200, Michal Hocko wrote:
> > Are you really looking into the code or just relying on an LLM?
> > Go and check to learn that the oom reaper is only compiled in with
> > CONFIG_MMU=y
> 
> Hello,
> 
> Sorry about that, my earlier message used "reap" in the sense of
> cleaning up the exited child in zombie state (waitpid), not in the sense
> of oom-reaper.

OK, this is what confused me indeed. Especially along with the changelog
explicitly mentioning coordination with the oom reaper
: Fixes: 212925802454 ("mm: oom: let oom_reap_task and exit_mmap run concurrently")

The whole oom reaper chnages should have no impact on the nommu OOM
workflow.

> I also went through the code in detail today manually using a 
> backtrace from the reproducer. I set a breakpoint at oom_evaluate_task 
> (containing the MMF_OOM_SKIP check) ran the reproducer on v7.3-rc7
> through qemu-system-arm with gdb. I iterated to confirm the
> breakpoint keeps getting hit.
> 
> Here is a backtrace of the reproducer when the parent PID is livelocked:
> 
>     oom_evaluate_task                  mm/oom_kill.c:354
>     select_bad_process                 mm/oom_kill.c:373
>     out_of_memory                      mm/oom_kill.c:1155
>     __alloc_pages_may_oom              mm/page_alloc.c:4113
>     __alloc_pages_slowpath             mm/page_alloc.c:5030
>     __alloc_frozen_pages_noprof        mm/page_alloc.c:5449
>     __alloc_pages_noprof               mm/page_alloc.c:5471
>     alloc_pages_node_noprof            mm/page_alloc.c:5485
>     alloc_pages_noprof                 include/linux/gfp.h:284
>     get_free_pages_noprof              mm/page_alloc.c:5507
>     alloc_pages_exact_noprof           mm/page_alloc.c:5641
>     do_mmap_private                    mm/nommu.c:959
>     do_mmap                            mm/nommu.c:1182
>     vm_mmap_pgoff                      mm/util.c:581
>     ksys_mmap_pgoff                    mm/nommu.c:1287
> 
> 
> Inside oom_evaluate_task(), when the task is the zombie child pid
> victim, without MMF_OOM_SKIP it aborts the loop from select_bad_process()
> and sets oc->chosen to -1, preventing the oom killer from calling
> oom_kill_process on oc->chosen

Correc.

> Since oc->chosen is not NULL, it does not hit the deadlock branch in
> out_of_memory instead it returns !!oc->chosen (1).
> 
> Returning to __alloc_pages_may_oom(), out_of_memory(&oc) evaluates
> non-zero, so did_some_progress from __alloc_pages_slowpath gets set
> to 1.
> 
> Then in __alloc_pages_slowpath(), since did_some_progress was set
> to 1, it jumps to the retry label
> 
> As long as the system is out of memory, __alloc_pages_may_oom and 
> out_of_memory will get called, meaning that oom killer does not make
> progress and that the parent PID busy spins in the allocation.

Correct. The question is why killing the child, which has passed
exit_mmap stage sucessfully didn't help.

> If the MMF_OOM_SKIP bit were to be set for the child zombie process, then
> oom_evaluate_task would not abort and would select the parent, meaning the
> oom killer can now call oom_kill_process on oc->chosen and progress.
> 
> So setting MMF_OOM_SKIP as soon as its memory gets freed (in exit_mmap)
> would guard against the parent's mmap stalling oom killer, since
> oom_evaluate_task would rule the child out and proceed.

right MMF_OOM_SKIP will help to hide the killed child process. The
question is whether this is just working around a propblem or it is a
correct solution/workaround. There is absolutely no guarantee of a
forward progress for nommu (due to missing oom_reaper) and overall
nommu OOM handling is rather fragile and there is an implicit assumption
that memory usage in this platform is very carefully scrutinized to make
sure this doesn't really happen.

So the main question you should focus on to explain is whether your
specific example is  
	a) a corner case of a valid nommu application or  this is 
	   a theoretical problem
	b) why this doesn't break otherwise very fragile nommu oom
	   handling
Thanks!
-- 
Michal Hocko
SUSE Labs
