Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793229439;
	b=1GNh18F7e65HWB1J3r4W+PSlXWPy3YTEAd20BCnm3w10qYcFr9RgRu+musmnrgRo5+rZ
	 K753TtOgIwz8qqcZjvfjA3NdBtzeLoJSE6nDTZ+KIL2PKFlYeVMXHLDTzTP2xA5Jnxiue
	 IqgWSi2gK2dPuEPCaiVko12LbXHDGoxP7Ob9dPMIdA6l6yQDhosDnrpfT+g/gjYE8vJmM
	 UUCuDWeMrR/oXism1bwXu/Roqc+Z9HwIp9HV8XjjtEnHht2kkICJyY4wkEYyUhylkvwwD
	 bi7blN8qAeWOSayAcmeBUw9oY279jO4zG0SJd1/QxgMP5kgM0ouWDsvzHQ39SSj0ilw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793229439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WBs+C3EVaOKoOCK3dDkrmgons887NGYhqw44ZoEPBOE=;
	b=GrOUibnMmeT8rMZTlFIDqHxtpI8Cx4EmFxEdGqSTG7SXwxLkLcmLqLPVw3j4L2rkd5NJ
	 HhLWVMgyS1DvopFXtsT6hcePQxT0CpAzFsUG5mqDoZj/ypb4G470qadrp7rGhS24CBeQL
	 w0evWzvUES08aNowT35ISgyBKtMe24/qRELFe9uQJgMiGClwb6PyBCBs5QjroGPjn0Zkl
	 HdZwRhWR1RSIW6NEfMfScjZBl11rwnpBbo/seelsTunkRcWIH/Bv+FHA8nBhiFjFnZ/kD
	 zck/ExJUPRCPfS6HoibD3/0aOTu1+0NBl2JZ+iOtgLapoWSRn6pPkSK7XZTiTOR+6KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqzU+nfk;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04BF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqzU+nfk
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98ff53fb739so889566241.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793229438; x=1793834238; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBs+C3EVaOKoOCK3dDkrmgons887NGYhqw44ZoEPBOE=;
        b=mqzU+nfk8PBimx4cCQ2my8cPgn1Z6sEl5TdC7YZM9UwrX7T12bj9UPau8bdijrCj93
         +spCc6TFhnr0bW7s7Dqea7vV9+1jWJeYe9znyBEZgEmCY5j7zSj4oh48xg8oXcQ2+jKW
         c0qMl4bSpXWZKgzc/a+WCWDWmzpJiL+l7/EYKRK8bzyK3LPc3MS+YcGH/MBj7chXTcWx
         OsU9WpjXmQDwUQpjmCNdlaXxB6Yaz+8mIVowP8gDK1TJF31zuZUfa8uqVWKY2KNs/2Jf
         RnjFB9BHclzMYiTgaV/Rbju5a8h4CqThAj/rDRUNBf3bIkIjiR7jlFbvYuqlVgQGyh21
         PmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793229438; x=1793834238;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBs+C3EVaOKoOCK3dDkrmgons887NGYhqw44ZoEPBOE=;
        b=sjYjYQTwljft6Ta4+Gh+6htZUD9pkigJStfawtLZCu4Cgfrl/HOi3bqGchGEXxCIAv
         bdEcZyHqcZVR09zIwPCTv42xwFmdf48e/xRWyjViW2XpQPnPx9iInxRlYnwSMS1cxZSL
         u5tSukMcaa2v/qWhfep1t3a/VCEzSbIBgJY7M2Fs3Q5Fy+BeIjyS4jbAq/nPpdl65tyg
         MEGFGNOCOrKZc0wxfVkimKCuRCFd+/lgAiewmGrLCX/ILAsQEgUaxwi/2CyJlLMPAJAU
         sR2wYK0EGmgQF9IHAcjPaxPIDwnO3nTX+baf2wRj1TkhmWUcYosBxJBPOYp1h19EZyy6
         6TeA==
X-Forwarded-Encrypted: i=1; AKwUvBzxTFTlA0eABd9C72xB3g+43SGmaWzD8BMGSqM3WXJK+e6k83HX4gzzZNL/7vHuvTRlj0++DZOSlge5Eb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqORY+JcD6GzPsycnrmRLbQi5y5H2vA3LelTcNYCqU19bP8m7Y
	k6DxTiiXHUc1ia05zBbUYb5XSkakVDcYXyYFdkon9wmDvw5Xx0vGZu8vRZz6Y3Mr3NY=
X-Gm-Gg: AYBFou3jf2/8rA8LbthrMBGEj/NVXcljFDwgGNT2t01cE5px20Chwtnn3WioVkIohSM
	Z9VBK8onNPtSsrE+LVTrBQHOVrlB+Hes/NZQRzDtLRZJk6phXkrL1Px7BpNeHk9G1z64NnsqKNm
	1pe8Zdhx2xhLqlKlUeVTufWIrto8ie0AusaqVWSnvIsDwQu/QLHY+W+oa+iBKZ35embh+p7/yIf
	5eB5n4FmtnHIdMQuDxdGD7lyEhVeqOTzL6Ry1B7kes819XH7Ju3ijyYb5PXXhZIgbKmqJoIM30g
	BtAahfZy4evgWgq9OjI9dYhMzRE3Uc225buD6hCkKP8I9Qy5/558hXCWBIgaoaZgvzlJrIvcy1r
	VteaH39Qy+El9xvVpDaUIUkTsNvCQwtrcFDdf3q2Pw1gUmzr7oKbcFOBgACGyMwR8tkQM4eufu0
	sN1P5oELLem+YLAIUWkbbBjOhW6VtNjHDdz8DC2IOZ31a9htbZXmV3RHHU9fe/w3DKliJl/U+58
	+ag3teUWxO2Hg0Qblu04J6qXAyq5KkVkYsR0bK9jpIr0gGjq9u+hqvxy+HHK6D3v7FULm6BKPF+
	Ww+nEn3D2wx3GBOXMeSOvZT28g+jH1Vbto3GwLQYmd6OTQnm6i3ssiFh/ScYH3aQwjX8Kozm/Rx
	jl+HHcwyavUj2uRxXihYuDzzWGU6m
X-Received: by 2002:a05:6102:418d:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7d03a4baae8mr2126376137.11.1793229437563;
        Wed, 28 Oct 2026 16:17:17 -0700 (PDT)
Received: from macbook-pro-de-joas.local ([2804:7f0:b101:c5e8:7d75:cb37:7054:6d4b])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d7dd7esm7234241137.10.2026.10.28.16.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:17:16 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To:
 Jon Maloy <jmaloy@redhat.com>, Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [PATCH net v4] tipc: raise the minimum bearer MTU to fit tunnel and
 crypto overhead
Date: Wed, 28 Oct 2026 20:17:06 -0300
Message-ID: <179322942644.17111.4355153262478871713@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

A peer can lower the link MTU to TIPC_MIN_BEARER_MTU (100 bytes, plus
the UDP encapsulation header) with the max_pkt field of a RESET or
ACTIVATE message; tipc_link_proto_rcv() only checks the lower bound
returned by tipc_bearer_min_mtu().  The same bound is applied to the
device MTU when a bearer is enabled.

That bound predates two later reductions of the link MSS:

  tipc_link_mss() = mtu - INT_H_SIZE                    (tunnel header)
                         - EMSG_OVERHEAD               (CONFIG_TIPC_CRYPTO)

With CONFIG_TIPC_CRYPTO=y, which is the default, an MTU of 100 gives an
MSS of 28.  Once the link comes up, tipc_named_node_up() calls
named_distribute(), which computes

  msg_dsz = ((tipc_node_get_mtu() - INT_H_SIZE) / ITEM_SIZE) * ITEM_SIZE;

For an MSS of 28 the subtraction is negative and the result truncates to
0xfffffff0; for an MSS between 40 and 59 it is 0.  named_prepare_buf()
then allocates a buffer with no room for any item (the u32 size wraps),
and msg_rem never reaches zero, so every cluster-scope publication on
the node is written with publ_to_item() past the end of that one skb,
over skb_shared_info and into adjacent memory.

Without crypto the MSS is at least 60, which still does not hold the
first fragment built by tipc_msg_build(): INT_H_SIZE fragment header
plus a message header of up to MAX_H_SIZE.  With pktmax below that, the
header copies run past the pktmax bytes allocated for the fragment.

Raise TIPC_MIN_BEARER_MTU to MAX_H_SIZE + 2 * INT_H_SIZE so the MSS can
always hold INT_H_SIZE + MAX_H_SIZE, which also leaves room for name
table items, and add tipc_bearer_mtu_floor(), which adds EMSG_OVERHEAD
on top for CONFIG_TIPC_CRYPTO=y.  Use it for the device MTU check
(tipc_mtu_bad()), the UDP MTU check, the netlink MTU setting and
tipc_bearer_min_mtu(), which also bounds the max_pkt negotiation.

Found by manual code review, assisted by an LLM, and reproduced with
KASAN using two network namespaces joined by a veth pair (see below).

Fixes: fc1b6d6de220 ("tipc: introduce TIPC encryption & authentication")
Fixes: 2320bcdae628 ("tipc: fix changeover issues due to large packet")
Suggested-by: Tung Nguyen <tung.quang.nguyen@est.tech>
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
Changes in v4:
- Rebased on net/main, on top of 592d0fdb02df ("tipc: bound the device
  MTU accepted for L2 bearers"); tipc_mtu_bad() keeps the new
  TIPC_MAX_BEARER_MTU upper bound and only the lower bound changes.
  No functional change otherwise.

Changes in v3:
- Keep the CONFIG_TIPC_CRYPTO dependency in one helper,
  tipc_bearer_mtu_floor(), instead of #ifdefs at each call site, as
  suggested by Paolo.  tipc_mtu_bad() and tipc_udp_mtu_bad() use it, so
  tipc_mtu_bad_crypto() and the crypto.h include in udp_media.h are gone.
  The bounds are unchanged: 172 with crypto, 140 without.

Changes in v2:
- Derive the crypto bound from EMSG_OVERHEAD instead of a hard-coded 32:
  TIPC_MIN_BEARER_MTU_CRYPTO in crypto.h and tipc_mtu_bad_crypto(), as
  suggested by Tung.  Drop the BUILD_BUG_ON().
- Apply the crypto bound to the UDP MTU check and the netlink MTU
  setting too.

v4 builds cleanly on net/main with W=1, with and without
CONFIG_TIPC_CRYPTO.  The runtime results below are from v3, retested on
602042bf29f6 (arm64, QEMU, KASAN); the rebase does not change the
bounds.  With the reproducer
below (node A with 40 cluster-scope publications and MTU 1500, node B
enabling its bearer on a veth with the given MTU):

  config            peer MTU   bearer on B         link   KASAN
  unpatched            100     enabled              up      slab-out-of-bounds
                                                            in publ_to_item()
  TIPC_CRYPTO=y        100     refused (too low)    -       none
  TIPC_CRYPTO=y        171     refused (too low)    -       none
  TIPC_CRYPTO=y        172     enabled              up      none
  TIPC_CRYPTO=y       1500     enabled              up      none
  TIPC_CRYPTO=n        100     refused (too low)    -       none
  TIPC_CRYPTO=n        139     refused (too low)    -       none
  TIPC_CRYPTO=n        140     enabled              up      none
  TIPC_CRYPTO=n       1500     enabled              up      none

The reproducer exercises the bearer-enable check; the max_pkt
negotiation in tipc_link_proto_rcv() uses the same bound through
tipc_bearer_min_mtu() but was not hit separately with forged messages.

Reproducer (as root; build with "gcc -Wall -O2 -o pub pub.c", run
"sh tipc_repro.sh [peer_mtu]"):

pub.c:

  /* Bind N TIPC services with cluster scope, then sleep. */
  #include <linux/tipc.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <sys/socket.h>
  #include <unistd.h>

  int main(int argc, char **argv)
  {
  	int n = argc > 1 ? atoi(argv[1]) : 40;
  	for (int i = 0; i < n; i++) {
  		struct sockaddr_tipc a = {
  			.family = AF_TIPC,
  			.addrtype = TIPC_SERVICE_RANGE,
  			.scope = TIPC_CLUSTER_SCOPE,
  			.addr.nameseq = { .type = 1000 + i, .lower = 0, .upper = 0 },
  		};
  		int s = socket(AF_TIPC, SOCK_RDM, 0);
  		if (s < 0 || bind(s, (struct sockaddr *)&a, sizeof(a))) {
  			perror("tipc bind");
  			return 1;
  		}
  	}
  	printf("pub: bound %d cluster-scope services\n", n);
  	fflush(stdout);
  	pause();
  	return 0;
  }

tipc_repro.sh:

  #!/bin/sh
  # TIPC named_distribute() overflow reproducer.
  # Needs root, CONFIG_TIPC=y, CONFIG_TIPC_CRYPTO=y (default), KASAN recommended.
  # Usage: ./tipc_repro.sh [peer_mtu]   (default 100; 100..131 trigger it)
  PEER_MTU=${1:-100}

  ip netns add A
  ip netns add B
  ip link add va type veth peer name vb
  ip link set va netns A
  ip link set vb netns B
  ip -n A link set lo up
  ip -n B link set lo up
  ip -n A link set va mtu 1500 up
  ip -n B link set vb mtu "$PEER_MTU" up

  # node A: 40 cluster-scope publications (any number >= 1 overflows;
  # more publications write further past the buffer)
  ip netns exec A ./pub 40 &
  sleep 2

  # node A uses MTU 1500, node B uses PEER_MTU; the link MTU is
  # negotiated down to PEER_MTU, the link MSS becomes PEER_MTU - 72
  ip netns exec A tipc bearer enable media eth dev va
  ip netns exec B tipc bearer enable media eth dev vb

  # the overflow happens in tipc_named_node_up() as soon as the link
  # comes up (a few seconds)
  sleep 20
  dmesg | grep -A30 -E "KASAN|BUG:|Oops"

 net/tipc/bearer.c    | 17 +++++++++++++++--
 net/tipc/bearer.h    |  9 ++++++---
 net/tipc/udp_media.h |  2 +-
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/net/tipc/bearer.c b/net/tipc/bearer.c
index 774f68d..8b82101 100644
--- a/net/tipc/bearer.c
+++ b/net/tipc/bearer.c
@@ -546,9 +546,22 @@ int tipc_bearer_mtu(struct net *net, u32 bearer_id)
 	return mtu;
 }
 
+/* tipc_bearer_mtu_floor - smallest bearer MTU, excluding the media
+ * encapsulation header, that leaves room for a fragment header plus a
+ * full message header after the link MSS reductions (see tipc_link_mss())
+ */
+u32 tipc_bearer_mtu_floor(void)
+{
+#ifdef CONFIG_TIPC_CRYPTO
+	return TIPC_MIN_BEARER_MTU + EMSG_OVERHEAD;
+#else
+	return TIPC_MIN_BEARER_MTU;
+#endif
+}
+
 int tipc_bearer_min_mtu(struct net *net, u32 bearer_id)
 {
-	int mtu = TIPC_MIN_BEARER_MTU;
+	int mtu = tipc_bearer_mtu_floor();
 	struct tipc_bearer *b;
 
 	rcu_read_lock();
@@ -1164,7 +1177,7 @@ int __tipc_nl_bearer_set(struct sk_buff *skb, struct genl_info *info)
 			}
 #ifdef CONFIG_TIPC_MEDIA_UDP
 			if (nla_get_u32(props[TIPC_NLA_PROP_MTU]) <
-			    b->encap_hlen + TIPC_MIN_BEARER_MTU) {
+			    b->encap_hlen + tipc_bearer_mtu_floor()) {
 				NL_SET_ERR_MSG(info->extack,
 					       "MTU value is out-of-range");
 				return -EINVAL;
diff --git a/net/tipc/bearer.h b/net/tipc/bearer.h
index f9bfcc9..72abfca 100644
--- a/net/tipc/bearer.h
+++ b/net/tipc/bearer.h
@@ -60,8 +60,10 @@
 #define TIPC_MEDIA_TYPE_IB	2
 #define TIPC_MEDIA_TYPE_UDP	3
 
-/* Minimum bearer MTU */
-#define TIPC_MIN_BEARER_MTU	(MAX_H_SIZE + INT_H_SIZE)
+/* Minimum bearer MTU, not counting the crypto overhead, see
+ * tipc_bearer_mtu_floor()
+ */
+#define TIPC_MIN_BEARER_MTU	(MAX_H_SIZE + 2 * INT_H_SIZE)
 
 /* Maximum bearer MTU
  *
@@ -241,6 +243,7 @@ void tipc_bearer_cleanup(void);
 void tipc_bearer_stop(struct net *net);
 int tipc_bearer_mtu(struct net *net, u32 bearer_id);
 int tipc_bearer_min_mtu(struct net *net, u32 bearer_id);
+u32 tipc_bearer_mtu_floor(void);
 bool tipc_bearer_bcast_support(struct net *net, u32 bearer_id);
 void tipc_bearer_xmit_skb(struct net *net, u32 bearer_id,
 			  struct sk_buff *skb,
@@ -265,7 +268,7 @@ static inline void tipc_loopback_trace(struct net *net,
 /* check if device MTU is usable for tipc bearers */
 static inline bool tipc_mtu_bad(struct net_device *dev)
 {
-	if (dev->mtu >= TIPC_MIN_BEARER_MTU &&
+	if (dev->mtu >= tipc_bearer_mtu_floor() &&
 	    dev->mtu <= TIPC_MAX_BEARER_MTU)
 		return false;
 	netdev_warn(dev, "MTU not usable for tipc bearer\n");
diff --git a/net/tipc/udp_media.h b/net/tipc/udp_media.h
index e7455cc..030e00a 100644
--- a/net/tipc/udp_media.h
+++ b/net/tipc/udp_media.h
@@ -48,7 +48,7 @@ int tipc_udp_nl_dump_remoteip(struct sk_buff *skb, struct netlink_callback *cb);
 /* check if configured MTU is too low for tipc headers */
 static inline bool tipc_udp_mtu_bad(u32 mtu)
 {
-	if (mtu >= (TIPC_MIN_BEARER_MTU + sizeof(struct iphdr) +
+	if (mtu >= (tipc_bearer_mtu_floor() + sizeof(struct iphdr) +
 	    sizeof(struct udphdr)))
 		return false;
 
-- 
2.39.5
