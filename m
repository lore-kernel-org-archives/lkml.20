Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0154FB9B8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811332; cv=none; b=HCnNtGGUEPlB8Cj8sxjkxFM6RGOC39oGx1+wCK7yi2zNWvycFlauRScw8eYbdO/pzCafnZJQ4D0DTsYzHmiZVlU1ZFuF4Dg9AFocGhaDDXPqH8xQzz/3Wg54Fq9SREQU7IjddtISCw4bonpAidCSqZGKd7AG5tsHk3iSRPiL7Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811332; c=relaxed/simple;
	bh=32e5Hq42eMbENhVQyuKVR9aB0aAxBUGCy1TPX6J6la8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=HSvmw9Vy5vwW4nDzk/xo3INXXWkYxcfiFyrmGFfOpeT8qALGZDa1UZxKmUZCwommBQ4WGTmHepwJsXAcvk5Tuh+Rk9In5uMnQjj2TPOwHsj6kUpJfAvSuZt8z/Lq4rKSxmGCJofdbYwhdcCFcxYH7x8uPHE6I92EgQZr9pRDx2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipkxgOAr; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipkxgOAr"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46aef784ddcso1389876fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788811328; x=1789416128; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngem6m2yG08mHgsLH9JWCZ0vrxKdp0QjFmiqcsYBtQw=;
        b=ipkxgOAr9TbDmqsS8Fc4B6E5afu20lBK6c+fnOnm1l2JUdgsKjLHTY31mA7j6sw3Dc
         9FhTFwfoZFwtqveB6OaamYtAeXx59vw5PGXezaqfxc+iwDmxP2IEY7mCBl+q/lqP8njf
         mDV3NbNcA2I3tC01Sq5cLKRmZnbOCdlytBVhf9SrOKRSbqZXxo74hH2pGl7sbeCAuaSS
         tDpcfbXd3C6xRtq+K6svHQ/9GK5b2qYshJ7e4y+e4Xa4dtz32Qq2GKOvJURMloytJnjc
         LaNwbf0uCnem/HLWQukQeYzUPF5zcs6l/Zupgu7XWQ88/G9K6Ddiw/Lofs49H4Y0Atx3
         ksIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788811328; x=1789416128;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngem6m2yG08mHgsLH9JWCZ0vrxKdp0QjFmiqcsYBtQw=;
        b=flsgsAoDLY+/0/D3eS4Q4QWpoiATQSmhFSkqeKy2wyGLt8A3LHjjHLXzlxgT1geUCt
         2O/8Fmx0fwbfYVWkp2T4iIXDW0B/iN9r2mGuePa0aTS6KhctgzXD0Prl65Xu8F664DeW
         18KRs2H3QBJPnamIECZEE0lB+5sNmG+U6fC4q4DW9J4i7iYzexWwF2MD+JcTkazsAvhd
         zY7Te2ciEN/JFO8Jp+UYpMVehzx9xN5vflNI8VrGtogYrTVecioyYCw2/m4N4zRjjftO
         aox1hyJ4s4xS0zVOTwDZaNQMs17oQAUfpNHWvVzmnc88xh4LNfd6E8rdJzO4dSaHUhz9
         WgDw==
X-Forwarded-Encrypted: i=1; AKwUvBxdDRhH342/ssAUOfr2QGYlz5QSYM4kxDbST7oaKc+Qcxq59mhMT9S8aL9eWGYqT+DaXbrdMzzUW9nbdOk=@vger.kernel.org
X-Gm-Message-State: AFuF++k02zji1ofWR03O6vTsFUZIfvF0u/KavBoxO7LQktSqByehkVV8
	wwpHuXh5F4ZDL2NHWld/yZ+IpGYH86S78xGiagIyT20NHtinygXfrigF
X-Gm-Gg: AYBFou3JhiAyiPRznIkD5JZq+mzZMMDd1epF+8nfUaHG2ayKH7uMgSUsDYVSWHMv0Tt
	qm5vmKLT0ipODNYzaL34aocJPZyofCxDqZrirlyR0/TUp+0vEPA9tulQd8BOA0KEoS+fIN35JEA
	I1luGtOLEMZWa+io287HFhaRtHJMxT6R7JVpI68sKfBwI7mN3Qd0mamqTBeDVH6bSwGw0jYV3BF
	BBzMyrJgCMLFtBbSzPtKOy0oD4dAP67sR28goSaUYDXh3HlRCiLvq4Dm+Ualaa7mbEcuc4gqAwX
	7OCc7m3GvLcyCcgNOHG3qRlSG43UieFwTZQYTQjEk3ey+vmwyGnkjQTntnwDMHaN4QKpqA4QG6m
	sQ6CJkKeoyGpNA02K1VeywlOp/temm/6RUDXlXFPUjvDVNYk4M5VjBpYRJL4cJ1iquFS/MB+iZu
	dUe166qZML5tHN/4WtGsoPV+y9d8lMSeTokTzdkODVKCo5j0qDxoIg88e90HZ3bk7uE8k0iXqiX
	ic3l9uLJjVVNo43toAyTYgASnbMceMkDmPlvFPs7iJdPHTCDP9QHMw=
X-Received: by 2002:a05:6871:6315:b0:447:4fc:1da1 with SMTP id 586e51a60fabf-475526ec139mr16680060fac.12.1788811327749;
        Mon, 07 Sep 2026 13:02:07 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:1e::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-476ed51dd64sm7220292fac.18.2026.09.07.13.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 13:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 13:02:04 -0700
Message-Id: <DL9COXZQXX4V.1FN45QO2Q77ZH@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Alexei Starovoitov" <ast@kernel.org>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>
Cc: <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <co+adfca3e91be95776@bugs.sh>, "Xiang Mei"
 <xmei5@asu.edu>, <stable@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: refresh seg6local SRH pointer after skb pull
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc
References: <20260907192129.557377-2-bestswngs@gmail.com>
In-Reply-To: <20260907192129.557377-2-bestswngs@gmail.com>

On Mon Sep 7, 2026 at 12:21 PM PDT, Weiming Shi wrote:
> An LWT_SEG6LOCAL program can invalidate its cached SRH with
> bpf_lwt_seg6_adjust_srh() and then call bpf_skb_pull_data(). The latter
> may reallocate skb->head, leaving the per-CPU SRH pointer dangling.
> Post-program SRH validation then writes through that pointer.
>
> BUG: KASAN: slab-use-after-free in seg6_bpf_has_valid_srh (net/ipv6/seg6_=
local.c:1411)
> Write of size 1
>  seg6_bpf_has_valid_srh (net/ipv6/seg6_local.c:1411)
>  input_action_end_bpf (net/ipv6/seg6_local.c:1463)
>  seg6_local_input_core (net/ipv6/seg6_local.c:1630)
>  seg6_local_input (net/ipv6/seg6_local.c:1639)
>  lwtunnel_input (net/core/lwtunnel.c:466)
>  ipv6_rcv (net/ipv6/ip6_input.c:351)
>
> Give LWT_SEG6LOCAL its own bpf_skb_pull_data() implementation. Save
> the cached SRH offset before the skb operation and rebuild the pointer
> from the current skb->data afterwards. Since pulling data can replace
> storage but does not change packet layout, this preserves the identity
> of the cached SRH even when multiple Routing Headers are present.
>
> Refresh the pointer even on error because __pskb_pull_tail() can replace
> the head before a later step fails. Preserve the pending hdrlen and valid
> state so SRH validation semantics remain unchanged.
>
> Fixes: 004d4b274e2a ("ipv6: sr: Add seg6local action End.BPF")
> Reported-by: co+adfca3e91be95776@bugs.sh
> Closes: https://lore.kernel.org/all/GCy0KRM2IcQGoJQTjJEU9D0maBxXzEDHuQpq@=
bugs.sh/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:gpt-5
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>  net/core/filter.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 61940e7535523..e61f9e9226b10 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -7162,6 +7162,32 @@ static const struct bpf_func_proto bpf_lwt_seg6_ad=
just_srh_proto =3D {
>  	.arg2_type	=3D ARG_ANYTHING,
>  	.arg3_type	=3D ARG_ANYTHING,
>  };
> +
> +BPF_CALL_2(bpf_lwt_seg6_pull_data, struct sk_buff *, skb, u32, len)
> +{
> +	struct seg6_bpf_srh_state *srh_state =3D
> +		this_cpu_ptr(&seg6_bpf_srh_states);
> +	unsigned int srhoff;
> +	int ret;
> +
> +	lockdep_assert_held(&srh_state->bh_lock);
> +	if (!srh_state->srh)
> +		return ____bpf_skb_pull_data(skb, len);
> +
> +	srhoff =3D (unsigned char *)srh_state->srh - skb->data;
> +	ret =3D ____bpf_skb_pull_data(skb, len);
> +	srh_state->srh =3D (struct ipv6_sr_hdr *)(skb->data + srhoff);
> +
> +	return ret;
> +}
> +
> +static const struct bpf_func_proto bpf_lwt_seg6_pull_data_proto =3D {
> +	.func		=3D bpf_lwt_seg6_pull_data,
> +	.gpl_only	=3D false,
> +	.ret_type	=3D RET_INTEGER,
> +	.arg1_type	=3D ARG_PTR_TO_CTX,
> +	.arg2_type	=3D ARG_ANYTHING,
> +};
>  #endif /* CONFIG_IPV6_SEG6_BPF */
> =20
>  #ifdef CONFIG_INET
> @@ -9052,6 +9078,8 @@ lwt_seg6local_func_proto(enum bpf_func_id func_id, =
const struct bpf_prog *prog)
>  		return &bpf_lwt_seg6_action_proto;
>  	case BPF_FUNC_lwt_seg6_adjust_srh:
>  		return &bpf_lwt_seg6_adjust_srh_proto;
> +	case BPF_FUNC_skb_pull_data:
> +		return &bpf_lwt_seg6_pull_data_proto;

Instead of adding new support that no one will use, just disallow this help=
er from lwt_seg6.

pw-bot: cr
