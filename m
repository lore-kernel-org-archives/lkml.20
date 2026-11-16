Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813796;
	b=XHDhRippZqH/x8cZ/8xPHusrTImUBwUgPbUba0J43yjADDQ8ZcYlLYdzI5wCSPey4xZh
	 a/FjEr1EZA4mg72ODC1ZSVKv46GvhgBA1J+Zykt+IaqWlz/ii4G7aCpYLJEK0BAPS49pG
	 giJVaRTDdaKJ2IrUdUxx3LN93sr9TfjCrtWy5WZhMtDJT4vI6R0bN3UDas/yj2piVmzh8
	 eE1c3xTIeW3BeOnQ1x+AzJevvA8105V/Sc46g4uDUGfOaPhkfe50T8xJVP9eeLVnGBFgb
	 ZfDRvJFictP+bIfvqN0axq0bPuWg2ZrYzbA8j1ug+G05MgzfurYpFNv05vRijNoP73A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813796;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=E3GAOhs8bey3EpR/ZpqQeSgunuaJsbLwFGHFMxCRCNY=;
	b=WrOraP7QbIy6VW5DsPm+qUnePPPcdRzE6vPBvJAM1gtpByjnhIgtzSXJPdXIIcme1CZj
	 /yowLxN7Q2Y5sXT40AxF39K08597T7iNDw/k7KwDts3OZVX58h+4VEEqWSfuvxBtCqY54
	 EJaGn6hRSZK0PTegwbn69KDM8aCcT9P6hQw1f24Xfk3Ye9FiBPJHIjbW8fQ+NZ2IuAlnF
	 q7Ibpjk9rZDULiY6x0vi3dCFPgTwhkDBHMXNOrcdKyGBiDcS6/Z4kWEF2LxmaEPkvFCGa
	 y++UUd3JxLIFsBdE2UsIO0aPC1Z6OhQAVRw9o3cN04jS2zfJ0Fg5u4cyKabvrXAMQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XSrv0ems;
	arc=none smtp.remote-ip=95.215.58.177
Received: from mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347ED606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XSrv0ems
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xk77W5lcEqHjmN1eb0tVCaeCAtE+rEyeZ4RoPIqARUk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813792; v=1; x=1795418592;
 b=XSrv0emsJ0mIxxCg1TQYRcYpT4ceB7FlDNC67WfTGD4Z4VVrvt33hfVLj7X1hU1oftVuKpdQ
 IhCXXKfcKTL2pqeEjxTFRdG4sSDFnRtw8/mJVoBJZ5zoKk9lz+TtXZNLpsDrD4Mym0ZMCqTMoOT
 ug5wL3y4pXqishpO0YDnm678=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 48dd3fec185d1e7e;
	Mon, 16 Nov 2026 07:23:12 +0000
X-Mizu-Trace-ID: 48dd3fec185d1e7e
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 15:24:25 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Luo Gengkun <luogengkun@huaweicloud.com>, tim.c.chen@linux.intel.com
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com, kprateek.nayak@amd.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
Message-ID: <avqvqemiHxuQVH8b@three-body>
References: <20261111110409.1498035-1-luogengkun@huaweicloud.com>
 <20261111110409.1498035-2-luogengkun@huaweicloud.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111110409.1498035-2-luogengkun@huaweicloud.com>

On Wed, Nov 11, 2026 at 11:04:08AM +0000, Luo Gengkun wrote:
> Date: Wed, 11 Nov 2026 11:04:08 +0000
> From: Luo Gengkun <luogengkun@huaweicloud.com>
> To: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
>  vincent.guittot@linaro.org, tim.c.chen@linux.intel.com,
>  yu.c.chen@intel.com, kprateek.nayak@amd.com
> Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
>  mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
> Subject: [PATCH v11 1/2] sched/cache: Reduce the overhead of
>  task_cache_work by only scan the visisted cpus
> X-Mailer: git-send-email 2.34.1
> 
> The overhead of task_cache_work() is high, especially in multi-NUMA systems.
> Currently, task_cache_work() tries to find the pref_llc by scanning all CPUs
> in the system. However, most of these scans are meaningless, such as those
> for CPUs that have never been visited or were accessed a long time ago.
> 
> To address this problem, introduce visited_cpus to track the visited CPUs
> and evict them once they have not been accessed for a duration exceeding
> llc_epoch_affinity_timeout.
> 
> Now that we know exactly which CPUs to scan from visited_cpus, we can remove
> get_scan_cpumasks().
> 
> Below are the Redis test results conducted on AMD server.
> 
> When NUMA balancing is disabled:
> 
>   valkey-benchmark rps  |      baseline       |         schedcache              |     schedcache_visit
>                         |  (no cache aware)   |    (without this series)        |     (with this series)
>   ----------------------+---------------------+---------------------+-----------+-------------------+--------
>                         |   p99 latency(ms)   |    p99 latency(ms)  |   DIFF(%) |   p99 latency(ms) |  DIFF(%)
>   400000                |      0.436          |        0.554        |   -25.68% |         0.441     |   -1.14%
> 
>   Additionally, the output of perf top -e cycles:k highlights the overhead
>   incurred by task_cache_work():
> 
>   valkey-benchmark rps  |         schedcache                        |     schedcache_visit
>                         |    (without this series)                  |     (with this series)
>   ----------------------+-------------------------------------------+---------------------------------------
>   400000                |  0.81%  [kernel]  [k] task_cache_work     |  0.02%  [kernel]  [k] task_cache_work
> 
> The trace data is shown below:
> 
> echo NO_SC_VISIT > /sys/kernel/debug/sched/features
>     redis-server-24660   [195] .....  2916.005989: sched_cache_scan: comm=redis-server pid=24660 scan=384
>  valkey-benchmar-48836   [317] .....  2916.005993: sched_cache_scan: comm=valkey-benchmar pid=48836 scan=384
>  valkey-benchmar-48487   [310] .....  2916.006002: sched_cache_scan: comm=valkey-benchmar pid=48487 scan=384
> 
> echo SC_VISIT > /sys/kernel/debug/sched/features
>     redis-server-29080   [225] .....  2876.257909: sched_cache_scan: comm=redis-server pid=29080 scan=14
>     redis-server-26694   [018] .....  2876.257909: sched_cache_scan: comm=redis-server pid=26694 scan=13
>  valkey-benchmar-48198   [103] .....  2876.257909: sched_cache_scan: comm=valkey-benchmar pid=48198 scan=16
>

SC_VISIT is not in the formal patch, so maybe adjust the comment above to say that this SC_VISIT is a trial
test feature and provide the link. But it is still OK to keep this as it is now.

Tim, may I know if this version looks good to you?

thanks,
Chenyu 
> 
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: Chen Yu <yu.c.chen@intel.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> 
