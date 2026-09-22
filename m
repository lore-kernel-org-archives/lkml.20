Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC72F260C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087513; cv=none; b=BIZKN+oc8T7Eqm2aIZu5PKjekRQo8RRasj/02ZLuVSSDoyViuJpVJ8JVU5UbxP+rvaOLWXMnnnvl3jQY4IkDs2vmVZeJh86rxV8FsuIQ9/qVuEeN8egoxoyAxltmA9bMhDTQww4IXbeesmQJrGnreccBaAcScLuILxR3TMM4pFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087513; c=relaxed/simple;
	bh=wS03yTVF69/nd7lzkl738VFvCsit27RdFqVd9hljpVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5+Ysv1xSwN5aNIF6naRvpO7rIy7dxKoLCWT7k71JRFwSzBuulzeplqXu5r9sA3ehGzlFvf1ZXO0vunzuzVeEclH6ofp2yhN4CHswgrXYejjuf3n84Ojh/tZPzgRFu0J9SECSROhxwSpALlhNRJD+FUK7DLgvPjK8pYh8EZzBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yejfzhc4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yejfzhc4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so1424438f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790087510; x=1790692310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuZAbrGsPMkmcTHI9EkOOW44uAoSTFmlIm0LVAH5Vqg=;
        b=Yejfzhc4NbKlDeT+ivrUk3dCBBeD5XMC3UiaaSC3L3BDPt/vBJ4GNdXsw1bH8XRkVU
         fIOKWyz46GNM03tSXevH973dnqPsrXTXQDkwkbISbXNden9JAqFJ9dIZ+ZUpfo9JzHvV
         lK/k0bAC6ZbCqfZOjXYgqTJ5RyrBmdNISpHkcWc2K+QGmeRUAABzcsVWuzbzXCUqWFVC
         y2DDYtavOxC93YqPvNHb4U0x/5Cr6Mj6jRS5818FQEzxwgLskYf2UzFYJISPgxgcXJxc
         B+/izTy1lBKW1KfBvGpT16x9j8PQq2AuFSw+CD1+boZbtYRTUv093TgRDtdfGjXVFXxe
         IN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087510; x=1790692310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuZAbrGsPMkmcTHI9EkOOW44uAoSTFmlIm0LVAH5Vqg=;
        b=Dd8Yt8zuCSsvObhU+DSrALJNkJh2w0eDD5xf7RPYJZxqr3FCiRqH6XKBVnY829P5i8
         FQiHN0vLc1c1N7u+nhkhHSumPv/yQCeh/SuAmgKvt0GFiC1kotD8/zKEn1CLxo9GGtWN
         KXXzL833AZ5KxJXztz4l3rm/vgZL1R0tKr/4mshLiyOrRA5w+9zLWJOfQgYebjvo5q9X
         V+Lk464vtfSTmEqd1zSh52TRYZFGY19bgSEnCigWDlK2lXBkp2VTvNIUs9RhEn0t3ldA
         EIwL64wH7Bz5hldocOXo7v0ClV7SuLh0NxJYdcWKmeStJ1h9YxLTbRat7aHcB5ihO25G
         F3OA==
X-Forwarded-Encrypted: i=1; AKwUvBwB8JSINNweZchS1XDaZNuLa/Xes3Gh0pbW40E7e2MWQb3W5QC5GYOv0fHUZLwE6gUDKOy/4HJClRyKDTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lRX+I6vMEhBrtpwwGf38E3mGWF4NxrVN/6y7rTILdZo3FMYyw0
	Mn0FJZFgcJCtYBChj3h60RdH7n1B8M1aKZcvMwRMWL3sv106iGuegdH2PJbeqlouMvY=
X-Gm-Gg: AYBFou1qIkXg1dckZmInHm/u0aY9cuaPChG7HcDkMo/PPXZcHpRj9qdROAG/2jkzVVW
	wVlUlhb8S5rtr76ftVuXlOfYFY88F+brqa8Dm6f30Wci98FWW2pgboA27YxYERo9UTFy8QK5PC0
	38fLp1gXOA9zaHj2kKXDX5m6nAxKjiQXmjIieAsR99+TZ5EtS44wh4MHohfonsNBnzOkYvzE8SG
	xY3+AHZCWOnfYtIDCA/Ey/ptndRtvEE0FF0aEffhOL6wmmpDrqAHWec2PUc6YyImicmCx3q4n9f
	824oblbq6cUCoZltxmYmr27Qehd0oRFo2BwDy430/gsVCgSLsYdpahJeZBxtT/n7AtDPG5G7p95
	4DEq+bNXc9qYV3FUe2JPe8BikxIgAMWFZL8Ku53zSEqnGTYZbl7orGn2RvzL26//wdxvtcc9z8B
	3yD4dJ7xivphrkURVDlQd2IJNDp50YmhmNSBWo3czT/McY/LAqQ6YaJhdISI/1X70ETXZq1sGV
X-Received: by 2002:a05:600d:14:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fd895f626mr37895295e9.8.1790087510029;
        Tue, 22 Sep 2026 07:31:50 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdabe8a2asm57552145e9.4.2026.09.22.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:31:49 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:31:42 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: akpm@linux-foundation.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, feng.tang@linux.alibaba.com,
	kprateek.nayak@amd.com, rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/debug, sys_info: Introduce
 SYS_INFO_CPU_RUNQUEUES
Message-ID: <arKRTnnubfxJSj3M@pathway.suse.cz>
References: <20260912013240.545742-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912013240.545742-1-atomlin@atomlin.com>

On Fri 2026-09-11 21:32:40, Aaron Tomlin wrote:
> When investigating kernel panics, inspectability of per-CPU runqueues
> and runnable task states is valuable for diagnosing CPU starvation
> priority inversion, etc.
> 
> While debugfs (/sys/kernel/debug/sched/debug) exposes runqueue metrics
> to userspace, these details are not captured during an automated kernel
> panic or crash dump. Capturing per-CPU runqueue state directly into
> log_buf fills this diagnostic gap for post-mortem crash analysis.
> 
> Introduce SYS_INFO_CPU_RUNQUEUES and its corresponding string token
> "cpu_runqueues" to panic_sys_info. Add sched_show_runqueues(), modelled
> on print_rq(), to emit per-CPU scheduler diagnostics to the kernel log.
> 
> Unlike /sys/kernel/debug/sched/debug which dumps all threads assigned to
> a CPU, sched_show_runqueues() only emits threads that are actively
> running or queued on the runqueue (via task_on_rq_queued() and
> task_current()). This keeps the panic log concise, reflects the true
> runqueue depth, and prevents overflowing the printk ring buffer on
> systems with high thread counts.
> 
> Additionally, to guarantee deadlock and memory safety in panic context:
>     - Acquire the runqueue lock using raw_spin_rq_trylock() with
>       READ_ONCE() and rcu_dereference() fallback, marking contended
>       queues with " (contended)"
> 
>     - Wrap the per-CPU inspection in rcu_read_lock() to protect the
>       sampled current task (comm and PID) against premature release
>       during pr_info() across other callers
> 
>     - Omit cgroup group-path printing in print_rq() to avoid acquiring
>       cgroup_mutex and traversing kernfs dentries
> 
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -939,6 +939,7 @@ locks           print locks info if CONFIG_LOCKDEP is on
>  ftrace          print ftrace buffer
>  all_bt          print all CPUs backtrace (if available in the arch)
>  blocked_tasks   print only tasks in uninterruptible (blocked) state
> +cpu_runqueues   print per-CPU runqueue depth and runnable tasks

I would keep is short and call it "rq".

>  =============   ===================================================
>  
> --- a/include/linux/sys_info.h
> +++ b/include/linux/sys_info.h
> @@ -16,6 +16,7 @@
>  #define SYS_INFO_PANIC_CONSOLE_REPLAY	0x00000020
>  #define SYS_INFO_ALL_BT			0x00000040
>  #define SYS_INFO_BLOCKED_TASKS		0x00000080
> +#define SYS_INFO_CPU_RUNQUEUES		0x00000100

Similar here: SYS_INFO_RQ

>  void sys_info(unsigned long si_mask);
>  unsigned long sys_info_parse_param(char *str);
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 72236db67983..79f6b00974bb 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1322,6 +1330,48 @@ void sysrq_sched_debug_show(void)
>  	}
>  }
>  
> +void sched_show_runqueues(void)
> +{
> +	int cpu;
> +
> +	pr_info("CPU Runqueues:\n");
> +	for_each_online_cpu(cpu) {
> +		struct rq *rq = cpu_rq(cpu);
> +		struct task_struct *curr;
> +		unsigned int nr_running;
> +		u64 nr_switches;
> +		unsigned long flags;
> +		bool locked;
> +
> +		touch_nmi_watchdog();
> +		touch_all_softlockup_watchdogs();
> +
> +		rcu_read_lock();
> +		local_irq_save(flags);
> +		locked = raw_spin_rq_trylock(rq);

Is the trylock needed for all sys_info() callers or just in panic()?
If it is just panic() then I would use it only when oops_in_progress
is set and use raw_spin_rq_lock() otherwise.

> +		if (locked) {
> +			nr_running = rq->nr_running;
> +			nr_switches = rq->nr_switches;
> +			curr = rcu_dereference(rq->curr);
> +			raw_spin_rq_unlock(rq);
> +		} else {
> +			nr_running = READ_ONCE(rq->nr_running);
> +			nr_switches = READ_ONCE(rq->nr_switches);
> +			curr = rcu_dereference(rq->curr);
> +		}
> +		local_irq_restore(flags);
> +
> +		pr_info("cpu#%d: nr_running:%u switches:%llu curr:%s[%d]%s\n",
> +			cpu, nr_running, nr_switches,
> +			curr ? curr->comm : "<none>",
> +			curr ? task_pid_nr(curr) : -1,
> +			locked ? "" : " (contended)");
> +
> +		print_rq(NULL, rq, cpu, false, true);
> +		rcu_read_unlock();
> +	}
> +}

IMHO, it might be a useful feature.

The main question is whether it is acceptable to scheduler
maintainers. It adds some churn. Also they would need to keep in mind
that it can be called in panic().

Best Regards,
Petr
