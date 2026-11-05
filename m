Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862888;
	b=vYQH4vheTh4S3WsKRWD5LhWalnEzYnMvELCJKi40zLFD4mEIj5cO5AvKj8CAS7W5pQVY
	 2FAnA7E/IhGJO2AA6dcy4ZpFw/Vs8h+/pCAaMyZU5yyzmgVgcMP6tWyzcDAbKzQOt4ieP
	 6uy8YV8Q1p8kANngrtf1H/Qx9REbiCcDQ6FhQiGXrmYqrZmmvjq2qO6xbHgs3uH6SvW1f
	 469mSPKTHhPPjHx16fiSI4Tn2Su2Uy6/xatuj/xv0Ed6SRAEAUikbsYBzZZxhpFLQwR0h
	 U2YFr1WdoFMKU0g+MLTE++A8rw9nNn09SZwgkfG55w3gqGSGx9lufd5VEpJrORMlKtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862888;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
	b=pK7uReI/N63DxbzXHSFK97XRO4iLLLmUOyuhlp4qzjLsMk1hUOqEQD6KpYuNP6Jp/rgG
	 NMktgMDMToUCnDpGhciApRIT2mymGvHkizCt2+F5y/M9ccjRkcTzf/T+v8NwmV2oWQmd7
	 E3gJhT1ZAbiZb1hOZpSATrfkQiM4zVgT0R/zc/LXGn766PHhxMxc4Z7ryqfwrCF0HTA4M
	 5uYOjt2okdsOQXAAwGwfzRFDPtRDg4fLy7JmdoAtg5ShdWQhCpp2NkXr1K63BSIA9gBfd
	 mq81aieFKAHe9+HH82llaeRXXkcABhhqXwJqOuqr77TlpBl2y0PUcDnCF5e0oPbOpTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAAtYU2R;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XumuW6oi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56404606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56404606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VAAtYU2R;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XumuW6oi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793862887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
	b=VAAtYU2RgYH6pQzcks5y24LAZUYSV56hDWarr8l094ODjAnp8V1cuOURn6ywczROCOympa
	WveQ1JOJ8guwZ7ZDZMWMN0FKJCg4DOZ5Os5d85+LeIDPq9/IND3IAx3owZjauqdLiyj1m1
	bGpdYFf8bCLQ10xsqShdxjoYOqmGyMw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-fV3jIRUEMf-EHKG6uguiRA-1; Thu, 05 Nov 2026 02:14:46 -0500
X-MC-Unique: fV3jIRUEMf-EHKG6uguiRA-1
X-Mimecast-MFC-AGG-ID: fV3jIRUEMf-EHKG6uguiRA_1793862885
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so18645845e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793862885; x=1794467685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
        b=XumuW6oiQTXigEVxC3UHVAwrKCYL1EEn7E32m48Ko4QP2cFWCAPjnLrKEFWy1rwBuB
         ilv43E/3WOJglVkTMZ8l9v9liW8tY3OlgCmZ29DVHm03/IHV1oIW8hkl1b8HvgOpvWXh
         KFaHEgQS+si5j4Uy596RWbLGsBamCmT8NpgDPcpow6JCsAqObeoeni1PM6AaOvJ/xc+D
         kTVcKRqvjzgn0dK1GmLzCBxvkbB6/35y7Cd0SmiSHSVaIIv72nnu/acXSa8NrpciVV2E
         6Rr/CtKL5wxX06v/SeZxJ+Wsmb79j55O3RF9Lm6iJ56+6kDGPokO95FXaR2OvXPGglU9
         OBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862885; x=1794467685;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZkitsX+DewrI5AYsqUlHktt4nU0q8Qh/L8/eegqT0M=;
        b=imT0nE6uCv9FMhaGdzXVzIJ1NeO51HvFfeUPc9ukyaC44TuBznMrFIyUXlgZ+m8G2C
         RdOIqNSfs2K7xEWDjiVtHgiYj+xBfDF2mkjKaqNw8XVqaoj8rG6ab8wlxAqe+3Kwi0db
         nDPKbVyEnGYQFjQFBZJRqToAgDPrPPeb3PVwst1mWx1RzmNOvUQ0j9bzSBgM6kPlxpar
         D2kxBOhOCt/1vBlXP3rL2ptRH2PU/q1P3OOI/wS7S++WbAtxVfaA0Wz51M3OLMTF9THt
         APVN6qucteljRiR+LpmZHLaY/GygBuARiX9BMA7lnWmJLmGd29E9xJe9rofM+HgMcQI+
         lB+A==
X-Forwarded-Encrypted: i=1; AKwUvBzY4PxhOwyu0f/U2Pg1p9Sw062x4Ue7VPkIiXfBHPEgDpHqFECiPnHSLAGsxKt8GfHw8tiu2hs20bKpT7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mbeNX+heYHng+9SEFDn1QfnYw3A8CqVrR1kdcHVqU4hyYICYa
	gGcjbpMHVjMYkEjFZ/mA1JF9+9oxzg2NU0D7uSQBnK+ez0qvVhAjXSt7jEHPzgy+M4P87iZl1mJ
	cfs4nP13eZH6sxSpUycVPM3aEp7m+jaWK0XnvAozwQmBOj7xDQbDCv2W37zP7L+8Z3g==
X-Gm-Gg: AYBFou0P+boTzjgrU13CdwhORdeHSLTFvb1HNZUwIzWQuC+mFVvfXMRKNBv8hCoS/q1
	YCEghzJ6y6LHwoG9/Yh6e9L6ykBu5zoSzuzpzf2Wcr49Ac/b0W2eVl+A0vCtSXYP4ZMLuqdo7MN
	6Mf560n/VjBunbO1mui9E+LwdfzVOsu2wD5dZfurGHsI355BRRTZ6VnN9F35bAVjY8y0T/SblBe
	IPM/ZtTJfe8/RsCuzmosSw3L1EY2KYRvF059jtysdLpedpMvBEImJLNC0KOMMoFs1UgNhS41VB5
	Ji7FfvHP+bXTg+YupiqO6ouc7HhnpfPD3BNZeOnNIDqbUnmq3XAwkTEx7uaRRQOFEPMUdkI9K9M
	g/xR5x9dN22GHtVBYnCPRJMCYlEquZa/VEuexFP3MQCJfLvkAIHZI5eaZi9RCXXC6RrqKGw7QEh
	dMKQ==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr400160515e9.17.1793862884849;
        Wed, 04 Nov 2026 23:14:44 -0800 (PST)
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr400159945e9.17.1793862884464;
        Wed, 04 Nov 2026 23:14:44 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm39679165e9.10.2026.11.04.23.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:14:43 -0800 (PST)
Date: Thu, 5 Nov 2026 08:14:41 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 01/21] sched: Reject SCHED_FLAG_KEEP_PARAMS before
 reserving deadline bandwidth
Message-ID: <auws4cpKvQnmNM4f@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-2-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-2-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> __sched_setscheduler() returns -EINVAL for a SCHED_FLAG_KEEP_PARAMS
> request that would change scheduling class, after sched_dl_overflow()
> has reserved the bandwidth of the request, and nothing gives it back.
> Switching a SCHED_OTHER task to SCHED_DEADLINE that way fails and leaks
> the runtime that sched_setattr() filled in from the task's slice, up to
> 100ms with a custom one, into the root domain's total_bw. Repeated, it
> makes the root domain refuse every deadline task, and refuse to offline
> its last CPU.
> 
> Reserve the bandwidth after that check, last of the checks. A refused
> request also leaves sched_reset_on_fork as it was again.
> 
> Fixes: 8a70415351ba ("sched: Reject SCHED_FLAG_KEEP_PARAMS when it would change scheduling class")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Makes sense to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

