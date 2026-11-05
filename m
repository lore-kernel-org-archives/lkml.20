Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909449;
	b=u2ynnYsxNzt1tZB+DZ7MUewYdogVFX6SOHur47KZ66ycb/BTp9EKvJzw2j3VDIFdkMrl
	 2lDyWESuD8Dj4szwG8YZKyBOfOqxrZkr/quu1D4zOZOvBSVlf4uOhUghxswkN1HafTWVb
	 XSZAyffk89SfTR1VCF+NVMROBGv+Jb62JxphB/cOLKlmFkYeaU64q+F8j+KbXO4b31OIm
	 /F8Pzn483YCtPiMJE7WyeBmB0IseuAQ8bPvuqhen+XbqxvVL1rTZFYI64jOkfETaO1doL
	 NZwVAFYHsDGPcafOJG7t0LLorSZg4HCr+qz9CBuxBmSBUzbjUSZlpM/Cgb1E3ldO8xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=e5AWdxzbJMw6T/xOPDsFVSuf9MCy8wiXRWUE6+PSEmg=;
	b=C3amLfe8FSrWOjRX3/qE4uQGnx9BbtnlISPEjGGdCYQkBlTNX16FeApkxtY9AuuMV26q
	 /UbknPfcfBIOz0Wo4G0Px4JkHmAr4SPD2NxMOg7LRFanvhYdm2UI2Esr2b3NeRU4AOWWu
	 kdxdsgYJeJ5nkTv2x3pKX4qSTO4rAfDT8IQwWgJU8M05jfmYExXIxi+xPieaUAAKnmj/t
	 G2CZwJXUC3rqb1TKVY/GWzvVTtN3h8PDcYTAscBkC7fMqS3PTqT0cJ3sYRo9K8IRZ19E1
	 uzcHn9M1K/qzmYDSmL7nnr1Zu9oFOBLzQb6UsTeFYCG0z0K4w2Q4+GmtpR+HPTaMdMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G/xENCql";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CF1606D818
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CF1606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/xENCql
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so81562f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909447; x=1794514247; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5AWdxzbJMw6T/xOPDsFVSuf9MCy8wiXRWUE6+PSEmg=;
        b=G/xENCql0i0MH177L+iR8lRAlMbSZZd3kA+/Bt5sVFWR2rQiTUd8oXH2eapnrowkag
         UufhvMCQQxH8X/IlLMo/nYIB2cmrD3IVj1FCb/uEePQyfBFB3QQmhx9MTMndL+koCUDC
         w5Ar9KCT3mUw7HqkBC7o9UwaIak6PX6VmTE/6M1/M+g5RH2IsYO1OvE/haalKAMAmv4Y
         +3Qs8F1rwiMLC7aU2npOqfVSAHYxw0vv/4zmXKN9WfbJWt0A2LgPKGdHDbplTsAmLJlj
         jty2ECBDJ1xM3NHMqeHD8RATKuASU3EEKDJGwTKhwQ+NGaQVjBYFUYB92cRlMbQv/8iZ
         VqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909447; x=1794514247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e5AWdxzbJMw6T/xOPDsFVSuf9MCy8wiXRWUE6+PSEmg=;
        b=yTdzP/aw/mkWD0qlk5HpwUjdxwApsPQHZpWc06jb7al+f8fYENFPMj8kdW3YKjkpy5
         DFc5kLTD5eccPROqX+SBiuwToFvNrpqWu6D6giVMz/vIsX0WskJwjOSDZX/JnL2a3seu
         6IeYBtxXK4KvsMZxgpfiLCYt24LSgAqxW5LV2isfmOU2TnBl0yV58PDuQ0t1/iz6Hn5Y
         IxJdqa3iGfRRLnz8wJJIyOmrhxL+QEBRQc79wNZIXyCYxVTkWG1u0JM0w7Qst9sl/1Y3
         x7JTj05T/VfuaKmIB1pl+c/znhZxmKzMgKYVXs07iR22eVEl5ouVmgWTsh9cVQMKS+u7
         +79w==
X-Forwarded-Encrypted: i=1; AKwUvBzzbpgF1dXg1iBX9H5iOhjlHwFfcAvq91GtTxl9xIfRVdzkt+IQWBFcMvBB8UnLbSt6QS+stXoOInozqtw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jopnfkb0Fv9cmazQoMyKGY7Ed8lMwQChXhcMB2jtq4Rsam0Hm
	2ZNp2TwTiPRQ7lBjzliedIYtYoI4/g2DcP+U0DAf5Ew7uAaVDmSprhwi
X-Gm-Gg: AYBFou0MNR7K6ScjzPoTzYzKil9v85BD37I6A1AJ6knxlHGni9R0iUVGeKYXvXVPcoe
	skPkjA7eUhcll2c1DGJlXm4YNi6fWaz5DQpWKw114MKtAMzNRxI55n68zCAzZo2IFqPtw0vKgD7
	HxEnFWKd/b96EOXZxT+Ya1GEcdUMfap9mprIo15f6KM1VmEQjoBKU26eoqOJJYkJX8WhKntEkSD
	fJ74Aa23gxSXAKVNj1O88HmOTmpeS5klGvxwvPKNlREGh1Ffs/zPlf3ES6kw2+RTxJp9w6IN8wM
	crK3lyxFbHWBODMySylQKPOmtW/TNBjP1k0K2L9chhsESm9W+9MIIC5wT8Y0cXSH7snH66RhwzF
	X9Tshf28QckmZ3YkP7Sf8yF01vcZZlloyKNVE6oLddNtMlhDRMOYUAS8tfAw+BxqquZ+KYt/8Wn
	humbcz3K/ikoye/nFdoOLSazTukKGCSUqyom3yGLPGY5sjCLnIKYhfzklGEr3tNZHFbZtDppTHU
	1EzeNEYoK0L0rKNnqoEHQkEUNl4c9wd0eVtzXQzbRQOhytgm86/zOXVNh0H92J0Ug7xAHnXnMUF
	LJQ+9j+p0Bu/yQ5dYcoold32pbwh9985YxHb9Y9MSl1szFQIpyk=
X-Received: by 2002:a05:6000:64c:b0:491:1653:8242 with SMTP id ffacd0b85a97d-492821c59f1mr813575f8f.6.1793909447267;
        Thu, 05 Nov 2026 12:10:47 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8734sm12322507f8f.20.2026.11.05.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:10:46 -0800 (PST)
Date: Thu, 5 Nov 2026 23:10:43 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group
 preemption
Message-ID: <auzW7Y9T4dwxa0DS@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.765325702@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105170157.765325702@infradead.org>

On Thu, Nov 05, 2026 at 05:55:28PM +0100, Peter Zijlstra wrote:
> From: Vincent Guittot <vincent.guittot@linaro.org>
> 
> Even with flat hierarchy which puts all runnable tasks in the same cfs rq,
> we need to parse the hierarchy to check for sched_idle task group.
> 
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Reported-by: Jakub Okoński <jakub@okonski.org>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lore.kernel.org/all/58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org/
> Link: https://patch.msgid.link/20261019182622.1584454-1-vincent.guittot@linaro.org
> ---
> 
> Changes since v1:
> - fix prototype and cleanup unsued variable
> 
>  kernel/sched/fair.c |   87 ++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 74 insertions(+), 13 deletions(-)
> 
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -433,6 +433,38 @@ static inline struct sched_entity *paren
>  	return se->parent;
>  }
>  
> +static void
> +find_matching_se(struct sched_entity **se, struct sched_entity **pse)
> +{
> +	int se_depth, pse_depth;
> +
> +	/*
> +	 * preemption test can be made between sibling entities who are in the
> +	 * same cfs_rq i.e who have a common parent. Walk up the hierarchy of
> +	 * both tasks until we find their ancestors who are siblings of common
> +	 * parent.
> +	 */
> +
> +	/* First walk up until both entities are at same depth */
> +	se_depth = (*se)->depth;
> +	pse_depth = (*pse)->depth;
> +
> +	while (se_depth > pse_depth) {
> +		se_depth--;
> +		*se = parent_entity(*se);
> +	}
> +
> +	while (pse_depth > se_depth) {
> +		pse_depth--;
> +		*pse = parent_entity(*pse);
> +	}
> +
> +	while (!is_same_group(*se, *pse)) {
> +		*se = parent_entity(*se);
> +		*pse = parent_entity(*pse);
> +	}
> +}
> +
>  static int tg_is_idle(struct task_group *tg)
>  {
>  	return tg->idle > 0;
> @@ -476,6 +508,11 @@ static inline struct sched_entity *paren
>  	return NULL;
>  }
>  
> +static inline void
> +find_matching_se(struct sched_entity **se, struct sched_entity **pse)
> +{
> +}
> +
>  static inline int tg_is_idle(struct task_group *tg)
>  {
>  	return 0;
> @@ -10130,7 +10167,40 @@ preempt_sync(struct rq *rq, int wake_fla
>  }
>  
>  /*
> - * Preempt the current task with a newly woken task if needed:
> + * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> + * in the inverse case).
> + */
> +static inline enum preempt_wakeup_action
> +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity *pse)
> +{
> +	int cse_is_idle, pse_is_idle;
> +
> +	cse_is_idle = se_is_idle(cse);
> +	pse_is_idle = se_is_idle(pse);
> +
> +	if (cse_is_idle || pse_is_idle) {

We pass tasks to wakeup_preempt_sched_idle() (below) so this
se_is_idle() would just look to policy.

So even if they are in a idle group, if they don't have idle policy
themselves it just returns false.


Or am I getting something wrong?


> +		find_matching_se(&cse, &pse);
> +		WARN_ON_ONCE(!pse);
> +
> +		cse_is_idle = se_is_idle(cse);
> +		pse_is_idle = se_is_idle(pse);


Look here:

    ROOT
      |
     GA*
     /\
    /  \
   GB  GC*
   |    |
   TA   TB

Normally in the old code if TB is waking and TA is running we wouldn't
preempt TA. But because se_is_idle() returns true if idle is bigger than
0, both GB and GC is considered the same (if my other issue is true,
walk doesn't even starts so we don't come even come here)

Is this knowingly like this?

> +
> +		/*
> +		 * Preempt an idle entity in favor of a non-idle entity (and
> +		 * don't preempt in the inverse case).
> +		 */
> +		if (cse_is_idle && !pse_is_idle)
> +			return PREEMPT_WAKEUP_RESCHED;
> +
> +		if (cse_is_idle != pse_is_idle)
> +			return PREEMPT_WAKEUP_NONE;
> +	}
> +
> +	return PREEMPT_WAKEUP_PICK;
> +}
> +
> +/*
> + * Preempt the current task with a newly woken task if needed.
>   */
>  static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_flags)
>  {
> @@ -10138,7 +10208,6 @@ static void wakeup_preempt_fair(struct r
>  	struct task_struct *donor = rq->donor;
>  	struct sched_entity *nse, *se = &donor->se, *pse = &p->se;
>  	struct cfs_rq *cfs_rq = &rq->cfs;
> -	int cse_is_idle, pse_is_idle;
>  
>  	/*
>  	 * XXX Getting preempted by higher class, try and find idle CPU?
> @@ -10175,22 +10244,14 @@ static void wakeup_preempt_fair(struct r
>  	if (!sched_feat(WAKEUP_PREEMPTION))
>  		return;
>  
> -	WARN_ON_ONCE(!pse);
> -
> -	cse_is_idle = se_is_idle(se);
> -	pse_is_idle = se_is_idle(pse);
> +	preempt_action = wakeup_preempt_sched_idle(se, pse);
>  
> -	nse = se;
> -	/*
> -	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> -	 * in the inverse case).
> -	 */
> -	if (cse_is_idle && !pse_is_idle)
> +	if (preempt_action == PREEMPT_WAKEUP_RESCHED)
>  		goto preempt;
>  
>  	update_curr_fair(rq);
>  
> -	if (cse_is_idle != pse_is_idle)
> +	if (preempt_action == PREEMPT_WAKEUP_NONE)
>  		goto update;
>  
>  	/*
> 
> 


Cheers,

Kayra
