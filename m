Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1A3559E1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914206; cv=pass; b=A+Km1Mw6bh3DdJ1Ye/hu/I/a4fl6soBQjcKt+SIch1AhEhJlbXvn2+aAadnibPLJPOCFItyvd281HpooBfZ4boeShtvDdVy9KpZXrVqkVX/+7BXXSplZcH0b1klPgk6rijlqngGx0Qcbj5sZ3GNDzat7dBhStjJxW1Vx91fXF8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914206; c=relaxed/simple;
	bh=/cmKlDq8DFYSfOEtJaUMv5tjE2XNmgf878iFonULAYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpgVgKoYH7HIOkDcZ+W+SHlKZsYnGGVs0l1XvndUKQURxi0TSMV9V0eyHigXoQRiYtvvf7LvCNp50tqHWhrvwxo1E1K5y25qGmGYRiHtBoerFTH4w6K1ERxQaG9njs0fQIux7w5cRSfvsS7ECSqr0QS8be4iQz8s8G7n5u4HRjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=hk8c+ewE; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="hk8c+ewE"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so645699e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787914202; cv=none;
        d=google.com; s=arc-20260327;
        b=AL0K7gWIqR5KlkLjPu9FRtvgIrxyfi5JWs6ur6bi4MpOLyx3A3b0nXc4PofbOjlumH
         WB5DcCBM0boYT6OnX7/YVi0Y+m2I+CL4qgUUTTbkHuuUhqQ1z7CI2Wf3iBoiU+ZAA27B
         siRoki7aXmjTC1ymeb79m2nd5vOFWtSE1Qvlr6J96PsGogJDIeC0Gp4Rd32UL1Qh+Ixd
         7YZr+UXGtUDKS1jmLM37xdhnnhURPFjP823+eilxhyQcaGfgMDcHAru5fqbHQ6zBoJCm
         QdQZyiq0xOng1UwZIjSVzgH4f/bmZsLIK4JfLdOS6onO65XV2dbfpMZYC8j5Yeg2kTww
         OTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u8lFH0HcIkW98kTciUv5DunOUausL9QXc09fXIwSfCY=;
        fh=uMSYtSy3Xk6RXrvP23w+JwbfIoT3gtW3wLuIe2JCRPI=;
        b=AIPL4dYSY5KrGHo4HTfs6cmBuybH/SZXzDYmOFbTQGkHyzaiNFFszW/U1Vsa1a44Ue
         MDFgmPt1lZ/aWit5ycZPEXhRmg0GQvP/pvYoiK8YFL65H0P1nTwivNOcPqca3JJFwYcW
         uBeEPIbqvgwpqIYebpIMcz+/zV93zx7jXxbdDLR4Umfwt9HofUJDokSjJ9k6GOihE/Uy
         ya6e9Zi2tozqEEa3/qt+CtubaKLi0lGs4074O+8OVPZ6Q0Ps3nmsJgJD+7rrrNB11aKw
         9m736ohQKXNtJZgSz2q+4mtNLsk7p2VBxCSoMxukNTOOmUdbNJR2CyTwPbDMwmeRKXW5
         hBKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1787914202; x=1788519002; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8lFH0HcIkW98kTciUv5DunOUausL9QXc09fXIwSfCY=;
        b=hk8c+ewE0E7JdEzNTQ4K9HZ8m44/906X7j2n5FSgllioAW6FiJswuo7vLJ88sz2km3
         /I/imYCSm28c/IPK9f0Ts7uVjTpWFKS6tQL2X+JWo84oTZsn23RgIB0B6J7NGQVWvNWF
         DoTzs7SMykRzGF9gE9Gw6b5uwTDWsIv/Xutdrq6QclZ0EA20SvVh45diZ2lGRaSt8Weh
         zrMQtNvgLpKJm/vzUVXbEbwb7VLdM4H4EofD7szdp9nwXHqzUyffnytTG+qWRV8UM0bQ
         PyNav6Qnnr2NvkrFiWXLnOtUkw5frqGaSsZc3m5Gha3tSweh+69ePR3YVUn15rSv0h/d
         XXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914202; x=1788519002;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u8lFH0HcIkW98kTciUv5DunOUausL9QXc09fXIwSfCY=;
        b=LVkIGQobtbOi9Mh/C4Z/N7HmuGpnCoB8Kb2uLX+fmjt3I734oEioWVW8kbbQnyYd79
         r3cOPrGgpU6k9O61VB53TuBakTeyCfMZzFCATiOLDiIub5UZwKyrx1moXbRdvADlZYBO
         rkOeTfwSyLXykpJJ/C+6HsZ2ilPvXOz+M4gaIXKrV8XQSQn3JWOH8pRptd2wzE56m6ks
         93WTVFPqzNoNDs9uBXLVjYicpAOBID4pDAWFHZOfTi/+aeSfOg+FnxQYVDwJnYhUFxVP
         Hh1WFnQrxtigCGyAKVXBs4N/sbvWLFdI8lA2aYwRLHJRvOXiD9X/7PAhPdFvVQXMeKIu
         RbgA==
X-Forwarded-Encrypted: i=1; AHgh+Roq5X77st/PzbP8nxgHgbgoDkFXu0IVi9Bi+/AIYngdcqrP6UBjTYv0Dd5exNzajnWQqD0b0kysoc65S6g=@vger.kernel.org
X-Gm-Message-State: AFuF++kycMpsLPMwjITT+/A+4nf/rNZ97iHlJpQqtLMnf7+KeYL+l79E
	NWs80E9YhfamnPkQHr36m6kpQeqGPwUgjNGWEOy1LpwNrcY63JUFJUa6FipMAR0M0PPXkRuI8Y1
	Z1QEoR9ZGgZ/jhrP1+K8o2P49x1WxKzoxkf9ZnaOeIw==
X-Gm-Gg: AR+sD11xgMSikaFln2u7tnRvauDHABhSrLO2ByLleguXewnkwmdXC+I3NkiP21bkHsa
	7xF4Wnq6Mx8hb/FuCjDYM64Y6whbvDBJKhHMPyWU6hDJ0fx2U/mPMahy+2hB0GnsF/Nq8p0OEE4
	wcVh8m11Xcow4tzqvLZx31IHs6SYkaMXLNS8636+1HpSQ8NHvsseDFpIpuFFGRD6fUeAQGT/b0N
	z2EEIl01Q0TWP5Yq5c7TzhSGEtv3RShl4P4JEEQVCzPulb9hkvufRs2PnSIK1aS5CDZfWNsAY4A
	Qqr7DJm6WNY8ZQzxQjCC2h5Xeg8PsaGl/QP9xvvI9RGU
X-Received: by 2002:a05:6122:9001:b0:5c6:7f44:b001 with SMTP id
 71dfb90a1353d-5c680967056mr2568641e0c.0.1787914202558; Fri, 28 Aug 2026
 03:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821024640.1601299-1-main.kalliope@gmail.com> <20260821024640.1601299-3-main.kalliope@gmail.com>
In-Reply-To: <20260821024640.1601299-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Fri, 28 Aug 2026 12:49:51 +0200
X-Gm-Features: AcwNN1UMwJxqSjr7UcYRArvxGmZya0K67Rn2WYUklgep4iJra1Tjsl0TpYlszf8
Message-ID: <CAM1=_QQTv--NiWorjiFSrF+Ua9XaBL1MobNZSOgFqOb9w1FPKg@mail.gmail.com>
Subject: Re: [RFC bpf-next 2/2] bpf, mips: Add BPF_MEMSX support to the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

>  /* Narrow load operation: dst = *(size *)(src + off) */
>  static void emit_ldx_narrow(struct jit_context *ctx,
> -                           u8 dst, u8 src, s16 off, u8 size)
> +                           u8 dst, u8 src, s16 off, u8 size,
> +                           bool sign_extend)
>  {
>         switch (size) {
>         /* Load a byte */
>         case BPF_B:
> -               emit(ctx, lbu, dst, off, src);
> +               if (sign_extend)
> +                       emit(ctx, lb, dst, off, src);
> +               else
> +                       emit(ctx, lbu, dst, off, src);
>                 break;
>         /* Load a half word */
>         case BPF_H:
> -               emit(ctx, lhu, dst, off, src);
> +               if (sign_extend)
> +                       emit(ctx, lh, dst, off, src);
> +               else
> +                       emit(ctx, lhu, dst, off, src);
>                 break;
>         /* Load a word */
>         case BPF_W:
> -               emit(ctx, lwu, dst, off, src);
> +               if (sign_extend)
> +                       emit(ctx, lw, dst, off, src);
> +               else
> +                       emit(ctx, lwu, dst, off, src);
>                 break;
>         }
>  }

I would actually prefer to keep the original structure and not combine
ldx and ldsx into a single function with a boolean lever. The helper
does two completely different things depending on the boolean
argument, and the two modes have nothing (MIPS64) or very little
(MIPS32) code in common.

Another aspect to consider is this: An implementation principle has
been that each emittor should take care of its own "dirty laundry".
This means that the emittor should mark everything it touches as
clobbered, and emit necessary delay slot(s). You could easily call
clobber_reg() in the emit_ldx_narrow() helper, but it does not have
enough context to know if a load delay slot is needed or not. Without
the load delay slot in the helper, an implicit contract between with
the calling function is created. That is fragile and is easy to
overlook if the functionality is further extended in the future. If
you keep the loads inline in the ldx and ldsx emittors, the delay slot
lives together with load that needs it. Note that the clobber_reg()
helper is just idempotent JIT-time book keeping, whereas a delay slot
has a run time penalty.

Thanks,
Johan
