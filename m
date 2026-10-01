Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DF3B5E15
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889411; cv=none; b=RV+rHi1S2EDUYLs+XvbkEbLWJlh1SeIAyMibH5DB8KuUZLfetM5pV8ekgngN8hEfZYHN9o0+d0hWM6X9vqX2r3Y3pFJ7Kq8FiJNbGdfwIo9sBFeyt7vF0wv04phN89DVINz5VGFIKPwB7BLzedgYAM3LlbIq8KN/GDiGmxrKbgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889411; c=relaxed/simple;
	bh=rHP27KtHsChwYNu/muDlCaqo/Qq89CxAfKbvtGKGPtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JI9RxELxCdY2x6mSxJiyoI/ku+ATfakPA9CPB0Lmh8HLqJzYOGQ5Q5qmo8ez22El/NX92Q7apbDkDduaMccDfgDQ9ct/+LMD0r2wRH6CCn0f+S2JLqLqiR09sClM2om80lr6ftKj7AbMx3xfq8FqvwyiUyX7bZWNtd5iO2Sy3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk+bKUYj; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk+bKUYj"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afbfe4247so337227f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790889399; x=1791494199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSoM3PgpQ4vYswgRtDn6FHAfsCzsP4haRyzseK7Qt9k=;
        b=Pk+bKUYj/qxWuxDSkjBeUmrSey384OvQOJqgUOmohmWGEgrRY0a6D3LedMEgtZuEPs
         Y6wZhGFw9K8YVeBoZ4IDo9KcDL+/rPGUQsDBZtzT9Oo00OlqHXpMZGzN1Q8IZtYyfyCG
         SxO2KnEHNrDfmOZvloSaC86ZEozOwrqIAsoEg5nxaMMgK+d/uqVqLBy5inJMeHUgzH9h
         EO41BFq/KFhcd3ut9eQcwRoD0PGErVuGivoalcJhpUYypb3xgMjvdnaKSRSrCENZxVHv
         ERtIrUUJWvygHeROVMHLO/Ap3wJUsqjWtHeN7Jvq58Zvf16hqvHY2MjhXX7mdEkKOd0D
         VkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889399; x=1791494199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HSoM3PgpQ4vYswgRtDn6FHAfsCzsP4haRyzseK7Qt9k=;
        b=PNErZknxEWZjI1Cbo0E1vjm+ZJmJK/S54ziT7L3Yb+SpN/RMqpekV3D1Jru+V8Ne5m
         IUlRpCHd2ny+nvW48t0wml3zrtHTE3bWRcYkN9PEQEzRnq+t/WO6sCewruWSqukc3StU
         isRYzRsx1HSduTjnigtPIfplqA0WXRZLNfcfAhnD8i1qj193M4ta+93MrHDmZjiQHSj1
         KfBD/hY2KrkhGTFJkmw50ZQTjhjhXloFD9UXi7B9C4EHD+tu9LjZbxupWcZC+RuPJp+v
         L4ye4Kmx0Y+BOWKssHQp+dvf0DnoFR3GzaLtYDL14cmBqUc7q3bjQTLwKgeV8F39j0jR
         I9Og==
X-Gm-Message-State: AFuF++lXTZAtqUCKvYQE7WupBxrVBZ12900Xs1pgDuH9RCo/4xO54/Q9
	4mBcyPQvZ6HekIkGaip5pduc1jCF3r57q58BkEvEDUPJgqy9Frr4vfZY
X-Gm-Gg: AYBFou1ah4upr+IaY6waQLC8Dqky9ZQ845gyoB+/uDb6iCtgCJj21HKEj+9oj/L1xVp
	nTIXq6dw8IUc3ANZyzP2bSZyxZGAmtMO8nLud464uWv2ufZVS0yIeER/MK64f92IzMrat8Fz4Qb
	QEftOxF+L3KrYlOw+pYvC9rXNpZaD3P0GlVEsG603MQi1pAMCCFhrLNr87RpwmfacrOOqw32zlI
	t4w7UFf1x1v2M+KUdcKx9LRc7ybzpyokny5nlO0aOUYlKbJPQS0XBhilAd+HVqdhqJ9a86KBzRs
	ucwNFMFNAzrqqBaVkCyxIkezfZ7UntVL0n4OIiUGp0Ny+WUmOWP1civRrgyZR1LS8VWqmsplpYT
	Dfgs0aGwfy5c9gVOHA4XdcSdQpji6Qpt+dYKK/PrdUHw38pFGzyfXkVyEYk3VJc1pLQPScdQ4mI
	4XRITL/bGueuwe3K2d4Bp5WX6Kl047alBBjFyFsLcq1aGBO/k20+dARz9zKBo45KbCwxWUEeuUX
	Z/RlhykLEripMqY+IoDTIj3WrNSEhg=
X-Received: by 2002:a05:600c:a196:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-4a02745a402mr9164165e9.0.1790889399365;
        Thu, 01 Oct 2026 14:16:39 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm6438275e9.0.2026.10.01.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:16:38 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	tj@kernel.org
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
Date: Fri,  2 Oct 2026 00:16:14 +0300
Message-ID: <20261001211615.249877-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930114416.211829-1-kayracizmeci@gmail.com>
References: <20260930114416.211829-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > > Hi Peter,
> > > 
> > > I checked everything *again* to make sure;
> > > 
> > > > -	if (!se) {
> > > > -		cfs_rq->h_load = cfs_rq_load_avg(cfs_rq);
> > > > -		cfs_rq->last_h_load_update = now;
> > > > -	}
> > > > +	/*
> > > > +	 * The above (forward) leaf_cfs_rq_list traversal will have done
> > > > +	 * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
> > > > +	 * list backwards, such that we're ensured to have visited every
> > > > +	 * parent of the current group to update h_load in a top-down fashion.
> > > > +	 */
> > > > +	list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
> > > > +		update_cfs_rq_h_load(cfs_rq, NULL, NULL);
> > > 
> > > 
> > > >  static unsigned long task_h_load(struct task_struct *p)
> > > >  {
> > > >  	struct cfs_rq *cfs_rq = task_cfs_rq(p);
> > > >  
> > > > -	update_cfs_rq_h_load(cfs_rq);
> > > > -	return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
> > > > +	return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
> > > >  			cfs_rq_load_avg(cfs_rq) + 1);
> > > >  }
> > > 
> > > Is updating the root less often intentional? 
> > > Or am I missing something and we update the root more than the old code?

> > You're referring to the removal of update_cfs_rq_h_load() here? That was
> > the whole purpose of the patch. The callers of task_h_load() do not (in
> > general) hold rq->lock, and thus update_cfs_rq_h_load() is unserialized
> > and broken.

> In the old code we were updating root when we go fully up and if it hadn't been
> updated it already.

> But now, that block is deleted. update_cfs_rq_h_load() is only called from this
> other list_for_each_entry_reverse() block. 

Ah.. Why I'm like this? (Maybe it's because of the brain-damage :>)

I meant that the only place that the root was getting updated were this list_for_each_entry_reverse()
block.

Old code was giving maximum 1 jiffy obsolescence (But it was broken, as you say it)
while the new one is less broken but doesn't gives any obsolescence clarity.

Nevermind, I wanna talk from the code that should'a be easier. (BTW, my git tree is mess, everything is everywhere
it's like a warzone. Hope I'm not the only one messy with these things...)


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 50583fde20e1..aa9a54817dc6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5773,8 +5773,10 @@ static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
 		if (!p_cfs_rq)
 			p_cfs_rq = cfs_rq_of(se);
 
-		load = p_cfs_rq->h_load;
-		load = div64_ul(load * se->avg.load_avg,
+		if (p_cfs_rq == &p_cfs_rq->rq->cfs)
+			load = se->avg.load_avg;
+		else
+			load = div64_ul(p_cfs_rq->h_load * se->avg.load_avg,
 				p_cfs_rq->avg.load_avg + 1);
 	}
 
@@ -11617,6 +11619,9 @@ static unsigned long task_h_load(struct task_struct *p)
 {
 	struct cfs_rq *cfs_rq = task_cfs_rq(p);
 
+	if (cfs_rq == &cfs_rq->rq->cfs)
+		return p->se.avg.load_avg;
+
 	return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
 			cfs_rq_load_avg(cfs_rq) + 1);
 }

Yeah, well I was thinking about something like this.
Maybe I'm misunderstanding something tho :/,
I done this in the middle of the night, untested.
I should sleep. Ah..

> Also, there's a typo:
> 
> > + * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
> > + * 'us'. As a result each segment is in fact '1<<20' ns.
> 
> 'apprixmate' :-).

> Some day I might learn to type :-)

> My situation is worse than yours ;-) 

Anyway,
Kayra
