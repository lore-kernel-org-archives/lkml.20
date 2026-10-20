Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792538769;
	b=Hid1LrXD1AAibP24xqWaQmz2H9Y+1xNnI2Wft1QUdKZnsRWHVYoMyP3T0gMbPrTafMdD
	 ObpQPT4gIVdgGRnyOGFlSZfWvWq4janzmD6a28T8v857r0ZUpM0V7UKSaaNn6BExLKNnJ
	 0VBy5J3Z4wkgpP1ELUKB8NHlWzADdRhBweyxVcR4j15Yi0a4cEeu0E5GBsxLeLFj5wvN6
	 IHuPfCHISkEOhhh91SYg+YP5LF2lwphfTgV/JMEVNBi7Eev/WOcEw6QJLRKynxp+gAlwy
	 LDqyCBqaRy9KUyQgKAwUp8uJBsNTu3DhCeKphp+EdkeMtRlsJ4/wdvLj4A8AOXmO+lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
	b=Fr/tZwMiVP71KQAF/Efyy6NPBYNv4lbiq14J0IAhx3qkzNf9AVP6MLjj6eaahqHWYfAS
	 fCrs+a1Ja/N77yuAN5CWbASlF+yu9KD5jVSM3ji1pB+HhK7dzHHAOvD0ibFUyMOtWWOwz
	 J3HyXy9yHsSezqBhc+jN+XcgMi79ddYYrrvWT/zTa63EVMLR9rV5otJtYXf00velGrOFy
	 sXNOIkFCmm3FAUWvAYWR6FwasweHSI0l75LK29sjUJBOF6dMAFW5VQYY10bkjUV6txWHv
	 8RIgcrWgoQtyR4/oqpN8UGnMRgj8lZ8SwOkMt8NObkNs1eJL25HyIK+VCHuc4lPJVVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qM0+ADNG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789BD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qM0+ADNG
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd76b1361dso1097535ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792538768; cv=none;
        d=google.com; s=arc-20260327;
        b=Ijc841MbXyrd/cZ6jS3XMkT+DIdWnAR/UTwRTQRAtcZuJwAxvSzEb4xheX6NY45vbh
         gTli0xyhy+BE7ijmj4UxtoFEu767iZY/o9EmQpO+f1Ew582EUo+D0noeaDYxIhG21WAu
         xKVQsuGouN3TQyBikwjJ/6bCGbYvrrVT6hBNbJGq7Ttr6UUW7w72fk97m09XP/1dzAlp
         5Q269+T81M1ncKZrbdLWXokGEv19vFVLwb/H8i7BqQJzCgSAE2+1KXH9PsckTcsJvzA7
         vqGLodRDyKulYIa/Ze+sOsZgZxpkN5ULEicZ2lwFzm863XanwkjIdGt5yMFh3skj5OsQ
         Kodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
        fh=Ob2VunO06lorQxnJuHwsqTNvbmWpD6co94BSjRSnrlk=;
        b=hwcOjZUyccNTn/BxOQ7jiyWBMS9l9S/0zhPKYr2jR84IAvlBADxlQe9Qe9kMWV6cf9
         L+JOPhvGdWKvFDamh0Iuymex8C9IF5f9hKGvTaN1hzYoB7vf801zR1tG6e9VBIYlf4c7
         ZL/29ebv5TgEdJr74RQUWeh/6ZMW/Uj/OLvk2AuwCHOi2aShZgpaK7OkK2PHZH5qTl6T
         YEOaPk9dAs6xC0Wdk5QPVznx+/0SQ/S+ESFFG82khUz4u2CEyeBIWPfoiePFqey77SUJ
         PZM9RVQCTN90gEY4/zph5VMYo9NauNlA5wAZYuY1Ab5Nj59Q2hLRTHhnm10uicg9/D39
         PhGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792538768; x=1793143568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
        b=qM0+ADNGoG3hYbfcw9Hhfz1nkRSW5OE3gkA32HzVbHb6cTQfwInMWb6jgTvgikixYt
         NR1Bm1uImSOUNIt0HdWC7wk6ceUdaCMvZUneapLTvY7j66PJX+f33N9mTpZg8D0kxbmO
         JzloxsssVmu/gVxMuIGT8rTZBG+eTnSqyn3H7jwEC1ksSRizF6ANPGqEPDUFuGAiC8jV
         DIocPjtvPOwB6tYWxJWF3RcLTWJk89LvUmOqL31KmcG31QCFKJPHFyRal/wW0smxUO71
         u0Z0TRF3+xEvMZXbaW0dLZW5a9iHqrNeyLtveF8va4fa/DIvI31hhPCPbHKX9iqFZrU1
         b7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538768; x=1793143568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyqDPzOKJl88+NvwNHrrm2JsEqX4pARN/C15jZakpa0=;
        b=n7py8ka3SZKFsHCrMn0CNwZkb7Kng8x2vTNO/7fz0Mz+rrNtiY1tXTf/3C4FeWRYi9
         2O0JrjTZvRwjhw+bl+kooS9AWK/tKsjAPhsvk0IP3zpCJ6MZU1vb43K1emfNN7OB/75a
         RIV/UXH9tK64jI6rOVgKSriacWr44mmGEFEgqQLWLMOvW9gO/NR5m9Ud081K19U7TY0L
         VfJ2U0vPovBqM2Sy3ISYEGRz7eM5r7De5UJaaX3tGdE8O4dGb5DsgUp7++SsIFUTMXgd
         oQfHcFCQ6vXd4n8e7dzptEFAf0pz2+9nW5/OVMn4fmy8Hgp7X6LiDdVYgog94Dllx9jI
         RWzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQR3Rx0CW6Axp6CzREadySVuq2N+36MFUOZLHVVTnayeKJFtD9oteCenS/DNpVV2XrjALNvAYzPi3Vf6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJldyFbeYHC8oigA9FPlhck0dfEvzOIWKSeDS0OLS6V2zhkBrEh
	nEulI4ytPwgfYHQFhqpgiRQAzk5LVi/Jajy+ETWxSeLcsLeMxkdiegY8M4GvS20veo9C890yCW8
	80yEOinjex5C+Dwtlem7L72WSshgoyF4=
X-Gm-Gg: AYBFou1OmlskBbu6kpTcY9JkK9CzIrBUmpy1b+/cIYYCjaj8mQSFuMAc/2LAId2wOEH
	EvBfbbhZv9A0HnhEPyNxMxHtmHJJEvOB6Oga9xA6j8JAATTQnaCISVrUPOWDa6pGPphV1pVX4qi
	j6plBw2yKMmesGNxVYynu8eaBTXObz8DDKkW9r2i7mzWrvP0Xc/Qj8JTpKQzauN15A7Ne0vW41H
	e9lwFjIoogJ4F8NXMzZOb2rjbzMF0O2eQvnsAb0+lG9E8GyoOyMLG90EDKrWJio8XwLZ5jCJYV2
	SPe3cneVIkvuTbOkWwmqm8P0V519Vmbq2UQnnn6S+++MSJ/IlBXiRTfaUaUCURwzqbg3OpffI39
	DtOiBLExt0IIpwZ9/dewde7MzhEQkUTWdXxvVwCCUE5uyFgHCBGae
X-Received: by 2002:a17:90b:17cb:b0:3ac:a521:95e with SMTP id
 98e67ed59e1d1-3ad86f028c8mr320588a91.47.1792538767665; Tue, 20 Oct 2026
 16:26:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019153628.15912-1-leon.hwang@linux.dev> <20261019153628.15912-6-leon.hwang@linux.dev>
In-Reply-To: <20261019153628.15912-6-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 20 Oct 2026 16:25:55 -0700
X-Gm-Features: AclHuK9R-Pz11REH9KszPt0wQBWz-TsT_XQJqO1BNWiMHHq0gxNTu4ERDjHPk6w
Message-ID: <CAEf4Bzbr46UkiE1sbb+Zwcs0S1ejpKmtTGjNCAkWD-J6FRcPGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 5/6] libbpf: Add bpf_link_create_log API
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

On Mon, Oct 19, 2026 at 8:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Add a new API to accept the log opts, instead of extending the existing
> struct bpf_link_create_opts.
>
> Appending log_opts to struct bpf_link_create_opts would place them after
> attach-type-specific fields of varying sizes, making it difficult to
> extend the struct while preserving forward compatibility.
>
> For example, adding log_opts would prevent extending uprobe_multi
> directly with a new build_id field. Instead, a separate union would
> be needed:
>
> struct bpf_link_create_opts {
>         /* ... */
>         union {
>                 /* ... */
>                 struct {
>                         /* ... */
>                         __u32 path_fd;
>                 } uprobe_multi;
>         };
>         struct bpf_log_opts *log_opts;
>         union {
>                 struct {
>                         __u64 build_id;
>                 } uprobe_multi_ext;
>         };
>         size_t :0;
> };
>
> Without log_opts, build_id could be added directly to uprobe_multi:
>
> struct bpf_link_create_opts {
>         /* ... */
>         union {
>                 /* ... */
>                 struct {
>                         /* ... */
>                         __u32 path_fd;
>                         __u64 build_id;
>                 } uprobe_multi;
>         };
>         size_t :0;
> };
>
> Introduce bpf_link_create_log() to accept struct bpf_log_opts separately,
> preserving the forward compatibility of struct bpf_link_create_opts.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf.c      | 28 ++++++++++++++++++++++++----
>  tools/lib/bpf/bpf.h      |  5 +++++
>  tools/lib/bpf/libbpf.map |  2 ++
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> index 9a2107d4f6d8..263a1d516a02 100644
> --- a/tools/lib/bpf/bpf.c
> +++ b/tools/lib/bpf/bpf.c
> @@ -788,9 +788,10 @@ int bpf_prog_detach2(int prog_fd, int target_fd, enu=
m bpf_attach_type type)
>         return bpf_prog_detach_opts(prog_fd, target_fd, type, NULL);
>  }
>
> -int bpf_link_create(int prog_fd, int target_fd,
> -                   enum bpf_attach_type attach_type,
> -                   const struct bpf_link_create_opts *opts)
> +static int __bpf_link_create(int prog_fd, int target_fd,
> +                            enum bpf_attach_type attach_type,
> +                            const struct bpf_link_create_opts *opts,
> +                            struct bpf_log_opts *log_opts)
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, link_create)=
;
>         __u32 target_btf_id, iter_info_len, relative_id;
> @@ -965,7 +966,7 @@ int bpf_link_create(int prog_fd, int target_fd,
>                 break;
>         }
>  proceed:
> -       fd =3D sys_bpf_fd(BPF_LINK_CREATE, &attr, attr_sz);
> +       fd =3D __sys_bpf_fd(&attr, attr_sz, BPF_LINK_CREATE, log_opts);
>         if (fd >=3D 0)
>                 return fd;
>         /* we'll get EINVAL if LINK_CREATE doesn't support attaching fent=
ry
> @@ -975,6 +976,10 @@ int bpf_link_create(int prog_fd, int target_fd,
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
> @@ -999,6 +1004,21 @@ int bpf_link_create(int prog_fd, int target_fd,
>         }
>  }
>
> +int bpf_link_create(int prog_fd, int target_fd,
> +                   enum bpf_attach_type attach_type,
> +                   const struct bpf_link_create_opts *opts)
> +{
> +       return __bpf_link_create(prog_fd, target_fd, attach_type, opts, N=
ULL);
> +}
> +
> +int bpf_link_create_log(int prog_fd, int target_fd,
> +                       enum bpf_attach_type attach_type,
> +                       const struct bpf_link_create_opts *opts,
> +                       struct bpf_log_opts *log_opts)
> +{
> +       return __bpf_link_create(prog_fd, target_fd, attach_type, opts, l=
og_opts);
> +}
> +
>  int bpf_link_detach(int link_fd)
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, link_detach)=
;
> diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
> index 826d9cc9ab65..dedaf8086902 100644
> --- a/tools/lib/bpf/bpf.h
> +++ b/tools/lib/bpf/bpf.h
> @@ -484,6 +484,11 @@ LIBBPF_API int bpf_link_create(int prog_fd, int targ=
et_fd,
>                                enum bpf_attach_type attach_type,
>                                const struct bpf_link_create_opts *opts);
>
> +LIBBPF_API int bpf_link_create_log(int prog_fd, int target_fd,
> +                                  enum bpf_attach_type attach_type,
> +                                  const struct bpf_link_create_opts *opt=
s,
> +                                  struct bpf_log_opts *log_opts);

Leon,

how about instead of adding this new API, we try to repurpose
bpf_link_create_opts' iter_info to be used as log opts? we have this
right now:

union bpf_iter_link_info; /* defined in up-to-date linux/bpf.h */
struct bpf_link_create_opts {
        size_t sz; /* size of this struct for forward/backward compatibilit=
y */
        __u32 flags;
        union bpf_iter_link_info *iter_info;
        __u32 iter_info_len;
        __u32 target_btf_id;
        union {


that iter_info/iter_info_len is a bit of a legacy before we had
per-attach type union, what if we add iter section into the union,
wrap iter_info with union and put log_opts there, mark iter_info
deprecated or something.

I'm not sure anyone is actually using iter_info (I didn't find any
uses in Meta code base, for instance), but we can detect its use by
checking iter_info_len: if it's non-zero, then iter_info must be a
real bpf_iter_link_info. so we should be able to detect this just
fine, the only downside is that you can't use log_opts and iter_info
simultaneously, but I think that's fine: you can update your code to
use new iter.info fields instead, if you need log_opts + iter_info.

WDYT?


> +
>  LIBBPF_API int bpf_link_detach(int link_fd);
>
>  struct bpf_link_update_opts {
> diff --git a/tools/lib/bpf/libbpf.map b/tools/lib/bpf/libbpf.map
> index eeba4072a5da..f6eb57151f7d 100644
> --- a/tools/lib/bpf/libbpf.map
> +++ b/tools/lib/bpf/libbpf.map
> @@ -475,4 +475,6 @@ LIBBPF_1.8.0 {
>  } LIBBPF_1.7.0;
>
>  LIBBPF_1.9.0 {
> +       global:
> +               bpf_link_create_log;
>  } LIBBPF_1.8.0;
> --
> 2.55.0
>
