Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC044E020F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657717; cv=pass; b=kmmcaFCOSBUsDWsoZ7ay6uK0cXTG5afvBQ5lF62mxUtcivJODVHCUclsbvRkRhB24ZXnVJfbSPblMwHSz5YAAWMSHhv6VLt6zv2rZmeCemdDXBOO25MVpPbIQfRGs0vSQF7mSqw6dL9az9meVDN5x5Ivs1gXvjWiwjJk8XOiLYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657717; c=relaxed/simple;
	bh=w+7+J7eoxN0duh2hWV+22S5S3+5YdCbqPocAFCKgN+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAQEYyDDTez7UY1ffCaRNhWVuiUf286itnJFaA4ujeANqTbGdxxoV0EDWiYJEZXLs3hphVOACCseYM8AB/WL8Re0WolLwlXkBEL7IqCdBNclI5+3WBQQ6LcFi0QgmF7pPzvjOiQcFH9Vj2WBwYbwopqhtII6buosDv8OHQdQp3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hL0egtNn; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hL0egtNn"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe7so154337766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789657707; cv=none;
        d=google.com; s=arc-20260327;
        b=n+CLtpN9sXt94GSCFE1jcAlRH+JfU5cfU1P0bl5Chr0GWuJpKbDbqX7LnDOZlRQgwL
         ES3wAbN9jg8kP7gDl5C/kyOPps2KQEcX1dS+vFCTcVaanPE1ymqqWKMIyhdKYzX5lT7F
         6h+bhDznTt+rCsiAdG/FZnvqzER2GdWoqg7IcBtCKaU/l4pvK/0RULSM8aem5Ni87sYv
         xL2FR3BT29TQSZNIEIF8d3UCgc9hoE3OgBFhkPLdh/gD2NfksekUHwch4/SByQ3euSTB
         SxtA6wFT5qp3+Nq3xuFeICuUeZSmVSV3ZOEsFaGku4WpzETeest6lLvGd8bBbbpUAYHK
         ACVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PBwimhxw7BcNYF6pIJGNqZmsQ73mi3G/bxEaGRjaqjU=;
        fh=OuFxzCjDaTORmPKmjQ+z8E+nz3TQyNM/yWmiEH2YPaM=;
        b=MRJlSOnaIqScUmye+Ym20qm61AxOu4HVHhmo663mFUYh5sY0n2f1i+S1+lDAY6lX5w
         v5tYiQcVlJB2QzhI9hXeBSALz39eTkP9YMGYHygEQ9IAJ4LFGnOY/tjcHHK8g9DKsP6q
         q9WWwsUx05+ClNY0bQlUjzh/ym4//PKH3p3wSb9YTXBc1TjgdxaDxlKWzAXLwRvTNQQN
         as6AOEisVoUVwIVfBpDRrCtb2OCkRCnN4Dq3nPF7FNXlrhzkV3g2+t5RpraVU1N9vh/b
         Zw0NhuBafXd2DBaZI4ub/jaVLWcxzTPXqrx+AVQXAAYUVZarUPSF3InDmF7cmnU1YNMl
         vz9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789657707; x=1790262507; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBwimhxw7BcNYF6pIJGNqZmsQ73mi3G/bxEaGRjaqjU=;
        b=hL0egtNn1+npbrnJsshXZ7qaURN6+lioNzlSxdWUW6r8tOryNBcBAzwaLZ3/qM7X8P
         y5G/vs/oN0fbJfjSv8djmQRw5y82Xna1qedfj0UpSNMyFLBrzkP3p42Zlt7IgWl7Zner
         85VrBjdRR+9UKoC7qefdiH+QpupAYwDwSENHezXK+OtELsn8edRFv/qWJ/msaxspYgNv
         9mmOv7B17lIDjAS3P5hbj3K+2ICkoF8RQ8qAQqckGk5Uwotrc8cnnjMomGpQpf+6oplm
         SYUQX+fowDeY29fJ1Q3uzECvXOVRvnm89mmMDKp7Wl0sWNflC5GSsUAvrzb47cnZ5MYo
         ZLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657707; x=1790262507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PBwimhxw7BcNYF6pIJGNqZmsQ73mi3G/bxEaGRjaqjU=;
        b=q7maAq5xLCDgWFELn703i6VaBAk1baD+AvCgoV3d5pluiRH13OjZXtpeYL8z6lhEvg
         S0/ddhoqsCMJ+4DAHFBFFXkl1QD5iqUoxnTNJMd7q/BkuQnJoEG1/26vhJEXh5Q91rgW
         nj75mFXLzJ+EEFkdXVzFviuzz2SM/h1oAR9S5fuLap/NqBCRIYcQokt7Z6eBRnfm3VmP
         aWBobPNaSka38QCigXtNm0TJRRnp3HLHs+ddTqWUS/nl/yXnPCpuxuX4wUlj+ZdB1Kd4
         HJHCBZSGCT7uoYw+l0DT4Tv7DP+JNkkL7AsxeIR3DdSvAuz3ehtaa4cGgZYkxdjaHwjS
         LQIw==
X-Forwarded-Encrypted: i=1; AKwUvBwdYZOMIIdSF4yX1al2vmmbr1KkhO8HDpi77UERPxr56YFNWaSEdeDhrBJFQfQNTpMD9eoWANez5p2Adqc=@vger.kernel.org
X-Gm-Message-State: AFuF++ltbo7E0qgrBUptGVeT7LiXcHMp0U3ITVYIdnZjAT7ACVBzVRz9
	jz9s1i20th2EpLaEkGmJHrP85PX2rfXnKoiEPhwXdgxD+zDAp5Zbw9CXtQ7pzAj3Sobcwgh+mE5
	/Q6G/j4N5os++39o6eqcL91YFb+HWNcS6Uw5Vd5eQOA==
X-Gm-Gg: AYBFou0NfeZZPn4W0Xcw5vTwnbEbOzVSCEuxGiVh64PySRDbTOlRG/P2t9w110s90g1
	Gcc+JWWLqh2cKrIgnBVVOcHyM6UaDpdc91cOLf+P3OvldqvhvMo7MqLrpa2qcQlkcAaFQqsFYQi
	uOC1oTwr/tRlXyKpr18aWerisJd6gm2AF8ggqg8H/6AjL2/V/Uj0hMEAFsCDed7vMmKBWQBizhQ
	EHzOPavlLNO1h8qR0oQ5yDjdf80WtAE7PsyyG4enEGrL3mag2b+WlWBHRYtDwoIskkNHjQxu0Ve
	p+VlPU/7vTjAv5Nb8tWWIlHY9+UCQFGKXOK0Q3+IeQtUY6NPe/w/bZi57rsxF6HbVOGontqqfHv
	dFeuLbbVraoii
X-Received: by 2002:a17:907:3cd4:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29e51cc690mr486783666b.3.1789657706744; Thu, 17 Sep 2026
 08:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916100116.701206-1-christian.loehle@arm.com>
 <20260916100116.701206-3-christian.loehle@arm.com> <CAKfTPtCAaACP8A=AKGO3PdhZtA9SRM6e3ym+5d=Qfp-VpDa38g@mail.gmail.com>
 <f3912746-90f8-46de-a690-a840afa4a1d1@arm.com>
In-Reply-To: <f3912746-90f8-46de-a690-a840afa4a1d1@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 17 Sep 2026 17:08:15 +0200
X-Gm-Features: AcwNN1UepS9H8J-Bx__-3vHGPLcD0Z6dVcwXht08n9bPIhFs2o7jwKFujrXfDt0
Message-ID: <CAKfTPtAexsLhEb3hEnWvhFo3Z0+CsN41WQ8gfW+waLvxJQrb+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/fair: Randomize equally shallow slow-path candidates
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Beata Michalska <beata.michalska@arm.com>, 
	Elif Topuz <elif.topuz@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Shubhang Kaushik <sh@gentwo.org>, 
	Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 16:22, Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 9/17/26 15:08, Vincent Guittot wrote:
> > On Wed, 16 Sept 2026 at 12:01, Christian Loehle
> > <christian.loehle@arm.com> wrote:
> >>
> >> Picking the first eligible idle CPU leaves a scan-order bias. Concurrent
> >> slow-path selectors can choose the same CPU before either task is enqueued.
> >>
> >> Use reservoir sampling in the tie branch, resetting the candidate count
> >> when a lower advertised exit latency is found. Use the per-CPU scheduler
> >> PRNG and reciprocal_scale() to avoid variable division or a second scan.
> >>
> >> This reduces deterministic convergence without reserving the chosen CPU.
> >>
> >> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> >> ---
> >>  kernel/sched/fair.c | 11 ++++++++---
> >>  1 file changed, 8 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> >> index ff5793bddc35..6836a8364440 100644
> >> --- a/kernel/sched/fair.c
> >> +++ b/kernel/sched/fair.c
> >> @@ -24,6 +24,7 @@
> >>  #include <linux/mmap_lock.h>
> >>  #include <linux/hugetlb_inline.h>
> >>  #include <linux/jiffies.h>
> >> +#include <linux/math.h>
> >>  #include <linux/mm_api.h>
> >>  #include <linux/highmem.h>
> >>  #include <linux/hrtimer.h>
> >> @@ -8459,6 +8460,7 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
> >>  {
> >>         unsigned long load, min_load = ULONG_MAX;
> >>         unsigned int min_exit_latency = UINT_MAX;
> >> +       unsigned int nr_candidates = 0;
> >>         int least_loaded_cpu = this_cpu;
> >>         int shallowest_idle_cpu = -1;
> >>         int i;
> >> @@ -8482,9 +8484,12 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
> >>                         if (idle && idle->exit_latency < min_exit_latency) {
> >>                                 min_exit_latency = idle->exit_latency;
> >>                                 shallowest_idle_cpu = i;
> >> +                               nr_candidates = 1;
> >
> > You clear the number of candidate when you find a lower exit_latency
> > but !idle CPUs that have already been checked will be cleared whereas
> > they still get a chance if they are checked later.
> That is correct. Is this a problem?

I would say we should try to be consistent

> (Again, mirroring what upstream currently does, let's say exit_latency(CPU0)=100, exit_latency(CPU2)=1
> !idle at CPU3 trumps CPU2 (assuming recent idle_stamp), !idle at CPU1 doesn't trump CPU2, i.e.
> the inconsistency around !idle is already there?)

Fair enough but the idle_stamp was also in the party

> And I'm assuming we really don't wanna keep a cpumask of !idle CPUs, if anything we may just ignore
> them completely, given how unlikely it they are to be observed.

We must keep them when there is no cpuidle driver, i.e. until we find
a CPU with an idle state
