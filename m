Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533075;
	b=vthosqwEAqM3D7frSLy5PL4SoG8WtRkxRecM7lcAIxbTMwJzDJoBCEax3+2qQQRhqXjj
	 cVk0C3wbZBaHgtx8ShRBigkcLlT+J3GnfxGwmmyunoOt3EDWn5F4PsNN5eaAAZ6vSmbiM
	 3QDh1+onA4NUZpQYJkzIlSsTQppgrqFN8IA94A32j534zibjy3SMhUYP70yxiyap7HtDy
	 YQf0OqaQ8y3STX7tV35Xn/8dW6oA8PWkOigZm32PMvNCJFoaZ/NfsvBh2CVYVxgbYcdrG
	 Ivo/irf+XKU6ylvzhJzh2lb3/q6C1Z8ZNrmrlhvcH+qrfd0GsaoSrP6z5BgEcZLGT2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533075;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=Dgmpj/jLj8XS79u4VwMA0OWW4dt1yLlXf8Z9kmCGhps=;
	b=KvO6ZuaXZDF06OXxFjKPymPOeABp4c3w6JQ2o1bRVzgBv9fQ6tI7CMj2BhFfDfgDl7Cb
	 CXTataS7LUWq9VAI5cMLsN/Oky5cuZydH1PDfHn0VY7rVXjcSjN87B8RPX/ZBOSZakKRv
	 WD8jqI3OXbzbngU3c/bY6VERaRehUw3xwjR2gQh9KkoqKFXyCTrqlqvFjQqa7i8nJEPqR
	 0RS/lq9YfTY4GlBjdh2zZvR46RtnwoRWnxFtryjwQgHmPa1IYo40ivYBrfSqH5NYiba2u
	 DkcSyhsCSeAgBiHUY3+UklWLuLJqVIrTroGgCjI+bvesMAsTHZz8XyoUq4hOdFbTG/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auogUJUJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687F606A31A;
	Tue, 20 Oct 2026 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auogUJUJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7941F000C9;
	Tue, 20 Oct 2026 21:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792533074;
	bh=Dgmpj/jLj8XS79u4VwMA0OWW4dt1yLlXf8Z9kmCGhps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=auogUJUJ9o0R5aiFbjZ/10UAil6GoXkkEoT3MV2UdddpmxoN8nmqeOdF2wd2xaMdb
	 vL5/ZF6ZUAbhfz9kcGpa8ijnxNFx4MrRZgpW+NA2aryJYM87LUa8Iib4Clyqa3mXDp
	 FMHujrAsvaDyKCizK77/svDdwX8bbu5c4oPlCZnL0cyXMajL4VenKy8Q4Hc/ShzouX
	 LjgaWLA2jSeNpsAmAT+40aHa5rzQt9t8UTdCaxQYOPQGTY6dxrxQBuHCVi7v60xzTc
	 mOE6NGm5/QXseAqrJyTwWGFtJ2RiNeKSFXRzP608+9m5hfmdQrFyLojKfm4pYxqaVv
	 BDnxlhAH4Ruug==
From: Thomas Gleixner <tglx@kernel.org>
To: tip-bot2 for Wang Shuaiwei <tip-bot2@linutronix.de>,
 linux-tip-commits@vger.kernel.org
Cc: Wang Shuaiwei <wangshuaiwei1@xiaomi.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, Waiman Long
 <llong@redhat.com>
Subject: Re: [tip: timers/nohz] tick/nohz: Add BLOCK_SOFTIRQ to the hotplug
 safe mask
In-Reply-To: <178985193276.2819794.55124822433246938.tip-bot2@tip-bot2>
References: <20260904064506.671203-1-wangshuaiwei1@xiaomi.com>
 <178985193276.2819794.55124822433246938.tip-bot2@tip-bot2>
Date: Tue, 20 Oct 2026 23:51:11 +0200
Message-ID: <87ik2w11o0.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Sep 19 2026 at 21:05, tip-bot wrote:
> tick/nohz: Add BLOCK_SOFTIRQ to the hotplug safe mask
>
> During CPU-hotplug stress testing combined with an I/O workload, the
> following message is observed:
>
>   "NOHZ tick-stop error: local softirq work is pending, handler #10!!!"
>
> On CPU offline, ksoftirqd is parked at CPUHP_AP_SMPBOOT_THREADS while the
> CPU still takes interrupts. A block completion raised after that point
> stays pending, and if the dying CPU goes idle before teardown,
> report_idle_softirq() sees it, keeps the tick alive and prints the error
> above.
>
> Such pending block completions on the outgoing CPU are drained later by
> blk_softirq_cpu_dead() (CPUHP_BLOCK_SOFTIRQ_DEAD), so a pending
> BLOCK_SOFTIRQ is harmless here. Add it to SOFTIRQ_HOTPLUG_SAFE_MASK like
> the other teardown-covered vectors.

In principle this is correct, but with partial hotplug it is not. It
might work by chance, but not by design.

Just use the sysfs interface to bring down the CPU to
CPUHP_AP_SCHED_WAIT_EMPTY. If a soft interrupt is raised in that state
which requires ksoftirqd then that might be delayed to the point where
an interrupt arrives and eventually handles it (or not).

That means all of this "safe" mask magic needs some thoughts.

Thanks,

        tglx


