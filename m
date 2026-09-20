Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D517A303
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871190; cv=none; b=b6PkrtX12RditY2gG9jOQPBevM2NtcBnv8O7zplLD2JstNuq7Lz7JKxaHSG0Wx3mG3xAt6UdpXnKzSRtTQmpWfviWugq3poHPdflS8109U/3dinHRYfRsjEihgrQ2w3VoSFX/PHjYuGtaSkE5xfGrNZVFDy64pHyTWfM5LhWXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871190; c=relaxed/simple;
	bh=mHIy657W67A8Isv5MaLtawF1GfpD+T+X03X0+hig5vY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K42K5ToHXtHND5bbmP6pXJK9vspAGh+aRSEGC9hXd9wc/fPisnHjH3Fidd6Cqb9y1rnE4MiRZUBFFXaj/qsttWqponySYTfItwnQn+CEYTPy1VCxDqTwRvVKodyHkfXj/B4Qbv4H2iOzfarTsn8n41zjkY7sb/mX7jg6CAZxd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IUSaGRve; arc=none smtp.client-ip=91.218.175.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IUSaGRve"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mHIy657W67A8Isv5MaLtawF1GfpD+T+X03X0+hig5vY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789871186; v=1; x=1790475986;
 b=IUSaGRveIZU3qAl8zsCT3Bw1TB1VD7LQopltt3JHJPy5j51IaT60ei1Z3R6qoh38YvCehgGN
 ErO76iz1KWFc49SancN8rrO0PisakCQe8lqbTw9ZTcWGO0qlOE+vr893LKLt19akwftK9s5dPEw
 HJywicjmqHuHKoPtsepOhotE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9adb6d34471e089e;
	Sun, 20 Sep 2026 02:26:16 +0000
X-Mizu-Trace-ID: 9adb6d34471e089e
X-Migadu-Flow: FLOW_OUT
Message-ID: <f27e12d8-2e34-4c10-9773-d1af5b8538b6@linux.dev>
Date: Sun, 20 Sep 2026 10:26:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/cpuset: Defer sched domain rebuild to common
 unlock path
To: Ridong Chen <ridong.chen@linux.dev>, Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20260918102730.72263-1-guopeng.zhang@linux.dev>
 <c74015aa-0e51-4161-9fe8-c779a34c64ce@linux.dev>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <c74015aa-0e51-4161-9fe8-c779a34c64ce@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/18 18:41, Ridong Chen 写道:
> 
> 
> On 9/18/2026 6:27 PM, Guopeng Zhang wrote:
>> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
>>
>> Both callers of update_prstate(), cpuset_partition_write() and
>> cpuset_css_killed(), call cpuset_update_sd_hk_unlock() immediately
>> afterwards. That helper rebuilds sched domains when force_sd_rebuild is
>> set before releasing the cpuset locks, so the check in update_prstate()
>> is redundant.
>>
>> Commit 3bfe47967191 ("cgroup/cpuset: Move
>> housekeeping_update()/rebuild_sched_domains() together") removed the
>> same check from cpuset_write_resmask(). Remove the remaining one from
>> update_prstate().
>>
>> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
>> ---
>>   kernel/cgroup/cpuset.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 8f24171..d58ecf5 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -3039,8 +3039,6 @@ out:
>>       update_partition_sd_lb(cs, old_prs);
>>         notify_partition_change(cs, old_prs);
>> -    if (force_sd_rebuild)
>> -        rebuild_sched_domains_locked();
>>       free_tmpmasks(&tmpmask);
>>       return 0;
>>   }
> 
> This title is confusing. I thought you were doing some async work, what does "defer" mean here? In fact, it just removes a piece of redundant code.
> 

Thanks for the review.

I misunderstood this. I used "Defer" because the rebuild still happens later in cpuset_update_sd_hk_unlock().

You're right, the title is confusing. I'll fix it in v2.

Thanks,
Guopeng


