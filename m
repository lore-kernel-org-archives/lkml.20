Received: from mail-wr2-f19.google.com (mail-wr2-f19.google.com [74.125.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DC48F039
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873176; cv=none; b=OZZaiYk3UQJMbw+/9p2bYNZ8rZ/6fNnCzdxHAd3KkeXvJsFG2Go9Fgtac9IvTFTyqXe+Jx4y8NFCZMG9Vf3xb8FLzdRbrZY6+gLHlKfd+KDpJhmW7//1rGs5dPtXHui/mbCcynGibo+7OZtyflic/RfVfgW05Higi+88LXn95Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873176; c=relaxed/simple;
	bh=euhlrsmrBeywJCcUP+ix6P+4B+p1oUelXrKdwoX9upI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrS4MAFdHs5QhzhaFYOgqC5SiVcmz4F6Vqe/6yoOyYMno0rCCZqEDEKqjquzzTmTyH6pYo1Edix8nCnWesIfTo3oQkpEsa1mqllPhF77JmwDx4xQGEL7UO93+XojHuFSgS8ZJeglqIs7YvfNfeV7bkcrWgxd2VKBq56dv9R29As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPM+QSTA; arc=none smtp.client-ip=74.125.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPM+QSTA"
Received: by mail-wr2-f19.google.com with SMTP id ffacd0b85a97d-48aff407b13so278637f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873173; x=1791477973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWpCBOQ0cbDOB2ewDUN6GVUTvWM/2vFCZJ4YyNo1DH0=;
        b=HPM+QSTAc0RvG3gmZWQaO+BjjfEV3cvbtkltWGHVwnYaONrArn9t7UJZwL7tEWpWW6
         QA+iXqv6XGe8yodAozOeemB2W76hbAY7bNVtZ6THDIGOacoVeedL9k2+PQ3q46Dc8KST
         HAm+Mu7stxliLE5tVLQt5Cy/Qpgjeg09VH+YL3jnIPbtwVwzhih8AnjMLoYJSscAoMZk
         rP8UQcgpOWVtGsT5n8+UWBsOOfPIw1ZPgKDVyplgk4xDIDGXo0h2EcfXSlhWAajb/ods
         yKWibqstjhfqN8M3LbgZiNe1CzeqsyoV+0k/SoVMttmnld7c7d0hHa6xd+CT4GYK2vFr
         1Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873173; x=1791477973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWpCBOQ0cbDOB2ewDUN6GVUTvWM/2vFCZJ4YyNo1DH0=;
        b=U56zUycOLu/ifYgz/Kt0QU+ZW+nqBN6NUfIyDC5+k055ssqmo58IgL9XCKFNlLp25y
         3toinwxA6x2qezqMVoO4SBefK+SPwYo6r0JO21RKR2c2M2CRtO0spMlfOVlumhRzJRf7
         Li1tZYOdVUqpCuvBUt+h+LyAskBY1xtoi0RbbaXhE6q4OefoTizDJMxcTZgRBxn0/T6Y
         g2GBqy3WHhskcGvVxTzx+gbYq3CaGSy8HgNnn00KxeUcS7CooivPgerIKuplCfecJpHi
         OU0tVVsEo7tcfLp/caHcddAVd6RX9o6FYHW3sugJa0++ZB2vlDrGxx8w2nCcFSVkIKZG
         7Nvg==
X-Forwarded-Encrypted: i=1; AKwUvBw8vXs+vIXSPRQcteDhr1CHTgFqdHQzHawhaVbTZ1iqzhyoPDmviemcHlTU2kaDUcHfiDoYCUFAMF2OnWM=@vger.kernel.org
X-Gm-Message-State: AFuF++k+t72AXUGPuDC4DwQncv71DXlo5cosbQw50qT+ZW9P3YCv1YBu
	CzZwO4OwJB9bZoto/Lt+5FJJj+VAUwBKlHhQILFBfbQ6R3o7u5IzOoxOsrYzfA==
X-Gm-Gg: AYBFou3fm4kde26d/g+ucsptYpZfAHESibJyMADB5SWzukM5COB/Pea51NMsWRu9NWk
	8VOhUAB4xj5qV1GxAYATN2IhGJ3JEC5b3svCLKTWOEfs3xV+hpVOWPmrgw4Hwb0ONKw9hsbG1bs
	Z8k71fcU2xP0WRAUGQi3iT8D7zrh2LF/PgeuOcNmTVAfa/T3VyO0nrCX29YqHl5aXCp3X+ml3Q1
	SyZppW/58r4RtJ281veCfWukzFrMQ2F8lKN+nczEShXKPWiypV5whlcCuHcwCR+gznyd4s8fjbz
	Dx2m8gvgIEgt+TVHVtiYITVCTGVDkD58hkDtjASttYKDIHL5esBqD6a5U5IOX/crBcb5MsCZK7P
	PyDDnfXwi+kxxWs1chpgy0xpH2te+TS7SD4UcZE3RLzL+rKtJ6xiwPU0EGUzBbSREc9dKwPkFEc
	TRohvz8X+89gDemB6CWH2L9q+N2gD0pEJt4br3LGlU3irihNXTL65qkP5BOWzhIhvmo8I4T6EYz
	nF4EKUWkyDMYUXXJCigh5A+Rab0Ku0=
X-Received: by 2002:a05:600c:601:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a02744cc57mr4279555e9.0.1790873172879;
        Thu, 01 Oct 2026 09:46:12 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02783af28sm2231295e9.15.2026.10.01.09.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:46:12 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	sh@gentwo.org,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v2 4/5] sched/eevdf: Keep expired protection expired across reweighting
Date: Thu,  1 Oct 2026 19:46:08 +0300
Message-ID: <20261001164609.244156-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001134016.3881268-5-christian.loehle@arm.com>
References: <20261001134016.3881268-5-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for being a bit late :-(

> @@ -4941,6 +4941,9 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  		se->deadline += avruntime;
>  		se->rel_deadline = 0;
>  		se->vruntime = avruntime - se->vlag;
> +		/* Reweighting must not revive expired slice protection. */
> +		if (curr && !rel_vprot)
> +			se->vprot = se->vruntime;
>  
>  		if (!curr)
 			__enqueue_entity(cfs_rq, se);
> @@ -8204,7 +8207,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  	struct sched_entity *se = &p->se;
>  	struct cfs_rq *cfs_rq = &rq->cfs;
>  	unsigned long weight;
> -	bool curr;
> +	bool curr, expired = false;
>  
>  	if (task_is_throttled(p) && enqueue_throttled_task(p))
>  		return;
> @@ -8237,6 +8240,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  	 * XXX comment on the curr thing
>  	 */
>  	curr = (cfs_rq->curr == se);
> +	if (!curr && task_current_donor(rq, p))
> +		expired = !protect_slice(se);
>   	if (curr)
>  		place_entity(cfs_rq, se, flags);
> 

> @@ -8248,6 +8253,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  	if (!curr) {
>  		reweight_eevdf(cfs_rq, se, weight, false);
>  		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> +		if (expired)
> +			se->vprot = se->vruntime;
>  		__enqueue_entity(cfs_rq, se);
>  	}
>  
> -- 

There are a few thing here:

This (!curr) branch has been removed from tip sched/core, here: https://patch.msgid.link/20260911155449.1249726-1-kayracizmeci@gmail.com
So, heads-up.

Also, when we have alive (or live, as y'all call it, I think it's better this way tho :>) 
protection, and (!expired) reweight_eevdf() doesn't enter the on_rq path and
alive protection is not reweighted. Not tested tho. And I may be getting something wrong.
This is not about this patch tho.

Your commit says "Commit ff38424030f9 ("sched/eevdf: Update
se->vprot in reweight_entity()") subsequently handled live protection,
but left the expired case unchanged." too. So it's gotta change if I'm not missing something.

If I'm not tho that can mean a patch. :-). 

But IDK if that's intentional or not :-(. I think it's not but I'm not sure.

Anyway,

Thanks,

Regards,

Kayra :>


