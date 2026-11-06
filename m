Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955428;
	b=KUeYnFTcWI30EFEp1BfE3hqIkLHy6oUQD5yLB+xKObCO86KNWniiDG+cx8DpzHhkFXfl
	 SWHE4VJV1K24yjhrmuhaveDgm1HKaIYsYJj3MZJKQA0NIorzeCRFWIDz6ZNn0ZbLDK+Uq
	 IOdPs3WCIm94iVIiGHKEQJYW4etwgnFswWJn1JXv/LnZQ5xB7wbXeIw2rDQJrEL2r6hrH
	 BfP5MflORmQWKItQoN/5ORWYSvmK/DiO03nbc2L5WEsVnNQ4ssuz7CthPy23YCh1XOG/7
	 a4p4J43fQ1ZBIF9gXHTABcxx1O7W31ELcNN/cEZtnFOoDHC4I76TWgJTdWSoXFyLUAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TleoKkxXPZY3Z7b7K5NFKwzPY4O1tD3951tcf6rOerE=;
	b=1cjvs89mUMxxtBxIdWDA5kB3sq6pai1sdex6i7pkitqEmWz5VhhbSfj+XXa9Te2OV2O3
	 isn+IjU7LVPr++CCbSu1PIMKMwWkrBxzB3p1J2rtzaiYmBgdRVF+2+mFeJoYs/zD7TdpD
	 OeLXTAw6bM6qXKXMrZDyuvpPohXi4qPf2IZ+kGSIlioGZMA/gZ0D5bB1HdiT/wwAetfKM
	 JyGSGZ7DUSpjf0cdyv7hemrNFxstCFOX3CIMjz+S7ABE9XUmsZeQNNRnpgQvK4uyMdkc3
	 XVruFWnALjjLm2hGfnc5sCLdvV3ItG2kecTdReJR7Ckqu90/DpgRLMMcTsVSMaodBWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k8eZWjOe;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7194F606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7194F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k8eZWjOe
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49123d2e4dcso7711f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793955426; x=1794560226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TleoKkxXPZY3Z7b7K5NFKwzPY4O1tD3951tcf6rOerE=;
        b=k8eZWjOebqAe81ZM2MtqXdYmT0DRPScBCtB7Va3CByQu1EwE2ExQ7q4jW85DFOVTGv
         QB4+GtPdGiLtTBKYmpEOCorHmuK4crvqpYra2Bv61rsLFK+Ouo2T5SzMwLLADdYhsLpI
         tMi06t/IFLmnmEOhdfjJi0vnZzPCIrP4GeAdkGDOVhH4ozFNfZq+Wok+2XP489tG8JE3
         q0w0gr9oi163V2e+WlL8bKgdB+oyaPNZngUCsxorOsjRcq1wp4glsqP1GRhGxMtYjwPR
         nyXPikfDxyc4r7wx22H9weJZ7t6C4o7ghPxL5tWqgLYyKmHxT6S92zVufjaMftT22p1S
         sjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793955426; x=1794560226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TleoKkxXPZY3Z7b7K5NFKwzPY4O1tD3951tcf6rOerE=;
        b=k99e7aEyYQkhOyFnDr9dPsoxGkp1j1oWkQz2ZPlp5BPmV1qtw8P0ebb3MQdr5dx5yk
         P+0oYgaK0EhMUritBGZ3U/m2tEg7XGl11V2gNpQ17RiwEo639m6QWgthqA3wN1cgHYDD
         1uRd6CHIl+M3gV2mtfFJqYPFz0UBksS3IxER9zDKPLb0Rq6EXviPQsRSyzEMXhfF3dvD
         1bcKplTkW3yP03WJCX7T98T1KnuQK+9WG27DC7NxgiVmCgwKjB/ufgUyLesGtXrn5isL
         MTFtQIYhBGiPn9oWN6O8GVZwmQSz5E1UFlj2an7jHAHPgSTpZJvLnsXBCXt1NebMmIbw
         b4Vg==
X-Forwarded-Encrypted: i=1; AL+hErG0g+s6Z58KAK3JFA2DwSdHsbsZydTE4Q4nvOpB6NZoka0b6WMy14dUufOff+IhDduIWO6LHM+8qgLoI5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v3iXLeGbzydgXlsNdM7QCWW9vmtFU6JEGCR3wxnH8ml7BoICq
	DEqknz4tCSAZvAa6eD/miqwLEleaZEtSk+P8THOHSHFicVDSLZZeUyOn
X-Gm-Gg: AYBFou0WRuqyTb3tMknXuPy1OmBjxxhqjAhpc7gk95Z1RDqAATC4e+9D+gVQtToIivP
	s3j69QsGrqEKuFC/z3eQfkm9ovbqvjOZUIOdGXxW63cSY8eGhW1jiI7fG2tIQ2oSQLovBKQATx4
	etd56pjO1/vHSTLZddN9pXbCJ2mFPJlsu69xupZ+5mP53egqqBOG06fVrMUzpqp8dSgwNDL/c2E
	LGTgw6I6h5YBzwBLMwMYGnejOLtZWLAaK0jfpOhcK6E69GIavPxmPAOe0a5pLB1+/B8T/WMRW3Q
	QUs04/3XuYprZUlzKRkSK6dgXcw6RDB8vIzTcHVSOf+kHPuMe6LHxr5dfjIOJXTjvHaGPg+fSFk
	PcM2843lWL84y83/sOMnEFdYDBGrpZQqLzRphUXYG6u1H0lzUn2D37e69KLmExIjdKcCXIVcQJT
	C8Rq1875/4NBPjF6PHIznkxyS/jqKod1JKdOnPBzUPvW5QN5Nw0ckfhHad4mOuSqqrIFL0M6Ps9
	k5Emc7UnuCqu3OLjjcepTnBhuYhyJ5X9ZufI3wVB7qHrEQFVEheco0jKUcg6KoznPknE5EvMzog
	wmbhBhsdGezWBS6VYdy9gFdhXJx0C37DRq58B1f5PF5PLle/31qx0z5PINnSMx8hx+JUPq7Sb3u
	t
X-Received: by 2002:a05:6000:460b:b0:48e:6675:3a77 with SMTP id ffacd0b85a97d-49275093a8dmr4228228f8f.3.1793955426185;
        Fri, 06 Nov 2026 00:57:06 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7232257sm1905430f8f.22.2026.11.06.00.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:57:05 -0800 (PST)
Date: Fri, 6 Nov 2026 11:57:03 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <au2VkE9005PlW8VN@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <auzB7x4lVcFmTVMs@scheduler.schedules>
 <20261106083106.GC1779021@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261106083106.GC1779021@noisy.programming.kicks-ass.net>

On Fri, Nov 06, 2026 at 09:31:06AM +0100, Peter Zijlstra wrote:
> On Thu, Nov 05, 2026 at 10:20:00PM +0300, Kayra Cizmeci wrote:
> > On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> > > Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> > > all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> > > is marked idle somewhere along its ancestral path.
> > > 
> > > This makes se_id_idle() behave differently. Notably is will now be true
> > > when there is a idle cgroup anywhere in the ancestor path. This
> > > addresses an issue where preemption of cgroup::idle was overlooked when
> > > flattening the runqueue.
> > 
> > How? The diff doesn't touches se_is_idle(). se_is_idle() just looks to
> > the policy for tasks:
> > 
> > static int se_is_idle(struct sched_entity *se)
> > {
> > 	if (entity_is_task(se))
> > 		return task_has_idle_policy(task_of(se));
> > 	return cfs_rq_is_idle(group_cfs_rq(se));
> > }
> 
> > Or am I getting something wrong?
> 
> cfs_rq_is_idle() := cfs_rq->idle > 0
> 
> and cfs_rq->idle is now getting incremented for the whole subtree. So if
> any ancestor is idle, this is now true.


Yeah, it is for group path. But we call se_is_idle for tasks in
wakeup_preempt_fair(). Not groups, no?
