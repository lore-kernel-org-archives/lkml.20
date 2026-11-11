Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794427266;
	b=raMnDzvkhxJnc60bjVl/b6rZEkSbTp5Bi6nf4ZkIFf3uwAWZj22ZkD8VD9OA49TKlQQK
	 aI7Ai7/7ZqaohuM0XWXxzA2JlTh6nZ7u5ezHflVW3oXykc3h01zKwbmsNfp0j5VUA1cpt
	 LfMmXQ8WmMrVR/zD8ZtgwctmNIy/r7Kle2I0sPX9zN8BLMh41rGFSz2VjuvZgqkU5BucP
	 RnbI8hGbur5PwFBTT+4IaQS9RQi0m62prCv+XfAwLRPxas0AVCP+Flqdax1xJrUrKQ8F1
	 jgn3JqmjCl8JxLT3ahJLYKi8+u82wIyxzKpCYn8DMJVzD9ZSGa06vzoLAKbtIn66pOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
	b=BwYfmm9TS2C0dVL//MUvck8THgCNXt61CVwWDY2Dm84zbDfa0M6MwRFHqrrlPfG84M50
	 XajuaBRR5qRXIV+eEaduVhyUMhIhw170UT/x/L16AYqNvjffieF8HzWWN2oHX7P2iRZT1
	 i2AS8bFZkLQsIgKXrnX9c6U+BizQ8VmvzPJEFMBItbrvt1OR47z61tb8FSzgK0e5omKlo
	 zrHf7Yy0jh5NbMH7Dn+YaOw/YRbQLJO+BUFVG5sXMYPrfRvsSkdF5EOsEnGUJzfVyU8tq
	 k59yE+y/jSXm490ubt5/+Q7SJmG2Fu5gn3fhnzE8w7x4ZVhCZfCGhzMqgijtUtdy7Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e0/7texl";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A809606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A809606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e0/7texl
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so41951cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794427264; cv=none;
        d=google.com; s=arc-20260327;
        b=HqKxftHAUXi0tkWFcDBK4dhCbytMXIR0fsShutZ9a8t9FdPp6nK8hEaEj0sRQNdjA6
         JtEr8TiPvS+pyW9qLRe7F/pjt5mL8xNDQG6oXTTBM64QPdi2zHTbQfIarItZ93vy96Tp
         FzujGiEyhdVBIrXo5END4aJIJK1g9IPIUamrx/xpqUQ3NRP9Xlopg3wPa14cteXms0DL
         LpkOMpiu1hUZItg9RUjl5O2vOfztAutuzU1MzH5mQ3zb1TJkbsKdbKib1FSSG7X3xPKx
         gbJYv4W59jnWlYOAbgvvXMOzTV+fZg4Jncu7zVhWJlMMHGsSUrlWQyKSUuUyhtUG+XN3
         a+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
        fh=y2P75NRQgkb5qPpF3VkzEcdt3aeR3K+3QqFBzel6/gA=;
        b=WeR+AMWmODp9Nk+wXHuRn1Lhc+MUUn6hS0LFFj6kNjBCNsgi/CI5A+lLhCf0zenzAt
         4vzFQjrkthMrtoHw6eCVPQvEQ7+xD9nvapYiDr8pfQMxQNrDZTlYUJpnxyDJipuSd9qt
         oZqcGsqKiLk+tWGO+YpOSv7CswQUalCmyQUXcRfMmJzUhmqMUHxwDRRLB2f904FK6415
         D86q/5ll2cevGfb9PapQeZ/xGTohQR4ricxyZUVVoRvQODQTP95vG3LwigDhCGEL6z3m
         CQAcBM9/mMV0msW/NtZeJClzvJmO9RNRpo2iaFZh34c1Dt9Wyg9ekDvDVadvrdvMEnwP
         Lb8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794427264; x=1795032064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
        b=e0/7texlSOu4KxVZE0iowt9LZ3snSvdmUmXOWXqPvVg6nIujvUChLVQUD1CQnS/21L
         DdXlTDttd464JKAHMoLOl3o94DAdpWFnNkIKdwKGjWcZG9l9O+fnjoGxm0JxzRAFvZCo
         yF5YzRzunZQUkSEzBeXlt4Y0A1bkdMnN2JtnOW7eIq+kUucV3uvL46rSRbm/HbJNnFPN
         jAdOipxflAvbMEwHX1AVPKlqTd7vp2SfnW6HUpZu7+UwuwNGfUwus6Q/EtcjXLtxfLRl
         t3blfXCBNN5P6LcWe9IZZtzyCCJtekzOC1vrSY5Zd0ZDLXnngRuvAxIvUPrQc3qgvEd4
         3uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427264; x=1795032064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLVXFVt29dYBkYQT6UIOPSuTbBUgUXoB7bt0qWYFj0Y=;
        b=OqtUx+Usnbrjcw14pYvHPuEl530Ukx81qzzjnlUXJP5fMBmzIwpxi1VfnDWpfI0o+I
         ksAW0C4rj5Xi7/tyayJ4t14ZhLKReHeCYvBQrcX/Gekr07oqigFMPlqI96tIjZnbQZk0
         Av2NCDIgOkIxGGB8glEIS8+1+6LMWPSHFI2XLm+G/YSAYZQvJTsNTQ32PkmKYDM2zCVM
         +Qe6LwzHFpRtdHfQAeWBSs5cNGzvG1yME/yIfUANBCrymAlpBbVQJrLXlACZXGjNpso9
         yz76yB/xa8UJ1OA7cs5pGV88NUK1dI2trCwEvTjij8VicHpdEvlRy8NlQfxLNK937xQS
         SavA==
X-Forwarded-Encrypted: i=1; AL+hErHdZ7pFyZUErw7xYpwxAoFaXtQji3NQhajxU6e0/yJY4Hq6oIL9admQ499yLuRJqlNaPmJRZD/IfaTGnCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jKUdm+IdHD46IArHuN2G/HJ0QBuffajEUkKUQcY4S5J1Qgb2Z
	ZmDJEWLUJJ2JrP6rxlTBfeba9GMzkIsW+bMtMbdWzwz5JT1P5le9kiXzHy9xldWZyyHZkTk2/OT
	qG2rO+bNGFFQ/GETmjmeAvvdDvbnvOtWUnkXhtd4I
X-Gm-Gg: AYBFou04bjfW1VyHlhA5Fm68//7Hbq1XD1XgE/57mEwShWcRyicv2JnBmR2rew9907U
	6dlhPoPab/boZjFzrnw4LXt8AY/CVgq+312wc13nYUqQxfa+Yfw8MImiTScc24nvjNn0eMuWz65
	Ibqsx6P3TT9Wq0B2NJilh57dH4j8kWzcy7nqXWX3PoOIDwgUYao77llNRk8eZoei1kXYrtWqF/y
	Cdi8iGoA6Q4oKevnnLcpBOcxD43NYLial4eyGZzydKe04fc470ZLzKZL5NU+pdmXqM2yNGjxf0O
	MBqfr+h1h3FSkxpihB8AkR5LbXhY8NNjcwgAgX2+3i17fdgRJLoQz3x9lasZGyuwHPLSFahxNwE
	QxF/Tq41wj9aCxg2/ZBLMImYyFO4BLCu82pi77aKiaS70PsmtpoIKlDVWCQ8/lU+glSeLoGoMUG
	TT/tafGITOYmUye2d1wshfYw==
X-Received: by 2002:a05:622a:2b4b:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-559710b30e1mr1999241cf.13.1794427263429; Wed, 11 Nov 2026
 12:01:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 11 Nov 2026 12:00:49 -0800
X-Gm-Features: AclHuK81JcIQVOh-tqCQX9JsRqdWOHCGs7dqRFvbpp7CrwexNznx4vXc5gM5Rp0
Message-ID: <CABdmKX09vLG4U-7FwF-vm_iTy1AjGUPXka08KhWE+qJ0J=XGMA@mail.gmail.com>
Subject: Re: [PATCH] bpf: make dmabuf iterator stay drained after NULL
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 4:57=E2=80=AFAM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> bpf_iter_dmabuf_next() uses kit->dmabuf =3D=3D NULL to mean "iteration ha=
s
> not started".  dma_buf_iter_next() also returns NULL at the end of the
> list, so a next() call after exhaustion restarts from the list head.
>
> The verifier relies on the iterator contract that once next() returns
> NULL it keeps returning NULL: process_iter_next_call() marks the
> iterator DRAINED and treats the result of later next() calls as the
> constant zero.  A restarted dmabuf iteration therefore hands the BPF
> program a kernel pointer while the verifier believes R0 =3D=3D 0.
>
> Use an invalid pointer value as the drained sentinel so the iterator
> state keeps its one-pointer ABI, and skip dma_buf_put() for it.
>
> Fixes: 6eab7ac7c5ee ("bpf: Add open coded dmabuf iterator")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

Thanks for this fix. The cgroup (bpf_iter_css_next) and scx_dsq
(bpf_iter_scx_dsq_next) iterators look like they also have this
problem.

> ---
>  kernel/bpf/dmabuf_iter.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> index cd500248abd9..a2b7c38f9ae6 100644
> --- a/kernel/bpf/dmabuf_iter.c
> +++ b/kernel/bpf/dmabuf_iter.c
> @@ -156,6 +156,13 @@ struct bpf_iter_dmabuf_kern {
>         struct dma_buf *dmabuf;
>  } __aligned(8);
>
> +/*
> + * The iterator state is one pointer wide because struct bpf_iter_dmabuf=
 is
> + * part of the generated vmlinux.h ABI.  Use an invalid pointer value as=
 the
> + * "drained" sentinel instead of growing the state.
> + */

This comment explains why this patch uses a sentinel instead of
growing the state, but that doesn't help anyone reading this code in
the future. This belongs in the commit message, not a code comment.
The real constraint is that the size of bpf_iter_dmabuf is
user-visible API, so it can't grow without breaking backwards
compatibility.

> +#define DMABUF_ITER_DONE       ((struct dma_buf *)1L)

I would prefer this to be DMABUF_ITER_START to mirror the kmem_cache
iterator. Then the second if (!kit->dmabuf) block in
bpf_iter_dmabuf_next() below could also be removed.

> +
>  __bpf_kfunc_start_defs();
>
>  __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
> @@ -173,11 +180,25 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(st=
ruct bpf_iter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> +       /*
> +        * The verifier assumes that an iterator which returned NULL keep=
s
> +        * returning NULL (see process_iter_next_call()).  Without this c=
heck
> +        * the NULL left by the last dma_buf_iter_next() would be interpr=
eted
> +        * as "not started" and the iteration would restart from the list=
 head.
> +        */

Same here, this is commit message material. If you want to add a code
comment, referencing the rule from bpf_iterators.rst should be enough:

/* Once NULL is returned, subsequent next calls should keep returning NULL.=
 */

> +       if (kit->dmabuf =3D=3D DMABUF_ITER_DONE)
> +               return NULL;
> +
>         if (kit->dmabuf)
>                 kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
>         else
>                 kit->dmabuf =3D dma_buf_iter_begin();
>
> +       if (!kit->dmabuf) {
> +               kit->dmabuf =3D DMABUF_ITER_DONE;
> +               return NULL;
> +       }
> +
>         return kit->dmabuf;
>  }
>
> @@ -185,7 +206,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_i=
ter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> -       if (kit->dmabuf)
> +       if (kit->dmabuf && kit->dmabuf !=3D DMABUF_ITER_DONE)
>                 dma_buf_put(kit->dmabuf);
>  }
>
> --
> 2.34.1

I think we should also add a test for this. I've sent one as a reply
to this thread. It fails without your fix and passes with it. Feel
free to add it as 2/2 in v2.
