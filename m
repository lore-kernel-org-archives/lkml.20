Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829271;
	b=v98R6V9iLDhtBi1+1LJrihDmVvz4kBlPz5wzZc0c1cakSpwj94ilEDBBpLuuRXoN1vPe
	 5X6R3sysWG7zOeUTAK4del1DaN9AMjWcykrz6J/aQ4m5xRxX1HYxpDhM9isooFgpMbwrE
	 xFkJvRKJttliX82+w4/1HlErFKwQn3zabSHANubeyIlszNwj0FUR/2rpb0VlyhLh3Z00v
	 KP70taYbka5AemXFPtT9/NYmC8G/UFWVcU2ChVx+3PG/oE9cA9SsuPb4xyAJm2aSZ4l4Z
	 OgU1S+YfqoVHOBfTalKvQ371Uw9TkdNvyk4bse8kocpIXvdkzyyKpFxDf4onp/C6NMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HdEmkRtqhrHqr/h8390gKYHp61DBlZJjPh2g+WT5sLY=;
	b=1GGuqZFQ82nZOknnkoEfqyl+WOFCxdLAhyPMy7Z/qkNrO7CKYLTxuEb6/oQN1nUqtLgY
	 n4+dN28ck826KSSkhRLHHcExhACddPxT58Br25wyuOYNxeSZ291erEYGzZGKDInfisHUa
	 7i18Vxvs1mFknPadmXxQQy7ofnAsH2fevgWBaYqlBJNrG0irsyLOuCSciEdqL5TVA+mxj
	 0c3x0OrWHlLd9XgS029noZKdheYebKL9HFQ3UxkUfh3W70fHkV/vA3vLhPt3L7WljRtFa
	 fLlbNeavG8niVnigxxUj1r9ZJK2ppC92dQtSyDnwZL2Zp/WWeDzW7bPEWCivY3uEJPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XD9+WKap;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E396070AA1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E396070AA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XD9+WKap
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40e30c26a4so12670666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793829269; cv=none;
        d=google.com; s=arc-20260327;
        b=ebP/IsOcQFkO1A1BxBC9buYm7ixKR+BcwWhv8ITlx6YqNBtjR9R2ElH2RVo/ROnqZ8
         as3+psU5H3dWT5BBveW2KICfckSsQyvr+iyvyw/swCuKBbkKMWMvSHtuHNBStiNosxI4
         mPRHi0A/YTyMwx/8C3iR07h2dtfDC8v8vtS6Ttn3W4d4AiESo6xt+zqHesLOLYTYrvQL
         EBRWBt+vY3CEETwDddvzCc2aKKINys5d/ZtuVz+z2n7/p2JqREp+7YhKVbw0OLxiIIUD
         ECt7rEZ61yMUxrNwNzB9/NpUHeWclywk9FggFGF0v5FblBG5dDgAZVnVs1xWpii9Culr
         E5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdEmkRtqhrHqr/h8390gKYHp61DBlZJjPh2g+WT5sLY=;
        fh=TiKYeBgoSEA+w0+nA8VcRyN8gBfZR12udVUy9ZRA/RU=;
        b=K7qRDS+6AX30cfuDSBjtbmGPoDA/A+KYVRCkmatyH7WaCQH7YtAKHqnzKl9F5/DL7R
         g/WzFiLTqQTdaiPGYQUiatjd9ojRAvDdpN2cK0BkJzS7Pgx6iMv63QH1l/Xr56v+a3mP
         uYtHLYiEUlaz4IiZwliffDM+iiQCbC9Q6Y3BGrFZIfwcoBS5gsHxUsT299fqGl65r1XI
         +O9/aSk9XzYA1jdoKd2MonNykHzDFkclaWQhF1fNvNM2Xf8Wz/YbYGq0VvoXbDn0jx7v
         q117KafEpn8rSqfBBy/DrcwvTO76y8+ObRMLotivn78hSb2TiyIjWcRx/q4hl4BRbcca
         oDLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829269; x=1794434069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdEmkRtqhrHqr/h8390gKYHp61DBlZJjPh2g+WT5sLY=;
        b=XD9+WKapf71YPUc4xSEtJErlSBsU3gon9Ptl1VqUROsoTbu6y8Q2xhKoL8q4kuBAD6
         d37J/ZrBJDD/FulOg79mYGG7K0j5sIdD/dPFbmkKzUjnQ0pj9/AAP/KMecFclt96VtYs
         15oD2aONPjDvUfnGtMiMq2IiQwVmUQ9uhiXsCK/DeWLUdZbuRy06qKnaNJB5ONh3jaU/
         /p1T2j4379sZ7Nmh2LT7Ua5u5SHaRdH0fyzNnDE7Xi1ldZmSxXEJu541KzJshXDq+vN3
         DDZWnrRszLtunqKCjDFQu7N7leyXg/N5/s+eTzw8NtdzXhUYKoIa1y+h6AkleZw55HlX
         Pv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829269; x=1794434069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdEmkRtqhrHqr/h8390gKYHp61DBlZJjPh2g+WT5sLY=;
        b=a/vDy8lGV1G5OHw3rHJHHZha4MhNWMZUp/2t6m58pZOT1YfDainBAmfgTcKtEeIJOT
         Y8RmWfS6CujXL6BYspP6rDUXqrk8yn3/UFXYTt19lja8zGbTozrPs94GkGeE2EojkIid
         NkYpiCdKGe5ZsuRJEzMYMIzCFIUhX9qsmRibfrBF93mkIBGRY6Oyv+k3ajYj3ea0nwEb
         ezrMkcQsdVE9odYFwMt+WJ6EQV2ti0CGtpvbRLxtILwfQAVpeCsjBnD36bW2AhbXaJaF
         7Rh6hcDO+eU00W3C5oVg7V/THCSYqB5PZTRpq3vRCI180jhEJMkU1inv3/Z8je7S/+p6
         HUVA==
X-Forwarded-Encrypted: i=1; AKwUvBwZxmD2KH5vJwUYCjUCRYt27ia2jw1UsGa25qwf6fFVZ2YA+0CIZY/MdiL4RAIZ6z5TlnHnmX6DnDyGLAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AqOqMNQrWmM7cFW6Bm3eF/gLZkfm9eN3nT8M+86VuG63biRjl
	dgc6d2ZIeLKoqgd+MZvkI3w2hGQe3dVFdmqNreUOt9kSRcEN93nF7UirdyZxtLLhmmErjnAEAYe
	Wb3tYu0HnkXQ7ZVfEvMUyqfW9vlqAc60=
X-Gm-Gg: AYBFou3qu487B2bhF1L9rLcTuVU0ZczGcPISm96pwRTefUX7ab2d5PCJX8sXWDxXykF
	r94SwHwMy4TawMJGU6NbTqPjDDEgy3A5d/np2WQsKsfz41dKI6OcuZcRCwhBvy86YO/9M726yBv
	atomhCKcacZ2Bf876kuK4bXlfWSx/Ps2I7Klacnxwyt+ucNRUL+LPHquWrO1DsDpw9nyYkvex9Z
	LBDnyTqQ3tQO7+KGhRlpdvF3XtzdNRk1QmWpTG26J741KrV/EEqDn/sEWDfb6ltO9evaXQUaAqZ
	RNB1kmT5GMBqhF4a9ftMDrO8ckIpqzOF5ZaizAULn4UxB4kRQqsVir+AU8HvnAnQnim262HnpVt
	ChHGPcHeF/YAN0SFSPCtzJzgPytsOIjI35JA8V+wklCNRHStHzPRmu/FDat73QNN+SY3yZTjJpD
	SCs0+AujdpNyynY6WVmaVY8Xc=
X-Received: by 2002:a17:907:d649:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c4d20152725mr68425566b.4.1793829269124; Wed, 04 Nov 2026
 13:54:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com> <20261104-alpha-profileme-v6-5-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-5-63362e9290a3@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 4 Nov 2026 22:54:15 +0100
X-Gm-Features: AclHuK8czF3vrbOSg0UUMnEzeHK7PETQNCiHD3zwCys0pWFAup8U0S_Vzp2Fbbk
Message-ID: <CA+=Fv5QO-jD+K00xUSv3yYS+yeAzOCAkiUpD-5aP9+vuEkg4nw@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] alpha/perf: ignore overflow interrupts the
 counter does not account for
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Nov 4, 2026 at 7:49=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The interrupt handler adds a full counter period to the count of the
> event on the counter that interrupted, which goes wrong in two cases.
>
> Rewriting a counter does not cancel its pending interrupt: wrperfmon has
> no way to, and PALcode clears the request only when delivering it. An
> interrupt pending when an event is reloaded, or when perf moves another
> event onto the counter, is then taken as an overflow of a counter that
> has not overflowed. It adds a bogus period to the count and can emit a
> false sample.
>
> And alpha_perf_event_update() already adds the period when a read finds
> that the counter overflowed before its interrupt was taken. The
> interrupt then adds it again.
>
> An overflow leaves the counter just past zero, below the value it was
> written with, while a counter that has not overflowed is at or above it.
> Ignore an interrupt for a counter in the latter state, unless a read
> has already counted the overflow, in which case add nothing. For this to
> hold, write the counters at most half their range below overflow, as
> armpmu_event_set_period() does. Counting events then take an interrupt
> every 2^19 events rather than every 2^20.
>
> Fixes: 979f867191f8 ("alpha: implement HW performance events on the EV67 =
and later CPUs")
> Suggested-by: Ian Rogers <irogers@google.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 59 ++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 52 insertions(+), 7 deletions(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index ecec78c355cd..dd7fc4ac1396 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -30,6 +30,9 @@
>  #define MAX_HWEVENTS 3
>  #define PMC_NO_INDEX -1
>
> +/* hw_perf_event.flags */
> +#define ALPHA_PERF_FLAG_WRAPPED                0x1
> +
>  /* For tracking PMCs and the hw events they monitor on each CPU. */
>  struct cpu_hw_events {
>         int                     enabled;
> @@ -315,10 +318,16 @@ static int alpha_perf_event_set_period(struct perf_=
event *event,
>         if (unlikely(left < alpha_pmu->pmc_left[idx]))
>                 left =3D alpha_pmu->pmc_left[idx];
>
> -       if (left > (long)alpha_pmu->pmc_max_period[idx])
> -               left =3D alpha_pmu->pmc_max_period[idx];
> +       /*
> +        * Start at most half the counter's range below overflow, so that=
 the
> +        * value an overflow leaves, just past zero, is always below the =
value
> +        * written. See alpha_perf_event_ovf().
> +        */
> +       if (left > (long)(alpha_pmu->pmc_max_period[idx] >> 1))
> +               left =3D alpha_pmu->pmc_max_period[idx] >> 1;
>
>         local64_set(&hwc->prev_count, (unsigned long)(-left));
> +       hwc->flags &=3D ~ALPHA_PERF_FLAG_WRAPPED;
>
>         alpha_write_pmc(idx, (unsigned long)(-left));
>
> @@ -338,9 +347,9 @@ static int alpha_perf_event_set_period(struct perf_ev=
ent *event,
>   * zero.  The value passed via ovf by the interrupt handler corrects for
>   * overflow.
>   *
> - * This can be racey on rare occasions -- a call to this routine can occ=
ur
> - * with an overflowed counter just before the PMI service routine is cal=
led.
> - * The check for delta negative hopefully always rectifies this situatio=
n.
> + * A call to this routine can occur with an overflowed counter just befo=
re
> + * the PMI service routine is called. A negative delta detects this, as =
the
> + * counter is always written at most half its range below overflow.
>   */
>  static unsigned long alpha_perf_event_update(struct perf_event *event,
>                                         struct hw_perf_event *hwc, int id=
x, long ovf)
> @@ -359,10 +368,12 @@ static unsigned long alpha_perf_event_update(struct=
 perf_event *event,
>         delta =3D (new_raw_count - (prev_raw_count & alpha_pmu->pmc_count=
_mask[idx])) + ovf;
>
>         /* It is possible on very rare occasions that the PMC has overflo=
wed
> -        * but the interrupt is yet to come.  Detect and fix this situati=
on.
> +        * but the interrupt is yet to come.  Detect and fix this situati=
on,
> +        * and tell the interrupt not to count the overflow again.
>          */
>         if (unlikely(delta < 0)) {
>                 delta +=3D alpha_pmu->pmc_max_period[idx] + 1;
> +               hwc->flags |=3D ALPHA_PERF_FLAG_WRAPPED;
>         }
>
>         local64_add(delta, &event->count);
> @@ -835,6 +846,32 @@ void perf_event_print_debug(void)
>  }
>
>
> +/*
> + * Return the overflow that an interrupt from counter idx adds to the co=
unt,
> + * or -1 if the counter has not overflowed since it was written.
> + *
> + * Rewriting a counter does not cancel its pending interrupt: wrperfmon =
has
> + * no way to, and PALcode clears the request only when delivering it. So=
 an
> + * interrupt can arrive after the counter was reloaded or given to anoth=
er
> + * event. The counter is then at or above the value written, whereas an
> + * overflow leaves it just past zero, below that value.
> + */
> +static long alpha_perf_event_ovf(struct hw_perf_event *hwc, int idx)
> +{
> +       unsigned long prev;
> +
> +       /* alpha_perf_event_update() has already counted this overflow. *=
/
> +       if (hwc->flags & ALPHA_PERF_FLAG_WRAPPED)
> +               return 0;
> +
> +       prev =3D local64_read(&hwc->prev_count) & alpha_pmu->pmc_count_ma=
sk[idx];
> +       if (alpha_read_pmc(idx) >=3D prev)
> +               return -1;
> +
> +       return alpha_pmu->pmc_max_period[idx] + 1;
> +}
> +
> +
>  /*
>   * Performance Monitoring Interrupt Service Routine called when a PMC
>   * overflows.  The PMC that overflowed is passed in la_ptr.
> @@ -847,6 +884,7 @@ static void alpha_perf_event_irq_handler(unsigned lon=
g la_ptr,
>         struct perf_event *event;
>         struct hw_perf_event *hwc;
>         int idx, j;
> +       long ovf;
>
>         __this_cpu_inc(irq_pmi_count);
>         cpuc =3D this_cpu_ptr(&cpu_hw_events);
> @@ -891,7 +929,14 @@ static void alpha_perf_event_irq_handler(unsigned lo=
ng la_ptr,
>         }
>
>         hwc =3D &event->hw;
> -       alpha_perf_event_update(event, hwc, idx, alpha_pmu->pmc_max_perio=
d[idx]+1);
> +       ovf =3D alpha_perf_event_ovf(hwc, idx);
> +       if (ovf < 0) {
> +               /* The interrupt was pending when the counter was written=
. */
> +               wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
> +               return;
> +       }
> +
> +       alpha_perf_event_update(event, hwc, idx, ovf);
>         perf_sample_data_init(&data, 0, hwc->last_period);
>
>         if (alpha_perf_event_set_period(event, hwc, idx))
>
> --
> 2.55.0
>

The wrapped flag addresses my concern about a read accounting for an
overflow before its PMI arrives. I checked that sequence and the
stale-PMI-after-reload case with simulated counter values.

On my ES40, repeated reads while multiplexing Aggregate and ProfileMe
events passed on all three CPUs. I didn't instrument the stale PMI
itself on hardware.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
