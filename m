Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453310;
	b=JOD2oCnlgAhR1wZ0iaCgfQva6JGSYN9mz6uJ5SMXHisg690H9+ebt7SAMQWscGWGPiP+
	 MdZ4CfzB8Mw7P3Xiuj4YKg9OCruU9R9A5ZJmgUlv+UwykmbOHg+LMvOWF+xIoGztHGi4i
	 GbDCfCce788pz4SCljN4VIHgkWd0WjNeprr1IMUfdg1OcIfC6Ldt7vi65KGdztZCA64K0
	 3aV0+TjgBhfzNaaQrBXeTz5DoqXsR4UQIt9G9966h6Vlqc1Vrr36DwIt8YHJfiws3oy+6
	 LwR8OXe/2YTK89qIX8op9lb4EQu928k3bObAeDfJZcl40ThW2VB5gh0z9Z4nDyByJtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453310;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KukHHa4IpQLPx0nLghzyKli6Eignxu46dayWT5IB5Os=;
	b=J3dYTE9N4am+A665FyeLbhh0/QAukk1AVSbLZDLKapDVQHJwx5pUR7HwUamehb5iywU0
	 tstP3YQrkQnWYVt1Wc4aGK1y3eozkelhbYXLBbPt9wfCjrLbbC+6IvEmssKimSaDwoMWG
	 TzY7zVMw71bWcEN+NLoISm2SQRZyHIGMByYFjM66OKJrH0qxLtWlv1slq6PJ+oti5HXr9
	 y7Fuzxeqg7kBTTudDEJACrP1ZGru42+8SIg5hNZOTNu3wPHfVxefZXv+3PPhGQLuRilFR
	 d2bQ6IAqQujdnOGaIdG6FZiYM3lim4tiK1xqkIuc3NByS98WecfePuzcldQIsaZkv3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YMp28IOO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4820E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YMp28IOO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E001E1F00A07
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794453309;
	bh=KukHHa4IpQLPx0nLghzyKli6Eignxu46dayWT5IB5Os=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YMp28IOOkOpmgpjEGggQsJTj/xunkcm3xcqHrjlryVSThkdTDXotcTu4FfFa0ax2p
	 F7troXbepBoldAXvDiVsdENhcjwbvVLP1lFJG5X3PwIdszLGdViBjHc7rJrIDDi2Iy
	 90RJbnF+BfNiQSov7MpdqrAIjdtLCOy+89DAY5wx008BcDFOlCqJE1GtekWIf6th7U
	 DdRMijID71R8bUcFNNrKPfeoyeUKL4WrQ5q6MzpZCL8xTxsONCvCMTGfVB/k+ExP8T
	 sGKNeOHOVuzVAhTbh5wg+ppMUWE2fOo06qwUZTv5OnM6uMcemXdoSp1xnNP1DVRcXK
	 Hwcb75x42hVuQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so572235266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:15:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF43rZ5UiCUg08hAVh4+5UQWe+gK2YCCA6nMAWp2OT2Jff1PWcGUStAj1hq0kXFEDw1GfNCyG56LMP6C9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+muHj2gQAcPu8051rXFz3qGjQA1r7/ncwdLNS7x0LNZGDa2dAQ
	87zSkddWQ+XsRgUQS3DdjqG3L3fr1Gd3BrI/aWruVu27/2A7eMr5a/NFVYO57YtT9JqYa1pGm0U
	r6ohXVzhU1KDhQdVbGrVmQ68Qjik/3BA=
X-Received: by 2002:a17:907:2d8f:b0:c50:5e10:71ae with SMTP id
 a640c23a62f3a-c5066afce46mr377456166b.17.1794453308567; Wed, 11 Nov 2026
 19:15:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111092421.3771992-1-chenhuacai@loongson.cn> <20261111170600.GS1779021@noisy.programming.kicks-ass.net>
In-Reply-To: <20261111170600.GS1779021@noisy.programming.kicks-ass.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 12 Nov 2026 11:14:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6SYOjOw+owmStK7sr-HOiADC1zZ4Cii5hv1q+qYAUETg@mail.gmail.com>
X-Gm-Features: AclHuK_e17qcvjrZPS0KZhv5Xdz0uZ2nPZtp3g7am9FbsyZNwEyKWIbkfxX2baU
Message-ID: <CAAhV-H6SYOjOw+owmStK7sr-HOiADC1zZ4Cii5hv1q+qYAUETg@mail.gmail.com>
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

Hi, Peter,

On Thu, Nov 12, 2026 at 1:06=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Nov 11, 2026 at 05:24:21PM +0800, Huacai Chen wrote:
> > When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP (single-core) kernel,
> > calls to smp_processor_id() in preemptible contexts trigger some false
> > positive "BUG: using smp_processor_id() in preemptible" warnings, which
> > are harmless noise because the process always executes on CPU 0 and CPU
> > migration is impossible.
>
> The check is still valid, you don't want to have any code that uses
> smp_processor_id() outside of preempt_disable(). Such code would be
> invalid on SMP, even when ran on UP.
Thank you for your reply.

At first I also think that smp_processor_id() should always be called
in preempt disabled context, but after investigation, I found:

There are 5 existing skip conditions.

1. if (likely(preempt_count()))
2. if (irqs_disabled())
3. if (is_percpu_thread())
4. if (current->migration_disabled)
5. if (system_state < SYSTEM_SCHEDULING)

Condition 1 and 2 is to make sure smp_processor_id() is called in
preempt disabled context, but Condition 3, 4 and 5 is not.

Condition 5 can make sure no context switching since the scheduler
hasn't begun to work, but Condition 3 and 4 can not.

In other words, Condition 3 and 4 can only make sure the current
execution will not be migrated to another CPU, and I think my new
condition is exactly the same.

>
> All code must be SMP ready.
This is why I use "if (nr_cpu_ids =3D=3D 1)" rather than "if
(!IS_ENABLED(CONFIG_SMP))".

>
> Aside from that, nr_cpu_ids is the wrong number to check.
Correct me if I'm wrong, do you mean checking num_online_cpus()?


Huacai
