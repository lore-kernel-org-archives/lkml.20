Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396D36166A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789806199; cv=pass; b=e++tC1vPt1byepnZoeRC1XvMUcwnENRBZ9Frn5e5gaIrErfjdLUi7s04Ji5isb+/q42X7QqvnuUEnhCfKziGNY9KFWmf9Bcy5TQ3/LXCGSsVS9NW6J98ge31eVHa+5kCRctobPefC06dxX1DUQqQGHhrFi8PLdTpQcacZNsI9UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789806199; c=relaxed/simple;
	bh=kk4x1LYc907tCEo0ovqTiZfCVDl9FyDlgEWQ0QccuFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tx8APR4fVJHAu6VEoUJORdeWzzOsn6zrLVOjWTO/p5jp1bG2nND2FfjTzCxiE0BoPmHD3CmcHxKaiBB9+kXVnuEIQSbZAItg9wbFnmZSuFalxqM5BrCD3mUuEJPFKq42fSPFWWFsyeAFzaTMcMxwZkCzR93ak/Mic8mXTe1s4yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa1ATDn5; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa1ATDn5"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so2123954a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789806196; cv=none;
        d=google.com; s=arc-20260327;
        b=Be+gtB49W5o4Q3RrC8GC8a6CPFDmg2JndFc7cDxqvvXJGpdPKJaDqIKaMwbbX7ZLTU
         9o/eNLzmYKfcCyPE3MLT9Fqo7UYN7+uz9WKr8Xpv1AKvqzgqn0ZZpaUhg803sOwJQTzo
         YhE6j3qDOa2hkb+fmAQUqjz+tyP361Rk3OKl6XQHw9d9x4UIgozYD1IPbQCWRcFGr8qh
         3unNnc49sWcJl70W/zNrwEmUUz4mmLspUrvCaz87DC2UQyt5p7+6a34uxVWtu6huCUCD
         6rbWW82pWsEAcg1U1ErK3oPZ6CVOala6cSAFb8S/GWMS1mP+BVLYGiVYYYrVdQ1UQ7Bp
         +RUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhlRYBu557OkzNkvBXKWSwkb6fE3+wI2R2RMdVzmiUI=;
        fh=0d990oJfRd/umUnJl/6UXtHrhkLOC9jNREaOIeXVyWE=;
        b=mjITCsTY47XtKJBKKZe7eSTcPpi6vcGqgSN48F6Tklt9w3uXdSIocYclxTcr3WrLGk
         JtMusjru8RgoNCILLN1Es1EClH/X9YzkhbTSntydRpk4x1RhJyVsTTNRVe8lQfksLFJJ
         W6xbS3fbcNs8L0qXKA+P7eERPvUAb9VpvUZgc/FNBB3ZVkv7v+yA4JeVnUL6isRCg3lM
         4MauQuWpEK8XKrgQ56rytWzoc3i3Wsc8+PiqJ1nnAcacmrdZoovrGEtIxiBKo4dT9IDL
         RO5SY0370U0RFZ0hE+6u9tfy/ufjLiHoweiugUr118K8SeWKPGQk/9DOUTXOJoErfPgr
         gYqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789806196; x=1790410996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhlRYBu557OkzNkvBXKWSwkb6fE3+wI2R2RMdVzmiUI=;
        b=Fa1ATDn5/hpo3E3bZ3UJDa26K7g9kNssTiX4Ia8+sElZIZcbH/J+IP1vSBax9E/W5L
         tEUcTfM+Nf7JIpnlMhk8dvE/hGhfHbQSw9RdRYrGF4SmbpUCP31mcMPzYUajQi3w4a1O
         PI3ouqVq7EYWAlPLvj5PQhQLSoFAhLmkcTAHpDwvzPXXaR7DdaMRZPOkUw3APGuc0lDA
         KM0lIZ0W9UVChnbn4Qbibvpj4OPBW29FuGQ5EqjBh9gk31yRhpyWGRYuvhDpGcJfDiiu
         /uZEKiy6BieqZIBadSAKiIyPMUclebG5rwRhiD7QB/zbrK++h12E3WVxMmKTc66P9HrR
         +tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789806196; x=1790410996;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhlRYBu557OkzNkvBXKWSwkb6fE3+wI2R2RMdVzmiUI=;
        b=Jb+sU9mtCqQKpxz7TS2Tc3yiy2Fvgp43f75ph7GYzkyJkG9PQy+cZ9rlTACJti6XiF
         Wm1cerroucQTCojFxa8Xhx4PUImusU7PXYdb2HazFHziIzwduiOZF079UR9dABBSD5/1
         gfN+yVxsFt5CjKqnHbGjeWjssnWgV+Uf3hLxiGEnwvjJ7ZMyosUQWwbShS+CgY0IpdIx
         S+etkqy/jefCXHxhO/np0VKRjmEHhe9p+MlHKhKZ3yn7dURRqScm5DrbmzBoepZaaVZ5
         xdqg+IvSJGzNmreAv+15MiKOuKpMJ1uG+fUV1+N75O1DFeLWUImjjGNAhO5Bp4hN1Z07
         nSfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnckLh64E4JxIuohWkTlM5832GeLn7a0itrB4y+yUCpWbaB6Db1PWd0vvax/2cR53pSnYN7OLqDjuQhtM=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ+NGEjCaQUX8vJ/mU+QUN1RGPlKuGCw/fTIfvIK7/qqq2INtU
	KeGYoD2iB6gn6VjxIlsjPxuaM3WkojqnxDfpf2/AFAy34rvK3ZQeo/VfJV70E3ka018b2gd/Gsw
	P6eK0ReXk4BzEDHPNwmHvHfCHb+O3lto=
X-Gm-Gg: AYBFou3F/+S081rFS3/56/UacEKaui5X6TAEcW8y1BlOFwuAS2F3XdH8PhXKqCpoHT6
	ZOpBSdA5TqrXanpo9ubFPD21HYMDu2AYHJWaDqHBxdAYS4m2ansSfMkAp4SUa5Y12PsBgcbFTeL
	AnY2hTX5LO7LP4gfCv2ZbATLwJ+JYIxdhNTcgAokUtPZ/HbPs5I1iUKxgLtptk1u/jTjnT+orbQ
	gytJB3ahxPmJNG/Z8kHdRHEjEPnsK7/6QV6cDl9qdfl4/xm35lhgIFYpKpumk80pkm8l5W47tq9
	h9grmLqJvLcvnFQZQbvjA1SmSCFKEjw7Q7NmD/ImGA5WDdctKT0268vjz0s5oyH00+oi8H55hn2
	GccQy7WDjpwp+
X-Received: by 2002:a05:6402:5111:b0:6a9:ab6a:640f with SMTP id
 4fb4d7f45d1cf-6aa531c28c8mr3352559a12.37.1789806195879; Sat, 19 Sep 2026
 01:23:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916170406.1280954-2-bestswngs@gmail.com> <48990076-414c-4196-99b9-86fce41b8054@iogearbox.net>
 <97695bef-507a-403a-84ae-c2e222b3dc65@iogearbox.net>
In-Reply-To: <97695bef-507a-403a-84ae-c2e222b3dc65@iogearbox.net>
From: Weiming Shi <bestswngs@gmail.com>
Date: Sat, 19 Sep 2026 16:22:39 +0800
X-Gm-Features: AcwNN1U6CAvWtS7Q9Hn-LstPLSzG1EhMZ9wcKAF-zq7_4r0l3w8GEVySnFsv_ws
Message-ID: <CANgPUi2g4HiCi1dVw+Xpoed7UJJakSiuaFLxToTNO595osed6w@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: clear stale IPv4 options after LWT encapsulation
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Peter Oskolkov <posk@google.com>, Xiang Mei <xmei5@asu.edu>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel Borkmann <daniel@iogearbox.net> =E4=BA=8E2026=E5=B9=B49=E6=9C=8818=
=E6=97=A5=E5=91=A8=E4=BA=94 02:54=E5=86=99=E9=81=93=EF=BC=9A
>
> On 9/17/26 8:24 PM, Daniel Borkmann wrote:
> > On 9/16/26 7:04 PM, Weiming Shi wrote:
> >> bpf_lwt_push_ip_encap() rebases the network header after prepending an=
 IP
> >> header, but leaves IPCB(skb)->opt describing the inner IPv4 header.  A=
n
> >> ingress LWT route can consequently make an ICMP error interpret an
> >> inner-header byte as an option length and copy 255 bytes into 40 bytes=
 of
> >> stack storage.  The trace decoded with scripts/decode_stacktrace.sh is=
:
> >>
> >>    BUG: KASAN: stack-out-of-bounds in __ip_options_echo
> >>    Write of size 255
> >>    Call Trace:
> >>     <IRQ>
> >>     __asan_memcpy (mm/kasan/shadow.c:106)
> >>     __ip_options_echo (net/ipv4/ip_options.c:96)
> >>     __icmp_send (net/ipv4/icmp.c:949)
> >>     ip_forward (net/ipv4/ip_forward.c:176)
> >>     lwtunnel_input (net/core/lwtunnel.c:465)
> >>     ip_rcv (net/ipv4/ip_input.c:612)
> >>     __netif_receive_skb_one_core (net/core/dev.c:6264)
> >>     process_backlog (net/core/dev.c:6728)
> >>     __napi_poll (net/core/dev.c:7787)
> >>     net_rx_action (net/core/dev.c:8007)
> >>     handle_softirqs (kernel/softirq.c:645)
> >>     do_softirq.part.0 (kernel/softirq.c:546)
> >>     </IRQ>
> >>     <TASK>
> >>     __local_bh_enable_ip (kernel/softirq.c:473)
> >>     __dev_queue_xmit (net/core/dev.c:4961)
> >>     packet_sendmsg (net/packet/af_packet.c:3143)
> >>     __sys_sendto (net/socket.c:2281)
> >>     __x64_sys_sendto (net/socket.c:2288)
> >>     do_syscall_64 (arch/x86/entry/syscall_64.c:84)
> >>     entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> >>     </TASK>
> >>
> >> A helper-only reset can be restored by bpf_prog_run_save_cb(), while a
> >> program without ctx->cb[] access can clone-redirect the skb before a
> >> return-only reset.  Track active LWT runs and their control-block fami=
ly
> >> in the BPF network context.  When the control block is not BPF scratch
> >> space, save its original contents and reset it immediately so clones s=
ee
> >> the new-family layout.  After the program returns, restore that snapsh=
ot
> >> when the verdict continues through the original protocol callback, the=
n
> >> invalidate the stale header metadata.  Verdicts that reroute or redire=
ct
> >> keep the new-family layout.
> >>
> >> Preserve the state across nested runs and retain the ingress interface=
 and
> >> L3-slave state when the protocol family changes.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 52f278774e79 ("bpf: implement BPF_LWT_ENCAP_IP mode in bpf_lwt_=
push_encap")
> >> Reported-by: Xiang Mei <xmei5@asu.edu>
> >> Assisted-by: LLM
> >> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> >> ---
> >> v2:
> >> - Save the incoming protocol control block for programs without ctx->c=
b[]
> >>    access.
> >> - Restore that snapshot before a verdict continues through the origina=
l
> >>    protocol callback, then invalidate the rebased header metadata.
> >> - Keep the eager new-family reset for clones and final reroute/redirec=
t
> >>    consumers.
> >> - Add Cc: stable@vger.kernel.org.
> >> - Correct the patch author and reporter attribution.
> >> v1:
> >> - https://lore.kernel.org/bpf/20260915170147.3943392-2-bestswngs@gmail=
.com/
> >
> > Hm, this is way too much fragile churn for a feature which I'm not sure=
 is much
> > used (?). Can't we just save/restore the skb->cb when the BPF prog runs=
? Roughly
> > sth along these lines (untested) :
> >
> > diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
> > index da49364ec63d..9cf04b44ecc1 100644
> > --- a/net/core/lwt_bpf.c
> > +++ b/net/core/lwt_bpf.c
> > @@ -36,10 +36,24 @@ static inline struct bpf_lwt *bpf_lwt_lwtunnel(stru=
ct lwtunnel_state *lwt)
> >   #define NO_REDIRECT false
> >   #define CAN_REDIRECT true
> >
> > +static void bpf_lwt_reset_cb(struct sk_buff *skb)
> > +{
> > +    if (skb->protocol =3D=3D htons(ETH_P_IP)) {
> > +        memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
> > +        IPCB(skb)->iif =3D skb->skb_iif;
> > +    } else if (skb->protocol =3D=3D htons(ETH_P_IPV6)) {
> > +        memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
> > +        IP6CB(skb)->iif =3D skb->skb_iif;
> > +        IP6CB(skb)->nhoff =3D offsetof(struct ipv6hdr, nexthdr);
> > +    }
> > +}
> > +
> >   static int run_lwt_bpf(struct sk_buff *skb, struct bpf_lwt_prog *lwt,
> >                  struct dst_entry *dst, bool can_redirect)
> >   {
> >       struct bpf_net_context __bpf_net_ctx, *bpf_net_ctx;
> > +    bool encap =3D skb->encapsulation;
> > +    u8 cb_saved[BPF_SKB_CB_LEN];
> >       int ret;
> >
> >       /* Disabling BH is needed to protect per-CPU bpf_redirect_info be=
tween
> > @@ -48,7 +62,12 @@ static int run_lwt_bpf(struct sk_buff *skb, struct b=
pf_lwt_prog *lwt,
> >       local_bh_disable();
> >       bpf_net_ctx =3D bpf_net_ctx_set(&__bpf_net_ctx);
> >       bpf_compute_data_pointers(skb);
> > +
> > +    memcpy(cb_saved, bpf_skb_cb(skb), sizeof(cb_saved));
> >       ret =3D bpf_prog_run_save_cb(lwt->prog, skb);
> > +    memcpy(bpf_skb_cb(skb), cb_saved, sizeof(cb_saved));
>
> ... also needs BPF selftests obviously; dropping the memcpy and a closer =
look wrt
> freplace, whether we should reuse & propagate ->cb_access=3D1 also from t=
here.
>
> > +    if (!encap && skb->encapsulation)
> > +        bpf_lwt_reset_cb(skb);
> >
> >       switch (ret) {
> >       case BPF_OK:
>

Hi,
Thanks for the suggestion. I'll simplify the fix, handle cb_access for
freplace, add BPF selftests, and send a v3.
