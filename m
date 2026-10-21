Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586127;
	b=NUBxhYh7DtrlpP/VzZB/tIbBO5Z7X5UpAamGGjD1NIIKt+G7y6M0qbZHLyKx/FoR0e3a
	 4j/i5hZQagwW06eASHKetQys3cu7uIGHqc+Njg8V8tJjgjL71W3Mh0r2rFl5xhXnXgY4/
	 VnXmEyW/Knm/wUMHplqfa6W77SBSDKzkrLcaLUBEdzsrzbYWIaiuvvHo5sUiyswBHAQUc
	 YpNnrNFQkMKf53/NFaBcBbp1eZLfltnP19RDPwY9b9sxCyW36s0CSPOc+jv35ycQx7+yx
	 APUGYGPlISO23BQqOVRMXtZZFElkvjw99ofpWhewwFqMRjubkyfR60cz8iLGzza+KTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586127;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FZ92/3fa7i0zOG1rhojrAcX/B7YwizpmOZtuSXJxNsM=;
	b=LPHzWOM3F9QMsfU4u07qHNcBKmj8fhVGN85x6B8V2fgZ2XDhyPqAGeMI1kFwNy+POEXG
	 ly8wgRCLlS/mKDNvl41xOOSSyV2omQp8H2c8YjWfU7xl9GzlhNmgN0Cm3eaIoytij7geQ
	 AT9IQoZ0ZcaHTALEPQ2G5WzUl5DDLHRge8T+Bp8DDCxLxSddm2kr+bSthYK3W5ts3lucO
	 D4BdYN4JYG8gM8UORKVZajTimyHF4lJlSU2qNoAJAlMqqqbSiJpn0wKqMsXH7bBW7qkOt
	 qjuZ2+IlOdPZIYe27p1Ao41Viiv8ZRhICB6n0G4zTmFcScjAPfMnP4YfWKSMcyHKyfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b="PpTDh/Kb";
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0EF60A6F5F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0EF60A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PpTDh/Kb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FZ92/3fa7i0zOG1rhojrAcX/B7YwizpmOZtuSXJxNsM=; b=PpTDh/KbmdeC8aJ51VRMfbwb8k
	0IgH323c2PUx6RhRBXd2j3UgF0hftaLWI1zTdMD/A/9QS1h4doVhbZC0EnBQm19zZX7v8YrfJIzhm
	owg105ELnlUV1h6ODOX4el+VCavuBsNzylXJnLAkEht8hyEc1Bc9L6Gwu2xFRqUh5zI9tZ5rmgwmT
	GNos0jHx8NefE5a4F6LvlmyWKHsyIf8K/UBMJ56DgTU0Um6PEIoF2tkE0w2awa7TsteT5hE28jBFT
	gytRkfcbo6DzBvRZpffyoQ4OKId3DLE1sJI5gUP6txiTBlmyJQGWDrMSBkOzvpDzCr6fK2TtTP4EB
	5tcmI/Pg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVXD-00000009BfG-2Yq4;
	Wed, 21 Oct 2026 12:35:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B134D300720; Wed, 21 Oct 2026 14:35:10 +0200 (CEST)
Date: Wed, 21 Oct 2026 14:35:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, "Li Wang (Hieco)" <li.wang@linux.dev>
Subject: Re: [RFC PATCH 2/6] sched/fair: Add is_smt_buddy_run() to skip SMT
 domain
Message-ID: <20261021123510.GH2823843@noisy.programming.kicks-ass.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
 <20261020083746.37068-3-likunyu@open-hieco.net>
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
In-Reply-To: <20261020083746.37068-3-likunyu@open-hieco.net>

On Tue, Oct 20, 2026 at 04:37:42PM +0800, Li kunyu wrote:
> @@ -14375,7 +14390,8 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
>  
>  		interval = get_sd_balance_interval(sd, busy);
>  		if (time_after_eq(jiffies, sd->last_balance + interval)) {
> -			if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
> +			if (!is_smt_buddy_run(sd, is_smt_move_task) &&
> +				sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {

Same horrific indenting fail. Surely you've read surrounding code?

>  				/*
>  				 * The LBF_DST_PINNED logic could have changed
>  				 * env->dst_cpu, so we can't know our idle
> -- 
> 2.47.3
> 
