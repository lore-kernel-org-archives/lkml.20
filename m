Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395B150EBEB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982609; cv=none; b=Rkbm9bzBLHrDbR/AjJE1F0SbMdN5tM8v1YEDvL/yEt4eooy9OubQHW74E5F3EuR9xsowpCpZiOQM3gkcJX2gp7C0c+L1xeV+AXN/d36FRUmp0kocam/Q1Z968DUjJEwxtbLthXmiSF3mOsHL8loHcpzVaxvK4HJ8N7XVBOeiVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982609; c=relaxed/simple;
	bh=hKbNvtCuW20zPS24qwqeFSP88QzdSVSwhIRmtaAANe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M35f2pbPihX1aKkvCMObSWXLrZ3xCqi4pO/fDNTIS3D0JBPHoRbypN61+yErGtcPTI59q+DQCksjTKFhabr+hXRocYA42p9pzkUEqBD1BM7GmH7RoPeLhCFMNXmC3xphTXVg5Xli8C3jm0iyFuxdbPZPI4rnJo4IyHyiJFHWP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LdF9YJ2y; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LdF9YJ2y"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e6f83f0bbso376285985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791982591; x=1792587391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfEQYJS10SzxUn0KjnMduakisOWn0z9unME6AqbuJxQ=;
        b=LdF9YJ2yd01aFOGce9ZvuUKha6pYbgfm1ZOiAlTq6dejfzy0sdx//tuhX65A6duRjm
         D63EoaxAf1JE00dXXFNYQh6xt8qBajTic0qJ6OO8lTXQv1d4Y7s9kTTVwXBs33n27RF1
         T7MFwUd0U4JE9eBiagzwh4kQ3WGJVpnf8s6hOxEhTZNeJAQO/alVj7IsFbXBg5vRH8Qd
         E5d5n4CVMs4F7Y8anfgwP1+trhyoV0x/XE9skvR0Xd/iYglZymzTmlNDZU9tV8w/fW5j
         FT+jFQyZe5SZobVZJgNUYN0Njbc1gHHbMo93h6rtWrQUX7oRnCPqUccts6AxR1MvPYZZ
         Ad+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982591; x=1792587391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfEQYJS10SzxUn0KjnMduakisOWn0z9unME6AqbuJxQ=;
        b=K5uvCsLmqHjbscPy0hWSOklgOYTkocT79/dXNV63h5RiGQpaybTLj6kOjeisz1qx9d
         3d7cP2cLjqUioz8JG0puDDLKrhmrnpQAQ5YwYIbqkv6mDnrAGFtAXhONuEHYFWIyAu42
         9LQj0Uf/FyrSpc0yd1ezk3hSa4RtlppoLoa3qkpoweJK6Hoy/qTO70QhW3hG2xvw0MND
         ywXa6uDjWfd7ES6KvFUZvCM04YfFy6IKOx37dMQbWYoxOoNGR/ftnS+wEuNOLL8D3ihK
         deaAW/Z38LOQXpWWTNVvZcrSkplrPGom/1rts44AEHDGduNKPA3iiBqGk0iypkW4GG58
         vtpA==
X-Forwarded-Encrypted: i=1; AKwUvByhBbkncGnHUkDx5ivDpuP8+4uinJ340QC5/HubzXsXrelNN+pwbT5DPmh4QmtqP+tlyj9C5LQTzcT3inw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjTFfQjt861qU8YYld50xQYnFDxGZfzKC8pk0RgGWSjswnZh3e
	n+QWwej2bE0QfMM4e1RpT07zyiHDToQzEwmAPbijqguU/YnpjB0FmALqUhDqISxeXjE=
X-Gm-Gg: AYBFou2BgPbAHUBFajl/rrMEmrOUeUgAnbWU4fE2G7ruK1tYngY8YpAr6KJf8C1j0uk
	LBsnnqYIBUROyoJPptuYhzX2VAy2UQf3ssOnYeoiwM+kLrh6jBh+wervziASA7wKpaJLyUWSkgq
	Vc3LWzRn9rkV+BclG2D2ltiaNVjDCUG9833Puh6nEgLU4Hibm7Rn3C4zaKA2wJblPCHAJ6Z1R0E
	6qGwKEeNIlLKAK3pGutKVYJJoLUKcmCD06Z3j79ELBgv10rVAqCSg5Xpo/u7TgpZITs+Gqg2bd4
	GIPtfMzQrOXMr60zgsDvQXd8TnJUyjPkYsOhPxI5A2sREpjnQQxGPszPJbjmzLk7RhMIHobZhFk
	hAYVRdlJgQht6rIFeKjV5s00M77RQ6ZnuE2vhJXUnRw/NVTYA/Il+KTiYUpcOVPdEhQiGukyxDm
	r7+5Jvm7DK+m0jyt35XkeQumpGtCykGaOULT0x6sUlM4HWX6Pp0c7IzZeAyxZy6EDJtqNRZPVOh
	mlhzVREBlhaY0YUNGdlDzaSb46uU7ih4btYDJBztHHbMFaS4TpqKuw=
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2616142685a.23.1791982590639;
        Wed, 14 Oct 2026 05:56:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50080b7sm483166685a.8.2026.10.14.05.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:56:30 -0700 (PDT)
Date: Wed, 14 Oct 2026 08:56:28 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/6] sched/numa: fix scan-period ratio denominator checks
Message-ID: <as97rD5uxYva4ayg@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-3-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-3-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:43PM +0800, Li Zhe wrote:
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 1053437933ee..76532b8202dc 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3698,6 +3698,8 @@ static void update_task_scan_period(struct task_struct *p,
>  
>  	unsigned long remote = p->numa_faults_locality[0];
>  	unsigned long local = p->numa_faults_locality[1];
> +	unsigned long locality_faults = local + remote;
> +	unsigned long type_faults = private + shared;
>  
>  	/*
>  	 * If there were no record hinting faults then either the task is
> @@ -3706,7 +3708,7 @@ static void update_task_scan_period(struct task_struct *p,
>  	 * migration then it implies we are migrating too quickly or the local
>  	 * node is overloaded. In either case, scan slower
>  	 */
> -	if (local + shared == 0 || p->numa_faults_locality[2]) {
> +	if (!locality_faults || !type_faults || p->numa_faults_locality[2]) {
>  		p->numa_scan_period = min(p->numa_scan_period_max,
>  			p->numa_scan_period << 1);
> 

This does more than just change the div/o below, it changes the behavior
of the function overall.  It's not clear to me this change is correct.

> @@ -3723,8 +3725,8 @@ static void update_task_scan_period(struct task_struct *p,
>  	 *	 >= NUMA_PERIOD_THRESHOLD scan period increases (scan slower)
>  	 */
>  	period_slot = DIV_ROUND_UP(p->numa_scan_period, NUMA_PERIOD_SLOTS);
> -	lr_ratio = (local * NUMA_PERIOD_SLOTS) / (local + remote);
> -	ps_ratio = (private * NUMA_PERIOD_SLOTS) / (private + shared);
> +	lr_ratio = (local * NUMA_PERIOD_SLOTS) / locality_faults;
> +	ps_ratio = (private * NUMA_PERIOD_SLOTS) / type_faults;
>  

This otherwise looks fine.

~Gregory
