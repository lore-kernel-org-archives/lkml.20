Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107B3A3E88
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780146; cv=none; b=Lyvv02Z3Z+IKxM4zLe0S/7uSR8lpfpvUXM/6yuG1zwEE64nb+Si4xIqHQDJ0JexFNyg9PyxaiMPJT52xeD4Ns90bV7nJFQLf2OGvcgnZg8/euzMYBUKravBw4FezUeDR/XAkAcMKoOWkTJIUDXt/QI3Vygjld6vUk003YS8wkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780146; c=relaxed/simple;
	bh=GGbtqy9UOM+uuV+ml/JHXJAAuToYr2sczExd7CJHO2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VMhxAxYdZvt2SwxosjOm9TRl/QHC/jYnQdlRZwS8d/VK7prlLKU9lWHDs1xWMVZmKUH98oX0h0wxftoIP+yLMfEHt4k705nNsi6T8vCsX52C4aRS7rSU2HXpYbYmSihgBiB6R2dFmUgkpsVh5fu//QLaWSPAoyFw/ZRlhv3KeDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMi2vIeC; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMi2vIeC"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so697534a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780143; x=1792384943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozzK8EoW5dqEncNltghHHKB5X3+la5JaiwOPozkxCnw=;
        b=HMi2vIeC2yXGrOi30QVUIMDEgorjJyUB0COmsyp3CQfHTRQZbzDWYuabxfVfkYEvoU
         jGnMobVwghpHaOcPOtOKr508feY/0uPqk3OVWEpJsRPpAI16JmUwSIMIyqnRtYglr1jz
         y+Jl2ieWHRbpv2SzWJ7aMcJclosqG2lrJYAoInHwDWfcTeCqt0PfD4sAEWfgQkJM5fu8
         JEmE2Rkp2c6q7TXnFjfrhVQiYt8uqmWumC1S/YGkuIyTkml0WLjsRVTfuUA3TURNbmlV
         1QRJvxC1w3h0KAPEK/Ly+2Gdy58k36dwT6igFTnQ9/Au80jVnxU5+ohUq4PJXcDk7yYb
         ov8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780143; x=1792384943;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozzK8EoW5dqEncNltghHHKB5X3+la5JaiwOPozkxCnw=;
        b=nZd2MX4lSydJRymEBRniJEuzydkmfJrAJvBWBii1xux/5sXIvMiTDJbYLMRlO5FHQd
         Z0dQxlrGTUUfz/+8nUV/4h0qgsFS19XwNacv+aXd5PpKZ3R1XLUpF07QQLsky3kX5rgz
         w9nt/W0S7qlDeXcr9x+GoZ7pgz0b4AgFj7kDlYFe3iV0xxq0zYaOsZQprXy2+A5lpjvX
         3j6nK5S39kNK8zRcgPNXsqhS431atDMzWjvQHTWb8yu7NEZsN76dFPFO69UIpPoD2jVM
         J0gxsyLLBR25me9+VLkKY8dNFdPrWdaUZgpCY5c5ckag39dv8FFa85ahuKBM3r65pobA
         v6Sg==
X-Forwarded-Encrypted: i=1; AKwUvBy77cEKdbQdmLifQjZi4LJhx6SUGqlVSk3T2foX64XeXew8nxRGTiqy7M2Hgn/J04t/JcrYyT7ASr5fPrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK/b0SYFfQA/Z/deZz0KYS0EVpOLVgrUYJJEmgeDcmNdxkdVs1
	5fARo7FcsCI4KNHWRIaBVC5g0O4lLFQvVXDkY3VaOvNVNoWudM5B+TeI
X-Gm-Gg: AYBFou0UUBmeR6wSSb5r+B4IsQ9hhDqlRNwm9Ktgy3N8240htxguz5HB8FHC2170JS2
	364E97OgkcTaB7Q2aJSjdBrMCMzvQeckIp1Jh6L3hqjwW5qhovuAZi2OHmBAZIHXCWS8dEdUzcS
	qODt8trHjpoExMxC7wzJvHKQ8AdUzpnqlXTmAdnYScjLvz11GKmRYYDw7NtoZKxKLsgWe/00bA5
	gzAkI7qT/67UUPkOlkykyrXaLNnJBMxdwkq7XivLKpZnv1jVwVr8Z5jLvYWnjGJhLu1Du8HE4af
	E8Ls1Bt1qjiXNAPMuRM2Zhge/FZHA1yd5beAOattAxNfTjpG3kU8qrBy1F2ElJwSkFxaMpkbzuo
	jXZC7lD3TYb3fIhJ6oYN39RRSdKj26yGQyIsDgXtZxEX3eK2DcFSbZbt4XzHloUW7zynNs8R+tq
	47SuOqCEOx8nTnsfewGHkdc4QAFN9JVvppbsX9jsYh9YVNRQnE1+PyZHVKHA6N9IaQoA==
X-Received: by 2002:a17:90b:2886:b0:3ab:3606:f281 with SMTP id 98e67ed59e1d1-3ab3a92f6c3mr6572110a91.47.1791780142662;
        Sun, 11 Oct 2026 21:42:22 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abdd5d09aesm4411902a91.7.2026.10.11.21.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:42:22 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	fmancera@suse.de,
	willemb@google.com,
	kees@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH net] ipv6: Keep the SCTP provider alive through socket allocation
Date: Mon, 12 Oct 2026 12:42:15 +0800
Message-Id: <pm-ip-core-objects-candidate-0001-v2-efc0e8a00d4f22c36ab8@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The sctpv6_prot slab must remain alive through socket allocation.
inet6_create() selects that proto under RCU, but drops RCU before
sk_alloc(). sk_prot_alloc() obtains the owner reference only after
allocating from the slab.

SCTP publishes its IPv6 stream and seqpacket entries while its module
is still COMING. A concurrent user socket can select an entry before
register_pernet_subsys(&sctp_ctrlsock_ops), sctp_v4_add_protocol() or
sctp_v6_add_protocol() fails. The subsequent initialization unwind
removes both entries and destroys the cache without waiting for owner
references.

After the constructor captures the cache pointer, initialization can
fail and destroy the cache before the allocator consumes that pointer:

  User socket creation              SCTP module initialization
  --------------------              --------------------------
                                    publish IPv6 protosw entries
  select sctpv6_prot under RCU
  drop RCU
  capture prot->slab
                                    fail a later setup step
                                    sctp_v6_protosw_exit()
                                      unlink both entries
                                      synchronize_net()
                                      proto_unregister()
                                        destroy slab cache
  kmem_cache_alloc(saved slab)

The allocator can then read retired cache metadata and fault. The grace
period drains lookup readers, but the constructor has already left RCU.
An early owner reference alone cannot prevent initialization failure
from destroying the cache, since try_module_get() accepts COMING.

The initialization-failure path follows from source inspection. The
Oops below came from an unload experiment using a modified kernel with
allocator bootstrap changes, scheduling instrumentation and SCTP's
internal control socket omitted. With that socket present, its owner
reference blocks ordinary unload. The experiment selected and captured
the same cache that teardown destroyed; the seqpacket constructor then
faulted before the allocator returned.

Reject user SCTP sockets while the owner is COMING and take a temporary
owner reference under the lookup's RCU protection before dropping RCU.
User allocation then requires completed initialization, and the
reference prevents normal module exit until sk_alloc() takes the
socket's own reference or fails. Release the temporary reference in
either case. Keep kernel control socket creation allowed during init,
where SCTP's per-net registration orders construction and cleanup.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address
    0xffff11036c3d1430: 0000 [#1] SMP KASAN NOPTI
    KASAN: maybe wild-memory-access in range
    [0xfff8a81b61e8a180-0xfff8a81b61e8a187]
    CPU: 2 UID: 0 PID: 532 Comm: sctp-race-fixtu Not tainted
    7.2.0-rc5-pmb-ipcore-functional-v2+ #1 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
    1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    RIP: 0010:kmem_cache_alloc_noprof+0xd6/0x600
    Code: 85 c0 0f 8e 93 04 00 00 44 8b 74 24 18 0f 1f 44 00 00 41 bf ff ff
    ff ff 65 ff 05 b5 e6 0d 09 65 4c 8b 2d a5 e6 0d 09 4c 03 2b <41> 0f b6
    45 30 84 c0 0f 85 11 04 00 00 41 c6 45 30 01 45 31 c9 41
    RSP: 0018:ffff8881135dfcc0 EFLAGS: 00010287
    RAX: 0000000000000001 RBX: ffff88810891ec80 RCX: dffffc0000000000
    RDX: 0000000000000cc0 RSI: 0000000000000890 RDI: ffff88810891ec80
    RBP: 0000000000000c00 R08: 0000000000000001 R09: 00000000000000bd
    R10: 0000000000000028 R11: ffff888113e5ba00 R12: 0000000000000cc0
    R13: ffff11036c3d1400 R14: 0000000000000000 R15: 00000000ffffffff
    FS:  00007ff3c2206780(0000) GS:ffff88826b86a000(0000)
    knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 000055b973e7b10c CR3: 00000001158b5005 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? sk_prot_alloc+0x6f/0x2c0
     sk_prot_alloc+0x6f/0x2c0
     sk_alloc+0x37/0xb40
     inet6_create+0x31b/0x1230
     ? inet6_create+0x5a/0x1230
     __sock_create+0x2c4/0x730
     __sys_socket+0x141/0x210
     ? __pfx___sys_socket+0x10/0x10
     ? srso_alias_return_thunk+0x5/0xfbef5
     ? handle_mm_fault+0x12e/0x580
     __x64_sys_socket+0x77/0xc0
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    RIP: 0033:0x7ff3c231b437
    Code: 8b 54 24 08 64 48 2b 14 25 28 00 00 00 75 05 48 83 c4 18 c3 e8 ba
    a7 00 00 66 2e 0f 1f 84 00 00 00 00 00 b8 29 00 00 00 0f 05 <48> 3d 01
    f0 ff ff 73 01 c3 48 8b 0d a9 29 0d 00 f7 d8 64 89 01 48
    RSP: 002b:00007ffed24e4ab8 EFLAGS: 00000246 ORIG_RAX: 0000000000000029
    RAX: ffffffffffffffda RBX: 00007ffed24e4bd8 RCX: 00007ff3c231b437
    RDX: 0000000000000084 RSI: 0000000000000005 RDI: 000000000000000a
    RBP: 0000000000000002 R08: 0000000000000000 R09: 00007ff3c2413aa0
    R10: 00007ffed24e4800 R11: 0000000000000246 R12: 0000000000000000
    R13: 00007ffed24e4bf0 R14: 00007ff3c2444000 R15: 000055b973e7cd48
     </TASK>
    Modules linked in: [last unloaded: sctp]
    ---[ end trace 0000000000000000 ]---
    RIP: 0010:kmem_cache_alloc_noprof+0xd6/0x600
    Code: 85 c0 0f 8e 93 04 00 00 44 8b 74 24 18 0f 1f 44 00 00 41 bf ff ff
    ff ff 65 ff 05 b5 e6 0d 09 65 4c 8b 2d a5 e6 0d 09 4c 03 2b <41> 0f b6
    45 30 84 c0 0f 85 11 04 00 00 41 c6 45 30 01 45 31 c9 41
    RSP: 0018:ffff8881135dfcc0 EFLAGS: 00010287
    RAX: 0000000000000001 RBX: ffff88810891ec80 RCX: dffffc0000000000
    RDX: 0000000000000cc0 RSI: 0000000000000890 RDI: ffff88810891ec80
    RBP: 0000000000000c00 R08: 0000000000000001 R09: 00000000000000bd
    R10: 0000000000000028 R11: ffff888113e5ba00 R12: 0000000000000cc0
    R13: ffff11036c3d1400 R14: 0000000000000000 R15: 00000000ffffffff
    FS:  00007ff3c2206780(0000) GS:ffff88826b86a000(0000)
    knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 000055b973e7b10c CR3: 00000001158b5005 CR4: 0000000000770ef0
    PKRU: 55555554
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: disabled
    ---[ end Kernel panic - not syncing: Fatal exception ]---

Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
Assisted-by: LLM

---

diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b42a1af72f09fb9544b0e13aade00a1e3d..fb7f84baeeb66f5d3926169df790cc439f98224f 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -110,6 +110,7 @@ static int inet6_create(struct net *net, struct socket *sock, int protocol,
 	struct sock *sk;
 	struct inet_protosw *answer;
 	struct proto *answer_prot;
+	struct module *owner = NULL;
 	unsigned char answer_flags;
 	int try_loading_module = 0;
 	int err;
@@ -169,6 +170,17 @@ static int inet6_create(struct net *net, struct socket *sock, int protocol,
 
 	sock->ops = answer->ops;
 	answer_prot = answer->prot;
+	if (answer->protocol == IPPROTO_SCTP) {
+		owner = answer_prot->owner;
+		err = -EPROTONOSUPPORT;
+		/* SCTP init can unwind despite an owner reference.
+		 * Allow the kernel control socket during initialization.
+		 */
+		if (!kern && owner && module_is_coming(owner))
+			goto out_rcu_unlock;
+		if (!try_module_get(owner))
+			goto out_rcu_unlock;
+	}
 	answer_flags = answer->flags;
 	rcu_read_unlock();
 
@@ -176,6 +188,7 @@ static int inet6_create(struct net *net, struct socket *sock, int protocol,
 
 	err = -ENOBUFS;
 	sk = sk_alloc(net, PF_INET6, GFP_KERNEL, answer_prot, kern);
+	module_put(owner);
 	if (!sk)
 		goto out;
 
