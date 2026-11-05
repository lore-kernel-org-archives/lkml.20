Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855930;
	b=1/Kb0LzcWhCoHxf+YHXqAPFrQ+DOJbYz8tUJ58D30s1xdkIhyoIp7tz4AjKrLi2Yy53+
	 AU/icRFMveUyLmqHQJx4+sKs22L6mt/Ugtu+yTKb77stkLwbraG4WZoLaS566K9mgLxD6
	 mIBrwMALYUGXFMIGnQ8f/E9SUPCCuHcS4ZHSQEEPBCyBuJ6GYnHMKv8Khdk1Mkbdbhlsc
	 b23EBg+d5aC0Bx8+TxYFzUR6Y6AWhx96BnA+Q+/rMZJUlJt1EHoDq8fJXzjkonjp5ekpm
	 5Fr4udYqH8FKUlQKTufGgt8qhiaaSO4lkvGZgIJ5CP+v7K4hQo1gWbhoXpcCKmU/Bzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=rlYQXXtVW/GHUXiTSX/d/W1MLwKEaP5IBpluVfBfScQ=;
	b=XY7MVaaCgiVGU4MWQevLtgNjwMq6W1NruB7ixcyRkPr5oZ3QAz35G61fgCD6w4gwX5dk
	 UarKSTTGgrldYTrjlInuXW5oMBuMyzlAOBDPCKR0tKSuAHYh6IImbff7u3V2Be5Im/b63
	 zA8Wkgm9O61Y+ZXOzUGHxwZh4V9yyQmVTPX7tpjDWVUK0DYJ1MSubDHLmHlKn7ygwCsQo
	 x9koVVYp63t91S8OF4V47woA6D2miIiy4f8JUmE9youfzZP/99ueWHgKqfved9XS+yD/C
	 w5FBA1fkbesh9UcSQAAEEQPUPdyEvbwRTnW9/35ERY8Hb9LiDxcRUN/KFqMIVC9hlVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKwtpAuH;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B3606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKwtpAuH
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so178056a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855930; x=1794460730; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlYQXXtVW/GHUXiTSX/d/W1MLwKEaP5IBpluVfBfScQ=;
        b=WKwtpAuHMlpIAChAw/SfvJ1rdirTSs7Egq4NIjvP3WY6cZvURIgJ1OMFcIvwdKdRHD
         c2Y8Vn5y5roQZoW8I5a1hwPq1y7tCh7BD0vIODJE7M7B3n02amaXravnjDNXPcIXPdRg
         Bu2WGOKR8nuUWmvT45WkB1T1vEsSSwawTUPAuXcW7H5vEIXpL+EH1VaHIhfuWWCYh3Nq
         koAxaMwSPycrkl/cZyOX7SRtRZlizo9BzIAXZ7kDPmq3mPW2ouVyJGVvAXDwjUiKm93v
         iBEA8PxNL2bH82y+lOt/y1q7e5e32OSGHrKeefK4grz7+SeRJkkyhgQvLzM0NaG09R8m
         mL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855930; x=1794460730;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlYQXXtVW/GHUXiTSX/d/W1MLwKEaP5IBpluVfBfScQ=;
        b=UqPwUlzp8nGFntzOWg99XU7fHr3QIp5OJ6LzZHN6P1/hn7P8lpeUWLGqg9cCJWdncF
         3creBkW4nDWqf+AQ1ydyixpkxAOz5hBYBPFJzHYHp3CIV3wEck6twJjhlS5cLf7F4gMT
         dz9RAKDiNVyfzac/aIYGX3NeJQfKQaceaKrs97XCjl0TCOLLpdxSXMB51gAWKYoyjk1t
         X2qZCKs1gWQAkweUOsihg1FuQGmbUVU5GWqN6zF0AXt61VDfRZKuRhdEJvli2E4MDS/q
         un9I6qDbshkdIIAsE32ZAfEk1Q2Q+Aew8tM6omdYcjY9OMOHnvlfV8XSf9hF4eULw9qu
         hXXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPFKawdPKOWxGq6dasyL9d1A3woYVQ4M9JpFyCxxfxhl6MCTYho2rNuEJa+FZRKNo2keGaGWbR1o1OlME=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xmX0W/KeQXKO9KkTnZoBjgAuIMI9zWEPMAHEQ8MIG0uZSBNzi
	sOukNy7xv+WMhRqJzBfRBPOuEnvxZL46GsrTBlmOb4q8IPzJppvS6zQV
X-Gm-Gg: AYBFou1JvUQsE9pphvB8N+KNqmBXgfRTtQrwJ4rRgxPVAx4rKDAewEvuFyx7wQbLY2C
	ZTLJLsYOlm98pV8qFpCMtVB2/ND6jhJon2ALDJQoBsqOFqBbciCHPO7vku+Uo4Q4HevmuF9RD7N
	JUg9smZWSkh9AOhiz/5rTJzOykql/VxiwgCSI7obxk1mHpcPyEPz2V2XPQ7gqTW9X6v1sBhqRJK
	Bx+JaHRo2wXvOAWv6zcOPev9Li98CqOB9r2it7U6nVJEusuV4sxbh9mttZR5qd3ciLsT9PdesD6
	zj4HL3iqgAQ+m3bqldrwdu0T8oIKUU0x+kF52IFi8+3aKzyFbWuIeFNu4RWq6v7f/TG6cGX1F4H
	WV3+DTyneoibeLIgo5Of5uSJMpUVATTcOadDRrFR7ZwNSOj1yQuvrloNe3LEKQhPC0OOrOuCyBV
	YJG8smjWxFbmyYXuSaQ1pUwT9YWUSFFNoHxqT6LAsjdPVxs8iu2FLlI1BG4VdOVTpG7D81JGuhD
	A5b/4fygFVj9q00wM0Y/Z7XGWrwr/5pK9iPDOHArNcLvWVlf7RcQoIsQtvL7HFWP+7tZRlGy+g6
	gu1crfJRfUst1BRABK8oroIrmTzMnkquEFulhzgd1p4NsW0AjCMBA2mjf+7AcRv1hgUGa5keK2l
	CGikZOUhIYNlb8XcjAgDKk7TtZLHe5Hn9R+EZTyWwJgOsn0sofyvOtNU=
X-Received: by 2002:a17:90b:56c8:b0:3ad:dc36:c3d7 with SMTP id 98e67ed59e1d1-3b0afdf2b12mr1020541a91.24.1793855929364;
        Wed, 04 Nov 2026 21:18:49 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b2cf80c9sm2002505a91.0.2026.11.04.21.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:18:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 05:18:48 +0000
Message-Id: <DMN0USP1E59A.34N710IJOO0PJ@gmail.com>
To: "Martin Kelly" <martin.kelly@crowdstrike.com>
Cc: "Mike Bazov" <mikeba@sentinelone.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Andrey Grodzovsky" <andrey.grodzovsky@crowdstrike.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let
 preemption cause false recursion drops in trampoline progs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com> <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com> <DML75890DWIX.EYB690LPBM1O@gmail.com> <CAPnbwjpv3bkGAKVjc7Eywgo-H4X6uDLYPJWFuSakGs_sBdgr3w@mail.gmail.com> <DMM2FJ2SNYYO.24TEJ05OOR08E@gmail.com> <CAH=2mMABxvf+GNr7vUKNkGvyU-gmaXKMGNJHg4URUCW_eyuxGg@mail.gmail.com>
In-Reply-To: <CAH=2mMABxvf+GNr7vUKNkGvyU-gmaXKMGNJHg4URUCW_eyuxGg@mail.gmail.com>

On Thu Nov 5, 2026 at 1:12 AM UTC, Martin Kelly wrote:
> We have noticed this issue independently in testing of our own security
> agent and have hit the same false recursion skips on 7.0 and 7.1
> kernels. More details and measurements below.
>
> On Tue, Nov 3, 2026 at 6:24=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>> Today a fentry prog never runs twice at the same time on one cpu.
>> Existing progs rely on that for their per-cpu maps.
>>
>>   task A, cpu 0                     task B, cpu 0
>>   buf =3D lookup(&percpu_scratch)
>>   fill buf
>>   <preempted>
>>                                     buf =3D lookup(&percpu_scratch)
>>                                     fill buf
>>                                     output(buf)
>>   output(buf)   <- data of B
>>
>> A plain (*cnt)++ in a per-cpu map loses updates the same way.
>> Today B is skipped and recursion_misses counts it.
>> With the per-task check A sends a corrupted event and nothing counts it.
>
> Our programs avoid writing to per-CPU arrays because of corruption on
> PREEMPT_RT kernels, where trampolines have always been preemptible and
> thus can corrupt these structures.=20

what do you mean? the reentrance prevention counter works on PREEMPT_RT too=
.
per-cpu array are not corrupted there.

> So for us, an opt-in flag that allows
> preemption (instead of skipping) would work well and not regress current
> programs that don't opt in. A verifier scan for per-CPU arrays could
> also work, but it would need to distinguish read-only vs write access to
> those maps.
>
>> Add bpf_preempt_disable().
>> Your test forces the preemption in the middle of the prog.
>> Explicit bpf_preempt_disable() will fix it.
>> And you'll have an easy way to see why disabling preemtion
>> for the whole program might hurt your own production.
>
> We tried bpf_preempt_disable()/bpf_preempt_enable() around our hooks on
> a 2-vCPU 7.1.5 VM with HRTICK under an open/close stress test load.
> recursion_misses for the locks_remove_file fentry actually increased
> slightly 29M to 31M (this may be within noise). As far as we can tell
> from the code, the trampoline takes prog->active before the program's
> first instruction and releases it in __bpf_prog_exit_recur() after the
> program finishes. bpf_preempt_enable() calls preempt_enable(), which is
> a reschedule point. That reschedule happens with prog->active still
> held.

pls try _no_resched() as I suggested in the other reply.

> In a process-heavy workload on a 2-vCPU VM (~1M fork+exec of
> short-lived processes, ~606/second) we recorded the following number of
> recursion_misses on a 7.0.9 and a 7.1.5 kernel. Both kernels use lazy
> preemption with PREEMPT_RCU enabled. The miss rate has increased
> significantly, which we suspect is due to the HRTICK change.
>
>                                   7.0.9 (HRTICK off) 7.1.5 (HRTICK on)
>                                   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> security_file_permission fentry   1 in 61,580        1 in 1,568
> security_inode_getattr fentry     1 in 59,242        1 in 1,707
> do_file_open fexit                1 in 813,983       1 in 2,503
> sched_process_exec raw_tracepoint 1 in 1,000,816     1 in 500,408

Thanks for the numbers.
Are you saying turning off HRTICK is not an option for your production?

> We don't have a preferred mechanism and are generally open to any
> approach that would help reduce these recursion_misses. Whatever the
> mechanism, it would be ideal to cover raw_tp programs too, since
> a46023d5616e made those preemptible.

agree. let's come up with a design then.

