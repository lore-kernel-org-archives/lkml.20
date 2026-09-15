Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED13A9D9C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463271; cv=none; b=ePweJBT5YfPBnS9bNKqX2xDPmuBo50ppX1HqPdxaTTnxX8nleC2PgFWyALoNRa8CjQkE6IH6jCRXDjqRqisb4mLoiReGKsxGb6DOZjso3czqtgz9NpHjKq/8yOmuQozXXY6aKSQ2CW6XvEtdHrxWJV0p5uSjm3cdm3A3aW+UDLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463271; c=relaxed/simple;
	bh=U/6rJz5e8jrWaT67x/ehLFMOwYNrOQr1A9hZYmSNVEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0FZSFbe+3jQ3Cm8CMCSQnT7MC4QV74/KTlKOQ9fVPE4bLHQtz7yiWEDs0WDnhho9nwh7T440WMv60ALAvdoOZc4tvI8pyVyA7EkLaIRttbcj74H3uiKlYtNA5RUlYiqpS4QQs9v/lG5bbyah8Jk6jvatHKj+NpO2/jYoeimRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UIst+dei; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UIst+dei"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1187454a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789463267; x=1790068067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwWP/MlWLXdLm6RBuOTRTjXHdybTzxOxvT40BpicUW4=;
        b=UIst+deiFh+E8nZBfKs8vZK2yPFrxY/rTydOVpXPgUv73LcjP3ZUTHNp+hQLpZmNr3
         Y1h6Hsde5Rfxh2/VLMBYiJuMxJFwRcMXG3tBK90u+4DXUh3cU4fEcFKPKu1b6pKp6Db/
         eEKhDo8R/i6508BMzS4ydzlMwSAt4GwSRQBdSnDpuzvZ9rVzGEJQtwSalr1ZU1cpAT1w
         jwUACGQBAAaEd0NSfv4wbravoQ4UUfSIwaXgrozzmir1BFDAby8e7GVFpd4Sm1EqoXk3
         iRKi56ZYf/ItuyGLJcSLj0bs1JDGlE5ED3xO2vkOKhiRtNIMnVU38iXXjsEw95Gy6Lwi
         JR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463267; x=1790068067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TwWP/MlWLXdLm6RBuOTRTjXHdybTzxOxvT40BpicUW4=;
        b=Mc6E3RKgRDb8qR85smaOuIghQsjxJgh+1tEB0EpwFMhMQK16NKZe2REUgovbeY2viQ
         kkSJVcLkp58/truQj/r38x0hPz+pCNFNfQNhjntbiju6i47KTFEFjyvaPz3JjAWBY+0j
         6JE8TrUmh9zBQYIrylHOVnJBfMMHwDFviHdIup/hZZPsQPzsgqx+LXou4ug8xCKFsp1T
         ir/j96Q4QYVBCeedNo+IocvCwNCAYw4SpAdMzwymTDnS0+/KIcN12j/F5iYvXoeuCmmm
         +hGIs2VCUXT/mYc8/5pdB0Lq0uNW3RtrPn+ruVWjakLn5sA+zmHw//bQUykKFHm8q21m
         FpYA==
X-Forwarded-Encrypted: i=1; AKwUvBzq2PmBy0jG/8S8gA8vjDdg6oGEolAMtlTDlSEp6QPs41uR9C9SGcVr2AEwF5FDEYFxjzx3QBcbt2gcJ3A=@vger.kernel.org
X-Gm-Message-State: AFuF++nldiOQL28grfHhobwUY7RWoEOlDOuX5DpjhMGWsShE9n4us56U
	MBJilEi29XgEELwE94xrqoKW7oeQlEQutv36Y2AVd50qaD1sl3PQTEtIgpRAAkulKos=
X-Gm-Gg: AYBFou3jHZO+WWxYyL0ZFeZ7q7Fqkf2SoF8xJw2vndzFxPnCu+t30Gv1h2mtFS5NaBX
	FL1/rnv3SWeqt8eo5lzifhGQnI/p7CGZYpq/AxPYhAGC0IY9mN9noJ34dTqDKU6aNpVNzY+H/sE
	8whZhBFNNEzbWpBl3mjX14atYxRXdgQmLbomDi9dnps/DFlD+qN8/k+ZGkviU9dZtlVnnp7gn2g
	yvMvXnCnZy97FSs9eiZx4e61zGbq0zTiTb3YltUKkHeBekclLcXIAg6Jlv5uALX0ZHEa/ipnnrd
	U/9l/9zBeCXYoZ3UOhbjr5NnAd+f6g1tgRQgDlbGrPKhXStodv1MQVKWbIIm4RuqONkU1h6LRh/
	dYhtXwhfEQLMVCMREBBweIkC2sWgdNMPn/arJhUwUevqRegXEPWBsBLjOSSgsiy6tYJjDUJdFwO
	xX4BYLW1FTQ0opv2lJLLym/Y+f75Jxjpp2sePuDiovDK2vj/odxqQL0sFvijCR
X-Received: by 2002:a05:6402:914:b0:6a9:bf3e:595b with SMTP id 4fb4d7f45d1cf-6a9f624e89dmr4274759a12.17.1789463267551;
        Tue, 15 Sep 2026 02:07:47 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8528sm5417319a12.5.2026.09.15.02.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:07:47 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:07:46 +0200
From: Michal Hocko <mhocko@suse.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Zhou Yingfu <yingfu.zhou@shopee.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/oom_kill: fix hung tasks queued on mmap_lock behind a
 long reap
Message-ID: <aqkK4kR2_tYxTnty@tiehlicka>
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
 <aqg-oG2HDIUeK5Us@tiehlicka>
 <20260914203533.3544ae8dd0903c7603b385c6@linux-foundation.org>
 <aqjsPW92SgcHONKO@tiehlicka>
 <3c8d1d8e-0e67-4d1a-b73d-4eadd6266aa6@linux.dev>
 <aqkAbBpYheX2DEHg@tiehlicka>
 <e018e3a0-349a-4f36-90e0-8fafb001da43@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e018e3a0-349a-4f36-90e0-8fafb001da43@linux.dev>

On Tue 15-09-26 16:44:40, Jiayuan Chen wrote:
> 
> On 9/15/26 4:23 PM, Michal Hocko wrote:
> > On Tue 15-09-26 16:13:11, Jiayuan Chen wrote:
> > > On 9/15/26 2:57 PM, Michal Hocko wrote:
> > > > On Mon 14-09-26 20:35:33, Andrew Morton wrote:
> > > > > On Mon, 14 Sep 2026 20:36:16 +0200 Michal Hocko <mhocko@suse.com> wrote:
> > > > > 
> > > > > > > Call Trace:
> > > > > > >    <TASK>
> > > > > > >    __schedule+0x487/0x1870
> > > > > > >    schedule+0x28/0xb0
> > > > > > >    schedule_preempt_disabled+0x16/0x30
> > > > > > >    rwsem_down_write_slowpath+0x1d4/0x750
> > > > > > >    down_write+0x60/0x70
> > > > > > >    __ksm_exit+0xb4/0x230
> > > > > > >    __mmput+0x12c/0x150
> > > > > > >    mmput+0x1e/0x30
> > > > > > >    do_exit+0x283/0xa30
> > > > > > >    do_group_exit+0x34/0x90
> > > > > > >    get_signal+0x952/0x960
> > > > > > >    arch_do_signal_or_restart+0x41/0x250
> > > > > > >    exit_to_user_mode_loop+0xd3/0x560
> > > > > > >    do_syscall_64+0x385/0x470
> > > > > > >    </TASK>
> > > > > > > 
> > > > > > > KSM is just the one LTP happened to hit: __khugepaged_exit() has the
> > > > > > > same write lock cycle ahead of exit_mmap().
> > > > > > Why is this a practical problem we need to care about? It is kind of
> > > > > > natural that the oom victim exit path might race with the oom reaper. They
> > > > > > share the same lock that is mutualy exclusive. The whole point of the
> > > > > > reaper is to ensure there is a forward progress achieved. So before we
> > > > > > start modifying this let's talk about any practical/real life problems.
> > > Hi Michal, Andrew
> > > 
> > > Agreed, the hung task warning itself is harmless, especially for a dying
> > > task. The real problems are what sits behind it.
> > > 
> > > With a 500G swapped-out victim the reap takes ~600s, and for all of it:
> > > 
> > > 1. The victim cannot exit. __ksm_exit() needs mmap_lock for write and
> > >   queues behind the reaper, so the process stays alive in D state for
> > >   10 minutes and whoever waits for it (parent, container runtime)
> > >   waits too.
> > > 
> > > 2. ksmd and khugepaged stall. Once that writer is queued, their
> > >   mmap_read_lock() on this mm queues as well, so both daemons stop
> > >   for the whole system for the same ~600s.
> > Right. But why is that a problem we need to fix? OOM reaper is taking a
> > prortion of the exit time by doing the leg work of tearing down the
> > address space. Exiting task would need to do the same so it is unlikely
> > to terminate much faster.
> 
> Hi Michal
> 
> Sorry, the subject is misleading.
> 
> The total work is the same. But with the patch the reaper and exit_mmap()
> free the memory at the same time, so it takes about half as long: 264s
> instead of ~600s here.

OK, I see your point, now. But rather than making the reapeing more tricky
and less predictable with I would rather try to find a way to remove
those bararriers.

> The hung task warning is not the point either. If that were all, masking
> it as Andrew suggested would be enough.
> 
> The warning showed that ksmd and khugepaged stop for the whole reap, and
> that only happens with the reaper. A plain exit takes the write lock in
> __ksm_exit() / __khugepaged_exit() first, which also removes the mm from
> their lists, and only then holds the read lock in unmap_vmas(), so nobody
> waits on it. With the reaper holding the read lock, the exit's write lock
> waits behind it, and every mmap_read_lock() on this mm waits too, ksmd's
> included.
> 
> So the patch is really about the reaper not holding mmap_lock for the whole
> reap.

The reason why the reaper was implemented this way is that it allows an
easier and better predictable behavior. You get your lock and nothing
stops you to finish. 

Write lock holders should be really rare for a dying task (unless it is
stuck somewhere in the kernel call path) and as already said
ksm/khugpaged is known barrier that might be held back without any known
downside so far. Tearing could be faster when running parallel but keep
in mind that the purpose of the reaper is not to make exit path faster
but instead it guarantees to finish unmapping.

So please make sure you exaplain why blocking ksm/khugepaged barriers is
problematic from the correctness POV and also whether it is feasible to
drop those (that would be great IMHO). Also, and this will be important,
how do you guarantee that the reaper will keep its current guarantees
when the lock is dropped along the way.

-- 
Michal Hocko
SUSE Labs
