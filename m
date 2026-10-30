Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793377545;
	b=ExnUXw9nXgUSn3QE+gg38DjRSYT6Go4MRvwXDkbq7ibdl+HPMAna1e/ksTo3+mkqWtdu
	 eliahaOuOQXr6BEUL63COWlx6dtL/uQ6w/mcmQwvR8HqmPCLcLxKBbuA+k7gxsxzvOYmE
	 DQotlMWuvljdmQO97LauRM9xOS1OH9dSDlG+blA0j7oD3va/MshcCgJq9G44QgoAb0M4R
	 +v5ctoMhk6ZH1a4aKSf4ookBydkNz+ggiKZLBup6cANsoZ2/s9MkKdSSTthk+Lz8NoY1m
	 mqKdjGLjCKdWEBkdrQBFVUnaUJx4lKdpykzSLSvIriWu3Oogc33bkbllneOHfTTMxVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kXy++yDe59dkKCjS5FUXLAaHk0TybWZRMjYhR93Bt6Q=;
	b=kO6Fsr4tcHM/ifXNbM+duKQSnCxzhTB8v0HQ4hFZ5N6Uf44ESKi7zZTwSDTpRt3J6p/u
	 IIUTZNbmFLv9CBOHlB2osDrI/Pn60TQqnz5p4Az8Jt6bl5kf0r4JTGOhozSSKHO9QlX1N
	 06AmqeYTSqC6qwBRSl9hZfppq84Ygt0Kmae/Ouy0Ik5yB5xAAR0sk1orwUnQlkGJlT09r
	 nviXNaVNDUpj7zrrC/WBLAfMk/sNAepz6S8/Lf63qZfnxlF/Q2aVQ7hHw98ZIK3+YLa2L
	 lxhAIGJR7nhvGVBIN5fpeFgoNVOOGCYvEVxrIyozc850Qp93IDyM06rAYYs2JN2QCYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/eDCmuH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE8606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CFE8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/eDCmuH
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6501825e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793377543; cv=none;
        d=google.com; s=arc-20260327;
        b=UMjBEFAtIlyOFI/vk2VXFyfIFaswwYYmztHh7dylQfxLZhaAjrViuNaw4D/z9IhBhZ
         UZgFA0hUzLJ4lcYOdMwgJfKpSZfCOcFzISnXEXOgJ8hjYJMJ59cAWarxMqpvt/MXMkAi
         VV8os5TV4gOAQl2UyxFTsEgmAKke9yCuxCY6RE+z3hrPMvk/OxkdgH7aypnVUtK0AeBt
         97ioEE+DSPAxv+gzo7QZaGdSJqZC7w6a20lnxKpdkJK6RBk9pYLmmLZPcndnh/9PTleR
         nAbLoan3shJ//COChvz28+GxXVtk71yHbRcIJfpSi1SbAeCVwia/IqpGtZ54LWpst9UY
         EhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXy++yDe59dkKCjS5FUXLAaHk0TybWZRMjYhR93Bt6Q=;
        fh=rdYj16PsAb++efqWhaLPQ5HWWyJHpt4+f3ZqxUaNMn0=;
        b=VDna47sPY2lcrbm6qEX2kY14cMofxXB+JFnfA+qJo8+V+VN3vdLaqCGC1Qj6++DL3n
         Y+aYOULwTWOdSjvoPNxpIyqU+qqZRTFrctKlKD5l6EscVMc8Vp/Gqaz0UahLqtYy6KMy
         +0k/QAa1YqMmPILr9WJoQXeTMbJcryI+qPv/ev7+wzPFxssimwZQU+e+zDaa+DP7GLtS
         IKytDNkoxwcFUqZLbF70kJpaI11pJwQCjxLyFEGED0igD88/XpNuR+F8AlF8Zhy57Otj
         76FH+uK1AqXQT30h7Uz4lVU3i79bT8YGNER+H7S/jb+JnWsTOAmLkSHHPEAhRljy/bB5
         l4hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377543; x=1793982343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXy++yDe59dkKCjS5FUXLAaHk0TybWZRMjYhR93Bt6Q=;
        b=x/eDCmuHK8pvg+qDnj2z9tmDOhhZNk3eWiLEJXiiksyOl4kNu/fhBlNxdc4gPgj5N/
         99T4VxZFAeN1jHypkkWKUpmycXH94wryXKR00EbNpKkp7Dt1bNmS+K+4asCIjLc5JWmY
         yVAdVmxHy6LM+qaprmRUIyDy2gzc6L7DP0OvJznW9KZWIJksqXWY2DxXcj8YG8GQBBP2
         dDEfWQZY22pVY6VWluv/Nu7CyG1vBT6lRQocSJQEcv/thS9O9lMWfpHvZFz5ZD0Yyhh5
         Ti/TblvmWJGXZrAO6yax/rJJVtbiqkjQR1LMkWyCHFQhZ6GiXIOXP6kfkao+fTHRIrJm
         AkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377543; x=1793982343;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXy++yDe59dkKCjS5FUXLAaHk0TybWZRMjYhR93Bt6Q=;
        b=G31eJSIIs0c5gMrW17ViLV+3iyeYkFPQGLx3a/AGkwphBYccTH8vIZpJ59+qfTBk8B
         p67rFBR4PLRByB1KmL0Im+7MK/7asi0zUa0G72cq4YrEcKhbmbhdIu/JLS3wfHfUnhgU
         gmwfS7yUt40A+CW0vyZrJCTnfNGF8eLC/RJr9zoPQfFGke1nkgcP0OOv3EViLUJWGNWq
         qNWc2yVqbd4GJDpZGmU6NNadIpiRkNbN1kQrlcWuzw3Hq67j1jUce7u5VOW/kjll6/ko
         xwn3dlkcOF5lM7olHCyDS0mkTnyw2oO12UAG0jRhJtApTQ0isfu6Pq4PsQ3iVOvILmiC
         rA9w==
X-Forwarded-Encrypted: i=1; AKwUvByc9sRzRhowKWSgNwqyrEU9PO7M7sQIEW5S4VCCVfHKk50426D9vDwWYr8q72uXMmPCjtdvpYUk/2KXg28=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWGsqV4e1kYwAzdA9LzDTOW1p7svkperXZruw/a5IYXldROkaT
	QJa8CuX+2beC6Sm/BjI/fGsb2MGXLNAvtF+0XcdmQSQUWPyCKr7b+yFWt8KwdztKGMjG7dPO074
	5IfBh/OQu8tiyudUatBsJ8ONXrJcoIPY=
X-Gm-Gg: AYBFou0i6xU4yjfc02nxqVScgzAnxE7SvenaDvagSOKuXXqnbiDqL+RFHPbiqDyPfW+
	+mgaHE4cz6JrYudA7oRfVslHFtgdv3V59ewBsTQ2OSE0XAu0YlNgYh1opu2yBp8MS/DxdMJltqu
	RcUJmfAWe0uhieG3m5XyaBa7A94In/mSj9w1nvrgXa2BrAxoJA8ggXNI4QemtxIG8AMs2ERtRRN
	yCEfsCpOHAhExhK+LAYgYJ6kAdKPau77kc/6Rb8lqcs6AWsA6DS5Hd4VTCkPBSwwCdt9ejtRRX0
	dcqDBVJ1EmOCYnmI4CJQfII5GiEmq5dhLa/ceUzG+TOIDXAZDkMV4/fwWA253uQOQayoFxFvr8Q
	qok+qqa2b9/Sxm7iqDILl4fAUo82TDbN6TjtLrX7W7GH9A8LFSvdEUxNIa17HLaO/hbSBbHOKH/
	MEsoFUTed8jXI8Kg+t
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id
 5b1f17b1804b1-4ac185bc1d2mr57388325e9.26.1793377542406; Fri, 30 Oct 2026
 09:25:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030100504.23498-1-ahmadag1001@gmail.com> <willemdebruijn.kernel.2e53c121ad9ea@gmail.com>
In-Reply-To: <willemdebruijn.kernel.2e53c121ad9ea@gmail.com>
From: Ahmad AG <ahmadag1001@gmail.com>
Date: Fri, 30 Oct 2026 19:25:30 +0300
X-Gm-Features: AclHuK9FiCD6Ap4_Z7bw5M7_2UvH5KvQ6q5xX-gBNx49bJGjnFmhulCDxxu_6J0
Message-ID: <CAASqGyYfFwZizof-O+Bn3_H85sEFytVr9GapOVQsW9miVa+Zsg@mail.gmail.com>
Subject: Re: [PATCH net v2] net/packet: account user-triggered allocations to memcg
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. I will send a v3 to net-next, without the Fixes and stable
tags, keeping the allocations that scale with user input (ring
buffers, fanout array, membership entries) and leaving the small
fixed-size per-socket ones such as the rollover state alone. I will
add __GFP_NOWARN to the vmalloc fallback.

On Fri, Oct 30, 2026 at 5:21=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Ahmad AG wrote:
> > A packet socket allocates memory for its user that is not charged to
> > the user's memory cgroup:
> >
> > - PACKET_RX_RING and PACKET_TX_RING: the ring blocks themselves
> >   (alloc_one_pg_vec_page(), both the page allocation and the vmalloc
> >   fallback), the block array (alloc_pg_vec()), the deferred-free work
> >   of a TX ring, and the rx_owner_map bitmap of a TPACKET_V1/V2 RX ring.
> >   The size comes from the tpacket_req passed to setsockopt() and has
> >   no limit other than available memory.
> > - PACKET_FANOUT: the group created by fanout_add(), about 1 MB per
> >   group with max_num_members =3D 65536 (a 512 KB array, rounded up to a=
n
> >   order-8 allocation) since commit 9c661b0b8544 ("net/packet: make
> >   packet_fanout.arr size configurable up to 64K"), and the per-socket
> >   rollover state.
> > - PACKET_ADD_MEMBERSHIP: one struct packet_mclist per distinct entry
> >   (packet_mc_add()), with no limit on the number of entries.
> > - socket(): the per-CPU TX ring pending counter
> >   (packet_alloc_pending()).
> >
> > A process with CAP_NET_RAW, which an unprivileged user has in its own
> > user and network namespace, can therefore pin kernel memory far beyond
> > the memory.max of its cgroup. With memory.max set to 16M, a test
> > running as uid 1000 took 525804 KB of system memory with 64 sockets
> > each mapping an 8 MB TPACKET_V2 RX ring (1 MB blocks) while
> > memory.current grew by 892 KB; 264640 KB with 256 sockets each
> > creating a fanout group with max_num_members =3D 65536 (memory.current
> > +512 KB); and 46664 KB with 100 sockets holding 2000 PACKET_MR_PROMISC
> > entries each on lo (memory.current +256 KB).
> >
> > Allocate all of these with GFP_KERNEL_ACCOUNT, as other allocations a
> > user can make on demand in the networking stack already do, for
> > example the AF_XDP rings since commit b0057c68df71 ("xsk: account
> > ring allocations to memcg"). vzalloc() takes no gfp mask, so the
> > vmalloc fallback becomes __vmalloc() with __GFP_ZERO. skbs are bounded =
by
> > sk_rcvbuf and sk_sndbuf and are left as they are, as is the per-packet
> > zerocopy state in tpacket_snd(), which lives only as long as its skb.
> > struct packet_sock itself comes from sk_alloc(), and the
> > netdev_hw_addr entries that PACKET_MR_MULTICAST and PACKET_MR_UNICAST
> > add through dev_mc_add() and dev_uc_add() live in net/core; neither
> > is changed here.
> >
> > With the change each of the three tests in the 16M cgroup is stopped
> > by the cgroup's OOM killer. With a higher memory.max the rings charge
> > 525436 KB for 524832 KB of system memory used (1G), the fanout groups
> > 262656 KB for 265128 KB (1G), and the membership entries 26880 KB
> > (1G). These figures are from a KASAN kernel, which inflates the small
> > objects; without KASAN the 200000 membership entries are 20480 KB
> > charged for 26412 KB used.
> >
> > The missing charges were found by code inspection of net/packet/ with
> > the help of an LLM and then triggered with a small test program that
> > creates the sockets, rings, groups and entries and reads
> > memory.current; the numbers above are from that program. Tested in a
> > QEMU/KVM guest on this tree (x86_64_defconfig plus kvm_guest.config,
> > KASAN, MEMCG, PACKET), running the test as uid 1000 in a cgroup v2
> > memory cgroup. tools/testing/selftests/net/psock_fanout, psock_tpacket
> > and psock_snd.sh pass before and after.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>
> This predates the introduction of memcg accounting and indeed
> much of the code that is being instrumented.
>
> I also don't think this is stable material.
>
> Especially on the actual ring buffers: retroactively enabling
> this may break existing users.
>
> Consider net-next. Else, net still needs a Fixes tag. Review how
> important each of the conversions is, keep the important ones, find
> the oldest one and use that as tag.
>
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude Code
> > Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
> > ---
> > v2: cover every user-triggered allocation in net/packet in one patch, a=
s
> > Willem suggested on v1, and resend with git send-email; the v1 mail had
> > tabs replaced and lines wrapped by the mail client. v1 changed only the
> > fanout group allocation.
> > v1: https://lore.kernel.org/netdev/CAASqGyZ-9hqZGWNJShxnrSiXDO=3D=3D51S=
VsQW_x_mk993y1pNO8A@mail.gmail.com/
> >
> >  net/packet/af_packet.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> > index 823e0911c91..06386db4c8e 100644
> > --- a/net/packet/af_packet.c
> > +++ b/net/packet/af_packet.c
> > @@ -1233,7 +1233,8 @@ static int packet_alloc_pending(struct packet_soc=
k *po)
> >  {
> >       po->rx_ring.pending_refcnt =3D NULL;
> >
> > -     po->tx_ring.pending_refcnt =3D alloc_percpu(unsigned int);
> > +     po->tx_ring.pending_refcnt =3D alloc_percpu_gfp(unsigned int,
> > +                                                   GFP_KERNEL_ACCOUNT)=
;
> >       if (unlikely(po->tx_ring.pending_refcnt =3D=3D NULL))
> >               return -ENOBUFS;
> >
> > @@ -1735,7 +1736,7 @@ static int fanout_add(struct sock *sk, struct fan=
out_args *args)
> >       if (type =3D=3D PACKET_FANOUT_ROLLOVER ||
> >           (type_flags & PACKET_FANOUT_FLAG_ROLLOVER)) {
> >               err =3D -ENOMEM;
> > -             rollover =3D kzalloc_obj(*rollover);
> > +             rollover =3D kzalloc_obj(*rollover, GFP_KERNEL_ACCOUNT);
>
> Is it worth accounting even such small ones?
>
> >               if (!rollover)
> >                       goto out;
> >               atomic_long_set(&rollover->num, 0);
> > @@ -1778,7 +1779,8 @@ static int fanout_add(struct sock *sk, struct fan=
out_args *args)
> >                       /* legacy PACKET_FANOUT_MAX */
> >                       args->max_num_members =3D 256;
> >               err =3D -ENOMEM;
> > -             match =3D kvzalloc_flex(*match, arr, args->max_num_member=
s);
> > +             match =3D kvzalloc_flex(*match, arr, args->max_num_member=
s,
> > +                                   GFP_KERNEL_ACCOUNT);
> >               if (!match)
> >                       goto out;
> >               write_pnet(&match->net, sock_net(sk));
> > @@ -3773,7 +3775,7 @@ static int packet_mc_add(struct sock *sk, struct =
packet_mreq_max *mreq)
> >               goto done;
> >
> >       err =3D -ENOBUFS;
> > -     i =3D kmalloc_obj(*i);
> > +     i =3D kmalloc_obj(*i, GFP_KERNEL_ACCOUNT);
> >       if (i =3D=3D NULL)
> >               goto done;
> >
> > @@ -4494,7 +4496,7 @@ static void packet_free_tx_ring(struct sock *sk, =
struct pgv *pg_vec,
> >  static char *alloc_one_pg_vec_page(unsigned long order)
> >  {
> >       char *buffer;
> > -     gfp_t gfp_flags =3D GFP_KERNEL | __GFP_COMP |
> > +     gfp_t gfp_flags =3D GFP_KERNEL_ACCOUNT | __GFP_COMP |
> >                         __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
> >
> >       buffer =3D (char *) __get_free_pages(gfp_flags, order);
> > @@ -4502,7 +4504,8 @@ static char *alloc_one_pg_vec_page(unsigned long =
order)
> >               return buffer;
> >
> >       /* __get_free_pages failed, fall back to vmalloc */
> > -     buffer =3D vzalloc(array_size((1 << order), PAGE_SIZE));
> > +     buffer =3D __vmalloc(array_size((1 << order), PAGE_SIZE),
> > +                        GFP_KERNEL_ACCOUNT | __GFP_ZERO);
>
> Consider adding __GFP_NOWARN here too, similar to the pg_vecs, to avoid
> excessive warning when enabling memcg accounting.
>
> >       if (buffer)
> >               return buffer;
> >
> > @@ -4523,7 +4526,8 @@ static struct pgv *alloc_pg_vec(struct tpacket_re=
q *req, int order, bool tx_ring
> >       struct pgv *pg_vec;
> >       int i;
> >
> > -     vec =3D kzalloc_flex(*vec, pg_vec, block_nr, GFP_KERNEL | __GFP_N=
OWARN);
> > +     vec =3D kzalloc_flex(*vec, pg_vec, block_nr,
> > +                        GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
> >       if (unlikely(!vec))
> >               return NULL;
> >       vec->order =3D order;
> > @@ -4532,7 +4536,7 @@ static struct pgv *alloc_pg_vec(struct tpacket_re=
q *req, int order, bool tx_ring
> >
> >       if (tx_ring) {
> >               vec->deferred =3D kzalloc_obj(*vec->deferred,
> > -                                         GFP_KERNEL | __GFP_NOWARN);
> > +                                         GFP_KERNEL_ACCOUNT | __GFP_NO=
WARN);
> >               if (!vec->deferred)
> >                       goto out_free_pgvec;
> >               vec->deferred->vec =3D vec;
> > @@ -4648,7 +4652,7 @@ static int packet_set_ring(struct sock *sk, union=
 tpacket_req_u *req_u,
> >               default:
> >                       if (!tx_ring) {
> >                               rx_owner_map =3D bitmap_alloc(req->tp_fra=
me_nr,
> > -                                     GFP_KERNEL | __GFP_NOWARN | __GFP=
_ZERO);
> > +                                     GFP_KERNEL_ACCOUNT | __GFP_NOWARN=
 | __GFP_ZERO);
> >                               if (!rx_owner_map)
> >                                       goto out_free_pg_vec;
> >                       }
> >
> > base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> > --
> > 2.43.0
> >
>
>
