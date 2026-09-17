Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58713524B02
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651707; cv=pass; b=hMowFIymcAFTLqZACZYp2+NiAfqR+I/yPWrlJe+VlSiAMLRrO7JySX4DWwqfdA6/LWtjWah94ShVI3ElMAaYuvWw4KvOWGzIln2fhVJwpDryaqdHyakNHOKiv7jZLGgFPIsUynf6Etwy1EQNKlzBOhP10VjNLpLBQmfZycYjPMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651707; c=relaxed/simple;
	bh=0WJXIdLQe4ElSlYT4i0l99nxpQnfGCMgUfJt7LZpHAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWwbxanuGmo95jJ9g5bN0+Vw6pzbFi4y2bU7wFO+cK9wtOuQIVRbjOV99o5BDEfUexlLyXeDHzdjVjUgfbQqdpRVi38daIkBkKaWP7Fsv56BAl1lTbTy6h38L7tINYqiJxP/o7aUwANNE+DLiw5ppUnHicrsS594Hnizv1WgTes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXkPQMb0; arc=pass smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXkPQMb0"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so119898566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789651702; cv=none;
        d=google.com; s=arc-20260327;
        b=sCubd1O9GLgV9lV9PsI2kQh36/p6nqfmCid2j5S0czHy6rtZCcpKY7X45+mCI/VfoS
         ZdTLLlR/IkXnnk1gQGlPhq4k4vGjvVKM8APvFP4xUyDCn0/2cXz/q0ppL+U824HFl74W
         8cqpGO8lII4YQsGshl3CznSz17Ra9R7pt4KMVATrK7WswHn4JprKhgeWjOcVLclIpR4r
         2rH52Vqo53G0nvZhU797UAMVMzVwTor1x0v9O1rkTlKpHzvdFajEud9hEAr6SRb/DXs8
         fiytjzBaHtM5PPciAoaFqlWHV6IaPRVMlhA84hOYwC+PvkAObs+gOZ5ieuOlDE9/kzVm
         rTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LiiEkFORC49HDxXLzDmb4xC1eRwsEsw+cw7nlo0p/HM=;
        fh=S4mCsw2vstU7wLASPVK/YgPTvrUzAFFZd8neY7LEha0=;
        b=Im2owiSIxQcpa3Dyck7tFIHw/ZpLwq4R0keqMEdoJPHKRKVL/H4p9Wd54WRoN8Jwit
         A6Zor6ydC0D9llNCSWR8J5J5nHon8syoMQ+yktFBaAC3QPf8JbW4mrTH6EI2gBHGuZqi
         2aCzaoGUUeWDwwkO6gSd2e/WzfVGMsiesw0L6rPF0tuRmXkzBLMpQXDmBDuiz+Q8LyFJ
         AgL65lBmLHcDdS3ktZxndWk3Rj3V4kb7VXwjGFOL03R6tj9c4iv1VY+V5uzpDtf0bWik
         W2kTbGGAiW4sQI9YhkZj/10T3uO9E4lgYwFh1IDgogTVYGeDU0KbMqw7xgNN7NbEKPRD
         8PUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651702; x=1790256502; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiiEkFORC49HDxXLzDmb4xC1eRwsEsw+cw7nlo0p/HM=;
        b=rXkPQMb0WW/RNOg6SNxG6XjlI3wt1sebSjrFuQc+I7o8qmHKzwzSNnYXeqMn99PzQH
         YViEUhnfxvg3VYlzaB+h5gu1428hntn7O9x/BWRN5Wfw8Jjvy/HpMfIfR5ATVI37YpgE
         9BIuhcu4HXmqhb2Ubtq9dEExv9J1RPeq0IDp9zphN83mjS7hZT7MosZrgdpq2+ztnk+t
         BkH2Cy+DaVEuuG77vUd+hOgLSW/uyCZwrGOmC+gtTRY4BXOgshZodfNjbU8fK+90I5X3
         BT3IgusQ8DXWHgwQNmXEI6oif2lTYjFlbM9pwWgK6qLTn6nXaa0OXHHUG/8prdBMrFP3
         g+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651702; x=1790256502;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LiiEkFORC49HDxXLzDmb4xC1eRwsEsw+cw7nlo0p/HM=;
        b=n5EGFOkwPWqa/5Q3jFi8x/DSxGGMS8PJQ6KVV8qgaYe9Lh7+h2LByJ8Mr7K62/XZi3
         2CTQbeapcSV1PO1xrBNeBzCf2gZe44pbMUZgnMNRM8ZF3f4uPthTS2DVDPBk1IY8w+1D
         AQxtdIyqhWvdmOGrKVPo3JterlKUu5iGNOXPbyGp4SgAMkhv9NpROQojgxyCrLMwl+mU
         dXVXV9LwNiCb6tIR/QwbBTkGm0unfcj4yhovGWTwV96D3RarvqjnH/vI69ZLM6QEK/+m
         7ZUjvS/9fMzV9nu49142MK3xn+pbZDqO/FWgjNOgEBqMQYvJnalXMIA3pRXiYlicUF4w
         /5QA==
X-Forwarded-Encrypted: i=1; AKwUvBy5yotNavdPvaFZZoTO6hYwHAQ1w+hedKQrr4cQwTei/BUiSEz47scAQyS/a09a3r5X7pBaWOPDanBd5Eo=@vger.kernel.org
X-Gm-Message-State: AFuF++m3F4JVlglsNsYUdB1syuZyCxaZDUITwcHrdSL98vvMva1oxudB
	+BTnWTtUjYyITB23VrCstM8Oa7AWjD4E2YBB/xtRFekcD2g2GxXAMPHFydl3iMbJURvFpEL+fOq
	3+Q0Monv6aTGdE5/4rR4vssVwKcwa1PKPRicAccF+pQ==
X-Gm-Gg: AYBFou0aD/UyU2fD4C/COmGtUoQmkgW4cRNSn7Z7b9oznZ4cwQjexAP7SULSFA9gx3K
	NMofc+6Mrqtjig2tj8l1TPQxEUU84Y202ACCE2Al5TU7Dvq2VGvL1dfEA5XfTqY7gf4fcSXHyfR
	IiDwCGByQovB9RJ/v/Gi4YyHipfVrnNbwpSbTc9p2XJvBJrqHS0jTN3hwxKpyNsR8JcAwiX00a6
	NR48HmPlrwh9DIi/jSaHpNnQKKgwctnBNJPe/CeTjhPOEvlf8Pw98RuCzsc/8x4Iz9sKgQtKzKP
	K9+ixGAk1VYXOvZed5NjtFKblfW9GtyMH6jkqtBKxpbWsB+0MCggAuV+pn0Ox496QCX9nVkmuCA
	6vYW/Apx+XBuP
X-Received: by 2002:a17:907:3d05:b0:c29:6cb1:bc56 with SMTP id
 a640c23a62f3a-c29e532bea8mr511794166b.46.1789651701772; Thu, 17 Sep 2026
 06:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916100116.701206-1-christian.loehle@arm.com> <20260916100116.701206-2-christian.loehle@arm.com>
In-Reply-To: <20260916100116.701206-2-christian.loehle@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 17 Sep 2026 15:28:10 +0200
X-Gm-Features: AcwNN1UwSb7UKw5POOwin-HQQq1l6kQgh3OhpbZxQbQppke2fZwr_hYswOySiB8
Message-ID: <CAKfTPtCvfMEY__n58hGpbbEK88p82jT1kNTQF7tJfMFjBo9msw@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched/fair: Drop idle recency from slow-path CPU selection
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Beata Michalska <beata.michalska@arm.com>, 
	Elif Topuz <elif.topuz@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Shubhang Kaushik <sh@gentwo.org>, 
	Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 12:01, Christian Loehle
<christian.loehle@arm.com> wrote:
>
> The slow-path CPU picker favours the most recently idle CPU as a proxy
> for cache warmth.
>
> A more recent idle stamp may make ongoing entry more likely. Among CPUs
> with equal advertised exit latency, this may favour the one with the
> highest wakeup cost: if entry cannot be aborted, it must finish entry and
> then exit, while an already-resident CPU only needs to exit. The same
> advertised worst-case latency covers both cases.
>
> idle_stamp does not track the current CPUIdle entry, so an older
> scheduler-idle CPU may also be re-entering.
>
> A recent scheduler-idle transition may also mark a short gap in recurring
> task activity, so the CPU may soon be busy again.
>
> Drop the timestamp tie-break, retaining the first idle candidate unless
> a lower advertised exit latency is found.

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  kernel/sched/fair.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7455a83a6a99..ff5793bddc35 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8459,7 +8459,6 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
>  {
>         unsigned long load, min_load = ULONG_MAX;
>         unsigned int min_exit_latency = UINT_MAX;
> -       u64 latest_idle_timestamp = 0;
>         int least_loaded_cpu = this_cpu;
>         int shallowest_idle_cpu = -1;
>         int i;
> @@ -8480,23 +8479,11 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
>
>                 if (available_idle_cpu(i)) {
>                         struct cpuidle_state *idle = idle_get_state(rq);
>                         if (idle && idle->exit_latency < min_exit_latency) {
> -                               /*
> -                                * We give priority to a CPU whose idle state
> -                                * has the smallest exit latency irrespective
> -                                * of any idle timestamp.
> -                                */
>                                 min_exit_latency = idle->exit_latency;
> -                               latest_idle_timestamp = rq->idle_stamp;
>                                 shallowest_idle_cpu = i;
>                         } else if ((!idle || idle->exit_latency == min_exit_latency) &&
> -                                  rq->idle_stamp > latest_idle_timestamp) {
> -                               /*
> -                                * If equal or no active idle state, then
> -                                * the most recently idled CPU might have
> -                                * a warmer cache.
> -                                */
> -                               latest_idle_timestamp = rq->idle_stamp;
> +                                  shallowest_idle_cpu == -1) {
>                                 shallowest_idle_cpu = i;
>                         }
>                 } else if (shallowest_idle_cpu == -1) {
> --
> 2.34.1
