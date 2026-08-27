Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E556480359
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850907; cv=none; b=PbE9FVW6WdmDsU/2VD1eV2PBdC8LnqC+PCeHGA4J9zYgt/LuoglQQz928iPYUWxzdM0RCeGgRiix63Q5SenhODWPqYmgFbtlUZS2Dc5jGlRCghTwogqqTS8bWn+jtFU/nO4bj8UklRc0byX6UqSGq8tkyMy+Ap2t4DhgYtK9Bco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850907; c=relaxed/simple;
	bh=b+DbO/XBRVMRrkEPpL+a8uMHxOKqXYztv7EREra78xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4oPR0Jyf/+PqpXMKYGElhcmzeNRoxJsPEfq0A9jdTQ0ytW7WG1wY/VPSv99+NevxLIYfzqFA9YZ+yaRP2+kqw3F4Ba/KidRdtynvzdut1zNI7u8w6yn6vd4wmUxXQRkgRSGZpwoD3iFWLSTlttaDceaJQFLehHHOj2b6AWpGcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=hGEE+8bz; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="hGEE+8bz"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ea0b7d137so561777b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1787850904; x=1788455704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQnMu3iWvpGPN+g3IV0k0ZH3wDq8ERD9nTW8XM39tKI=;
        b=hGEE+8bzf/Y+yzK9IPDD9jQPIyk0rtF3ze2FRvddTqNFXwrO1szjujUG7oul9sbmJj
         MPkPCS7ksHtop/Exs8DmSM6cYabeH3IJrCwd1dXHSvTUXpI/JL5Ijo8aRobeFJvn432U
         WedPz+ScNjjc4OYjdBzQJ7Lf5Ej3LvPEfTYqI1iOyPIZfi+SJThW45/S9EPsjTSaBU58
         /cGedcx2u8tP544KzHN0EK72Kt5ABAzQPuGDDhGsId+lnzHU0EK+StseoE8k0aialhK2
         j1+eBP3bHhn9jRByIx2Z2pmCHPtXKqD7227QzgHLd1hm4mE0zHzDZ5DNFDmHkBa3m3lT
         /XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850904; x=1788455704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQnMu3iWvpGPN+g3IV0k0ZH3wDq8ERD9nTW8XM39tKI=;
        b=Vv0jPI4B0yfxajZGJ3f0yTTTh5dQGU0ENAlbhDXG1JL+QR461TSstklaaJYhLCTz7X
         h8KQn2A3jfQwDXI4Gdi2QNhrapQ+4uUSwLtakROOAes/AxFuUsrqnEWVXTlZt3uEiKeA
         k+dKDIWM9Lbj7XQZPWRUGD4QAd9Dab42zWQkhLh8xhY6trze9FaXCdRm2jQbxP0YDzqR
         9NAtTcmxeIWstVeTVubomdpm5v315K5jsr/wfu+u1/bDoJOfSutrUzZud0iuwJ2sLkNr
         drP2HShknoTFUNn82Wo2UMdExci2iPl9V0wIvz6H//DtZwHtzoYcbdLPAPQlulQCOksF
         b02g==
X-Forwarded-Encrypted: i=1; AHgh+Rq3q5XTM86Wv+jjToBN/fZwm4DeLVSVAHT2sRH8BMaa1I2hM8nK0PnGh6XJKw3EHyLSzvdt41gEilQc8gU=@vger.kernel.org
X-Gm-Message-State: AFuF++lCfiUTVztxKeIO3uquOqFgUZP1WoxIr4aUSGbGWPpjS0jq298p
	ql1ljpsqSpfdam1ooc9mz8JA2W2Zfhm1qPw8ItSXqiC+HBnkYInp2LdmKqCMchzvGKQ=
X-Gm-Gg: AR+sD10wnRwCnmybwqeUtw/JYaIyhG2u3Ct8nGWow8vVzSUbj3irg4zTfti1B85PLMD
	drgI1JXxPszQJHHksGcY48Kvo38w/I4mWwnXG9c4kQYRc+/hPp2HSl/oDWxqV5s2dp44rGMncgq
	rOo3QkZy5HUmEi0oEJQCFRfhFwyCglfLg1Pj59Ix/pXpfVAYJk4Itlvor9Yungl5rC/2mjgfEV1
	MyTNjA49NMers1EeEeO9Iii9kPr8lUxOX6LkiUK9BDr3nvpGzJZSfMP3LUhy5lHH1fGj0P49903
	tXpVz0Iz5EHmooaouX7vlPs5Q8lZn8BwLPGJITqBmoDWVh1+Jyu+GywViy7n2EPMW5Ch9cSSp8n
	9zB1Mx9Zi2U1vLgTbt2801s6QZ3IgGMuqrPh7Oz5baowHXy51yZwtHith5Z99SYBumaTxCW1baY
	9IAPuJV9gkbuUXka3asW8c1imHaAI/+8+IokoqBOTvmQwr3a6Iy8194nGQkLOdfg==
X-Received: by 2002:a05:690c:c017:b0:845:a433:c337 with SMTP id 00721157ae682-85d632603a2mr3858517b3.0.1787850903708;
        Thu, 27 Aug 2026 10:15:03 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85b5c7f08d6sm13933737b3.11.2026.08.27.10.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:15:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 13:14:59 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Rik van Riel <riel@surriel.com>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm/memcg: fix UAF in drain_all_stock() async work during
 offline
Message-ID: <20260827171459.GE3004@cmpxchg.org>
References: <20260827124211.3b94b103@fangorn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827124211.3b94b103@fangorn>

On Thu, Aug 27, 2026 at 12:42:11PM -0400, Rik van Riel wrote:
> drain_all_stock() queues drain work on remote CPUs via
> schedule_drain_work() -> queue_work_on(memcg_wq) and returns
> immediately without waiting. The worker, drain_local_memcg_stock()
> / drain_local_obj_stock(), dereferences per-CPU stock caches with
> READ_ONCE(stock->cached[i]) and does css_put() / obj_cgroup_put().
> 
> mem_cgroup_css_offline() calls drain_all_stock(memcg) to
> optimize reclamation latency, but never flushes memcg_wq. If
> that races with cgroup removal, free can happen while workers
> are still pending, causing UAF. The drain work could also have
> been queued by somebody else before offline started (e.g. high
> throttling), not just by the offline path itself.
> 
> Timeline illustrating the race:
> 
>   CPU0 (rmdir + offline)                CPU1 (charge cache holder)
>   -------------------------             ----------------------------
>   cgroup_rmdir()
>     cgroup_destroy_locked()
>       kill_css_sync()
>       ...
> 
>                                       refill_stock(victim)
>                                         css_get(victim)
>                                         WRITE_ONCE(cached[i]=victim)

I'm really confused. CPU1 acquires a ref for the cached[i] pointer ^

>   percpu_ref kill confirmed, css_killed_ref_fn() called
> 
>   css_killed_work_fn() [offline_wq]
>     mem_cgroup_css_offline(victim)
>       drain_all_stock(victim)
>         is_memcg_drain_needed()
>           READ_ONCE(cached) -> victim
>         queue_work_on(CPU1, memcg_wq, work)
>         // no flush!
>       mem_cgroup_private_id_put()
>     css_put() -> refcnt may hit 0

So how can it hit 0 here?

>   [RCU GP]
>   css_free_rwork_fn()
>     mem_cgroup_free(victim)
>     // victim struct freed

This won't run until we hit zero...

> 
>                                         // worker delayed by scheduler/
>                                         // WQ concurrency
>                                         drain_local_memcg_stock()
>                                           old = READ_ONCE(cached[i])
>                                           // UAF: old == freed victim
>                                           memcg_uncharge(old)
>                                           css_put(&old->css)

...which is here.
