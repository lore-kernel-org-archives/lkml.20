Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407954;
	b=1Tpl1AzhjZXavLfTp+WpL8soGon4oJz0dkUf1RemKeWqVJ9cWepWGDBtU5lB6gSb29KQ
	 z/wrHU7lKHjgdXEVMQAKS0+NuxnPOO/9l5ajJwAD+rhnMetUt/hd1o1hHftpHLbY3X4AS
	 TX1D847xuTONdmUPZbwCpuaB1s8An2uVEQytp9ozGYh/TTWT3q4d1YWUcBroVIasytz5U
	 Irlx+G3oV5Bt7dg9+aXoXJMMwntHZ5FJEXIrfPY7r15hiTZ+quY0xkOFxtd6sExLdonSP
	 xJDIlbb0l+XER9JKUMhcKk0z0agFV5KRjJmKToU0CmmSe0YDbBDw2nnoJigahihi54w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407954;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=C3oPuDPO0VYHqtguIXd8xVh7hOh8gbzHRPbwL03ijNk=;
	b=otyPy/MvoCfrEuj6cpzMdv01azZ2VnC3X+yRhPbiG/Iwkv2s8O9V4xR5vQszFfAB4str
	 HWnohL/7BlXWrWX4DqadVBO6NfccIxTGm/8iWPx6IJW4A3UDIphv+51IS9rKYO7XWxUGt
	 c3NoKgy/KA5HWcpgev/0E6j2jNXb8yXXaq2Uz9UoCcz/tASAlZTYBeFHlYNQ9svuc34/l
	 lte1KBkXWD0DR/iVrFEnx4vTo5mtb4rZ4diMSR8VwKgNpgiX7KcNvW29RWmYesR+EYjFK
	 jvGBp63lIdpPzG/1daypMh/lseS9epdPy9j78Dy87L5oDKObKqVcV1IhcNpRyJGUe7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBMO2sTM;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370CB606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370CB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBMO2sTM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gwi1hqZgtwb2ABl6IdwfrO0Yqa6B/15LvCky+iBgjsw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794407951; v=1; x=1795012751;
 b=IBMO2sTMfo5qMYr8CtYl7y+IZ0uEpWVmEjM2FxMnerRpGv0aTshSn2IzYbSXzqyvHaeQo9vH
 /y+tZAjVH3qup1ekj4T6ivDAH588oMPasTihtN1Gqs9tLkN0/P7lVS8IUMj3nMHqFwzeqACrkQW
 1BM84f0DWpSoQAEOF+iXfhLk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee14b68a753824d2;
	Wed, 11 Nov 2026 14:39:10 +0000
X-Mizu-Trace-ID: ee14b68a753824d2
X-Migadu-Flow: FLOW_OUT
Message-ID: <271d016b-4597-4b6f-9331-5d53d9a9f3a2@linux.dev>
Date: Wed, 11 Nov 2026 22:39:01 +0800
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
Subject: Re: [PATCH-next v3 1/3] cgroup/cpuset: Correctly set cpus_updated in
 cpuset_hotplug_update_tasks()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261111020204.1660055-1-longman@redhat.com>
 <20261111020204.1660055-2-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261111020204.1660055-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/11 10:02, Waiman Long 写道:
> When cpuset_hotplug_update_tasks() is called with the conditions that
> remote_partition_disable() has to be called, the cs->effective_cpus will
> be updated such that it matches what is computed in new_cpus. In such
> case, cpus_updated can be incorrectly set to false leading to stale CPU
> afinity remained in the tasks not matching the new cpuset value. Fix that
> by forcing cpus_updated to true after calling remote_partition_disable().
> 
> Fixes: 181c8e091aae ("cgroup/cpuset: Introduce remote partition")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/bug/linux-ab90f7e8-0d60-40ca-83e9-e405075b24d2
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 8a8a424a389f..862864b44960 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -4031,7 +4031,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  {
>  	static cpumask_t new_cpus;
>  	static nodemask_t new_mems;
> -	bool cpus_updated;
> +	bool cpus_updated = false;
>  	bool mems_updated;
>  	int partcmd = -1;
>  	struct cpuset *parent;
> @@ -4044,12 +4044,17 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  	if (!tmp || !cs->partition_root_state)
>  		goto update_tasks;
>  
> +	/*
> +	 * cpus_updated should be set to true when remote_partition_disable()
> +	 * is called as cs->effective_cpus will be modified.
> +	 */
>  	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
>  				       (cpumask_empty(&new_cpus) &&
>  					partition_is_populated(cs, NULL)))) {
>  		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
>  		remote_partition_disable(cs, tmp);
>  		compute_effective_cpumask(&new_cpus, cs, parent);
> +		cpus_updated = true;
>  	}
>  
>  	/*
> @@ -4082,7 +4087,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
>  	}
>  
>  update_tasks:
> -	cpus_updated = !cpumask_equal(&new_cpus, cs->effective_cpus);
> +	cpus_updated |= !cpumask_equal(&new_cpus, cs->effective_cpus);
>  	mems_updated = !nodes_equal(new_mems, cs->effective_mems);
>  	if (!cpus_updated && !mems_updated)
>  		goto unlock;	/* Hotplug doesn't affect this cpuset */

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
