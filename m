Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0233EE1E4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338468; cv=pass; b=QRRk0XFPl+y4ZgZC1YgSo65QTYFZdiWFLgs6hrC7V75omqpLzfwAxMwGcgu4rQLyOYFeEp5gar5nmXB8B0mmgsZkpw0u5RJEEzdU4uUMgxvX+S5hfYUM2U9DbsY48sI/W84lEW1QDnyUFUyINypqLNIraKhzUB4DHX83SjZ3LCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338468; c=relaxed/simple;
	bh=jkWIY3udtZZRb8lw4kxCrUxrBW7jyULq79fv8n5JJzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9kmx9rfQ0yQnIc1Pk85jI72TgedZhcbdO8ai8q4mhPeGSlzwfofuye+AV2Rtxmi+1uv30dsDKWe2onIHQ25L2KdM31EK4huckV3csWSVNPCTnXzQXqHaBvAoaGzI5vaRK+jCMPAdeB90VXjvwt1SBv3rC0KwxM71HA0faLPZ6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=YbMot/xI; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="YbMot/xI"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66d116f0de8so824291d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338462; cv=none;
        d=google.com; s=arc-20260327;
        b=X5f3eSBStyJVWa+41Hyy+HbL0CeBfh6C515F0Jl6tclwHvELcdhxPMiEl/Da6VHTgY
         SI7lcaAf74/Yw2VgbXCHXcMRfaksglM97z4WNFzkDmjVOMzDItZ3YKrtvGQDx0Zwx8o2
         17dbeos54oTjKypm9kzuzvgVpJPj9Ex/qFSqTrPH2gxAkKdjV4dtF1tdlxUnYp0hpD/A
         1MX+dvkmWNOQlWpNyUIifCcjKcDKHtX1aQikw0YslVZOuGr6LlYrDhg6ImFqLCmtPfZv
         bHaaosVaNsHZN2hrAHhmJXFkvt6D0fOGB5DBr6jm7iv+13gbVbOpENmz3aqg26BbitPq
         iPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gn/PodDNlHyu2XMgKBC3NN98inh8T+HBS24GhLkIXic=;
        fh=jgXRWf3AXSbpxJxP1DTgmJzOWH9oYC9Ihk67v+haJsk=;
        b=cv6P/mhH+xNL0oXTRO7I0dOv8ri3dTfhH+PlnI4nmZ1Yw9AYz/ZsEGllADK8YGHi+K
         RyjTLRpSlBfy6dLk3kbi1BhaN2CckJyv6/NuFOHoUOrsV2dhCVC9sSNsl4D6H1Mjs4Ls
         JnXSRFiHly262IW8j2hX7baefQMEX+mfrwOrPcpzH17zt3nyBbXH2VOwvjGFbqN2ySCx
         fRzdvCG+EAHyDXKoK+adcHqPWE1N1UEgbbx+mXBOlscxhimBg2eG9/zjACa2RMQbZiaF
         eo8dis0qSOXit/kTAngn7nqgv6YMdB/5l04xZjlwgJTre8FiX08nrlZgX6q7HtLpfxac
         KMcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788338462; x=1788943262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gn/PodDNlHyu2XMgKBC3NN98inh8T+HBS24GhLkIXic=;
        b=YbMot/xIZlodH1rZqKBZnHuT3sljMDsGTbnHRv5a305DSAD7Mm1HbZfSaip+EZZfc+
         9SaXgDfiquVwjg3964W8HVPgFzF5Q/E96bgeywmKxg/g9TbQ8Kjd/7cO6AKwdlmsMarA
         74CkOQJ+MnuIi/soPRvpwwVAmVXUyuB0ugV8kT4FSDRMzE5lXKG7XHi4lp8X2KshC33F
         o17cicMzDXoHpUtUl5QCsl7lVZvaXT3mXoh/WR4OB4tGkwsv0pw7FONVM2WToip6QMpd
         GQSR8zmIftUkTERNgLKXbB4AWcCEayrOGMbysDENqQ/gjN8CevJw8LJIa4pC76hXWk1W
         eEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338462; x=1788943262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gn/PodDNlHyu2XMgKBC3NN98inh8T+HBS24GhLkIXic=;
        b=f6Tm+eGr5v9JRcva262/eyOnkR+q/BK3VbEoiCBF19+th7iQBr6/OWURbZNHlbpwW+
         sshWNOhMER7YsqpoYBVNEcegBWZ4RZTDh83694alPXR8bK3mO/Fazigyo5qyIRXmUhtH
         fhdcd/mS3oWxRFEcz8Pjoba3EZTBWFDn8xWowBH7SUDq44Cj/nKG098MPlL6MY2yBxh4
         T0b2fKLv3jjB6aeuYfOcd0y4oggvYH5vN+Opovys/hOFRYBE1CkRyUrmwx2sgOhNYObj
         Jv9VTMPv6Qar/jjeQMPLX7avpGePpkDBTXeRTmrheQlAVcKsoXFiwpsoe3+HaG5p9m7M
         7uxA==
X-Forwarded-Encrypted: i=1; AKwUvBz68WeExRDcipN7l1i2Y44F4DEFoRzodH4CKTRe8LO8RsCyhMYnQYY4DA0xCd/Swl3H4EW1icMsNY6a8Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++n1+klFgvnkcdcuDTMlsEio60BZD8vJxqmICwWXOmpqmtT5T6Dv
	E2IWLughHtmXRj5WTlV3QurnB+OI2pbcI+7PMGwKMZD85zd6gOq2iA55U3YKpvrfWT35SoqFzJ6
	JBostL3xkwa3iaaZEsVY20pIKqSPAYwVkRkPyQU3rQA==
X-Gm-Gg: AYBFou2DQ9pZAs6BeyIyr24VunkO8HZy5t9RjlA0jrOv6GkBAr8grMAp4dj2jhSyQWm
	fQu0duZ+YQfdehE2uD0+p+u86IBUe0bnrqmWnzjoWrvD6LkJcqpm36ZjJz3Ar4s4YecmnrHjxMJ
	BN+t7wt8VvPu/U78R2eO58FVyGjeA8DlQxAPQUyKciafakai5XJLkK0Xm2DYl1FhZcc4Xopewvz
	w1hwj2QZG9ycM/FYc8XNTFD3S02RsHKoUweee6uz1ELkt/St54PJ1mSA0kCN8SPMsc65EeLVlhW
	cN8GL9NnTj3QPAV6lKkrHwNpp+OagJlXwq3yFhVMtUb3
X-Received: by 2002:a05:690e:414a:b0:66f:8e57:f686 with SMTP id
 956f58d0204a3-66f9bd49ac9mr1062357d50.27.1788338462303; Wed, 02 Sep 2026
 01:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817155009.232670-3-zirajs7@gmail.com> <a3b7fa69a751733385d988051afe4955f318ccf622e7f0496016a7e47ff64983@mail.kernel.org>
In-Reply-To: <a3b7fa69a751733385d988051afe4955f318ccf622e7f0496016a7e47ff64983@mail.kernel.org>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 2 Sep 2026 04:40:51 -0400
X-Gm-Features: AcwNN1URLpDrDtVXJ-rewiUt-0nRzNXWUeQydqfAsKceq9xs4XtO7HPWbUob_iY
Message-ID: <CABFh=a5nwYnjQ0-66Ccmf_G6-t2U8Ov5Q5kXNTgJzLWR3NXbOw@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Cover strparser self-pass
 forward allocation
To: bot+bpf-ci@kernel.org
Cc: zirajs7@gmail.com, john.fastabend@gmail.com, jakub@cloudflare.com, 
	jiayuan.chen@linux.dev, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrii@kernel.org, 
	eddyz87@gmail.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, rhkrqnwk98@gmail.com, daniel@iogearbox.net, 
	ast@kernel.org, martin.lau@kernel.org, yonghong.song@linux.dev, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Junseo,

Sorry for the late reply.

On Mon, Aug 17, 2026 at 12:52=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c b/to=
ols/testing/selftests/bpf/prog_tests/sockmap_strp.c
> > index 1d7231728eaf..c7ad21d0bbf4 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_strp.c
> > @@ -1,5 +1,9 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <error.h>
> > +#include <linux/inet_diag.h>
> > +#include <linux/netlink.h>
> > +#include <linux/rtnetlink.h>
> > +#include <linux/sock_diag.h>
> >  #include <netinet/tcp.h>
> >  #include <test_progs.h>
> >  #include "sockmap_helpers.h"
> > @@ -460,6 +464,171 @@ static void test_sockmap_strp_parser_reject(void)
> >       test_sockmap_strp__destroy(strp);
> >  }
> >
> > +/* Read sk_forward_alloc through inet_diag meminfo. */
> > +static int sockmap_strp_get_fwd_alloc(int sock, int *fwd_alloc)
> > +{
> > +     struct sockaddr_storage local =3D {}, peer =3D {};
> > +     struct sockaddr_in *local_in, *peer_in;
> > +     socklen_addr_len =3D sizeof(local);
> > +     char buf[1024];
> > +     struct {
> > +             struct nlmsghdr nlh;
> > +             struct inet_diag_req_v2 req;
> > +     } req =3D {
> > +             .nlh =3D {
> > +                     .nlmsg_len =3D sizeof(req),
> > +                     .nlmsg_type =3D SOCK_DIAG_BY_FAMILY,
> > +                     .nlmsg_flags =3D NLM_F_REQUEST,
> > +                     .nlmsg_seq =3D 1,
> > +             },
> > +             .req =3D {
> > +                     .sdiag_family =3D AF_INET,
>
> sockmap_strp_get_fwd_alloc() takes an arbitrary socket fd but hardcodes
> .sdiag_family =3D AF_INET and casts the sockaddr_storage results of
> getsockname()/getpeername() to struct sockaddr_in * without checking
> local.ss_family.
>
> For an AF_INET6 socket it would build a request from IPv4-shaped fields o=
f
> an IPv6 address and then fail the exact lookup, returning -ENOENT and
> causing a confusing test failure rather than a wrong-family diagnostic.
>
> This matters because every other subtest in this file is parameterised ov=
er
> AF_INET and AF_INET6 (test_sockmap_strp_pass(AF_INET6, ...) etc.), so thi=
s
> helper is a candidate for reuse in the v6 direction.
>
> Could the helper derive sdiag_family/idiag_src/idiag_dst from ss_family, =
or
> reject a non-AF_INET socket explicitly?
>
> > +                     .sdiag_protocol =3D IPPROTO_TCP,
> > +                     .idiag_ext =3D 1 << (INET_DIAG_MEMINFO - 1),
> > +                     .idiag_states =3D ~0U,
> > +                     .id.idiag_cookie =3D {
> > +                             INET_DIAG_NOCOOKIE,
> > +                             INET_DIAG_NOCOOKIE,
> > +                     },
> > +             },
> > +     };
> > +     int diag_fd, ret, err =3D -ENOENT;
> > +
> > +     if (getsockname(sock, (struct sockaddr *)&local, &addr_len))
> > +             return -errno;
> > +     addr_len =3D sizeof(peer);
> > +     if (getpeername(sock, (struct sockaddr *)&peer, &addr_len))
> > +             return -errno;
> > +
> > +     local_in =3D (struct sockaddr_in *)&local;
> > +     peer_in =3D (struct sockaddr_in *)&peer;
> > +     req.req.id.idiag_sport =3D local_in->sin_port;
> > +     req.req.id.idiag_dport =3D peer_in->sin_port;
> > +     req.req.id.idiag_src[0] =3D local_in->sin_addr.s_addr;
> > +     req.req.id.idiag_dst[0] =3D peer_in->sin_addr.s_addr;
> > +
> > +     diag_fd =3D socket(AF_NETLINK, SOCK_RAW | SOCK_CLOEXEC,
> > +                      NETLINK_SOCK_DIAG);
> > +     if (diag_fd < 0)
> > +             return -errno;
>
> A subsystem pattern flags this as potentially concerning: the new subtest
> adds an undeclared kernel-config dependency on the INET socket-monitoring
> interface and turns its absence into a test failure rather than a skip.
>

I think the bot feedback is all valid (also in the previous patch). We
should esp. address
the above since it would be a pretty nonbvious error to debug.

For the actual fix in the previous patch, the new code seems
significantly more complicated
than the previous iteration. Are we sure we can't keep the fix a bit simple=
r?

pw-bot: cr


> socket(AF_NETLINK, SOCK_RAW, NETLINK_SOCK_DIAG) fails with EPROTONOSUPPOR=
T
> when sock_diag is unavailable, and when inet_diag/tcp_diag is not built i=
n
> (or is a module that cannot be auto-loaded) inet_diag_lock_handler() /
> __sock_diag_cmd() reply with NLMSG_ERROR, which this helper maps to
> -EINVAL. Either way, the ASSERT_OK(err, "sockmap_strp_get_fwd_alloc") at
> test_sockmap_strp_self_pass_fwd_alloc() reports a failure that has nothin=
g
> to do with the sockmap/strparser behaviour under test.
>
> CONFIG_INET_DIAG and CONFIG_INET_TCP_DIAG do not appear in
> tools/testing/selftests/bpf/config or any of the per-arch config fragment=
s.
> They only default to y from net/ipv4/Kconfig, and are tristate, so a base
> config with =3Dm and no installed modules, or =3Dn, breaks the subtest.
>
> Should the config symbols be added to tools/testing/selftests/bpf/config,
> or should the code detect the missing capability and call test__skip() wi=
th
> a reason?
>
> [ ... ]
>
> > +/* Test strparser SK_PASS delivery to the same socket. */
> > +static void test_sockmap_strp_self_pass_fwd_alloc(void)
> > +{
> > +     struct test_sockmap_strp *strp =3D NULL;
> > +     char snd[4 * 1024];
> > +     int c =3D -1, p =3D -1;
> > +     int fwd_alloc;
> > +     int sndbuf =3D sizeof(snd);
> > +     int zero =3D 0;
> > +     char rcv;
> > +     int sent, recvd;
> > +     int map;
> > +     int err;
> > +
> > +     memset(snd, 0xa5, sizeof(snd));
> > +
> > +     strp =3D test_sockmap_strp__open_and_load();
> > +     if (!ASSERT_OK_PTR(strp, "test_sockmap_strp__open_and_load"))
> > +             return;
> > +
> > +     map =3D bpf_map__fd(strp->maps.sock_map);
> > +     err =3D xbpf_prog_attach(bpf_program__fd(strp->progs.prog_skb_par=
ser_one),
> > +                            map, BPF_SK_SKB_STREAM_PARSER, 0);
> > +     if (err)
> > +             goto out_destroy;
> > +
> > +     err =3D xbpf_prog_attach(bpf_program__fd(strp->progs.prog_skb_ver=
dict_pass),
> > +                            map, BPF_SK_SKB_STREAM_VERDICT, 0);
> > +     if (err)
> > +             goto out_destroy;
> > +
> > +     err =3D create_pair(AF_INET, SOCK_STREAM, &c, &p);
> > +     if (!ASSERT_OK(err, "create_pair"))
> > +             goto out_destroy;
> > +
> > +     err =3D xsetsockopt(c, SOL_SOCKET, SO_SNDBUF, &sndbuf, sizeof(snd=
buf));
> > +     if (err)
> > +             goto out_destroy;
> > +
> > +     err =3D xsetsockopt(p, SOL_SOCKET, SO_RCVBUF, &sndbuf, sizeof(snd=
buf));
> > +     if (err)
> > +             goto out_destroy;
> > +
> > +     err =3D xbpf_map_update_elem(map, &zero, &p, BPF_NOEXIST);
> > +     if (err)
> > +             goto out_destroy;
> > +
> > +     sent =3D send(c, snd, sizeof(snd), MSG_DONTWAIT);
> > +     if (!ASSERT_EQ(sent, sizeof(snd), "send"))
> > +             goto out_destroy;
> > +
> > +     recvd =3D recv_timeout(p, &rcv, sizeof(rcv), MSG_DONTWAIT,
> > +                          IO_TIMEOUT_SEC);
> > +     if (!ASSERT_EQ(recvd, sizeof(rcv), "recv_timeout") ||
> > +         !ASSERT_EQ(rcv, snd[0], "data mismatch"))
> > +             goto out_destroy;
>
> Does anything here confirm that the one-byte parser actually split the 4 =
KB
> write into many strparser messages?
>
> Reading a single byte and comparing it to snd[0] succeeds identically
> whether the stream parser/verdict programs took effect or not (a plain TC=
P
> socket returns the same byte). The only other assertion is sk_forward_all=
oc
> >=3D 0, which is trivially true when no self-pass clone was ever charged.
>
> If the setup silently stops exercising the path -- for example, a future
> change rejects a parse verdict of 1, the parser attach becomes a no-op fo=
r
> some reason, or the messages end up on the psock backlog and are dropped =
--
> the subtest degrades into a tautological pass and stops guarding the fix.
>
> > +
> > +     err =3D sockmap_strp_get_fwd_alloc(p, &fwd_alloc);
> > +     if (!ASSERT_OK(err, "sockmap_strp_get_fwd_alloc") ||
> > +         !ASSERT_GE(fwd_alloc, 0, "sk_forward_alloc"))
> > +             goto out_destroy;
>
> Can the asserted condition (sk_forward_alloc >=3D 0 while self-pass strpa=
rser
> clones are queued) fail on a fixed kernel?
>
> With the fix, sk_psock_skb_ingress_self_assign() does:
>
>     if (settle_fwd_alloc) {
>             sock_owned_by_me(sk);
>             if (!sk_rmem_schedule(sk, skb, 0))
>                     return -EAGAIN;
>     }
>     skb_set_owner_r(skb, sk);
>
> sk_rmem_schedule(sk, skb, 0) reserves only ceil(deficit / PAGE_SIZE) page=
s,
> leaving sk_forward_alloc in [0, PAGE_SIZE). skb_set_owner_r() then calls
> sk_mem_charge(sk, skb->truesize) for the full clone truesize.
> net/strparser/strparser.c gives every one of the ~4096 one-byte messages =
a
> skb_clone() of the original 4 KB skb, so truesize is ~4.8 KB per clone.
>
> Therefore, after every single clone charge, sk_forward_alloc is negative
> (roughly -(truesize - PAGE_SIZE) .. -truesize) on the fixed kernel too.
>
> The assertion only passes because the one recv() of 1 byte fully consumes
> the first message, and kfree_sk_msg() -> consume_skb() -> sock_rfree()
> uncharges exactly one truesize, cancelling the last charge and leaving
> sk_forward_alloc in [0, PAGE_SIZE).
>
> Any clone charged between that recv() and the inet_diag read makes the
> sampled value negative and the subtest fails even though the kernel is
> correct. Two realistic ways that happens:
>
> 1. Deferred strparser work. tcp_bpf_recvmsg_parser() calls tcp_data_ready=
()
> while holding lock_sock() when sk_receive_queue is non-empty
> (net/ipv4/tcp_bpf.c) -- exactly the behaviour the comment at the top of
> this file already documents for sockmap_strp_consume_pre_data().
> strp_data_ready() then queue_work()s the parse, which runs after recv()
> returns and charges more clones.
>
> 2. psock backlog. If any one ingress attempt returns -EAGAIN
> (sk_rmem_schedule() failing under memcg or global tcp_mem pressure -- the
> test intentionally piles ~20 MB of clone truesize onto one socket), the s=
kb
> is queued on psock->ingress_skb and from then on every message is charged
> asynchronously by sk_psock_backlog(), potentially after the recv().
>
> Could the test sample something that is monotone with respect to the bug
> instead: drain all 4 KB (so every clone is uncharged), or re-read/poll
> until the value settles, or assert on a value that the fixed kernel
> guarantees at all times?
>
> > +out_destroy:
> > +     test_sockmap_strp__destroy(strp);
> > +     if (c >=3D 0)
> > +             close(c);
> > +     if (p >=3D 0)
> > +             close(p);
> > +}
> > +
> >  void test_sockmap_strp(void)
> >  {
> >       if (test__start_subtest("sockmap strp tcp pass"))
> > @@ -482,4 +651,6 @@ void test_sockmap_strp(void)
> >               test_sockmap_strp_dispatch_pkt(AF_INET, SOCK_STREAM);
> >       if (test__start_subtest("sockmap strp parser reject pkt mod"))
> >               test_sockmap_strp_parser_reject();
> > +     if (test__start_subtest("sockmap strp self pass fwd alloc"))
> > +             test_sockmap_strp_self_pass_fwd_alloc();
> >  }
>
> [ ... ]
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/320450=
36810
