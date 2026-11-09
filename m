Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794264626;
	b=LuYM9Q1ou3iyXAm9Od7Vv8K6y0Ns64r+QDDjdl4TVretsFKpdHLxDF2/JHw10aKgG5zi
	 jw3TfMTZJXhn0t/aCGqwE2+bz+Eb7q9XidwYCG2Mh01+KEruE7I0jpU4ztRxpj6G1qlEx
	 NFqi/l8xBte4nbsmb7kVsuDLORvgF/0iq9kS694rB13X3UnBzE17QTWWN/GECrIvCgJkg
	 ye1BuKoH/xfY2CfxYVp6seGSkI+t3kuk/VrPN9EmK2tH+0dAAb/utnSi9sTpMBypLcPBZ
	 fwsipM8k90C2eGxiLmcvA9NHs/59a/vezgv4Kk93oZKQ7Q/8daeDE0UapdD6sfNQtOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
	b=AvyOSfi7KSq6f/JYJdyRf8zxteDMCSDIJwC1I6352F4sY7vMKHlNfP0mkvBv2b6Ie87l
	 p9MfNXaQ5SQXolCsUZkhPa4FCblKZVPQYJW4sG6a+xXCja5gfcEx3jjrXY8WTvi3KBdqq
	 nFgAfal8GA1bM3oeASamBELkFT2g/PTS2BOF0za4SnsK/CAtf2m+SSxYXAUVLqMUVESPi
	 Z+FB4waasdZFmKr5vuVkcK1H+TX9aX2pZ4EvY0ksZ/cbODq2JtlIP9NQWq3MgnEfpeLJl
	 Rww2JxEQobvPmW/G0ho2ttTP7tSMD9/QN7Qxiu2HqpVHhkC7dka0SVb0wXOPtza5+rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuBOCAoO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54FA606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54FA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuBOCAoO
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso1771908a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794264624; cv=none;
        d=google.com; s=arc-20260327;
        b=MrU1im2Noe2t7c8JStAEpxYBLW2E/sP2XkPLMyW3zX97DTGo8PhyKpBlikBGh5ZmGw
         cCpzmjZCQ4BvR534oKLjDRMpb45IRCaD/YAMpGQOHQmHcIVBRfsvtxAE6Ki8PEPE3jB9
         STndDCRMZGgtoKnGkyzgchQ3PrV6O04Q+AnU/Z3gH9ncDubrTyYzeTZwbyPxNApIwbiZ
         i1FXV/asYnW4gdqvWRGinWfSVbccZ8pNDqdlvWFlRG0PMDDAmetPGhhCGkjLDi5wT3EX
         M55q38mO516gLiri9UbXo0mwaJDnGnHNglzpSsIYNIYCefygp+xyZdaPcoiwhfOHUyFx
         ajHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
        fh=0aB2RMlTUdy1ab+P0To58svJBUuyK358v/RDqNFtzQM=;
        b=exyKRwvqjrhBJkRA6xr3pYXeJu4JJR12GAEPSTc2bTrhZP4NvoFoi+GveQDUFRRxPw
         ANUKjUuJy//WSuvKXjA6jODFl95r4ptsUzL5qON8C1MlvJ8TNkr9Y4fXeSL3TSE9Zl0Y
         aY+lYM8h7Ie3MFnoN3sCgepGIgaJZ2BYZFkZXXiRg3Ox7xwdDW7JCgvWlnTH8tVtalDU
         rDadkBtllGYblPGQk/UQ9PRwPTcdIjiZhu4T6WqpOp+0Yn6kPLf6lihb0rjd3S/OMQ6S
         GhWvbmD7oT3mUMPAwIvavB4Byf696d91L4PP/N+nPlqTbBonMwrZfENvFvJn6IvBynww
         7XdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794264624; x=1794869424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
        b=kuBOCAoOxBFc8wmNMTK6Rvj0bWKDAr6KPpBzFPPSGuFFp1mYUPa2WOvHHR6vcOMt4/
         mtbKq89PtpogcafK8HN4apLGDrHw14NOXbF6tqSlZOO/RY4Fo8eQibsE6qejuUpwCZSo
         HRy7HwB1PHp0zIiJKF/D82gmj0joofbd7TcLVU/HgIHw4SQASJwMmT+VFIFpMi3TqSL4
         r14EBOApL3zDWMk4M9+FCFJ2r3bH6u6D5XlqRCCRyyxtBmodUMR92L01XcFtgxAFIjeS
         ILXBCjP+kV3QAu8kYVKQ9bjxerpKSLEg4ox4WxzZAjFsYLdjRhWMO8vAPTdDrloJBgvR
         Rreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264624; x=1794869424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JVA+B8V5GYpRZnqFW1zVpWT3o7noCaTpT1OABug+5s=;
        b=ppueITznyAqfxJQgfJM7TvZTaQU5pH5yWoESYlBdvo68RpMBzaIH/8h289gbknByO8
         N+qNL0Akjo/MHALIHEIznvng8kVV5v7UMbd7UoecFxmLTnGUfZvqWZjn/j7UR+xXSG/g
         vYKkxakhYF3WXaQrCnPIolLeroBOWJ/PpWKikBHcxyhFkKGkiV1gFtJ2NIXlKzdcOhRo
         SD9fJTCpfV1/HiyhXKSbuFadJJcX/ONW2oSeOLLWFQYLdqqb4THP2OUP5D6hCnl9xHJT
         6nkKAGtZ8nkFVNq0GqN5Scph/I859+aLwLy53XJcMFI/XgN301fsx9CGCksi4Q81aqsn
         RvPw==
X-Forwarded-Encrypted: i=1; AL+hErHKlx5K40wo7/9ASKglclAbvAoiC5FNe9jMzbs0qQ//1X/nnZU5QtqP0EGHazC69JSs2d2N4az6s4uQDp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qPdxA2XBZlOwp5/jMZpE/J3KjuUIrxFL4zGMnG07i5mKqnqXz
	Rf/lzJCUXyTXE3uNfF6N36XxzXgqI5o7d+/7mrPU+Q5QE1SBkSmUBfF8oK+PM0dGtOlUqzZjsDX
	kH5VSgkXAMghj75PW3urtmt3eZaqKP8o=
X-Gm-Gg: AYBFou1bWAsmtzCjczi04LBHDiB99wBvf3p7bLXkFHwNkezhYm+7nIywdugMb4pCc2l
	1ZgE4o1qQQWywBPDkcalsCMwTKUY1v4r9CYOXfJG+iVOQufXudPXU0LbED1p94YrgD+FYzSyp1k
	XkK8bgvJ4KbDPuetwFcL3uK9kHYIw+OWT2suNFFIFSOXfc8gOdypqEaD5hx/VHpOw42s/vPu+c2
	9OZ/UFqzTmp50yDyAf5bfFGrJ/Yj2aG3zSXCN3zAYQ3A7q1fqRPlMPsALCNUu7+U3O84ts4VeQR
	vaKjy1bN+dEaAJqPu18txhlJiA37d0eXWD3yI4WHNguRHjAij8MSlJ3mRKxSHExQQ9Wq07EPChn
	pFwHWFsvBrBJlkxO30khD8wjAFUJ7YtFfDmQrK6B+gcKhBDi4mdYJ5Sl8+EbVYmCVo06GHUcT7x
	hk2XaMCZVDiIwl69WoslIv3AE=
X-Received: by 2002:a05:6402:4402:b0:6b5:8625:d327 with SMTP id
 4fb4d7f45d1cf-6b7564bb8b0mr778506a12.8.1794264624107; Mon, 09 Nov 2026
 14:50:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com> <20261105-alpha-profileme-v7-1-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-1-c474e892abb0@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 9 Nov 2026 23:50:12 +0100
X-Gm-Features: AclHuK8v5aBtIg32jclnjWJP3N3adwWeqdsURZmH27b0rZGwuLLEb1hb4knbBBY
Message-ID: <CA+=Fv5S8m3m6+UNJ-B-rT6AiQqkTnw0zLajJcGEcnFrAg7Z3wQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/14] alpha/perf: do not update an event that has no
 counter in alpha_pmu_del()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, Nov 6, 2026 at 5:30=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> alpha_pmu_add() puts a new event on the list with current_idx set to
> PMC_NO_INDEX, and alpha_pmu_enable() assigns the counter later, through
> maybe_change_configuration(). Alpha has no group transaction callbacks,
> so the core schedules a group with the PMU disabled for the whole
> group. When a sibling does not fit, for example because the counters
> are multiplexed between groups, group_sched_in() rolls back the events
> it already added by calling alpha_pmu_del() on them, before the PMU is
> enabled again.
>
> alpha_pmu_del() then passes idx =3D=3D -1 to alpha_perf_event_update(),
> which indexes pmc_count_shift[], pmc_count_mask[] and pmc_max_period[]
> at -1, and it clears bit -1 of idx_mask, an undefined shift. On the
> EV67 PMU the entries before each array happen to make the computed
> delta zero, so the event's count survives, but only by luck of the
> struct layout.
>
> The event was never on a counter, so there is no count to absorb and no
> counter to turn off. Only remove it from the list.
>
> Fixes: 979f867191f8 ("alpha: implement HW performance events on the EV67 =
and later CPUs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index a3eaab094ece..f77abeeb25b8 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -506,11 +506,17 @@ static void alpha_pmu_del(struct perf_event *event,=
 int flags)
>                                         cpuc->current_idx[j];
>                         }
>The guard looks correct: an event rolled back before counter
assignment must be removed without updating or disabling a counter.

Tested on my three-CPU EV67 AlphaServer ES40. A two-event group
multiplexed against a standalone event counted monotonically, with
scaled instruction counts agreeing within 1% on all three CPUs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
The guard looks correct: an event rolled back before counter
assignment must be removed without updating or disabling a counter.

Tested on my three-CPU EV67 AlphaServer ES40. A two-event group
multiplexed against a standalone event counted monotonically, with
scaled instruction counts agreeing within 1% on all three CPUs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
> -                       /* Absorb the final count and turn off the event.=
 */
> -                       alpha_perf_event_update(event, hwc, idx, 0);
> -                       perf_event_update_userpage(event);
> +                       /*
> +                        * Absorb the final count and turn off the event,
> +                        * unless a failed group schedule rolled it back
> +                        * before it was given a counter.
> +                        */
> +                       if (idx !=3D PMC_NO_INDEX) {
> +                               alpha_perf_event_update(event, hwc, idx, =
0);
> +                               perf_event_update_userpage(event);
>
> -                       cpuc->idx_mask &=3D ~(1UL<<idx);
> +                               cpuc->idx_mask &=3D ~(1UL<<idx);
> +                       }
>                         cpuc->n_events--;
>                         break;
>                 }
>
> --
> 2.55.0
>

I think my reply to this patch was accidental off-list, sending it again:

The guard looks correct: an event rolled back before counter
assignment must be removed without updating or disabling a counter.

Tested on my three-CPU EV67 AlphaServer ES40. A two-event group
multiplexed against a standalone event counted monotonically, with
scaled instruction counts agreeing within 1% on all three CPUs.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
