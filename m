Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1071138E8A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791834982; cv=pass; b=OqFA84TTVYHhx/tA3gKhmkunLqF+PyIbfCMsYlzJ2ewzpls5/wRg4x7jP74tizshRcuA+W1wdYdgrrsWVkk3QZI2DHBSdP6Q26h43Q0A3yeDjGS11//PLFfHb0ktgkJxwoc4uLZ/tnDXXg/5fY+MQyLZrxzQars4Zq9QYy5wTHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791834982; c=relaxed/simple;
	bh=nhEv4JUB9vCpQw4diAcOu7NdETPA5c2kiRkcyJ3lhf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmKPSQ7sBc/QBS/2IUJY7fmIdXwbcL49TTyMBqw2RC3RnhQBc5DKlvaIB7b9g96CZSrPdLgeh2dCR7dThYG5rfsMyLXGBZ3m8PQE6cLUETtlkNDs2Ysplw2kDmJwCQgwy2sfwZpMRkKRu0B6yb6lCqH7LNu4S2IK5i9L9uGpR0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZVgilZGO; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZVgilZGO"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-154e9d2d979so1473207c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791834979; cv=none;
        d=google.com; s=arc-20260327;
        b=moBBUimbhYT6N94ZHOBg0DbDFOeD+tAUUB3zXSo89YnHWW5y/OAeDyF+/wn7FXpl6D
         xrtEgtgRd0uoZ6vXfq+JBt0H6Ohqhy3RamP7HeW2vmcaSH+BdsfFLGZXweg02XPyrwJK
         CaNJnPQs0NYeX6rDvNumLzyPLk7VseCWtqVQ4To+EBLKQh8VIvgi1Q7IJLsIgglZXoos
         yW3F4aatdNhNold0JZJ+jA3YC5j+YoRyZVeeCsrETnxd0hXYHV0wC/qEskbQt4+ThRHQ
         tNiDRKALCCx9otQ6Ft8IYYuKFrwPXK2KdeqsE6tmQed4No76Sutwupd+5X6zcdjwx1ex
         venQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JxV16LcQ0Po5kaTO3n+WFwSYzxfnwNS+UY3ZW/oeJgg=;
        fh=tfIQoRUz7bLYzsLoOhiuuSiYkEcGoq1cOWwQ4dvx1Qo=;
        b=Abh3uQ7oJQgZcOzvdMKUW8HZ21YfvqrOMhHy0rt8uui08ivQccoOV5rDBSsUfzO+u0
         TLUpj985BP6kxwD82JPNe/7addQLxz+MTtjjURJA9kfm2so9MJgp5Gbny97Pi39IcWOh
         xfAzBngMHphIfYaRongEGZHtDbdqtjcGyuVVTYT35Llw1qc2Exl2iKbbbBKo0Xn8MoAU
         3BYbMISgck6HQ6ylAzo3Ukj3nUoun9YD0bEJslUUzK0u178umWRd/HdGCfyI0TjYyYjS
         F1D2W9Ns49CMIbvDH/v3jwj49fECP1k5O3+dDt4Hwu9t/QGPHAQnLgKKV4MNya6XnpuI
         6cxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791834979; x=1792439779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxV16LcQ0Po5kaTO3n+WFwSYzxfnwNS+UY3ZW/oeJgg=;
        b=ZVgilZGOrL+klLm968H5QyPZOFM0raB8sRTS+pHSQoiZy16QpKEp+EUGdBTnV5Gqy7
         qSQp28cZTDJdb+unCbeICR9lhsAlW0grG6tCOVtPEAMHy87fAfzgij/jJNvkP6D8xY0r
         2NIhOzf1Uc/wL3VLspZI3sCElJypveu2HnuT099C7V2OpJ/MMo5fpU3e8ggCLFwrW+V6
         +/qqz7Ryn8mTfGecQ2rLlljbuoQSxK3y2pFFhMwOh6Y8gmaceEIf7IPMcDLNjlrre+8N
         vqrmdfTFFiQivlBgdTFSzh7aWlWKnENpw1/Qg61v1KCv38EcYM7KD5LwMP6gO+QctE3p
         nn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791834979; x=1792439779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxV16LcQ0Po5kaTO3n+WFwSYzxfnwNS+UY3ZW/oeJgg=;
        b=yZQ9BSZ0u7mlNBtzlBkcVueoAbwVJ2LX3J6uy4AOSrXdHoEIR2M7EcYQd5kJIZU0wD
         7RKKmBh2ZbrwOH6pal8UOk+AuMVxOBkl4TyrFYIou36TF5UYyGXQ+fefV4wdzYWDsBT/
         L3exd3yV7ko89cjk88uJ9Y05uskqdKCO58auqmzlLmX70qgfPDptSsY6uhWAMZFo7Bll
         Yt+TwrIA+FGEzJZjoMuTZyLBgs7p7k570lo8JAQMLUvhf8icDuIooH8zW2zNTL23bvFA
         rBP8soFAdF7EpEhymHhPVfKHZrVGER5rWIB/Afg6EhCK59rXqHcv8ffD8R28zq8y7s1U
         q3ng==
X-Forwarded-Encrypted: i=1; AKwUvBzYP5Gg/shMaxOkl1R/n33bK0QmUUtAJ035Xc9aohuQ1z0urUhAUp/MjsuuVOiKr3P5o8unT5QC31vrY38=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9E4vnZyAbSxqXDr3C2yXfA1EuNDMPaiAWiu9pG6+h0QNoKA7G
	at8h+v1wp3M6KHBmScLHYoy/XsaBuUW6l6CLvzH6bkJeQsZZoVLjSWbpTHNFutL2HAQIJzrhdEp
	WtoMzf6UHDdJP5eL7ZVDHj0JrnXLkyVtkvUnUp/RWXiuWZp1FQtzxpP70PWg=
X-Gm-Gg: AYBFou1Tyr5lsfj7JTi/JPVvDTkG1y3ZYGR8KzK6+21ALBuP6T9IWcO/NoIJRLyxtiO
	U0igzFkDTbTCZea2F/uYYH26iJiTvlMPBDy/TS85w6v/rqOqEmml/8j9ctXC/R27lfdAtx4+izX
	+ikCd2ac8f+Pbp9Dh8lsUjJAv5Iahv1/EGemec6zqUzJtgiKNHmW6gztJ3yIDs/8SMnDWckvrkn
	NHZdJPorjL8PTpX98qzk0yQka2IU0DFNXLUjljTMijG42Y6i//AXT9UchtrPZ/0rp7FikKZc6vm
	IYpGxdDZYySKfaj1aFWA6b7+vXnpzTVv7c/4vC7WGJvAYESUJBBgU2mBHLdwzDW45KeqVwRWrYH
	iL9wMKQbmJ8mMQwRYCYnP7MVeRT+IDtHdeHAbBdzgbYtvMhiT1ZYZs7bynM+b5g+bn7MnkeARmd
	AIHOPsSCxlJlbHISr/YdprGg==
X-Received: by 2002:a05:701b:4242:20b0:14b:355e:2888 with SMTP id
 a92af1059eb24-16a160f503emr14876338c88.27.1791834978217; Mon, 12 Oct 2026
 12:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ip-core-objects-candidate-0001-v2-efc0e8a00d4f22c36ab8@gmail.com>
In-Reply-To: <pm-ip-core-objects-candidate-0001-v2-efc0e8a00d4f22c36ab8@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 12 Oct 2026 12:56:06 -0700
X-Gm-Features: AclHuK_rgUU3gmYD-NO5eHHKADH8wtZEDHsy1aVPpDpAy99kmxwZDrbvIM-M048
Message-ID: <CAAVpQUAHHZS+NyXwtc8z2TGVUDJvC23JCrY9ghvwzqOw6ZYzxQ@mail.gmail.com>
Subject: Re: [PATCH net] ipv6: Keep the SCTP provider alive through socket allocation
To: Cen Zhang <zzzccc427@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, fmancera@suse.de, willemb@google.com, 
	kees@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com, 
	Chengfeng Ye <nicoyip.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 9:42=E2=80=AFPM Cen Zhang <zzzccc427@gmail.com> wro=
te:
>
> The sctpv6_prot slab must remain alive through socket allocation.
> inet6_create() selects that proto under RCU, but drops RCU before
> sk_alloc(). sk_prot_alloc() obtains the owner reference only after
> allocating from the slab.
>
> SCTP publishes its IPv6 stream and seqpacket entries while its module
> is still COMING. A concurrent user socket can select an entry before
> register_pernet_subsys(&sctp_ctrlsock_ops), sctp_v4_add_protocol() or
> sctp_v6_add_protocol() fails. The subsequent initialization unwind
> removes both entries and destroys the cache without waiting for owner
> references.
>
> After the constructor captures the cache pointer, initialization can
> fail and destroy the cache before the allocator consumes that pointer:
>
>   User socket creation              SCTP module initialization
>   --------------------              --------------------------
>                                     publish IPv6 protosw entries
>   select sctpv6_prot under RCU
>   drop RCU
>   capture prot->slab
>                                     fail a later setup step
>                                     sctp_v6_protosw_exit()
>                                       unlink both entries
>                                       synchronize_net()
>                                       proto_unregister()
>                                         destroy slab cache
>   kmem_cache_alloc(saved slab)
>
> The allocator can then read retired cache metadata and fault. The grace
> period drains lookup readers, but the constructor has already left RCU.
> An early owner reference alone cannot prevent initialization failure
> from destroying the cache, since try_module_get() accepts COMING.
>
> The initialization-failure path follows from source inspection. The
> Oops below came from an unload experiment using a modified kernel with
> allocator bootstrap changes, scheduling instrumentation and SCTP's
> internal control socket omitted. With that socket present, its owner
> reference blocks ordinary unload. The experiment selected and captured
> the same cache that teardown destroyed; the seqpacket constructor then
> faulted before the allocator returned.
>
> Reject user SCTP sockets while the owner is COMING and take a temporary
> owner reference under the lookup's RCU protection before dropping RCU.
> User allocation then requires completed initialization, and the
> reference prevents normal module exit until sk_alloc() takes the
> socket's own reference or fails. Release the temporary reference in
> either case. Keep kernel control socket creation allowed during init,
> where SCTP's per-net registration orders construction and cleanup.
>
> KASAN report as below:
>
>     Oops: general protection fault, probably for non-canonical address
>     0xffff11036c3d1430: 0000 [#1] SMP KASAN NOPTI
>     KASAN: maybe wild-memory-access in range
>     [0xfff8a81b61e8a180-0xfff8a81b61e8a187]
>     CPU: 2 UID: 0 PID: 532 Comm: sctp-race-fixtu Not tainted
>     7.2.0-rc5-pmb-ipcore-functional-v2+ #1 PREEMPT(lazy)
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
>     1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     RIP: 0010:kmem_cache_alloc_noprof+0xd6/0x600
>     Code: 85 c0 0f 8e 93 04 00 00 44 8b 74 24 18 0f 1f 44 00 00 41 bf ff =
ff
>     ff ff 65 ff 05 b5 e6 0d 09 65 4c 8b 2d a5 e6 0d 09 4c 03 2b <41> 0f b=
6
>     45 30 84 c0 0f 85 11 04 00 00 41 c6 45 30 01 45 31 c9 41
>     RSP: 0018:ffff8881135dfcc0 EFLAGS: 00010287
>     RAX: 0000000000000001 RBX: ffff88810891ec80 RCX: dffffc0000000000
>     RDX: 0000000000000cc0 RSI: 0000000000000890 RDI: ffff88810891ec80
>     RBP: 0000000000000c00 R08: 0000000000000001 R09: 00000000000000bd
>     R10: 0000000000000028 R11: ffff888113e5ba00 R12: 0000000000000cc0
>     R13: ffff11036c3d1400 R14: 0000000000000000 R15: 00000000ffffffff
>     FS:  00007ff3c2206780(0000) GS:ffff88826b86a000(0000)
>     knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000055b973e7b10c CR3: 00000001158b5005 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? sk_prot_alloc+0x6f/0x2c0
>      sk_prot_alloc+0x6f/0x2c0
>      sk_alloc+0x37/0xb40
>      inet6_create+0x31b/0x1230
>      ? inet6_create+0x5a/0x1230
>      __sock_create+0x2c4/0x730
>      __sys_socket+0x141/0x210
>      ? __pfx___sys_socket+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? handle_mm_fault+0x12e/0x580
>      __x64_sys_socket+0x77/0xc0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7ff3c231b437
>     Code: 8b 54 24 08 64 48 2b 14 25 28 00 00 00 75 05 48 83 c4 18 c3 e8 =
ba
>     a7 00 00 66 2e 0f 1f 84 00 00 00 00 00 b8 29 00 00 00 0f 05 <48> 3d 0=
1
>     f0 ff ff 73 01 c3 48 8b 0d a9 29 0d 00 f7 d8 64 89 01 48
>     RSP: 002b:00007ffed24e4ab8 EFLAGS: 00000246 ORIG_RAX: 000000000000002=
9
>     RAX: ffffffffffffffda RBX: 00007ffed24e4bd8 RCX: 00007ff3c231b437
>     RDX: 0000000000000084 RSI: 0000000000000005 RDI: 000000000000000a
>     RBP: 0000000000000002 R08: 0000000000000000 R09: 00007ff3c2413aa0
>     R10: 00007ffed24e4800 R11: 0000000000000246 R12: 0000000000000000
>     R13: 00007ffed24e4bf0 R14: 00007ff3c2444000 R15: 000055b973e7cd48
>      </TASK>
>     Modules linked in: [last unloaded: sctp]
>     ---[ end trace 0000000000000000 ]---
>     RIP: 0010:kmem_cache_alloc_noprof+0xd6/0x600
>     Code: 85 c0 0f 8e 93 04 00 00 44 8b 74 24 18 0f 1f 44 00 00 41 bf ff =
ff
>     ff ff 65 ff 05 b5 e6 0d 09 65 4c 8b 2d a5 e6 0d 09 4c 03 2b <41> 0f b=
6
>     45 30 84 c0 0f 85 11 04 00 00 41 c6 45 30 01 45 31 c9 41
>     RSP: 0018:ffff8881135dfcc0 EFLAGS: 00010287
>     RAX: 0000000000000001 RBX: ffff88810891ec80 RCX: dffffc0000000000
>     RDX: 0000000000000cc0 RSI: 0000000000000890 RDI: ffff88810891ec80
>     RBP: 0000000000000c00 R08: 0000000000000001 R09: 00000000000000bd
>     R10: 0000000000000028 R11: ffff888113e5ba00 R12: 0000000000000cc0
>     R13: ffff11036c3d1400 R14: 0000000000000000 R15: 00000000ffffffff
>     FS:  00007ff3c2206780(0000) GS:ffff88826b86a000(0000)
>     knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 000055b973e7b10c CR3: 00000001158b5005 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Kernel panic - not syncing: Fatal exception
>     Kernel Offset: disabled
>     ---[ end Kernel panic - not syncing: Fatal exception ]---
>
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM
>
> ---
>
> diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
> index a9b8b4b42a1af72f09fb9544b0e13aade00a1e3d..fb7f84baeeb66f5d3926169df=
790cc439f98224f 100644
> --- a/net/ipv6/af_inet6.c
> +++ b/net/ipv6/af_inet6.c
> @@ -110,6 +110,7 @@ static int inet6_create(struct net *net, struct socke=
t *sock, int protocol,
>         struct sock *sk;
>         struct inet_protosw *answer;
>         struct proto *answer_prot;
> +       struct module *owner =3D NULL;
>         unsigned char answer_flags;
>         int try_loading_module =3D 0;
>         int err;
> @@ -169,6 +170,17 @@ static int inet6_create(struct net *net, struct sock=
et *sock, int protocol,
>
>         sock->ops =3D answer->ops;
>         answer_prot =3D answer->prot;
> +       if (answer->protocol =3D=3D IPPROTO_SCTP) {

Chengfeng Ye is working on the same issue, and this is not limited to sctp.
(see v3 for sctp)
https://lore.kernel.org/netdev/20261002173844.3537111-1-nicoyip.dev@gmail.c=
om/


> +               owner =3D answer_prot->owner;
> +               err =3D -EPROTONOSUPPORT;
> +               /* SCTP init can unwind despite an owner reference.
> +                * Allow the kernel control socket during initialization.
> +                */
> +               if (!kern && owner && module_is_coming(owner))
> +                       goto out_rcu_unlock;
> +               if (!try_module_get(owner))
> +                       goto out_rcu_unlock;
> +       }
>         answer_flags =3D answer->flags;
>         rcu_read_unlock();
>
> @@ -176,6 +188,7 @@ static int inet6_create(struct net *net, struct socke=
t *sock, int protocol,
>
>         err =3D -ENOBUFS;
>         sk =3D sk_alloc(net, PF_INET6, GFP_KERNEL, answer_prot, kern);
> +       module_put(owner);
>         if (!sk)
>                 goto out;
>
