Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792604520;
	b=qBDmn0dhIekQTPJhPp/QpZP4FPb6LoVMZFvBfgzRLV6ft8ntMK24EYm8NkPRm1KBIQyJ
	 HhfhdoEFTVll6pX9I7Vlce7FSO/yYNC7IeQ9bErITjH6ki/16FB3VwxGvKZ8P+4b6vAyB
	 TJtQouASUTKVN54id4HkUbcKh9wnPX3Y8eEfM7zkYXOzBeTu9R/fX0TsogrjsBQre7sPF
	 j4z+Gu8ATJgD2ghV7TfA8MM65tMO6RrnJBPN9fEOU/HIb1agdscoYfJ+bQr2cm+vCNVO5
	 HNUnbCxRvB+5AelByjp5Q8C7dsaUGEREWxkT5AZd1dxOiD909QPLOHQAW3sofewtxvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
	b=fAbodhmXwgbRW2eX7yc/W4Wp2RIBoDR2T09POyjwKCl4gW7RBHJGDbnw4B+OkPZ3h4PS
	 LfR4Wsquhpiw+hJ6pu7/hagBv+VQSlN9di5LLXMzb2F4i3cEhg1NMVxOTontFXNZ5QNW5
	 Er1ex4szzwYzwsINF8fuuiPei2mwxqloAmGY9hVv1OCv8EK8bO0kQxvY4RrNXjTl7cDtd
	 QcRcla5G2r6R0enPEtn1ZR8yxrU8YacT4ekzQRDOP2rdDq7YGMQ8HpTnOnJXJUrryHhe5
	 9QhBxyIAGyS0JnTd8rXBdocniFuRSxvR9rFVdfx+sHYTp/7RBQstg+mzxoQoai4hsjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GvAbxW8U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E302606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E302606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GvAbxW8U
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso692240a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792604520; cv=none;
        d=google.com; s=arc-20260327;
        b=RqAYtEXV/qVEyTlt7PC2a0uPKUP/t2+ZvJBb9JvVFDbXaRIjfYZs3mJ6cXLGDGGxLK
         rc5UD3G85UdPXvkEwi8YvLOibpqUiINo75Zak62dnej28GNj80aarxJIDtqNhUUO7GXW
         HYHPQLNdAVONyYMFECSsfhHU/mpJOzneb19XO99Gj0Im79NoD1OOLR1oN7siEtdDlDRN
         qlcEKo3mc+GpRNKZ+8CcMIV0zCHgH8ZvWgbFFa8I3yZ+FzH/zgAnH72g40h4cCufcCNr
         F1k7TlOcGzVTxmwTst3KY9jcKU7guzIj41UaTZEq/rZEBbUUXtkWs237VAwULbD6Sg1z
         Lp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
        fh=Qpl74z1jk9p/Lw1SPPbuZSbuG2VPh9r92JBDfaCZtaU=;
        b=qjas6/lhuUjpE0mcMKYVH+BHdIRVNYCuCPJhQopEkgQiFIdvyGMOMC7sbF6WuRWKav
         OHjJdQN2RU2aLdck8dYshWyYutbUZiccA6jC//qdX19XJVg98cG2OF39knvrNbtlzaU/
         q7FVdKPzfD0SvmFxBToIwgUndIGbJrkyhtn9M8KM4azLeTGwYZRPV1cnfer4OXDKLCBV
         Zaz12osyYzOEzvdOTSF8JBjVvs5Tas/FU/vb5N9XGNhO5E3VHe3LHGMY+Ks/PhPmnhdN
         Bk4pk1Hcl3xPJO5280P9Dh8fNVfFMSVkg2CAJAzVUdhn0/efZrVVm6JbIyTsMqsocWqc
         1R0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792604520; x=1793209320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
        b=GvAbxW8UXtF+sRo9OMu4rbiOvh/ZUVz/YIvz0PscUkArcnkkSoHXjx90jpuxuMfVj+
         gvaXcIpvK/50UG3alQJ1Dp+2g0gdqjTAy5dm37l86wOcXJrukh709bQOUA+kBnTyfJi8
         qZtNnpMZsfDYyI6WIxZvhBlQZbClbbWY0qrp2jd4DE/n1oA/K0IeB0+YkDIMXH+Xuj5T
         HPw+nY/bs4Z0G4Xi/rxh0plLMUug5NI98mr/u7qmV3y0SN6sva4+Duq9Bz9yHmm7Kk1d
         jtodxu+rnwuW5xb6SJB7Sri91KGj7ab04wNmbK0F7wLB2SDE9nwKdnQabNsQv+yJvzy9
         J5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604520; x=1793209320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbPfC3xf415pZLIbAAwGQiH8uDkz76+8nE49QrFCe/Q=;
        b=ZNgP8pCaMw2/D85moIxxolHaATACyh0eLRUalv/yqPRKP98aOzHf+Hx9w1L7OnI54m
         yKCBHgx2/VTXjcdqEklzza5rQlzmhOO68gmW13fWB3yLkAPa25ir8hBAe218sL2zJbXt
         hn3QRxTtnYs+fgPDdfvs6xPP8JXtPhylgqADW4HjjaY2NXMgpCui/176muL0qzYSkz+k
         k2YOGyOP/Dl0vrb5cr+w63n4Ynl2uhq4yTpgusufU8NWhNyYWqm5NrXCxqEDyftKPwlb
         ZasDNg6/wVhQNVWJRkw1M2tPwnLtYEpgTRjDtitMrV3mldwQ41OoKQOpUJ3UTCd23WkU
         feGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMR4Xwj9KtklVLyhuLAwjImmFZ/6VPb5HfpThbNQtW5Pg9MPHg2cwbxKA0pxTW6/eszvAWsFdd4ZicQA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRO85QEXAhV7Xo7jQ2BBJkfHHSRtsUDmyBeOIzUcxWtXBGCSIf
	Ysb7a50qE4gPRBbTQeqh6Xmg/N+SaymaYeoVcjv+x7azoVOTpp/F8eMa2LwIjPfL0q1iyrOGxlz
	BEa2vdS8eGF5ryIQFOLW7ABijUqkhTzE=
X-Gm-Gg: AYBFou2pgcfBLfCko0CxoaQMYTYSm/Zy4IosGs3PwXAaGwSOmJbNRbPdeKRuUkAiH/f
	OwbqM1NSxN9EALbWTOLYytyI+XWY39cMX50/ELRzQqQckpTPPkvmOmW3GcVCjItmkpvfNLE7dvO
	/ZVn6jSumXoRJ3eF0A9Le1ZD8SzO7ny6yd+RkfQmSGyjs+Tfp5GbwcJxPX1LuW7MCYeB/6rlDOw
	IMyI324i1Ba3ApBQoLp0kTBy2EKG4clRzAkFKqRpxH1T04Nb1fbC94zWQuCJ0oZjGmuAYIy5gcR
	E6OpyCADaFO1CYXyCxzo4gQEkohbvekWe6w3LuJxqHMs9tMgcC63CMAC8tdvL2+PfPRxXEfvDlJ
	tTGcllSjMKrMoAei8SPWMrKfexkCtR7ef3suYRph3Gwpu2lXk7phQuwmgSFwyhF3sSxxboSMNA5
	3YwYOxGDOl8WuIpQ/ofQ==
X-Received: by 2002:a17:90b:258c:b0:3ab:2ad1:f10a with SMTP id
 98e67ed59e1d1-3ad86ca45acmr2134722a91.0.1792604519654; Wed, 21 Oct 2026
 10:41:59 -0700 (PDT)
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
 <CAEf4Bzbr46UkiE1sbb+Zwcs0S1ejpKmtTGjNCAkWD-J6FRcPGQ@mail.gmail.com> <d4fc4fcd-3691-4122-8b3e-a75447956255@linux.dev>
In-Reply-To: <d4fc4fcd-3691-4122-8b3e-a75447956255@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 21 Oct 2026 10:41:43 -0700
X-Gm-Features: AclHuK8euPDDrPLcZ78w73yg4ZplR7FA7dJCpvboj2MZKSFYtjKIdYl4Mw0-_4w
Message-ID: <CAEf4BzY13x1skc6XSnXGyoLwaFoOtENGokUX7XHiakEyw+eQEw@mail.gmail.com>
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

On Wed, Oct 21, 2026 at 8:27=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 2026/10/21 07:25, Andrii Nakryiko wrote:
> > On Mon, Oct 19, 2026 at 8:37=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
>
> [...]
>
> >> --- a/tools/lib/bpf/bpf.h
> >> +++ b/tools/lib/bpf/bpf.h
> >> @@ -484,6 +484,11 @@ LIBBPF_API int bpf_link_create(int prog_fd, int t=
arget_fd,
> >>                                enum bpf_attach_type attach_type,
> >>                                const struct bpf_link_create_opts *opts=
);
> >>
> >> +LIBBPF_API int bpf_link_create_log(int prog_fd, int target_fd,
> >> +                                  enum bpf_attach_type attach_type,
> >> +                                  const struct bpf_link_create_opts *=
opts,
> >> +                                  struct bpf_log_opts *log_opts);
> >
> > Leon,
> >
> > how about instead of adding this new API, we try to repurpose
> > bpf_link_create_opts' iter_info to be used as log opts? we have this
> > right now:
> >
> > union bpf_iter_link_info; /* defined in up-to-date linux/bpf.h */
> > struct bpf_link_create_opts {
> >         size_t sz; /* size of this struct for forward/backward compatib=
ility */
> >         __u32 flags;
> >         union bpf_iter_link_info *iter_info;
> >         __u32 iter_info_len;
> >         __u32 target_btf_id;
> >         union {
> >
> >
> > that iter_info/iter_info_len is a bit of a legacy before we had
> > per-attach type union, what if we add iter section into the union,
> > wrap iter_info with union and put log_opts there, mark iter_info
> > deprecated or something.
> >
> > I'm not sure anyone is actually using iter_info (I didn't find any
> > uses in Meta code base, for instance), but we can detect its use by
> > checking iter_info_len: if it's non-zero, then iter_info must be a
> > real bpf_iter_link_info. so we should be able to detect this just
> > fine, the only downside is that you can't use log_opts and iter_info
> > simultaneously, but I think that's fine: you can update your code to
> > use new iter.info fields instead, if you need log_opts + iter_info.
> >
> > WDYT?
> >
>
> IIUC, the struct bpf_link_create_opts will be changed to
>
> struct bpf_link_create_opts {
>         size_t sz; /* size of this struct for forward/backward compatibil=
ity */
>         __u32 flags;
>         union {
>                 union bpf_iter_link_info *iter_info;
>                 struct bpf_log_opts *log_opts;
>         };
>         __u32 iter_info_len;
>         __u32 target_btf_id;
>         union {
>                 /* ... */
>                 struct {
>                         union bpf_iter_link_info *info;
>                         __u32 len;
>                 } iter;
>         };
> };
>
> Thereafter, iter.info is preferred against iter_info. And to keep
> backward compatibility, iter_info is used only when iter_info_len is
> set. But iter_info_len and iter.len are not allowed to be set at the
> same time.
>
> With this change, the bpf_link_create_log API can be dropped.
>
> I'd like to drop the bpf_link_create_log API first, then add iter.info
> in the series of log support for iter link_create in the future.

up to you, but I don't see the problem of dropping bpf_link_create_log
API and moving iter.info in the same series

>
> Thanks,
> Leon
>
