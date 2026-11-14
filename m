Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794644324;
	b=KptCxYZt+VRu/B7gfsp4eLq1+KicrVjYgKMbj4A3IgVsZxNujMSqvwK8E0vOgRGv+eDB
	 i32SvZvNRfzrceI9HMn1SvvOZcMr4USdMJqRCPmKW19Lt7GCFYkZzq4fMzn0bfMowuaHN
	 mTRnXwTpVrL4uuKuN/8AjJT8gilIXv8aExgZEu0K1nCSTwZPYT0kvUBfDxUDoELZVtYKe
	 nZnsQb0iAtpuPOM6vYJ3hASkN/POIiC1hFrMP4tKYLGC2CW1c23DKfp6Q7vZKqXwrzDvU
	 uqJNLM0XFkXanwFRsx2WDcdj1wOL99oRzZ0wTrYM4eGTSGMbmfu3MpDCNAqV3xeyQkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Yh2p04oNykfWrTijnUmHMSqYbxYNwj3PbOSWdtS/d/U=;
	b=0GKYBnJjQeuimnWA9O54YfZF9bVgv5qDfJvLwfblyakSCxerBRadoQxB7ozlsMICzZ25
	 2d1biEPYL+L0chtzM0wzxmA8w7xypBCTos61basxcM7yS3SEeOzQiab1cxrlYAibq+V+E
	 LAMGRhLxbnl88w5KyWc+YbBXrK0aqjgD7RSsXB6LT5wGJ80flALmkcJm9Wa/WOW3a29YN
	 cbwKZvhfpiyf8QSK9pWZ4ytboN+PuyHXRbyFPaG1oDzAo5e8VeyrKt30pRzEQEJy0/a9u
	 xdigLlRfwMvCQ4GvH2LcesdUBbGMcAkrj8Kd76zk1rt7DiQl7TXB0EA4Ffr9EC4XilQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Idqi6ogX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E6E606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E6E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Idqi6ogX
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so2734723a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794644322; cv=none;
        d=google.com; s=arc-20260327;
        b=A+mDx/ac7cq0otRhz6cmIpaaWzIg5uHrkUKz/plMGntV2T9BZF4tMQfBC7yULzpDFR
         Lx7PDDntxlaVx4tocKwbr5MRw8FEZnYhhqXaW2Ngju/GoOjKbexdV0AK+Vlxy22qWlEg
         XrTRS62DonjjWbzJgZUHsWEr87E/Vq6C9rQnZSLVajclawx87HdBJebYXQ9NNfDt5s9m
         enk00ehAXGJWHCoc8srcj7BaeYjY8g61FQBgKnITaACpzOjLw1A8GdVOMceATTIxJlyx
         tf9WKNAm29mk2AZP94QPbSMM8XlrOl4honxzmE8ZJLQ/8MT/dv1benIOgu+eJ7dixeQo
         lsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yh2p04oNykfWrTijnUmHMSqYbxYNwj3PbOSWdtS/d/U=;
        fh=yzh48lgVXOhma9xsWEOgLYIJmeOCiK1xje/5Yf6L0yQ=;
        b=qtV5qClQpERCsWMRi9DKtazXjNS4Adbtjz3EMFVzAJQ80r1j0BsI21SO01ureTgsYs
         3iNeRhoHPfvQ47H2e2ipYtFaq4xtCdee0//WVkeRvWny72Mi9HfPji10tPxN36D+XYJV
         SclMMR7sdvEVdE4E7n/ZQG4oqkED3l2TzqqufXbYH5OMtSPARSHr3XDDj9b98d6ATe1b
         Esc+Ce8OB8fpU1iVuSn4enGZoQe7WdG77+GlPb3MICFgI6v0v6GPSbr0uDDHjQBJC2XO
         1DDKlq0fhges83eEvdNq3tvniR+UP2X3whSrR+jIvD+Sey62L+r4AQumfbb+bkKwQLo0
         YYIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794644322; x=1795249122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yh2p04oNykfWrTijnUmHMSqYbxYNwj3PbOSWdtS/d/U=;
        b=Idqi6ogXvsl4ocrXkuQ1tQScmsPs/l1gOUdA6Jcr0IZWQqTDy3wxsT/GYDDzouv20i
         x+XiO8gpn5ETvWQqUROlkv8YxuGvx+uLX65XWGNjz7je2LkS49/DQC81jAw1gbl6hx9y
         hg4CunGM3qFQPPgDubaQs6e7pktE/BJJ5Z0mUIH70Uc3M/niW7FWltr/LhFdlVq87G0J
         TIQxf1ZAa6NNYSKXyvgFb0OEc6W2CxhBqie+ojvUTxsTFguS6OJf3+uMbd2ywUEQR4Yv
         WsabIMNEhNIc9PAvlMJT4+46PcRhJ4ldejdNuyg4P7N0HjP0rym5lIMFB7X2ykGbo6ck
         LP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644322; x=1795249122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yh2p04oNykfWrTijnUmHMSqYbxYNwj3PbOSWdtS/d/U=;
        b=ANf2UBMf5Tk6VDBgDIIt6/+dIr4lvxMBBSjf4VSRD3L/voE8xCTWDiwt0Kt8gKqbG4
         AAnUYspK2GDR+OcBXp37AqlEoXrjnPBurC6QdFH2l5KJ9xosGt1y9opQpfIRCTxdwrgw
         1a2tbKRbVimzClZol2+RxT7zRiZCGDZJwoB0ut/HG3LxvmH13PXa3ifibVxcBsXokR0N
         Etg4r4+arJRc6egylOzMzDd9TYKAHSv2+xFbulW/zkTyOMFlq6Twci5kFpLHs7p0pRhH
         o4fsOvf1lcojj9dHFyGPJa4jqh2Z9EKBQw3CfYJhNkDN4njZ7ktgvAVevqtQMlZIp73m
         HbbA==
X-Forwarded-Encrypted: i=1; AL+hErFyfshqMJmCjsl97LeW9ZXpMeemku2A3IRP9Nxytxb2NWoIYK0KxHHeXRs6gGjXTGUxPdwKWlNmZKHIuaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z93PbzrRhXOaR5t0d8nhFspHdSpurANrdmZJDXKte5pqzn7NhIK
	/zzOvRhDLQfOTroMeBA+CR7t391fp9aT2e6deTE/kFAZZpCWzBzz0c5Ar2NUbh/CebHyBwHloov
	JBHx8dDPd1uk2VGlYyQQ3bxbVVBNBx+OkDdYViwAq0Q==
X-Gm-Gg: AYBFou0m+mWrCGQENi9FRearMuF6jM4m5LhpJycHhu5+CUdTrgUihuz4FkSwhSa+0AN
	JrkImGnLSwbR6So6JplIln7ipU36mf+Z8oq03rYS8/a4zWDeuYK5czsGVck3MpfGcYPuLhxN31Z
	yTEDz8SJW+39b1y1w0fJZHyv+wIUebAMFniMaDGHOsoVJIGDocy0sJjdJTbW4AUo41k6bQUv9UJ
	ltCXWotfGQ27pLQKiV+OwOOgfpUzbIDa2xv2NwLNg7jIqh8b4mpChxgd1Bp+X5Furnacr45cKR5
	HpjvKxq3+3xVmzAS/Bvn+exGA9irGuOl0xPg2R9N0JLz4LNc6+icXpVD4Z5NrlAJVO1deVx95jU
	RZppV3cUx5jHB/KsoYB/44YURipgqw8PBma+C5xb0ed+ZcTQGTYT4ITN0TcdDU2gZDKh0NA==
X-Received: by 2002:a05:6402:23d1:b0:6b1:ca87:c588 with SMTP id
 4fb4d7f45d1cf-6b7c0d03742mr3423273a12.37.1794644322116; Sat, 14 Nov 2026
 00:18:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113153157.2495664-1-usama.arif@linux.dev> <eba9d3df71f3f37bf7a318854a1ab6bf1cfb1981.camel@surriel.com>
In-Reply-To: <eba9d3df71f3f37bf7a318854a1ab6bf1cfb1981.camel@surriel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sat, 14 Nov 2026 09:18:30 +0100
X-Gm-Features: AclHuK-DWsESdLIexmafJNcsytV_5m9A9eaCCw2GnljLrt9_-nMsnLRu-KG7fPU
Message-ID: <CAKfTPtCJLci=Yzq6B0-hK5L0m5iQPw1Y0NDQhKEaV6reg-690g@mail.gmail.com>
Subject: Re: [PATCH] Revert "sched/fair: Add SIS_UTIL support to select_idle_capacity()"
To: Rik van Riel <riel@surriel.com>
Cc: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org, mingo@redhat.com, 
	kprateek.nayak@amd.com, arighi@nvidia.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, samuelcrossley@gmail.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, kas@kernel.org, 
	Arnav Aghav <aghav@meta.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 20:32, Rik van Riel <riel@surriel.com> wrote:
>
> On Fri, 2026-11-13 at 07:31 -0800, Usama Arif wrote:
> >
> > On a 72-CPU NVIDIA grace arm64 server, small reported capacity
> > differences
> > (1013-1024) within the single LLC activate asymmetric selection. Both
> > the reference and affected kernels were observed with a zero scan
> > hint. The reference kernel ignored it and still searched the domain.
> > A latency-sensitive, wakeup-heavy production workload saw its
> > reported
> > minute p50 latencies average 129 ms on the reference kernel and 223
> > ms
> > on the affected kernel.
> >
> > Disabling SIS_UTIL reduced the aggregate involuntary context switch
> > rate of worker main threads from 71.6k/s to 13.3k/s; re-enabling it
> > raised the rate to 73.7k/s.
>
> Afaik, the asymmetrical selection is supposed
> to solve a very specific problem: when a task
> requires X amount of CPU capacity to run, we
> try to avoid scheduling it on a CPU that has
> only a fraction of X available.
>
> This creates the issue that a task that appears
> to "need" exactly X, because it's been running
> on a CPU with full available capacity, ends up
> not being scheduled at all when the available
> idle core has X-3% available capacity, because
> that CPU happens to spend 3% of its time handling
> interrupts, or running something else.

The task will be scheduled on this idle cpu/core of (X-3% capacity) if
no other idle CPU with X capacity is available.
The selection in select_idle_capacity is:
- Idle core with enough capacity
- Idle core with enough capacity but doesn't fullfill uclamp_min
- Idle core that doesn't fit
- Idle CPU with enough capacity
- Idle CPU with enough capacity but doesn't fullfill uclamp_min
- Idle CPU that doesn't fit

>
> In that situation, it will be better to run the
> task on the CPU with 97% capacity right now,
> than to not run the task until a CPU frees up
> later.
>
> Things like SMT and power-driven hardware
> scaling complicate the matter further, because
> we simply cannot see the full amount of capacity
> that is available on each CPU.
>
> That makes me wonder if we should simply accept
> any CPU that's "close enough to X" when dealing
> with asymmetrical placement.
>
> Say, anything that's above 3/4 of the capacity
> of X would be considered good enough to run the task.
>
> That still prevents us from placing a CPU intensive
> task on a little core in a big.LITTLE system, or
> from placing a task on a CPU that spends 80% of its
> time handling interrupts, but it will allow a task
> to run right now, when the capacity imbalance is small.
>
> Does that make sense, or am I forgetting something
> important?
>
> --
> All Rights Reversed.
