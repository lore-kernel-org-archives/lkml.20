Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237635;
	b=x4tBcnqEusjwghwqeY5jlEmZKosSb7LKi+Crsz+rB/motChQ1iRHc9IlmV1R+AjI5xcx
	 +k4Bh77Gof8qSugfyuotQGVgdc4y7ONe9fPDlKrZ4AJFmf97iKhmQXDbLDPiYb8rn37iy
	 vmbi1tQhsAZoEqZz7UrEBX0f8xFcJNIONQV4RzMtpC3K3Il/abAFat4zIl+WGp1CFrE0O
	 WjeOwewl21m5O9nM1gx1AAllCwrmakPfwBA/6opWlBZOiFHAjM0nP2XslgZemIqjEvsU0
	 NOJ9CfIJ+x9oHZe01OOP8H5UXSh9Y0nlGG618qjc89cpv1Qx5FQL2DCBZpybpba5A+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I07lJrgFsxm3E13lAXBgVpKwF3TGQ2q83seC4rcxvKY=;
	b=4r0Xe8IiRQzxhT/UIfJzvdRl95+/v1YJ12nFmxWDOm63ZTIPuiagB/Y7QyG9UJxKEOpQ
	 GyGAwYLAZRJm8c7Fd49H+qRYGj9U40yi8+X11FyX0+WC5POjBEU0F7Pv9MFUwVo8YG7DH
	 ekGvYGJ34QsrOhc4KyP6rEPKgbheQp5ibk0bQhTKMpDUtPPtA6sV/eH3jp2PlruToX7Ob
	 fzj+LSkhTgFwYMfZAMXz2LZYsHH4RsuiAUHNH5tmuuESreC9ktiTvW1+z9QiVVCHMLFWm
	 hql3EWfDxiF2SQZaxvpx9seLHjhOzpyHwUZ6NMXY+vRM9TH3+uwRx5Xay8V1JoNlgWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=F5iB63bn;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E7606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943E7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=F5iB63bn
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so624782f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794237633; x=1794842433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I07lJrgFsxm3E13lAXBgVpKwF3TGQ2q83seC4rcxvKY=;
        b=F5iB63bnhsmO90q8MxVwV83ZDUoaFJNnnq1HzxsD+rNZMFup9BWSjXxhdK7V0Yb6Mr
         ANXgfrq4vj4lGKTwfXcZMJ1/R907BYdVh/NFrNOV6Rw+cIdN1JHKQo8EB3xLl5lYuaSo
         o+Fp67gjxoFjegmQgWc3N30T3ocwZyTtyrXr731bsDgHlbLuHGZYSB6pJ/UgLqiTfQ8y
         oC64Z+10xV/h0DRLNtWw2EiL9zIrK+6ec1wixEwXTsr2AbJMV2zQHPHBwWyrio0D7s0d
         wCF9WB5zwjd39fil78E+XJgJnejmf5qsajZgFbHjadw7lNkuCVDjxOgUpGBYUvTzTKdQ
         BtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237633; x=1794842433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I07lJrgFsxm3E13lAXBgVpKwF3TGQ2q83seC4rcxvKY=;
        b=uPe9p4TYIROfaN2vs8kxnsYbyR9xkTM3vtJHA6fFkjr8NPCsuvuo7dm7Bon5UxInQi
         XC3f1uRBTE67rmMS1zBU13maMseyZPklmGrk6/EjYWeq1rMb534OyvQyhPH+0IKyVcW9
         nRTe6gEzAUmkP6yJ2pwTEXmuRMIcTKVWKiM4gLCfOsoesP83kNgpnOtmHszyV299adG0
         Jw6hRCVK7mOJzUHw0XA2omb52t3DH/9Tsz7GqZ6IPMtBuGtWt9SoL4u5G0fJpCY+DxJu
         mHx6xEBSe9YsXMCb8oiQbeCc3y4LEEVBye1gcPXHNd4o8s/yhVGehyVGo8gU3XSbPvmt
         JFuw==
X-Forwarded-Encrypted: i=1; AL+hErEaJPkbbCTNctFOBCZzGwOOT8b5EdmNnyLI7C+JkEHpDzx3JHfdbBGJdBhbfEchxPg37eHl/InKthY2wb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NUFxWX1xN9kAcCLaEfJhxu623Q5k37pYf+bbVe2hWevRYvs64
	pe64AIdE/JKASO0MsLXv8cTbW7qXSqP8F3Mtap9i4i5Ib6I7VNGP7axpfutge6au5ZQ=
X-Gm-Gg: AYBFou2ZWNwwfBLkAcI8d/2wDKDptIyNngZ1qeCS4AHfLJqNJzpxF7nOvxidSGrlOeB
	b+CtRxj+ujf4WzhepVWMQOP8N7HQGcnlKM8BIBIGrZ75pM2HKU07NMzwdzuWfxLpWQjfeXoIGLD
	2v5acpE10WLl9CZgpgx1skWDKr12C7Ft0lp4m1Ui9HnDz5xTa+CU/A4xcBcv10UfQQH004Z3n43
	qty5f0zS2h9sMB82R5jf0CNHH00OqUslDIugmk3eZ/V4YJ2J4KhvEk7XBnjEPxwmLhuA6f31uWt
	BGU9OtXDB3QB3A5q5Hy9621Y0IV8O8+J6auPFvRMZZatEyZ6BFurOUGpHXA705x1sJRki5Oo8Rt
	KN1MfZxQoig6UHCx4YIeIBvSmmqtfuWt9DokH1ICUevogBGlWQNh3RbPZ8PPMuoZThGmzUxx51o
	CnTG+5sPXlX6NRcQYo3ziOHB/7ngk8eFCqpGWMLW4gYEQqsSDbsqVat7CVgvNQ/R1c/eDkP9Gkx
	A7FY0QA3aIAFb2ULH47GV9UOJIqGHFu6SGyQTrZz7ICzS7qsScO/BlUT09l91Dxxn7ZztqydERA
	dsggyG08liPDEdE2XQ+Mw9i3RD4cFMEg6WfQOeuRGQ==
X-Received: by 2002:a05:6000:230d:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-4958a10a3bcmr8781666f8f.10.1794237632787;
        Mon, 09 Nov 2026 07:20:32 -0800 (PST)
Received: from localhost (109-81-94-245.rct.o2.cz. [109.81.94.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39899sm9626204f8f.3.2026.11.09.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:20:31 -0800 (PST)
Date: Mon, 9 Nov 2026 16:20:30 +0100
From: Michal Hocko <mhocko@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm: memcontrol: Don't lose track of exiting OOM
 victims
Message-ID: <avHkvtojxFyuH5mb@tiehlicka>
References: <avA1wXhTMs9eY2NF@chrisdown.name>
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
In-Reply-To: <avA1wXhTMs9eY2NF@chrisdown.name>

On Sun 08-11-26 00:41:37, Chris Down wrote:
> When oom_evaluate_task() comes across a victim we've already killed, it
> backs off until the victim's mm has MMF_OOM_SKIP. This gives the victim
> a chance to free some memory before we kill anything else. However,
> since commit a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup"),
> css_task_iter skips exiting tasks once signal->live reaches zero. That
> happens before exit_mm(), so a single-threaded victim can disappear
> from the memcg scan while it still has all its memory.
> 
> This can kill another process when the first kill would have been
> enough to recover, and we've seen it happen in production. If the
> second victim is in a cgroup with memory.oom.group enabled, the extra
> kill can take down the whole workload.
> 
> In tests I used a 64 MiB memcg with swap disabled. I started a process
> that faults in 44 MiB of anonymous memory, submits a 4 KiB direct AIO
> read to null_blk, and goes to sleep. I set null_blk to take 10 seconds
> to complete the read so the victim would have to wait for it in
> exit_aio(). Two seconds after starting the first process, I started a
> second one that tries to fault in 40 MiB.
> 
> The 40 MiB allocation hits memory.max partway through and triggers an
> OOM kill. The OOM killer picks the first process, which has more
> resident memory. With the read still pending, the victim blocks in
> exit_aio() before it can tear down its address space.
> 
> memory.events showed oom_kill 2 in three runs. In one of them the first
> process hadn't submitted the read yet when it was killed. The slow read
> just makes the window easier to hit.
> 
> The cgroup iterator hides these tasks so that cgroup.procs doesn't
> show processes that waitpid() may already have reaped. That's fine for
> cgroup.procs, but the OOM scan needs to see a victim even after its last
> thread has started exiting. We already have CSS_TASK_ITER_WITH_DEAD
> for sched_ext, so use it for mem_cgroup_scan_tasks() as well.
> 
> With this applied, OOM selection backs off while the first victim still
> has memory to free. The 40 MiB allocation completes and memory.events
> shows oom_kill 1 in three test runs.
> 
> Fixes: a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Down <chris@chrisdown.name>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
> v2: Give more concrete details in changelog (akpm)
> 
>  mm/memcontrol.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 84f4a8fd4d16..cb7cfae9ce5a 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1451,7 +1451,13 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
>  		struct css_task_iter it;
>  		struct task_struct *task;
>  
> -		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS, &it);
> +		/*
> +		 * An OOM victim can start exiting well before its mm is
> +		 * torn down. Keep it visible so oom_evaluate_task() can
> +		 * back off while there's still memory to free.
> +		 */
> +		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS |
> +				    CSS_TASK_ITER_WITH_DEAD, &it);
>  		while (!ret && (task = css_task_iter_next(&it))) {
>  			ret = fn(task, arg);
>  			/* Avoid potential softlockup warning */
> 
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd

-- 
Michal Hocko
SUSE Labs
