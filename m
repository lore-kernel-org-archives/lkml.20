Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793692012;
	b=PP234VEM7dfsIrVXo/a13H43IncrViJCaL/5/QmwjU4g9fpPTzf+B1SiEQ6ljJH1Fews
	 V6AMHrDlDSwCJ75P7Yb1QCU6MI6woZ/oGaIyxcP+SoLqwzGtal+1W+KA6pMes66wGRL+O
	 n5mdohQiEXovn78xHsneeCCXwBm0Q683MNA9gjoyjkP+Q9dBXpcOvlJb/vmLxjDo/IqBI
	 bvYGWM46kqVpOxBA/UGSJLkmZ8lIuFDmmSQC/izoDUUmlJz7Bhy77WIo5lIfj7wGe0qWL
	 xyC3nZsnzbadlLSnSon+cmY63QhVYLT+UiyTCPYpssUTdUe5Yjy49G/V3t2QPGphekQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
	b=EqV3A6aH/hP3qF0bi7sdVgcvBw9yefBLUZ6rNt5W83jHTnfqYZMpyHyijbDW6nCAoKf+
	 BuumTWSMTIYuoN7+GRmX1gJ9pAxvTlmNn7LDjg7qFwU3qa+s9T2w70D0bczBLreL/NIVW
	 I0dEo5S7L2CqSnbzsqVshjD7wQYuTG4qja9bmBCJpe1JQxVN6kHrILW8lp+o5a2EA3jmk
	 8DkCza9bOwP5v2IVas4UObcPP1sWKpywxPXfv4zwYVn/vgrd92vcKpRaCm1Fe4fcRKDCB
	 XKxUg5JGr1WsxX9OhDSthr4RwoEoFvdhWawXZNgrW7UqpQ3KfrJYxvXUcVDhwE7LzGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoObrpEZ;
	arc=fail smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E58F606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E58F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoObrpEZ
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be1e468a8so10359d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793692011; cv=none;
        d=google.com; s=arc-20260327;
        b=WSRUUJt7R0OJ3hyi+PKKQhFLqoAfGBjh8VzuOP8XzOd/FZ4tEHcEw9iYG7fKKPg3Tf
         CopFiPEka751mXWmBaj0iJOo19tquRaGJFl4kiOkXbtIqzHXYm6c/mLcdXQty+jBqr3j
         vkV/uYloisw5s+KDhS8IQaDf64sMeVfyELCCZDeQ4xKxFAF6aKO5rKsJZwZROS+BaPM3
         llDjVelu+EVnTHeefDWorkdVV0v4lEKFKVm/M/2qGCEhymI42N/8uhYq83zaLn/mR1Al
         SUAFlz9txsQ5iuHOLL+Q3SiBEZLPGDqwdaPIS0rgj/w723Q2HdlplwlmDMMKl335LqSn
         7ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
        fh=1Kk9McncevBRYXyCI3LUimrw5fDdyDjvYyR6JtKmWK8=;
        b=mhwTzX6DRs0zzR0OyFeYZeoJLqRzg5IBRW6IzCf78fR1EIcAGbCaTuJCaYVpfpelPm
         +Bj1ZO2QqFPgMAQVBnGktZe+5JNastyqRNGUdiqS/xFh3Mg6jN4Sl38d39oFvsOHJgdS
         UYzB6L89n3l6xtHlWecD12Q3Uocls4xzCC/GpLSs3tDqEtuPXVKNKrQDO5b6vq4vjoLh
         Rs4+QaPWuzfFwiR6NAFHyXFRsGHXazHQHOifFQG+tBlrBiNZjscvQyO+N837ymGSmctJ
         97GYCWwP9FR3UA0X/OIGLCJlHQU8Xr2Fye2fqcnmrWP5ndD+ShuEwSKPGb19vP0ORDDB
         RfGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793692011; x=1794296811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
        b=JoObrpEZLzoADc7vD7Bvwr5FOjMe2z2qyfiWuB5TZ6HoTdsGXNds3QjmcunW/2LkYQ
         c9QnBcpfgW1ZFWmGdDTS0FWrwYInfCzBz2GQ/yp9732zJ8bnK7ys6/xmyB2dmoQALcj6
         PHJV369w0CnTtYPw2hr2lPgCkkAsCH6lzDw04OnYoGNW83SRgkc6qOcsYRXlGyAoAdbY
         Fz5IObINtZLQx3qA7bfhpadKcdNK8gk/SbtT3tfXHN6czae/KIHA8uR6VxXt4nRl3nA6
         FC7GntIuHqRVB9vEv8vnRjLYM9M3Zh+aRigSTYEiCG3nWTcy6NfwcWYYYiqhCr5uQry8
         ZbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692011; x=1794296811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
        b=SgElQqF6oQu2DXfzibrKwpt+Fd1g84Pyy7lOdlzpjSruVHOYPHzUJGZURPs61b4bZ6
         QxK5xQPQqy50nY2+x7uhpXM45g1rOWgx6I96QwZgeZMghP32/c9CcrAdHFKTRK5eD9ps
         qJXP0+6HR5qhw4UBpArfJLECISRH29uCr03k24ORg25e/cnRQR4osbDkcsQul+WLQ4UL
         jYpxEIIsRWkCQ3I2dQSvSoW4UTFNxGa96h6k9oBBKS/KwvGTuXZUypujf1b6Uaq3l8Mf
         uf+mlC1rcaAUaJXw4Qa7edoR8GgqKZ7LeMW8aTa7Us2cH0IzjGABAzj+92t+DQ2HojSp
         YcLw==
X-Forwarded-Encrypted: i=1; AKwUvBwHJc3Fir18BGFa5e8yzQegiHXhLGAcdltsnH19FJEfjhMOYkLrhRUsR0sdg2odAzpgDMSP169qL/ZIppE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BjW7RgAeJbBd7vuJ92BSxtYfwewMPfcRh+Mr/ZxPp+bnNoD3i
	SKOmBBmnPPKKiPUvb9s1bL4/8PtCWAOPOd2mucKnqwZp3807mNF91mOl9ZzwolE5F7bStYamkzl
	zs4m/YnhjYyPPt+zckITKA+keT2/6u28=
X-Gm-Gg: AYBFou3YmVNagxIzzlai5gW8zZ6TwsezCb9qRPwmkUrZiRxKDo8MbnG4uqKQng8xzcA
	D0uVKy4PvHuhTZULUSEr9c0KTaUp93Jdwh2vDDyZkIxGNo25Rvx91Vk15VN5hAy/GzymmxW3Lk4
	pXoF9k2QyxaA7LN8Ao+Pjh07YysmSmm3QUSoAb6z8klBIo4O60rTxh+rXaJRFGgY9e4VF0hQr0t
	gS02nOAMfVRn9/232sD86WVlRI6HntIYxdG7suLTgRmwKc2nA5+jpv1jS8SWq+8rY5vyxSmSncN
	/Y//93sO7GMzXecqZK8n+FY20L3gehKswXSk3kr1+JOQP5RJ9tOyIvitHTFwW34+cOJ7RUx4tKa
	UiRD4mH0BUyAJJocZHICXWe03kVr7EW43a8AX0zwYvgFz1x3xO1iFp47p56tv9tTiNhvCdNXPzB
	tPfkZ/IbfZAwctuIk=
X-Received: by 2002:a53:ac84:0:b0:67a:86a1:699f with SMTP id
 956f58d0204a3-67ba4c87fa1mr7869443d50.6.1793692011225; Mon, 02 Nov 2026
 23:46:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com> <20261102-alpha-profileme-v4-3-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-3-61e00f5e1da8@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 3 Nov 2026 08:46:38 +0100
X-Gm-Features: AclHuK8W3aUGX7Fqw-nFhXB97QbZ2QNQORFdHiiKISHMfzT0-PRxCJAhJHGQpLY
Message-ID: <CA+=Fv5TQHTUBoP71y4HZ94Vg1k-mj9OZA_cBWs0bW1e+tnoTnA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] alpha/perf: clear PERF_HES_UPTODATE when an event
 starts counting
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

On Tue, Nov 3, 2026 at 4:02=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> alpha_pmu_add() sets PERF_HES_UPTODATE and maybe_change_configuration()
> then programs and enables the counter, but nothing clears the flag until
> the first alpha_pmu_start(). In that window alpha_pmu_stop() with
> PERF_EF_UPDATE skips the count update, because the flag claims the count
> is current. Since the next reload rewrites the counter, everything
> counted since the event was added is lost.
>
> perf_adjust_freq_unthr_events() does this on the first tick
> after an event in frequency mode is scheduled in, which is the default
> for perf record, and it then sees no count to adjust the period with.
>
> Clear the flag where the event starts counting. alpha_pmu_add() cannot
> do it, since the event is not programmed until the PMU is enabled, and
> stopping it before then must not read the counter.
>
> Fixes: a4eaf7f14675 ("perf: Rework the PMU methods")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 70840c05d39b..ecec78c355cd 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -456,8 +456,11 @@ static void maybe_change_configuration(struct cpu_hw=
_events *cpuc)
>                         cpuc->current_idx[j] =3D idx;
>                 }
>
> -               if (!(hwc->state & PERF_HES_STOPPED))
> +               if (!(hwc->state & PERF_HES_STOPPED)) {
> +                       /* The counter is live, so hwc->prev_count will g=
o stale. */
> +                       hwc->state &=3D ~PERF_HES_UPTODATE;
>                         cpuc->idx_mask |=3D (1<<cpuc->current_idx[j]);
> +               }
>         }
>         cpuc->config =3D cpuc->event[0]->hw.config_base;
>  }
>
> --
> 2.55.0
>

Tested on my AlphaServer ES40. On all three CPUs, the cycle count
included the work done before the first stop and reload. Frequency-mode
sampling also passed.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
