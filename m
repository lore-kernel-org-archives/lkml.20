Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA153DEAE3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397164; cv=none; b=mUEDmESaapgxC/eNWUWtL97vTwLH36xYUwT4xVS/Wpn6wQLxK9QPtev1PXH8JXQmU7fuFhK8KgzxwGLczsjofaXviKEAiXAd1rGgpiH8S0isz42qpT5sNb8kggBGjPLiXcic3DYUNvPuDiTrhz0TpWcs3J/HGBGwVhUZ2e+vJSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397164; c=relaxed/simple;
	bh=10VSFqHZKbVqeMTxWAn9JCH1fTHbqXXOw9U9JkQuUT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACpa2tvnVeYDvyOwT69XvZlFQL1d/S8Cr2Pon86rF28ZttIRtkAUTQAMCnsB/kZhDE5IBvrG6uKWCeBHe5xXkcr8don/7La7/KIRX8Bh6hUIvMY/tH4T4iOroWuisyuqODl2kUQNuc7GiTWSoyPoyPpbO3Al7VeEi2HZNIJdgY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WI0/0niG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WI0/0niG"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c20ce3c118aso331297166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792397161; x=1793001961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4OS48Qr0CZvLG5JGazX9ZFM2Vl3rE95sPji6iuRYp1w=;
        b=WI0/0niGa21B5+WZeEX5IBwiWTGgDJ3hTESN7tfk+RGhdcF950yU87Oq9wSxOGHRgj
         e8aV+Ly9b282k5Izn21xzrmo/3PLHS4YH5peSuuNVi+o2uQlYvdemm0de4bwpkM8Vyhu
         9aYj2NC+Fs8D7kgIFi8YD2EBpJn3rdbwejRWGD6TJA4BC3k05OOK8uJMhEsLilHLqO04
         NUkPqI/VmgaLNKSwNK0LUMaUklIne3NBjQVxCSqVUUIUQHWaKNvAWDYl2CIpYEozkZU/
         e49biOZd56OcB4i1T8UPsG3AkDbQ0EFF/S+odzp7pS1FRlmMr408sjgwguFd5AybPB2Z
         eLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397161; x=1793001961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OS48Qr0CZvLG5JGazX9ZFM2Vl3rE95sPji6iuRYp1w=;
        b=DOCT3QvpOdx3TqHqzD6ahPUlVh7ixYDi3L5S+xjHs26nK10sOaczMfjO+/XfFwajan
         OtV4EOaHm6fBbfLzN76YQbia/m9gd7nLL+hpyScQ8qQMEr4Z4Rs6GCQ3grg6/qzW0MSs
         V+cVNx/KwQQeWOyMKIbHTQqXdbKO93PeI5t5SrYhtWWAJ1JPGonS/sUH8lRc3fgYKL9I
         SK0CJLw8gIAv/UuNeMTiUTumFq/HuvOF1c8rKPm/YQOXAMJUzLs+m/gu7uFcqSAuq+G0
         eEnB7X3AchwqUjrzLvqybQAYkfaNFFScU3t3d0rlsNZBEBKBGG7ydnc8m1higErA/Kk3
         faiA==
X-Forwarded-Encrypted: i=1; AKwUvBzmPZdZ8PZI1FjpG2iohtKQdpeXa3mk0YvzpsFBZkCUbCOspFT3OyU+frzaUFUz1WGM67NKtCNQbIkvZhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5h4YB7yI94iNPGjP5/LxKbp+D4QDEWQg5pwjD9JmCvZOzwOQ6
	LtBge/LLKhXNYAgFXeF3LmdRxN4SIzOBtO2wowQIj/Ricoj9bZ+rMpRKb/WOBdXvUeA=
X-Gm-Gg: AYBFou3YFHHB79us62UBNKhCo9uLi/kdnG5NXKIBGCaqjTtehz/F+fzvHlFxrQ8iIAW
	RpWSJDY7JtN2wKkjBAUnkKjeMABCTTp9Z36qhHvzFzyXLAZBMVR9akubUzfNJRzBmpXJDfVLT/q
	KwRgArybmIdObPYkVBViL9ndBKwFQqCfT7OdN+X/34Xe7z2WX0IF97PpdyTXQw/wKF1GGzI2nuW
	1gQnB5MOwa9qK5l1u41eGW//rwvXPjgnIFCznCglNUBqswXxQAh7Lidjzr7QCbmip71MS0Ttqe0
	AOwHfHnwZTcQ9K6oiddNXrezG2qxXEmSyMm9tHRIgTKSMe+mix7WMiW4S6Azs58q8gfq76Ig1yG
	hYbBndx89KYDT2z+Iy+w1YbxMUrAiotvLBuQAD/6hgbCTKtoUOjgTIeN6uwkOurUCCJ9Xd9oMCF
	tUDNJT3Kp0Asc6XSyn7vEjLMh6u+t7OKEn1zcjdYiHXJwPD7uIft7Bj34lUF2c+4ilZ/0i0DlMa
	6yzyfyVhsfjhw==
X-Received: by 2002:a17:907:72cf:b0:c2e:22f7:59c5 with SMTP id a640c23a62f3a-c40206fb12emr782141466b.7.1792397160793;
        Mon, 19 Oct 2026 01:06:00 -0700 (PDT)
Received: from localhost (109-81-30-108.rct.o2.cz. [109.81.30.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm21427563f8f.45.2026.10.19.01.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:06:00 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:05:59 +0200
From: Michal Hocko <mhocko@suse.com>
To: Alexis Bouzigues <BouziguesAlexis@johndeere.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: nommu: set MMF_OOM_SKIP in exit_mmap()
Message-ID: <atXPZ4QB7qoCt3di@tiehlicka>
References: <20261013-fix-nommu-exit-mmap-oom-skip-v1-1-cb957cdbfcc3@JohnDeere.com>
 <as80Rpm-VHhP14aK@tiehlicka>
 <BY3PR05MB82607AF910C023253C48CD26A09D2@BY3PR05MB8260.namprd05.prod.outlook.com>
 <atB63fzpLyfWpzPn@tiehlicka>
 <BY3PR05MB826006B6F1E2D97E247104BFA09B2@BY3PR05MB8260.namprd05.prod.outlook.com>
 <atHKQFi0ckwxLa-P@tiehlicka>
 <BY3PR05MB8260C9F9055EB094183544A9A09A2@BY3PR05MB8260.namprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY3PR05MB8260C9F9055EB094183544A9A09A2@BY3PR05MB8260.namprd05.prod.outlook.com>

On Sat 17-10-26 04:32:37, Alexis Bouzigues wrote:
> On Fri, Oct 16, 2026 at 08:54:56AM +0200, Michal Hocko wrote:
> > Correct. The question is why killing the child, which has passed
> > exit_mmap stage sucessfully didn't help.
> 
> There needs to be ongoing memory pressure otherwise the
> parent's allocation succeeds and does not hit oom_kill.c or a livelock.
> 
> If there is memory pressure, then the allocation hits out_of_memory() and
> then blocked in the __alloc_pages_slowpath/oom_evaluate_task retry loop.
> 
> > a) a corner case of a valid nommu application or this is
> >    a theoretical problem
> 
> I think it is mainly a correctness fix (see below). I have only hit it
> with benchmarks, including the /init provided earlier from which I obtained
> the backtrace. I encountered this bug initially while running a
> benchmark to test memory reductions.

Make sure you describe this in the changelog. Along with an explanation
why this benchmakr matters or represent any real life scenario.
Especially in the context of how oom situation on nommu is inherently
fragile.

> > b) why this doesn't break otherwise very fragile nommu oom
> >    handling
> 
> It does not break nommu oom handling because it places the flag only in
> exit_mmap() right after the process has called the last delete_vma,
> guaranteeing it has freed all of its private memory.
> 
> This flag is used similarly on mmu (mmap.c) and in previous versions of
> nommu, until the Fixes tag 212925802454 ("mm: oom: let oom_reap_task
> and exit_mmap run concurrently"). It took it away from the shared
> __mmput() and only kept it in the mmu-only path (exit_mmap of
> mm/mmap.c).
> 
>   void exit_mmap(struct mm_struct *mm)
>   {
>           ...
>           unmap_vmas(&tlb, &unmap);
>           mmap_read_unlock(mm);
> 
>           /*
>            * Set MMF_OOM_SKIP to hide this task from the oom killer/reaper
>            * because the memory has been already freed.
>            */
>           mm_flags_set(MMF_OOM_SKIP, mm);
>           ...
> 
> This change places it in the same exit_mmap() of nommu.c.
> 
> The MMF_OOM_SKIP mm flag comes from your commit a while ago
> 862e3073b3ee ("mm, oom: get rid of signal_struct::oom_victims") and had
> the same rationale for nommu to mark the pid's mm to hide the process from
> oom killer:
> 
>     After "oom: keep mm of the killed task available" we can safely detect
>     an oom victim by checking task->signal->oom_mm so we do not need the
>     signal_struct counter anymore so let's get rid of it.
> 
>     This alone wouldn't be sufficient for nommu archs because
>     exit_oom_victim doesn't hide the process from the oom killer anymore.
>     We can, however, mark the mm with a MMF flag in __mmput.  We can reuse
>     MMF_OOM_REAPED and rename it to a more generic MMF_OOM_SKIP.
> 
> Let me know if this answers your questions!

Fair enough. And now I see where the Fixes tag came from. This was a
side effect of that change because oom victims are not hidden anymore.
Would be good to clarify that in the changelog.

Thanks
-- 
Michal Hocko
SUSE Labs
