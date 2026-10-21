Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567150;
	b=WlG7tJcSFukjZbzzIBz5c7nemkgevyKHUu0SDIVrwkeUggDbqkjB7xhxCgRT2olxOGbZ
	 QpijaEBppsLBSNJDx1b9PJnt3z/9Tr7OvcYuUlDH/yy4+nU4GwUpOSgbIQgaTO35j5vhJ
	 1eVWKWgyY7l3OwIhzfbkJFYH6g128zwKqfiSVPy3H89nySWOLAK7abR1HuSVYBs54Wzw1
	 7rBgVr4zQ7ykwolpjkABrReQOq+1HQ9pD5WcVGIMTvtCnud0ZGDfLMYmqqbqIBx6b6Lma
	 D67Q0CQ0w4UW4SjlryGB72Oe3+ZmYXKT/JFJsdicerx4Sjz7RWuQ6macb71wpL3HSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=lZp92o2ypA6mUomnWY8/aTISVyqFvde5Tqae7zZYQp8=;
	b=cRrQaFSYTMTyrg6ONTP1dPxKJmEVrMElM9HLOZHB0wj+EOS33jg6u6qLfzfjEMhwiINB
	 qFFFYT57L0oPF39rlrgd9xAce0nuAhMQ+HxZMkKYBH2y33WUYQo3oWGmrVwEp2EeozVjV
	 l4OtpCuZ32zDQFtwDkkgiaDcJlg1dODqA+VfKFovENmpWGJPy+TyBh5TTzmWz17mJDPDF
	 98To5I8hOy1JTT3E4cQtaTH86+Q4MBerTEyhPqOao7ebTB5DstLVoIP4VasG95Zqkx+qJ
	 rMV7+ztnL+hCmbMpHzz40CHafhNT6vkQ93KC3L8ABEjC0TJgbf+Hj6ILADfbxTSdYbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T27bLdqm;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0670A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0670A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T27bLdqm
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df160bb9cso8117f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792567148; x=1793171948; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZp92o2ypA6mUomnWY8/aTISVyqFvde5Tqae7zZYQp8=;
        b=T27bLdqmIG5OoMtqxzRK7XQelB13l+qAZbEz86BaLPglRfGRQtnafKS11gDv/5llOO
         MPR1n8LaO0yQsmsZc389tz2pzOUW10zBtkt6mUYWDeTIJ7+3nzVvKKjIWC01CZ/NOLjA
         addkf6PCZWaajuQHLHUaqinPOOUyGLYBle8MKQMkXJqazEG/oa7p79xKuK624vlm1do/
         WWDreLZ8o+ndZCSWr/3WiK3/pFGSG3EXW3dlNd5X3C8vLJF1ErphZjkNZPIRC3GTb14s
         b036IC0n+ecv65vFyKeqChULoVKR5m2FgZfPcCWoF99228CqkLUWXi5vWYmJvGqTSODM
         P52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567148; x=1793171948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lZp92o2ypA6mUomnWY8/aTISVyqFvde5Tqae7zZYQp8=;
        b=k4KUxNeXB2uBV3O5oaiKCLOoGKgD59IH+B+qw2HiZXT64SQQm2/Sah8hIvPz2vL1aA
         Ki51i9F36YFDfRzP9XxqFQ/nV4nSn8gMu4mwLgvaeqj0nPVplVs6m8Bb0nKNOArF5fwY
         enAyzdP0OomaBTvewuLAy/WyB0DkTHe/GLTjDThycGZzZbaaAdxyjsPI8lm+Dy9Tr530
         C4F4BlSJe+uVewOMThasFLXWV0/fGqc1pWD1Edut0foCCOP5195mnNQfFf+35BwNXBw+
         JYfoRNTHnUmZcU9ynqVzsC5XwLg2SXzvgntuIAAvQUANBGDgDxyJQMvk1p15TYFIW8hi
         xfDA==
X-Forwarded-Encrypted: i=1; AKwUvBxKyRAOgwdiExEXlP+8Sf3drO7bfeYsxzQpQZ/msQ7x3zALRD98Uti4eW6cF7fkMe94b4dG5Nm7VV3b9MQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIybrE6yl5GScfwd1Dz2G9w58vFPOfKMvoBeGs/SAQAOK7nrT0C
	b6IosCEtJV4XEjpPJzBQlmpXG3zaTOySovNKce4AJfidK9Eem7smxjbA
X-Gm-Gg: AYBFou0D0dFPQTq/mcs41t5FtxG8x/Hwoe6LGWIRQbvGF/Sx63doisKnvYD1JPs5kb8
	CKolckZJ3oDUg4psw2gB+esQGQk0inBt29o3TzUbz9lkqLIqbaTiO7mNSyeYKItUFLPx4vezkrC
	Fe6X4l2dm7a0UH6xBGuPsfcpN1c4e14/KImMGe6efRQuOVmcYt2zfZHFr2MoOaBBe08PE4yxRSG
	QfXDXhDCa5NnBLMhzgvOsG90xcao+7BCykfaCTG/hpgSOiGv4bncOtxSKYY3RyUWth+nMPPCRWE
	G6XNyDkKOejuGkvUN8tt24Z/ziaq3ZMC02cUb7mwkeFW1rW7ecdnK4K5zm1PPgmMgRVw2BiZFQg
	5V7okEwTt8uEAQuNn+uNFTr3CwW67lR5FZoKywNNoZtwlgvN6RVHHsgWKrvHlSjBRwFYIsthQ8D
	to5F/9nTwEaxbkrWeXtQ+Q7QNmVjFXA1HMdtFpriwVIwXPyoZWtVYnWXFxINItnNxK98x4Mg+Es
	bnXx2UU+zNt0jf1VgQ3TcyNg9D16oWH5wE4nvHJTel70Xlap/bQwM3JwbjG1EGSqMM8aUPvSTDk
	JHap31o=
X-Received: by 2002:a05:6000:4a08:b0:48a:f4c1:4301 with SMTP id ffacd0b85a97d-48e264df908mr1913032f8f.6.1792567148094;
        Wed, 21 Oct 2026 00:19:08 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f15esm3985576f8f.20.2026.10.21.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:19:07 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:19:04 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	jakub@okonski.org, longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, cgroups@vger.kernel.org, jstultz@google.com, qyousef@layalina.io
Subject: Re: [PATCH v2] sched/eevdf: Fix sched idle task group preemption
Message-ID: <athWto0oZJvFzJ-w@scheduler.schedules>
References: <20261019182622.1584454-1-vincent.guittot@linaro.org>
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
In-Reply-To: <20261019182622.1584454-1-vincent.guittot@linaro.org>

On Mon, Oct 19, 2026 at 08:26:22PM +0200, Vincent Guittot wrote:
> Even with flat hierarchy which puts all runnable tasks in the same cfs rq,
> we need to parse the hierarchy to check for sched_idle task group.
> 
> Reported-by: Jakub Okoński <jakub@okonski.org>
> Link: https://lore.kernel.org/all/58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org/
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
> 
> Changes since v1:
> - fix prototype and cleanup unsued variable
> 
>  kernel/sched/fair.c | 82 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 69 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0f2364479f9d..27ce3eb467a0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -433,6 +433,38 @@ static inline struct sched_entity *parent_entity(const struct sched_entity *se)
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

So in a hierarchy like:

    ROOT
     /\
    /  \
   /    \
  GA    GB
   |    /\
   V   /  \
  TA  GC   GD
      |    |
      V    V
      TB   TC

Where GA is idle, GB is not, GC is idle and GD is not.

1. TA == se & TB == pse:
pse_depth > se_depth is true, so we goto GC. Now pse = GC.
Then we enter !is_same_group() block where we go up one more
time, so now se is GA, and pse is GB.


>  static int tg_is_idle(struct task_group *tg)
>  {
>  	return tg->idle > 0;
> @@ -476,6 +508,11 @@ static inline struct sched_entity *parent_entity(struct sched_entity *se)
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
> @@ -10129,7 +10166,35 @@ preempt_sync(struct rq *rq, int wake_flags,
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
> +	find_matching_se(&cse, &pse);
> +	WARN_ON_ONCE(!pse);
> +
> +	cse_is_idle = se_is_idle(cse);
> +	pse_is_idle = se_is_idle(pse);
> +
> +	/*
> +	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> +	 * in the inverse case).
> +	 */
> +	if (cse_is_idle && !pse_is_idle)
> +		return PREEMPT_WAKEUP_RESCHED;
> +
> +	if (cse_is_idle != pse_is_idle)
> +		return PREEMPT_WAKEUP_NONE;
> +
> +	return PREEMPT_WAKEUP_PICK;
> +}
> +
> +/*


2. In here, cse_is_idle is true, while pse_is_idle is false.
So we return PREEMPT_WAKEUP_RESCHED. If these are inversed,
we return PREEMPT_WAKEUP_NONE. If they are equal, we return
PREEMPT_WAKEUP_PICK.


> + * Preempt the current task with a newly woken task if needed.
>   */
>  static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_flags)
>  {
> @@ -10137,7 +10202,6 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
>  	struct task_struct *donor = rq->donor;
>  	struct sched_entity *nse, *se = &donor->se, *pse = &p->se;
>  	struct cfs_rq *cfs_rq = &rq->cfs;
> -	int cse_is_idle, pse_is_idle;
>  
>  	/*
>  	 * XXX Getting preempted by higher class, try and find idle CPU?
> @@ -10174,22 +10238,14 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
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
> -- 
> 2.53.0
> 

This only changes where we look, not what we do
with the results. AFAICT. I added my review notes too. They are not
essential but I still did wanted to add them IDK why tho.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Thanks,

Kayra
