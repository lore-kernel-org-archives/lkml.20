Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7CA2F7F14
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071100; cv=pass; b=Rdl2lGq+yHIBm+FB0mI5vUL2ECV0xyYYjedsSfcIyo6sm5pV5OUp0KcJEn/zBN1rpIcSSzZE8Dhj01HTO0g5c7+VuD5fPAJfGnQw35MoHOXKPsw+sB9GLl6t0852inCf7CtUxwJUM4MLyTV/ewB+9kRBRZMqKZ90TOT8HeKDSe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071100; c=relaxed/simple;
	bh=mwbnbaMlp8Ae2B8ikyuYp+/a1SwbvdOTBH/giZFf1pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBXfW8FOTd8o6o3KS7Y84agrVrMa+YMTJzBQ+CjMyd8JKr3haD5HBIQrHHlw/eBUhlVS86qyH8qEy+NwcgkKAq1HTo35jhglO6zt/fuUhvRPGXb6KlBaIS1gyLVBUuBCmL3Kz8jxqfKTpAHZ5DKSvT1mPYsAt1cGWuh8fsAE/m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB9nAcNX; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB9nAcNX"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ecf499af9so27538347b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788071097; cv=none;
        d=google.com; s=arc-20260327;
        b=ptRy/AR+RXG/asBse21NNITU2/cb1V5yCBFW1Y3wPhSmWoiLRzEXUtiPznQtWlQBco
         W2Feji3zKn7OwNa2y+ZTRoZOqpomBaaOa3pzdISL91NKqAwVt3EuOEv0gm8AGjujCvxn
         CI6HXyesSUMPEAmzjd0yyUT130dpUnoKi9G5fwtKjobj6lwEknk3OvLmmvA5ne+JyUje
         6l68NGPCUFs0/qwPs5aQBLQ3SyOwknrt5Xe0Ixt+EtY/mpUTln86I7tOuuI9rEeGJfoH
         9IJmpdGunJHzRC7NgBGSnrSXKJT4J/c3+Zi3G9ilf0Ac/2vcEPCu9fyRUYUYoA2L+6p8
         xFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZkOfAYL8ZF1FMqf/kMu36qJzGPBJNOCPM8hwn45vbh8=;
        fh=CWmzbeBWvJG9hbmA/Ecm7J5Weiq+BSTEuCpR1whoues=;
        b=OZ39iyU78uUzLi21Y7Pp+vap8Vfra/pQO1P9zI+vC0nSDXUuNx6q6VoUyflq5prEO7
         WO+g/xPE+EzJ7f+0HUFXupqZfu9SPbpeMTQlubBL/wSsicrhrGuy1wYmWTkwXf4R+76X
         zaJSk3vckjUDQEViOAQvFKIser4QWU/LqkUbTclV9iXq2IvUQvXuXbT59qo3B+ZxNK6U
         d3vFnKDZ6BUf5wlBtHdbsVIaxEL8/xQ8KSBeeK2zwBTX2uLUH8mW+FKo+m4ml4AcLZv4
         mXqobm3MrR9oqi7gqbZKQbfZukjzwWS8AuWrxhXbq8KavYfh+aWDYGSWj2zfMV4HSGrV
         Y0Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788071097; x=1788675897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZkOfAYL8ZF1FMqf/kMu36qJzGPBJNOCPM8hwn45vbh8=;
        b=aB9nAcNXdlaizemZAEDW0HlxNga9CJNXMVl8w47V+7iWr8hRPcU6h6Cztrlu/SvhHS
         4SURfH99wDWltcgfyf9QkJgpGDpbu/UfM3Ivp/gXz/lxTxEf4wTn0b9wZVNLEgR4Z3kQ
         eHbj/gVgNKp5og6rPDOTXo3XYEB9a6CD7G9uyxgX1aXVlQTHexzFnSuq5oLvzELRorPs
         J11VoT6sbfw31BKvVqtSc5qmPOd9OmzxTfjr2ZEhVt2+Fuxra4/ovg+gUWeRtjTNZDO2
         hLQYetiMveRTd0vlTUsaCWUdM/N4TenodcNIprngyuV7dHYQtd+2GI0++/n84y5t8/p0
         ffIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788071097; x=1788675897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkOfAYL8ZF1FMqf/kMu36qJzGPBJNOCPM8hwn45vbh8=;
        b=SZzD5kxpmEW5kIXRKLOx9x+PG2IOT1y/K4xOi9qCOCK0xi90kZQjA1BBWBb8JzbQIH
         EiU1rZzw8zMpn05wdlbLk13W6mGP4Pn5hhns86IAfxXRNRu/sF7bPjTOIS4M15UvM++F
         JIXyHMm54zPxaS/lpxCuOIijvPSO6dXkKY+0ZAT6AYFUrbCHpOrbZgu9Xhdab04wnQ17
         ByME1z0OA+2a6QWY7Ubo1bHxL5bRX+1pOPoKF45YplXuY4yorfgHgsbR+cmGWBleHHKa
         XI5U2mNrHBUMB9U2J/f22nWfMdBKboG6O1mJD8EHnsDoJ7szpd5FPGaFVGFGb4z7Y5ke
         2mlQ==
X-Forwarded-Encrypted: i=1; AKwUvByh2mHSY84DzDVEZGSU4EXO9YwQN1F7H5RuzaD04vdNJoEOif8OxWeV6HNkpH+w+1H3/JkyZ3fP00hBon4=@vger.kernel.org
X-Gm-Message-State: AFuF++nt2G86QymR1vA/Eqj1iuKXKhbHV4bxEs4VRIAjt4JQ7toScuuX
	B/8mz+fbvuNO5UiLUUNA4kw3k3KfbjL64gh1vCwlv3CmEVl57WMsK0vft3Ye2QnoDWcno0XoNXE
	bwQ0BN0xk85LiP+tnurNH9eXGafR+bRQ=
X-Gm-Gg: AYBFou0vgMP+/LGM5nT0qvrPrdfGIOB3yVwaBY9XR8TFg/wEonz6xwCzeB2/eCkpMEm
	nVppTeJG+Kl9+hzyl4p2RS2LuFP6rLIPwT5RSTiyNNxE+gm0PiYPDFlR9gOzWl5fGc5GQ7hq5yO
	ugx9Hm13ZOLsBTwH7b4Orz827Qiuy/5RekvVEB4tOl5eEpJ4Q/2qMvaxeyd3Adg00feoF4ZDjgp
	jCktz62XYqV7VDspdGAdgYNp3benABm9xz9bmBKEsmBFfM1ewlcTLHtp6i0i6HPLje3CoQ/UUI9
	NOGZq6+k88U4e16159NkXcEghmO8kM8sDRFE9L5Xp52uUY0EQZrhwuGCBbHLdfvLlHt09Z34/CT
	1+OAtHrNQO2ZBP8Ub9J8qJ2m38S4HG9F8jg==
X-Received: by 2002:a05:690e:118a:b0:66e:5085:f264 with SMTP id
 956f58d0204a3-66e55740fc0mr3654481d50.49.1788071097333; Sat, 29 Aug 2026
 23:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825044507.15217-1-kartikey406@gmail.com>
In-Reply-To: <20260825044507.15217-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 30 Aug 2026 11:54:45 +0530
X-Gm-Features: AcwNN1UJXiPxeecGwMmPThQayYhPtdBKrxtA98QGwRhlFNCPnG14xtruFeO76pg
Message-ID: <CADhLXY6D-+FC24c8-UWf8xW+5tVGM=J-qhViKxRWCfPDyvQ9Lw@mail.gmail.com>
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

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
