Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA612DB7B9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147869; cv=none; b=ExzB6SuNuHm3DChv0pfR7nw7VAEzqRL4vdNWdLTfTd7wkAtW9guQxCme7gRp9HXYMcsOFj8K4c/kbiv4y4ekQUIS4XN9HBqVB4GDmbLuxvt4+9rH5OL9qKsmlVBPtEnZ/YmVHWd1Mu/IoG3eoYbrN1j1j5wrDfet8r3lVi4XWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147869; c=relaxed/simple;
	bh=lv3B1TC0Tmll07M/11lori8b61fkI2T0iPmb3HOzYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wn723DmHU3anunWKT0EPmM2i158Ad+NXtrcf2zsRWbBd+N9crZoiqNwb19TStaZG2qUeNHLb5e/FqA/R07tfB7c366acY3Lk5vQPTX1RjpMD36/MRzvszH1NKz6wAzV/KByZlpBq68N024l2zLFGiQBYsnURWJETvAuBCLTSHuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nx0LCpB6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nx0LCpB6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcb1e5f9so850702f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792147865; x=1792752665; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=biMd4sUcSQuV6TQOxo1V3IfADEXSO1VJZjXwSNr9OMQ=;
        b=nx0LCpB65CLbuwG9VxKaH0YrYwZRjV6RFj2tBZg0Zqt5S4ImsaJwFcXAvt+CyQY+vr
         loceG2fbtvNs+lLuTWjgMy/5plocHCYhkbA/Z9FK6Lt4RFfcaZxcDFqpkB97nXM2Y0pJ
         3Jwlexu50YaRQmZoiOpujzEayipuZmvz4RVJMrFoJPtM3jAK0UmX/ZGeqHoBg3rDg/cA
         jL85Fv7cBstx0EI2UWWGwg+1HAsa4piO9SJ3qf8ulY3xSZHAbehVTZcToQjpEd/j5wSe
         BLJUa2+MQr/dvY2FoGVaAcKGBWXsuwlddmFgoMDBqDIGbbP+v9JXziYA3Ei+BBPrCh9e
         uZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147865; x=1792752665;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=biMd4sUcSQuV6TQOxo1V3IfADEXSO1VJZjXwSNr9OMQ=;
        b=cPdn3q5cICeTMGDzDMKRipjuv0T4mElRFeYs8EsEQT96icF9Em9w4zJA63BMiBWPBX
         J0C8q3ENccRpmfMLTOSq5zqE7qT1daLPQnoffUm5NnCnmPEW//0EAsyAE7QfPpZUIjDK
         9+9G3/PlzUM2Jd0Y9a/ki0fvBsjtuoP+z9kxfw8dCBkEL4N+H+W+Z7ac01G+G11f2Drv
         yUCb9jwBty/21BQ5d/ZwSbhPIbSrXIJZTTVsi/PxX4qXz1RLpC3tWihE1tVY9czW2YMR
         Ug2sZsk3vluEAbzHvVCy5gKtzqa/uBnGlThLQjbt2KJco3+9vSWYnwiFHEBntnV7w8gN
         Ekgg==
X-Forwarded-Encrypted: i=1; AKwUvBylt63P0LqODWdmM/xI7rN/TrIR25UCw/QILBFWVfxtWaAwd3f63OX4ft3le6PyY1RK9Gpn0Z+kyGCP9Kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPVVKx4imTZqlCf5e27cpC5c9Y/p7LU5XGBLuFOx3rxSrJ9mv7
	4S6p1GvwaKFIOJcm+QtbXmUjVnAT9Y23B2+08jrqKKYXILatqWhTNePuGfzxpQ==
X-Gm-Gg: AYBFou0UaKxrxxXPeikn/4esbz8sNRG7R2bLOnPOGZ1SyqcBdGMrQCWHEK/RWhLcd6f
	+c4R27QrU4akqw+md5rooh84zpxM8tfvz8uY8Pubk87ZZWfrIRCNRkgCUDe/2GwmS2I9vrfa7O7
	ZQpQMl0JkSj3MBmfoQWX28UBMlqHn+4ZHvdxuYJzJiGBS64uVBBpb2VUv7L8xGBc2ib8aABe4WU
	G+1tlaBDPY1ojCYDAnpRXsmY5FOmYND+8Ofv9R8ONKTYxipoVZyquOfNpj93uEEIjeAlQ4TtiFa
	RSXk+uDpD+d+VnPXryJfF8KBY8hDkx5fk2kqci3Ssw5xabDf/0Ti5Kq2wh4GGjFQBch5z+6UGhn
	jRaSlaha9K+hIys3BugEByz8AQMYHl7xjynHT20tM003IKlHW21bLV885kvfRoaKcKvq1boxrek
	BiPxhpYJFnSRe3qEyYmfgfldOMlQGjiz5BvRtuK3+nIrc2NvWkj6avW11Bm/gG0tgfNXQT8OQST
	icqtci/OahJaDj8VQzg5L9I/w==
X-Received: by 2002:a05:600c:3e19:b0:4a1:c7f3:218e with SMTP id 5b1f17b1804b1-4a1c7f32285mr46083635e9.1.1792147864739;
        Fri, 16 Oct 2026 03:51:04 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm33642745e9.7.2026.10.16.03.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:51:04 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:51:01 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: peterz@infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	christian.loehle@arm.com, elif.topuz@arm.com, linux-kernel@vger.kernel.org, 
	mingo@kernel.org, sh@gentwo.org
Subject: Re: [PATCH v3] sched/eevdf: Fix vprot across reweighting
Message-ID: <atH-Rf-yL7ewRTgD@scheduler.schedules>
References: <20261016084604.17999-1-kayracizmeci@gmail.com>
 <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>
 <atHwIzHeWaw1kXXm@scheduler.schedules>
 <atH8BI9jCf2gqjTb@vingu-cube>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atH8BI9jCf2gqjTb@vingu-cube>

On Fri, Oct 16, 2026 at 12:27:16PM +0200, Vincent Guittot wrote:
> Le vendredi 16 oct. 2026 à 12:45:45 (+0300), Kayra Cizmeci a écrit :


> > >  se != curr so why is this needed?
> > 
> > sched_change_begin() sets .running as task_current_donor(), then if
> > .running is true calls put_prev_task(). put_prev_task_fair() sets
> > cfs_rq->curr to NULL. While the task still is the donor. Then we enter
> > sched_change_end(), we call enqueue_task() with cfs_rq->curr == NULL but
> > the donor is still p. There is set_next_task() call afterwards, but it
> > does not sets protection since its called with SNT_NORMAL.
> 
> okay, but we don't want to spread this all over the code.
> reweight_eevdf/scale_entity is  doing this already.
> 
> The below should do the stuff while keeping the computation in reweight_eevdf:
> 
> ---
>  kernel/sched/fair.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0feec172fd37..c212c6aa9691 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4863,10 +4863,11 @@ rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
>  }
>  
>  static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
> -			   unsigned long weight, bool on_rq)
> +			   unsigned long weight, bool update_vprot)
>  {
>  	bool curr = cfs_rq->curr == se;
>  	bool rel_vprot = false;
> +	bool on_rq = se->on_rq;
>  	u64 avruntime = 0;
>  
>  	if (se->h_load.weight == weight)
> @@ -4878,22 +4879,25 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  		se->deadline -= avruntime;
>  		se->rel_deadline = 1;
>  		if (curr && protect_slice(se)) {
> -			se->vprot -= avruntime;
>  			rel_vprot = true;
>  		}
>  
>  		cfs_rq->h_nr_queued--;
>  		if (!curr)
>  			__dequeue_entity(cfs_rq, se);
> +	} else if (update_vprot) {
> +		avruntime = se->vruntime;
> +		rel_vprot = true;
>  	}
>  
> +	if (rel_vprot)
> +		se->vprot -= avruntime;
> +
>  	rescale_entity(se, weight, rel_vprot);
>  
>  	update_load_set(&se->h_load, weight);
>  
>  	if (on_rq) {
> -		if (rel_vprot)
> -			se->vprot += avruntime;
>  		se->deadline += avruntime;
>  		se->rel_deadline = 0;
>  		se->vruntime = avruntime - se->vlag;
> @@ -4902,6 +4906,12 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  			__enqueue_entity(cfs_rq, se);
>  		cfs_rq->h_nr_queued++;
>  	}
> +
> +	if (rel_vprot)
> +		se->vprot += avruntime;
> +	else if (curr || update_vprot)
> +		se->vprot = se->vruntime;
> +
>  }
>  
>  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
> @@ -4965,7 +4975,7 @@ static void reweight_task_fair(struct rq *rq, struct task_struct *p,
>  	for_each_sched_entity(se)
>  		weight = __calc_prop_weight(cfs_rq_of(se), se, weight);
>  
> -	reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
> +	reweight_eevdf(&rq->cfs, &p->se, weight, false);
>  }
>  
>  static inline int throttled_hierarchy(struct cfs_rq *cfs_rq);
> @@ -8200,7 +8210,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  	weight = enqueue_hierarchy(p, flags);
>  
>  	if (!curr) {
> -		reweight_eevdf(cfs_rq, se, weight, false);
> +		reweight_eevdf(cfs_rq, se, weight, task_current_donor(rq, p));
>  		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
>  		__enqueue_entity(cfs_rq, se);
>  	}

On the old code on_rq was always false. But because enqueue_hierarchy(),
se->on_rq is always true. So this just goes to the other path in
reweight_eevdf().

Also, vruntime can move in place_entity() too.

Thanks!
Kayra
