Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698373;
	b=VeC9kHZumDrRfRe9PF2WOkOnV5ARwGE8fm6vFEsTw+FIgajqsV+RLDLxf7KqDQoNIxw2
	 BN0+JHqHyc8sbmErC4Lw/Zw4wD2f8uDHF6DSZlRryUA9v2kxaQgVHBG7Cw8aV/bx4PFK1
	 w+K8WVV/QsASHXBtJp2D7QH/NORdNMnX6Ib2katSzGAKQzaSTQnixaGrJ/0P9kHDTVWH1
	 igyVPzRRpQQLTJYkyZX6kL0REJeXd49IBfP4wtuw9uppw3d5rri6jMYaXQuD8e5wdeRYx
	 onKJ4T/2beGIVGaHrmsUb4E0UHKpuvryHnDTMDcI8F0U219MjeWTH5GTBntcTjuqaJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8N0vEDOHENh5TCI6g+MQ642/w77B6Opk/aAqQYUAijY=;
	b=Gy1OkFxA64onlbAaWfzmBoQDMfutSGZazLZ1AJJOXhH0WmMrEvGMKSsqRqlEkY+6rpRY
	 XGoIoN5Ph09tJhpyoa0wqjB0TZPBLjBI5vvXTKSjMn5VbiSgy8a57iW+KKsNtjSKE/R+w
	 liUQ4W+7LUunuasceOHTkN5rHa6A96ZYp0KlxpM/Nt9bGn6GoHl5TZRjrrXxBzHOKv0lp
	 4NqHsZEEFthORCkbWH3AsnlSMfnfaIqNN9VjbOgoI3hDpcFMO1Ddg1izHZ+5uMGCsL0kr
	 WBMwS2JKpYa/LwgtmxwP5GKyWlOeN9D3OtRJr/EVcfT17jGKo5C78EFZtowP6TQV5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ANS3TwtW;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A2F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A2F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ANS3TwtW
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1914797f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793698371; x=1794303171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8N0vEDOHENh5TCI6g+MQ642/w77B6Opk/aAqQYUAijY=;
        b=ANS3TwtWPuK/jnEQAQK/8kNfGrYi6sQEas8E6CyIerU8CF/jYBxQ1B4OEFsLBAuuF0
         cuPUzS9iAbmufFbUxsvHhKlH1W81AcejvqmpzRXZKi3e9XLsLkEENgPdGPL4WmmJ1BOf
         3nakCg102OmBCtuRjJk/cmZQXyPe+KAI+uI8qaR0m6H3F98ZlmT2coTfZETQbAHahjWC
         N+yPvubfz0LPqumQ3sn5UEOHhvqocX+SWy5ky70liSEmr59larXu1vneyA6PbZ7ON1Er
         3gEw3hjwoTFQvqOlw6+c73DivXgX0gx/g6F0LQFDpN9aWtvH0Mmae8rQExSq+H8QPjva
         I+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698371; x=1794303171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8N0vEDOHENh5TCI6g+MQ642/w77B6Opk/aAqQYUAijY=;
        b=OyRyF6DAba2NXlxmGcd2GLk2mx1634PTI3BnxPvkhMV24K0/i1IetASqhOpbfHd4rS
         sMUJJ2K8PyEKXBoFxGIfdqjiHJPuf30yE2XEEEoI3DjxBjV6XKvRpM+/CE/KnGdCW2cz
         nlfSTgbAc1USiPUZ4IewUqYPYX5yJI9ImfDoWOY7JjuJvGTc4vw4XoLv/SXMX1wS1yhX
         9j6b9vVeZ9HysbufhRMn6nkyQLn9283uIdRZiZUvfdw5oViE/RhDjCdoXiY9oqguuNEJ
         EShQGtmFfBmHUKWMZNLQDQk79hQSAdkbuuFZwD+lZGtGPsfhFFRXyuOct0/UN/ma3lIf
         q/vA==
X-Forwarded-Encrypted: i=1; AKwUvByyU/Hwmh7X3fqg0nQdAGaeCULmjtmSQJ07wz5O3fjEy/h4uoooFd3QoWZI1VFRdIyLocvQDzqJj4MQzuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8J1AY38d2uCAPmocqBrb5uHbL+AG0yQhmsoi40e2vuYV+OQ44v
	PffeND5vFklpT1OrslPRxQ3B1JeGI5uEFB190nlpAGRnwtRkSxiuArXWpsvOL0AX8eo=
X-Gm-Gg: AYBFou19gUVTpOKN8ho04kI4eAw5hltWhpxj488dAh4ZSo3Uu6svYRZQ0w5bbRp4wo4
	dg3oaKn8/kaXn/C/VOuunYNbA7wFkT6lW0CZ1hXRid8d1FQZoRiYX5kqUIT/x4RiwsUiDePJ8LT
	hOOG/7RCplU3qLptsdPgm9HOzQ2HQAos3Yi2m/d17f9QEpah7mNEAF7p71ywHa+Asi9Px6sk/OC
	zif2KMlx0i6e6M81HKSuhoyi22HoeCNS2+ftPRW+/d+rFc9XQxBeTSyyCe+1/v+DFnVEmGsNd+c
	W/hl0zrg7vNrVPazvs3iNl/kWbpjtejhFOzbt5Kyf/brIrkqBL9kwnqmLxvPfGzennCfMVwWf+w
	COPWCqmiY1kdbGHdVAV5etdQH6dCnp4QVi6cONlN2AGNdMTld0IAVfnKsgyfapdvbSJgus3fEAY
	4f2RU2o4Lo0fYUbHr1pCimoqsb6/q/OGWMmTTrqHAu58Snzwd1bnKkk9L59sMfcHJgBE8dXDTm0
	zOCKJpsHKL/QX8B9SLKiKb2b61ouYicu3RZ9UYhtGHR0Q127coYpSm/Q42qXV/haWTSxI0VoJAG
	HxxMOOpGOb+MVjcJzcmWciQ/BOjq1nvk3oBi1r0=
X-Received: by 2002:a05:6000:2088:b0:48d:f6d2:9c88 with SMTP id ffacd0b85a97d-48e6e4f8daamr29004855f8f.47.1793698370857;
        Tue, 03 Nov 2026 01:32:50 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm7960579f8f.54.2026.11.03.01.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:32:50 -0800 (PST)
Date: Tue, 3 Nov 2026 10:32:49 +0100
From: Michal Hocko <mhocko@suse.com>
To: Matthew Ruffell <matthew.ruffell@canonical.com>
Cc: Waiman Long <longman@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Tejun Heo <tj@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Caron Wills <caron.wills@pulsar.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [PATCH 0/6] mm, sched, cgroup: LRU Cache never drains when
 isolcpus are used with spinning SCHED_FIFO tasks causing page migration
 stalls
Message-ID: <aumqQX7tKHLKRQ2k@tiehlicka>
References: <20261103075940.110308-1-matthew.ruffell@canonical.com>
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
In-Reply-To: <20261103075940.110308-1-matthew.ruffell@canonical.com>

On Tue 03-11-26 20:59:34, Matthew Ruffell wrote:
> What happens is that the spinning SCHED_FIFO processes running on isolcpus are
> constantly dirtying the LRU cache, and when we attempt NUMA migration of the
> 50GB of pages, systemd calls flush_migrate_mm_task_workfn() which creates a
> kworker that calls cpuset_migrate_mm_workfn() then do_migrate_pages() then 
> lru_cache_disable(), and then __lru_add_drain_all(). __lru_add_drain_all() then
> creates a kworker on each CPU to drain the LRU cache, and systemd and the
> initial kworker wait until this is done on all CPUs.
> 
> Since the isolcpus are running SCHED_FIFO tasks, they never get preempted,
> and kworkers never get a chance to run until they get an opportunity to by
> returning from a syscall, and it takes a very long time before all 192 CPUs
> actually drain their LRU cache before the page migration can continue.

The idea is that they are running on isolated cpus should they shouldn't
be preempted by unrelated work. But at the same time those
isolated/cached pages shouldn't be blocking the rest of the system. IIRC
there was a proposal to flush all pages cached on pcp on return to the
userspace. What has happened with that work? I do not think this has
been merged. This should deal with the underlying problem without
introducing lock contention that might be a result dopped caching.
-- 
Michal Hocko
SUSE Labs
