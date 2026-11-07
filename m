Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085642;
	b=hAkYx9rFJkHZiZU83a+hk9RmFRSFm/x71rvUhwrg0bIRrld/GD426Sb8QL6kNjJSLRGr
	 Xle8TaYh5xjAdNh/pTRZcAIL1YYOFiBvYTJL6uO7fHI1jFt65VyPxh+t4Eh0x6qxa+c+O
	 ERNzZnyGAVWFoyVeuEd1R4DYJbgJOmMgjF3w6HR0HaxJsB5fWZsqXqVz7X+EEjbmpEQBW
	 g59f3yMETLPiJ1OKWNw93+FBeNXM4U334gXGJhpITvl000T+426KzEW3O2cejtzlziUA5
	 RBw3v17K2MXG5eAmk5SIdAnQ57j6ngSQ+kjIlgph+43h93/MhzmVCn/k3Hf5lNSeEDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2ISWID7R3PJvGfbWlsLezGwB1NxsnTURFXD2bP305k0=;
	b=VM/s28vyA4PEU7funqw9kW40kiHph0kbfOF/3RtP1iq92cUJPSY+pelbDgE6zqesT407
	 uLuG1ufpx0Wq16b4uVF8dSuO7oAjJKoQcSrJFtI87WhS3y5rehRGl4BsSGxhDdyOw9l/N
	 UNxz1N9hfxzpYIWmbrfHK68KfqTaFr9PmCjrK/PaO0GPldwKIQElm3zP4ehxbq0AQQDoi
	 DIgnpp4hi8ZhX6njnXTNPY7qFgMKUURrb8Fw/bbZR8c7PjkST2NUa3xvsSP6LDtHWhoe7
	 E1zriRvYMDBZ+bNxnTszvPp0880mgOVvy5LoSoJnlMUmATRTKBr8eeaRk71tSoIwoAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3VTxUSo;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB9606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BB9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3VTxUSo
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37198ed3727so534991eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 13:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794085641; x=1794690441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ISWID7R3PJvGfbWlsLezGwB1NxsnTURFXD2bP305k0=;
        b=v3VTxUSo5xdLe91KD1TmAmy+Hk7quvkWacahldqH+gvWRPUtpmA1w6lWmj76cHGNRQ
         u0FYpGPpEGSp22Qa1uPQLuFysjD1DfAn/7aUNzWcywLzTziNd3HhNKVBBd68Bu9cmgNn
         1m3GKAf1PAW2SxP1io881+ihvFmPLJv/Y5Hwx+2JBiIFMCynKZLDgphQZEJzdRhg78ux
         e98UGLcbDlSR4ufmOhUdwJO9qIRTFYhKcAADCXg+v7pSwMJSoXAZErG+W9uqQETWN8kh
         9aCYvJJ2WmQPukPQpGbIuJhya2hEyn0SzIcHKIf68E1ndr6pBFXzT2hhq9XjjAjXjVRb
         9rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794085641; x=1794690441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ISWID7R3PJvGfbWlsLezGwB1NxsnTURFXD2bP305k0=;
        b=wdYMIljwBv2jM0z2M4ooCNUSPd/wmp4mWjhtyKvTswl1L5sFOL1itzt2HTR66K/wj5
         k/KrM7yNqevjz63UptyIK532mnQghOX+x2jykCUS3lszI5Y42VDAXCIzg0QETydPL47P
         x7aVjKlTKjgX8mHRAUQuPL5MBthaNZd+oDjxGf/RTNmUhCmP7DcDlZoPCNpZk60Eyst6
         3am7PrE93piKAviXwKM16jiAKBgpL7el4y2NaNjpSqLlQRF0kxlW5t8RYK1d49fT7UNG
         VOL7UYFKCkIbBn4GVrC58f0nBVfrra3OcSh4t8TfBBA6baPqYYwBGpNtvYgM3sL1Etdb
         lZgA==
X-Forwarded-Encrypted: i=1; AKwUvByNMrXfhHqqtzUTNMuSgp152GMje0rVR7bkGArxY4wOzoQ3DTXlWCnAvsroOZH+W+SjO9pXbPtFKHDD/rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z50WR07F2PE55WXeQv+EmhG/Oe710o5hrmegPDZZAesqIGTrG
	X8Z2OlWe83AMpXz/EE6X9F42xtpBK+piBfXr9hndlUIN6cl5BiuZ2aPm
X-Gm-Gg: AYBFou2X7beNZ6vu+gvKK2p5CZY94+2yrHZspcd7fDNMEhkAkrqD5iRlSymFiquNL0V
	u0pN/OpF+ShNy0Lce2VM3MnmFR1J/fMmfP97Kh9KFCRbqVBcoNWKjEIZJaMlY3d22BLzr96yQUc
	nT0CM4PWPoFcUhSAgwqNQ5nnYXhofj9oXiueEFPTb6tEfU5sY7MMIQgb1V+3CstStec/r4pzQXS
	53Vda7J0ajRs8Tf7ch3PzCst1QbT1DsurG2E0SlGsOAptfwRAUjn9MkQKY5Ws8oHAgM4+gasuwN
	cFGvrRoCQmFNxfKaYWP3cs2I6fiU9+qD76BL9lMxMQbDzz1yVfcQq6qmh9WLFP5kMSCaOYk3LN7
	Lh3UmNMfUr346Yx1YpxmhiP0Hs/xh0huQBWKE8dS1Ict4ibecJu/bXlm3svRkpjNaPmutPbHQYY
	iq84MQKrEs6DE/Y1NOAg5X7tLcyI4KpzLQ4Rn4ftWJJQlyrggvloZwqO8joo192YiIh+AF2kD+D
	TfVf7FCAiFGHir2NmBxVHXuO90vPn5ZsaR8926/xQeSEIM8iM/Gv0Xq4TEpZa5hvBYJi3OKfZLm
	/MJ0tpzVcaJ1H/dAsQ5FLcjUFCthgtg/OMQKMzo14U4GUR+gJQ==
X-Received: by 2002:a05:701b:4201:10b0:144:eb3f:563a with SMTP id a92af1059eb24-1b269b20199mr3989418c88.15.1794085640608;
        Sat, 07 Nov 2026 13:07:20 -0800 (PST)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm889625c88.14.2026.11.07.13.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:07:20 -0800 (PST)
From: John Macias <dencity7@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: dsa: clear the conduit RX queue on receive
Date: Sat,  7 Nov 2026 13:06:53 -0800
Message-ID: <20261107210653.2007194-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
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

A multi-queue conduit records its RX queue in skb->queue_mapping with
skb_record_rx_queue(), as stmmac, mtk_eth_soc, fec and dpaa2 do.
dsa_switch_rcv() passes the skb on with that index unchanged, although
it counts the conduit's queues, not those of skb->dev. A user port has
a single RX queue. For a packet from conduit queue 1 or above,
get_rps_cpu() finds the index past the port's real_num_rx_queues and
returns without steering, and its WARN_ONCE() stays silent because the
port has only one queue. So rps_cpus on a user port only takes effect
for packets from conduit queue 0.

Trunk-tagged frames go straight to a bond or team (tag_dsa), through
the netif_rx() branch for devices that are not user ports. That device
has its own RX queue count, so the conduit's index there selects the
RPS map of an unrelated rx-N queue, skips RPS, or, when the device has
more than one queue and an index at or above that count, triggers
the WARN_ONCE().

Clear the queue mapping once the tagger has chosen skb->dev, before
that branch, so both paths are covered.

This leaves no RX queue recorded, rather than recording queue 0. Both
make get_rps_cpu() use the first RX queue's map. They differ for code
that reads the recorded queue later:

- skb_tx_hash() picks the TX queue from a recorded RX queue when no
  socket mapping or XPS map decides. A flow forwarded from a DSA port
  to a multi-queue device now gets its TX queue from the flow hash
  instead of the conduit's RX queue number. Recording queue 0 would
  instead put every such flow on the first TX queue of its traffic
  class. The selected TX queue is also an input to several taggers:
  tag_brcm encodes it directly, while tag_ksz, tag_sja1105,
  tag_ocelot_8021q, tag_netc and tag_vsc73xx_8021q derive a traffic
  class or PCP from it. A different queue within the same traffic
  class need not change that encoded class.
- With CONFIG_SOCK_RX_QUEUE_MAPPING, packets received through DSA ports
  no longer update sk_rx_queue_mapping, so XPS by RX queue (xps_rxqs)
  stops following the conduit's queue number for those sockets. A
  mapping the socket already holds is left as it is.

Found on an IPQ8074 board (OpenWrt, Linux 6.18, conduit with four RX
rings): with rps_cpus set on the LAN and WAN user ports,
/proc/net/softnet_stat showed RPS only for traffic hashed to conduit
ring 0.

Claude and Codex assisted with diagnosing the queue-metadata issue,
preparing the change and its explanation, and checking source and test
results.

Fixes: 91da11f870f0 ("net: Distributed Switch Architecture protocol support")
Signed-off-by: John Macias <dencity7@gmail.com>
---
Changes in v3:
- No code changes. Resent with git send-email; the v2 posting was
  damaged in transit by the mail service (wrapped hunk header). Rebased
  onto net/main 30c71476d, where net/dsa/tag.c is unchanged.
v2: https://lore.kernel.org/all/CA+KzPspNN14ZEyxisGrOSpgfTqajJfZTXG_iHBRMYd2su1dRKQ@mail.gmail.com/

Changes in v2:
- Clear the queue mapping before the branch for devices that are not
  user ports, so trunk-tagged frames delivered to a bond or team are
  covered too (Sashiko review).
- Replace the claim that TX queue selection is unaffected. The changelog
  now describes the effect on skb_tx_hash(), taggers that consume the
  selected TX queue, and sk_rx_queue_mapping and
  xps_rxqs, and says why no queue is recorded instead of queue 0.
- Subject: "on user port receive" -> "on receive".
v1: https://lore.kernel.org/all/20261025072203.1519561-1-dencity7@gmail.com/

Claude assisted with diagnosis, the patch and runtime harness. Codex
independently reviewed the code, claims and raw results, and corrected
the test descriptions.

Testing on net/main (5d7f3375c), x86_64 under QEMU: a 4-queue virtio-net
conduit with dsa_loop, which for this test only was changed to use the
Marvell DSA tagger and to accept LAG offload (lan2 + lan3 in a
balance-xor bond with 2 RX queues). The host injects DSA-tagged UDP on
chosen conduit RX queues; rps_cpus on lan1 and on bond0 rx-0 points to
an otherwise idle CPU. 200 datagrams per queue and path. The RPS columns
say on which conduit queues the receiving socket saw the RPS CPU
(SO_INCOMING_CPU, which holds the socket's latest receive CPU, so this
is a per-socket observation rather than a per-packet one):

                       lan1 RPS     bond0 RPS    WARN_ONCE   eth1 TX
                       (q0-q3)      (q0-q3)                  per queue
  unpatched            q0 only      q0 only      yes         800/0/1/0
  v1                   all          q0 only      yes         201/100/150/350
  v2                   all          all          no          201/100/350/150
  skb_record_rx_queue  all          all          no          800/0/0/1
  (skb, 0) instead

(Queue 2's NAPI happened to run on the RPS CPU, so q2 does not tell the
cases apart; q1 and q3 do.) The last column is the eth1 TX packet delta
per queue while 16 UDP flows (800 datagrams), all from conduit RX
queue 0, were routed out a 4-queue virtio-net with XPS cleared; each
total is 801 because one other packet was also sent. The aggregate
counters are consistent with fallback TX selection favoring queue 0
when RX queue 0 is recorded, and flow-hash distribution
when none is recorded; the unclassified extra packet is not attributed
to a test flow. W=1 build of net/dsa is clean.

On the original hardware (Netgear RAX120 v1, IPQ8074, OpenWrt Linux
6.18, four-ring conduit), v1 was tested as described in v1. v2 has not
run there yet, and I have no switch with LAG offload to test the trunk
path on real hardware.

 net/dsa/tag.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/dsa/tag.c b/net/dsa/tag.c
index 6a5aa7fc3..e53dc3f3c 100644
--- a/net/dsa/tag.c
+++ b/net/dsa/tag.c
@@ -95,6 +95,13 @@ static int dsa_switch_rcv(struct sk_buff *skb, struct net_device *dev,
 	skb->pkt_type = PACKET_HOST;
 	skb->protocol = eth_type_trans(skb, skb->dev);
 
+	/* The RX queue the conduit recorded is an index into the conduit's
+	 * queues. It means nothing on skb->dev, a user port with a single RX
+	 * queue or a bond/team with its own queue count, and get_rps_cpu()
+	 * would check it against that device. Leave no queue recorded.
+	 */
+	skb_set_queue_mapping(skb, 0);
+
 	if (unlikely(!dsa_user_dev_check(skb->dev))) {
 		/* Packet is to be injected directly on an upper
 		 * device, e.g. a team/bond, so skip all DSA-port
-- 
2.47.3

