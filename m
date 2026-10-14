Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1723830BB8A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980604; cv=none; b=XEcxokdqtxRILLvBkSiE2Ft5ixTUMTPWYfVNhEh5qjlk0YqMnu04sq42A4Pt5Dpn/vhqhjgUuLjjB8F1z79JrSZ0cNE3jMDBrhlz6dZtLC8xPyHcR0SvzP5WKK4oIf2/u4b5foBzoER+9PZ3Pb5+ICDlcPZgLd+hr24bAsNe6QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980604; c=relaxed/simple;
	bh=LGBdctOmvvIVrLuXQSrTW/+PFmnhHmoBs+V1xWc9um4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/1uM14wrGYJUHPD7xt4HN4nNipHWKRi08KNnhOsxbmQbAcs9ro2u9wGILBFNpiNIUaDKgtukIPqBGm8h+IZk50CTJU71fNKfSGCnGV1PROffVNaTs1zrUt1vN719OUFb0k2jSGn7ktxWajvIROOz1WCzt4PmyguN++xAPhDPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmBkgVBX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmBkgVBX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso8042425e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980601; x=1792585401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4BADLztXaEJdEwQTOk0OSPANXCsIBwgCFRmb5IowGp0=;
        b=qmBkgVBXk2CAW6AonAtYuCKtJkuXVvbuPqz/bmqvyvBvsV6lvA6R/GtNulZYpKP/xG
         dR9XtZN4YSV0NSx1pzuBYydkKj5juRd0GSOd1mMDQD3pj4OtF8XX1vueK2Vk4TlTH14J
         TdPaZoXgTTvGTwnw7Z+J2jQv0z79Wid+ZVHVRwNdvD1FcZW6LAUw0IE1PKz4hS60+t1E
         raTzyM8tGEPVAwnuZICXVsy1DqgUCaM+ojzIoXilo6ihoVX2AsLr5VywO2ftLBldZFDJ
         UebBoQa3lTR1wWOZkgi14z5pLxnPEu8IKmRbjmZdzRJeYhia4lns7/B6PB3d45jHrtJ6
         O6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980601; x=1792585401;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BADLztXaEJdEwQTOk0OSPANXCsIBwgCFRmb5IowGp0=;
        b=FKu+EbrS6qg69/m36cwcXtCfsEuXvB+yHZYBjQUJzvje4k1z23MAwFViNimlvZ8IQU
         xt3+WVfY0kCuX8QkPnqkZPkXRq9ksr3aEkwDU7qUIBpunP+im359whQ8+4bN5nU8qbTN
         eSDjyLMQzbT9J5tgFk51w8X9YubZIQva+NOkNGm3S5JJLFiIOyQdUCaxwkMmD9Wao4AY
         l6aePcS0ew19G3zesc6+jFksqeXVSLxvD1DgW57mbmMbIMQcT84cYa47Bwq+u81DqkrY
         y5dZQBr+E2SKA18HCqDX+z9s9JvnxbRJs6FxG9lbggeDExHsI6hZGxb8MEo55iqxbm5W
         8dwA==
X-Forwarded-Encrypted: i=1; AKwUvByjpwdW6PZDmJUNgWa8MngZZCqJxTsaJtygAyVKw34EKTcf1cwqSuILyCp29QSn6eeDFecSEKAiDwIBmnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzfuY4q+RKixO3wko+YtqatIdKA9eEoXklEu/RvNcCw0BgzT/9
	9nq46YHolwZOn8A3wuUQI8Iu+CMIUCCILDh/YlwUN3QMfAodvszSs+hBJ0lY3rb/
X-Gm-Gg: AYBFou1dlQfCV/qkjsjj02K6ruBXpL+K2pld7xU84RUHWoA77CaZ1m3dXHjFLeH9TMx
	nTZSMk2vmQbvVEAzNFwlaBTgeiRTBmOcUZedIB5PuCuZ+PzIUIPxWU79QwjA4WcBjKnkceiPjDu
	hNorGoyRPK5KrLB3V6a7fq5J0HbS6MJOLJT9gEft52+10sg3U16uBB6eAQwOnokOknQ9RVWuuvl
	SJGUMLXyZhEtOTRd6JH1AsOmS9ytDklLN7fDDsrSrUm0QQ6gIwK1fHmEumjUFPc7ceD8Y9OmpmK
	qjuXHiP321lM1eDGunG9L0yyTpIv9WAYeMvY2zXnYmWxVIfFsNV13VxBUux1RsjFNwDW0gSCOse
	xZ4Ka5DtD+ghGmcjBxnhgwtGGGlrglqZ/uvkK3QknrbE/b8dbc1/AHQuxoSu5DI0tf1nAVC4+j4
	gJngRNJBZXI0twyf9Q8UmWOAz7v60iGn+0oVPPFEmYILfwzJPG9XldgrIArd5ns0HsprHVLfj2Z
	gsntQLxo3EKb+oJCtvx7rvaHFwXrEyvCOY=
X-Received: by 2002:a05:600c:5391:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1ac6671c7mr103340965e9.4.1791980601016;
        Wed, 14 Oct 2026 05:23:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm589186955e9.11.2026.10.14.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:23:20 -0700 (PDT)
Date: Wed, 14 Oct 2026 13:23:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, fmancera@suse.de,
 willemb@google.com, kees@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Subject: Re: [PATCH net] ipv6: Keep the SCTP provider alive through socket
 allocation
Message-ID: <20261014132319.734ca449@pumpkin>
In-Reply-To: <pm-ip-core-objects-candidate-0001-v2-efc0e8a00d4f22c36ab8@gmail.com>
References: <pm-ip-core-objects-candidate-0001-v2-efc0e8a00d4f22c36ab8@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 12:42:15 +0800
Cen Zhang <zzzccc427@gmail.com> wrote:

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

Isn't this the same basic problem than lets a second sock_create() call
enter the protocol code before initialisation is complete and then hit
all sorts of invalid pointers.
That is a real problem that doesn't require module load to fail (it doesn't)
or module unload to happen at an unexpected time (I doubt anyone really
unloads sctp - it could even be marked not-unloadable?)

David

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
>     Code: 85 c0 0f 8e 93 04 00 00 44 8b 74 24 18 0f 1f 44 00 00 41 bf ff ff
>     ff ff 65 ff 05 b5 e6 0d 09 65 4c 8b 2d a5 e6 0d 09 4c 03 2b <41> 0f b6
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
>     Code: 8b 54 24 08 64 48 2b 14 25 28 00 00 00 75 05 48 83 c4 18 c3 e8 ba
>     a7 00 00 66 2e 0f 1f 84 00 00 00 00 00 b8 29 00 00 00 0f 05 <48> 3d 01
>     f0 ff ff 73 01 c3 48 8b 0d a9 29 0d 00 f7 d8 64 89 01 48
>     RSP: 002b:00007ffed24e4ab8 EFLAGS: 00000246 ORIG_RAX: 0000000000000029
>     RAX: ffffffffffffffda RBX: 00007ffed24e4bd8 RCX: 00007ff3c231b437
>     RDX: 0000000000000084 RSI: 0000000000000005 RDI: 000000000000000a
>     RBP: 0000000000000002 R08: 0000000000000000 R09: 00007ff3c2413aa0
>     R10: 00007ffed24e4800 R11: 0000000000000246 R12: 0000000000000000
>     R13: 00007ffed24e4bf0 R14: 00007ff3c2444000 R15: 000055b973e7cd48
>      </TASK>
>     Modules linked in: [last unloaded: sctp]
>     ---[ end trace 0000000000000000 ]---
>     RIP: 0010:kmem_cache_alloc_noprof+0xd6/0x600
>     Code: 85 c0 0f 8e 93 04 00 00 44 8b 74 24 18 0f 1f 44 00 00 41 bf ff ff
>     ff ff 65 ff 05 b5 e6 0d 09 65 4c 8b 2d a5 e6 0d 09 4c 03 2b <41> 0f b6
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
> index a9b8b4b42a1af72f09fb9544b0e13aade00a1e3d..fb7f84baeeb66f5d3926169df790cc439f98224f 100644
> --- a/net/ipv6/af_inet6.c
> +++ b/net/ipv6/af_inet6.c
> @@ -110,6 +110,7 @@ static int inet6_create(struct net *net, struct socket *sock, int protocol,
>  	struct sock *sk;
>  	struct inet_protosw *answer;
>  	struct proto *answer_prot;
> +	struct module *owner = NULL;
>  	unsigned char answer_flags;
>  	int try_loading_module = 0;
>  	int err;
> @@ -169,6 +170,17 @@ static int inet6_create(struct net *net, struct socket *sock, int protocol,
>  
>  	sock->ops = answer->ops;
>  	answer_prot = answer->prot;
> +	if (answer->protocol == IPPROTO_SCTP) {
> +		owner = answer_prot->owner;
> +		err = -EPROTONOSUPPORT;
> +		/* SCTP init can unwind despite an owner reference.
> +		 * Allow the kernel control socket during initialization.
> +		 */
> +		if (!kern && owner && module_is_coming(owner))
> +			goto out_rcu_unlock;
> +		if (!try_module_get(owner))
> +			goto out_rcu_unlock;
> +	}
>  	answer_flags = answer->flags;
>  	rcu_read_unlock();
>  
> @@ -176,6 +188,7 @@ static int inet6_create(struct net *net, struct socket *sock, int protocol,
>  
>  	err = -ENOBUFS;
>  	sk = sk_alloc(net, PF_INET6, GFP_KERNEL, answer_prot, kern);
> +	module_put(owner);
>  	if (!sk)
>  		goto out;
>  
> 

