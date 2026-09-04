Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B303AA4F8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520020; cv=none; b=BXH7eZoV2VwuYh+2tcGLEcU1wcVPNKY7XX9te5FWNPvqphOWS898B4sxsf0xfVhQPF9SaZAbPJ5ILhyWgrNDIdvOlicMOhat6VS9WQvoKNKMr0a0tol4TZBVzD5LYtJBAyYv8pgSKfMtO96M/ZYoPQl8Hri8/mNiI+R6CEOlYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520020; c=relaxed/simple;
	bh=SF/YlEQK954Oqqw1MugM1o137YjqR+3X+umSu4LOZR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mARXFS+gQUI/6fYxa353OnupjJarXXPRpEFp76KxRoDQhXSu7fvhC+VgklrbckjmFhc7tf2ydpNI7xpZQLyaCBbLtgYsD/JikF/bKMLK7DhjrGcnx3o3xB/ou8O4WQSjXHLy0Wtk0Fh223ALOM0SbpmCRa/mhOFlboO9JzlTQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XuvgT+5m; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XuvgT+5m"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so9453345e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788520017; x=1789124817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LN+05tYUoW+ljcA4oJQdgwn36aZVMFD1VDoe2ImKRvY=;
        b=XuvgT+5mgB54GA2M4ENjcxfslNkgFqidKhdyQMw9gaK3DTLXVL/PJjxfba6GOX9xXo
         +JOLj9oep77ursC6wt7TI7YOCXZvazOGIUSo8sqCPbvbB4Yzep8REDt6dJmosWUvHw/B
         3r0LGtsrO5JkYaAhznCqf+/oNNhQcHUReZr4+2jCEBIS2ncBfnLUr82l+3GlsBmUw8E+
         gzDDCUMEEBDozBHspj0m9EHQ+vgxtg0B9kHk+Ux5Yyg3jiQKkq5H6qSglxQ+6e1lkj73
         jDIO4PUrbRReKrnaDKtPsaiBu0AqDQE7b50SBnnHdkvRH3qhMOPBUV332KHTEYpeHYm+
         Wp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520017; x=1789124817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN+05tYUoW+ljcA4oJQdgwn36aZVMFD1VDoe2ImKRvY=;
        b=mVf7LIppNdfTCj8BTXE5zJ+6FFk+PgEXj0Kl4DzVvkcZTiW0Scd21vsbpGgXnvqdth
         HnsrkLjffBTtntGce78hGlVKvktn+AA1/Cs1sb/eCgN05WeZJ1yXwbpj8jI08v70xYQn
         y9/HKgt62xvq4zbnvxoVtvJmiNG/T8pLAYokypSRzoPppFNt9G6DeEmczNkKyLEDAFR1
         PPU7RKCiiOuc0OK/GyS9Rb1fbYsscielhvR7gqsN5eoikqZipWa5nj1Bbhy4A2hxfA35
         E1uxSOGKQdtVmo6rJNDa4ILJgO8eTGfJxLmrsr7tfCwhyw7iJCc37Pbs1k5wxwMCpioG
         OW4g==
X-Forwarded-Encrypted: i=1; AKwUvBxJXW9RwTGmpRIpI9KLF/2WdeRtN1lwANBwxGqlFO4lj/8RL0+Bh3Sx7hS9y1VuhDNLqki2w0EeBsGrGGk=@vger.kernel.org
X-Gm-Message-State: AFuF++nhlkxDQHQLOMQ9qmYipHLcpZZ2P5APNqx0zUe1CRuL8C/htKh5
	Wbp60RJUi3akwEXHG5DzKV8cx+qu5P0YWs023R82or1nTQpIQiJF4YuEQZNbOZgLVpw=
X-Gm-Gg: AYBFou2OZN8qVOIdYMIneKw2buS6fnlQYxwshmhV0dN0JTz/3IB6QgLOM7+iMvpEzZI
	ea+yvxWiY081r3GlsAY6x6HdslAAGx8yP+Smv5WTh1/TrvEdp+/Sdo84DEfbXxQTvzgwYExwWxs
	ooYzSYe8+VtnpZ8UxHrZOXwfPNbawZB3u5vKMYLfUz2/N0MB5WAexm9UHl9QCb1pvw4gO1VEpeS
	E+2MUkBkVoBUWF6naWjR5xTE7XJkapT8WJkKE9UPPtKvWrFdt9612uRrvs5c+Xj+iPbkIcNab3x
	k/A80gkyp+GaK92ia73iDslZa0YEPuqq7ATDPHyAoOUCXUgv+rnSoF0+x5hPcW6YMF+Ut3bUiRU
	HW2bd+k7ZlXml3+boTZ1YnIWoO2H129Ixz4ZHA2gI+e9MgsS/9dOGCwATrWmp+PrKuvmuZ2H4q3
	LHJO2+6St+8UMup7/0ZalJN+SlRsenbptrlKV4j7pT7h8UBksx/8+aWqUEFrtWnNIdI59iSjfLY
	m6ipGigrade2mWDiFUFoAKY
X-Received: by 2002:a05:600c:4709:b0:49c:fa21:e748 with SMTP id 5b1f17b1804b1-49cfa21e99bmr29698025e9.30.1788520016817;
        Fri, 04 Sep 2026 04:06:56 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm161987755e9.13.2026.09.04.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:06:56 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:06:55 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>,
	"David Hildenbrand (arm)" <david@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Ye Liu <liuye@kylinos.cn>, Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 6/8] fs: convert process/thread iterators to
 for_each_*_rcu
Message-ID: <apqmT2phgpwHD3v-@tiehlicka>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-7-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-7-ye.liu@linux.dev>

On Fri 04-09-26 16:29:58, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pairs combined
> with for_each_process() and for_each_process_thread() loops in fs/
> with the for_each_*_rcu() macros.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  fs/proc/base.c        | 4 +---
>  fs/resctrl/rdtgroup.c | 8 ++------
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index 6a39de424f62..da36ba73dc17 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -1160,8 +1160,7 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
>  	if (mm) {
>  		struct task_struct *p;
>  
> -		rcu_read_lock();
> -		for_each_process(p) {
> +		for_each_process_rcu(p) {
>  			if (same_thread_group(task, p))
>  				continue;
>  
> @@ -1177,7 +1176,6 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
>  			}
>  			task_unlock(p);
>  		}
> -		rcu_read_unlock();
>  		mmdrop(mm);
>  	}
>  err_unlock:
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5dcbb0a964e8..3f96d21b84ab 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -709,14 +709,12 @@ int rdtgroup_tasks_assigned(struct rdtgroup *r)
>  
>  	lockdep_assert_held(&rdtgroup_mutex);
>  
> -	rcu_read_lock();
> -	for_each_process_thread(p, t) {
> +	for_each_process_thread_rcu(p, t) {
>  		if (is_closid_match(t, r) || is_rmid_match(t, r)) {
>  			ret = 1;
>  			break;
>  		}
>  	}
> -	rcu_read_unlock();
>  
>  	return ret;
>  }
> @@ -826,15 +824,13 @@ static void show_rdt_tasks(struct rdtgroup *r, struct seq_file *s)
>  	struct task_struct *p, *t;
>  	pid_t pid;
>  
> -	rcu_read_lock();
> -	for_each_process_thread(p, t) {
> +	for_each_process_thread_rcu(p, t) {
>  		if (is_closid_match(t, r) || is_rmid_match(t, r)) {
>  			pid = task_pid_vnr(t);
>  			if (pid)
>  				seq_printf(s, "%d\n", pid);
>  		}
>  	}
> -	rcu_read_unlock();
>  }
>  
>  static int rdtgroup_tasks_show(struct kernfs_open_file *of,
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
