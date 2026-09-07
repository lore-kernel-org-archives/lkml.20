Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17E401A2E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766732; cv=none; b=JTfAurKZvS+MfWWj6PJgvhYoc01O7AC3ausDH+jZjEAnkqPkVfFyPxi84vNCpQ8tBxS+SY5qW4SIG/xonHvRofuTYPZpYmk0si+moaO/24dHrY+n0QGh66ipAYgrbD5ThFSJ5xh+hpjRtwXBHx9tPKVEi94JJoo1N6YfZr/15Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766732; c=relaxed/simple;
	bh=WC2/7TovTLfz40yn8kWFzHqNNrRRO1wFatSGip9wpgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdCgqEobKO3CGkgypEuuolENgdg2gFbsvAIqT4ZcTNc8Dsh045qrLw5pXgrrSK5Oo3tlM7hWP5P1i7WP/TVod/cTc4hqbfRbD4u8jDcCa4yBmmAgSDMA5whO0hAeid9iqvIZzVd8wimbb8ppCfluASaSB1jZajMK+NpnQYEuk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw1Ox5RK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw1Ox5RK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07751F00ACF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766731;
	bh=a/+fUjkwwLobY59ekoTtkG5S8LFZYjVo7Xv5CS+gnf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qw1Ox5RKBbdl8z1QzNsvq/VZNOqB8w2+M09aVEs6qb+IFZoaVk/iuUWudazDgva+0
	 aHtgBUkiNnLEooZ7//TaqnfaFP3W4RtEswIhJfIoEeNvsNzNkgg6Mz+kGfzaZg80J1
	 Xlr5rq3SoMVSIvUVy6CHWCrOQDvCYtl+x78c0xcDl0os5UII7NG1+Rmj8S/TfJfFBs
	 jEURJ+h70juIaNU9xiLO64cTN28IYjedQ72oxw6HUbDoYIMgjKdcq92tx6Ccgn218r
	 K9biTudVcIvlvncvX9lzr2mF6SCvM0hkl6ZZXNRbzut+9BppSuWMN6EoGKhgr/WuRl
	 mNQh74smbefhw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a668cacdadso4561331a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:38:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByz7hx5l3vNbMf8w1Imc4aw2BOpXCR6orrDGeXmd2/2EJW05xMFe/JM3wYFTB9S7bijmR/w8eGyjBbw1uc=@vger.kernel.org
X-Gm-Message-State: AFuF++nrJ0nHSY9Ag2N58P55KoCek6nY3LvIX/prLJ67DwATICHJY9xE
	u1mbUCdXtLmNxJfgaOD6giMm5xJjMdsOztTJSt7YieHT6SakO57spJ0HcrXHv7TQLXlTSC813jl
	JPUN61GAwCL2y/p4DB8X4U+hFKVrSgX4=
X-Received: by 2002:a05:6402:1952:b0:6a7:fad8:cfa with SMTP id
 4fb4d7f45d1cf-6a7fad81d48mr4103435a12.39.1788766729541; Mon, 07 Sep 2026
 00:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609031924.97092-1-chenhuacai@loongson.cn>
In-Reply-To: <20260609031924.97092-1-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 7 Sep 2026 15:38:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H55Lb4mAcubjc6hFka_RJB7pkQkJMzkVWaU4se7jt2-0g@mail.gmail.com>
X-Gm-Features: AcwNN1UsMAnbR8dt1oSt-xR67Q4jwM-QaxS8iiHeA-7lThhwWcDpzEeaAjhuN9k
Message-ID: <CAAhV-H55Lb4mAcubjc6hFka_RJB7pkQkJMzkVWaU4se7jt2-0g@mail.gmail.com>
Subject: Re: [PATCH V2] sched: Update the THREAD_INFO_IN_TASK description
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Andy Lutomirski <luto@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ingo, Peter,

Could you please spend some time reviewing this?

Huacai

On Tue, Jun 9, 2026 at 11:20=E2=80=AFAM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> When commit c65eacbe290b81 ("sched/core: Allow putting thread_info into
> task_struct") introduces THREAD_INFO_IN_TASK in 4.9, the only supported
> architecture is x86 and thread_info only has a flags field. The Kconfig
> description said thread_info should only has the flags field but didn't
> explain the reason.
>
> When commit c02433dd6de32f ("arm64: split thread_info from task stack")
> introduces THREAD_INFO_IN_TASK for arm64 in 4.10, its thread_info has
> more fields than a single flags, and arm64 works well.
>
> Then commit 37a8f7c38339b2 ("x86/asm: Move 'status' from thread_struct
> to thread_info") adds status back to thread_info for x86 in 4.16, and
> x86 still works well.
>
> After that, risc-v, powerpc and many other architectures all introduce
> THREAD_INFO_IN_TASK and their thread_info have more fields rather than
> a single flags field, of course they also work well.
>
> I don't know the exact reason of the original description, but obviously
> it is wrong and misleading, so I update it, let LoongArch and some other
> architectures easier to support THREAD_INFO_IN_TASK.
>
> Also improve the try_get_task_stack() and put_task_stack() description.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  init/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 2937c4d308ae..a9466879d553 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -207,11 +207,12 @@ config THREAD_INFO_IN_TASK
>         bool
>         help
>           Select this to move thread_info off the stack into task_struct.=
  To
> -         make this work, an arch will need to remove all thread_info fie=
lds
> -         except flags and fix any runtime bugs.
> +         make this work, an arch will need to remove the task_struct poi=
nter
> +         field from thread_info and fix any runtime bugs.
>
>           One subtle change that will be needed is to use try_get_task_st=
ack()
> -         and put_task_stack() in save_thread_stack_tsk() and get_wchan()=
.
> +         and put_task_stack() in save_thread_stack_tsk(), get_wchan() an=
d any
> +         other stacktrace functions.
>
>  menu "General setup"
>
> --
> 2.52.0
>
