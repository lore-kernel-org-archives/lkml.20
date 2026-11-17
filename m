Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917983;
	b=gTvQjD+wWBn96LPgf2ZBCQ0bbZ/qsMVCy/f8Jcol5x33fC1sjphIssnLNFh+Lhc6WqGf
	 3zTTT0vz4wCTcrGbpNz5dTTeJqzF9EmUs5XCv7vXypxMb9T1YEUsBsutOL6f4s15Ynl1j
	 a2auEcjb2lBHtDVBODZf8ka21l3/QJrD6ErAX/OmR8x6jmrtn5itoSAU03gC9ovNC7n+V
	 noFiI2JB/aLP7tKsYuADY994UhibeSIPm+PFxVpH+yK+0xfY57ID5HhOaBNJ8rIf6nZE/
	 U4OHRP9ZLL5gNjgEZmUO1vdbqNO47Xj2NqIA4pc+YCZgI3xEk7JKmD/p9j+GH0i1N9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917983;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kr69d65c6Rj/Z6BWCpKpUcKYO8nWiagPFI029c4s8h8=;
	b=eif1PW6PLmkaaHXSvf/6bDNtfSxTZL3Ht4VV7zLLd84YzT3rSdL1ilq9e3Udew2U8Sv7
	 1w7dUcQmVipJ7WOYiH6/9xqBgt5cMYZ+gEozMNhaJYtuiLkWVxxzpVLVHVFqAYQF0ekwW
	 UqfT2cLGRG/vkwxDHIg0XEExQq2/ekfexTNDlyM4komOE/tyRMVV2Ag/cny9+GLAcNlaQ
	 KjWcU6xTrig0Yk4IEGk8XrLz0daES6NYgSTHJVhdlwsS2knIMCfHY+Mbc6nJXpdUibNwQ
	 QV87i7+/RfS3i/coQkkM11oyynrigOyRtPaU18JDKUI/HBDkNWUA1aJkTw5Rn3sFA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pCtHdhMr;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B07606A8A5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B07606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pCtHdhMr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aYHlZGaTyhmputaahKiWpOi8WQ5Y9Cn60xhnkDJGIZ4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794917979; v=1; x=1795522779;
 b=pCtHdhMr4yTk87YwbMVqWADuiTr0suTvGC80w3cdHYWZ1DUC7I1UIIGMYr5C+TsFnSMlhgqD
 RBCavWBD9md5upoHfnEakAI0p3FSppJWmw7epi6MyyKNnvzbfuawro0uRcRvjkAr4j6Oo5idU7G
 sya/2eWE/JAcwUiUsir0HD8s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a49188846ff3403;
	Tue, 17 Nov 2026 12:19:38 +0000
X-Mizu-Trace-ID: 1a49188846ff3403
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 20:20:48 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	Jirka Hladky <jhladky@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Chen, Yu C" <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Jianyong Wu <jianyong.wu@outlook.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Tingyin Duan <tingyin.duan@gmail.com>,
	Vern Hao <vernhao@tencent.com>, Vern Hao <haoxing990@gmail.com>,
	Len Brown <len.brown@intel.com>, Aubrey Li <aubrey.li@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>, Chen Yu <yu.chen.surf@gmail.com>,
	Adam Li <adamli@os.amperecomputing.com>,
	Aaron Lu <ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>,
	Josh Don <joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Libo Chen <libchen@purestorage.com>, linux-kernel@vger.kernel.org,
	"Luck, Tony" <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Philip Auld <pauld@redhat.com>, Joe Mario <jmario@redhat.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
Message-ID: <avxGoEVvohbK0nUS@three-body>
References: <339bb2636c7306e17540268a9295a8e673b92804.1775065312.git.tim.c.chen@linux.intel.com>
 <20260409124642.GC3126523@noisy.programming.kicks-ass.net>
 <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
 <avqYbuJPHo4zLDOd@three-body>
 <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
 <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>
 <avxDmPs4rs39NC9O@three-body>
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
In-Reply-To: <avxDmPs4rs39NC9O@three-body>

On Tue, Nov 17, 2026 at 08:07:52PM +0800, Chen Yu wrote:
>  
>  		if (!ng) {
> @@ -4210,6 +4178,15 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
>  	p->numa_faults[task_faults_idx(NUMA_MEMBUF, mem_node, priv)] += pages;
>  	p->numa_faults[task_faults_idx(NUMA_CPUBUF, cpu_node, priv)] += pages;
>  	p->numa_faults_locality[local] += pages;
> +
> +#ifdef CONFIG_SCHED_CACHE
> +	scoped_guard(rcu) {
> +		struct sched_cache_group *grp = rcu_dereference(p->sched_cache_grp);
> +
> +		if (grp)
> +			atomic_long_add(pages, &grp->footprint_cur);
> +	}
> +#endif

I forgot the code from Tim that firstly add the footprint into per task buffer total_footprint,
we should add back the following:

+static void sched_cache_footprint_accum(struct task_struct *p, int pages)
+{
+	p->total_footprint += pages;
+
+	if (p->total_footprint >= SCHED_CACHE_FP_THRESHOLD)
+		sched_cache_footprint_flush(p);
+}
...


thanks,
Chenyu
