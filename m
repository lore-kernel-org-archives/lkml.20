Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14220388866
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242320; cv=none; b=r6gw25VTQY0+0aeGmbAwzJ7xvCwk+lwgmbpLICMzZy6+qRrjJvLoDSadUloEzmmD4sderm2eVPUJXxDISCXDAsRUlCmcZoD5ZmZ8SBGWFn/KZ0JHwjQ1OWBwa3XQxg9RFuJ1Ko3yq+YrcGUbAeD5m5FLyIFn0W+LmTg3n9nFdZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242320; c=relaxed/simple;
	bh=nzvl7mqCF4ztoD1AQhrEHtx+ggc5PpKtO7mNFBUOwCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQw6hKCfOp3hZ1PaN5Y0x2vCJYzJ2jvBDjiljhB0jXUFsq8pN7JGUXB2zk7PRhsXubCiwBk2Y7puz5DnU/7Rv0Wn8h3addN0U91bYdhvReHyHfJb6wRU0FEvKLyZy9/qAGrR9b1df+suwJZiLYDljAaMBPzEj60ukwD3wVfdeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f47e3Cim; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f47e3Cim"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso233613066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790242317; x=1790847117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVufKMPB9vejpNzxTLukLIifCoBhEi//kGkahD5KaUo=;
        b=f47e3Cimiq/4GG/lBAVvrd1xly4gsc9O4dK5YuRxulEjBDmz6olRWnVL0TveIpkiFi
         uvz9xeCMA/3K7vbu4v8AkF2hbW22qq03Z1KfDkRBCz3oirpIYrLJ5Eq9hlHH0/Xdd6Am
         3ZqWTqIJGfI8CznfuuD4iMZhodEHg1gqpWSdKBKURrElNF3CArEFI51tvz+2ULuz4R/L
         /Wl20E2CvTIOGWZZUEEJAjFbrW6q8rKCxTw2goPBhAEWE6qHH3oCYtOE+r4UGkxwHeDa
         yEx5wECT6uohnRGbonOnbM2ctn+iJeYV3ur8BsFYaYNDdchZfsDgLtqYGiXc/Wpw7ga0
         +NbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242317; x=1790847117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVufKMPB9vejpNzxTLukLIifCoBhEi//kGkahD5KaUo=;
        b=gTifKvex47aZa65KeaRKaZltLQlUNu3hdTvRbCLzqL+UNqgDeGJjSVTc0+XW9VlJJL
         vNMlYUXosAiFYhxL1ElI+OqTs/y+AuEQy9b2EIHC4lz/E+8OqaOh/TEzGTXT576dXEwS
         B3KHbj+ZH9UAdSnX9n0rKbRfH8j9vF9VJuayxaLyUrgGPPmRtv84j+ipWyM+2M/HokmJ
         FPvP0G4T4CdLQQVbPyz5edn9MZH3rfSW/JMJ2BUlg1Tms3EtwZv1fzxWy1dI1CzOUcLh
         /BAdngCOXq/VnTacz7uwJYqOd1c/ExeGXH57u23qQZqP0XJVzDtrDFydgiNKMhrf5eEZ
         2Cjw==
X-Forwarded-Encrypted: i=1; AKwUvBztzHm8OaTU8gP3JGLiciRsJv2/6DRDrwJX0pd+IGxanD42xJRbVx/5Lnq+LXNOWGZawxMXfdJnk9czYNA=@vger.kernel.org
X-Gm-Message-State: AFuF++ly7J42xsarqb2O33vEirKxfU6YBL4kJ3BzrFZbfQBdbOpr3w8Y
	jh1gNpXbRgENqxfRnLkL/9TcMRCHl0wTfNJuxEYgcJM5rPmo91eXRH9e
X-Gm-Gg: AYBFou1SnsBSM5rbLyNyOthniuJ01ZMFyjBT29BlmRg1+Lk5pHzYHhiX/q9XVr5O2XT
	l8YUx0I325xQWIBn3oeEzOK4YxjxS2Tnxjzc8Iz2P9RfpHYslKnVy/Qu3YZRDHF4OWQflny6jI4
	80b8DiWJ2KsuytB5ew/dIOu4b7fV6ptkXo6Lgr2gV9RImZYtUyrXtkajJxUa4C2AyyErfZmrOhH
	sN+62WRBIg3/VyD9hjknHuffcrAFCPuMN+TWmYx5qovkXGNHsEl8HvrysP4LrKqQ9Eb1tBpqYc1
	hsYDZRXsB9ZZJ1ZTxdXFVrrUF7FUFLuxOZmY1AlDGfUGCXh7KaLIoS5V6NY5NwsTmL0ydMSXA3U
	lyGHAOIHn8yTpFlhXApLEhWJXGVEpyb0HE6X495I/xCG19R0xIkEKQpikI25wbPloivU/j9vdSs
	m3RN3Y2CE5C5w48oS4ynQCT2Dh+6DSjuCL5b095oV1aXukC8ondJTfFz75y76NKkl88A+081CfQ
	2ZcNcMPOqFCzOzf/XctHtEJI65ycs0cx9ednNhH4KpPG0/XmTpz3C6x8g/7K6dx0NLqoLzmYl6Q
	3xs8
X-Received: by 2002:a17:907:9812:b0:c26:1648:a06e with SMTP id a640c23a62f3a-c2ac253f94cmr137512666b.41.1790242317135;
        Thu, 24 Sep 2026 02:31:57 -0700 (PDT)
Received: from andreayoga.localdomain (93-42-14-189.ip84.fastwebnet.it. [93.42.14.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae675d59sm270080366b.42.2026.09.24.02.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:31:55 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:31:50 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>, rcu@vger.kernel.org,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kprobes: Make optprobe optimizer multi-generational and
 asynchronous
Message-ID: <arTuBodyGqQ0mErI@andreayoga.localdomain>
References: <20260923164510.f3bbddefea4423f8f1bfecb8@kernel.org>
 <179017148080.466588.9116221556625712980.stgit@devnote2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179017148080.466588.9116221556625712980.stgit@devnote2>

Hi Masami,

> -	/* Step 5: Kick optimizer again if needed. But if there is a flush requested, */
> -	if (completion_done(&optimizer_completion))
> -		complete(&optimizer_completion);
> +	/* Step 2: Dispatch waiting room generation if allowed */
> +	optprobe_dispatch_generation();
>  
> -	if (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list))
> -		kick_kprobe_optimizer();	/*normal kick*/
> +	/* Step 3: Check completion if flush was requested */
> +	if (!optprobe_optimizer_busy()) {
> +		if (optprobe_flush_requested) {
> +			optprobe_flush_requested = false;
> +			complete_all(&optimizer_completion);
> +		}

Removing the completion_done() check also fixes a hang in the current
code: completion_done() is only true once the completion has been
completed, so complete() is never called while a flusher waits.  For
example, "echo 0 > /proc/sys/debug/kprobes-optimization" with an
optimized kprobe never returns.  I posted a fix for that separately [1].

[...]


> -	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
> +	while (optprobe_optimizer_busy()) {
>  		init_completion(&optimizer_completion);

This part is still racy, though.  The flusher drops kprobe_mutex while
it sleeps, and the sysctl handler and the debugfs "enabled" file do not
otherwise serialize against each other.  A second flusher can then run
init_completion() on the wait queue the first one is sleeping on: the
first waiter is dropped from the queue, and complete_all() wakes only
the second one.

With this patch the window is wider, since kprobe_mutex is released
while the Tasks RCU grace period runs and optprobe_optimizer_busy()
stays true until the generation is finalized.

The fix in [1] replaces the completion with a counter of optimizer
passes, bumped at the end of each pass and signalled with
wake_up_var_locked(), both under kprobe_mutex; the flusher samples the
count and waits with wait_var_event_mutex() until it changes.
Something similar should fit here, with the counter bumped at the end
of each kprobe_optimizer() call and the flusher re-checking
optprobe_optimizer_busy() under kprobe_mutex as it does now.

[1] https://lore.kernel.org/all/20260924092142.199198-1-parri.andrea@gmail.com/

Thanks,
  Andrea
