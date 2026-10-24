Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823317;
	b=il4rHmn+BE4mbKIv4kmbgwq2FfUHLr54pUUxJFPP1XkuU3pPe+m5E6SnYmLb7w922gZL
	 SO1k/HtPTn33gnL6lkrrwEpfLyb4tNhnyeAHVqaSYooMVhIyZDK9p5nR42iyMUEs8bHqZ
	 DOul8DsVVsaKw/TYmXf4KRnTIdosR8apOb0cC5dRvHBb4P4/rTuMn8atdQu/oqa/9ZZYT
	 P50yotoKUHfGpZqynz49RMq0yM0bvVJPxlNxF4xzxOSennB87zjQUTqg0+6pz/wnrJQKM
	 o3ePQ5mtuvNzvNIy2VBbf8WcCjwZFxZqRHoLxVKi0kb4gRyMsPXArnszdnRJsu1NhTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=FsYQGgx/kl3t/teJTxweSKyHMLrpHrlVYhVp20xRZ7k=;
	b=Z/ia9p3Vji0cFQ9/rYYJh4ed13V6joM20QJateAhMR7Mz3TyU30HNwo3WcFf/hZ6VTPR
	 06aCrVF3L5KZ8sUIsi6dONCXsYvePTSsPDk6NE6zjUchHz1hTkulQjKInJIo2+wfbjapc
	 yQ527xVR+d7P4Ii9utm1xZfu0BCBbVQf0DGGIGLh239daF1zmLAwJAygjitOeTqPdelB6
	 L9NUYnYDd01CPrnhV1pl59QeZnnq+aOpa0TRvR2WZ9C35nbwOJfwXj8LMFdT7y92VQi3l
	 t2BOr4GIKLBiq6VHDCEdYC+iEyhi4biIpYoKXXfSvG776ZcvMfya71PQJ53FvPndFow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="G2cdM0/r";
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E35606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E35606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=G2cdM0/r
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e503815adso163369485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792823315; x=1793428115; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FsYQGgx/kl3t/teJTxweSKyHMLrpHrlVYhVp20xRZ7k=;
        b=G2cdM0/rUqRK5i9iQhtVXyh9ikWaMxpczJtA/3XKMeMYlFkjEdz3NxjtZd7sGrRKmh
         QE5enhlIhlzA/3xrDsWS62rPPevO5vVRmf7B/cIznoSsjIWKOxPQaaUCYpMkxSKmkPU3
         3JAwsmPQt/nal8fnDO2esdXQbb8XYpAymP+2bz7tc6V09FzJEDlzdGWOCCNYKEfLxqL0
         JqC7u5G16Bwu2IK83WxydTnUFm4Ph8TVonpQzaEVUSfAkc/IEaYHPRhcIQHDrWY+HBre
         BqDkoUEE0gxQXABlKOaKsOT8o0rlNgn7T644Jg5HTajDtNATuFOP7rRlAIGkwSx74G0g
         Pb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823315; x=1793428115;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsYQGgx/kl3t/teJTxweSKyHMLrpHrlVYhVp20xRZ7k=;
        b=j5JREa5hrfWNtX7P6SgrkBBOgZcrmHF4Ku1GTBOOZ+hJZLY0AzIJc5u23fm7CY2LBf
         QEaTGcQHOr6tRmoS9HGgckJOJNilxSnMtM1g73iaCn312umbX5bW6NiD/FODbq9D1Z5U
         gHfZZ1F6GJ20dSzsXiFEDzLt3UmmCd3ovJwerwJ4GRjjVQmGpyCqdHhvgfGAFO+41WVS
         jJg4AaLFWtLnNF65bsFE5Bacm0aGO7vgj7gF7yC4ZVXwrK63fmVn2r/26J7EQ2xxE3zm
         bcn2Pit0sL/egq7nbT2wqF9yS5CEEsYnx4jcItLD/1Q+h2K/c0S68E/ilOvetXiGg8oE
         WNmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYhtBZ3QtT4B/fwTiVLwF7O1oiNAP3ltXn3D/D+tFPOJlb0+dq+jH18aNe3Fb3JKJHVBpaQtjwbJWzD8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp9XxMwqSqcvKgVKqmEq3g9CtoIeP0GE12wTcrFcGd0iZmUpNe
	5xVxSMbCEbpIFpqPVHXnlkCQoQzVYxAaoIpRCRSSiBGZHoGLmqVZxuASqbywRk+WQSEHGGXN//5
	BqLpq
X-Gm-Gg: AYBFou0DqyEIBh/j1seVebgBneWxuLGucBqd8NEnIiaD1pbBhYdA/7MwYS1z1jsTJSD
	w5G85ujH3od2bV0WcIT02yBMl2HHV/2TLMzIvtalDKBonX9Gb9zreO0sEHkttLTNk+ba4zYCkeA
	eBJRnyZBUXKlHoz9buEbZYmjIF+NcQvvqLeLoUGQFmJiUKGUwjJcy/enDsoy0zTf/HC7hA2i9dn
	RKysnH3nNGRQ/Jxl1yhDkKpIqs/5Gqe9YikPhxZwSjAM7B0lQ0/8KQtTaYKdLAPi7YqbIgK1gos
	k3zT90JGnX7t0BWg+/sIfvsFzHlYTDj4Fnov7EnVMiuTCCdf1WYGPUqDygn1M5cfbzOBf3U25Qh
	ZAB6Ale9MNNQGDeTHvuIxXOu/dG5zhi95IogM94Mx3hTUH9l1Kk3rQywq/gfQXL2/2NxW4ujvGu
	NkltZ8pViDGY+aRV4a4wuhcuSAfD8I83fuWnjqSFvEm0EgmpX3XoU8i9NbWtQtMMVXaGe0r6t1q
	mrfjMG4xAUktUfXqN2B1S6pbg3gufJNmcXRDXC33/rphlTthD9GGmkSZYou/TNqV+J4riwrQkCr
	2/jA2BnucRZNQmkRQ0+quo1tk0U=
X-Received: by 2002:a05:620a:4485:b0:93e:920c:bfcd with SMTP id af79cd13be357-940ef97fc1dmr161016985a.57.1792823315488;
        Fri, 23 Oct 2026 23:28:35 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cddda5sm13992856d6.41.2026.10.23.23.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:28:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] sched: use static_branch_likely() for the NUMA
 balancing tick check
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Yafang Shao <laoar.shao@gmail.com>, mingo@redhat.com, peterz@infradead.org, 
 juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
 kprateek.nayak@amd.com, david@kernel.org, tim.c.chen@linux.intel.com, 
 yu.c.chen@intel.com, linux-kernel@vger.kernel.org
In-Reply-To: <CAKfTPtAkN06AKxQZrTCT+_C=x7v8f+S3EC=nkcdyJpuspfop3A@mail.gmail.com>
References: <20261023023105.28829-1-laoar.shao@gmail.com>
 <20261023023105.28829-3-laoar.shao@gmail.com>
 <CAKfTPtD7UsFkH=YPp9Faf0LX8ppNDw6hkVgFd-0Y30oSBYdgfg@mail.gmail.com>
 <179276890032.2252127.6836118712740428624.b4-reply@b4>
 <CAKfTPtAkN06AKxQZrTCT+_C=x7v8f+S3EC=nkcdyJpuspfop3A@mail.gmail.com>
Date: Sat, 24 Oct 2026 02:28:33 -0400
Message-Id: <179282331345.1990293.1612978888764380222.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-23 17:49 +0200, Vincent Guittot wrote:
> On Fri, 23 Oct 2026 at 17:21, Gregory Price (Meta) <gourry@gourry.net> wrote:
> >
> > On 2026-10-23 14:23 +0200, Vincent Guittot wrote:
> > > On Fri, 23 Oct 2026 at 04:31, Yafang Shao <laoar.shao@gmail.com> wrote:
> > > >
> > > > task_tick_fair() checks sched_numa_balancing on every tick. The
> > > > static_branch_unlikely() annotation reserves the nop for the disabled case,
> > > > so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=y) pays a
> > > > taken jump per tick. Flip the polarity to static_branch_likely() so that
> > > > the fast path matches the default.
> > > >
> > > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > Acked-by: Gregory Price (Meta) <gourry@gourry.net>
> > > > ---
> > > >  kernel/sched/fair.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index 973647ad6c2d..71dc47d6114d 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -15351,7 +15351,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
> > > >         if (queued)
> > > >                 return;
> > > >
> > > > -       if (static_branch_unlikely(&sched_numa_balancing))
> > > > +       if (static_branch_likely(&sched_numa_balancing))
> > >
> > > static_branch_unlikely is used by default for other static keys too
> > > like  sched_cluster_active, sched_cache_active, __sched_core_enabled
> > > sched_asym_cpucapacity and others ...
> >
> > every other instance checking sched_numa_balancing checks likely(), this
> > is the odd one out.
> 
> Some other places might be behind another key but otherwise it should
> be unlikely()
> 

On second look, I made a poor assumption on it being enabled by default.

On single-node systems, the key is off by default, even if numa
balancing is built in. I don't think this change makes a huge
difference either way - but probably just drop this patch.

~Gregory

-- 
~Gregory

