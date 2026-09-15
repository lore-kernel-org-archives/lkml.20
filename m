Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E237B400
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508290; cv=pass; b=SB5Gv0VRy5QvOGw6T/m7hlr15c6yZq5e534n2QTjIPBs2LQ9CKeaGLc7pw+ya2ntGZt2+jeXnJiMm/MTIGj6oSDrjahK2Lbx58DbIb9vFmyIyNcVG8sqR7SEiYNvuoalcLdA4QMR/2NYnqsApu9nA1hT77bps6XWsMaLBan2yME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508290; c=relaxed/simple;
	bh=tf5+kz+Lwb+AcipCZSgN40n6BQ/fgFd7+xB1pxv4OC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuNAzh8m+g9d9pv+Rp4QpGUpeKlElBjQHTKTd19TtCX1Sm++VTktBjUCOCn66ZPByXo0qXog0nai3SyvZ1r2v4pEU7EACii0ehk2xuqPlGzWSGB60qS4bMh1wVWqWxM0yljMf5Xa2PcTwhsqQpeLygO36n5kokwaBt2xVyY+ZIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cwkfbaz5; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cwkfbaz5"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530d5fc2cd8so28061cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789508288; cv=none;
        d=google.com; s=arc-20260327;
        b=Sht33ux04r5PQSRQpGkaPhwt1+DoqZzKxI2t5gNy/E4eoIbJQEAXzlNBzebx0TpTmF
         B4EvpbTOfafoyRUfnmuoSG2Ul+DAHOvXJL2axbnPWvL//E59X1rSONuXl2Q4BOJRsjpH
         rJJr8g1ZlsagZLZFfq4mZK1APZ15UgBr9i0k3LWbUqRQx4GCuWubd1Cq9dGmGabdovf1
         Efi6Z36/q2yVT5jaJE5BHEVnonq4oQmkRNuT2B67rpfs0LmLskArynCHrU4999Elx6Cw
         GIjz5UwRZeVgDAADb2gZE8e/NPoFjrB/iK2zxNhFuMAbA+F3T57wGSvYEbkyW+BRX2T4
         tvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj/SZ3uO4mBIi6FG9GIM3H53q5vTFxwH5yPRdSUlx/0=;
        fh=A99CaDlAXjeIpWxJOv7lEgqbpIKH+cu4ZzfJpkgQRa0=;
        b=qhYOdx5WanPsN4kPuhr1564h9cFUEwNwgfxRSUluIgBG5YYAWO/s1zQ0SK7eFmJi0A
         fEiT5WgqNoXHgmFylorDbZ65BjmXlnjKiltNG+6iQTzsKuqUhRv/k/HkYXYFMrAvW1QX
         Iio1TxrS1qE6zko13uc1HVjQ2bREpkdSnEMT6FoqayCsu8vxBh3VHa1m58bjJe+r6BOm
         mp4Qro9jAk2Qhb9QIgm9F0/Ihaf6HltpHntRUHmTaRIqaWPZm5S4n9qKdmi+d6FvxmF6
         8LGAuNUUwy4M9tW9ZYFXMPaq8yuO7W3wapqSXn68XLZXMorSQSK1uaCoLmc/mZWrJj0u
         wdRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789508288; x=1790113088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uj/SZ3uO4mBIi6FG9GIM3H53q5vTFxwH5yPRdSUlx/0=;
        b=cwkfbaz5a4m+Nb7KZjvCBA58pWgvnKJT+UdeI/8hhp0EulrdCcgahF+VfSg0Ig+eEu
         YXwuLIZt10n5osIwawZrVkAetKqXTWms2a6GNVd/5Isnq3S3qbCl+CvFAesmVPXWCX2U
         98NKf277/oc/5pzTJgzP/CW8afz2mx4SsxH82CMTl7GqOewDr2UrOjZ/3xPXL3W+I2un
         G4N6Ari7plSsIydxP9nizJP0iVuTvdI//ceK1eUriwrkh37Dsl5XYU2uUixtApoabput
         TQYs0pJpP2ehBsrH/tAG5V8ENLqD2lAIeLKBddFMGqZ/a97tczAzqgUe62dnCZQAvVaL
         i7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508288; x=1790113088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uj/SZ3uO4mBIi6FG9GIM3H53q5vTFxwH5yPRdSUlx/0=;
        b=jkL7oI1hvkWk+/+Hzz/vKrbdfq9FlIKdg04Nj0unFhwiZcQ1vCZapltpqcmsDULiBW
         89cOLCZLwFCP8bG7vXDrGMto2pa/BnyQN0sWv7PPVC19fh/SGCKE+MFTbr/eUG1dj9Dm
         GVB2yB5zaNcpW534Et08/J+iJxQ8mh7+VPEaBECIx/2U/8IKjr4Yra/czI+84DS2OI4S
         Za9MQ8Jqu0DOZBOyB2IfkDwfMm1Pko7Oexf53Vm27OlgQDGwvFEokd/trIcAKyxuRi1f
         ymgkSYDFVYOD7hvcuuR+rwjDaFZlndDzBUl5C1KqjoyoBUS39z/7rhXETJnv3u+yXyi4
         qcVw==
X-Forwarded-Encrypted: i=1; AKwUvBykqCbHIpXuna4mSqXG6teoTsSBOgz/PUcZOpu6aVhqArJTjZfWqx/CwADPbe8x8+Bq/1aGF+SqcpVfGes=@vger.kernel.org
X-Gm-Message-State: AFuF++k7ddCFgBpfygMT8eydeZ5kZ4dNyAwJuIPfRJ0ffv1kbnF98oA7
	SPA8pzJMBO8+IpLPmJEQmkxl39NKM4ZdgYPfvZyC/SBh1xzNtyAho87/CdGHNdFr5jKBbvJjFlE
	W64wqc9nr+V5YpoeELGGM5PYnQzjZ/zkSXF83VNpw
X-Gm-Gg: AYBFou1Ox+GyA693CwPJEGX52Cbe+vzJ0sXQUorrpXnGtcOnmz6yBmH6/n8s9WSRsOl
	IsdKxPX+/Db21rVthRZOFTA0dUDsedKl7uB+2R9CpoBYv09At4SQihoD5MI2ica9PSdQJ1KgjW3
	dr3Wgntz71BIGZgVZM4HtIw3+K9r2ObxtwgszEqJ8uznhI/UvAh8Okle0Xnxvbbm/A9HpbK6GP4
	VCb0G9U5DSF7seEOo8WplmiY//TfZCeAcL/hKMJMOTJ6GcTaHCKx+UHDr+dPkjAeNwCatfjqpBx
	WX0YIdI+5UX9tuNtSjg/rSNf0E86xe2bV06n6M7tGFivxExTBBqNFJCVEtvj67xhEp8bb60xv4u
	APFbh7fgwhqD5x751VguL
X-Received: by 2002:ac8:7f09:0:b0:531:282:6560 with SMTP id
 d75a77b69052e-5327e6f2a86mr1402711cf.15.1789508288001; Tue, 15 Sep 2026
 14:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321105835.7389-1-kexinsun@smail.nju.edu.cn>
In-Reply-To: <20260321105835.7389-1-kexinsun@smail.nju.edu.cn>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 14:37:56 -0700
X-Gm-Features: AcwNN1WcDo4psBdya88EuyT7rYNEEi-tLpQ6qAXr8xzpTGZqui71u5NNPhj6wjM
Message-ID: <CAP-5=fWbKeudydV8mxErya+xfz0jJXZ9XN=R1mFmLw-nBCz5+Q@mail.gmail.com>
Subject: Re: [PATCH] perf/core: update outdated comment for refactored ctx_flexible_sched_in()
To: Kexin Sun <kexinsun@smail.nju.edu.cn>, peterz@infradead.org, mingo@redhat.com
Cc: acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, julia.lawall@inria.fr, xutong.ma@inria.fr, 
	yunbolyu@smu.edu.sg, ratnadiraw@smu.edu.sg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 3:58=E2=80=AFAM Kexin Sun <kexinsun@smail.nju.edu.c=
n> wrote:
>
> ctx_flexible_sched_in() was split into pmu_groups_sched_in()
> for scheduling a single PMU's event groups and ctx_groups_sched_in()
> for iterating over PMU contexts by commit f06cc667f799 ("perf:
> Optimize perf_cgroup_switch()").  ctx_groups_sched_in() was then
> folded into __pmu_ctx_sched_in() by commit 2d17cf1abcbe ("perf:
> Optimize context reschedule for single PMU cases").
>
> __pmu_ctx_sched_in() is now the function that schedules flexible
> events and may re-set rotate_necessary. Update the references to
> ctx_flexible_sched_in() accordingly.
>
> Assisted-by: unnamed:deepseek-v3.2 coccinelle
> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  kernel/events/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index ac70d68217b6..463440774f26 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3556,7 +3556,7 @@ static void __pmu_ctx_sched_out(struct perf_event_p=
mu_context *pmu_ctx,
>                 /*
>                  * Since we cleared EVENT_FLEXIBLE, also clear
>                  * rotate_necessary, is will be reset by
> -                * ctx_flexible_sched_in() when needed.
> +                * __pmu_ctx_sched_in() when needed.
>                  */
>                 pmu_ctx->rotate_necessary =3D 0;
>         }
> @@ -4575,7 +4575,7 @@ ctx_event_to_rotate(struct perf_event_pmu_context *=
pmu_ctx)
>
>  out:
>         /*
> -        * Unconditionally clear rotate_necessary; if ctx_flexible_sched_=
in()
> +        * Unconditionally clear rotate_necessary; if __pmu_ctx_sched_in(=
)
>          * finds there are unschedulable events, it will set it again.
>          */
>         pmu_ctx->rotate_necessary =3D 0;
> --
> 2.25.1
>
