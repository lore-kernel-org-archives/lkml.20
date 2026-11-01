Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793526618;
	b=SwPySHvForFxjJrnqfsnPfMp0psB+MVeYg3ind8QKaJlLtjjWSOioaUgm5B4wtLjNbBh
	 AgJdl9ztiKy4hohGpuOZKX/96LRkbVf2UVpwkAgx8v47wjCLiVk7ghKBYsn+BsZIe+DG3
	 R6IK6IibZjeZfdvKaB/Lwhn+A3CJ3aEBO+Wlo0QWLRSX/5sb1P3YfdSSqZWiRZ6Yb1BCy
	 kYhbgNejDpbTbiNjwBWZuuESG+Z4A4C9i0ajDOLcySh+he/zeu9TlyDZ88Z99LZIii4hO
	 D/ywKOlIoabpHHSXIqBIRXE40mfE3rPL8YSjsYxOGDuiC7gV0CLT88XqM4PizP801jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793526618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VRwFzuB7fWGW1t5e+uWnFaSjsE+gErCYZsaIW9DBl+I=;
	b=tt/L9iI4LhGSdjz2Hu/572ES33XIidQ4mvTICJAdRLpKHqnJK9GpJ1n4Qhsa5PBz4hS/
	 ONHz/jtwpaI+B6oObZW41IzCehSJts3mJf+r5hy9m7suVMfDc/MMVDy6QoO01Ypf61Ls4
	 UfefPBDUdG9YH4aH77vNuxjzqxTi7RAG/WHXxy1Wy3QPWyRkH6gxdJ7AYctsWqZbqmVCg
	 cFaM5AUx4R3zogRsQVrBA5FYpAVveKDWxxImX7CSqwkSw1T9S8T3ToFVxlg/e2+FDndRz
	 Vn/HeTsCKq3thPsQdM80/eOG4m0uY/E0KwVbFGD/A/MCMdGAkaGyOykNJ0BA2WU5ebw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uao/RAIV";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6585606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 09:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6585606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uao/RAIV
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so21530715e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793526616; x=1794131416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRwFzuB7fWGW1t5e+uWnFaSjsE+gErCYZsaIW9DBl+I=;
        b=Uao/RAIVw+DXGrjH+o1O7lghiXhrpgVAzEvbtfsA4T7ocqAaaYcxE0JQ4Foe0rrbMq
         uOy+go/yoU8aB8xi4m5iMMLm1haKd3vfwEauZN91Ibn0sfYXanowUXVEkgvBC2DI/KK7
         49c3YNx91K5U+zOTAHQJ2dl16+QVQcJRHwYg/p9hHTiRwMsUvgBq+q7W/pZeRlYCBAgv
         +84E/qhqg4WXulFKjLBnqQ4GOdVDGeqqm12ceSZaWbxA8gK4/rq1fKB1NpXuq3ac9AFs
         5PENjPnMKZkKnGM3WXJs+jNeFnzPFoXlLB71wnZIkdh8t3ge3bi+YGvb6HK6VEG3bTSx
         Zmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793526616; x=1794131416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRwFzuB7fWGW1t5e+uWnFaSjsE+gErCYZsaIW9DBl+I=;
        b=lIZxn1nMPBA9fmqhRqqlsVwgHA0UfA8tU4JX4TyUSd6JAmDtItLXREl0BH7N526VA6
         6y1zuM39AkMauM7K2aLseXiCdWCRgrz3ooj/97F7segk2yXSzT6lX1P+7tD0u0V+/Jw9
         Wwak9UG8BlMdSC30vAjj2Z7FIAJDgJIM2jSdfVv9oo/q2M1aLQ+HKCmylY4uT7iMYMUq
         Gz7UUdXwwPkCdjQ7MYQ32wTQ45Kk10+YVB6LAB4N1aBNYcv2SElrIlfXX2p6zV7Lp9rA
         V8kBrZlhNsLIb72fJgLoVhXa5k08oNu+1rQbu+VMOddmyZqnfYXQAvAbU7wgpeW07cXa
         /2rA==
X-Forwarded-Encrypted: i=1; AKwUvBx1cuE8C7U9V04i4J7pdthSH03dD8jIBrJtel2JheE2VH/vIkjuSnQ9Pt3Sdo34S/EpqqTSvUD73nEtkII=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/UmTMZRY0ZLTk8hX4GrLuufYbgLnZ0UsJDgDVnkgje8tIWcuj
	BdaIE+CvIrANZ9g/iwLv+3NW1en2U4naZogsQ8cXv+GMpzGfRA5kFxDm
X-Gm-Gg: AYBFou24TL7ytguKs0YpSpB4yF3dU3Fh/sEnzg8fzIAuegBspT0vNWbSLxGFYthWKEB
	76T+ofMqLYOsfC82a5XMZL193RCzgIwGK8m2wqmbKmvmT7qN4Je8kXO8EXrJ607kWjMJ379kzCv
	S8kceRQhHm7xjnEo7tgmQ/F92Yd03HR1fzND5N1NJcf+2xgZjMNzTNicXuSxOshJF45fxpfDTBa
	MX7XisY/KzET/+BRWxWcWqwUNUHQTIsfbI5EVHLADHZ8un/B6klMsheaC38BrrH8xOKUqrnFHWY
	10nh2j829fZWLDgE9nMgnPgHtSfu7xgCbu5y2YH8ksPLvAY/OaG5p62e+Bs2CmkcHbUKN/6eBT3
	74af3Ww8ccXXpPYCGLxO0II6tZklwwUsn1sM7Ba7nshvP5nl17tx1OiSHpTmVOPEWpO+qHN9MGA
	Srp07RLhT24rzCHtesPhc2ulUOveRG3a3YEut67dpgktjKxtJ+PpEWQbeZ08M7sU7S/vRVCwLZb
	HqCG504Jfv/aMW/oaMYdBJWb2AExgEwRLozzjGN6uYK2HoGJN3QPWoq6HYELFUTgiPbw4wwZr5s
	YLcdzogAuhyYGpPej9xIhi8nG63J+zQTvwqHtXsoQolx+515m+mEKYmWHT4A2GzWoq1/B+TVU2r
	OdWS8+Ds=
X-Received: by 2002:a05:600c:37cc:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4ac1980143dmr139263645e9.35.1793526615914;
        Sun, 01 Nov 2026 01:50:15 -0800 (PST)
Received: from pop-os.. ([51.36.40.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm285566535e9.13.2026.11.01.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:50:15 -0800 (PST)
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
Subject: [PATCH net v4] net/packet: account user-triggered allocations to memcg
Date: Sun,  1 Nov 2026 12:48:47 +0300
Message-ID: <20261101094847.664612-1-ahmadag1001@gmail.com>
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

A packet socket makes allocations whose size or count its user chooses
without charging them to the user's memory cgroup: the blocks and block
array of a PACKET_RX_RING or PACKET_TX_RING ring and the rx_owner_map
of a TPACKET_V1/V2 RX ring, the PACKET_FANOUT group (about 1 MB with
max_num_members = 65536), and one packet_mclist per
PACKET_ADD_MEMBERSHIP entry. CAP_NET_RAW in a user namespace is enough
to pin memory far beyond memory.max this way.

Allocate them with GFP_KERNEL_ACCOUNT, as the AF_XDP rings do since
commit b0057c68df71 ("xsk: account ring allocations to memcg"), and with
__GFP_NOWARN where the size comes from user space, so that a ring or
group that does not fit prints no allocation warning. Fixed-size
per-socket state is left unaccounted.

Reproducer, as uid 1000 in a memory cgroup with memory.max 16M, after
unshare(CLONE_NEWUSER | CLONE_NEWNET): open 64 AF_PACKET sockets, give
each a TPACKET_V2 RX ring of 8 blocks of 1 MB, mmap the rings and touch
every block. MemFree drops by 526052 KB while memory.current grows by
1280 KB. 256 fanout groups with max_num_members = 65536 (265144 KB used,
512 KB charged) and 100 sockets with 2000 PACKET_MR_PROMISC entries each
on lo (45220 KB used, 124 KB charged) behave the same. With this change
all three are stopped by the cgroup's OOM killer. psock_fanout,
psock_tpacket and psock_snd.sh pass before and after. Found by code
inspection with the help of an LLM and reproduced on an unmodified
kernel without error injection; tested in a QEMU guest with KASAN on
net.

The ring pages and rx_owner_map were never charged, the rest not since
commit a9bb7e620efd ("memcg: only account kmem allocations marked as
__GFP_ACCOUNT"). The Fixes commit let the user size the fanout array.

Fixes: 9c661b0b8544 ("net/packet: make packet_fanout.arr size configurable up to 64K")
Cc: <stable+noautosel@kernel.org> # changes memcg charging of existing packet rings; not stable material
Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
---
Tool use: an LLM coding assistant (Claude Code) found the missing
charges by code inspection, drafted the patch, the test program and this
message, and ran the tests in the QEMU guest; I reviewed every hunk, the
results and this message before sending.

v4:
  - trim the commit message
  - add __GFP_NOWARN to the fanout group allocation
  - use __vcalloc() for the vmalloc fallback and bitmap_zalloc() for
    rx_owner_map
v3: https://lore.kernel.org/netdev/20261031084316.387533-1-ahmadag1001@gmail.com/
  - Fixes 9c661b0b8544; stable+noautosel; drop Assisted-by; leave fixed-size
    allocations unaccounted; __GFP_NOWARN on the vmalloc fallback
v2: https://lore.kernel.org/netdev/20261030100504.23498-1-ahmadag1001@gmail.com/
  - cover all user-triggered allocations in one patch
v1: https://lore.kernel.org/netdev/CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com/

 net/packet/af_packet.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index cf6429f0947..ec6ab96c4f8 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1778,7 +1778,8 @@ static int fanout_add(struct sock *sk, struct fanout_args *args)
 			/* legacy PACKET_FANOUT_MAX */
 			args->max_num_members = 256;
 		err = -ENOMEM;
-		match = kvzalloc_flex(*match, arr, args->max_num_members);
+		match = kvzalloc_flex(*match, arr, args->max_num_members,
+				      GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
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
+	buffer = __vcalloc(1 << order, PAGE_SIZE,
+			   GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
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
@@ -4647,8 +4650,10 @@ static int packet_set_ring(struct sock *sk, union tpacket_req_u *req_u,
 			break;
 		default:
 			if (!tx_ring) {
-				rx_owner_map = bitmap_alloc(req->tp_frame_nr,
-					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
+				rx_owner_map =
+					bitmap_zalloc(req->tp_frame_nr,
+						      GFP_KERNEL_ACCOUNT |
+						      __GFP_NOWARN);
 				if (!rx_owner_map)
 					goto out_free_pg_vec;
 			}

base-commit: cb284914e749388eef402938bdb3115fe1f6d337
-- 
2.43.0

