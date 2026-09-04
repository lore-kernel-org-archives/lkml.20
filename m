Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28FC42F712
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519854; cv=none; b=fPbPWcDTAosDDhrbv8spdOMXPL6TgttYgHqYS6xqvH4EZqiN992B7cI0JnjCr6PNz/yRk6AznjcH1fF7w092+BZPahY5voCdDl7Exiydf8LnarhnbWtWTZVEp2kM+fhwyiFXSPA6lvPVLK1OL56rjWF8r4maBOi8yukdZiqu5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519854; c=relaxed/simple;
	bh=P+MYfKMDXUpfYtRSDpp9Fq8A5bwa4AmblDNGqh898Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATv6usHFp0x2oIEuqXrjXA+GmEv8k4Tv6Cks/H/9vPxpXu70xM19xffUSbcxGjS9ZKagZTWz8c9GrdixIUFrfwTMzxpdEiVBF+yZykA45hkpLJpBk0w/BFUMRQEP9hq3Lb7gVmdMLOKx0AIIolbw2ayP/mZO1kV7SzYXtbXoHI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IU9rYYQp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IU9rYYQp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so8238195e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788519851; x=1789124651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hx1MJKR10ulwIc9ONtxMhWx5TvezeBCB8mZ2l4Tg1bk=;
        b=IU9rYYQpWqCqFoTaLs8EQjux6DoAmLKd6Xy8T2d3Qm0nJyHHZFMNxP78LU6E3gLlRv
         R44u7lzbaM+dtt8Ktm9KG33nv7t24CIQL7YyWJEsP10W3EPxZlRLYXXh1ZyMMchMZFV5
         ZpCV5PE2xQ1XLFdu9PvmhZd0nMho1VLH0SkI0x1aTpU3pRiXDd3lwVHV23ViRzRwSi/8
         ofhHAGSi8Ok8D1OXgqkZobRUfEyAmBtb90SM1ii479AsQa3ZcU+ir++ARcVRcla/bRpR
         t9dym1rxqjYCrIjr0bwYm5vMBHRG4jGLAQh3elag5YJQnJ71arvUrVPEt1245s6WqLso
         kfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519851; x=1789124651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hx1MJKR10ulwIc9ONtxMhWx5TvezeBCB8mZ2l4Tg1bk=;
        b=BS3ZW54oHgmKrRWmwkxgb+YPFW2wOc1hkZ8eAgNJsy1RyqUQyE6EYRGh/Sn48XfjmM
         jM8mvavTAqOk5/wejAzMDMVFDnsQbhCTrZwdNOsiLM3KcMaPkt1mfbJ15tOU40YjWAS7
         /u6o6102Q55U1Wmg4nInSD/9VkaubDBDFeL/iVAgK4572geRBtB6fuolngQDLa5AQQ7x
         ojyk0MZU5DmRciNG3iiLprfnseEfmRLUWKDynj0HrXqNqb6GjrK/2e9tori7VBsKSuaA
         MmI5aTowGSnme20oJg+1VC/RWwdxAEA4en7xlwqvzw4BZJpkQAjBSOJa5sTu9Pi07Bo+
         Wi5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEOwTgOqr22ofzMAuEy45DKkLbEM0xRaVuZ2DNyaBJgk9p6JU/VhzjSzPaYzOuJeeKr2yOsOVPPp1maWY=@vger.kernel.org
X-Gm-Message-State: AFuF++lVMrs1mQFRS5V8nrLsInd7O6uinA+Kre0jpyCaxnhgsuarUqqE
	XxsZqKe84hQ4pMxiv8lnAsiZeguhvpzbrsPr7Dh0yhZWcJiSz8r3J3neE2jYp2/RFZAD1IKFkUo
	6iQdFsQY=
X-Gm-Gg: AYBFou0f4FNENygerMqNzSRwno+Jhhbbny8LaxrW9Ll6kIykvj45LdHHDzhBCmmDiJw
	TMG/wlSPCkZyQSH9BAYmEo9vlgNtn2Le5w40eLX6HiZwmGu1mbps6Hx1C6vmEZDwE1Ldrru9XFL
	71PnHahWWVm5ZTlvnueDAfALvSrM1TrAnzOVPzoLzbok4K3irEmwwpyJikfzxYns2ILw6eiiSzX
	iduZU/THbR9ofDhM8HKekO1h2PeMc4R3O1L6/Ks6LGUjgZ4y+UkYCsTFaKwuhP8Xl9Qc7Ll1gH5
	gzI9BTnK1j3ud5SNrMkh+rt10RkQoQ3CVxxflaAWlHCWc0dIuujrgzh/Vyrw4GK4/BeLKo3zmKN
	LyCDNUjo8kHReb47/MvZBT4GD1L7zX4dFUveDJ61P6OjO4gBlYjOUJj34Fos6TXEy9hcvGpXlth
	Yzi0Bj0cA5mUM2RHWJDbuGUIvQgF7HcTnUhG10DCGFF0zFVubCO+U84HiQIPoAiB9AI/a+dWLo3
	Q==
X-Received: by 2002:a05:600d:6445:10b0:49c:fc6c:be09 with SMTP id 5b1f17b1804b1-49cfc6cc00emr18769275e9.32.1788519850918;
        Fri, 04 Sep 2026 04:04:10 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm145447675e9.10.2026.09.04.04.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:04:10 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:04:08 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] mm/oom_kill: convert process/thread iterators to
 for_each_*_rcu
Message-ID: <apqlqLeCyS94csaH@tiehlicka>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-3-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-3-ye.liu@linux.dev>

On Fri 04-09-26 16:29:54, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs wrapping
> for_each_process()/for_each_thread() loops with for_each_process_rcu()
> and for_each_thread_rcu(), so that the RCU read-side critical section
> is scoped to the loop body.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/oom_kill.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index 5f372f6e26fa..8dd025965810 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -94,8 +94,7 @@ static bool oom_cpuset_eligible(struct task_struct *start,
>  	bool ret = false;
>  	const nodemask_t *mask = oc->nodemask;
>  
> -	rcu_read_lock();
> -	for_each_thread(start, tsk) {
> +	for_each_thread_rcu(start, tsk) {
>  		if (mask) {
>  			/*
>  			 * If this is a mempolicy constrained oom, tsk's
> @@ -114,7 +113,6 @@ static bool oom_cpuset_eligible(struct task_struct *start,
>  		if (ret)
>  			break;
>  	}
> -	rcu_read_unlock();
>  
>  	return ret;
>  }
> @@ -368,11 +366,9 @@ static void select_bad_process(struct oom_control *oc)
>  	else {
>  		struct task_struct *p;
>  
> -		rcu_read_lock();
> -		for_each_process(p)
> +		for_each_process_rcu(p)
>  			if (oom_evaluate_task(p, oc))
>  				break;
> -		rcu_read_unlock();
>  	}
>  }
>  
> @@ -430,14 +426,12 @@ static void dump_tasks(struct oom_control *oc)
>  		struct task_struct *p;
>  		int i = 0;
>  
> -		rcu_read_lock();
> -		for_each_process(p) {
> +		for_each_process_rcu(p) {
>  			/* Avoid potential softlockup warning */
>  			if ((++i & 1023) == 0)
>  				touch_softlockup_watchdog();
>  			dump_task(p, oc);
>  		}
> -		rcu_read_unlock();
>  	}
>  }
>  
> @@ -894,8 +888,7 @@ static bool task_will_free_mem(struct task_struct *task)
>  	 * are dying as well to make sure that a) nobody pins its mm and
>  	 * b) the task is also reapable by the oom reaper.
>  	 */
> -	rcu_read_lock();
> -	for_each_process(p) {
> +	for_each_process_rcu(p) {
>  		if (!process_shares_mm(p, mm))
>  			continue;
>  		if (same_thread_group(task, p))
> @@ -904,7 +897,6 @@ static bool task_will_free_mem(struct task_struct *task)
>  		if (!ret)
>  			break;
>  	}
> -	rcu_read_unlock();
>  
>  	return ret;
>  }
> @@ -960,8 +952,7 @@ static void __oom_kill_process(struct task_struct *victim, const char *message)
>  	 * That thread will now get access to memory reserves since it has a
>  	 * pending fatal signal.
>  	 */
> -	rcu_read_lock();
> -	for_each_process(p) {
> +	for_each_process_rcu(p) {
>  		if (!process_shares_mm(p, mm))
>  			continue;
>  		if (same_thread_group(p, victim))
> @@ -982,7 +973,6 @@ static void __oom_kill_process(struct task_struct *victim, const char *message)
>  			continue;
>  		do_send_sig_info(SIGKILL, SEND_SIG_PRIV, p, PIDTYPE_TGID);
>  	}
> -	rcu_read_unlock();
>  
>  	if (can_oom_reap)
>  		queue_oom_reaper(victim);
> -- 
> 2.25.1

-- 
Michal Hocko
SUSE Labs
