Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA63AEF49
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789874803; cv=none; b=ULrzLogsGgW0RYLmZBs3llyhzXvLrvb9GKcfmgt3OCDNvA3Rg8eZeJTOpD87l2sXB3W0Ex+yNsQWNRt0+Dbz+EJ8iTzHEEw46ZxseEO2D3t7zxLgRlw/ADHIlm1aaIhLFBd3MIev5bN2orJiY5jltYF03QZIbMVM/NEhgSFqncE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789874803; c=relaxed/simple;
	bh=lUMIprFigeo+4Lvd3zU+aZwPLnWWNiV1VTYdTyJmw5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDuomZcxZTwTED9EjqVwafRH5ywiFxDgvHVixL6W458Bvk5Bewxl1ADVidywgQJnEWfPg+Hu4q5t8M9JFr9ChLd01gZ/vYxvZ7cLEVNPgNF4ujoZ2gj8tJBpWTMf40xlhauev2iKvfEBTNJP8lVZg4PfrCT0XST8bzh7Ywjdru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OHRQP1Rw; arc=none smtp.client-ip=95.215.58.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OHRQP1Rw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lUMIprFigeo+4Lvd3zU+aZwPLnWWNiV1VTYdTyJmw5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874797; v=1; x=1790479597;
 b=OHRQP1RwusFNvUZkR8V2C1iVw6VjJm95Sta0bpFTmf67vVCpZy425r7YCtTsbn2juMVNoOKl
 cybXc++f949qHKzDKBFZ0XHIKr6N0iSIvGUr5xAjsThB8pPRs+kULh70OCDi6VXaIGn/0GFjtGa
 ntWEQHV7GH/VlNCSfJbOv4tM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30785122cacebbc4;
	Sun, 20 Sep 2026 03:26:37 +0000
X-Mizu-Trace-ID: 30785122cacebbc4
X-Migadu-Flow: FLOW_OUT
Message-ID: <e2909c95-8a56-46cc-8ef4-7fa43acdb969@linux.dev>
Date: Sun, 20 Sep 2026 11:26:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/cpuset: Defer sched domain rebuild to common
 unlock path
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20260918102730.72263-1-guopeng.zhang@linux.dev>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260918102730.72263-1-guopeng.zhang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/18/2026 6:27 PM, Guopeng Zhang wrote:
> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> Both callers of update_prstate(), cpuset_partition_write() and
> cpuset_css_killed(), call cpuset_update_sd_hk_unlock() immediately
> afterwards. That helper rebuilds sched domains when force_sd_rebuild is
> set before releasing the cpuset locks, so the check in update_prstate()
> is redundant.
> 
> Commit 3bfe47967191 ("cgroup/cpuset: Move
> housekeeping_update()/rebuild_sched_domains() together") removed the
> same check from cpuset_write_resmask(). Remove the remaining one from
> update_prstate().
> 
> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
> ---
>   kernel/cgroup/cpuset.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 8f24171..d58ecf5 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -3039,8 +3039,6 @@ out:
>   	update_partition_sd_lb(cs, old_prs);
>   
>   	notify_partition_change(cs, old_prs);
> -	if (force_sd_rebuild)
> -		rebuild_sched_domains_locked();
>   	free_tmpmasks(&tmpmask);
>   	return 0;
>   }

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.
-- 
Best regards
Ridong

