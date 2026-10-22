Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792659956;
	b=nuHySKlUhoNkOvxlUWOFxuiXTBTfEdAqS84QRS8I0tkWmBJOa+gc1g6IZ8WFkyi2630Q
	 P4TRhrqQmSe0x6dsW5yHve9GDLmSoHn3+DQYVM4J/h+dIbwTP/COm1RziGXThj3K8yi9f
	 m1VSasAadzaDKNjXQvA/Rdc9R4jRppj2ryntcXzcUgvpa0gCPgTiK/CmGyDIX0C/BQDhY
	 x7oevjwh27c4Dend14CQ1gDMLJ5YaG9JEF93fWlnIbf/zXc0OiwxQvz+U9dTpNDFTUcs5
	 qbZjriW0DVz56mwmfltR1aQV/3EYviGHC1iLI3yzIUbFuPEkW67kT+1i85eIocdEGJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WSvbPCi4zYzhTMFnKEKNsfKi+MS04qU0+tLIER7I1B0=;
	b=Q8yjliXygLCTn0Ihf1nIEplkLpjkUfjGfyJWy1cgNBQD+2yU7rD9hIceXetFNmXrJ+Mh
	 okDFBnDqRxq1lpGat/cptyc4E3HK3kqz5tdiJ6QcjKyxF7HBkR932qPb3SMh4P9R0T9ZV
	 IHW+XgHO0cMYTYtZ5WzRqspX/ckBgrK+Pu7WVD+0iazlmG1fGlSKO5NhjXZZLAxJv8TnN
	 jFooHs0w+B9M5gPmTINp3pIiIB9b6o5q3U9r0jrbXJeJxdbYZSkDGzppgDAlCkPCAB+/l
	 cmybn6uq0Kn4RoXBX92wIIvlqfoFNDYNjdAwTVm6hZt0uMBNPtpcP7m1Le4ZrQo16kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=aVhfJfMS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A7606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 337A7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=aVhfJfMS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso250072666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659954; cv=none;
        d=google.com; s=arc-20260327;
        b=b4eXHfW875urZokPb4umtHy7ZNjeiHOiArRY2n3T4GP9z7+99NGrM5SnbrH+O4vr7y
         zo+J+FRKlioWyxtpJ7RaAkOvOfmMdGWCZQpbSX+NM3tjQ+ftO+vye+ESWWuQWSZ0FFAK
         PasWCjB0fnOHyaymCzxNErssYNC1+XJyfnwl6dtOFH+rT92BwKko/GY1bNwfec3vk4qy
         hsBOk3RKjSm+cyX5R7UG1jg8VyZ6WJ3E7ptAhzeN4F76kqlHqDeQpI7QgD4e171QbIIf
         F8+2AVGIw7gVrhRR+pRxwNa9Dc66d5RuUTAHu8drCNK5kCjtpLUuDW/WofJX9+3ew8qY
         jDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSvbPCi4zYzhTMFnKEKNsfKi+MS04qU0+tLIER7I1B0=;
        fh=g/Ex67q77edH9IheZQVrMXquYN8sjzIT0dmwPtOi5i8=;
        b=aQkLElL1TCit5kVSECE7XoHKs+TsUZPAm225E+arPye0cxcxHxoUGSrIttFWXsBwjP
         Fnb5GjNQ9mcz2z2Wi4A6boSD5QFTrWhRaJwS3oiam5ZFzWGkNaoL6s52bOGFFCISNGEf
         rAFQ+dfIqJ0Y9jLceuaIYR6DCZhLVj9Ifp515Xlu9/jBqK6WLk46Yxue7wMN/2BNw6md
         QeVrziWetc94xb5XNAofHQGxYwKq6APKX7Z8eDnUZCKbkwfgHB7ib9y8CLPRj0hS0WoN
         FvjElfu75LRHZnszwW6J4SzP/4lmt9LRT+00/dKnfNDXkFWB4LBm5Jw80hIdVAblzOqV
         c37w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792659954; x=1793264754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSvbPCi4zYzhTMFnKEKNsfKi+MS04qU0+tLIER7I1B0=;
        b=aVhfJfMS6oYTf5Fxr4VvJ+louyP5Vx3co0nqmAfdGDqYdZMpyXzuBz/UpFzG6fFw8e
         SjrHFLqbYS/S/+RAXJ/39bIfj5qu60rIKB8LCE4RDI6n8oB4w/cbXDoDg8Lt2uzuQ4Ev
         rxIpyG4Iq17Wu4MOzNxmwVK5VnzSZJ5xs8je77MjZKGDeymSd7fw2S/Vvu1bdEvglMGP
         paYlfoHZI0a2ZqhSM+Ry1394ZqSRlPAkgOKedfKE+c9Xwh+9R7qqFxz0YZ2tuB+Lwycy
         oKv714GmDe5ZhxFtiKG+EmxdX+DQGwSXLwXrJmc5nnGvTQDOhL5qpQawEmJwbbdeMjU/
         I+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659954; x=1793264754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSvbPCi4zYzhTMFnKEKNsfKi+MS04qU0+tLIER7I1B0=;
        b=i6HvqhACn/lLqRE1h6uNuhL0JGTw1JOnzW+4mrgTYa8z1tnAdgv4+8ZXB53nMpQKuC
         +1SQeanCyqMoNMf01rfSbbw8PW13fRl6hvMhyYW1bYCvbrxgDkEDbykX8TUIHeYVRqvz
         luilDQSf0Ee5AWOMv6/V3u47aQ97RM2ARR12Lxe45Fx2OXPwDtJCQ+dL/opXKzFIsVmG
         T8S82DEtX79Nife8qhdW520NjlEvc+GZruZM/uHWnY+dUEMreDrUzvQZfRU+2ctuZs1i
         RyF55f5bpzhLTqe4w7JhDHAWWtpJlDaxDRLuUZ0tFtJETcuTC/iFCDuBuRSOO5XB4c64
         KnTA==
X-Forwarded-Encrypted: i=1; AKwUvBwqVU7iGLgPzXHjZZCk96T7WJVvZ8YixUvmTLtOyQiKd6MUM/A4OjvPwHi+b1cJayiPcLEVwEk05pkp/ME=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0uMwOjOeu4bQowTk/yL2nr64fgkpOfjOTMxAiv1oxnSoJZDBS
	dC9cigrxOnLjO4iSqDqt5uLbQE8PHcMczhmSMcIrAVmhqYh/NlwaceEHtqpXWVFRVrocOZb7Fuv
	5Oyg5bsW9CL9F1Sm7WWuxFflqEj6xolo6ZBxjiRq8
X-Gm-Gg: AYBFou3Z2ojVyQdP15CeGmEUJXf1WAQXSZ8iSkDM+vA+FiwIF6pB/rXF4pR4Jkaoz9W
	VGRvTM7iOrDh7Em4H7tfBXv8xpYa7+oqxOI/KkruGZO/UpION7JuSP3FJ+R44VOkWL2zIzRhmK8
	cvexZEl1TXL3RTqnK4Fsmra0vhv+vJlok8EAo2yUTQ4PIPfbhGx9QLx+iX8Uvoez9mEALdCxMT7
	3T35jkYtoMdHjabAXqwCFQzG/S/0oUFFmYpgkQ8Loz+uQnbMWtC2U/QufZztkKd2IrnQvNB1CcP
	vY71mDom004PlYnAC4FGY9iiasPzoqU+8qm3qzOvEj0VIls28dDSqfWgXvKthQK4OMK5Jb4mkjv
	PBDgVhL1xoZ1EakwBv0v4ZuqV2NbTZCSppcIP2j89wvUr+0Gxtiudj5pyHpWwUi4cdC/Ws/wTCN
	Pmv1KC0gIy6UNu
X-Received: by 2002:a17:907:9c05:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c46799e5366mr423513066b.43.1792659953851; Thu, 22 Oct 2026
 02:05:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020151352.2346257-1-shakeel.butt@linux.dev> <c96fb51f-9ab2-42ac-81a3-a5e49c87c2b4@intel.com>
In-Reply-To: <c96fb51f-9ab2-42ac-81a3-a5e49c87c2b4@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 22 Oct 2026 11:05:42 +0200
X-Gm-Features: AclHuK9DE1hqF2TrVo5eGkjE1-Z1UWfGdl_GipHEv0t9grB-xZukzAlJRHcIa1o
Message-ID: <CALPaoCi2YV0EHTjz0Q8c0PE_CGXPcupqfGd7=YfK8UqpLzn1oA@mail.gmail.com>
Subject: Re: [RFC PATCH] x86,resctrl: Read event counters with an IPI when the
 read cannot block
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Tony Luck <tony.luck@intel.com>, 
	Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, 
	Babu Moger <babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Meta kernel team <kernel-team@meta.com>, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 12:58=E2=80=AFAM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi Shakeel,
>
> On 10/20/26 8:13 AM, Shakeel Butt wrote:
> > In the Meta fleet, readers of the resctrl mon_data files often sleep
> > while holding rdtgroup_mutex. Over several hours, a lock profiler on
> > several thousand hosts (almost all AMD) caught:
> >
> >   - 96,368 reads that held rdtgroup_mutex and cpu_hotplug_lock for
> >     17 ms on average and up to several seconds, mostly sleeping.
> >   - Three different userspace applications [1, 2, 3] doing these reads.
>
> This is very demanding usage of an interface that cannot and has never
> intended to be fast.
>
> >   - Other readers and the MBM overflow worker waiting for the mutex.
> >
> > These long stalls put gaps in the monitoring data for these
> > applications.
> >
> > The read has to run on a CPU in the L3 domain. mon_event_read() uses
> > smp_call_on_cpu() for that. It queues work on that CPU and sleeps until
> > a kworker runs it. When that CPU is busy, this takes a long time, and
> > the mutex stays held all along.
> >
> > Commit 09909e098113 ("x86/resctrl: Queue mon_event_read() instead of
> > sending an IPI") did this for MPAM, whose reads may sleep. On x86 a
> > read is just one WRMSR and one RDMSR and it don't need to sleep.
> >
> > Add CONFIG_RESCTRL_MON_READ_IRQSAFE, which x86 selects. With it, read
> > the counter with interrupts off: on the current CPU if it is a
> > housekeeping (not nohz_full) CPU in the domain, otherwise with an IPI
> > to one. If every CPU in the domain is nohz_full, keep the existing
> > smp_call_function_any() fallback. MPAM and other architectures keep
> > the old path. Peter Newman posted a similar change in 2024 [4].
>
> Did you consider the thread that followed that proposal to learn why it d=
id
> not land?
>
> >
> > Results on a 316-CPU AMD EPYC with busy target CPUs, and readers that
> > copy the fleet agents, per 60 s run:
> >
> >                                        before    after
> >   hold time per read, average          350 us    4 us
> >   hold time per read, worst            3.4 ms    109 us
> >   time off CPU while holding           9 s       0
> >   one pass over 750 files, average     360 ms    7.4 ms
>
> The numbers make the contention clear. If I got the math right the "after=
"
> is still about 10us per file and with 4us spent holding rdtgroup_mutex th=
ere
> is still about 6us per file spent outside resctrl. I expect this is
> taken up by the syscalls, the various kernfs allocations to manage the re=
ad
> cycle, also a seq_buf allocation of a page (just to return a few bytes of=
 data).
>
> I do not think the 750 file example accurately captures how "bad" things
> can get. From what I can tell this proposal only *slightly* adjusts the l=
imit
> of how many monitor groups this deployment can support.
>
> My guess is that the 750 file example looks like possibly about 25 monito=
r
> groups with three events each monitored across 10 domains.
>
> The "after" value indicates that this deployment can now support more mon=
itoring
> groups. For example, 250 monitor groups with a pass over the increased nu=
mber
> of files taking about 74ms.
>
> AMD can support 4096 monitor groups though so while this change is undeni=
ably
> an improvement, it does not address the foundational limitations of this
> interface and does not enable this deployment to use full capability of
> the systems.
>
> If the goal is indeed to obtain accurate monitoring data at regular
> intervals when using the stated hardware at its full capacity then
> I would suggest that you consider the per-group rate files that Peter
> settled on per
> https://lore.kernel.org/all/CALPaoCgpnVORZfbKVLXDFUZvv8jhpShHPzB3cwdLTZQH=
1o9ULw@mail.gmail.com/
>
> I actually cannot remember seeing an update on that work after he posted =
that
> message and my assumption has been that that is what they have been using=
 since
> then.

These changes have been available within Google for a while, but I
don't believe they've ever gone into use. They've had a lot of other
issues with the MBM implementations on AMD and have been estimating
jobs' bandwidth using the offcore PMU instead.

Shakeel, I can share the changes for you to try out, but they won't be
up to the standard for code review. If it works for you, that would be
one confirmed user and I could put more time into it.

>
> Essentially the solution builds on the monitoring data already collected =
by the
> per-domain overflow handler, it turns that data into a rate that user spa=
ce can
> read on demand without any IPI.
>
> > The cost: interrupts are off on the reading CPU for about 0.5 us per
> > counter, and up to 131 us for a root group read with 128 MON groups.
>
> 128 MON groups sound low - it looks like AMD has 4096 possible MON groups=
.
>
> Interrupting a monitored application with interrupts off for so long
> is significant for a fleet whose product is the monitored application.

Interrupts are reenabled between counter reads, so the cumulative time
interrupts are masked doesn't impact latency.

The time the customer's workload wasn't scheduled was a bigger issue,
though. On the higher-availability products, this was feature would
need to be disabled by an entire domain running in nohz_full mode.

-Peter
