Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839135;
	b=iK2JM0qMICj0Dodk3eGQZWwgu3Uxag8zdU8lK6fg4ISYFvqXrsI+7Qp4lYe05/WkufDe
	 vHvkaSqDUN+JuDKNkhw4P0qmLDKfqcEgmmjNpUu/0unsiUU3S6IHnlOQ1fv+XwNHj1Cst
	 +/GIJx66PVBZn84QK1ZgXZZT/p91F0S53cK4xRcRYj9bQOTCQIqLBf8BO0IddpLz38W6t
	 zikwLmBwvaIei2UpyEhvow2mZCwP9meo5lzYyMhnRjsUxkuHLF8MOWs2uPAC3y24/2Z/S
	 ULr1SdIm0r5rqvVnmeeDxJ23dlpb7Dng5Jlrsh9VmooJro9jz5XHFun8kP4XyEanFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=5Pxa+8WmY5aWMvQp4MOIKPhDhZ93O3CM2MNQsb3Ea3w=;
	b=gMuvo8urCeDTCH04Wtp0zYot/Z9RbeapBcOg4VfgerRkzuENJmftrMimaL1KJ3CxKfUY
	 /IlXu5/0lYB9T37iNqqWHd+ykIeoH9eo0sZIAIZ7WM336iApxNQVd8z4ci8staz89Se25
	 VOmzSmQ1IlgoZ53mGMOJezUMOZCagpqb0hOzBeNJtfp3PMHtRf7RPAwwBvE36C1s/GP7l
	 xOvt5N7AQ9e474ejX5rRApjkZrT1MAYQLbZQ3l0aDmIrktGSr/z/TX+r6C6aGwFKX5hrf
	 lZ/Ttllg1KEzbIFT/VjERZWavzw98rdQHWUjp268Z9m7teZzUGlxx2L6V92rXPHcxzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+UwyjoE;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C910606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C910606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+UwyjoE
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b001cd92bso606298f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839132; x=1794443932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Pxa+8WmY5aWMvQp4MOIKPhDhZ93O3CM2MNQsb3Ea3w=;
        b=j+UwyjoEO+2q1E+nBxP9Wr7NweSOXMWefGF8bJYdheLbXwnW0MJ4MZk/3VPcuD+MeA
         sWRG1QNOF+upgGBClSVfoImblhO9ufDyl28bv1DAyCPDtFGY+nzJrxI1U9zRHoyPD9WN
         JWUUmtUAuauJLGUQM8T/xWhyKwADMrDlJcKez/Zyt3HRjNvquncBkMz8uQk7CUETT+t/
         PwX4AwGZcHpwVNlw22kjIRd6pYGzNJmpIA0QJLYtAO00R//2nX9O8CQKhdPE9sg7r0Nl
         sWddnnI2coLnTikwp0qWB+8L/kLbpaLf4aY8ls1WNhvbjfqchplJUx40eJAKFMXx528U
         nbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839132; x=1794443932;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Pxa+8WmY5aWMvQp4MOIKPhDhZ93O3CM2MNQsb3Ea3w=;
        b=0preWt5viIxKyxJVjFzbTqUOasr46ktQS2ZzBa4KTmrOkMfcyTgeBjaQw6HbO4RE99
         o7l1+HV/BYrflQVOOcWX5xlPkKK8DV7bel8y8+4JqNi39ZbYX1Fb0DBqDgWxBBbCTuQr
         X+UpI4Ff9MMDSCqtDN5Y0kfCUvjvh/e3mJ4px2TYUdmerRKnYtZEFLxpEpHpUWodINnR
         rt4rcdsALv73OlC4JRvWDwA8uuTUrnwwrdhyHP13mvfeVVPRavGBL0HPk39Ay2RkxHwR
         pI5WQhk3LOXEquB+e9OUzTjfRuA1BO/nyFP4DZh1L7fdgqqmu039Xsr9yxoeQwfoy0MZ
         zC/g==
X-Forwarded-Encrypted: i=1; AKwUvBzofeFIAIjm138bNHt/j0LvP9/+Zob8r2sJP4hZlaOgsKEZOq7VKig/JQJUXJGHicov47GUkRgQlfq4F5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+axUdE+3cK+Jus3dFpr2EQz9af/g2D+vRNbdsrRrer1LR6ACpP
	Pgu2vHJmhsARnfyJwXemt85Fy0SptEy6AbA+5Gf1E+P9RogIN7UmwiVe
X-Gm-Gg: AYBFou3d+JEBZ9bLT9fT6sUGEyTZN9UVDbcxh8iLDUVukegUpWr9GQorlB/BMuw3VfG
	GtK0RGSW+NbStXTRCxRW7na8eH4lR5fF5Bs8L8v9pA5j31LedWOjPF6nF1DugtS4RXvUVG2mi7o
	IP7Uf1jDp2p6XOg7N6R6NEa1bbudoUYNck9kGygXjpYJfovr2ER7dtdVAO5VB5SFjWeAo9lU9di
	zQ3KfOawYPisQgDbsydoQ1C7Fr6/OLcl41MteQkZ1fZtxCS56iLlLEswQyU9SXECa1qI+MecD5y
	fJz2oGwGoXnoG94hZ6Iy61KX5oW4fW1AgZQRDNv7s4v0PBi7qZ6kSfo5kj7s2avlb7URQniw8NQ
	+HKR5E98w2AUEy9feDQwfYFggvuFGqQMq6tYGqLuZWYhTsuW8pSTcfXhEBeEC1SNNH6KOmN5f9C
	wJJOlC3PcgyIwaxloZgEM+mrmRqT0qbK/1us6jtxcD/QXPANBOKSqQ2+8ZMTpcX86u7pzRuiW8E
	czQUWVNnXsHbpdKs7qHOJ2JMEeuXIjJnxTSiwMSWR393vucUHR1pm/fWTTs5AhWk1+NznM3mlm9
	3TWTxunD1cNiFVFrP0VLtreBWiEDweIaSsvdz3JvOgystAzru3lzbQQIqrM=
X-Received: by 2002:a5d:5e8d:0:b0:491:49c2:3b3 with SMTP id ffacd0b85a97d-49149c2043fmr821244f8f.51.1793839132301;
        Wed, 04 Nov 2026 16:38:52 -0800 (PST)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm5988761f8f.43.2026.11.04.16.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:38:51 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	Matthew Ruffell <matthew.ruffell@canonical.com>,
	Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [PATCH 4/6] sched/isolation: Drain per-CPU LRU batches when CPUs become isolated
Date: Wed,  4 Nov 2026 21:38:50 -0300
Message-ID: <auvQGQs-2DXQ2Brf@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aunrTtH00__Xi7PW@localhost.localdomain>
References: <20261103075940.110308-1-matthew.ruffell@canonical.com> <20261103075940.110308-5-matthew.ruffell@canonical.com> <aunrTtH00__Xi7PW@localhost.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026 at 03:10:22PM +0100, Frederic Weisbecker wrote:
> Le Tue, Nov 03, 2026 at 08:59:38PM +1300, Matthew Ruffell a écrit :
> > From: Caron Wills <caron.wills@pulsar.com>
> > 
> > Isolated CPUs no longer batch folios in their per-CPU LRU caches, so
> > that __lru_add_drain_all() never has to queue work on them. Boot time
> > isolation (isolcpus=, nohz_full=) takes effect before any folio is
> > batched, but a cpuset isolated partition can be created at runtime and
> > the affected CPUs may still hold folios in their batches from before.
> > Those would linger until the CPU happens to drain locally, and the next
> > lru_add_drain_all() would fall back to queueing work on the now isolated
> > CPU, which is exactly what must be avoided.
> > 
> > Drain all batches once from housekeeping_update(), right after the
> > HK_TYPE_DOMAIN mask has been updated and next to the vmstat and memcg
> > workqueue flushes that exist for the same reason, so that newly isolated
> > CPUs start out with empty batches.
> > 
> > Link: https://bugs.launchpad.net/bugs/2165410
> > Signed-off-by: Caron Wills <caron.wills@pulsar.com>
> > Signed-off-by: Matthew Ruffell <matthew.ruffell@canonical.com>
> 
> There was this patchset:
> https://lore.kernel.org/lkml/20260519012754.240804-1-leobras.c@gmail.com/
> 
> Leonardo, do you plan a v5?

Yeah, working on that.
Hopefully should be tested by the end of this month.

Thanks!
Leo
