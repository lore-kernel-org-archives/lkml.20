Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7943955DC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977232; cv=pass; b=RqavbgNEOd8z3zPI2KNc9rv3IBvYmNa2caAIbAe07enZE+8cg3A/BnzotgmR9hX78QHo3+llQXzbTdFEpVuJVYh128Rg1ytsJ5ZHBV0EkrkepXSFMT9/Vbgp/p3m7tHF/i+WiaFb0oiZBjzf+/SStJkWdAvUHXUJSHFJLUyG63I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977232; c=relaxed/simple;
	bh=ffpLcmhdNr6NOIw4fF/1zoFPIQiK4mOy2UlkzAuwzw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e62X3t5f8iX/tpfGNUJLRHBQs5ou7xQVo5rBGOrtjbVvXIIN5xFdLrp09htQfumD08csQMMZnxs/JFS10xRJHXmgqVJ9wTipCiUs+0y2EwGhCwvvrBthO0Cu3jz5IJ72W354VUXJmTAZe4b9HaVpawmqggC56VNKwiYhF7nX0bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=u0XRGv88; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="u0XRGv88"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67109e0aa0eso1145698d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788977230; cv=none;
        d=google.com; s=arc-20260327;
        b=i1w9DutV+J48IeGPyAFe1+9InOmXyCc3WyQnRj0Lk8VauwpZhZVcjSMhq7NVwtmYCY
         s7jaDqkPluoAwwt4mefUFh2PZaVUpjjY/tvIw3NZT6QtEbMYtU7L/mNpfK4g/Mx8SYBV
         zzIx2603CsozrymFarwka4oBsEyuwPChx4scbtxQ/9hn229DVTIJESp9i5Gh9DnhR2tS
         72qyAslYmg3RdHQzZJQmNzZ8ci0uf2iM/IHvTgJDy8Wdpt8TaAukrviV3O5bTw/R+aRt
         n1b/PHH4/ppjfO0M+iqJ1baSd4XnG+zyDo+PI6BgCzoARooK+RLw71QKKYbTlFoQrVoX
         RzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pb5/uK6V0VOSoOpi7HbnquG+ZVFHg8kvhGiqpjo0wEE=;
        fh=zXcCDpIs1X55Jx8we0s2vnOL/IQjKrS95bnFTjTYf30=;
        b=h0TEgI+ljxDS2jKpU8xn/D0OnQ62EaqSgGBnYbg9eFWwC2Ln72Mp8skRQFm24WLlE0
         Eytqa9+fGwDzoXN2iOWsVrrclr8wsXovwMAkHDf//eV6iZwvB4bM6gO+LjQawkREeeUF
         wFMcsAfuovW0dkvc/xCB55ezwDIlsdctIFyXDr7uel2Aai98jVWCVyqH30o4nfUjh2C0
         9DYeWpWa9wfVuP0xfnG2WCl2mx8OAVxOCeqhPyQbr9fTdNCVFg1o38eVHISRoTlOgCgA
         JrnRJ5BiISXnR2k0vwhASA226Te/hzyZrFOeEN/+85Nm329iPXEOZRcnX0ij9w7f/+u8
         0gxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788977230; x=1789582030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pb5/uK6V0VOSoOpi7HbnquG+ZVFHg8kvhGiqpjo0wEE=;
        b=u0XRGv88nCQIxehtLTPevTtlB7TUi3IqgpoQOtUO5BVi3QSvwDPVFZQIfiZwfCa3Jj
         S4viXBzwtMEnA6JKFy73M9DCvcbpd7MSh/Uu3LXmOYUeMRJF006TRC+B4Y/XhPHffL9X
         IgFickCE/xsQHHhWihcFWGgHh/hAfTa4cuiU7qac+APhrj81gcm6Bf5JU+XT6Qo9UamS
         yeRSw4M032rdpGBKMvOy9lMuJTfc4LMPAo/GRZU0FK2pb9LTvbYHouaBa8nsIorSTjD7
         kPOpWtA9sazTFT+eD5KqrfCFZr/HhV8fgC5vuqTQifEAuSoSqfvrF2MyjUjSYq5p/Wew
         xHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977230; x=1789582030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pb5/uK6V0VOSoOpi7HbnquG+ZVFHg8kvhGiqpjo0wEE=;
        b=Al9uWmZ4uJTqknr3WsFxuOxWWUpOgioDVEwgaTwuOV8nYFJ8D3uk3wg3HKbBsCfE5f
         kBSzt3qG9vm0zpRXN3N2eqTAxnKzSVLoo7EEdzekX7DQRXKGHmU5cJxBRan7OOhah5PY
         J4wwiYKqb3hFY3RnXZd2afKJ2qnlHD9VMWXKYqzhSNPnAeJPqtguP3tQy5rMFZlEea3s
         VlSFwh8Rn85Es3EVBcaSxmVAwugJ2BDAzQGF4ByuM+1qoR8Kjenqwu5gcid4U+5PSV/W
         H0O2A4L6BlMDxzrPdwQ3GWaZhBnWQIzjPxNw8XNojuSlvweEcnB4yW5j7oSYgNsnAcBM
         Kf3g==
X-Forwarded-Encrypted: i=1; AKwUvBzthM3BY84PcDq++21AoiWsQpBNWeEcnJ60Z9H3LurX42Nl5dSNJoHrusvuXmC+SrBxc/Z91DHuR/vHWM8=@vger.kernel.org
X-Gm-Message-State: AFuF++kWRLMYuJZuqa4QGcYgkWSurCrfgwzDBXTol2E9SSzYQqBO0X/d
	KIJVy7ZL5n406l8VOK4Uby1xBpseEoyTX64lVs1D2w86B/qMYEM/VuuOI+VmX3FXDRp3zy/5TSE
	g46Ba9FodWRxJ3xVRI9QCbmH6c8hhSQQiYpQUMzN7SA==
X-Gm-Gg: AYBFou36fay7XucA7BxtS2/p8pIwW4i2gsA7BdYHztKNowxHIMlCNDJn/B3Rz7RqmHW
	pZmnqsbz0koXI07I7tuG4LntRI7RuqI2HXQgs2AMxcLOO0aOVf3CEr19oG6KebNc8cKqEuGqoBE
	0CZShDMFg1KH8ZzotfKCkI3SWx2zoK4bJRTU8FK0j9tX0mmMoiM5KOs+pITq+naIjPIvzOdosxX
	MoLruno7uXGOurchRuOaoCw7GNmHCXVH5uggx9IJbbt0dtuSgvy4eoPbP5olxbxwYUWTAz4gmuw
	FQvRHNPCm7d6/yon9oaH9xMwE45hJRH9W/+Evg/n1RNgDt5T5lKJvVc=
X-Received: by 2002:a53:5a0c:0:b0:66f:c1be:317a with SMTP id
 956f58d0204a3-66fc1be35ebmr7665511d50.81.1788977229661; Wed, 09 Sep 2026
 11:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903100921.113374-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260903100921.113374-1-jiayuan.chen@linux.dev>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 9 Sep 2026 14:06:58 -0400
X-Gm-Features: AcwNN1WgDaem2ZiaTSnvUEhjWeQKvrRPTKih7rvRNQjxGVVOPW6EXSNd9iM6xvY
Message-ID: <CABFh=a7as_meC0sM5-KmSsGfvBuHd3XCceBEJ9q29Uf8V5E_gw@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Fix out-of-bounds read of rtt_min in sock_ops
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, VEGA <vega@nebusec.ai>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Lawrence Brakmo <brakmo@fb.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:10=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> A sockops prog reading skops->rtt_min never checks the sk type: on the
> tcp_conn_request() path sock_ops->sk is a request_sock (non-full), and th=
e
> ctx rewrite casts it to a tcp_sock (full) and reads rtt_min past the end =
of
> the request_sock, returning dirty adjacent memory.
>
>         SEC("sockops")
>         int prog(struct bpf_sock_ops *skops)
>         {
>                 switch (skops->op) {
>                 case BPF_SOCK_OPS_RWND_INIT:
>                         leak =3D skops->rtt_min;   /* reads the request_s=
ock OOB */
>                 ...
>                 }
>         }
>
> For instance one such read returned rtt_min=3D0xffff8881, the high half o=
f a
> leaked kernel pointer.
>
> Guarding that cast is exactly what SOCK_OPS_GET_FIELD() does -- it checks
> is_locked_tcp_sock and returns 0 when sock_ops->sk is not a locked full
> socket. Every other tcp_sock field in sock_ops goes through it; rtt_min i=
s
> the only one open-coded, so it skips the check.
>
> Read rtt_min through SOCK_OPS_GET_FIELD() too. rtt_min is a bit special:
> it is a struct minmax and we only want the current min, so pass
> rtt_min.s[0].v. That is equivalent to the old hand-computed offset
>
>         offsetof(struct tcp_sock, rtt_min) + sizeof_field(struct minmax_s=
ample, t)
>
> (s[0] sits at rtt_min + 0 and .v at + sizeof(.t), i.e. what minmax_get()
> returns), so the loaded field is unchanged and only the full-sock guard i=
s
> added. The two BUILD_BUG_ON()s that protected the hand-computed offset
> are no longer needed.
>
> Before patch:
>
>         0: r1 =3D *(u64 *)(r1 +0)      ; r1 =3D skops->sk
>         1: r1 =3D *(u32 *)(r1 +2324)   ; ((tcp_sock *)sk)->rtt_min.s[0].v
>
> After patch:
>
>         0: *(u64 *)(r1 +56) =3D r9
>         1: r9 =3D *(u8 *)(r1 +50)      ; is_locked_tcp_sock
>         2: if r9 =3D=3D 0 goto pc+4      ; not a locked full sock -> 0
>         3: r9 =3D *(u64 *)(r1 +56)
>         4: r1 =3D *(u64 *)(r1 +0)      ; r1 =3D skops->sk
>         5: r1 =3D *(u32 *)(r1 +2324)   ; rtt_min.s[0].v
>         6: goto pc+2
>         7: r9 =3D *(u64 *)(r1 +56)
>         8: r1 =3D 0
>
> Fixes: 44f0e43037d3 ("bpf: Add support for reading sk_state and more")
> Reported-by: VEGA <vega@nebusec.ai>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

>  net/core/filter.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 61940e753552..a043d179ff1a 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -11105,18 +11105,7 @@ static u32 sock_ops_convert_ctx_access(enum bpf_=
access_type type,
>                 break;
>
>         case offsetof(struct bpf_sock_ops, rtt_min):
> -               BUILD_BUG_ON(sizeof_field(struct tcp_sock, rtt_min) !=3D
> -                            sizeof(struct minmax));
> -               BUILD_BUG_ON(sizeof(struct minmax) <
> -                            sizeof(struct minmax_sample));
> -
> -               *insn++ =3D BPF_LDX_MEM(BPF_FIELD_SIZEOF(
> -                                               struct bpf_sock_ops_kern,=
 sk),
> -                                     si->dst_reg, si->src_reg,
> -                                     offsetof(struct bpf_sock_ops_kern, =
sk));
> -               *insn++ =3D BPF_LDX_MEM(BPF_W, si->dst_reg, si->dst_reg,
> -                                     offsetof(struct tcp_sock, rtt_min) =
+
> -                                     sizeof_field(struct minmax_sample, =
t));
> +               SOCK_OPS_GET_FIELD(rtt_min, rtt_min.s[0].v, struct tcp_so=
ck);
>                 break;
>
>         case offsetof(struct bpf_sock_ops, bpf_sock_ops_cb_flags):
> --
> 2.43.0
>
