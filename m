Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA82E3F164C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460593; cv=none; b=eweHOEi2pjGUI2xzNt5s1ONzq8ROVcXjnJ8CQNAvXxibqaYN9M/2UOrXcTc1vnmJXEDEsJI+yk+SIMSD7mwP/kMofbX3SEF+0WlJEWyPKI33ZS8NktoWk+ctQiLDpaG4jdgODcob7bj1yOkoetL+fHRMMhhJeUGse8zYWAb1qBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460593; c=relaxed/simple;
	bh=OHmeWTg5UnkwtJXkIWcjYJ5eFEhks4gEc2HTrQKWZJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCubX6NFjc889oJ7cdt47X7ia+iUl8IsBhA9kPy2uPg4eL5fiLLLQzI61LF+lYHyxEJwyVfNCWHBqH35rOWdOxtU7UZpp/1S1UHMan4m2aFMfnzb6Y6GWaONkjdf+dYJ5oFAAVh4JevJGPcpYcJlRmTIaLG7zQjQOmJfxAhv3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=crfWPVTR; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="crfWPVTR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso519985766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789460590; x=1790065390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6qc6m4ClgS/DLLK2dhqaClRHVdlT2q0YP0qs+LnEzs=;
        b=crfWPVTRlcpohQ2hDY33c8DsSS2nY4DDoGf3aE7cEkGK2yrfkcDo2qfdZmysFMB1zG
         3cdFoQf5YH6T+FWGLG5NgGTtMVeAcMvA31JFyMIxRWP5Nyv2umtNsRba/NTamfZ/09Wa
         bh51z7J46D/v+B77fhyDcdFIBbu3X2jp8Sw+6GOZm8/T86Mk8aa98GBAINiFpMjD0Kmi
         RCBSJ8oa16TyeBy9DSLuBj5QSqUY+xFaZuvokk2IwQgE0tMBZ42VRJaTQI5jzHB0TC3R
         vADURe/jxSaPs7XaAZxY9/kp3pxkkvXBSoZYfP7YW+GjpaG74Rig2xnVWnK4JjOMepfe
         tYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460590; x=1790065390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w6qc6m4ClgS/DLLK2dhqaClRHVdlT2q0YP0qs+LnEzs=;
        b=mVEMcOlI70juL0ovM2EmrCqe/vT8yU7GxAls1zi5RSSesoG0oCfHD5beWI5ay7SglA
         muQWhs8X49gN9wm3gZq1uy5O25k0flXxn9qFpm3anmUEKPW6EIpomNZACle/wZWnkOcp
         gYpBztkiS1vb0MCvPVoh3RL8iaryXlmCwePIBBKqgSHezTXscedhf4TrYKLOpvKiynCU
         S8DkVbadinysPwCJLMqjQBAc9/YSf7IHACE6L2dW2JPd4lqSsmA0P5ddMA71RX1XN4Ba
         aiDTESgFNW7PHzD4B0bRRhZiCgdoypz5opPBGF/4euLqutc1D6Ar3gAlgTXEAKinmqsC
         cipQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPbw327dv7ep0EhuV6DiBnIBP46jY3D6FLskO9ZpK7uXVg4X5AKysz/tTxSSuEG6t1QQ/gJHNFExGxihc=@vger.kernel.org
X-Gm-Message-State: AFuF++meYsgut4b+rQCT2jimfXTyHNBGduZfLc9QWatMUI9zGIYw0ICw
	KcrahWIo0HmN2wt+Yrbt5OiBs+eQpZK7P3Vkzzr98m+EAuweJOQxtWEbz+0DfKjKboY=
X-Gm-Gg: AYBFou3rqpRbwLTP2q6R+Y8byNhkBaA/+mfKg3FUgS2pDRhPy7C1k8uwAEAZ9C+nz6j
	FZwPha7/g8qbOXqC0/Rr7sua3Zpq/VrPvR4CtDraQxyyB8XkLA5hI/avveMC+ocToliYQUaP5sj
	ID8XDqdrQ6QuiG1tSFVoMwhNDLfTr91vvTiJgy7j30juq3kZKyPaPsgSpN0p3+XZQ+7BbgPgE8e
	E3rDpCZnOVBqi77JrHOKtvuuU/Zj40mmW/CwLDFp9yYhs/7rWJqqYDJjFgQLUD6oySOQcD9ZtRm
	VPPp9nQwPD9w9FMzeMMixhdjIBhTEOfGq7tcVYSZ1SR2CkuiUVujIdLnglJnxGKnZdx5fpLauLh
	1OSqVaBWxNHTd4UEx29iqFzWr95SYRgpDdG/1hRXNd7xw+C5TIKRtPOVNIcr5OhkuxKbAPDeY4n
	FTAb0WCHmpV+dE+sYKzs206V6aKKquTjio6Sa9YQtTp/zIIpNPL6qFbdlGseHt
X-Received: by 2002:a17:907:c18:b0:c25:32b0:e56c with SMTP id a640c23a62f3a-c29b85fff39mr363642766b.4.1789460589999;
        Tue, 15 Sep 2026 01:23:09 -0700 (PDT)
Received: from localhost ([2a02:aa7:4656:2314:c23c:9eda:81d:3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966148d25sm536702166b.61.2026.09.15.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:23:09 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:23:08 +0200
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
Message-ID: <aqkAbBpYheX2DEHg@tiehlicka>
References: <20260914113239.367200-1-jiayuan.chen@linux.dev>
 <aqg-oG2HDIUeK5Us@tiehlicka>
 <20260914203533.3544ae8dd0903c7603b385c6@linux-foundation.org>
 <aqjsPW92SgcHONKO@tiehlicka>
 <3c8d1d8e-0e67-4d1a-b73d-4eadd6266aa6@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c8d1d8e-0e67-4d1a-b73d-4eadd6266aa6@linux.dev>

On Tue 15-09-26 16:13:11, Jiayuan Chen wrote:
> 
> On 9/15/26 2:57 PM, Michal Hocko wrote:
> > On Mon 14-09-26 20:35:33, Andrew Morton wrote:
> > > On Mon, 14 Sep 2026 20:36:16 +0200 Michal Hocko <mhocko@suse.com> wrote:
> > > 
> > > > > Call Trace:
> > > > >   <TASK>
> > > > >   __schedule+0x487/0x1870
> > > > >   schedule+0x28/0xb0
> > > > >   schedule_preempt_disabled+0x16/0x30
> > > > >   rwsem_down_write_slowpath+0x1d4/0x750
> > > > >   down_write+0x60/0x70
> > > > >   __ksm_exit+0xb4/0x230
> > > > >   __mmput+0x12c/0x150
> > > > >   mmput+0x1e/0x30
> > > > >   do_exit+0x283/0xa30
> > > > >   do_group_exit+0x34/0x90
> > > > >   get_signal+0x952/0x960
> > > > >   arch_do_signal_or_restart+0x41/0x250
> > > > >   exit_to_user_mode_loop+0xd3/0x560
> > > > >   do_syscall_64+0x385/0x470
> > > > >   </TASK>
> > > > > 
> > > > > KSM is just the one LTP happened to hit: __khugepaged_exit() has the
> > > > > same write lock cycle ahead of exit_mmap().
> > > > Why is this a practical problem we need to care about? It is kind of
> > > > natural that the oom victim exit path might race with the oom reaper. They
> > > > share the same lock that is mutualy exclusive. The whole point of the
> > > > reaper is to ensure there is a forward progress achieved. So before we
> > > > start modifying this let's talk about any practical/real life problems.
> 
> Hi Michal, Andrew
> 
> Agreed, the hung task warning itself is harmless, especially for a dying
> task. The real problems are what sits behind it.
> 
> With a 500G swapped-out victim the reap takes ~600s, and for all of it:
> 
> 1. The victim cannot exit. __ksm_exit() needs mmap_lock for write and
>  queues behind the reaper, so the process stays alive in D state for
>  10 minutes and whoever waits for it (parent, container runtime)
>  waits too.
> 
> 2. ksmd and khugepaged stall. Once that writer is queued, their
>  mmap_read_lock() on this mm queues as well, so both daemons stop
>  for the whole system for the same ~600s.

Right. But why is that a problem we need to fix? OOM reaper is taking a
prortion of the exit time by doing the leg work of tearing down the
address space. Exiting task would need to do the same so it is unlikely
to terminate much faster.
-- 
Michal Hocko
SUSE Labs
