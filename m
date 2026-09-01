Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244393E7BB2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257787; cv=none; b=Qks5Gy3d8yfyYXaZJVu09kZnPGNiaGS+e4urBg7GdQxQCFIxRNaC7+QPRzczySuIzJw4UtbvdbioQr4RnjPmWUB6OBHtRUwoxe3yHZcvJHbVgQEeUMPcQxHYQhbI0IzCO3yFD59Gv1Kv+comSCjJ8Q1pFmsED1McabBTh5+KAXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257787; c=relaxed/simple;
	bh=5bpnmQ86mvZe2UIseHzHxlIdzv5S+FgF5FbM99+JTlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTgC5R/VSapLn++msCbBZWII0Bf6XMzURtBMUgR8H3rXUQVYenPDCacyRNkv8lBxVdO4Be/H4yuEEQP1HYWu5UyFhutn27LP+Atw1PQicdzsw0k1ubeN8cmERYQzuk59nWvAjL2QkiI0AHxyixCRIG98GH375RvUi2/+mwlDj7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vGcnOMDe; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vGcnOMDe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G5jvN6YRvxNquzzcBmcxTrfd9PTx/7jSkn0g8m6DHYo=; b=vGcnOMDeA3NpwZyI1OsXCeZXPD
	rOfAwAo5TklKxNAGwRANCSJUYSdbjsuPNbF3xxfcm4XNJwR1Zmrbn9yiGeUWi7cZjMUhv5sf6hjnZ
	zwjVDHxOIvRHYhLJSdoh99OoJjzu04iznqIo68Ep0cxDHEjSmUaD/GlZIN6xIoTnHAiDcdamXmlC7
	9A9YmBri73tuNPBoTiegfLhiSw8YUT4MM4Cp9RQem3OvXLThWKFcYjYQSZ/ALuk+zJ0rUHLJZ++Ao
	a1m4hITAhkPrRCLgBXpIORnpcoQRPOQehmH4x7HwcRnrwuowVFONrT33c+5EtOj8kpWouERO1EXQu
	PxjsUK/Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LXD-00000004vHy-3aGj;
	Tue, 01 Sep 2026 10:16:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1AC9430031E; Tue, 01 Sep 2026 12:16:07 +0200 (CEST)
Date: Tue, 1 Sep 2026 12:16:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jianyong Wu <wujianyong@hygon.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, jianyong.wu@outlook.com, zhongyuan@hygon.cn,
	huangsj@hygon.cn, wangfengyu@hygon.cn, yingzhiwei@hygon.cn,
	justin.he@arm.com
Subject: Re: [RFC PATCH v2 12/23] sched/cache: Introduce rq affinity gain
 calculation
Message-ID: <20260901101607.GG776954@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-13-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-13-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:05PM +0800, Jianyong Wu wrote:

> +static int get_affi_llcs(struct sched_domain *sd, int src_llc, int dst_llc,
> +			 int *affi_llcs, int *affi)
> +{

> +			if (src_llc > dst_llc) {
> +				affi[j] = clamp(src_llc - dst_llc, 1, 1024);
> +				affi_llcs[j++] = i;
> +			}

> +	return j;
> +}
> +
> +static int get_affi_numas(int src_node, int dst_node, int *affi_nodes, int *affi)
> +{

> +		if (src_dist > dst_dist) {
> +			affi[j] = clamp(src_dist - dst_dist, 4, 1024);
> +			affi_nodes[j++] = node;
> +		}

> +	return j;
> +}
> +
> +static int calc_affinity_numa_score(struct sched_domain *sd, int src_cpu, int dst_cpu,
> +			int *affi_node, int *affi, int *last_node, int *num)
> +{
> +	int src_node, dst_node, score = 0;
> +
> +	src_node = cpu_to_node(src_cpu);
> +	dst_node = cpu_to_node(dst_cpu);
> +	if (src_node != *last_node) {
> +		*last_node = src_node;
> +		memset(affi_node, 0, (max_lid + 1) * sizeof(int));
> +		memset(affi, 0, (max_lid + 1) * sizeof(int));

This and..

> +		*num = get_affi_numas(src_node, dst_node, affi_node, affi);
> +	}
> +
> +	for (int i = 0; i < *num; i++) {
> +		if ((unsigned int)affi_node[i] < nr_node_ids)
> +			score += sd->numa_counts[affi_node[i]] * affi[i];
> +	}
> +
> +	return score;
> +}
> +
> +static int calc_affinity_llc_score(struct sched_domain *sd_cur, struct sched_domain *sd,
> +			int src_cpu, int dst_cpu, int *affi_llc,
> +			int *affi, int *last_llc, int *num)
> +{
> +	int src_llc, dst_llc, score = 0;
> +
> +	src_llc = llc_id(src_cpu);
> +	dst_llc = llc_id(dst_cpu);
> +
> +	if (src_llc != *last_llc) {
> +		*last_llc = src_llc;
> +		memset(affi_llc, 0, (max_lid + 1) * sizeof(int));
> +		memset(affi, 0, (max_lid + 1) * sizeof(int));

... this. Why do we need the memset()? AFAICT the get_affi_*() functions
use direct assignment and the sum is limited to the number returned.

> +		*num = get_affi_llcs(sd_cur, src_llc, dst_llc, affi_llc, affi);
> +	}
> +
> +	for (int i = 0; i < *num; i++) {
> +		if ((unsigned int)affi_llc[i] < sd->llc_max)
> +			score += sd->llc_counts[affi_llc[i]] * affi[i];
> +	}
> +
> +	return score;
> +}
