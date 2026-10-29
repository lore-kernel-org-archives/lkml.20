Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793290985;
	b=JVi15uzvjbFwghcyJfiMMyVt4dM6lzd1kuQCM5JgPEPkhpU9as7AsHTqKgCDiM0YUZ/x
	 KCfvioP6qwxxFu2ftCOtiSHp5/48wcma5oUIPs27xzRaj879hVEz6vo9tSBBsjZwdACwB
	 jeCNqi0ccIePDkGS7md7RoOG0xZA3JRFHXMtGJgwH4gXv7y+wkdkG7fxNDiUbDwsV9yQj
	 eUs5GFMHZr68fBlHDsVOVpms7isWfNXOUhTVYGTHoUMyymxR/NYCc6yE6Q1H4LgewXOZP
	 zycr3geTxELQ/auIofr9T/ZH678d4ys9Cq60PUXbNlLzK1bXM66kl3PTkIhN70c4tTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
	b=O8j1/xdTh/Ow/QdNNH+7JhF7nPhc9y8RAkHPuNXoBrZNgX2jk/x9hk3xgu51xVmC1OWy
	 dPiWVvvSqjXTnOK9atdr7brw2vWYq/R0MgJt862jQ0dF6W+IOQjEqRx2+Pu/a6X9qm29b
	 AUnBw1Md4AMMtAAzJt4gFEyhtb4l2dUMVNw6DSyxM7HSFc3WkjwibkonmLQQUarOV9rO4
	 zLzTGTCL7libESTy+KDLJ4VqQ+jOKhx/e4ptCM4uwyXiLEm2o+SdSCrLs315ZyGl9/9Rr
	 HrdUD/xWVrOH6wuBteVDck8+YxgGBhO0RBsppNVLwdneDGIXp2ZKRKOuB8xafoQ3Anw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vl6h3FxT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1E660A2622
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1E660A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vl6h3FxT
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so320992466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793290983; cv=none;
        d=google.com; s=arc-20260327;
        b=ghh7CAT7ta33BaDn1o1KzZgyMwrlHs9oiQrBXjKSSpo/+86ReX/TTRJiu9K3fof/xc
         Se4FiVeXCQc+e/g0GCLw++3Rdj3W286F1dQ7G/6mOzcg0IiYmJleTx9mNwiZbctFKvG5
         g74QeV27MOHgU9xFKD2LpqgPtApT27IuUbz59CAuB4MFmnVKM/dPN9+3MPU2e7UWuSYp
         rW7BI5neriNS73VKC25YcX6Itti5MlAXMyC50sPb9Xb1DLb32Bz7yIufW68QZmORkl/+
         xuez45vrmfYVxZ2v+Cm30SUIqaKQfZzYgmeqNxx08QxfZHYArh57rgph81MQDwM7UUMl
         Ek/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
        fh=1Zo8H1tSPcDiyAQmgxTTwRvddZdtS0XYAN/sJ2iwoLc=;
        b=Uz9unJ4tmChcBtviErftCEPeldJLoY+ZVUL/IzsAOAs5G9+bGIRG3bt/YemyxhWpbW
         KvzgWFgZbb8Gj3hGgH0FcfMbl2tZDYpdinopPGXufxM0FTdrW9ppStKG47FkHlIayH6F
         kEeYYkAqFA/IBy7idRor8RbgKzYLwuhOSW4FGP9ttxoRyVP6aVjMPXLW6f0iU6wHE7CE
         yNf6feNVR8Q6gRCXRDyYrSWy6sNalBwuIm2PiwHj0tWXImb6tGqu409MSGHrR9ZOR7/A
         KK8oIZhDkMqtEP4DykkixQK45ZUY4PTUQZLycibYTAcMqRjObPfDCCAA5/1L6+MgyTKC
         s/8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793290983; x=1793895783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
        b=vl6h3FxTysc9yet6D3Q0d2GO8gweert+j49hx6iOwi7wFPNTUWfuBL7fsyyfVvnyvZ
         +Z1/kzcfRHuriJXExOiQjIZH32FZIEYk36Du+K2Qp+xNd/zW+Vw7+cZ+3sHCdKppJ5o8
         eatU0GNm4EFgoeUQ+hg+aufwcL0fsR0bxtDwsqwYPSmTHeXFmK4DaWOmC6SqnWgBoZ3w
         PCxuGBUd4CKVgczgjA3vYepQkhpbhYZnVWmJ7nhg0H7W7tE5tOgms8p4YL8rZwXyG2iI
         Zc2yNh+LlvzPXc6XiXnDpdY/AAXfxq39EqGeUq5qFxEMHK/EKYejffUV2/LJ4wO5JK9I
         JZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290983; x=1793895783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVlt7H45FB16jm/ALidosmXiC35Hp/64GX3dy/IZRoo=;
        b=XJafyqxovXJpn7Vn9OXp2fywO3dvpCewenIyy43QHfbKk9qrAGdrn/ktt/f9OvozU2
         yWeBcVWvtJBZeQUBbaN8IZ5/BnaTwdScvi2QpdrCFvCpB8EmP2D1QUgscSJNrRr1tFIm
         S+wrkTOjDF08JvZcCjx9OcK+Aiha2PijZ9b35itxllYfreeK+jKfLL7jaWCZHLo6Y3Yz
         pzzymKH2TNQp5BY99+G6VBx/CKCXzJOb+ZyJHHXjgzcwzyB2Qg9yLf9GL+eDPBhzHOXT
         LkewJttlbStAXnpx6GEqKH0SUxNG9vEig/wwOzv3SiVqY5mNM66ow6n2DGOYk12ycpDn
         G6YA==
X-Forwarded-Encrypted: i=1; AKwUvBzqgcuWabXpMLUoLtv9uxX2MLi0sCJvdIs7OvfTGCCa/fSbb2JSEg2ifXbKLNgp8FcUsICSMVESAXF+fg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgnsn3cDbJQeOzLwl+GiUTboJDCvPlGgO6UWv8MqdQdu5Mu4AS
	OQFsE1OCRMCsEQ0+Lm1XUTzT/XKC6T9/wgOkSPB8+neyAS5lyh5e3KnnxlO94rZsN8FMvyFlUCK
	wOKlmv+TBTgHEv0/ehX2d6WlgcRfhJJc=
X-Gm-Gg: AYBFou0m4ODpkhOcRkzh8QDWoVfby3QPEzV3FRLkHg4V4dBvPdOtXvOrAdQe8woy85m
	Pgcw0RpCu568TM7WSjErThDke8UbPTcuV2W2nBjkLpW6YWtlOAeCG3fZTnUNVY3uT8S66Yaq4xp
	yswewg1oCLYw7clMzt3FNvvkujXids/UV5BJfVZY5eUwKr9Y9qalBI4Z3cjhNxxgBr9QfNPrE3Y
	idLG1N1KiacjOuvzF8Q+QcAfJXc53hr1/htICmesIke/RBP+j7Ai09HGRoyU1EslBj87/9YfhHB
	SOrmkOvbyYwhVoPHfI196tigQfKDAHt9g5FXUvnIrasvHVtPf0D8lZbLj66Y4Kd42TvTAs1m+OM
	Q6yJFZIlfweJtC5F+7WguUFJKJZy0LC+tdAPia7Gu2nlYuKXcoebZCDGW0TfPK9JjVhBBN97HUP
	a8UCLVGjCBTQYnooqylGUrz8gHHXJ+1rE805zL1rp9q6ZKvOSsmryiKRo=
X-Received: by 2002:a17:907:2d10:b0:c31:91f9:60b7 with SMTP id
 a640c23a62f3a-c49bdf43869mr561025466b.34.1793290982774; Thu, 29 Oct 2026
 09:23:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026154948.99408-1-leon.hwang@linux.dev> <20261026154948.99408-6-leon.hwang@linux.dev>
In-Reply-To: <20261026154948.99408-6-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 29 Oct 2026 09:22:44 -0700
X-Gm-Features: AclHuK8UvOBWlBbj0vfMh3zLVN3mKm1giM1eECBMPqUpu-79pHcpcFNIaDEnC_I
Message-ID: <CAEf4BzbW4zwL-9j8e2B6KNXVNwsfWyMSAo_RsGCqv-nu_yGhTg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 5/6] libbpf: Add log_opts support for bpf_link_create
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, Masashi Honma <masashi.honma@gmail.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 8:51=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Since the iter_info and iter_info_len in struct bpf_link_create_opts are
> legacy, reuse the slot of iter_info to place log_opts.
>
> When adding log_opts support for iter link_create in the future, we will
> move the iter_info and iter_info_len to the last union, see below. And,
> keep the backward compatibility meanwhile, that uses iter_info if
> iter_info_len is set.
>
> struct bpf_link_create_opts {
>         /* ... */
>         union {
>                 /* ... */
>                 strut {
>                         struct bpf_iter_link_info *info;
>                         __u32 len;
>                 } iter;
>         };
> };
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf.c | 20 +++++++++++++++++---
>  tools/lib/bpf/bpf.h |  5 ++++-
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> index aea534764dfe..38dcb31e8c0e 100644
> --- a/tools/lib/bpf/bpf.c
> +++ b/tools/lib/bpf/bpf.c
> @@ -794,6 +794,8 @@ int bpf_link_create(int prog_fd, int target_fd,
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, link_create)=
;
>         __u32 target_btf_id, iter_info_len, relative_id;
> +       union bpf_iter_link_info *iter_info =3D NULL;
> +       struct bpf_log_opts *log_opts =3D NULL;
>         int fd, err, relative_fd;
>         union bpf_attr attr;
>
> @@ -803,6 +805,14 @@ int bpf_link_create(int prog_fd, int target_fd,
>         iter_info_len =3D OPTS_GET(opts, iter_info_len, 0);
>         target_btf_id =3D OPTS_GET(opts, target_btf_id, 0);
>
> +       if (iter_info_len && attach_type !=3D BPF_TRACE_ITER)
> +               return libbpf_err(-EINVAL);
> +
> +       if (iter_info_len)
> +               iter_info =3D OPTS_GET(opts, iter_info, (void *)0);
> +       else
> +               log_opts =3D OPTS_GET(opts, log_opts, (void *)0);
> +
>         /* validate we don't have unexpected combinations of non-zero fie=
lds */
>         if (iter_info_len || target_btf_id) {
>                 if (iter_info_len && target_btf_id)
> @@ -824,7 +834,7 @@ int bpf_link_create(int prog_fd, int target_fd,
>
>         switch (attach_type) {
>         case BPF_TRACE_ITER:
> -               attr.link_create.iter_info =3D ptr_to_u64(OPTS_GET(opts, =
iter_info, (void *)0));
> +               attr.link_create.iter_info =3D ptr_to_u64(iter_info);
>                 attr.link_create.iter_info_len =3D iter_info_len;
>                 break;
>         case BPF_PERF_EVENT:
> @@ -960,12 +970,12 @@ int bpf_link_create(int prog_fd, int target_fd,
>                         return libbpf_err(-EINVAL);
>                 break;
>         default:
> -               if (!OPTS_ZEROED(opts, flags))
> +               if (!OPTS_ZEROED(opts, iter_info_len))

semantically cleaner would be to use log_opts here instead of
iter_info_len, send in a follow up?

>                         return libbpf_err(-EINVAL);
>                 break;
>         }
>  proceed:
> -       fd =3D sys_bpf_fd(BPF_LINK_CREATE, &attr, attr_sz);
> +       fd =3D __sys_bpf_fd(BPF_LINK_CREATE, &attr, attr_sz, log_opts);
>         if (fd >=3D 0)
>                 return fd;
>         /* we'll get EINVAL if LINK_CREATE doesn't support attaching fent=
ry
> @@ -975,6 +985,10 @@ int bpf_link_create(int prog_fd, int target_fd,
>         if (err !=3D -EINVAL)
>                 return libbpf_err(err);
>
> +       /* bpf_raw_tracepoint_open() does not support log_opts */
> +       if (log_opts)
> +               return libbpf_err(err);
> +
>         /* if user used features not supported by
>          * BPF_RAW_TRACEPOINT_OPEN command, then just give up immediately
>          */
> diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
> index 826d9cc9ab65..fe3b7fd8512b 100644
> --- a/tools/lib/bpf/bpf.h
> +++ b/tools/lib/bpf/bpf.h
> @@ -422,7 +422,10 @@ union bpf_iter_link_info; /* defined in up-to-date l=
inux/bpf.h */
>  struct bpf_link_create_opts {
>         size_t sz; /* size of this struct for forward/backward compatibil=
ity */
>         __u32 flags;
> -       union bpf_iter_link_info *iter_info;
> +       union {
> +               union bpf_iter_link_info *iter_info;
> +               struct bpf_log_opts *log_opts;
> +       };
>         __u32 iter_info_len;

in a follow up, let's add comment next to iter_info above and
iter_info_len here that these are deprecated and that iter.info and
iter.info_len should be used instead

applied series to bpf-next, thank you!


>         __u32 target_btf_id;
>         union {
> --
> 2.55.0
>
