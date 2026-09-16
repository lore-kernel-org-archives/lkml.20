Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD284BD375
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583433; cv=pass; b=VPU3AtANJKxjS2BmiXQMqGNaYhSeFPnHmN2dgpC/h2oUUcbIo6ZpyN/Xthio++7QECEekeH9Fij2n7gMoveEX1logUGGg8LppwaswnsrA0mEmjxw6n6gK/+Nki7cmp9iX7nTRKvV8c16heIZwfBtK7GC0vB2vPY4S1IErxsRSes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583433; c=relaxed/simple;
	bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QukYi5gV7IZuwHrXiCwFnvwWQpvYSypJe3vOsqlSauS0fDxMr7dDx3iKIHevmsZ08+lU3z6KA64n+weHmdrpTkXa7Lk7AQAbWQnr/OTWWFw9iRHNtO+KpyGu7hQywOuJ/KpjTQXR8H1DioTJY1GtuYxWfyAdSWIzH+Iv/wvvKpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=li5GkeEp; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="li5GkeEp"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso15209b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789583418; cv=none;
        d=google.com; s=arc-20260327;
        b=QCmDDco5OqTLtnXTDt05G84FGny23jf0SxMmQrY0YCyOKmHel/kJLaBucVt0UWME2f
         g/kFfa5DyDVntrO7hVtxithrY2pPSFMam9xyJecmwsCFC3MaFt1SSXTFbC+aYrnd948H
         4srigeIcI5C7Fhzl6K2/iX4rhJ28ElmeukEte7NJsui5e6vD/U0ZnmaKpJBPC3EXq8kq
         +8+VvCe8HG5VbiTjVZux6YQv4Uq6uyb8u0OqW7C3LFOfMVSJt7gHv30q9hfpGw887k25
         xfWTlur4OgBM2IGFtLHH2/jMF9jYWbzx7e0Oifce0tDwRaktanKTsu1dEWw21rnxEp2f
         hxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
        fh=alGyp/riMsftnqn5WF6cvbfMynL5hgSLM60RvDWU7K8=;
        b=b/xW+063fgZ2Is8Qz2X4NeagG6Gt0lOEg+MtoRFIYAhbw5VRsnzXct/rY6fXpbu1+N
         9buJnCWdt/R6g5eP34miIT3lLwpj5N2n9SSPfJPHr7nC6yn1MfoobVabdRxZPD1p7jSV
         MGDv0vItD8JsGbQjx0Su7r4atZ4Vkp/P4jqhC5eyH9lauxiWU9rt2D3oUjOYnCNVxyCM
         2o+hiZFPltHa1jd8qrWv6m/CvcHDRFptryCVg4ADHZEEmqMERg7VXy0QMMhZUCycBUP3
         vJY3KmzBmf0gBdROpori1PeIupNdYAuSNHU6SWDDhs/4qsmKSKRYwXomy+6Xb8jieFRQ
         wJEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789583418; x=1790188218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
        b=li5GkeEpy0Qk4UTd3q2XUIy41WKHj2oYZ5WaNe++/18GZwPo82yHFKH5nfvnyWx8PP
         MD4/OccLaAfYGkEakYW6IUXIOwPtkjJDHw8A3zGDP4Nctwhx4c1GiX1mPXjhXWnKhb4B
         8c85LehzXTMrr/tGqtNqUWP9wLI4tn9iSjHXlcxh/fE+U9APshkDxdoHZH7mlWQgCofo
         J5WTA3TBRDnLb6eXjg0N6su6z/tiX9b3TZwz2TcHvGtcI9ty4l2vJ+BGQrogELqRtzj4
         CAMv9QSXijojrQH4zprNaQiG79PwgLcdQd3DbheIVbaTVTE7hKsJ8gaBE+LqYEWhQ8YU
         C1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583418; x=1790188218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cB8xedQQvj0IrSKjUMXK0LwEeN65e2heD7WX5ql/Fk=;
        b=QJ9YxlExlSKgPkp+SCLrEXiNqzUAYMJSBDA1s7nK2NmzuxUUBqRbsbXwGy+OwshXVk
         UviCHszC5ooGl8MlNDDNeD7L7wgphIIBwezg11orZRQ5ayQaWQK5ONBDcUCAD0CGJPV/
         qcEAm1yIwZQlNNb2TbaTOc8rEQx8cXOMKC0QMxoJvJ0jBdtlgLwbBR5LxZ5SgGKFrsed
         VHctJ6ckafyzkHU0C/G/m/9j0rT8M3gtlAto3AF6rPzXO2mZ+eYT6EbXLGcV7XYMXCTM
         L3fglXHGjnaCc2XnkYgF2X2xGJ29D6ExC1EbLmAxlOmVeSFM8MBkpND/kQq9a2EP1/9U
         fHsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXMKC+/qTP2b6hGEM1BBELZG3O3tUKz26IYwzEusHl/EfSSd1sfWxIL+cQCfTWKSJIrgmhJGNT4Hak0fg=@vger.kernel.org
X-Gm-Message-State: AFuF++kw2EjaOdNBo+hFiDeHLLVGmZ54cRf9/aLi5G5qX7QIRYWq0/cj
	ClQH0INbpp+QLdExSH9MJoIlK/TpVI5RBd2UetK9gUTlDWlku+OEQgnLgHeegBv2+DQKMlZUm1d
	THanWZtlwzxksDH+yVIstQgkNKDYQXr4=
X-Gm-Gg: AYBFou37QoNi+wPwdyWWjfK+JR7IBf3QGj2bLivPJbCR8lFRBNcMB2QC3utJ8dSrOu3
	1HfBA7fA+h98VuU3CqS57EWNuv03gxzYVmHqHSNfeaG291eAomtkwyKJSuzF2/vi+r7XQzc1Lrv
	PRZOlKIvXzOgWvUG3hH5wYcXm7Job07MfzrzLYQ8gBmwvpvC3fZ/C5hsBnpaKq+2vqYhAlj5Mno
	pcCJ7hgKyCwdVFKVV9Uh9tPSakvcY0HvQWbX//LtVg3wV/Cwhuqta8hYY+e5kjMzYmW8RLgb1+K
	l2UyaIUtYrsKeeouNNTcfvifqqgZOvachZagu5DaayaQReWXICFBFCY=
X-Received: by 2002:a05:6808:6412:b0:4c5:7d0d:7a5f with SMTP id
 5614622812f47-4ca499cc905mr4023538b6e.6.1789583418230; Wed, 16 Sep 2026
 11:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916181001.201787-1-usama.arif@linux.dev> <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
In-Reply-To: <DLGY7IFP8MOG.YFISSWRDGKR3@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 16 Sep 2026 11:30:07 -0700
X-Gm-Features: AcwNN1UGPx7lnVvt3z2iap40dwD-R4LLwB6dyuaIBNTPY2xkFaNousEY7ARosjA
Message-ID: <CAMB2axOVd3jx+Gznb4mrNTBN=5oXqeDx-WfHPx5d1E7tbwoejg@mail.gmail.com>
Subject: Re: [PATCH] bpf: local_storage: avoid redundant IRQ save on bucket locks
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Usama Arif <usama.arif@linux.dev>, ast@kernel.org, andrii@kernel.org, 
	bpf@vger.kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	martin.lau@linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, song@kernel.org, yonghong.song@linux.dev, 
	yatsenko@meta.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:22=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> +Cc Amery
>
> On Wed Sep 16, 2026 at 8:10 PM CEST, Usama Arif wrote:
> > bpf_local_storage_update() takes the map bucket lock while holding
> > local_storage->lock. bpf_selem_unlink_map() does the same; its only
> > caller holds local_storage->lock. The outer lock is acquired with
> > raw_res_spin_lock_irqsave(), so interrupts are already disabled at both
> > sites.
> >
> > Using raw_res_spin_lock_irqsave() for the nested lock saves the already
> > disabled IRQ state and issues another IRQ disable. The matching unlock
> > tests that saved state before leaving interrupts disabled. On x86-64,
> > this adds a pushfq/popq/cli sequence and a test/branch around an
> > unreachable sti to each acquisition.
> >
> > Use raw_res_spin_lock() and raw_res_spin_unlock() instead. They retain
> > preemption nesting, memory ordering and resilient-lock bookkeeping. The
> > outer unlock remains responsible for restoring the caller's IRQ state.
> >
> > In the tested clang x86-64 build, this removes five executed instructio=
ns
> > from each uncontended nested acquisition. It also shrinks
> > bpf_local_storage_update() from 1732 to 1702 bytes and bpf_selem_unlink=
()
> > from 1030 to 992 bytes. The affected paths are updates that add or repl=
ace
> > an element in existing owner storage and successful unlinks.
> >
> > Document the owner-lock requirement of bpf_selem_unlink_map() and asser=
t
> > that interrupts are disabled.
> >
> > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > ---
>
> Makes sense. But did you observe any measurable improvement with this cha=
nge?
>

Same question, but the change looks right to me.

> > [...]
