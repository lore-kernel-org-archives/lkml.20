Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FACF5540BC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881804; cv=pass; b=VynjdGspyzy8Hwk4zCC0SGKfgAjH0U1Zy215RmGgZ7OwoyExM0IJqvrcjmTcdyTxIBxkTicCtK16YdLTYJBBrEfWAthI3fS2nw/Jd9DqQLEyu0q4DtVIauOgd1cyGbMb9VZS4CEizPmmUKqn+wrMlIRI57efL7GoMLwQTS5ouMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881804; c=relaxed/simple;
	bh=qv5CqAwUxGe/iJwgzvl6/jdT2pRBccudl+MNJGYvjwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSn7cHSSN+vwNTBs9mcnnBLE+X4N5gfqYwrdMKJicx+4eN3Mb4XGP3vftg2u7/b7xbDj7+qVJ+Gw+PsvE+ZhNeN2wrVFNSp74eZm1Ge42g+EGf/253z5lmCSkG1GU0Z5GOv0yvy1tV8BakZ6sbrIlSxKUGeTzqKTFgjYZTN1pqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZYqLaX5; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZYqLaX5"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso9235766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788881795; cv=none;
        d=google.com; s=arc-20260327;
        b=YC/ijmvVJ6VHVii+4shP4F8oEBfWdL7bEQdeJbCphPKaZU6FMJJCQ8S5p4GmMXu7GP
         LsVjrk35jTrsK20gJXQASROrMifB91qFaAaRU3Lg+FWdrQD5rQYsHfBQQgxYBNHG/vic
         Xi29N5n3m/AtFc9lPtYHlVq4RWL1liKsKttYqzIZpRJhkqXo/3MlsZLw7Ld+GcH/1qtJ
         iDP6qzqBF5E7VY550DitewhB3onAqA1zBa3/o5CnhaA4s7/qivxIA48jBYcQ8CSgAtlh
         PNrvVA453TEfj3C4gfkS+zrC+AQkkx3jVWDpR9asr7Q+AXtuDk5ljh7Y0l4LWtWQYOOK
         No1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8FzMS8SqyHbEwR/vnXKxYqgMS5+hpscCzqtpdIcwKA=;
        fh=qlMzce8LSYYlCPgDiSI2i7sNqecRUk6KMRkvvyaarXk=;
        b=WtsQ3c2dqZ8/aX9rspH3X9H6qBjX8eLrLvs/a+sv+dAKeQd54lVlnl3XvXxr8Jdz4+
         QIPuHxSPW91CdB4dsPOsG3PgUf/cAeu0ATDSGLfVGvR/uM2wpI/whXZ5Cc5jFKzq+Opy
         +EpVPjZVH7UaFEeKuPjkPwLsKPFsulYiZFqe6yCQ66N325RPoCFHkMDsnlAshvB8lC8S
         FisgNt2XsLoSXpGvbB4OHTVO4NiiVugFfLYrpwwZvxKEpjiBOf64irMijUR/K0o6nZh/
         dTgqKVqLoarhuBctGaQCOTV/Th4h74Tg3xrlzHfZjh9fXP6Lo0O0d4dVDqPAqqUyGyh2
         wIbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788881795; x=1789486595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8FzMS8SqyHbEwR/vnXKxYqgMS5+hpscCzqtpdIcwKA=;
        b=nZYqLaX5BXCpimJ5YPSSNzwd7qXrNrxmBbj9qM4TK+XzEI8Rtbu7j4KODLUyfpvccK
         XVJAxKw6Z/8Cnmgm4mx+vkHBbqDp/BAMPbpfaQZsGb53qnxhK7le1nTsK1reaqFZAAC5
         c+3SSlVdGlF4w9o905ACadgpB0Cpat3FmP5taLwdFKHhtf8RQGmjrs4sDJp8ZK0TxcuR
         fDue5lLygKI81g/Ha7XxA6sCTNCCSHnhurRb4O0/KTRYmicKDLCCxpMGPyL+AhvF8CfR
         Xu3wzVEeQnejMG9aKdS6qBm3BJe0JDmFgo43q0IxkY0GNiROXX3TJoxEA0oljdEMw7OI
         g4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881795; x=1789486595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8FzMS8SqyHbEwR/vnXKxYqgMS5+hpscCzqtpdIcwKA=;
        b=ma2yYU+6tvzkxUEj5lc+JccAGNhURphnWX/uGBfh+NW4hSbRZ4dqpC3AzC8Wy9NQNc
         NJCXvfLZf62Nc+E69gGjDbE+HPL0GAsRPkDx2kLMllAbUhOm5u06IgDIn+lmAH9bqc9S
         4oIQVMZRWbQXU0dApH/Mw6YqcG+sDQQORHRG8aeMh17oK7BJtvRp7shZh+uEpkV5TpVG
         AW5VRYpRqaJpSarR5Y3YDi2wPuI8Kk1Z7Kl8MXLw/fsZyTpOFM7WaERZBjkBiMa9wozi
         Lwd7OSzpXe5znobcwLGX45lvrInDWNPStT8q6dgCL9N0A2srsQAia2tee9kbIFysVVWq
         QSFw==
X-Forwarded-Encrypted: i=1; AKwUvBwxpnvz2SY22BqTu3Wmvd13l3mDE4EsrxOeevuB5nNR+vuSo0BJ4XMQcSW95Nud5jghh+SqSlzSdJwDPBI=@vger.kernel.org
X-Gm-Message-State: AFuF++l65XQzGc6PaPbyPS3+RcN00QM/cNwNvEmStO79/LWcLMDdfiJ9
	VbF02JR3JvC2IUut7OQJjjudtUecJ4tfIZSN10uHZf2yQNwRU5dnE6i3xGIXORqZT7pvjcYtXMs
	7HEmOEZXEcRajH+4kiPPRY8Ha5MZscVs=
X-Gm-Gg: AYBFou2StBVX5kCPNer+wTGlCLH857N5qAbe1Zj/mnXEae+e5Y9fc7uEaqphIjIoQdr
	iD/ZdpUyn8dceCM47miRCQPRcCTJNGAPnT39BftKZTT/zLrOGNOj/Yez5edB4vAjg2ikLGhf0C+
	XN7F25OOJlLv1ge/CTbKp4LCTBLeCCUdSoIifyGl5aPnaofn+HKoAxcrzvtzgSupuaMK4dAsSbk
	Efcbjb8lajrMxixd7Cg50Jz6Gqm8BECr8e0hq0AW6rAs7rb7gHsMkVZxUyvJ37coLDzvNm5i7PS
	92luZ4vt9gCup2eRqmFYLYIFdFUHuvzqxBsPbQqCzgUWj0aqyCTLeRRmvXupy6wv6U+fN5/Bi7m
	yHw==
X-Received: by 2002:a17:907:3f9c:b0:c25:c979:e76a with SMTP id
 a640c23a62f3a-c292b1dfb94mr62951066b.22.1788881794799; Tue, 08 Sep 2026
 08:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907192129.557377-2-bestswngs@gmail.com> <DL9COXZQXX4V.1FN45QO2Q77ZH@gmail.com>
In-Reply-To: <DL9COXZQXX4V.1FN45QO2Q77ZH@gmail.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Tue, 8 Sep 2026 23:35:58 +0800
X-Gm-Features: AcwNN1Xx6MilZKeliQoX9rpQOnWJ-qcSuSLe7P-XiShCEHYGUlHmCV_1KNJCP8E
Message-ID: <CANgPUi21BF7yAVGhb83sikiK96KE02X_JbVWL=OxXqWOc9uXbw@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: refresh seg6local SRH pointer after skb pull
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+adfca3e91be95776@bugs.sh, Xiang Mei <xmei5@asu.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexei Starovoitov <alexei.starovoitov@gmail.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C 04:02=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon Sep 7, 2026 at 12:21 PM PDT, Weiming Shi wrote:
> > An LWT_SEG6LOCAL program can invalidate its cached SRH with
> > bpf_lwt_seg6_adjust_srh() and then call bpf_skb_pull_data(). The latter
> > may reallocate skb->head, leaving the per-CPU SRH pointer dangling.
> > Post-program SRH validation then writes through that pointer.
> >
> > BUG: KASAN: slab-use-after-free in seg6_bpf_has_valid_srh (net/ipv6/seg=
6_local.c:1411)
> > Write of size 1
> >  seg6_bpf_has_valid_srh (net/ipv6/seg6_local.c:1411)
> >  input_action_end_bpf (net/ipv6/seg6_local.c:1463)
> >  seg6_local_input_core (net/ipv6/seg6_local.c:1630)
> >  seg6_local_input (net/ipv6/seg6_local.c:1639)
> >  lwtunnel_input (net/core/lwtunnel.c:466)
> >  ipv6_rcv (net/ipv6/ip6_input.c:351)
> >
> > Give LWT_SEG6LOCAL its own bpf_skb_pull_data() implementation. Save
> > the cached SRH offset before the skb operation and rebuild the pointer
> > from the current skb->data afterwards. Since pulling data can replace
> > storage but does not change packet layout, this preserves the identity
> > of the cached SRH even when multiple Routing Headers are present.
> >
> > Refresh the pointer even on error because __pskb_pull_tail() can replac=
e
> > the head before a later step fails. Preserve the pending hdrlen and val=
id
> > state so SRH validation semantics remain unchanged.
> >
> > Fixes: 004d4b274e2a ("ipv6: sr: Add seg6local action End.BPF")
> > Reported-by: co+adfca3e91be95776@bugs.sh
> > Closes: https://lore.kernel.org/all/GCy0KRM2IcQGoJQTjJEU9D0maBxXzEDHuQp=
q@bugs.sh/
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:gpt-5
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> >  net/core/filter.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 61940e7535523..e61f9e9226b10 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -7162,6 +7162,32 @@ static const struct bpf_func_proto bpf_lwt_seg6_=
adjust_srh_proto =3D {
> >       .arg2_type      =3D ARG_ANYTHING,
> >       .arg3_type      =3D ARG_ANYTHING,
> >  };
> > +
> > +BPF_CALL_2(bpf_lwt_seg6_pull_data, struct sk_buff *, skb, u32, len)
> > +{
> > +     struct seg6_bpf_srh_state *srh_state =3D
> > +             this_cpu_ptr(&seg6_bpf_srh_states);
> > +     unsigned int srhoff;
> > +     int ret;
> > +
> > +     lockdep_assert_held(&srh_state->bh_lock);
> > +     if (!srh_state->srh)
> > +             return ____bpf_skb_pull_data(skb, len);
> > +
> > +     srhoff =3D (unsigned char *)srh_state->srh - skb->data;
> > +     ret =3D ____bpf_skb_pull_data(skb, len);
> > +     srh_state->srh =3D (struct ipv6_sr_hdr *)(skb->data + srhoff);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct bpf_func_proto bpf_lwt_seg6_pull_data_proto =3D {
> > +     .func           =3D bpf_lwt_seg6_pull_data,
> > +     .gpl_only       =3D false,
> > +     .ret_type       =3D RET_INTEGER,
> > +     .arg1_type      =3D ARG_PTR_TO_CTX,
> > +     .arg2_type      =3D ARG_ANYTHING,
> > +};
> >  #endif /* CONFIG_IPV6_SEG6_BPF */
> >
> >  #ifdef CONFIG_INET
> > @@ -9052,6 +9078,8 @@ lwt_seg6local_func_proto(enum bpf_func_id func_id=
, const struct bpf_prog *prog)
> >               return &bpf_lwt_seg6_action_proto;
> >       case BPF_FUNC_lwt_seg6_adjust_srh:
> >               return &bpf_lwt_seg6_adjust_srh_proto;
> > +     case BPF_FUNC_skb_pull_data:
> > +             return &bpf_lwt_seg6_pull_data_proto;
>
> Instead of adding new support that no one will use, just disallow this he=
lper from lwt_seg6.
>
> pw-bot: cr

Thanks for the review. I will incorporate your feedback and send v2.
