Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492155;
	b=qZlf7LIbmfeSmN8YDVTVVA+uh9ybv/PTH620xpu3IAthcwp0YvqK8r97inM7n8yjMD+M
	 Dea0S5kUUBDD76NmGkF6yB4I2N6+cb5/dT9nC6dQGHY4u1BiHzo4c0DJHQODIlKDLw3xN
	 gM6G5RiVF0RBroVnFxsPqWL2DJHWAYPO/yDro2Gy8SAXnDvc1J6YdFfXa6NIlduprEeh0
	 NpSMDQ1/bKeRNbDeJjmgeafsaHtGpT+v0P34m4/XQR8/2+ABpv9gff8BQA/OrbTAElRpT
	 /8aH1YpMkptmxX2HgC7YKFu45ugWKwSarftjjrh1dGgahmM6Zf0GFprwNMN0TZ+hMZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=P8HAkiuzwKeRXUgbQ8d9xhnf33IFx4jSd7V3UxCb280=;
	b=40z/Jz+ZirDWPteGCtOe8IcYPsjjd/lrIg6W+S2fEwJisZsIs0n+GgI2R3S2mNprpsF2
	 F7BFOX4Fo/vj2wkCYf0y1aZ8suQ/zbiBmgIparO1VBy37ZS8UMP2lQzpM5PlrWBm+JeBG
	 xpNkFGBRFCLbQuS2OsswNtDi9ldrjlxpzh7JwzK3u6O1KS0AWiVFufuZNO31piuT9QNXV
	 evpUxkCPYcmj/6JPo0OKsvPV10IvI5h05sk6WqeCdnbcRJq4o3YnP9LRWqHbPohn4NFgf
	 kYJKoxsV9CgfF5o/+XuyWobwb1nejI2EtrqwxjFEeYfBL2ul5AUWtFFmnseOmwtyGpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhbJzI7w;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA4606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BA4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OhbJzI7w
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab30d04674so2523111fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492153; x=1795096953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8HAkiuzwKeRXUgbQ8d9xhnf33IFx4jSd7V3UxCb280=;
        b=OhbJzI7wYTc4AGpSHyvzwoc38CXiGpUsoLRO8fh1eE2hWn2+mbqLrIOuURDyeoaB6V
         WngnermPQiGKcIxLOwK5trTksplQRddBKMgYFLGNCPKnzjXj3AmiqHgrU/v4yY2hd+TA
         xzcMLJqxM65jcDLsDQuJxV7PRCGc2568d8qP7wP42bqlKYfYXcwKbbKbOXPfUyc6zrtA
         +U0cwOTUv3k27xjsn/k800HeMaJV+RXDHzO73Ho++rtQg586LVLUGUuFClECilmnGCB1
         e5SBuwxg/tX4sdWo2p/IQ9M3OjEfW/SX5BZ3gX644QAMOYc62u8RYWz5iUqwnaa6r3n2
         snyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492153; x=1795096953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8HAkiuzwKeRXUgbQ8d9xhnf33IFx4jSd7V3UxCb280=;
        b=KvgpR62+yUiMWBAkuHaZ7XV7bS0893IH2wb2M/vRpunb8jqzPsUb5rmqDy0BQFcnEQ
         bOyGPKu1tXVsRBizWIW4kiqrmpZb5BIiA0KOQPZ2o640eUUakcHoAq73pcWsRCh/+Frq
         y/m3UnU1R/64syLbVj8NKv4+tfcJZ9jc5VY1TRaTR/tzKwMPltN6JZ7Gsl/+forthmAl
         76lY1xEl1VuCv4OOoSVrdPnXnrVGOhh6AlUMTsCN+X7fm25cVIcG9xdEySAuWUthJKvf
         bzUgqkr9wHB4MoxrrEGSBVGO+1OU+G5m+JeimQdKcYbMubxe3gtv1StxXze67HmIo1ng
         kAwQ==
X-Forwarded-Encrypted: i=1; AL+hErEs02S6QyZixMxCUQXWwEXFicpfBDlEWQaWmmpJWXvQwzEZMlNozK4tBh7QBqLLnwK6P8TIddF14ztXYX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BULSLVM10zks+7ermPOUS516taL9BVCmLEZSUGshEGYCFOuD2
	4MMjh5BTOATvnd5sNH3ENKfpOpDOc039dlLvGvN279erMfAZxt+P2k+ESzy67w==
X-Gm-Gg: AYBFou3xxioRbmWvvdOa1KyJg8kv/e4NXkCLYyRGVjmnPmiVbABSI/zyHkKmgBJ80cj
	WlmDlHQQydDv9nSpsmBP1Fy0peVf0zV2iSpnlsdtkqCXZiUVYXUKsicOwgJK5mK7K7kSkyHkMx7
	/Tt0wECR6IygpBs23kkuYghQy2kzB/934AaZYlsEVTWQpqTbmH+A155jSbuXVEqL8YT5pQbAZNL
	wbrB/+3c3+Oq0NPqnk+Q3o89udVmJSFyTYlJrCVw9gMyZu2p3Bsebp8Vviev84JGxrzp9pku5OX
	W758w1dd18PLrNSsCfl+/q7rKxmrMM2AOUj7bIcOcF/ldhWGYEaFN8+YF4GUqQc8aJjNvWtMUXA
	zRdaAIhAVaaOYfSwKpYOBjjEg7nzMjmGJ3chbQhTwARRUxQzc056cjXyAa8RKh67xd64py3nvUh
	mHEujaUwZcpQrK8aWxtM05B+xLvmt5OrLHK0F9O6nKPhPzi8cZKaxGQ72LdQJKRSJX9LK/9noXw
	lRRSQi1jrsaDHIJ0IrEvpAlHTGaN04bPhmNRVH41RMRETxpUwoG8oWV+FtEpzH1FlryyQ2/A4gB
	D8g3z0EHCl5+i5tQPF7PyaMVPJpgJl/tb4ma+1V9ES4oGUMlWLfjrFkRsQ==
X-Received: by 2002:a05:651c:439c:10b0:3ab:1d67:caf with SMTP id 38308e7fff4ca-3ae1252b561mr13845481fa.0.1794492152740;
        Thu, 12 Nov 2026 06:02:32 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm71538805e9.15.2026.11.12.06.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:02:30 -0800 (PST)
Date: Thu, 12 Nov 2026 17:02:27 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <avXFHBcVoMkZY6uL@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105170157.616859418@infradead.org>

:-(.

Look here: https://lore.kernel.org/oe-kbuild-all/202611121431.06YgiErz-lkp@intel.com/

On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> is marked idle somewhere along its ancestral path.
> 
> This makes se_id_idle() behave differently. Notably is will now be true
> when there is a idle cgroup anywhere in the ancestor path. This
> addresses an issue where preemption of cgroup::idle was overlooked when
> flattening the runqueue.
> 
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/core.c  |    2 -
>  kernel/sched/debug.c |    1 
>  kernel/sched/fair.c  |   73 ++++++++++++++++++++++++++++++++-------------------
>  kernel/sched/sched.h |    4 +-
>  4 files changed, 50 insertions(+), 30 deletions(-)
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8970,7 +8970,7 @@ void __init sched_init(void)
>  		rq->nr_running = 0;
>  		rq->calc_load_active = 0;
>  		rq->calc_load_update = jiffies + LOAD_FREQ;
> -		init_cfs_rq(&rq->cfs);
> +		init_cfs_rq(&rq->cfs, NULL);
>  		init_rt_rq(&rq->rt);
>  		init_dl_rq(&rq->dl);
>  #ifdef CONFIG_FAIR_GROUP_SCHED
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1090,6 +1090,7 @@ void print_cfs_rq(struct seq_file *m, in
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_runnable", cfs_rq->h_nr_runnable);
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
>  	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
> +	SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);

idle is only in the CONFIG_FAIR_GROUP_SCHED :-(.
So as the robot says, this breaks compiling in !CONFIG_FAIR_GROUP_SCHED.

AFAICT tho, moving this down below in CONFIG_FAIR_GROUP_SCHED next to
h_load and other guys will solve the issue no?


Cheers,

Kayra
