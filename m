Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E072F4A05
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768662; cv=none; b=T7TPqIYso/ABM6QxsUb4yFITIrZQr60cCaCp3rSq5l+tAxt5g5ex4qJ/q/q7ZFgDfzdltGTJ4oxbenAjhFhDkPesh+sLEafqNYVxG4WAWbM01TLnky4cDBkaIvdbF5yqI6+hDyWy4f7sgt/z4d6JDSQUrbN39X/qyMwzRgvqfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768662; c=relaxed/simple;
	bh=unFjjBVQGvZpcltxDQ8+xgiHEDj4hZRgL38xSCZPsWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUwXUYlLJ+Y143eXXjdzS8SGpO8QrX30dhiQNu0gXN2WEFRxTM0H1+JPSYNfMtsyOujifLwIpzSPClavdSt+6krH8nF4dJlSJlkvWIL1GsKsOHi0ScYrPJVQL635dQCRn3dhEQ7Gm+XPye7kNGp//YIoJFU5EUapZulV5jiiKfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RA3hhcx7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RA3hhcx7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so635219f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768659; x=1791373459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWYt5/wzwMcyQAZPYsT5deb0doqb2K6aA7LAlH15coU=;
        b=RA3hhcx7m/VhgZTvJJDOIse+h1XR0oUIGyZihKIvViQ8Fc2RAVIi9VjnY1iZLFxloG
         uKK4lSXI3uEHcR7Ga71t8k4wyST8M48xvy4lRgzJAQZyxH2apzik81xiLKR9sDhxgPCA
         TllH1+q55Jrr7Nez4eqeyOuvQMLxZrnv9C/1XKL8+fT2yiNiycxMCyaDsGD7r7yqYhr2
         AfdcyYZ+3EJKrFuJiKVYAm5qwWnlMY1/0uqAbE8cGeWX0zlIOWy4x9eJCVYpH5MIkL3e
         9T0VMUghBJ80WOyL3QshDwAmNM0T+2Df+nLmIpOqDOtGwO7nV90U5Tn+QvXYRDbme5Xl
         yvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768659; x=1791373459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWYt5/wzwMcyQAZPYsT5deb0doqb2K6aA7LAlH15coU=;
        b=HjbHRFSywD+pbAs3TFrkrmmQPT99Gvwe8po7Jsdo1QHBKpZQYqg5KsEuFy04Rs3e4z
         9lUkRCfticfVcOy95/dKd9pj/gkSSylxg6+8luo3KgGJmNAgnIxbC+XlFua49acSUjSG
         LOa7b6yEhHYo7E09XZ+QOCUiARcBjVRZyUR6FNzz/KI/ZVPSjqfR8OzkVqtBNiMQMGxi
         i607allx377CJG5KcgZ91J2o8GYMjQzGub9FFM1x4RtGFhg/F4it3zzksjlVSzkFjGpW
         NNcw88ZK71Cq7Xnti9hkcKPFIM9Tq7W3Ol7FeUeOqMOK67M3tV2HHJMrLXnZvp/YzMjN
         Pm9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxr3VQCm1apcH76j8jc4oyEVQQOXMgia88vLS+2EH14u4yI07w78CX9ikNGAw+igMHK+Fqj2c4P5OqUW7k=@vger.kernel.org
X-Gm-Message-State: AFuF++mbic7sIoSOb7/9riGkRt6CE4rSFnbKc2EA7U2omsXqAZpKctl8
	IUoaAvaHuiF+AilSo162VayLt3By/oHQtAOLSXhsC/TdFiMLqaR94lbw
X-Gm-Gg: AYBFou0V2t6pS22JqKvhZrwpnQPx8NrRp63iUKvppdwnF2A1abRlIhFt2Pn47AiIE2G
	XgPW8OPHTiie/9aOe0hWwcj+BAR9FF1pii68xnCO8UH9Ri06vt/WP1sUqwLGTHJs7FmWDaktyCS
	OvLHH5rCJDZgIoRCDhpWofKT6QShdycC1bXocBHXMfveW+eF7Y0Mw+mJKQ3GYcxcZp0L9nVg9iw
	NIgtfRiM9D25i/6TIyQqaBHUmD1FljVaY1f7syNt2iUneufA3xvPz2igSySkgxYLazyPb/+F8Lz
	pnhjKKiCP8LRoYqyMhMn0Z30FkV9Yk2UONkFpDec9OelW+t/AtW1EjDdEizmu2sluigkzaKHlHE
	kmbfSD/fxvuH5yVi6uTiOzQSOG2PC1m/i0+fmTNmpzZ+mstSgN7zjVvPid0FwWFmd13JBQIR/tc
	bVjZttVjXizighT6cWZlTALI5pZZEaprtBF1F3dayq/KiGx6ZMUHtwK3jJ/2uDZ/iarJQkVKwiT
	T953L2hgLBv2Zh/+2Kp
X-Received: by 2002:a05:600c:8b88:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a01b00f426mr17205875e9.2.1790768659198;
        Wed, 30 Sep 2026 04:44:19 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0174d8738sm76317195e9.2.2026.09.30.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:44:18 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	rostedt@goodmis.org,
	tj@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
Date: Wed, 30 Sep 2026 14:44:16 +0300
Message-ID: <20260930114416.211829-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930112539.GM88198@noisy.programming.kicks-ass.net>
References: <20260930112539.GM88198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > Hi Peter,
> > 
> > I checked everything *again* to make sure;
> > 
> > > -	if (!se) {
> > > -		cfs_rq->h_load = cfs_rq_load_avg(cfs_rq);
> > > -		cfs_rq->last_h_load_update = now;
> > > -	}
> > > +	/*
> > > +	 * The above (forward) leaf_cfs_rq_list traversal will have done
> > > +	 * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
> > > +	 * list backwards, such that we're ensured to have visited every
> > > +	 * parent of the current group to update h_load in a top-down fashion.
> > > +	 */
> > > +	list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
> > > +		update_cfs_rq_h_load(cfs_rq, NULL, NULL);
> > 
> > 
> > >  static unsigned long task_h_load(struct task_struct *p)
> > >  {
> > >  	struct cfs_rq *cfs_rq = task_cfs_rq(p);
> > >  
> > > -	update_cfs_rq_h_load(cfs_rq);
> > > -	return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
> > > +	return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
> > >  			cfs_rq_load_avg(cfs_rq) + 1);
> > >  }
> > 
> > Is updating the root less often intentional? 
> > Or am I missing something and we update the root more than the old code?

> You're referring to the removal of update_cfs_rq_h_load() here? That was
> the whole purpose of the patch. The callers of task_h_load() do not (in
> general) hold rq->lock, and thus update_cfs_rq_h_load() is unserialized
> and broken.

In the old code we were updating root when we go fully up and if it hadn't been
updated it already.

But now, that block is deleted. update_cfs_rq_h_load() is only called from this
other list_for_each_entry_reverse() block. 

> Also, there's a typo:
> 
> > + * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
> > + * 'us'. As a result each segment is in fact '1<<20' ns.
> 
> 'apprixmate' :-).

> Some day I might learn to type :-)

My situation is worse than yours ;-)
