Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B33AD528
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134428; cv=pass; b=AcBESXaCTRrHqrQkiVxhiRpOKKgwp+FYyBHuvIo+fKMvVKsgXQu9Sv2a4JETp1M45QrgVXvhztdkdc75qsnrshCJsCGSjl4bIuUKlvRryR+cQbxDHavM/ULVnibTfvKm6OscxT/zj8U/ZxR+eDecA97bH4Myfe998ZFlRJV+zcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134428; c=relaxed/simple;
	bh=1rXl+iKvG31hPrkCt1juiT/NMM+N5YG90o7jiJUxLOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg/P0AEIr/P4zGx0pUv2d5G+Ml9ug8o92OzkooIIPrp9fz4FzkPJokimqhSTmrNMM1jPEgaIEBmjMU6B8l0arSxSQ21T/ESLxi/np7rr+MfXfgvqlDQVt+zcvNjjzjGRgBQ2YSe4wGMJbi3C/bqBQM/zDmNmFTujIUCAGRBs3XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk2fygiZ; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk2fygiZ"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aac92dbso422974d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134421; cv=none;
        d=google.com; s=arc-20260327;
        b=XAPvKzQZt3YkO7+UD+wRVfhoLYuhOcUNozhR0agpIh56AB/RRbVDgUdo4iXse1khx+
         2Bgqsa/DQcjJIyMCPK+kTYDvJY+N7tMVNH9Tf2mP/3686H+fAa7gYJRFRb8LDYKWxoMi
         Xh9t5GVhRCR1sK70FwQajVmMNe7Bo5K9AIn9sHTdDerXf+Ly6ssZ/uEQDADtkrOqfAqK
         Byc8EFkmB2pS4VrG84SQoezM4q/N3emgClArFz620SlHd5ptuOYBsZUOgtCHq3EMzSkN
         OB7dMbmGwJC5XJfnSKBNJtgIX8Meq71aIRWXFoviCX+lWQv3D4ycv/sS9IWMglh4kSsA
         kBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZkOfAYL8ZF1FMqf/kMu36qJzGPBJNOCPM8hwn45vbh8=;
        fh=66LaWY1gf5Fu3hQEgbEaR0SAlzoTrEMIYwDGiYCjlr0=;
        b=eZyIjV6o1AY2zrgt6G8yY47fOOvZ6GcGazUc62Y8DUzZE1zgq1HaJdbjByXeFL4oNH
         hLHOIFrcUevJptxzV7MZKx49coHVnH6p1NvKg5Gl7gpm7Fr9OrP4mQjOQabEM6SmQ/2C
         GJ5DF2wohr7+1jFeNYiwSrSZzDKqWz8ohs9Hilvk+D5ze7SxXfrLQjjkuwqqwgiHhZkC
         xLUrugmasbydg0F+eM7Wh8anky5L/qizQnQeyfgOvCudsUiq45dN3/Z98MWgjIEhl/4K
         qQGropq7L63H5YYzA993G31kCUn88p+Dh9hDF2X1bIbak4BltPzjMlxVAzPwuT6sQRjc
         bJUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134421; x=1790739221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZkOfAYL8ZF1FMqf/kMu36qJzGPBJNOCPM8hwn45vbh8=;
        b=Vk2fygiZztDaLIk1AYzOzIIY4JFCZows1thJZzlKsJYfhU9d4Kpp1GiO2wGaqz/v/i
         uMx/xOfTmzbSgWQpvOyOd45DaSDUtHIx5vZ8WfjtPHeFA68c963WPkYFj93zAydRMCnj
         Vy/mGrWgXHVTLYPqkVDlOnS1GlxiB1vXVnUv0GeDW6NemS/9SGHKUMbngDPDAb4m6hTg
         ePIM8HBpJPHsdYfvaDvvmUTxNX4J6Zm0OS24tNd+PkJfSc28e/+zOKc2eqleOKzaXiFr
         toFNBYQHFt/jZXq1k7PY7usHJqtTEbolcJvuVZ2R4t0I3bcm2Ab+KOSWdZ1Te9y+5ghB
         H58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134421; x=1790739221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkOfAYL8ZF1FMqf/kMu36qJzGPBJNOCPM8hwn45vbh8=;
        b=uQarzNkaSrfOi33KGmSsSgdwf1WJtjf+FZkrJyma050ZZ15hLeTy5MfH92uxrTjqbL
         V9iUDuFqx81RvOi1pHr+5f/DlgsoFsTDgIdHOlzGJGEKaVrs+LyC//WMNPLHNCtjfvj/
         Qn+0/B8X6hq3wnnfseQEwOhBoKnSBOz3HrcYnEe5hKoebBjr89SUvAywJdV8fVVzTKGO
         zbInJ9SXFeW+KjAXx6wa0E6xgAk+vZm90IZ1xbIZl2qZXl9BaGQ1GoKG6cSPY17bFVLb
         jdP3pDgG31oTsX6optp/J5Gm7Cbc4+yoMJ3gANyR+pqOt79I5SXZvPyn0qTgpOZ0ETMz
         wvBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm3d9hvwhb5kfyc+FpUUZv2//tYDdyaA6r7Div4dqvHBpvHh32hdnWztvDUvs0jKwJjvWmWhOXiVe6PdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m/V2d9HUFpFL+TgZnC4W5z+lKqdiPtJykIoiVm1cIPzDZ3D5wR
	gMeK82gfxQiT6zDsPBDiY4f6FbNURmAZfw4bjQxoQd5Rmoi1Ax0U3ui2C/oJslZERlr7cdKHbYO
	9DK1VjzuRofhDUE9oL+BvS8hfGcYQmKw=
X-Gm-Gg: AYBFou3Gew0wl76XP8J0KiXkcfM1xm2XyHN6nCZF5mgFN4fd+pa+2K83mYVc0J/SVaH
	KRJz8CfB3uedwfTe7rXg/P0TuiepTD5rorHc/M1rFSmxFWzBgMYAgqYR0E7WRKoB6oPm5peEIx4
	fMvfdyHsnLQIJsXNoh6m+RvO00bUPe5ZGrFQVqM6guqJmJrTg5ZIocfQxybUSJSnq+fuQM+2rDZ
	oAdXzYoZEFVJzV7k1ABZ7/qEVNjQfLSd8+jw+A5jL4CtTSZFcrftm2cW6usI8UKvNMUvgiEtoh1
	1kODq8w3ZmrE82648vUzN6L24LAKubxvyT/7EZVgN9SZ/KPYDo9cACnKRYHILzZnPsvPwr2EVIT
	ZPNYmIgnAt4/noS6Ey9R7gv7G/T6SDQeFcMkk8f5yLfo=
X-Received: by 2002:a05:690e:4803:b0:671:1a7f:f74b with SMTP id
 956f58d0204a3-672d589763dmr497929d50.63.1790134420858; Tue, 22 Sep 2026
 20:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825044507.15217-1-kartikey406@gmail.com>
In-Reply-To: <20260825044507.15217-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 09:03:29 +0530
X-Gm-Features: AcwNN1XofXYRTMqU_1H_lyfP_vGoaxCV2g_bNzhl8WkGKlgr3IVJFhwF945oSaA
Message-ID: <CADhLXY6uRUsNCiPdwd0q38_4jumdK0SdwpCjYewCRJq8QzwbkA@mail.gmail.com>
Subject: Re: [PATCH v2] perf/bpf: Fix lockless access to parent_event->prog in perf_event_alloc()
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, daniel@iogearbox.net, andriin@fb.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:15=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> During fork(), perf_event_alloc() reads parent_event->prog locklessly
> which can race with concurrent detach clearing and freeing the prog via
> perf_event_free_bpf_handler() or perf_event_detach_bpf_prog(). This
> can result in a NULL pointer dereference or use-after-free in
> bpf_prog_inc().
>
> Fix by using READ_ONCE() to atomically read parent_event->prog into a
> local variable and bpf_prog_inc_not_zero() to safely increment the
> reference count only if the program is still alive. This handles both
> tracing and non-tracing event types without requiring any additional
> locking.
>
> Fixes: 85192dbf4de0 ("bpf: Convert bpf_prog refcnt to atomic64_t")
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2:
> - Drop bpf_event_mutex approach which was wrong for non-tracing events
>   as perf_event_free_bpf_handler() operates locklessly
> - Use READ_ONCE() + bpf_prog_inc_not_zero() instead which handles both
>   tracing and non-tracing event types safely without any lock
> - Remove extern bpf_event_mutex from perf_event.h (no longer needed)
> - Remove static removal from bpf_trace.c (no longer needed)
> ---
>  kernel/events/core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index ba5bd6a78fe7..39755bfacc55 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -13433,11 +13433,13 @@ perf_event_alloc(struct perf_event_attr *attr, =
int cpu,
>                 overflow_handler =3D parent_event->overflow_handler;
>                 context =3D parent_event->overflow_handler_context;
>  #if defined(CONFIG_BPF_SYSCALL) && defined(CONFIG_EVENT_TRACING)
> -               if (parent_event->prog) {
> -                       struct bpf_prog *prog =3D parent_event->prog;
> -
> -                       bpf_prog_inc(prog);
> -                       event->prog =3D prog;
> +               struct bpf_prog *prog;
> +
> +               prog =3D READ_ONCE(parent_event->prog);
> +               if (prog) {
> +                       prog =3D bpf_prog_inc_not_zero(prog);
> +                       if (!IS_ERR(prog))
> +                               event->prog =3D prog;
>                 }
>  #endif
>         }
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of  this patch.

Thanks

Deepanshu
