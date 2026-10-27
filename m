Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098768;
	b=j+IYN0vw6Z6sRby4eAZohbKh7CvVEeqfRL4326x0BfxVpzvPIgUyU2ABV7wVjYZ4/1Er
	 F3fsXS12CzmiqbOxVlTgUsF1AX49kGLk7ocZBvLqCKtQWg6ibhpLl8+cP0ht9klv1OtZ+
	 62bSILv+nn18rY3v1Uv5f0nOjJGFg5f/+kK372o9JIMCGUD4IhAaTMa6wap5VQuH2Xcpz
	 5SHE2conswPbcV6aKT1pdthqzOdSaOY6j81f/zkSolF0+IrpGXUjClFdAekRyAMTLb3DY
	 cXAmHselZFobn16LS+tfNQWMxR+FwonjwRSd0teKeoMSc/9+dgW0VXKldaMGXH9AHqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098768;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lVNso5EEgm/5gtGaAJ6QIpW6dKpSqWSBzpph3rHhhcs=;
	b=H0DX3AtO90cJXm6KY/ZrjT+9uWnd6+iui22efqCU4iLVy/XQmhnP/eqdnN/pGWyF6X4N
	 XyJPFDU19eJ4oOIZ6JDZxPXB91j3FDDsUe5XxLjRGutqWFoC8FlEOqvLTA1zet3x1BHcq
	 1Bv1SiBa95ppFuAB+2ITSf+wjEV2kAOD8os+HvQUiaFbSLduWvZu+6drcRNwRMN4HNK0L
	 qK/WVpCyfny9o4TyEs8+JIW7qK0wAj7eonPnibVXCAgipagGVMkkNgPCk3RlXNxSIZp+F
	 ARDehq0o2fPP4B9dgPaOLnZ/veKN/U7NUZd5xTSMx8oi3HlqXduB/MW88fPxkngsllg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CQHH/7ZZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB4606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQHH/7ZZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CB71F031E9
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098768;
	bh=lVNso5EEgm/5gtGaAJ6QIpW6dKpSqWSBzpph3rHhhcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CQHH/7ZZmY7gXELyKkE/0EBE+0ZDFmO467KChxeHnKrGQmQ3ppxK6s0iu+O9szbDo
	 LLd1AdDTamzzVO+UFxb6IiHPv1owyWSOOptAW6nqNb/t1O7rJpmx2oR2LFrzQCVAFs
	 IufpvxJjp2+tNUYViLyO9xfRjEZZDNFZAMo4DsXJ9XhC9x2pud7WamP6SzLAEZSh4d
	 kPafoOw6PZ3iSUg6wQn5r6ZADArxYgj6jjdof/xJr61fAvz0dfKKEmyDrfptotKzCd
	 Wrv3ns4+PJBH/N7SfyWEYAIXZApNylIFzkvhFqkxHDVSKTbcDNE6YSHtf2eaSfw9EB
	 hI7Nle2xkHWLA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be416e603cso2382233e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVx+IS/us0MXuUyDjnbJHxG3Jiud+u0GAIb5DrQVtH1Kc/bTB2/od0TZnCtp9oBAV0P/N3/hw+Yh/ZCG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZCPqNLtNZJNlVkymjQerPgnF2WLTqQ/hOV2HcO52Tsqo/2/Wi
	btomGNap3jFRAboZWlOuEIJ/02mC7orJsd9NpUBNza2xDC7ht+HC4U9agFOREDR6hkGBKNsoLDx
	cv/V630ApSVbkRwO2/4MFgJHkJyLzd5w=
X-Received: by 2002:a05:6512:398a:b0:5bf:b46e:6b11 with SMTP id
 2adb3069b0e04-5bfb71ca4bemr2850933e87.14.1793098766538; Tue, 27 Oct 2026
 03:59:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027090638.900747-1-chungkai@google.com>
In-Reply-To: <20261027090638.900747-1-chungkai@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 27 Oct 2026 11:59:13 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hLYKeuSHpxxRkbK07DuqOat7AuUp4nwz-1V6bgfgzWAA@mail.gmail.com>
X-Gm-Features: AclHuK-6PhQwCZLexhvPRRxmsCpew2FxkaJtrRKhhd5Qe5oqL8T1Lz208V-yy44
Message-ID: <CAJZ5v0hLYKeuSHpxxRkbK07DuqOat7AuUp4nwz-1V6bgfgzWAA@mail.gmail.com>
Subject: Re: [PATCH] PM: runtime: Allocate pm_wq with WQ_HIGHPRI
To: "Chung-Kai (Michael) Mei" <chungkai@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:06=E2=80=AFAM Chung-Kai (Michael) Mei
<chungkai@google.com> wrote:
>
> Asynchronous runtime PM work (pm_runtime_work()) and genpd power-off
> work (genpd_power_off_work_fn()) run on pm_wq. While such a work item
> executes a ->runtime_suspend() or ->runtime_resume() callback, the
> device's runtime_status is RPM_SUSPENDING or RPM_RESUMING with
> dev->power.lock dropped, and genpd_power_off_work_fn() holds the genpd
> lock.
>
> If another task calls pm_runtime_get_sync() on the device in that
> window, rpm_resume() sleeps on dev->power.wait_queue in
> TASK_UNINTERRUPTIBLE until the work item completes. A wait queue has
> no owner, so the waiter cannot lend its priority to the kworker, and
> its latency is bounded by how quickly the pm_wq worker gets CPU time.
> Because asynchronous runtime PM work is queued onto pm_wq by the PM
> core, individual drivers cannot select a different workqueue.
>
> pm_wq workers run at nice 0 and can be kept off the CPU for a long
> time by higher-weight CFS tasks. On an arm64 Android device whose GPU
> driver uses runtime PM autosuspend, render threads were observed
> blocked in rpm_resume() for 5 to 19 ms while the runtime PM callback
> itself needed less than 60 us of CPU time. For more than 99% of that
> time the pm_wq worker was runnable, preempted by nice -20 tasks.

Interesting.

> Allocate pm_wq with WQ_HIGHPRI so that its work items are served by the
> unbound high-priority worker pools (nice -20), like other
> latency-sensitive kernel workqueues such as kblockd. This does not
> change the ordering or concurrency semantics of pm_wq. It only reduces
> the time a runtime PM transition spends waiting for CPU time, and with
> it the latency seen by synchronous runtime PM callers.

I suppose that there is a measurable performance benefit from this
change, so it would be good to say what it is (say, an increased frame
rate or similar).

Essentially, we're talking about redistributing CPU time between
tasks, so some tasks will get more latency as a result of this change,
which means that it is not an obviously right thing to do.

> Signed-off-by: Chung-Kai (Michael) Mei <chungkai@google.com>
> ---
>  kernel/power/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/power/main.c b/kernel/power/main.c
> index 5429e9f19b655..1e8ae76356b23 100644
> --- a/kernel/power/main.c
> +++ b/kernel/power/main.c
> @@ -1125,7 +1125,7 @@ EXPORT_SYMBOL_GPL(pm_wq);
>
>  static int __init pm_start_workqueues(void)
>  {
> -       pm_wq =3D alloc_workqueue("pm", WQ_UNBOUND, 0);
> +       pm_wq =3D alloc_workqueue("pm", WQ_UNBOUND | WQ_HIGHPRI, 0);
>         if (!pm_wq)
>                 return -ENOMEM;
>
>
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> --
> 2.56.0.307.g5fe7bd680c-goog
>
>
