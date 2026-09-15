Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF378C9C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508112; cv=pass; b=Tt2uYh/9ND5rtRzmNF/Whxp2C3bgW7Cd6/QKpKcPkN0im2WC2tc5NQlSFe4X3qpXXATJSx5VIBX0Tn07x9EKYkMyCEBfgCAVbNpMCEZ1USADcibq+Sd+ibIXf4DlgPsG41oUdKyYW/XDtw/E8N0X9+WoWmoXxOb+3LIrhEZ/NcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508112; c=relaxed/simple;
	bh=qwm8xvEzb26ppkRe9QBMLt7pnvuAMNHHsZ659RfGK4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9Ehnt0YgsAoyQ1+w+FfEA6klNgeeXG5IOi8nIXb4Oy3d6x4lIwY0JkfZJGckemACeFs1sblsLTKEMTHNZWZLe1uw6QddwxXBAg7bCi5uT8rbiHs8qVqzCLhNkiKxuLRlHQJGY93XmVvlb/Rxw/YunMLMllYC+/5HTE4zw6P3/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r7I5KNlF; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r7I5KNlF"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so34921cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508110; cv=none;
        d=google.com; s=arc-20260327;
        b=LQLhZfcrRHEmWRQCmPvfJmFaWfced7TIidyQXF2zOE4R5KNnAbtEGjeuKX2ZIxOzaD
         J7k+UUE+GIlQcU8cRn/gQV4NQ7EQjtRkOL16Qc/rMWeGsW8diBhRd8WnxxdRksut4Qcc
         T6JSH57g3TghKM2fuv1zOgFnJXJQWiobdY227Iyy5W8sCSFzv97b64PMIbBSBdgNhKdA
         tTxUjPE3vFRjD3+BJ4aWJ2TEjf8YsxCtDWk+gMPC1CDCBtU8XONtm4E18gympqxHvXkB
         b/sYK2lMqjXLQYLHqwxHWgy3cYAQI0/49RbxYB0os8UVM24hUI7xDv3PEU9QPMiuf314
         Ku/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SpXfdh2jhqwmQcbad0mkWft0VDZsHJgeyC3fadWXMGM=;
        fh=75oBQ/HAUdAZ5VM7yG7+ci/UszN8Ev/YSdpxH1l4QcA=;
        b=UsXuPExrbnm46nKctaqhoLhAoez2lLhVHOglVBusFv/DLNYSOVduCM6WRD47gK2NZF
         ShFDE+gj3cAX1J0yR9fqFUq4OFGNxPz67zdxwwYzT6xHpWKx3jNsB848h+iUifpLvV61
         ho8PgfuLwgTf6lUV66NZ6928LuKaX0nkuhsw1htcvNOqK+KEIL5xpO/EDqnkWoy1Uljn
         86EVoLHGaid0pUMRK6QZUEsei/Ci9v0NQThM3ADOIvN23zi7rSOPId512CjOP0uC9qkx
         ve5aqlC7dz+rThb6XjKM892AKhR/fTGzAeINYGqqfePiVaVHe9AE3IhKOOEuPXh3t5uN
         R6ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789508110; x=1790112910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SpXfdh2jhqwmQcbad0mkWft0VDZsHJgeyC3fadWXMGM=;
        b=r7I5KNlF957jfseRLiwR5tB1QDP0/KY3o1u+DpVVP0TObbsnbE+ki2f+EVP9K7MRyy
         L+4xCI1vPIVwJ+roPsBpwlCfBQeJnAv573ohKDRRdxdCUIIW1nWAVlsIoNFVSfNOs6Dk
         jTMMWQmyq00x0E04OIdyY7Qi1HzkQGKnWWmqnn3f0375tOTTNSbNfcrWyq5eTG06pSiy
         XDKbKjB3J5aRAEghVx8KaPpmFsQLiyWyG0A8ervY9hLaD5QG8QZVDkaaxT6FJPVayIGa
         Flgx5F3vlXA0KrsnlauweOOQIMx3YczyuMx7ws5luvPOYD15qPiG619rryaPzTncDSrC
         DGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508110; x=1790112910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpXfdh2jhqwmQcbad0mkWft0VDZsHJgeyC3fadWXMGM=;
        b=QWF+VrF8klv5AAloTnI09iCVlgTd6g9uk+cSymocDVW6/KQjSOdVaU8Vef3M3lqFL6
         e+WtmrdeZCHTUHk0/aQp4kZSJQ0QJSAZVdEhbT8t4jwkNdqMIKZKKcU3V0gmAYMjcWa0
         omP96ZuPQd07YqKFqushrVBIhWMENnJBHkbM2xGZNSf0m6SjYsWO1HJsQnM2/sm/McjA
         LtvAqpdgi+09Kab6W2JMkj7Lyx1jmj/xAStbZW7WQt7UwVtEF3Nqr9h+H+7IUvM3xWNz
         xvLOJ0Lb75kp4XbfZcpSigsTz+l1JFKgO4qY/4+kB/x+HC+H7tHEg8SJsqrb66yFLNLX
         fj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVyxrbazM9qBTikD2wO1M9MYpk6Se7yUQI9ysHykJQ2FZlgseIcXGusZ6eZlSbeXcGuTy29UWecbyAFGY=@vger.kernel.org
X-Gm-Message-State: AFuF++lsKSEztmIPQMP8wk7+78a7OLYkyTCyQmOVMcSaiLvnBVTWarnS
	hUEZ2C8hpkKcgd3jS1JvGEiMpCuOGXBoXKVMyPu2c9xyuS4yDR+XTEBZD3S1sDY0hFQLxF+YFpQ
	PiQfOeKywbkmxRGE3T7V4TKzSgzFhrkbevt4PXEfW
X-Gm-Gg: AYBFou3eE1NQKCGBsojEJbr0P6c/3j6KJiGF2+Z8tNz3R2F3I5DrkXmv6kinL0X521T
	viKOtvmKBWpEnI7j1gdjJcx7yZnrzUzvaqc98c6POeFIxiiyn8f+5Ba+L0Ftk/p3we7i3Y1lk/B
	6XPTf4FBHwzF2WRtOCAhXKxBy0Uy52BWnMszxuCaKPnm1D8+hhKy2ybGZkQJXlZx6civNnkP/3J
	xNDG2slmgbZu+J3FnhNhLvqkOOD97ptIdSWdofaDRIk7zuWPQnDsk+MNxfAq7dLbv6GlSBOwrJC
	244fH+3+rZcR1Q3tu/CUMZbEyOolPJstdOtzSe+NrfNx8tpoiCxrOts6/VoyTXDcEnqSc/1XogD
	JIySAzss4UO4HXL95q9TT
X-Received: by 2002:ac8:7f09:0:b0:531:282:6560 with SMTP id
 d75a77b69052e-5327e6f2a86mr1357381cf.15.1789508107569; Tue, 15 Sep 2026
 14:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416033443.1492483-1-luogengkun2@huawei.com>
In-Reply-To: <20260416033443.1492483-1-luogengkun2@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 14:34:54 -0700
X-Gm-Features: AcwNN1VWQ_fBBO32cuN9KRTr9glrB65WLyXt9xYuBdvsxdhPnaCYHicmNMRbw34
Message-ID: <CAP-5=fW3yFPj2HuSZHntUNgze3UdY3eSsMditKMw4yWRCfg_CA@mail.gmail.com>
Subject: Re: [PATCH] perf/core: Fix race between perf_event_exit_task and perf_pending_task
To: Luo Gengkun <luogengkun2@huawei.com>, dvyukov@google.com
Cc: acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, elver@google.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 8:08=E2=80=AFPM Luo Gengkun <luogengkun2@huawei.com=
> wrote:
>
> A race condition exists between perf_event_exit_task() and perf_pending_t=
ask().
>
> During begin_new_exec(), perf_event_exit_task() may be called, and the
> PF_EXITING flag is not set on task. so perf_sigtrap() continues to execut=
e
> and triggers WARN_ON_ONCE(event->ctx->task !=3D current).
>
> To fix this problem, also check if the event->ctx->task is TASK_TOMBSTONE=
.
>
> Fixes: 97ba62b27867 ("perf: Add support for SIGTRAP on perf events")
> Signed-off-by: Luo Gengkun <luogengkun2@huawei.com>

Dmitry, the description and patch look sensible. Could you take a look?

Thanks,
Ian

> ---
>  kernel/events/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 1f5699b339ec..3422900263fa 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7543,7 +7543,7 @@ static void perf_sigtrap(struct perf_event *event)
>          * Both perf_pending_task() and perf_pending_irq() can race with =
the
>          * task exiting.
>          */
> -       if (current->flags & PF_EXITING)
> +       if (current->flags & PF_EXITING || event->ctx->task =3D=3D TASK_T=
OMBSTONE)
>                 return;
>
>         /*
> --
> 2.34.1
>
