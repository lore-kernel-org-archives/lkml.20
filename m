Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605932;
	b=PuezPwbvGDHARiiFzOMEEva42vlnpZeNe2JQac5qdWUbDLDEbXGKVaVPGlE3g68cMQuq
	 yC9JUmy2E139a4Nec1BphoT8oMEw1h1lb32Al2WItUczQsGxaJpNI8mu+l1t1FEVLgL7G
	 k9FYdH2JCN3Il0vAWhbxwCsWD3gXp5PLdFRhGVQewLjZrklJ7M//vPjd5DfS1jcYOdMEn
	 21ABhwcFPJfoN7aCcII21USzWvXDHHSEgh9Q3UZvyh5tuNqr3p9mtLOrrCYgKcqg1oeiy
	 qU5Ty2TA+o+iMv7JDm/xODWgJFSyK0VCfpOBZCI6w9n4w6CmeOeCcmAOHjZH4b9IAAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cDckOYGKiTcCmnZHJzDUIHI22U4mrVjbAtWOGCBnRDk=;
	b=ddUhmJdd/UTxyH2wH7NVYCNM4ilLKNJxxOEQ+r+2CF+Pt2XBtAljg0NGouPHQKfa8gmD
	 dBr0U6u7niJgm7sdjqgf1p6G6scKYMJSqQ0k9MVt3d39FIW7lIKxJWGvFxr8pE5Q+7W8/
	 SOjXzqdb7HiCl2T3PaOXBea+mITEQsOcEHkFICCfD4oZvyOK59V1/XoRmiwHzIs4QVnVy
	 gWFC6wrj0SFmTxdPbX8waIdP7NrbVz+qsRLalKfphyWDFAEPtJu9VOrVp51Acsi8xTw7m
	 IX4yx5MQh4mr8oA9FvCMxIlKNtvyr6zirtJBhVkyfkLDoWGJvR7Ijo6XvYpzf4lcOJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CtrYySqg;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7401606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7401606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CtrYySqg
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso7770425e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605929; x=1793210729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDckOYGKiTcCmnZHJzDUIHI22U4mrVjbAtWOGCBnRDk=;
        b=CtrYySqgn+sGrZhH8qfot2dEftpKaba17dq+YaDQIipAKo0hqZV4XoJkZ3mMN8MXcB
         HgqHNcTBf/2jU2gs7HMZ3b2I09Qpc9mthKhD5JqPQoXPe7ZB/HRtRDy8mm+JP5G3bmoF
         Ql7KC0BrxUE9yot9OtoIn/fUv2+knBjWAwvG3CHgYAcQ7Lpp8MqVgEOPbrUtjpLXuoxX
         JZ6GrT47a/9dQaWeHbCHkDvei3P7TSTnbdPY6Ow/M2OyJd3XB7/ENp4z22zbvwzssJKg
         pTvYQNYM40DBCk/hPKijIJnvHEE9Q8U4zQm14IDskOLcMF/HFrBMhUY+D/Ihc4OjclJf
         27mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605929; x=1793210729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cDckOYGKiTcCmnZHJzDUIHI22U4mrVjbAtWOGCBnRDk=;
        b=MiqI2yV6YC3iUxtSXmTktYuMI48KqZK55Pf1TBhiyE75lkyr1sa1NN+bXrLQ9x2v/H
         PijT91Thy+Dnr35TqoJfZlQDsDGNesoeT9RoT9m+a/c1uZG/9Sa4UU3LhtBmO5/vbr/T
         YXt0Rjhm7CxBELeULAy4XEuTlWspWMhmBUT4fEmBQMjQWc8eyWLOPaW1FdhjLMFNh4Ic
         L/bZi8RWcmn9I29onx0aRGk4uZaQu/HDCNDJ19pqS/ZWueFhbMWtXddxNea8dTbsFdHH
         8Wfqdbo0ln0RY16A1PgGLYLb6C3WyXfaOW+gkilzB7wz/xwspa52YD5c3Y/CYaarK7O+
         8eAw==
X-Forwarded-Encrypted: i=1; AKwUvBynVnOreWymzxSS2AqYS1nw02GRGBT9jCr/FpuMhTkFajbCMTBoRXiLzKZ8PDhXl5g3qVkNXuTev90lG3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxhMAyYb1y9Fo2EwvTOSVjMDsZTSnyMX9a32cOJDZdje3hEsjV
	enumpOZ2kn6YJKl6xPyVcxTyj+9HL/o4kZ1wCRU1yvCH/M+BRarlMvjW
X-Gm-Gg: AYBFou2ZvlbnH33+1UoPHKodPxs5iZ+kRVofEGTGUlZVieoZAWtyYNegFETa2TrKqxM
	dQe+1+MOLo+W9EU0mZkiAKHx9nUiuN6TkvG0K9ytuvI8r9jgTd+ZYtDUbQ6WJikDq9TlMzx/o6O
	BVUm3X+6s4hjy5sl/NSGGRa7aN38GNoUWCrATowKtdXv3KNAumsx3TYGXK8DG4qhtmA4yXxbTlp
	qrV2XX+oNZ6bD+86vJ0nxbaqxBcEsYJyIx3+JqX+F9uHoA9WdhiacdfW3Neu1pNy/dokh9cwID3
	olkU7HuuOlI5kk3P/smJ1vXLAzw29cEt/Pg7reJ3SuUB9hCBIz1lLKTgxns3A2UGFHZiE+lK1B8
	tDpDZdoiZNoCIlprKTXzcexUGoTjkc+pWxY8UrZA+RVOupipvXu58aIqGX/dzfa6oPq4NAFZUAU
	YMKvGILE/FOttvsg+QEih0OTiN/vDeQtiGIz+nu2kzaWrCH8gF6FcuXSttVktEy9dPxBZBli3m2
	7W6D1Zz/QHiZvcgo9eCtr5KEOJt858PFl7KadpC4mpmLxCrYnwYbTwCCB1llq0KxLsjqz2jYSiz
	z5kAA/aj3xX37fKCvQHumKS34ow2O6wg5wTqeNDW8r+qLLeEs7vwYhTXiCfk6buVzBIbw8XzBHd
	1VgHaWTUfYb0P0rPnZhnGazFuidX3HZqI
X-Received: by 2002:a05:600c:4fd4:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a1fdd53c8cmr60392565e9.27.1792605928777;
        Wed, 21 Oct 2026 11:05:28 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c6:e6ea:6401:f04a:ac6f:988e:f33d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd13891sm47007775e9.2.2026.10.21.11.05.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 11:05:28 -0700 (PDT)
From: Nick Simpson <nick.simo@gmail.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Sridhar Samudrala <sri@us.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/3] xsk: validate checksum offload requests in copy mode
Date: Wed, 21 Oct 2026 19:03:27 +0100
Message-ID: <20261021180329.26358-2-nick.simo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021180329.26358-1-nick.simo@gmail.com>
References: <20261021180329.26358-1-nick.simo@gmail.com>
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

In copy mode, XDP_TXMD_FLAGS_CHECKSUM turns the csum_start and
csum_offset from the TX metadata into a CHECKSUM_PARTIAL skb.
xsk_skb_metadata() only checks that the checksum fits in the frame, so
csum_start can point into the Ethernet or IP header.

On a veth, the skb reaches the peer namespace still CHECKSUM_PARTIAL.
When that namespace forwards IPv6 with nf_defrag_ipv6 loaded,
nf_ct_frag6_reasm() moves the IPv6 header forward by the 8 bytes of the
fragment header without adjusting csum_start, the forward hook accepts
the reassembled packet, and ip6_fragment() then completes the checksum
with skb_checksum_help(), writing two bytes into the accepted header.
With csum_start = 22 and csum_offset = 22 on a fragmented IPv6/UDP
datagram from fd00:1::100, the write lands on source address bytes
14-15: an nftables forward rule matching "ip6 saddr fd00:1::100"
accepted the packet and the fragments sent out carried saddr
fd00:1::e87. For an unfragmented packet the same write happens at
egress when the output device does not offload the checksum; with
csum_start = 14 and csum_offset = 22 the packet left as fd00:1::ebf. A
csum_start that ends up before the network header (14 to 21 on the
fragmented path) makes skb_checksum_help() warn instead:

  offset (-2) >= skb_headlen() (640)
  WARNING: net/core/dev.c:3647 at skb_checksum_help+0x4c8/0x850
  Call trace:
   skb_checksum_help
   ip6_fragment
   ip6_finish_output
   ip6_output
   ip6_forward
   ipv6_rcv
   ...
   __dev_direct_xmit
   __xsk_generic_xmit
   xsk_sendmsg

socket(AF_XDP) only requires CAP_NET_RAW in the user namespace that owns
the network namespace, so the sender can be a container that owns one
end of the veth. With panic_on_warn, the warning panics the forwarding
host.

The interface is documented for L4 checksums. Leave CHECKSUM_PARTIAL in
place only when the request designates the TCP or UDP checksum field of
an unfragmented IPv4 or IPv6 packet, not IP-in-IP or GRE encapsulated,
on an Ethernet device, and complete any other request in software, as
XDP_UMEM_TX_SW_CSUM would, before the frame is handed to the device.
The frame is dissected from its Ethernet type, as skb->protocol is not
set for xsk skbs. The pending "net: resolve uncommon partial checksums
at ingress" applies the same rule to virtio_net_hdr sources.

A request on a frame that is itself an IP fragment is therefore
completed over that fragment alone, which is also all a device could
compute, so the reassembled datagram does not carry a valid transport
checksum. Before, if every fragment carried such a request, the
reassembled datagram stayed CHECKSUM_PARTIAL and was completed on
refragmentation; now conntrack marks it invalid.

Skbs without a linear part (IFF_TX_SKB_NO_LINEAR, i.e. virtio_net) are
left unchanged: their data stays in the umem, where user space can
still modify it after any check, and they go to the device rather than
to the local stack.

The problem was found with LLM-assisted code review.

Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
Link: https://lore.kernel.org/r/9c08d12b3a7819ae03ded6a154e4f908276e93d4.1792411304.git.mst@redhat.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Nick Simpson <nick.simo@gmail.com>
---
 net/xdp/xsk.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 781ba46eb152..a1cf701d42fc 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -11,6 +11,8 @@
 
 #define pr_fmt(fmt) "AF_XDP: %s: " fmt, __func__
 
+#include <linux/if_arp.h>
+#include <linux/if_ether.h>
 #include <linux/if_xdp.h>
 #include <linux/init.h>
 #include <linux/sched/mm.h>
@@ -21,6 +23,8 @@
 #include <linux/uaccess.h>
 #include <linux/net.h>
 #include <linux/netdevice.h>
+#include <linux/tcp.h>
+#include <linux/udp.h>
 #include <linux/rculist.h>
 #include <linux/uio.h>
 #include <linux/vmalloc.h>
@@ -28,6 +32,7 @@
 #include <net/netdev_queues.h>
 #include <net/xdp_sock_drv.h>
 #include <net/busy_poll.h>
+#include <net/flow_dissector.h>
 #include <net/netdev_lock.h>
 #include <net/netdev_rx_queue.h>
 #include <net/xdp.h>
@@ -985,6 +990,54 @@ static void xsk_drop_skb(struct sk_buff *skb)
 	xs->skb = NULL;
 }
 
+/* Only TCP and UDP checksums of unfragmented IP packets that are not
+ * IP-in-IP or GRE encapsulated are left to the device. A CHECKSUM_PARTIAL
+ * skb can reach the local stack (e.g. through veth), and completing an
+ * arbitrary csum_start there may write into headers that were already
+ * inspected, e.g. after IPv6 reassembly. skb->protocol is not set for
+ * xsk skbs, so the frame is dissected from its Ethernet type instead.
+ */
+static bool xsk_csum_partial_ok(const struct sk_buff *skb)
+{
+	const struct ethhdr *eth = (const struct ethhdr *)skb->data;
+	struct flow_keys_basic keys;
+
+	if (skb->dev->type != ARPHRD_ETHER || skb_headlen(skb) < ETH_HLEN)
+		return false;
+
+	if (!skb_flow_dissect_flow_keys_basic(dev_net(skb->dev), NULL, &keys,
+					      skb->data, eth->h_proto, ETH_HLEN,
+					      skb_headlen(skb),
+					      FLOW_DISSECTOR_F_STOP_AT_ENCAP))
+		return false;
+
+	if ((keys.control.flags & FLOW_DIS_IS_FRAGMENT) ||
+	    skb_checksum_start_offset(skb) != keys.control.thoff)
+		return false;
+
+	switch (keys.basic.ip_proto) {
+	case IPPROTO_TCP:
+		return skb->csum_offset == offsetof(struct tcphdr, check);
+	case IPPROTO_UDP:
+		return skb->csum_offset == offsetof(struct udphdr, check);
+	default:
+		return false;
+	}
+}
+
+static int xsk_skb_resolve_csum(struct sk_buff *skb)
+{
+	/* Without a linear part (IFF_TX_SKB_NO_LINEAR), the frame stays in
+	 * the umem, where user space can still change it, and goes to the
+	 * device rather than the local stack: leave it as it is.
+	 */
+	if (skb->ip_summed != CHECKSUM_PARTIAL || !skb_headlen(skb) ||
+	    xsk_csum_partial_ok(skb))
+		return 0;
+
+	return skb_checksum_help(skb);
+}
+
 static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 			    struct xdp_desc *desc, struct xsk_buff_pool *pool,
 			    u32 hr)
@@ -1277,6 +1330,11 @@ static int __xsk_generic_xmit(struct sock *sk)
 			continue;
 		}
 
+		if (unlikely(xsk_skb_resolve_csum(skb))) {
+			xsk_drop_skb(skb);
+			continue;
+		}
+
 		err = __dev_direct_xmit(skb, xs->queue_id);
 		if  (err == NETDEV_TX_BUSY) {
 			/* Tell user-space to retry the send */
-- 
2.53.0

