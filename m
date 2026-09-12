Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9D1353EF7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789257556; cv=pass; b=tiRFKaJdALjUU3VlAcKQpkNn73jajigmbR48Vz0SEP/Fl6CuGPv5PbbojaPcUgQBa4paHTNpzccDol0yY24UEkBVT30Ri7XbYEduDK2UCBTGG4RspIvr6stgtA6TUqDOF38bpeHXQOkwtB5GkGjK7OyN0SoirmcEP+uR3truBjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789257556; c=relaxed/simple;
	bh=dt+UOPr8bzn5MsHDJfwrcRsGr6ZoVZ8m7l97MMZFyLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsEKOMu7rxUbvuZNW/NrZ/+K9OWTBV3m1rjdSmPFm9loJDkBBOyxCtzrqL66W8ya4JcBJT0ZMDIkNA7rme4eOlazsrSRS1sN6xIvhkv8qEgUed0Dex2J+0GkIdB/rUfH3BCu4vOyU1/wdXd1DBNVRlVqdyHTUFheD99TRdTj1nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlQwZYyE; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlQwZYyE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso21142735ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789257554; cv=none;
        d=google.com; s=arc-20260327;
        b=ex++TEjoBXok+0Gdb5/tRWd/4h7hc+WvEXqPvtTSUmpO3dfoZpjqMJ5Tz/zYcHdqXH
         qJV+UeNvKIeZPvs5lYg9TzVpXd3mf4KdEhGOECR5QVb9G7QfrKmgFPLQtSZ2ARVocO3Q
         Nj1yKUhyV61dOumnBdNNit7yHorgqnbfTtXEM9CYN9xPyu7i45tRVf1OS1PvZk98cgge
         8d39rmqLaWSYtniRH2bY0nxjN8Y60RHlMXIYsbG4KN83kHYLGOSSQ2LjzmROuRPTOGq3
         N5W9G0Q9VsjZvGYGDUbvylclJ726ZwD9DbE+dAYArMaqgRudMpd4w6Qs0vzVovPQUQs8
         Zg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        fh=1JPHoSpy5auAFQtyZclYrxkNtO6erFg4I4YAtWkQ2lg=;
        b=BR38hhZiG7ZQ105s3Zx29agWXDIwDOv8hYbH+8k2pCx7IWp6IP7E65K8COk8Tzw+t1
         EbZfcGviQOqWro/rC77y5igXaOdalJtB9/rCi+zlduyfqKwn3tcxHPlkJXLqpzNR+bGU
         kQtON6x/udbjjU0ZBJZDurl4dRJ3Z2+TUvbUR1E0A0vQGa0vvCc+WbytMrV/hDdgCmZO
         n7OUXSYun5PQiWO0s8tNy66iPaCXX5DK2GWwFGJ0dokyYrYjxitkdCijqCYky8dgT8Bx
         2I9pBo84MOSETvyfH46eR/YRkL8gcewlgZgf3EP0snGf+/vi4wJ8DwMywTXen18txYSB
         DBxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257554; x=1789862354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        b=IlQwZYyE/8yZzLZtyPkuaMtWb6HkEiD6XnatVU8c83PI8R9DX8iLQUoHnZsBbe6djx
         E1k07ys8/Z3jFjiHc/K4EK6Cn1mxl5op8ZFLFT7B2tLSktYtwjrbc8aDt7tCPfys6OgM
         /SYBleTCd/zLzgBnTDSiZ3WaJpZpVqwNXXqsy5gl3z78KNTvfeWI6yI/3lzgkzrmPVxx
         mFGv2FslrofS90KLOHrV6jobrBCBfKwa3KQpRAi5LPtzlQ6bN9jz5m4/B8MXjHcwdSKg
         uE+5gY30FI2BTWO0/iQyy4u07F3d1fOWih8iAnVdmhqtO26vfLegZUHnj4BgYg2vJuvp
         +7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257554; x=1789862354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        b=iQoz4Sv8wk60DjCLqKeJFn2WqATsldrBmemlbMfwTTSNDhH6kZwGYJ1Dmokm8sK5Rc
         q4poLng9i49RRtCKUtWLzGkHECtgUoSoaYchslIkXAHOhKZeOhs90FpTT6RShZPHtrAj
         N3KD2ZLADfCkgeTIKfatCe6dDAQTBHIZJ6I5jK37fuijEWzWHo5TewB/iBvzJiKTnoNM
         6K9Xym7OWMO2X0RoEnS9Gj8W53Ef3XDpaQh19W4RJeYJSE4+AlTVWYnPMPQpcUjlnqE5
         zaKSLSaduQiHL2d9HHIoBW1PeE1nzSxXMPpu0r47V+Jr+8Gy9XlswH6HAnDm3SrcyJUj
         rx2A==
X-Forwarded-Encrypted: i=1; AKwUvBw6Ttj4fcdXIlKOw5r2FiBlJZPNj4oxy9UAeiND6DsTJ6POQE6+t/RbjZuMmHW0mqHJvpnCkwXBognYtEI=@vger.kernel.org
X-Gm-Message-State: AFuF++nRVGynMh2eKJs+nymdwMN1++ttH1mTFf7g+MLmBnAZIX9kXgYd
	3qPgPjx9rDOH4KL0yzGFZlyzzkSXcBg49XgO0Ed+IQOVhAx2+YcD4IQAnFFHcfoL27AEGzrH8CR
	Zb/UJrhw1dIHonG+ETIKJjlwh1WzyDWM=
X-Gm-Gg: AYBFou3ifa38EfflkTkBf39VBkbEJ5qTBaTRxxvg+wmejxD2KdJCG/h87+1IAkgiVyw
	kOJj6q8h4xT67ZI2zrGQxRHo742yiJceukRQ+i6njLGY8WLZmAjLxFaRVd3lMOh1/sUDZwTbIsa
	8OYo5jwQorgnBhsqpZUC50t4JOKiORuGt6DV5mnCqN0n07iQemHg3U7XmTQRCOiXnM1i3zvPW8K
	r22Dng/cBFErb8gnXzZtW6JiIzE/pJ0aZXodXLp5bMcSD/58oh6z5Do3nGLKdJYZ7oDeZQraOXv
	Y7LWb8viyTwaRaksVMEqhhCep+868ZviC45izoIj7ad3WC4YCGPAXQLKbTVAsoz5yiJthMhpgaR
	hGtNGLfpFXuRQhNB+ctgnquxkXWe8UnQ5OWZNTeo=
X-Received: by 2002:a17:903:1ac6:b0:2db:331b:e187 with SMTP id
 d9443c01a7336-2dd2a1e0a15mr200200855ad.8.1789257553733; Sat, 12 Sep 2026
 16:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com> <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com> <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com> <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
In-Reply-To: <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 12 Sep 2026 16:59:02 -0700
X-Gm-Features: AcwNN1V04v_YLyVyvshDjEX_boeHQmR-dgrTXGEZk0Tlq9YUUBiA7_5E2kzlt5Y
Message-ID: <CAADnVQLQs-+-cu2R3QrHppcxOQt9m7Hi+grr4fOnw8m73kQn0Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Andy Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	rcu@vger.kernel.org, linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 3:28=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sat, Sep 12, 2026 at 12:40:55PM -0700, Alexei Starovoitov wrote:
> > On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
> > >
> > > In the old kernels, yes, we have current->trc_reader_nesting++.
> > > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > > other thins is a bit faster and does not need to hook into the schedu=
ler.
> >
> > old kernels? I'm confused.
> > rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
> > and then calls __srcu_read_lock_fast().
> >
> > Are you talking about some RCU branch that you target for next merge wi=
ndow?
>
> No, I was thinking of rcu_read_lock_tasks_trace(), forgetting that
> rcu_read_lock_trace() is still used.  (For good reason, just be clear.)
> Your comments are quite correct for rcu_read_lock_trace().
>
> Hmmm...  Josep's using t->trc_reader_nesting would break for
> partially overlapping RCU Tasks and rcu_read_lock_trace() readers.
>
> But yes, your #5 makes sense:  Deprecate RCU Tasks, upgrade RCU Tasks
> Trace to check for preemption from within trampolines, and move RCU
> Tasks users over to the rcu_read_lock_trace() variant of RCU Tasks Trace.
> (Or am I still missing your point?)

Pretty much. This way bpf trampoline stays as-is. No extra overhead there.
rcu tasks users (faultable tracepoints and what else ? )
switch to rcu_read_lock_trace().
The only difference for faultable tracepoints is
extra t->trc_reader_nesting++.

I have studied the rest of the patches in the series,
so this proposal can be completely off the mark.
