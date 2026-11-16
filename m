Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798427;
	b=ccqXOFhlBFHPUw7idQ2O2wAaLcDLtLfgLFVrbBtrJ2jeSq4HLSjzTWhmqxS7TJu9Zwuk
	 UK6asNCv+11LxzUU71/zGwVwWmf0BCb1DAbu0TmuBCf+rTdxqegumeAl5M74Gfvv5WXV3
	 ELKJ8ZDbkm/CP7/V/gbUc9F8KOI511TR15CkA0vD9tvK6Ch/VHmnBOwUCYEvsCoAnoP+L
	 7L6uGZmjIfS4OesVSWyNLzpJfpCti+N9wQEmWCeNeXtPFQ2atxd+3ZsF5ZD9gmEvmls3o
	 gTFkBfug0T2NO5lkWWAxjJL/vKx4XKfsi8M3QMqz/TEPlUE86JzRiqzDp187V+xmLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798427;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y9wzxTwuaBlsxv0M8Fe9dZNWrfzANIugrMSpINJ6qSc=;
	b=LNMGidfeWVFbInkz9IeFb7l+P6La9spAUfy3WwWGeXfO0ISh6lHElfRM2Sw8zchfYx8L
	 XF8Bgs3AlHVpEsCsXW8kADfbAAoPZ54x8gsNVJHqdMgijd0tE/xd45lg+Hcb9XLgiosdz
	 xs0SPkQCLbC8pEyWYNHD90ajFULsZVfP8Srv+P9w0+v8nctg7yhcoBvBYJS1xX+ejvts0
	 9be4zEUnw+Yi0OQUwrwyhNnQfI5OUYm1KgmKbUhpftvhPfvyldEXt6RTx857cVIjDZmG+
	 m5uy2xaku6oyBraQOKnevoxIdgNeN5i+tyYbdREp/PKHoZQlc2jfRG7J4XqKB+3vpPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GEDaf60d;
	arc=none smtp.remote-ip=91.218.175.228
Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D14606A886
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D14606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GEDaf60d
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/rjgHBG/W0eYGQT3V27ww5iUxmmbAK9UEcQ5HkwVUaQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794798425; v=1; x=1795403225;
 b=GEDaf60dzd36dysT+qpIuQhesLyQCW7NpzqxgH9ZkJNYKllqojHVtY7eK+UOC0Avauf/DAyQ
 5G1buQ7P4zutPN7oCbMPGkcBkD7FOisVNuss7SxT7edDCmOYxLHpWwVa9XBnzkZOwZay1hwovSr
 88xEf3OkycrYBGyM1hpU7mPg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a32aaf1645e8d52f;
	Mon, 16 Nov 2026 03:07:05 +0000
X-Mizu-Trace-ID: a32aaf1645e8d52f
X-Migadu-Flow: FLOW_OUT
Message-ID: <e437ac79-7999-43da-9fe8-6cfd475a5196@linux.dev>
Date: Mon, 16 Nov 2026 11:07:00 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4 2/6] cgroup/cpuset: excpus parameter of
 remote_cpus_update() must have at least 1 active CPU
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261116012330.2271010-1-longman@redhat.com>
 <20261116012330.2271010-3-longman@redhat.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261116012330.2271010-3-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/2026 9:23 AM, Waiman Long wrote:
> It is reported that remote_cpus_update() fails to invalidate a
> populated remote partition when an ancestor cgroup update reduces its
> effective_xcpus mask to only offline CPUs.
> 
> When update_cpumasks_hier() updates a descendant remote partition, it
> passes the new effective_xcpus mask (excpus) to remote_cpus_update().
> Because excpus still contains offline CPUs, cpumask_empty(excpus) is false
> and remote_cpus_update() only checks tasks_nocpu_error() when adding CPUs.
> 
> With the partition left valid, update_cpumasks_hier() computes an empty
> effective_cpus mask and jumps to get_css. The populated partition stays
> valid with no effective CPUs instead of inheriting its parent's CPUs,
> and its tasks remain affine to the online CPUs returned to top_cpuset.
> 
> Fix it by invalidating the remote partition if there is no active CPU
> available in the given excpus parameter.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/bug/linux-936b7155-f652-4146-a4ab-ec48fd392a1d
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 631fb449cef8..195d4e3a283c 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1810,7 +1810,8 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
>   
>   	WARN_ON_ONCE(!cpumask_subset(cs->effective_xcpus, subpartitions_cpus));
>   
> -	if (cpumask_empty(excpus)) {
> +	/* New effective_xcpus must have at least one active CPU */
> +	if (!cpumask_intersects(excpus, cpu_active_mask)) {
>   		WRITE_ONCE(cs->prs_err, PERR_CPUSEMPTY);
>   		goto invalidate;
>   	}

This also invalidates a remote partition with no task whose excpus
only has offline CPUs. According to cgroup-v2.rst, such a partition
is valid: cpuset.cpus.exclusive.effective may contain offline CPUs,
and cpuset.cpus.effective can be empty if there is no task in the
partition. The hotplug path and tasks_nocpu_error() follow the same
rule. How about only invalidating it when it is populated?

	  if (cpumask_empty(excpus) ||
		  (!cpumask_intersects(excpus, cpu_active_mask) &&
		   partition_is_populated(cs, NULL))) {
		
Also, it probably needs a Fixes tag, maybe:

Fixes: f62a5d39368e ("cgroup/cpuset: Remove remote_partition_check() & make 
update_cpumasks_hier() handle remote partition")
-- 
Best regards
Ridong

