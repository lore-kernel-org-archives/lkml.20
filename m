Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB722332909
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569730; cv=pass; b=bS92tREs5A7f838xKekX09nhr+/TB+DcnFlOWQ7nwLp1AY034Rqs75uT7150Cshtg8gJjeVXc+BaD2lADQg8QqgceYNebwkPus9gIrde00zHBoBaZdNZMewNO2ANg92uTLyQr5XtI5ZBJpMR8zqVpwd0taJnpnj9J2lphlcSB34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569730; c=relaxed/simple;
	bh=uPysR5GFkyCY/qE0YCzGd8ZwpPP3JXLnMqhzAo7gH90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Su4kAqKJ0W7OtBBTG+FnSup4RU2ypDP6WTibupjAH7eTcwEVzFCDKJmqc9Q6FaueOzc/HEG8ixY4Rbh2J/kqEiKmIKHU+VTMhp66BIxPDcUmyh/CHxpgW/KcvFS9oDh1GvYJ6zNq8hCkkcCKqZekSdnfs/gt7U/ZIgvLvpGaF3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=hKs/C6u0; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="hKs/C6u0"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-861f30636f9so25532467b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788569728; cv=none;
        d=google.com; s=arc-20260327;
        b=b52UmLkz4lSEJknrpBb0q04BhQDKfycWXz8ZoFRlx/6wW502koOkiKX7pqriWrNSah
         aM4G6e4kGewxESWU0XF4XjzY7njD8MoeCv4OwrcsXw1Z/2w3p1qPuYDcs1eAGqKWTWmH
         iVXfJ3kaQYJO/dV2aigNvUnhBj46/Uab/BRXbcuiNBqwDD43RkKRo37VH25cYDPRMxyN
         YPvW4gADzHM6UdYsSY6TS1WyCEUzvpAQLfKFdLWC4g2QMyucJC0iUkszjnUGw5+7bl9Z
         aVwYxe3lg/VlZrAsp1+575uLFKKZKqCQhSiccTK50NXNh7kUc+uNPftNSfG6o+zRNlbu
         7o4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o2ZcMOhNLSW/gCHzJ1Lb1NgDbEasJyqkX407lKXNvbY=;
        fh=2d9O7Kv8BmxqQ/kSbETaSVXuVQ8w6ZbgYu4wf2av5+c=;
        b=C6LgoZ3UfFXhfKJ8yT551vMXyN9uGuYPi5snp3IVSAQcL4q05bA9UiLy9Z+Bsom8Rm
         okXQOf9rlsPdnJZuZbFSFbTLYuMkDiLK0IsB0JNk9B7AK+ByZJx75/DLhxbmGpwe5uV9
         nYXmH1n1yCSg5AnYyEdaJKMYEgi9388mpQZlhnIw47bK2v//yrpBjXyyIWnC7lhHkrlJ
         +AXLRVkKO4ec7Gxt4xj+gFtZgfU9+4PJkN/7vg95MCEBK48FpIMG30Al91pJt/bpO+jY
         veSKBMpAZ8KOlYUXKFsOs3nJh4gFgLLNEb4UTvFlQeF1WTcYVN3YqM93Zw6sMtDU40fv
         ErTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788569728; x=1789174528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2ZcMOhNLSW/gCHzJ1Lb1NgDbEasJyqkX407lKXNvbY=;
        b=hKs/C6u0ncsJZXhvsGxhlFZ/zYUqxJ/pC6z65oAb/4n8Wjx1zk9Bnjp43PN+hXSL/H
         w0oMMDhv6vg2Cpy+hUloiIlnpAVj02Y+QZ6Qw6CXMG241bQqTmbnKETOMaPD9GTQ3CmW
         KoJ43Iltbq2/PcsKgzQwdZRR2mx+dR41vNLA235BiJ1UK9BkdvE0TGY9FCL/tYxh+bH/
         +Rt1yFzNSHhJoMNWs23LRkCyMIjM6Rl7CgJP0BHjRLFCEvoYW14IFrWk8BQfGTkSEw9B
         Dbhn/nKQ90USRDahbCKx2O87nPo7QlFZtZIZLq8yOoXMA6D2CM1E3m56p0R2wZUGPKC0
         w/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569728; x=1789174528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2ZcMOhNLSW/gCHzJ1Lb1NgDbEasJyqkX407lKXNvbY=;
        b=LNikC2RAbNZxr15SXlgMljf1g+vinH5aerGU9bqMS3T4ZfYaamyFYos+sw7/r6+YUz
         zFf/nDku/Y1v5Qtr6DurioXulMdc3uV26oLHlK8IZDOmDl3y8Qvt+WJN7jpeYNHJL8Kx
         HoL1Q1jXR3kzaQgWTMiuTAqky2fVs1MvWeFnluWCI/ulurJZ/gn0BdJLuGcZeBGZF5lG
         VH5ZCK1uPTJzQyj/9LravLGy+9fANbFFHJnzzFIpM5dR1Dy2bgOHKDHiaPUcNZppqv8n
         SwNj5V6rTGwys8U1Q2nNNhDeeudGXP6uSlJay4hLxNMs7h83i+geSXcsxSgYN1aLcuoz
         AALg==
X-Forwarded-Encrypted: i=1; AKwUvByKqltcJlebFcHJ+Q6Gm6iBiZwUqU3+bWMMAYbiHuc2wHiDYtsWyk91Xi95+IuGb3a19n5T0GF2ITgQlg0=@vger.kernel.org
X-Gm-Message-State: AFuF++l84Mejye7sRxqr8Usj+y5w2q9GZC6eroWdUUr9QbJNPRhV9SG2
	nmciu72TEpjER51Eiwq8TYVqrjfFkC3pVPtRn1BSmPf3JfIR/1uY/MOyC5K/lqeqJUTNwhFEwtS
	qlF9pYejaRe/qEbBNnIwlzid1Sk6hoqO1ILZqdMMATA==
X-Gm-Gg: AYBFou1pDagbbifXn5hDNULHejgFyKBrSV9AQmDTya5UvUVGCoZDIT38g1hAqHo2KPM
	dD+vpFigVgGeTwB78fM3E953zr0n7xd0GJg9J8IWVc+YlFc0Ict6cTM5lMn1TW7H1XICZSShTRn
	HJVbX2ckM8Uyxsnbn8/rSz8Mox5vHICt0W+XhbRNFftKQeZeU8Rb9tE6EcoAULCI5kK96xQzk/Y
	OURYXpVMx/GteO0c9bVEdXe0STQWmZSaAuZoWJ7f3HEjHi7H0dxXIpo9q3DXQkc5cetzwUHNE9c
	ajSlo995zn/I50fk18lasm9funEYMMs7ZvVUAOHz2/ex/ZuM2q+OjPs8/Es0
X-Received: by 2002:a05:690c:dd6:b0:873:5c7b:c0ed with SMTP id
 00721157ae682-8735c7bc2c1mr17195157b3.37.1788569727646; Fri, 04 Sep 2026
 17:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901014713.3502900-2-sanghyun.park.cnu@gmail.com>
In-Reply-To: <20260901014713.3502900-2-sanghyun.park.cnu@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Fri, 4 Sep 2026 20:55:16 -0400
X-Gm-Features: AcwNN1UW-1j4dMWYep58MqXBEV0s9deTc9aokvKEnPaB7kyqQmbppPFFaFUGT3s
Message-ID: <CABFh=a4Gj1c64ak2NautOWxyo1g+7F1ruPjf_HRQ9ek6Zt4j4A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/2] bpf: Validate program attach type during
 link update
To: Sanghyun Park <sanghyun.park.cnu@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, Leon Hwang <leon.hwang@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Pu Lehui <pulehui@huawei.com>, 
	Suchit Karunakaran <suchitkarunakaran@gmail.com>, Xu Kuohai <xukuohai@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:47=E2=80=AFPM Sanghyun Park
<sanghyun.park.cnu@gmail.com> wrote:
>
> Cgroup link updates compare only the program type. Programs verified
> for different hooks can share a type, so a UDP6 sock_addr program can
> replace a UDP4 program and write beyond the four-byte ipc.addr field in
> the stack-local struct ipcm_cookie. The same gap permits incompatible
> LSM_MAC and LSM_CGROUP replacements.
>
> Validate every replacement program against the link attach type before
> dispatching to the link-specific update operation. Keep the CGROUP_SKB
> CAP_NET_ADMIN check at initial attach so pinned or delegated link FDs can
> still be updated after a capability drop.
>
> Fixes: 0c991ebc8c69 ("bpf: Implement bpf_prog replacement for an active b=
pf_cgroup_link")
> Acked-by: Leon Hwang <leon.hwang@linux.dev>
> Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
> v5:
>   - Fold the link-create permission check call onto one line.
> v4: https://lore.kernel.org/r/20260831023918.1857658-1-sanghyun.park.cnu@=
gmail.com
>   - Validate every program link update through the shared attach-type hel=
per.
>   - Fold the LSM attach-flavor check into that helper.
>   - Keep the CGROUP_SKB permission check in the attach-only wrapper and r=
ename
>     the wrapper to describe that role.
>   - Follow the preferred BPF multi-line comment style.
>   - Add focused regression selftests as patch 2/2.
> v3: https://lore.kernel.org/r/20260821084726.3769957-2-sanghyun.park.cnu@=
gmail.com
>   - Factor the CGROUP_SKB CAP_NET_ADMIN check into an attach-only helper.
> v2: https://lore.kernel.org/r/20260818061021.2551771-2-sanghyun.park.cnu@=
gmail.com
>   - Extend validation from cgroup sock_addr programs to all cgroup progra=
m
>     types, including exact LSM attach flavors.
>   - Preserve legacy CGROUP_SKB ingress/egress replacement compatibility.
>   - Keep the CGROUP_SKB CAP_NET_ADMIN check on attach, not link update.
> v1: https://lore.kernel.org/r/20260805052858.2390918-3-sanghyun.park.cnu@=
gmail.com
> ---
>  kernel/bpf/syscall.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 6874ba1424af..2bcd3f3a2a55 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -4481,14 +4481,9 @@ static int bpf_prog_attach_check_attach_type(const=
 struct bpf_prog *prog,
>         case BPF_PROG_TYPE_CGROUP_SOCK_ADDR:
>         case BPF_PROG_TYPE_CGROUP_SOCKOPT:
>         case BPF_PROG_TYPE_SK_LOOKUP:
> +       case BPF_PROG_TYPE_LSM:
>                 return attach_type =3D=3D prog->expected_attach_type ? 0 =
: -EINVAL;
>         case BPF_PROG_TYPE_CGROUP_SKB:
> -               if (!bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
> -                       /* cg-skb progs can be loaded by unpriv user.
> -                        * check permissions at attach time.
> -                        */
> -                       return -EPERM;
> -
>                 ptype =3D attach_type_to_prog_type(attach_type);
>                 if (prog->type !=3D ptype)
>                         return -EINVAL;
> @@ -4542,6 +4537,20 @@ static int bpf_prog_attach_check_attach_type(const=
 struct bpf_prog *prog,
>         }
>  }
>
> +static int bpf_prog_attach_check_perm(const struct bpf_prog *prog,
> +                                     enum bpf_attach_type attach_type)
> +{
> +       /*
> +        * CGROUP_SKB programs can be loaded by unprivileged users, so ch=
eck
> +        * permissions at attach time.
> +        */
> +       if (prog->type =3D=3D BPF_PROG_TYPE_CGROUP_SKB &&
> +           !bpf_token_capable(prog->aux->token, CAP_NET_ADMIN))
> +               return -EPERM;
> +
> +       return bpf_prog_attach_check_attach_type(prog, attach_type);
> +}
> +
>  static bool is_cgroup_prog_type(enum bpf_prog_type ptype, enum bpf_attac=
h_type atype,
>                                 bool check_atype)
>  {
> @@ -4606,7 +4615,7 @@ static int bpf_prog_attach(const union bpf_attr *at=
tr)
>         if (IS_ERR(prog))
>                 return PTR_ERR(prog);
>
> -       if (bpf_prog_attach_check_attach_type(prog, attr->attach_type)) {
> +       if (bpf_prog_attach_check_perm(prog, attr->attach_type)) {
>                 bpf_prog_put(prog);
>                 return -EINVAL;
>         }
> @@ -5805,8 +5814,7 @@ static int link_create(union bpf_attr *attr, bpfptr=
_t uattr)
>         if (IS_ERR(prog))
>                 return PTR_ERR(prog);
>
> -       ret =3D bpf_prog_attach_check_attach_type(prog,
> -                                               attr->link_create.attach_=
type);
> +       ret =3D bpf_prog_attach_check_perm(prog, attr->link_create.attach=
_type);
>         if (ret)
>                 goto out;
>
> @@ -5968,6 +5976,10 @@ static int link_update(union bpf_attr *attr)
>                 goto out_put_progs;
>         }
>
> +       ret =3D bpf_prog_attach_check_attach_type(new_prog, link->attach_=
type);
> +       if (ret)
> +               goto out_put_progs;
> +
>         if (link->ops->update_prog)
>                 ret =3D link->ops->update_prog(link, new_prog, old_prog);
>         else
> --
> 2.48.1
