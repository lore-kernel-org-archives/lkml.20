Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C5551814A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682587; cv=pass; b=cRvQP10Lo5R9tLA/Fxrg1bhwdLiZVttqyk62dbsh9c8h6whH8W9fGQlly+al/6Tv3jD0k4uUzEg4Czznyplcpd8UmQ/vZtCMC7BRXWwdATgRgxavbIdmtpBPBfqHtyDUGvAlmD3Z3FVVPSms1mo6i3avkB51dXesRn0b94HGCqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682587; c=relaxed/simple;
	bh=kgjy2BB8Nwb8PNLZfFsqLbfjDohsf0KQ3TZfyRHIEYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaojnGoh5+ZcDxo9G3/oY6FR025xIu1odcgx049US7OfDurRHUlpXzryudxRRfwnvyWp8/asEv2in7Kv/uERkpUP64xxetQjZBu0ARzUXCn7myMdTkvhVQAYUsRlmUM7R1hzwkhdEMFrfjnSYNnK+D02lRUvbdpotvN5XdRLemA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwhE5rIr; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwhE5rIr"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672ce86b21aso4335984d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790682583; cv=none;
        d=google.com; s=arc-20260327;
        b=P4Qe0dDhOVzqZ8Mc3U+KSo/8hgD4atM5AngEvGuucdSNWBqFD0Jah3rAn3+hZZjsg6
         WWYfGINxAn+WgrRamttXqw94d+EPWZJIODQWcQFM4cAS8oh72gAk6SiWwzFg47MsnI/7
         8wPmKEWkk6Zb1rTH8UqGOQ31tgYxTjKgBvRQW/XNORXI8jOmmk5KDnCMZYguIkCagwh9
         TH9rePcUOBr4bXr/GYiDnBnRQLiZc2oM9BHA4cplD4yADZi4dG48ug4Y8bbcZ2q31yd3
         WHfL7r8WjkeW4/qYV7FwdW75nvBvlf03jjxQNaAfigBkzQ13PWMeCGhAi94YHqLvbkSN
         VL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PinsfWb5o3H1N8+JPrpcg6f6Oxc9ozJUPh0iCkDqvJw=;
        fh=FrUEShx2t2nViU+5TFF0eyaaJx61ldTVCx+yzE6uvjg=;
        b=DRGtX+g8IMqeEMuYnz/9tLnG24H6nNaNnelML0f6v2Kq+KQZQP+VnV8/Fu6V0t7/iY
         dnq6fQzgI81L9LwRsGWQyUXGlDOAy+t1z/jP2EtrVQDMMGqULkjihWQ94N+P2mW9A5yg
         BYo0hslYaO/kCObn+m8Nx9BnCRjeeZvOoIpaVnojRy0iRoZOxmVAt0dHYIdexSbXYzwL
         rhV6qg4WK2pUTvmQIgaAlZmC7ToC2xZCbXeh3yIxv3/jK4+e2KMpJozmA0XEuewvmEPd
         WxK2pvslaujpLCyiCzb/IUo4gmYD5sSQ7GTJ6a1kFVXBKCIfxclgKv9x54Wwb011FvpF
         +6ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790682583; x=1791287383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PinsfWb5o3H1N8+JPrpcg6f6Oxc9ozJUPh0iCkDqvJw=;
        b=GwhE5rIrih0pY2UIXirrTWjpTlblATUKmmDYILdI35pc/2y7JVOR/hYrvlTxQV+10A
         pCA5Ta12ibOETBKTEwhMjKjM8NCJJ/PqInEC721YWfO/BCM+hilBXJUTI5OxizkA2K+v
         GuS0ibKZH6CtMb39fU4MBNlgRH8AxZWlHAloTlZZF22NyhU5wn9N5xKZ7SDD1u8vDBhm
         zVq1/C5zayoM2IOhl7wBVBc5n7Q6LV6He53wTiCyugtTQgIB1Q+0UaTg+74+8GjaMppv
         DYyl9SxXRcNJXoD3yd2/GUopP2MBEXEiflJs4DHtWlTmJ4zFQ4xNI0mZMYsg5AQ3C0be
         dxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682583; x=1791287383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PinsfWb5o3H1N8+JPrpcg6f6Oxc9ozJUPh0iCkDqvJw=;
        b=EMjZHhk5lP9T/1hJDO6kohhjBeAkU0k/lks7VFoyVlZxRrHfWvYuTO6uc4rcRmVzrU
         IzrEmNOTthW91E7KU+4b1JB+LvGm05nYJ0/sUEs3/6jPa9aVmsLCDpVh+ExFpX8/CHz+
         zhcz1gNnoMztZfUvZSkYo1SEQs8nto0r1Di4m/jSuQaW63fm4v4wlFXbJaZ6rkCMzgdV
         wSpmt0h1xVhHodjT5AkMH/LtI1xIJUk4EFeK1mx8Wcj7q7BwuKszsB6JiwKQMNc9Jj6o
         OB5RDsR5qgQmBuiiotBu6oPKT1SsY5dMe9aB2HD4Qhk7WfvmY+r/2t/LI7g4WxIFVB8Y
         YI/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+jguNWiGNJegmOCOBMO2OtuoJkXz04wQVoVGIg0O7HJEDIeBnVSBPgcrVrHAPTwWCB+pQ8nlmWHHZpf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7CHCCNyCd4bAOc5NMiuWv1snlmz1ko8FRjMkaROvMucznspyB
	ZTIW1CZcyxwKclByG1i1vPaQm51O3fguviPeWA0eEz2PT7Chmx1cSAPpT00LyPXqzh+FHgl0gRf
	vn0vojPFi2FBCrkJiBMQxD0+aTzB1Kk0=
X-Gm-Gg: AYBFou1bLgXqWN0EZVgitNiUhYWhXoVyt+0/jtoZabDNCWIVMqREGEYU5QIrfHrOF3E
	0+AJFeU3CzRXeDr0mDOKKCuKuxNA8IoB0amOqasg8mwI140Aq447hFSyjXi+GyzOIY1pzmr0AiO
	X+xoD9QyPWL6RIpZXEEmYfIUwaP28SHQj733ztEQwGCmxlXCR2kWN5aHnG1dK60NVvjAGFWOkJ4
	flcGFh8gyuy96fDr02tvzrKTZEcm0s2+v+rkp27Ci3BkvxbaqsnLANln6q2FCi2fFZ+0nSAxRD3
	5cc81/tifDgSPSVdsOWOCLAMAvSpAUp+owgyx+0WnXqYnmc/MacLvOb/Ybi2dfhO/mn1CtdiLaH
	tttVXG7u2qw==
X-Received: by 2002:a05:690e:144e:b0:668:9230:e266 with SMTP id
 956f58d0204a3-674112442a9mr4372761d50.46.1790682583424; Tue, 29 Sep 2026
 04:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921192559.2619635-1-shakeel.butt@linux.dev> <20260921192559.2619635-2-shakeel.butt@linux.dev>
In-Reply-To: <20260921192559.2619635-2-shakeel.butt@linux.dev>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 29 Sep 2026 19:49:02 +0800
X-Gm-Features: AclHuK-nFEkgx8S0aZZQyW2aKsafwpBB_ccNYji7zHIK6DtT7XurPCTCqUpsYEY
Message-ID: <CALOAHbAb_aKHNxKV3ecUW6ZxK3VR8XAwxD0vHiaZa__6e2pKwQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] bpf, cgroup: fix cgroup struct_ops query for a
 second attach type
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, JP Kobryn <jp.kobryn@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, Michal Koutny <mkoutny@suse.com>, 
	Amery Hung <ameryhung@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Jiri Olsa <jolsa@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, hui.zhu@linux.dev, 
	Donet Tom <donettom@linux.ibm.com>, Greg Thelen <gthelen@google.com>, 
	Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, bpf@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:31=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> Two things in __cgroup_bpf_query() work only because CGROUP_TCP_SOCK_OPS =
is
> the only one struct_ops attach type.
>
> It calls cgroup_bpf_enabled(atype) with an atype that
> find_atype_by_struct_ops_id() works out at runtime.  That macro is an asm
> goto and needs a constant.  Today the compiler can see there is only one
> value; add a second type and the build breaks with "impossible constraint=
 in
> 'asm'".  Add cgroup_bpf_enabled_runtime(), which reads the key instead, a=
nd
> use it here.  This is a syscall path, so the cost does not matter.
>
> And find_atype_by_struct_ops_id() matches on type_id alone.  An attach ty=
pe
> whose subsystem is not built keeps type_id 0, so a query for type 0 finds=
 it
> and returns success with nothing instead of -ENOENT.  Skip such slots.
>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Yafang Shao <laoar.shao@gmail.com>

Could you please send this fix separately from the series so it can
land in bpf-next on its own?

> ---
>  include/linux/bpf-cgroup.h | 9 +++++++++
>  kernel/bpf/cgroup.c        | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/bpf-cgroup.h b/include/linux/bpf-cgroup.h
> index 8a75a6cd7309..3b2c127d401d 100644
> --- a/include/linux/bpf-cgroup.h
> +++ b/include/linux/bpf-cgroup.h
> @@ -76,6 +76,14 @@ to_cgroup_bpf_attach_type(enum bpf_attach_type attach_=
type)
>
>  extern struct static_key_false cgroup_bpf_enabled_key[MAX_CGROUP_BPF_ATT=
ACH_TYPE];
>  #define cgroup_bpf_enabled(atype) static_branch_unlikely(&cgroup_bpf_ena=
bled_key[atype])
> +/*
> + * Same test when @atype is not a constant.  cgroup_bpf_enabled() uses
> + * static_branch_unlikely which creates jump-label site and requires sta=
tically
> + * selected key. Since key is selected dynamically, use static_key_enabl=
ed here
> + * and keep it off fast paths.
> + */
> +#define cgroup_bpf_enabled_runtime(atype) \
> +       static_key_enabled(&cgroup_bpf_enabled_key[atype])
>
>  struct bpf_cgroup_storage_map;
>
> @@ -508,6 +516,7 @@ static inline int cgroup_bpf_struct_ops_attach(struct=
 bpf_map *map,
>  }
>
>  #define cgroup_bpf_enabled(atype) (0)
> +#define cgroup_bpf_enabled_runtime(atype) (0)
>  #define BPF_CGROUP_RUN_SA_PROG_LOCK(sk, uaddr, uaddrlen, atype, t_ctx) (=
{ 0; })
>  #define BPF_CGROUP_RUN_SA_PROG(sk, uaddr, uaddrlen, atype) ({ 0; })
>  #define BPF_CGROUP_PRE_CONNECT_ENABLED(sk) (0)
> diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
> index 696b27383974..99b4e96f5db7 100644
> --- a/kernel/bpf/cgroup.c
> +++ b/kernel/bpf/cgroup.c
> @@ -45,6 +45,7 @@ static enum cgroup_bpf_attach_type find_atype_by_struct=
_ops_id(u32 type_id)
>
>         for (atype =3D 0; atype < MAX_CGROUP_BPF_ATTACH_TYPE; atype++) {
>                 if (cgroup_bpf_is_struct_ops_atype(atype) &&
> +                   cgroup_struct_ops[atype].type_id &&
>                     cgroup_struct_ops[atype].type_id =3D=3D type_id)
>                         return atype;
>         }
> @@ -1448,7 +1449,7 @@ static int __cgroup_bpf_query(struct cgroup *cgrp, =
const union bpf_attr *attr,
>                         return -ENOENT;
>                 from_atype =3D to_atype =3D atype;
>                 flags =3D 0;
> -               if (!cgroup_bpf_enabled(atype))
> +               if (!cgroup_bpf_enabled_runtime(atype))
>                         goto skip_count;
>         } else if (type =3D=3D BPF_LSM_CGROUP) {
>                 if (!effective_query && attr->query.prog_cnt &&
> --
> 2.53.0-Meta
>
>


--=20
Regards
Yafang
