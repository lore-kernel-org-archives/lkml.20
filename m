Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794766058;
	b=E39qguI5QwX9ymC6tIsRgRH5tx/mGzPyOXaeMSQE4t10qs+wSL1PIk0cj9CrE7pNV6tf
	 Hx9XGXYdIpDPUpnHqtkIb4GhKtVYWOUzVv3pTMQhtBA9BfRBYLZ26FdLfaEs+vzj6+kIB
	 QWRtJJDzYOpWnEFpr6KAIAPpuFYBRyAGRQSVfhwhv9GeFjDHDTeazJXN1jZtVVQe3CYgy
	 ZGZcNIB9SHqJKeEf9moBsQFCGyUKFpIpFVH2p96SwVacYmKViIC7NNV6VKOxKNKZa20oO
	 a8MIcLIi5RfQKl8T2r6uitsg/TDYFX5vSlFCfWOFfE+k5s5YXmdtsILlZVNDp4tUGrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
	b=mfDno6Sb720U+VwO6wGfMxQcWyZYz35t5HNs6B+S0DjvJD14VrVBVXBapMLKSQEA6OYT
	 F1EPixQrJcDIpyQh6iBsKwwqCnbqxXXsA0kJKohvABEijF3l2lX+DISvdFTdXsgtrzHxr
	 JnFFvLcTyUQBqsGqDENYzwBjyiajqrtEj3epuTBtHx9CFcnbeoVwB5qoPkgYFQ1FKUBCo
	 2PDLCfVTP9E4CIi5s/NB2591F/CL4US86/BMQJoWLMoms/9URsYng7ENouSz1XcsbEQey
	 wHNn0aZifQeLACLKO9Y6/59GiSVNkLTkQSncK6wjFzK8P9oOr1ZTovs6Fok3srlJPBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec8bZ1KT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C9606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242C9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec8bZ1KT
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55c7445cf85so198091cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766056; cv=none;
        d=google.com; s=arc-20260327;
        b=UmwlFL1wzW9a5xcdHJyRKYj/3y3GqBNlw5NooWTvY3oG0JGqjc2bspiSGtFM/QQIgs
         7rR6DCS9uiyQ0lJxIAxU4gixdZhD9LUMxGMyYypQQdNhB/WZiudp3GYS3CYrJz/GpPLz
         wGjsbkEaAEgdcYKQByDF7T2Ohfee4X+5qkA3mSDf7mx/qY7e+2y2gpzEZt2kPtu8ciT1
         83hww5LQmZ2BmO7sR/FNSJzFhaprXT2Dcm0HBdpWXEkMi7XebvEPgCe3CP5uRiB1JZmN
         J9aC5MfpS+BzhTBrnB20yp2TJ1sJb8FjPD9im6mtLQS70m299skLIqwxgCy4zNSpO7hk
         FIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
        fh=yv8jUPFKq1ifu3Kq/aAp5RjNnXsca3PFJsx6/6zNsEU=;
        b=mZJiDW3IujnRTcquSrgvqMrnaaLQAJFsOilffRzaSYgjnzIT+GiSqQNb+2sG0kRqte
         NyEnc3tek88rkkuERiM+sNH3ioaoqkzybKPd1WT6FSCuDYflJ45hkbLG9PI38kzoGVXY
         ZMhidsMWWCUVIcER+3up5F+aAX6n9NFFYH2zOasKF9gXaXMz19JR0lLQ/GNSv8Vx/6B/
         hLaolgF5J6c3BzME0Nhpij5qTi18CU9GjRv78VwuTba06ySOKPKdZzxM4qr1/5dzpSK4
         eiwbxh1EVdhLiv958PXwFa9OTBUW9KVIsrjffZtJ4Mhc13MdzMNbZs6bdVv3EjVXJQDm
         +7sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794766056; x=1795370856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
        b=ec8bZ1KTqxlw+uJd/sieq8Cp5zUA1fW8jj2Sx+RG7DnEzPtQN2KKWeCe7EV/Kj3UXt
         WueXWHJ/L72qj/bSKs+MDatjYwMdXGbWmWQRlm2eeh+aHJsTRszA1SCVKAqSWFZ8FM5h
         ENmDy9j8q2hWJNZx/t50j6m4JI2ZzgnnHfmnengB+2DhV/3SEqFzdVpd1Rghk7q16vlA
         XNojtRkaRP6dN3BaZPVYgeqAKwDFAUE73bwUZcwRnlyrssvHo/TDuoz5p4dSQ6f3WDBm
         GJT/ZfunKCIsymu8oF0wDQwo2Um+ZtjAViAIdG0zb+yE5p0R8+gzjX+2jA/afqEX3yXl
         552Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766056; x=1795370856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7QicanKXrY2xsRWJ0fWGMzqxkgBfx3GeNDw0g+HWqA=;
        b=WnRxbo/4+kCuA9QVaA/5diHB6FWppgxTkyhLHlHR65HTaBJIQG/hR2A5pls4umRKTi
         MipEnh3RijDhRUh4hS6Zo5zeMfd+YJWaXYk+DoE0T1+PDKOXwxyXdqrwLI73GnN0h/Qv
         0bVi5DGx5OkL1zrGu6bv6p6P7Rj6JVVUwu8D1vX5Oxz+HnN2rkqB+u4w09nImfA+V9qo
         WwUKVmamyWzlmEd9i0MMlDrubNUqi9ErOcKIgumwZ+AHOWdEk1V0GvFtmOWhWy8It6Oz
         L8A25VpETObNrZEAx/OVtMCxnX3jZ8S4iNyI6RMaxj7Gpips1VLFtZ53ivbRATApOzss
         mU6w==
X-Forwarded-Encrypted: i=1; AL+hErFAl6SQU6lZPM4YCapAngsV/TQIQP3sR/9BgfGt4/GZ2n9jCa117XhrCQ1OvtyhwEPYGKwM299HXI1dNbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kZSycz8Z6RNNaR/PFTgI7XE3buMXSl3TF3FlzuwsudWVtdSUn
	BDk1ofjEXXTtFuJMUZ0ZSPKcz0k3HpAgEERxggVLxV5lCHYgF4xJ10WG6a/4PAVFQi+R1Vv7x/y
	DoSGHI+DCAMDNQHXK5Kf1PUDST/ZFZB2zTvotB0KJ
X-Gm-Gg: AYBFou0IjFOk/vtB0HfWQUNqjAidIms27DxtBXSWz3BqD+MlKxIrwdx0bx17412aKmH
	9b5GI6WosU/T0y8beHwLqdE/ByF3F9D0mFL1aqWyD5yNRHfx+EBmzpHdz8PP9u5kf2GJrWgFYnF
	TVNYjVFKS7Q6CRv176fNBQhL5yWdOuvCGUWeHDqMi9tlXmunfch/LOTQVr2t/W4ySJ0hFFRj1Qf
	lhF7SKHTCoVEhIKkRClzDKEP7ZjgT795VgsP27kvFmAvDvwHY3+p7jQUBqoE1I6fTeib31dCcH+
	lPZKz3fW7XHThJHgc5c/HrWnKg4F6xZg7JhMeqOiFVf7qplc/0+5+P2LUDHMYaQOC4fkOaMyQUx
	OMWlqM6uNtJ9/P5WHEmEo/pL7VoaEKKfb+XO0xOdfjIt2gqIscdrX9ysbdA==
X-Received: by 2002:a05:622a:408a:b0:532:9220:a9ae with SMTP id
 d75a77b69052e-55c473ac0e3mr29115731cf.6.1794766055199; Sun, 15 Nov 2026
 10:07:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 15 Nov 2026 10:07:22 -0800
X-Gm-Features: AclHuK8I2aJMnL-w4kk3icBRZF4Kavcx9MZm99nl2-dp0fTFJmi5uR4vKxLAUEw
Message-ID: <CAP-5=fWLH6hT-YR172HMHhnepEMmUCaqTLCD0kTMVLgdad0uxw@mail.gmail.com>
Subject: Re: [PATCH v7 00/14] alpha/perf: add ProfileMe sampling
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 8:30=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The 21264 from EV67 on, and the 21364, have a second performance counter
> mode, ProfileMe, alongside the Aggregate mode that the driver uses today.
> An Aggregate mode sample reports the PC where the overflow interrupt was
> taken. On an EV7 that is anywhere from 15 instructions before to 12
> after the one that overflowed the counter, which makes perf annotate
> output close to useless. In ProfileMe mode the CPU picks one fetched
> instruction, follows it down the pipeline, and reports its PC along with
> what happened to it: whether it retired, whether it trapped and why,
> whether it was a mispredicted branch, stalled before map, or was killed
> on a wrong path, and what PCTR1 counted while it was in flight.
>
> Patch 1 stops alpha_pmu_del() from indexing the counter arrays at -1
> for an event that a failed group schedule rolls back before it has a
> counter. Patch 2 fixes a constant passed to the wrong PALcode call, with
> no functional change. Patch 3 adds the sysfs format and event attributes
> the perf tool needs to name raw events. Patch 4 fixes counts lost when
> an event is stopped before its first start, and patch 5 stops reporting
> user registers that the entry code has not saved yet. Patch 6 ignores
> counter interrupts that were pending when the counter was rewritten,
> and stops counting an overflow twice when a read races its interrupt.
> Patch 7 adds ProfileMe sampling, selected with precise_ip or a new
> profileme config bit, so cycles:p and perf record's default event use
> it. Patch 8 attaches the status registers to each sample as
> PERF_SAMPLE_RAW data, and patch 9 adds an option to randomize the
> sampling interval so that it cannot lock onto a loop. Patches 10 and 11
> report what PCTR1 counted as the sample weight and the data source of
> memory accesses, DTB hits and misses. Patch 12 adds filters that keep
> only retired, mispredicted or trapping instructions, and patch 13 makes
> precise events sample only retired ones. Patch 14 lets ProfileMe events
> exclude user or kernel samples, so that perf record works without root
> at the default perf_event_paranoid.
>
> A separate series for perf-tools-next adds a decoder for the raw data
> to perf report -D and perf script -D, and a script that sums the status
> by symbol or by instruction, in the style of DCPI, and a perf mem event.
>
> The two modes cannot run at the same time, because PCTR_CTL[SL0] sets
> the mode for both counters. A ProfileMe event is scheduled alone, and
> perf multiplexes it with any other hardware events. perf stat does not
> ask for precise events, so it keeps using Aggregate mode.
>
> To try it:
>
>   perf record -e cycles:p -- ./workload
>   perf annotate
>
> I tested this on an AlphaServer ES47 (EV7). Samples from a
> 16-instruction loop land on all 16 instructions rather than on 4 PCs.
> DTB misses and unaligned traps are attributed to the faulting load. A
> branch on random data shows up as mispredicted in 21% of its samples,
> and in 0% with sorted data. A 12 minute perf record -a while building
> git took 4.45 million samples with no warnings. Sampling every 10000
> instructions, which used to wedge the CPU, ran 66 times without a hang.
> With precise_ip, killed instructions went from 67% of the samples of a
> mispredicting loop to none. On two CPUs, this version survived 62 runs
> that mix sampling, filters, context switches and multiplexing, with no
> warnings. As a normal user, perf record took 8746 samples, none of them
> in the kernel. A two-event group multiplexed against a third event,
> which makes the core roll the group back through alpha_pmu_del(),
> counts the same instructions as one event counted alone.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Hi Matt,

Thanks for v7! This version addresses all the feedback thoroughly:
- The group rollback guard in patch 1 and patch 7 cleanly handles
  unassigned events during transaction rollbacks.
- The clamping in patch 9 ensures the randomized period remains positive.
- The data source, sample weight, config1 filters, precise retirement
  default, and exclude support in patches 10-14 provide great generic
  tooling integration.

For the series:
Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
> Changes in v7:
> - New patch 1: do not update or turn off counter -1 in alpha_pmu_del()
>   for an event that group_sched_in() rolls back before it has a
>   counter. Found by Sashiko.
> - Patch 7: park the ProfileMe counters only for an event that had them.
> - Patch 9: keep the randomized interval positive when the counter
>   overshot by nearly a whole period. Found by Sashiko.
> - Patches 2 to 14: picked up Reviewed-by and Tested-by from Magnus
>   Lindholm.
> - Link to v6: https://patch.msgid.link/20261104-alpha-profileme-v6-0-6336=
2e9290a3@gmail.com
>
> Changes in v6:
> - New patch 5: ignore an overflow interrupt for a counter that has not
>   overflowed since it was written, and do not count an overflow twice
>   when a read races its interrupt. Counters are now written at most
>   half their range below overflow, so the two can be told apart.
>   Suggested by Ian Rogers, after Sashiko found that a PCTR1 interrupt
>   pending when a ProfileMe event was scheduled in was taken as a
>   window close.
> - Patch 6: drop the stopped event check and the caveat about stale
>   interrupts, which patch 5 now covers.
> - Patch 10: also report a memory access that retired without a DTB
>   miss trap as a DTB hit, a load into $31 or $f31 as a prefetch, and
>   leave out the ldq_u UNOP. Thanks to Ian Rogers.
> - Patch 12: say in the commit message that the kept samples carry the
>   full period, so the sample rate in frequency mode falls by the
>   killed fraction. Thanks to Ian Rogers.
> - New patch 13: honor exclude_user and exclude_kernel for ProfileMe
>   events by dropping samples, so perf record works without root.
>   Suggested by Ian Rogers.
> - Link to v5: https://patch.msgid.link/20261103-alpha-profileme-v5-0-bbe3=
937fbf3a@gmail.com
>
> Changes in v5:
> - Patch 5: refuse precise_ip 3, as a sample with a PALmode PMPC keeps
>   the interrupted PC. Thanks to Magnus Lindholm.
> - New patches 8 to 11, from Ian Rogers' suggestions: the sample weight,
>   the data source of DTB misses, config1 filters, and retired-only
>   precise samples. The last changes what a default perf record shows.
> - Link to v4: https://patch.msgid.link/20261102-alpha-profileme-v4-0-61e0=
0f5e1da8@gmail.com
>
> Changes in v4:
> - Patch 4: move __entry_save_end past the r16-r18 stores in entSys,
>   as PAL_callsys does not save them and interrupts are still enabled
>   there.
> - Patch 5: report the user registers when the profiled instruction is
>   in the entry code but the interrupt was taken after it, since
>   perf_get_regs_user() sees the PMPC rather than the interrupted PC.
> - Link to v3: https://patch.msgid.link/20261101-alpha-profileme-v3-0-92d5=
11b5a044@gmail.com
>
> Changes in v3:
> - New patch 3: clear PERF_HES_UPTODATE when an event starts counting,
>   so that a stop before the first start does not lose the count.
> - New patch 4: report no user registers for a sample taken in the entry
>   code, where the frame at task_pt_regs() is not complete. An interrupt
>   nested on one taken there is still not caught.
> - Patch 5: a user instruction whose interrupt is taken in the kernel now
>   reports its PC with no registers or user stack, as the frame at
>   task_pt_regs() may not be built yet. Thanks to Magnus Lindholm for
>   finding this and for the fix.
> - Patch 5: also move the counter away from overflow when a ProfileMe
>   event is removed, or stopped without PERF_EF_UPDATE, as
>   alpha_pmu_del() does not go through alpha_pmu_stop().
> - Patch 5: ignore an interrupt that was pending when the event was
>   stopped. Document that rewriting a counter does not cancel one.
> - Link to v2: https://patch.msgid.link/20261030-alpha-profileme-v2-0-c702=
f1c65272@gmail.com
>
> Changes in v2:
> - Patch 1: explain why bit 0 clear means all processes, although the
>   Architecture Reference Manual says otherwise.
> - Patch 3: fix a CPU wedge during high-rate ProfileMe sampling. The
>   ProfileMe counters are now written twice, and a stopped counter is
>   moved away from overflow, as EV67 HRM PALcode restrictions 32 and 38
>   require.
> - Patch 3: set the profiled PC in place in the trap frame of the
>   instruction's mode instead of in a pt_regs copy on the stack, so
>   sampled registers and stack values are those of the right frame.
>   A kernel instruction whose interrupt is taken in user mode gets a
>   per-CPU frame holding only its PC, so the user frame is not changed.
> - Patch 4: drop the reserved field and pack the 64-bit fields of
>   struct alpha_profileme_sample, so they are 8-byte aligned in the
>   sample record and the record needs no padding. This changes the raw
>   data layout.
> - Patch 5: compute the jitter with mul_u64_u32_shr() and saturate the
>   sum, so that large periods cannot overflow.
> - Link to v1: https://patch.msgid.link/20261028-alpha-profileme-v1-0-d44b=
52bf2500@gmail.com
>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Ingo Molnar <mingo@redhat.com>
> To: Arnaldo Carvalho de Melo <acme@kernel.org>
> To: Namhyung Kim <namhyung@kernel.org>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Ian Rogers <irogers@google.com>
> To: Adrian Hunter <adrian.hunter@intel.com>
> To: James Clark <james.clark@linaro.org>
> To: Richard Henderson <richard.henderson@linaro.org>
> To: Matt Turner <mattst88@gmail.com>
> To: Magnus Lindholm <linmag7@gmail.com>
> To: Michael Cree <mcree@orcon.net.nz>
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
>
> ---
> Matt Turner (14):
>       alpha/perf: do not update an event that has no counter in alpha_pmu=
_del()
>       alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the logging options cal=
l
>       alpha/perf: add sysfs format and event attributes
>       alpha/perf: clear PERF_HES_UPTODATE when an event starts counting
>       alpha/perf: do not report user registers from the entry code
>       alpha/perf: ignore overflow interrupts the counter does not account=
 for
>       alpha/perf: implement ProfileMe sampling
>       alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW data
>       alpha/perf: optionally randomize the ProfileMe sampling interval
>       alpha/perf: report the ProfileMe window count as the sample weight
>       alpha/perf: report the data source of ProfileMe memory accesses
>       alpha/perf: add ProfileMe sample filters
>       alpha/perf: sample only retired instructions for precise events
>       alpha/perf: honor exclude_user and exclude_kernel for ProfileMe eve=
nts
>
>  arch/alpha/include/asm/perf_event.h      |   2 +
>  arch/alpha/include/asm/ptrace.h          |  12 +
>  arch/alpha/include/asm/wrperfmon.h       |  36 ++
>  arch/alpha/include/uapi/asm/perf_event.h |  31 ++
>  arch/alpha/kernel/entry.S                |   9 +
>  arch/alpha/kernel/perf_event.c           | 675 +++++++++++++++++++++++++=
++++--
>  arch/alpha/kernel/perf_regs.c            |  13 +
>  7 files changed, 754 insertions(+), 24 deletions(-)
> ---
> base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
> change-id: 20261024-alpha-profileme-6e98a977cb54
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>
