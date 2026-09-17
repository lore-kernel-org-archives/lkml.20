Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32214DEC2F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661679; cv=none; b=eo/raTs07mKwW2mggu5+pySSZQFYfpXRcIF37FdeYt/CfULn+/yP29+LuuROA45AxowlsOAFRvAwfsnvJuI3zeOUGG3+utQe83cQX+2ezqtA5DC2dEFr7H5OP+mtCzzIBXjURMwmEXNLZwe7/6t9Ujdp5KDeieJcGIJV3fPhcbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661679; c=relaxed/simple;
	bh=pOhqefWnGzuYlbjyx7H3ZVYADwMZhHbKtiJKYlJ4mlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byeTOW43aut+//4/5InfGQDvtbiNq6QdTToUNCKpPD1O5yPA05JFPUjt5hia4mzVtImVma9l4PTS3LpIX/OcO0qjyB35AhWxmyeihFhWT8R8noCRJ2l8h58vqCZABgwDuDrOOKjRUudvvlQpOmLgeRhk0LAbcT/7vxVKJuzIGgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WefqSriu; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WefqSriu"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-5309a20a55bso7718701cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789661675; x=1790266475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LsJba/wwthkDPTXMKxwEUJe6vAc8xqzF49EUX8rDHcw=;
        b=WefqSriukiG4B9oYvpThXHNUj4QrByA6ymBkWoI89OSUkRLDslwjDxw+rDOZlV0TG/
         8VNSgeq4gNkkHGu8qsv7jnQWG3IY1/LteN8pLLzm5+fE7X3r9BZ4dGBx8h0JbTJbjUFq
         XLvK4NZaoDgaIQ1z9NFYd50+el3/os2cPOGTsfyCb989/wMk/+gDWv7nF20Bb2MGGEFG
         OaGP+wu6ltS+8BgHFMuLbtvnahl/1r8bSc4+eejidiLX8ngLKjuVRFlDDxEePheyb56H
         zBsjffG1yH2jbNrNXJ/8pDtVh1b5w21kd3KkvxdJ57JSddsSGBE2koUvun+ALSbsAznl
         SI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661675; x=1790266475;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsJba/wwthkDPTXMKxwEUJe6vAc8xqzF49EUX8rDHcw=;
        b=l8Sp7M+AJEXs9XQ8lnE0Lr2Ar2pLr4vb9hRHUbhPxXVNPmQ8ICLsVkfVjVGgQiBQLx
         LZRTZmJCBVPuwFZeeB/OhMFLMEEObyziT9JB+yCLu5YIpx7uNAMLHnBF2eBuK73eMgZN
         kMA1Zm8jTGxSOfIn3rRe/Q4ONJpJLyzPbzgS+px7Qa9I87X8vHuUaTUXs43DEKEtxCyr
         oMOVNJcl2l7igpnszARxmlySGiWIkVUKgtVB8dxN7LnCccygFYNeTtKAb2nig1FjD/Kh
         DCeOxO+U/oklVabWReisjDkMEb7epOjk6XRtrfaVA12Fjm+AgJNioAOH1+j8COtYJWd8
         UxjQ==
X-Forwarded-Encrypted: i=1; AKwUvByZqCxUDjeKhSY/POL8iC90YpbkhYigmwh8xPq1wVxJvIWtslw7qngNIAUAEDxQ8pBzw+LiT+KAsLWiSHc=@vger.kernel.org
X-Gm-Message-State: AFuF++ljHKTbW87qeoD3NQ1QVrqFClvDh/XvEFAo38Ynp1YlZxUpNm14
	sFipF7jcLVrOtVwVhSMUOfgP0lSPbL8ysRi5kCUoqDc47RNRPZpF8zfG/rS89Ohqdrc=
X-Gm-Gg: AYBFou2xJQSZJmpdIoN8Jgj+AEaOAFc+rlU6fRhz3xCWF8bp5cIzCtlm0iC8Ihz4cXY
	BOleTjBPImMjHIpiyAPWfP8spt+aBIccG0AincNsTEYYyZuuyrgGj/NA1lpNRIwglVvX3JDdKQu
	5Gy5y7PhS93u9RTFIQxZ1xJsC+PGfLRmgIpaSVvuE+g4slJKsaugyakn/KeFQ/p52nbTohP3MpQ
	JlyCBKQJbeIfkSeM1mL1weqjr+6eOHqTDvAanzH5Si3DjJKPBMH8AaNgrni3LtegtP2ObR8PfY5
	rK/YINd+llpqprxseVKLdOW2Ic1j/52/nzLwMaePnYJZJAq9Fr83IoV8T8gA4jG+YVUVRngQw4H
	v5L+ue9baK1VAkTZenXlWf/t8aFuyksT5jvCWPZzHVMfCYJQ2j3VV+O9jLZGg684iqEMtbx4tnF
	ZrgHC/uKXcieVoMG5hbD5e3y/kxQvD3VKJ4VNixP7eXNcOiOOqInJHrgzpKPU83ggJ/pfdr2FAl
	CBkJGN6IujbZvzKYGuR/HnuRKDD7KzsBxwFGm29EAUhFBmsRiX+GQY=
X-Received: by 2002:a05:6214:e87:b0:912:517b:90a with SMTP id 6a1803df08f44-912517b0c9emr19817166d6.41.1789661675506;
        Thu, 17 Sep 2026 09:14:35 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c7cb8bsm1199036d6.20.2026.09.17.09.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:14:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 12:14:31 -0400
From: Gregory Price <gourry@gourry.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
	osalvador@suse.de, hannes@cmpxchg.org, raghavendra.kt@amd.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: support promotion-only NUMA hinting scans
Message-ID: <aqwRX7Ula6ImRw3c@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <20260911001826.2109390-2-gourry@gourry.net>
 <20260917160328.GM4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917160328.GM4121339@noisy.programming.kicks-ass.net>

On Thu, Sep 17, 2026 at 06:03:28PM +0200, Peter Zijlstra wrote:
> On Thu, Sep 10, 2026 at 08:18:23PM -0400, Gregory Price wrote:
> 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8dff37059faf..81359b414947 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4129,8 +4129,10 @@ static void task_numa_work(struct callback_head *work)
> >  	unsigned long nr_pte_updates = 0;
> >  	long pages, virtpages;
> >  	struct vma_iterator vmi;
> > +	unsigned int numab_mode = READ_ONCE(sysctl_numa_balancing_mode);
> 
> This thing sticks out like a sort thumb, does that want to be on top?
> Typically reverse xmas is preferred and all that.
> 

oi yeah sorry, should have given this a closer style look.

will fix it up.

> >  	bool vma_pids_skipped;
> >  	bool vma_pids_forced = false;
> > +	bool promo_only;
> >  
> >  	WARN_ON_ONCE(p != container_of(work, struct task_struct, numa_work));
> >  
> 
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -1237,11 +1237,12 @@ static inline bool vma_is_single_threaded_private(struct vm_area_struct *vma)
> >  
> >  #ifdef CONFIG_NUMA_BALANCING
> >  bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
> > -		bool is_private_single_threaded);
> > +		bool is_private_single_threaded, bool promo_only);
> 
> Two bools rather than updating the existing bool to a flags?

every time i've added a flag field someone screeches at me, so I tend
to avoid it now - but i can do that's the preference here.

Otherwise, i tend to follow rule of 3 for generalizing.

~Gregory
