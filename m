Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794535591;
	b=HDtdJo4x0gU4hwp92WqqLAfbNOI9yCOhJCO3QU/JRpALx3BTAqwnXgsU+DmdrUtdIHvH
	 ekGTLZGBwOyZy7MmeFpUX7a1fl/mYaQax9TvB7d4buTwy7dDNI3Gi1j0N8sqFGnEoWtiy
	 +TwuQoYH0H++8jtELlt9SHN7a6Ah0cw9Kaa5VUF4FoK2D+PEtTFlmbo0ubd/45A5/SfqE
	 cXHZR3DTxk6mKMuUcRvKHjT11+T/Ic6q+CLM+hrEina5gLW4+ZLO6+94ZhCMQgIJvBCM4
	 4AyDkwiSlDSMlIL9OmhcA5TAddlN4DwxyLQ/0nDOaXIob8pLfziLa8mqvH8j0GipMUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535591;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XNZDrVcq+boAL+pOGbd+KtTtVDRMXO3ms/PyKJ+Acm0=;
	b=Gify4foqrwtuvbmRz4GN4mx4uYpd/0Ek6hWi9xtTy8e54BtZxnMR5Dvoh8PHKImhFOeR
	 avX+jg/jEHzUDWOdfigCmS03kOa1YcpS6V4qQjvBS9g1enebIhB74sejNEUSPnwRuGphG
	 OK4rTp9QsHjjnmfnc9pJ5O+Cv7FdZmgwSwKjfEg6hZKI+wgZhlcuqQXYvOR1AEHKz23L9
	 cZZU92nNV20zvo6S8QWWoMBGEPqgHLNohSearCm2faI0dMGUymSZoRMJGQqBwSLkaFava
	 JDbmlDtJwingppYqQiCqljWM26sXmWpYMXbz3A2pEkdPujwAC1ggE7hmJVpivIFUEIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b/kTqyKr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506B1606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b/kTqyKr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44811F000C8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794535590;
	bh=XNZDrVcq+boAL+pOGbd+KtTtVDRMXO3ms/PyKJ+Acm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b/kTqyKrZHjXWCX5MnPJs6jJRq9YqkjaiEZlUTvB0DoO7c/mUAu5mm5TrQkIBSEvw
	 pnCz6sIO26Tgp1s91FTJxqJWoZfRyX+udwTLgguVFB/xxWYlRPA3gRkDLAkKO7BqSW
	 R3MGzYC7DqSA6TT5swxa7P9nkljist5autFdc+3X15XVlS/CZWVapIp9VZvCgX9ASe
	 vjRvaYTq5KtHiBLhQfTlo9xiQSV7Mr+ba3QaiBHpIDWyftbnF2jTqMS/IUb66lH/nI
	 Kku/QAxjL5pjlgLPxA5P3z7gRhIGAdjUMNw0bTh2vPeZilEPqE6gQ2XMIP5VHYCbRg
	 l7CbkDcQPeihQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso751771a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:06:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHGeKxGIyWomhDUlsLoLIdCun1dN71N2K+G5nKrjimKsfGxI4ewISd3q8wxImsGhJenVxSSjjvHqGReQEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bbuU1F79aUiTAtm19p5DEk+KFA45R3/O2L6rHWHDMft0kcB90
	A46OsEMrP/wXyo/JfdhVgyInczABrq1oJZDQLsJXCCkRXW84eDCNf6D5SmaFsyR6YAqW69OOvtb
	1iDVNNBs4eqwNRmQWDLlM7BpsFw3eR6k=
X-Received: by 2002:a05:6402:c50b:20b0:6b1:a647:981e with SMTP id
 4fb4d7f45d1cf-6b7c0c52570mr790505a12.24.1794535589658; Thu, 12 Nov 2026
 18:06:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111092421.3771992-1-chenhuacai@loongson.cn>
 <20261111170600.GS1779021@noisy.programming.kicks-ass.net>
 <CAAhV-H6SYOjOw+owmStK7sr-HOiADC1zZ4Cii5hv1q+qYAUETg@mail.gmail.com> <20261112081348.GB2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261112081348.GB2668804@noisy.programming.kicks-ass.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 13 Nov 2026 10:06:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7U5=VYEnb9sv4VF7p6Wc77sy1NW0ZCPH23LzPr7wYkRg@mail.gmail.com>
X-Gm-Features: AclHuK_JVN4dasIdBgm1TIXgmrLvT8GsJW8f9xBjTyZqO8uWl502owJkHbxQpwE
Message-ID: <CAAhV-H7U5=VYEnb9sv4VF7p6Wc77sy1NW0ZCPH23LzPr7wYkRg@mail.gmail.com>
Subject: Re: [PATCH] lib/smp_processor_id: Don't warn if there is only one CPU
To: Peter Zijlstra <peterz@infradead.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:13=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Nov 12, 2026 at 11:14:57AM +0800, Huacai Chen wrote:
> > Hi, Peter,
> >
> > On Thu, Nov 12, 2026 at 1:06=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Wed, Nov 11, 2026 at 05:24:21PM +0800, Huacai Chen wrote:
> > > > When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP (single-core) ker=
nel,
> > > > calls to smp_processor_id() in preemptible contexts trigger some fa=
lse
> > > > positive "BUG: using smp_processor_id() in preemptible" warnings, w=
hich
> > > > are harmless noise because the process always executes on CPU 0 and=
 CPU
> > > > migration is impossible.
> > >
> > > The check is still valid, you don't want to have any code that uses
> > > smp_processor_id() outside of preempt_disable(). Such code would be
> > > invalid on SMP, even when ran on UP.
> > Thank you for your reply.
> >
> > At first I also think that smp_processor_id() should always be called
> > in preempt disabled context, but after investigation, I found:
> >
> > There are 5 existing skip conditions.
> >
> > 1. if (likely(preempt_count()))
> > 2. if (irqs_disabled())
> > 3. if (is_percpu_thread())
> > 4. if (current->migration_disabled)
> > 5. if (system_state < SYSTEM_SCHEDULING)
> >
> > Condition 1 and 2 is to make sure smp_processor_id() is called in
> > preempt disabled context, but Condition 3, 4 and 5 is not.
> >
> > Condition 5 can make sure no context switching since the scheduler
> > hasn't begun to work, but Condition 3 and 4 can not.
> >
> > In other words, Condition 3 and 4 can only make sure the current
> > execution will not be migrated to another CPU, and I think my new
> > condition is exactly the same.
>
> It is not; your patch would suppress any and all checks when ran with
> just a single CPU. Even when the code is clearly buggered.
OK, now I know my skip condition bypasses too many cases, then is it
acceptable to use "if (!IS_ENABLED(CONFIG_SMP))"? In this way the SMP
behaviours are the same as before.

Huacai

>
> > > All code must be SMP ready.
> > This is why I use "if (nr_cpu_ids =3D=3D 1)" rather than "if
> > (!IS_ENABLED(CONFIG_SMP))".
> >
> > >
> > > Aside from that, nr_cpu_ids is the wrong number to check.
> > Correct me if I'm wrong, do you mean checking num_online_cpus()?
>
> num_possible_cpus() is what I was thinking of. Notably, there is no
> requirement that the CPU bitmap is dense. You can have nr_cpu_ids at 256
> and use 255 for your boot CPU. It would be completely daft to do so, but
> it is still valid.
