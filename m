Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103001;
	b=uK002+o0ynJNvWdiAmo9hEMBphPKBvK0z+A3JDiPSsarALCwDRhGioDcPwxUYSz4vrCD
	 5mMFRYog/J1f5rhkCc3P+tcyKtgXZK14CsroK3BTZ5XdZIsLwrXPaPo2pbAcdL/XLW+rP
	 A18XTiU4U1UpveiRRj8NDwlmNxAcxi5TK4wISmGxwgXvDi9A+vhGNw623kHIZBVIZlrcF
	 xi9oHDkxYmCZAVC87KFsxnrLFqVA2vQyeSbCINqetBpEedaI3PxruLPCvdMtsFA6wtvNS
	 OPdNAGWryj35vw20LaxPxz57EE0UJGaqLLEcGK9jqbXrLTr02xwcQbgfbA2gUrsDGLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103001;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iLihQmMIiwpA83j6rJ9nP+JSZLoK6ZWabN1HG4eCIQg=;
	b=SnbBkJw5ybU9ExY4zUGZXuCsJVLRYfrmWdUDnhf9WXFj2m93ZUShM/HlGlLhKKxMon4R
	 cf42YyhQueWXYM4T1DR+KbD4GYX5vdL/EtlcEL/lWW8LYYh00KNbPh5EHZxcYaHYId5p9
	 wItPcbfF4aZ+/wmfTBZVyx/wwG+GSCGUlyNRbGZu4vi0ClabTytfnPUIceK2DjRaIPe7X
	 VEN262ALL1sx+klDQb70xxYCp7X/Q2Nreu0VMg2cCD8rD4rFb311r+NJfaQUCZkEW2HKa
	 eAY189JFClH1HI98cpcLtWE20gbzfznVOG4LiY0AM1Vv/YZ7+BukAV9WxSNPW9rJS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bW3d56zn;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F3F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bW3d56zn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iLihQmMIiwpA83j6rJ9nP+JSZLoK6ZWabN1HG4eCIQg=; b=bW3d56znlmj7V7jnZdXVfBRNUE
	sYar8y4bAwE/CkHni2K2d3apJjJ9OYnjJ0F+g2ApdSQsuo5iKtKPdL0bSUoXOTrjyLvCAn+Lqon+U
	1hp/3V5tcbXZclhdHpcMIix9Ev0B/JXe4OGPzLrIvODiVmEEawcKfuBF1yAxuKYMugNxxCygS+ffx
	XXpVOX7vZRY1H6DxLTBbFShZb7IWt9MwrNJVXxux0g6BwEp4HFszfh3iQmp3CPaviQafq5D5p7cjg
	kUWXSmJW5YJzFEAwFQvMHH6pF0IF86cADVl0YhPJHrDNK6ogrvNTWpghnVZY8Vh3SHMDJ2YurAieg
	436u7/UA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfzu-0000000DPxo-0dit;
	Tue, 27 Oct 2026 12:09:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B08A3300DB9; Tue, 27 Oct 2026 13:09:45 +0100 (CET)
Date: Tue, 27 Oct 2026 13:09:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, albin_yang@163.com,
	albinwyang@tencent.com, bsegall@google.com, chen.yu@linux.dev,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	rostedt@goodmis.org, vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <20261027120945.GN2668564@noisy.programming.kicks-ass.net>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
 <auBEeDRRFKZOGlZA@scheduler.schedules>
 <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>
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
In-Reply-To: <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>

On Tue, Oct 27, 2026 at 03:15:40PM +0530, K Prateek Nayak wrote:
> On 10/27/2026 12:22 PM, Kayra Cizmeci wrote:
> > I think this fixes the issue. BTW I think this should skip curr, no?
> > On a case like this:
> > 
> > C holds M1 in CPU0, D waits that mutex in CPU1. A holds mutex M2 in
> > CPU2. B is the working task on CPU1 but it wants mutex M2 and we enter
> > __schedule(). B gets is_blocked. D gets chosen. We open the rq lock to
> > get D to CPU0. While this happens A drops the mutex and wakes up B.
> > we enter ttwu_runnable() and B is still curr. And we start the timer.
> 
> Good catch that!
> 
> > Or am I MISSSING something?
> 
> I can't believe something like wait time accounting can get this
> complicated! 

:-)

> Anyhow, We can perhaps call sched_info_enqueue() in
> ttwu_runnable() instead of proxy_needs_return() like:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04b62c16fa8c..d5758b78b741 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3956,6 +3956,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  		 * it should preempt the task that is current now.
>  		 */
>  		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
> +		/* Start accounting wait time. */
> +		sched_info_enqueue(rq, p);
>  	}
>  	ttwu_do_wakeup(p);
>  	return 1;

So the normal wakeup path goes through enqueue_task() which gets the
sched_info_enqueue() callback there. But yes, ttwu_runnable() does not
go through that, and needs this additional call.

There is one more site in ttwu() that also doesn't go through
enqueue_task() and that is the p==current thing at the top.
