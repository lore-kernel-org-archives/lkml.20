Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794334496;
	b=bNDswFoGBs9H0ED8Wnc9u0Ha9yIOVMJAeK0fRc9YqChixQr53iuQH6iLqoVW2hpLc5b7
	 JMuFm9o2QyvGal7WxxzEIsR8Y3PJvJpyTHeGgdVhfN2j/8NDXOq/pMzyLDnuax98Tfr1l
	 Et1QXIPm3ohzHk6MBFmRwiAL+DI6gO9tb3hZFOlemEfVBfVKl6D9JLprOhQ2GAJss/lK3
	 9XTYVegrBaI7kpjC3vK14pgyJyqUl+aoGZHorUVJmoDJzvWGlYz95ZEA0wMDwLEV2lr00
	 fdN3A36sMWR2fUJ2qNurmzDhytM8fH12bIWu8vyf6O/9vGbBlo6JPrZMw3LzOu86nIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z/T19qwkUhRsiOdHXZPOOueJ4FV/Vspzv786LxtKzAs=;
	b=TkU+XM1ZYju8wH4WBwGF0pfabwd6p/Rmu8nuodz9vF5xgZORJ2e5bW2kL748gd8ULhet
	 N4hlUUVZhE/a1JN/GfhKEbOVrp975FfwGRRzTAWpWlm0GZGwM/o+tcn8VowiPrBSl5wwJ
	 2hUWIAqk7WF7e8EkKnW2Zy6oHuoGOrTXYR74W0QwRGaclVqWpn0FXrepnulpRcFYghp+R
	 fdIJAdqNVto30/4j1IUG50fvWW4kKRoNksJ7FGm89IPZLbqJsOvnUMw2POw+f7PupdNPj
	 Bs+0LrzK6zHqUytmpDcXHUi1SFzZNBSLp7S6HQLQWvdz6EwYalqtP+1D8VK5yF9zgYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qii2TyZ7;
	arc=fail smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB79606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qii2TyZ7
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5383c97c8cfso2441cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794334495; cv=none;
        d=google.com; s=arc-20260327;
        b=o2OtyNJhjL/Bez2Jwn5wxCWm94ufFF4FOr2VhdcUXgzCZJmpHwxiKV4pA3dzUKIcuq
         9TdXdW2wkp13jXL3gbyHXYknv8m0WJVB0ayt0DW6abBjVjZIWVqiT+lfRYWMhhnQoI3P
         FlU8t7S5wtfCUo3uWq17+Lznm37W+Cm4HC2ABCUBkPbWL/ONcC5zhctu8aG2/tABbx4b
         8Z+a73T/lLFad4Iw5N3dpwvoEyK5WhdCofhjyDFwsBrDU2zb+Lbt/lkpfem1S+GTRklT
         0rARszQg9cQqLLB9acDdP/lKiTIcvCREY4J4rq+aePyfrUe8zn2wCeN2ZFWKJa7ulh1N
         YEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z/T19qwkUhRsiOdHXZPOOueJ4FV/Vspzv786LxtKzAs=;
        fh=8j7H3YtOqut9wcLl97Dqh4s4VWke49/0LqwuigKduxE=;
        b=T/+NUFbta09waJKmIpUXIdixe6ImZaO2Z49gVe3T7svC6EHbf2FlB7V0JgfIuKbD86
         emjAWDlEDKlRu3v4PqMibTzfbosHw9YPvrPo7ONOa8xxjhGnffrtYvLMhuNfRgCBamDG
         Yqj/JB4ryCB4e6SAiroBFBzV3Ah7MFLwEXWr3YByG7auXC0ZhQ+inVD9DFi+o6FtXIO4
         jreo6+pczejC47Ke6ltCm8pwA3xQb0urRR7+zkwCYUmS7w9dT6QXWPc9S/uXsVSpPcJ8
         +d7APyVz0yqCAzWUL/eguxhEqCHVKuFhwijxcr6j3j3SERjIKQqnGT6pp46aVV0JVKnN
         dorA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794334495; x=1794939295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z/T19qwkUhRsiOdHXZPOOueJ4FV/Vspzv786LxtKzAs=;
        b=Qii2TyZ7jCHfr9Ifg1uG1l0L4Vo7zZoQ477vdRT7bBObbfapFSMUNJUUS9e6evAISl
         Q4fni0WpJftiDQlaAZnWe/k1lb1jGD7BKoAINmB+/2no1PwYIZJ/a/hbcG5HDoKUb4kd
         Du5BIyXy6U6uc+15eisV6pjyrwaDIzi3xN4Mpi91JkuV+1Jn0fLxun22+8QwkG/Jphln
         DdhtcnrO7a1XqFHh0DWXtLUA94wMF9NCKlMZbvLWnAOiIs2IrH9kEUjfCJqG2XirLsh+
         oXCKNERJq646eWiUDnp1iGQS0cGBRE7zpMSEwLLR1FlzSW4I6xc2RkzWMmTXdYSxIx9w
         ILNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334495; x=1794939295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/T19qwkUhRsiOdHXZPOOueJ4FV/Vspzv786LxtKzAs=;
        b=ib/Y2AGrvf05j1ctPu3FjbHSw0tL3cnWO3iWIFWhRV1HsUtPUQGe+22fxGh6V/ckT5
         cTVaOS6arTBdtJ1A21x4rLxT1ys3R9CaSILpxOAvnh9DlGPu4akXuAJYroQMRlAHYpmd
         aGJP1VCIsWIAS2sI64xwKFG6QwUnd5CCqj7jgf/CB3yWcwIny8ckQTeXIVe3oz1BfLec
         TjFWgf+NN0E0b2yiljqNHqjks0+2A6ooQe3VSFtjJRllb/YUC79X+LuD01eGRdaunBML
         ob0TgNAJlFFaG7MPvBabUflDhDt5rDN/CK3o48RM1VA4w/vX6/GI/c9OGnZu0TNiWFsx
         euCA==
X-Forwarded-Encrypted: i=1; AL+hErE64HOhyRWnHBZ9VMD2abhzVx2KsOYZwCinyPdvhIAZaiJ6zTEL7dendlh0sGw6jJ4fFWoah2FCbLTFs8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dekRyZi4GmUpDDnCboCee05CiLsib31YE0J7gquss9CW7YUXB
	6Gquywd93xsqdJGAEGjb+9zrwLMX4oiJ8sol56TrYA8uCWHq5acspmrQCxi7WvMUB8d25CaCzDR
	k/J0MJuCXiyZcYRZ56aZ/Zp77IF6Zkfu5Y+IgaQkYBi50QWgnSJoBTWUA
X-Gm-Gg: AYBFou24nrSRDVezaP6VKunNpF/5L2zCRb7AmrxJJb5/qHwUelbdK0xohtJxGZEW6xJ
	ILSfn6JK4lLwSKuETF/AptgVpAPuPb4QnBSusxhym5cllex4im2IWK/SJ+yMw1F1PozJkx5D0RP
	bjfJhjKxsE1M8l9Cv/huku3icSm1mqDvC5HFRYfBuLN8oIADbn/UGLx4ZPM6TaaNz5yCpK/YJ3w
	t2cyOUpFwKVcEC1eUv6vdYpqADtlsPCGil5Pwsy9hDQ1vI2YoOrJhnepD3Es5AS9Vc7+yj6gYss
	UfX7ZYjf3wDqfN5T8yIYohWQkY2dvTvmSpQf/Q/0EbLfGq17ZdXBw1j+rCI4RQ8+K5s1o5n4SZr
	wjGPPUoO2w3HMMadMR/+Z/u4oLPF3+UGBeEC/0AFuUdHO/fh06AioYsRHxFNZLgr7oMY=
X-Received: by 2002:a05:622a:2b0f:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-5569bc21f5bmr15411cf.1.1794334493987; Tue, 10 Nov 2026 10:14:53
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-tp-glob-errno-v1-1-6c2cb609c590@gmail.com>
In-Reply-To: <20261110-tp-glob-errno-v1-1-6c2cb609c590@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 10 Nov 2026 10:14:42 -0800
X-Gm-Features: AclHuK9xIbr7pga1JS6cGGqHrO7XBZ0oZ6bzuqE2kkPmCpNtl3AFPDmJMPPFj4I
Message-ID: <CAP-5=fUFXZBtHEfSRzcR1rXFXb9jXqzUpp+gvCJH=9V6cEb7HQ@mail.gmail.com>
Subject: Re: [PATCH] perf parse-events: Don't report unreadable tracepoint
 globs as unknown
To: hang.zhengyang1010@gmail.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 7:05=E2=80=AFPM Hang Zhengyang via B4 Relay
<devnull+hang.zhengyang1010.gmail.com@kernel.org> wrote:
>
> From: Hang Zhengyang <hang.zhengyang1010@gmail.com>
>
> When the events directory can't be read, a tracepoint glob like
> 'syscalls:*' is reported as an unknown tracepoint, with a hint about a
> missing CONFIG_ option.  A plain tracepoint name reports the permission
> problem instead:
>
>   $ perf stat -e 'syscalls:*' true
>   event syntax error: 'syscalls:*'
>                        \___ unknown tracepoint
>
>   Error:  File /sys/kernel/tracing//events/syscalls/* not found.

Thanks Hang! The Sashiko feedback seems like overkill to fix here.
Could you give a before and after comparison of the console output for
this change?

Thanks,
Ian

> add_tracepoint_multi_sys() reports ENOENT whenever nothing matched and
> ignores the error returned while reading the directories, which got
> lost when this code moved to tp_pmu.c.  Report that error when there
> is one.  As a normal user 'syscalls:*' now gets "can't access trace
> events" and the remount hint, and perf test 5.1 is skipped again
> instead of failing.
>
> Fixes: d002aab87de8 ("perf tp_pmu: Factor existing tracepoint logic to ne=
w file")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>
> ---
> Found running perf test as a normal user.  Tested on perf-tools-next
> 13a8d580433a.  As a normal user, 'syscalls:*', 'sched:*',
> 'syscalls:sys_enter_open*' and '*:sys_enter_openat' now report the
> permission problem, perf test 5 passes with 5.1 skipped, and the rest
> of perf test is unchanged.  As root, 'nosuchsys:*' still reports an
> unknown tracepoint, 'syscalls:sys_enter_open*' counts, and perf test
> 5.1 passes.
>
> The issue was found and the fix and changelog drafted with Claude; I
> reproduced the issue and reviewed and tested the change.
> ---
>  tools/perf/util/parse-events.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index f3ba70d4f76b..8a6d5a13863d 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -572,8 +572,10 @@ static int add_tracepoint_multi_sys(struct parse_eve=
nts_state *parse_state,
>                 ret =3D tp_pmu__for_each_tp_sys(&args, add_tracepoint_mul=
ti_sys_cb);
>         }
>         if (args.found =3D=3D 0) {
> -               tracepoint_error(err, ENOENT, sys_glob, evt_glob, loc->fi=
rst_column);
> -               return -ENOENT;
> +               if (!ret)
> +                       ret =3D -ENOENT;
> +               tracepoint_error(err, ret, sys_glob, evt_glob, loc->first=
_column);
> +               return ret;
>         }
>         return ret;
>  }
>
> ---
> base-commit: 13a8d580433a3b72b10be34f0e26787fe5659d3c
> change-id: 20261110-tp-glob-errno-672ea1eb786b
>
> Best regards,
> --
> Hang Zhengyang <hang.zhengyang1010@gmail.com>
>
>
