Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B748B37D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006786; cv=none; b=GzgHZ5rPpiSEy2FwzljCCFPzSf4C8akon78spxQRfRe/e/RpNlyX470hzLrmt0HXgtLNkjK1OPHv5GT2BaE7ujPCwMRjiwJMUnbU7Es6eWvhMZZXdy+fQ3ivVHuBtjzaj92pCuDPSKRMuHPCPawvIQMGbO9xUkT4wZohFWVEghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006786; c=relaxed/simple;
	bh=U7xlfG2wICjxki72R5Z2YM5VyCrTIxhMma2qjAV8gOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjgM+ihxVR5Db/AXVtbLK+P6PNc71i/ARGPOZucER+hScCKE91584xPcTzOWhkQDY5+atMR8RLCD7xoqKba6vZLYgt1aR0MlSiS8oOBkVTsfz7/aL6lPts8DaVj4wh/wja1CDnT5E5C+F1OQCbo2G7hpm4ITuOmjlH7JLJZXCzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=givf5GBs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="givf5GBs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso2276815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790006783; x=1790611583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04+0q8NOgA7VWerovT3AZG3gV7+jiKPwkhqAIOGfAt0=;
        b=givf5GBsB+DPMtrUHYHPw46nIcvnHUOhtNiNTH6Rhi78WG9T4x4NDjUDhUEmRyPuGu
         H2hn+MquFUB3rMLc3zg6Kay2q34cHYqRH08qblfsQHl6zhLXbqN2kyrYdqok2GaEIUgh
         Pe4NCYoWIDBDMqXO1eIIj0dXAR2r3hVX6RpZiR8YkaiRWIe4oGlGQl1myzm+6XzqZWMX
         5B0qqFZTnMXKvbma3Mq+SgEpZROUNBwDRVZqUFrM7l2MAELqIpLPfVLDw9kQziTObVIs
         s23VhnpsU+qntlIaauD/OCwXOHihy1SCFd3E5lSs4zXwPOolOpj8Xbmn9umUmSOL6Itw
         pPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006783; x=1790611583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04+0q8NOgA7VWerovT3AZG3gV7+jiKPwkhqAIOGfAt0=;
        b=SDTy7FWOFKLLc6SoGKIKF7XkojjAJ5zzoLO77azgClOi4P0uj9qUp0Ud+XY0yfOP6W
         I2CLej8Y3JJSFMvbAD6EcBbuQbMcy0WycmGDP01DtHbSh7o5fi2UZbqjhaeJ/650JOKV
         +MDVbBGpT8xxzRh1CnnSkNhTOMRJi1VSn1Z18IMj3QrFOO7Diu/w2H6IoRfzmSaaC2vs
         2JWYZ3McC0Unq/WmnMvtXYqZOC0PE/dEknodBMyRLRy/Pgl/GagAukkFo2WD3ZfARP6k
         cVe8Wrn4Zxb4Fm92IdnG65/EvPuJg6Km0md7V05U3WtKwHZDJzB2pu5sMcOu7+VfRzlu
         Bp5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeaQcwEwY/XQRA3d8FpClh7ERNpCd2cBirOfvV38fWgMly3cL2L2j1xfc2x1jKk3VXlvfcM+0B0sxV4r0=@vger.kernel.org
X-Gm-Message-State: AFuF++lPf2yLZcG4PClQDPL4Rh0muLikoEvJOeC6k5EoCG+/cGVALSH6
	3iUHWsAL8nKJ3DKoCTKmN4dVxYQEq11wbb3tM4R08DSIqV8WCYKPiRCA
X-Gm-Gg: AYBFou1tKwgHmNI1I4wckjpJVDj9jzzD5oDhP/YuH80y2UP1QJ3zoer2r1tZUGjlegg
	WfaS0euKfEjbJRFPk7IQH/60nv0kUcMhm81b6MWnmSqLwHTLlL++vhI9Ol1VHqfOYqHUaYKmfMP
	ZgfqwWaRKIBH60eP/rrxhZnwrjYZyeq/WDxU/nBam4xnaVDdt5poB+lSa7ntUx0tRmAN+7ydVyb
	1JHF2+Z4wX+LF2gPzRsNq0MSu/gkPeq//ZSHyNF4l95/IsrqWtEBjexndW5KxLQSbfKvNBX+6j9
	nOg3DgQDn9iILq67dm0f8zniK+eItEuTYrwy81dYsQNSv8j65XtS/a4QGuduS4h6/jFAEcc/l74
	Y5SiVCboxf+6D36ho54qPagvocI8GnELA+xmQF6g6JniWCbiCBZHhMS2bA/I3Sn3SpmoOm3o+Zm
	NK21kcMQsPC7RQujmClUiqRdO+KpmWO5E4qR0WUyrHeXhyzKN0OQPJzzTvKexiahAGB1kPuDqeN
	wG01uwq0ghIkmFaXhFh
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr171497435e9.2.1790006783013;
        Mon, 21 Sep 2026 09:06:23 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8a636d1sm2228735e9.0.2026.09.21.09.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:06:22 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	qyousef@layalina.io,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [PATCH 5/8] sched/eevdf: Reset lag when waking up on idle cpu
Date: Mon, 21 Sep 2026 19:06:18 +0300
Message-ID: <20260921160619.3418-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-6-vincent.guittot@linaro.org>
References: <20260921152238.3804392-6-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vincent,

> @@ -908,18 +908,25 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  	if (vlag <= 0)
>  		return;
>  
> -	if (flags & ENQUEUE_MIGRATED)
> -		return;
> +	rq = rq_of(cfs_rq);
>  
> -	/* Compute the sleep time */
> -	delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
> -	if (unlikely(delta_exec <= 0))
> -		return;
> +	if (rq->curr == rq->idle) {
> +		/* You can't claim any lag when waking on idle CPU */
> +		vlag = 0;
> +	} else if (!(flags & ENQUEUE_MIGRATED)) {
> +		u64 now = rq_clock_task(rq);
> +		s64 delta_exec;
>  
> -	vlag -= calc_delta_fair(delta_exec, se);
> +		/* Compute the sleep time */
> +		delta_exec = now - se->exec_start;
> +		if (unlikely(delta_exec <= 0))
> +			return;
>  
> -	/* vlag can't become negative while sleeping */
> -	se->vlag = max(0, vlag);
> +		vlag -= calc_delta_fair(delta_exec, se);
> +
> +		/* vlag can't become neg while sleeping */
> +		se->vlag = max(0, vlag);
> +	}
>  }

When if (rq->curr == rq->idle) runs the else if does not. So on that branch
we just set local vlag to 0. I think you wanted to set se->vlag to 0?


Thanks,
Kayra :>
