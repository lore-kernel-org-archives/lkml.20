Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436214;
	b=ZFl1Q44S5KxUyCy2znNZ3H64n4VaQwoifXHEIBM568BToCakOTtyGpbCAmLursysgO/c
	 AQZhTnRhUqwZw7yUzUKY+KfIR1Ak+aSj9SOvs96eo1y7GTSVXL6fjG1ws3zczuSKtDW/5
	 u3VeTVwGVGH8t/oP4f0qSt/woBK8N+oBTrOA2YXt4/KrIXUoai99k/U8AchIao1u1bk/H
	 UCfwymVi/7VpJQvnHKi0qIsRSbTWoNhGYLeR/ssQ3Zfjj0jvUXeWIMuM010foixozAPd6
	 4FV/GZSCcxP7TNHQJyPaBdltw1Vpc4a647cy6di952ZXBkV50pTyzox9qi1hrrLg7WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ad7gFIQdBQZKzkKCsOE/9mkrFdAk1a3efziNmDQqoYk=;
	b=Cr9gYoHpC0blhNp370pqJy/cBKEpazdz6sgITQcohLEmExaloU5Kfpshtq4tkY4aD3Yf
	 lcznamHcWdTF09Vws79INjMTKjF1ADQGe7GMXFrNbJlCydtyUp7mJq9ryH9HnhsNwKIeW
	 rzP2O++xw1cP5fQS4gN4qD14jTd/vSmyL5hU66L5jPY0eKbj33kUYlXPDd7qDggT8yiYL
	 iBIHpNRua7K0B8nTvQcVG7EdArTGMW6n64hrsN67VTM9nzDt9VsBRG9CMFyfNdX57reFB
	 QnNHMXSuH58Psh3FnviyKTVjrmc6NxWLtgZqIeejy9eCfEbRFL73paPLo/KXG84geHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDWGI5ul;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E6B606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDWGI5ul
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0759so751347f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793436212; x=1794041012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad7gFIQdBQZKzkKCsOE/9mkrFdAk1a3efziNmDQqoYk=;
        b=gDWGI5ul7OPLpHwRY/foqogofpQSVG6INHe0USsjKb961EtCT7nDj4a6B3yTS+dW0Z
         /RETt4vAROFvGI3DRN21HTlVMvmp4CIUi7Th+/xnvj8M3r3MEoqMTKPBpe9S+tCaTb73
         n/XlQdOgT9i3vU5S5U98/LhcnIXq9LDWrX5adZUrxam995+tiFurTBecyqeA6abOh8TF
         WdauYPBz6UActVTI59z18M4Th380HWDSyVFx7s9b8J5MYqClAZ/YKR4lrh62lNMJw/yA
         LngZV2B2l3ZSfprlljxsu0nCNCUvo8FYjNm9lwunW1xLJBhPU4m5P63MJD31M5YkIXzU
         5xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793436212; x=1794041012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad7gFIQdBQZKzkKCsOE/9mkrFdAk1a3efziNmDQqoYk=;
        b=emfLfbSqOJ/i0MiV5j/+kc8XB59MBjxYYRzNCPYT7Ovd0i+K1WVAF3e0Otly6F9B1w
         +yTkzQKNWL8LBszSvfTk1Pd2bAvmxkuCKZMPDwrAq9WFGq5rZR8OmrYzdRkdqX9UWQk2
         5u+9jCZh7nRnSB2nRVphT9ct+DRkjzUNjvsiTSypK1antctpHD0Z+h9sbexUOq6uokFx
         ahwqaBK1mznv0YopODlh0SNocpDDCeKeWAIOT8BJNdVQWGZer6RN3FXSOGnILn+oLbfs
         vKwFEjXdhnxpFAX8WWfoEQ3WzO6E8i7jnYOknCF7AZumsE8pUzSDKQpGT0tXWIB6qUPn
         QK5A==
X-Forwarded-Encrypted: i=1; AKwUvBy69R+i+RxnVEMYO+9qodm46Oh8qx13wA10o3crQ2jC6vAfaOZ1ftQa5Tj4k5rJ29Fq3wQxNJhUzrhCjDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8Szlh/5BvST0TYI+hmV9OPwj8Q6/w6dD3TA1k2VnYpnISCwI7
	BprpGP4FuBH8Fu3FH+01hYza6BBpfu/tK2pQhWQD8zf9JRrDLvtMAINd3QZw7ZGf
X-Gm-Gg: AYBFou3HuBWgBkw8huYOWgQgibxHGFa8BU3cUcV51A0oIE6LoiYFLMAsbIcsDmZNfxi
	Z3EUkEs4UeUnfYAIrCmjWXGwa+ksyd3y8zetP2r+JgMCKzQ9pPVya4bPi75AnsbIYWBZJjzxCbY
	bjle2zR7yVI2RI2NAaXnSEZ6FFq8lTetzPs9FimvfJX9GVcaLxiPSj7Qxu+3GTmGG4CI8oZQYen
	0c1QKvBmj/zNJc+n4NsFIeOaODqI4PdmMMOE6vQrpHl/SP3cGMzZcSZTAtbHsVv3GzJ51SeV9+b
	9uVphfYYI6gU/kU7g6ECJqTLAMOHd6Cv/o16F0RMoHPEpDfT3iboGMTKKJ0uXQ4Nzp1ILJ21LtB
	HAmDp4CqfTrdvXIXPYS7sP1t0FV40ljP71YBBxO7Txydm8p8ff6eV/Wy2YRF5i9r6D/7WWZRWsM
	RAab4q/VlFcpKw4OVKmaX5u7HqKK5gkwCd1z0D+h+DuOKk9JCdDz2Z2JaqwkF0j3VajP9PScUGp
	RlouqIsl8bQQzOGpZmhxR78OODPSDlT9lskUxfuyzraU9w5krvLeaNQ4H/5PUP1vrUgSWuabVk7
	wDPKG82p2CpGk83mYLjb4c7eFNz64cu41H7JJBrDK+Mi7HQUDx9OMZEMZVIwg8qL6t2KezjoPpY
	gQhwg+nQ=
X-Received: by 2002:a5d:5e01:0:b0:48e:296a:27f7 with SMTP id ffacd0b85a97d-48e6e4fae29mr10390799f8f.24.1793436211428;
        Sat, 31 Oct 2026 01:43:31 -0700 (PDT)
Received: from pop-os.. ([51.36.40.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm8772221f8f.3.2026.10.31.01.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:43:30 -0700 (PDT)
From: Ahmad AG <ahmadag1001@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org,
	Ahmad AG <ahmadag1001@gmail.com>
Subject: [PATCH net v3] net/packet: account user-triggered allocations to memcg
Date: Sat, 31 Oct 2026 11:43:16 +0300
Message-ID: <20261031084316.387533-1-ahmadag1001@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A packet socket allocates memory for its user that is not charged to
the user's memory cgroup:

- PACKET_RX_RING and PACKET_TX_RING: the ring blocks themselves
  (alloc_one_pg_vec_page(), both the page allocation and the vmalloc
  fallback), the block array (alloc_pg_vec()), and the rx_owner_map
  bitmap of a TPACKET_V1/V2 RX ring. The size comes from the
  tpacket_req passed to setsockopt() and has no limit other than
  available memory.
- PACKET_FANOUT: the group created by fanout_add(), about 1 MB per
  group with max_num_members = 65536 (a 512 KB array, rounded up to an
  order-8 allocation) since commit 9c661b0b8544 ("net/packet: make
  packet_fanout.arr size configurable up to 64K").
- PACKET_ADD_MEMBERSHIP: one struct packet_mclist per distinct entry
  (packet_mc_add()), with no limit on the number of entries.

A process with CAP_NET_RAW, which an unprivileged user has in its own
user and network namespace, can therefore pin kernel memory far beyond
the memory.max of its cgroup. With memory.max set to 16M, a test
running as uid 1000 took 525508 KB of system memory with 64 sockets
each mapping an 8 MB TPACKET_V2 RX ring (1 MB blocks) while
memory.current grew by 1024 KB; 264832 KB with 256 sockets each
creating a fanout group with max_num_members = 65536 (memory.current
+512 KB); and 46000 KB with 100 sockets holding 2000 PACKET_MR_PROMISC
entries each on lo (memory.current +124 KB).

Allocate these with GFP_KERNEL_ACCOUNT, as other allocations a user
can make on demand in the networking stack already do, for example the
AF_XDP rings since commit b0057c68df71 ("xsk: account ring allocations
to memcg"). vzalloc() takes no gfp mask, so the vmalloc fallback becomes
__vmalloc() with __GFP_ZERO; it also takes __GFP_NOWARN, like the page
allocation before it and the pg_vec allocation, so that a ring that does
not fit, in the cgroup or in the system, fails with -ENOMEM and no
allocation warning. These
allocations scale with sizes or counts the user chooses. The small
fixed-size ones, the rollover state, the per-CPU TX pending counter and
the deferred-free work of a TX ring, are left unaccounted: there is at
most one of each per socket or ring, so the socket bounds them. skbs
are bounded by sk_rcvbuf and sk_sndbuf and are left as they are, as is
the per-packet zerocopy state in tpacket_snd(), which lives only as
long as its skb. struct packet_sock itself comes from sk_alloc(), and
the netdev_hw_addr entries that PACKET_MR_MULTICAST and
PACKET_MR_UNICAST add through dev_mc_add() and dev_uc_add() live in
net/core; neither is changed here.

With the change each of the three tests in the 16M cgroup is stopped
by the cgroup's OOM killer. With memory.max at 1G the rings charge
525436 KB for 525536 KB of system memory used, the fanout groups
262400 KB for 264608 KB, and the membership entries 26880 KB for 200000
entries. These figures are from a KASAN kernel, which inflates the small
objects. With 8 MB blocks, which always take the vmalloc fallback, a
32 MB ring charges 32636 KB for 32768 KB used (1G). In the 16M cgroup
the cgroup's OOM killer then acts; with oom_score_adj -1000, so that
nothing can be killed, ring setup fails with -ENOMEM and no vmalloc
allocation warning. A workload whose memory.max leaves no room for its
rings now sees ring setup fail or the cgroup's OOM killer act.

The missing charges were found by code inspection of net/packet/ with
the help of an LLM and then triggered with a small test program that
creates the sockets, rings, groups and entries and reads
memory.current; the numbers above are from that program. Tested in a
QEMU/KVM guest on the net tree (x86_64_defconfig plus kvm_guest.config,
KASAN, MEMCG, PACKET), running the test as uid 1000 in a cgroup v2
memory cgroup. tools/testing/selftests/net/psock_fanout, psock_tpacket
and psock_snd.sh pass before and after.

Reproducer, as uid 1000 in a cgroup v2 memory cgroup with memory.max
16M: unshare(CLONE_NEWUSER | CLONE_NEWNET), then 64 times:
socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL)); PACKET_VERSION
TPACKET_V2; PACKET_RX_RING with tp_block_size 1 MB, tp_block_nr 8,
tp_frame_size 2048, tp_frame_nr 4096; mmap the 8 MB ring and write
one byte per block. Compare the growth of memory.current with the
drop in MemFree. The other two tests replace the ring with one
PACKET_FANOUT group per socket (max_num_members 65536, 256 sockets)
or 2000 PACKET_MR_PROMISC entries on lo per socket (100 sockets).

The ring pages have never been charged to memcg, and the membership
entries and block array not since commit a9bb7e620efd ("memcg: only
account kmem allocations marked as __GFP_ACCOUNT"); neither has a
culprit commit. The Fixes tag covers only the fanout array growth.

Fixes: 9c661b0b8544 ("net/packet: make packet_fanout.arr size configurable up to 64K")
Cc: <stable+noautosel@kernel.org> # changes memcg charging of existing packet rings; not stable material
Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
---
Tool use: an LLM coding assistant (Claude Code) found the missing
charges by code inspection, drafted the patch, the test program and this
message, and ran the tests in the QEMU guest; I reviewed every hunk, the
results and this message before sending.

v3:
  - target net as Willem suggested; stable+noautosel instead of a stable Cc
  - Fixes: 9c661b0b8544 instead of 1da177e4c3f4
  - leave the fixed-size per-socket allocations (rollover, per-CPU pending
    counter, deferred TX ring free) unaccounted
  - add __GFP_NOWARN to the vmalloc fallback like the pg_vec allocation
  - give the reproduction steps and reword the Fixes rationale
v2: https://lore.kernel.org/netdev/20261030100504.23498-1-ahmadag1001@gmail.com/
  - cover all user-triggered allocations in one patch; sent with git send-email
v1: https://lore.kernel.org/netdev/CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com/

 net/packet/af_packet.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index cf6429f0947..3cec23a505b 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1778,7 +1778,8 @@ static int fanout_add(struct sock *sk, struct fanout_args *args)
 			/* legacy PACKET_FANOUT_MAX */
 			args->max_num_members = 256;
 		err = -ENOMEM;
-		match = kvzalloc_flex(*match, arr, args->max_num_members);
+		match = kvzalloc_flex(*match, arr, args->max_num_members,
+				      GFP_KERNEL_ACCOUNT);
 		if (!match)
 			goto out;
 		write_pnet(&match->net, sock_net(sk));
@@ -3773,7 +3774,7 @@ static int packet_mc_add(struct sock *sk, struct packet_mreq_max *mreq)
 		goto done;
 
 	err = -ENOBUFS;
-	i = kmalloc_obj(*i);
+	i = kmalloc_obj(*i, GFP_KERNEL_ACCOUNT);
 	if (i == NULL)
 		goto done;
 
@@ -4494,7 +4495,7 @@ static void packet_free_tx_ring(struct sock *sk, struct pgv *pg_vec,
 static char *alloc_one_pg_vec_page(unsigned long order)
 {
 	char *buffer;
-	gfp_t gfp_flags = GFP_KERNEL | __GFP_COMP |
+	gfp_t gfp_flags = GFP_KERNEL_ACCOUNT | __GFP_COMP |
 			  __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
 
 	buffer = (char *) __get_free_pages(gfp_flags, order);
@@ -4502,7 +4503,8 @@ static char *alloc_one_pg_vec_page(unsigned long order)
 		return buffer;
 
 	/* __get_free_pages failed, fall back to vmalloc */
-	buffer = vzalloc(array_size((1 << order), PAGE_SIZE));
+	buffer = __vmalloc(array_size((1 << order), PAGE_SIZE),
+			   GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN);
 	if (buffer)
 		return buffer;
 
@@ -4523,7 +4525,8 @@ static struct pgv *alloc_pg_vec(struct tpacket_req *req, int order, bool tx_ring
 	struct pgv *pg_vec;
 	int i;
 
-	vec = kzalloc_flex(*vec, pg_vec, block_nr, GFP_KERNEL | __GFP_NOWARN);
+	vec = kzalloc_flex(*vec, pg_vec, block_nr,
+			   GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
 	if (unlikely(!vec))
 		return NULL;
 	vec->order = order;
@@ -4648,7 +4651,8 @@ static int packet_set_ring(struct sock *sk, union tpacket_req_u *req_u,
 		default:
 			if (!tx_ring) {
 				rx_owner_map = bitmap_alloc(req->tp_frame_nr,
-					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
+					GFP_KERNEL_ACCOUNT | __GFP_NOWARN |
+					__GFP_ZERO);
 				if (!rx_owner_map)
 					goto out_free_pg_vec;
 			}

base-commit: 7b29287b182fc50518e9e65c41f86d24a05b7205
-- 
2.43.0

