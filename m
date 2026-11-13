Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594077;
	b=i0BedItrreaDNGRgtf8QpnoLrbHcGCXOr/ALwwotTmjULDcg6lURa9ItcsyqVH4cmC1C
	 5LaTTYU2C1Ms/w42OLhZMEyCJOWVzotyL1XItdAOo2fwkF6kEfFySn/tCl6GMl4l7Ocj0
	 LvKjcyyvztl2PB3uqX50EpOAxgTaB/bxFjGBuNHqbSDynF/5QtBI45JCNaftxQemnY3iT
	 +j4n1u2nFz4iUgfmHZFFfvA+ewJKtYG5ufHv4eWxp9OKaICQwS4gANBkRoYnn6twsYdTT
	 oqtMCqGxwFva3EaUM2N4/T9ISAAeec7DPRzZGwcKoiS9T5CiyxOmNkd212ENMaEi0JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594077;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g3nU+TBwVWjZ9jQB9EUtuB57kYTq8SS5/0p7qVUrO8U=;
	b=NplyCqigjhux/i0LRaMJfAU9/C/0GzMz/ZVg/8StZY4ndtzE9FMAZn4MbY7lEO3LCitM
	 LVLPTwH8vehe8iBqVqkMVe6AFrSjnjOeqTtnKxmvfa8d+kWAcXxs8VsblPFv/Y7BMFKj8
	 IqkPwPHH6Q7tzjZ7HH7tI9igWmqOxG4cPg+bbZlUjwC52fZT0+oznZoYb3yYqDtq3K/dg
	 xnRwxJWujz/qfK0hEQy3v74kjjd/QdsTbN+M8fV+tYMAbFyG4Y0TOlUekZ9O05YsEywBt
	 NRBu121Y5hGW3ErarRpGBKKoOVz2ueEN6WaGhMBVjhWbmptJHxf2kMB9M8CzgX5Ea5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VShVU6bb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6AA606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VShVU6bb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144E31F000C8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794594077;
	bh=g3nU+TBwVWjZ9jQB9EUtuB57kYTq8SS5/0p7qVUrO8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VShVU6bbkAp6MP2s2zXoShn60DrzD/XIwhAdK+c+4TYDxRaFwrkwe8TmTnt5vsSnu
	 9XIoUmWYpaXYTy/xBjz0cWVlKEksf66/rzJxhAynN2M9YTZF3Z5aG3o6QYukuXZgQY
	 /GIsqCZhjGI27dZnZPAC3q9A+qv3EPe/PfoWJVJ0ckY6qJegwYCHVlJZ7wmpll3QfA
	 eaTIxL+MNWtx4YcSuA9LWxus5lii2iQhb1fxkElra/uYI0kUU1w3ksiptcuBqPBS7b
	 2x7J7F3aHOwF4r/E/S5WHersFdyOH2hdJW8I77MtDPj7kYl9JG88kz/9woEY6j2T5/
	 LAVMHxoqvytpw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c08539c827so1361173e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:21:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFSudda05ZAcDEsGcIKlHoFtcK/+t8UCRUQ9wLMmbCW8v53Nrsra5KBpNNBS2ULvv1sFOGMWNNz1xXgtf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z80fxRrLQ5lTVa37r8YUrJqWXEGArTTqtxhO4/HnzdE2XJqqdJf
	cPDVWQ1OFMunhpQ7GBQnyMRxRcrwyFJMl+I7RZMr3IzLqIg1OlTOUb7IG7Q2Ek2MV9hTuF9Atvo
	mCABiNH6C44WOktnSAa5RHmO7GSlbhtQ=
X-Received: by 2002:a05:6512:1388:b0:5c1:5b62:8bb8 with SMTP id
 2adb3069b0e04-5c1709c2f69mr1503098e87.67.1794594075517; Fri, 13 Nov 2026
 10:21:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108145028.2483131-2-thnkslprpt@gmail.com>
In-Reply-To: <20261108145028.2483131-2-thnkslprpt@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 19:21:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g-oDagp2GrZyhLmT-BYJqcm-D4s1eTrXCxB-fj5BNixw@mail.gmail.com>
X-Gm-Features: AclHuK-90duIT9Tx3Ga37dDtHaY-SpMbbAwcRovOmycin_mx6a06vXXNqbCiuog
Message-ID: <CAJZ5v0g-oDagp2GrZyhLmT-BYJqcm-D4s1eTrXCxB-fj5BNixw@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is inactive
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	zhanxusheng1024@gmail.com, zhongqiu.han@oss.qualcomm.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 3:50=E2=80=AFPM Avi Weiss <thnkslprpt@gmail.com> wro=
te:
>
> sugov_hold_freq() uses the NOHZ idle-call counter to determine whether
> a CPU has been idle recently. When NOHZ is disabled or fails to
> activate, the counter does not advance, causing schedutil to treat
> the CPU as continuously busy and potentially prevent frequency
> reductions.
>
> Skip the busy-CPU hold when tick_nohz_is_active() is false. This
> also handles systems where NOHZ was enabled but never activated.
>
> Fixes: b7eaf1aab9f8 ("cpufreq: schedutil: Avoid reducing frequency of bus=
y CPUs prematurely")
> Cc: stable@vger.kernel.org
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>

I'd love to see some feedback on this from the people on the CC.

> ---
> v2:
> - use tick_nohz_is_active() instead of tick_nohz_enabled to also
>   handle NOHZ enabled but never activated, as suggested by Zhan Xusheng
>
>  kernel/sched/cpufreq_schedutil.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_sche=
dutil.c
> index 14405a614991..50249cc1a594 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -397,6 +397,9 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cpu)
>         if (uclamp_rq_is_capped(cpu_rq(sg_cpu->cpu)))
>                 return false;
>
> +       if (!tick_nohz_is_active())
> +               return false;
> +
>         /*
>          * Maintain the frequency if the CPU has not been idle recently, =
as
>          * reduction is likely to be premature.
>
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> --
> 2.43.0
>
