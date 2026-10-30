Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354764;
	b=F5zhny8cjL0uvRDMPd4fe+JGxE4nbZUqe6gCvxWktY2CqUJLTpVNfL56xSS86zJ0t85l
	 5DF4iFESlbppSENiSLERMdaRDgecBX2WU/315qwt8VtcSPzmHFQ4WXOTqMGoEk0jV+BbX
	 GJTHo+3haikMt4MLpmaosvE40Km3luNl30fxiWQQeqUNzJz5Fv4JnncdyRUcdL6To58RH
	 +JqjRpY08SyQZR6kU0thGE/zbxFEPoV54H9tS1Q2KbkXxrziNv5DMCa+knUuzxmSTesxu
	 rZsCrC16xgDhaeVcly9jt97UN/2ZgwBcgqikwLPP4lUOPfmJZn3/vzIKgtrT+yX5EbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7+KhCK8nbtPPPnxE6PcA8d9mBVnldjGZ8TKiU45jN9I=;
	b=dcbSSNDoXw8G+NUllKZXwkWQHjTLPEWe4WD9puXqlFCnUQwdf3+yzXKTMZ2FPmPINf0m
	 wI5qlHAIe+aQBwmaT2m3cKxXHGGQ0+ou76mpcDuNMkK4jLFcqhCGkJPeA4/QZhPCwayAY
	 /EFT7pQRUk7GwTDlZ1iaBDErlDxAmt6+2s8PI2w7pxx0LW0pNvzV65Joa5HmmLnCfXpm+
	 Nq1Me9Gx5f8CzQZyCTGO78u9CgfUMdu2Z+/uiz3LktreyxxA8KeJ4CMn/+fV865RyVAAQ
	 bBMl7Hb54S+x3+E4gQBnklIZP4AgsNhcDLbvgEnwP8C9adlv/3yGezAP353Gs875KVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N56b1vMX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1AA606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1AA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N56b1vMX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so5155445e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793354761; x=1793959561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+KhCK8nbtPPPnxE6PcA8d9mBVnldjGZ8TKiU45jN9I=;
        b=N56b1vMXSyRiJ3dek2lXPsTDyEWeGyxYE8qkLlr466bV2HtDVFe2LiqTyjijM8Kkex
         EGPhi5UpnInWdVP6FIY1AFSpa7WBXfRV8exXn8u4xpikHUz5//hVElg5fmDoVUKa7pTv
         eGXeeO4+n69+qjDASlnHRfbVm0ccwDBNnXnYcl1sPE4HGA/dGiBBVv9uIoaQVDWakP2Y
         btKf1+AoydXDkRK69Yix2r5u5t0sDG6hnjEAflY/9MDWDXcvS6+WjKY2mdSd3mD2zMVH
         z80LPyF+TN0kFKImah9izUIyrwdgXZPb+MdoygOJGR5Ti/x2rrAczznuo0fK9y7Zlmm7
         C9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354761; x=1793959561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+KhCK8nbtPPPnxE6PcA8d9mBVnldjGZ8TKiU45jN9I=;
        b=w1rnWAWNMSuNjGVonYZTWzWWcBHUlzetmASi6xzC2iPRaBZNRkLlH9CI7flEXFbP/v
         MXr7et7QRFlv457iTZ731bZIXPApPSfHEYWXmmNtB7w6sk4hAhZlLoeFi6svrZomdHHy
         GfmqFoi4ktdYSe9DT/Y5VkS0YPv//g/+DIJIvq25ccYz/NdW7DBVtQ9BjPCbQHjtIyTl
         KStHlvgMwZfzWq69iNDWAK5HE9MuDHTnkaWmwHxk7l8ge5+wWEez/adJf1VH9OC5c5OM
         yv7MMgtMPoZ1MciFbrFhxClWFdBOfOsgvXw0qzPuAz+B5GP61tTDMQ+p8PYwzDC3hlEa
         /2rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRBe+6JCM14Kpmx03aVErsrCQf4e3Q8KwxYeHz6mZ3TLyGvi+D73riyN67dPlsbzTOpzXz+tWIJxOb/Y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwMhb2XCFb+ReVXhODjbuyaZyRBPICvKdP362NHOIHngI9ScXb
	N0yoeOAmo4nVNNEjcqL/ED9GsAym+N3gb6ZnmJ1j2hNyj2gK25DrzHOf
X-Gm-Gg: AYBFou2fC/hk9+qzTSAGBaMi5hqRJVo5knvT85X7a3TL0yXvEKIQDh6TI4skWjEIlPZ
	i2jrrH5rzPWUNkSnH3L+qmvvpTBSpk/ysQcOzEZYU8dqQZr6BtmikU0xAyMOiMhyXhyWnEcpHK7
	J7z1J6I94JbxSbsfrQVzF+pCS6hWk2QV/kwWO22Z2q6TZdn+z+14Cq2BiNNJGOb9NtDDnO0ak84
	gVawFJ6S2wqwoxxoDlSFAmUzXG2Tr/of+ezZvDNMdlidrZPD60FSR3Iys8CzcwmmxfRo9/+eAEO
	qK1bScqJQUbuVAXtg0xK0Un25CUFVyOTSmwSd/nMW6OL083U/YEAYiakRVvaKsP5L33XHjfLHI1
	Vrqa2VPpLDM+n5D3RYcDwcG4rcA4WLlRSIC0NhHbCH9okj6tUWII/lw2slC+CIEoPXG0suxqvsW
	n+XSqQEH1t1D57AnObZ0QQUWJO3bxotRUI2QtmTJZsZCPuy8U51g+iwZO1OWZPlUna49zBi4KpV
	csHTPZgm5itDakBflGrSkXqQfw5wu4dMrsnhEegqSP1B2tgtk5ysIvXGcvAiWLucqKGY2+XWfqW
	AKARDfP9kRzms1heOUcO50Ahvzlcy610YUB4gsBT30LYd/l6Lr3wAVDHLRcjn0JM1fAUpZrdoRN
	L2PFNack=
X-Received: by 2002:a05:600c:8b47:b0:4a2:1960:6db with SMTP id 5b1f17b1804b1-4ac185bc2aemr37877015e9.26.1793354761147;
        Fri, 30 Oct 2026 03:06:01 -0700 (PDT)
Received: from pop-os.. ([51.36.40.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm36175695e9.5.2026.10.30.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:05:59 -0700 (PDT)
From: Ahmad AG <ahmadag1001@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ahmad AG <ahmadag1001@gmail.com>
Subject: [PATCH net v2] net/packet: account user-triggered allocations to memcg
Date: Fri, 30 Oct 2026 13:05:04 +0300
Message-ID: <20261030100504.23498-1-ahmadag1001@gmail.com>
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
  fallback), the block array (alloc_pg_vec()), the deferred-free work
  of a TX ring, and the rx_owner_map bitmap of a TPACKET_V1/V2 RX ring.
  The size comes from the tpacket_req passed to setsockopt() and has
  no limit other than available memory.
- PACKET_FANOUT: the group created by fanout_add(), about 1 MB per
  group with max_num_members = 65536 (a 512 KB array, rounded up to an
  order-8 allocation) since commit 9c661b0b8544 ("net/packet: make
  packet_fanout.arr size configurable up to 64K"), and the per-socket
  rollover state.
- PACKET_ADD_MEMBERSHIP: one struct packet_mclist per distinct entry
  (packet_mc_add()), with no limit on the number of entries.
- socket(): the per-CPU TX ring pending counter
  (packet_alloc_pending()).

A process with CAP_NET_RAW, which an unprivileged user has in its own
user and network namespace, can therefore pin kernel memory far beyond
the memory.max of its cgroup. With memory.max set to 16M, a test
running as uid 1000 took 525804 KB of system memory with 64 sockets
each mapping an 8 MB TPACKET_V2 RX ring (1 MB blocks) while
memory.current grew by 892 KB; 264640 KB with 256 sockets each
creating a fanout group with max_num_members = 65536 (memory.current
+512 KB); and 46664 KB with 100 sockets holding 2000 PACKET_MR_PROMISC
entries each on lo (memory.current +256 KB).

Allocate all of these with GFP_KERNEL_ACCOUNT, as other allocations a
user can make on demand in the networking stack already do, for
example the AF_XDP rings since commit b0057c68df71 ("xsk: account
ring allocations to memcg"). vzalloc() takes no gfp mask, so the
vmalloc fallback becomes __vmalloc() with __GFP_ZERO. skbs are bounded by
sk_rcvbuf and sk_sndbuf and are left as they are, as is the per-packet
zerocopy state in tpacket_snd(), which lives only as long as its skb.
struct packet_sock itself comes from sk_alloc(), and the
netdev_hw_addr entries that PACKET_MR_MULTICAST and PACKET_MR_UNICAST
add through dev_mc_add() and dev_uc_add() live in net/core; neither
is changed here.

With the change each of the three tests in the 16M cgroup is stopped
by the cgroup's OOM killer. With a higher memory.max the rings charge
525436 KB for 524832 KB of system memory used (1G), the fanout groups
262656 KB for 265128 KB (1G), and the membership entries 26880 KB
(1G). These figures are from a KASAN kernel, which inflates the small
objects; without KASAN the 200000 membership entries are 20480 KB
charged for 26412 KB used.

The missing charges were found by code inspection of net/packet/ with
the help of an LLM and then triggered with a small test program that
creates the sockets, rings, groups and entries and reads
memory.current; the numbers above are from that program. Tested in a
QEMU/KVM guest on this tree (x86_64_defconfig plus kvm_guest.config,
KASAN, MEMCG, PACKET), running the test as uid 1000 in a cgroup v2
memory cgroup. tools/testing/selftests/net/psock_fanout, psock_tpacket
and psock_snd.sh pass before and after.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: Claude Code
Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
---
v2: cover every user-triggered allocation in net/packet in one patch, as
Willem suggested on v1, and resend with git send-email; the v1 mail had
tabs replaced and lines wrapped by the mail client. v1 changed only the
fanout group allocation.
v1: https://lore.kernel.org/netdev/CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com/

 net/packet/af_packet.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 823e0911c91..06386db4c8e 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1233,7 +1233,8 @@ static int packet_alloc_pending(struct packet_sock *po)
 {
 	po->rx_ring.pending_refcnt = NULL;
 
-	po->tx_ring.pending_refcnt = alloc_percpu(unsigned int);
+	po->tx_ring.pending_refcnt = alloc_percpu_gfp(unsigned int,
+						      GFP_KERNEL_ACCOUNT);
 	if (unlikely(po->tx_ring.pending_refcnt == NULL))
 		return -ENOBUFS;
 
@@ -1735,7 +1736,7 @@ static int fanout_add(struct sock *sk, struct fanout_args *args)
 	if (type == PACKET_FANOUT_ROLLOVER ||
 	    (type_flags & PACKET_FANOUT_FLAG_ROLLOVER)) {
 		err = -ENOMEM;
-		rollover = kzalloc_obj(*rollover);
+		rollover = kzalloc_obj(*rollover, GFP_KERNEL_ACCOUNT);
 		if (!rollover)
 			goto out;
 		atomic_long_set(&rollover->num, 0);
@@ -1778,7 +1779,8 @@ static int fanout_add(struct sock *sk, struct fanout_args *args)
 			/* legacy PACKET_FANOUT_MAX */
 			args->max_num_members = 256;
 		err = -ENOMEM;
-		match = kvzalloc_flex(*match, arr, args->max_num_members);
+		match = kvzalloc_flex(*match, arr, args->max_num_members,
+				      GFP_KERNEL_ACCOUNT);
 		if (!match)
 			goto out;
 		write_pnet(&match->net, sock_net(sk));
@@ -3773,7 +3775,7 @@ static int packet_mc_add(struct sock *sk, struct packet_mreq_max *mreq)
 		goto done;
 
 	err = -ENOBUFS;
-	i = kmalloc_obj(*i);
+	i = kmalloc_obj(*i, GFP_KERNEL_ACCOUNT);
 	if (i == NULL)
 		goto done;
 
@@ -4494,7 +4496,7 @@ static void packet_free_tx_ring(struct sock *sk, struct pgv *pg_vec,
 static char *alloc_one_pg_vec_page(unsigned long order)
 {
 	char *buffer;
-	gfp_t gfp_flags = GFP_KERNEL | __GFP_COMP |
+	gfp_t gfp_flags = GFP_KERNEL_ACCOUNT | __GFP_COMP |
 			  __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
 
 	buffer = (char *) __get_free_pages(gfp_flags, order);
@@ -4502,7 +4504,8 @@ static char *alloc_one_pg_vec_page(unsigned long order)
 		return buffer;
 
 	/* __get_free_pages failed, fall back to vmalloc */
-	buffer = vzalloc(array_size((1 << order), PAGE_SIZE));
+	buffer = __vmalloc(array_size((1 << order), PAGE_SIZE),
+			   GFP_KERNEL_ACCOUNT | __GFP_ZERO);
 	if (buffer)
 		return buffer;
 
@@ -4523,7 +4526,8 @@ static struct pgv *alloc_pg_vec(struct tpacket_req *req, int order, bool tx_ring
 	struct pgv *pg_vec;
 	int i;
 
-	vec = kzalloc_flex(*vec, pg_vec, block_nr, GFP_KERNEL | __GFP_NOWARN);
+	vec = kzalloc_flex(*vec, pg_vec, block_nr,
+			   GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
 	if (unlikely(!vec))
 		return NULL;
 	vec->order = order;
@@ -4532,7 +4536,7 @@ static struct pgv *alloc_pg_vec(struct tpacket_req *req, int order, bool tx_ring
 
 	if (tx_ring) {
 		vec->deferred = kzalloc_obj(*vec->deferred,
-					    GFP_KERNEL | __GFP_NOWARN);
+					    GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
 		if (!vec->deferred)
 			goto out_free_pgvec;
 		vec->deferred->vec = vec;
@@ -4648,7 +4652,7 @@ static int packet_set_ring(struct sock *sk, union tpacket_req_u *req_u,
 		default:
 			if (!tx_ring) {
 				rx_owner_map = bitmap_alloc(req->tp_frame_nr,
-					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
+					GFP_KERNEL_ACCOUNT | __GFP_NOWARN | __GFP_ZERO);
 				if (!rx_owner_map)
 					goto out_free_pg_vec;
 			}

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

